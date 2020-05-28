{                          ---BEGIN LICENSE BLOCK---                           }
{                                                                              }
{ Hextor - Hexadecimal editor and binary data analyzing toolkit                }
{ Copyright (C) 2019-2020  Grigoriy Mylnikov (DigitalWolF) <info@hextor.net>   }
{ Hextor is a Freeware Source-Available software. See LICENSE.txt for details  }
{                                                                              }
{                           ---END LICENSE BLOCK---                            }

unit uEditorPane;

interface

uses
  Winapi.Windows, System.SysUtils, System.Classes, Vcl.Controls, Vcl.ExtCtrls,
  Vcl.Graphics, System.Types, Winapi.Messages, Math,

  uHextorTypes {, uLogFile};

type
  TEditorPane = class(TPanel)
  public type
    // Tags, Selected range, Diff range etc. displayed in editor panes
    TVisualTextRegion = record
      Range: TFileRange;
      TextColor, BgColor, FrameColor: TColor;
      FrameWidth: Integer;
    end;
    TVisualTextRegionArray = array of TVisualTextRegion;
  private
    { Private declarations }
    FCaretPos: TPoint;
    FShowCaret: Boolean;
    FHorzScrollPos: Integer;
    function GetText: string;
    procedure SetText(const Value: string);
    procedure SetCaretPos(const Value: TPoint);
    procedure SetShowCaret(const Value: Boolean);
    procedure SetHorzScrollPos(const Value: Integer);
  protected type
    TCharAttributes = record
      TxColor, BgColor: TColor;
      function Equals(const Other: TCharAttributes): Boolean;
    end;
    TCharAttributesArray = array of TCharAttributes;
  protected
    { Protected declarations }
    FLines: TStringList;
    TextLength: Integer;  // Updated internally during paint
    ScrBmp: TBitmap;
    SelStart, SelLength: Integer;
    FVisRegions: TVisualTextRegionArray;
    FUpdating: Integer;
    FNeedUpdate: Boolean;
    CharAttr: TCharAttributesArray;
    LineFirstChar: array of Integer;  // Index of first character of every line
//    BgColors, TxColors: array of TColor;
    procedure Paint; override;
    procedure InternalPaint();
    procedure DoEnter; override;
    procedure DoExit; override;
    procedure WMGetDlgCode(var Msg: TWMNoParams); message WM_GETDLGCODE;
    procedure CalcTextLength();
    procedure CalcCharAttributes();
    procedure OnLinesChange(Sender: TObject);
    function GetCharRect(Pos: TPoint): TRect;
  public
    { Public declarations }
    CharSize: TSize;
    InsertModeCaret: Boolean;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function CharHeight(): Integer;
    function CharWidth(): Integer;
    function GetCharAt(x, y: Integer; var Pos: TPoint; var Index: Integer): Boolean;
    procedure SetSelection(AStart, ALength: Integer);
    procedure SetVisRegions(const ARegions: TVisualTextRegionArray);
    procedure BeginUpdate();
    procedure EndUpdate();
  published
    { Published declarations }
    property Lines: TStringList read FLines;
    property Text: string read GetText write SetText;
    property CaretPos: TPoint read FCaretPos write SetCaretPos;
    property ShowCaret: Boolean read FShowCaret write SetShowCaret;
    property HorzScrollPos: Integer read FHorzScrollPos write SetHorzScrollPos;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseWheel;
    property OnMouseWheelUp;
    property OnMouseWheelDown;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('DWF', [TEditorPane]);
end;

{ TEditorPane }

procedure TEditorPane.BeginUpdate;
begin
  Inc(FUpdating);
end;

constructor TEditorPane.Create(AOwner: TComponent);
begin
  inherited;
  FLines := TStringList.Create();
  FLines.OnChange := OnLinesChange;
  ScrBmp := TBitmap.Create();
  Color := clWindow;
  BevelOuter := bvNone;
  Font.Name := 'Consolas';//'Fixedsys';//'Courier New';
  CharSize.cx := Font.Height div 2;
  CharSize.cy := Font.Height;
end;

destructor TEditorPane.Destroy;
begin
  FLines.Free;
  ScrBmp.Free;
  inherited;
end;

procedure TEditorPane.DoEnter;
begin
  inherited;
  Paint();
end;

procedure TEditorPane.DoExit;
begin
  inherited;
  Paint();
end;

procedure TEditorPane.EndUpdate;
begin
  if FUpdating = 0 then Exit;
  Dec(FUpdating);
  if (FUpdating = 0) and (FNeedUpdate) then
  begin
    Paint();
  end;
end;

function TEditorPane.GetCharAt(x, y: Integer; var Pos: TPoint; var Index: Integer): Boolean;
begin
  Result := True;
  Pos.X := 0;
  Pos.Y := 0;
  Index := 0;
  if (Lines.Count = 0) then
    Exit;
  Pos.X := x div CharSize.cx + HorzScrollPos;
  Pos.Y := y div CharSize.cy;
//  Result := (Pos.Y>=0) and (Pos.Y<Lines.Count) and (Pos.X>=0) and (Pos.X<Length(Lines[Pos.Y]));
//  // After last char
//  if (Pos.Y=Lines.Count-1) and (Pos.X=Length(Lines[Pos.Y])) then Result := True;
  Pos.Y := BoundValue(Pos.Y, 0, Lines.Count-1);
  Pos.X := BoundValue(Pos.X, 0, Length(Lines[Pos.Y]));
  if Pos.Y < Length(LineFirstChar) then
    Index := LineFirstChar[Pos.Y] + Pos.X;
end;

function TEditorPane.GetCharRect(Pos: TPoint): TRect;
// Line and column index to screen coords
begin
  Result.Left := (Pos.X - HorzScrollPos) * CharSize.cx + 1;
  Result.Top := Pos.Y * CharSize.cy;
  Result.Width := CharSize.cx;
  Result.Height := CharSize.cy;
end;

function TEditorPane.GetText: string;
begin
  Result := FLines.Text;
end;

procedure TEditorPane.InternalPaint;
const
  UndefAttr: TCharAttributes = (TxColor: clNone; BgColor: clNone);
var
  i, j, j1, CharIndex, FirstCharInLine: Integer;
  CurAttr, PrevAttr: TCharAttributes;
  FirstVis, LastVis: Integer;  // First and last visible chars of line, 0-based
  R: TRect;
  s, s1: string;
  DefaultAttr: TCharAttributes;
  CharPos: array of TPoint;  // Line and column of every char

  procedure DrawRegionOutline(const Region: TVisualTextRegion);
  // Draw contour around tagged range of text
  // TODO: Draw zero-length regions to support zero-length bookmarks?
  var
    n1, n2: Integer;        // Char index
    p1, p2: TPoint;    // Char row and column
    r1, r2, r3, r4: TRect;  // Char rectangles
  begin
    if Length(CharPos) = 0 then Exit;

    // Coordinates of first and last char of region
    n1 := Max(Region.Range.Start, 0);
    n2 := Min(Region.Range.AEnd-1, High(CharPos));
    if (n2 < n1) or (n1 < Low(CharPos)) or (n2 > High(CharPos)) then Exit;
    p1 := CharPos[n1];
    p2 := CharPos[n2];
    r1 := GetCharRect(p1);
    r4 := GetCharRect(p2);
    { r1..r4 rectangles location:
        ...1xxx2
        xxxxxxxx
        3xxx4...
    }
    ScrBmp.Canvas.Pen.Style := psSolid;
    ScrBmp.Canvas.Pen.Mode := pmCopy;
    ScrBmp.Canvas.Pen.Color := Region.FrameColor;
    ScrBmp.Canvas.Pen.Width := Region.FrameWidth;
    ScrBmp.Canvas.Brush.Style := bsClear;

    if p1.y = p2.y then
    // Single rectangle
    begin
      ScrBmp.Canvas.Rectangle(r1.Left, r1.Top, r4.Right, r4.Bottom);
    end
    else
    if (p2.y = p1.y + 1) and (p2.x < p1.x) then
    // Two separate rectangles
    begin
      r2 := GetCharRect(Point(Length(Lines[p1.Y])-1, p1.Y));
      r3 := GetCharRect(Point(0, p2.Y));
      ScrBmp.Canvas.Rectangle(r1.Left, r1.Top, r2.Right, r2.Bottom);
      ScrBmp.Canvas.Rectangle(r3.Left, r3.Top, r4.Right, r4.Bottom);
    end
    else
    // Joint shape
    begin
      r2 := GetCharRect(Point(Length(Lines[p1.Y])-1, p1.Y));
      r3 := GetCharRect(Point(0, p2.Y));
      ScrBmp.Canvas.Polygon([
        Point(r1.Left, r1.Top),
        Point(r2.Right-1, r2.Top),
        Point(r2.Right-1, r4.Top-1),
        Point(r4.Right-1, r4.Top-1),
        Point(r4.Right-1, r4.Bottom-1),
        Point(r3.Left, r3.Bottom-1),
        Point(r3.Left, r1.Bottom),
        Point(r1.Left, r1.Bottom)
      ]);
    end;
  end;

begin
  ScrBmp.Canvas.Brush.Color := Self.Color;
  ScrBmp.Canvas.Font := Self.Font;
  ScrBmp.Canvas.FillRect(ClientRect);
  CalcTextLength();
  CharSize := ScrBmp.Canvas.TextExtent('O');
  DefaultAttr.TxColor := Self.Font.Color;
  DefaultAttr.BgColor := Self.Color;
  SetLength(LineFirstChar, Lines.Count);
  SetLength(CharPos, TextLength);
  FirstCharInLine := 0;
  // Draw text
  for i:=0 to Lines.Count-1 do
  begin
    LineFirstChar[i] := FirstCharInLine;
    s := Lines[i];
    FirstVis := HorzScrollPos;
    LastVis := Min(Length(s)-1, ClientWidth div CharSize.cx + HorzScrollPos);
    for j:=0 to Length(s)-1 do
      CharPos[FirstCharInLine + j] := Point(j, i);
    PrevAttr := UndefAttr;
    j1 := FirstVis;
    // Iterate visible chars of line (subject to horizontal scroll)
    for j:=FirstVis to LastVis+1 do
    begin
      CharIndex := FirstCharInLine + j;
      if j<=LastVis then
      begin
        if CharIndex < Length(CharAttr) then
          CurAttr := CharAttr[CharIndex]
        else
          CurAttr := DefaultAttr;
      end
      else
      begin
        CurAttr := UndefAttr;
      end;
      // When color changes, draw accumulated chars
      if not CurAttr.Equals(PrevAttr) then
      begin
        if j>j1 then
        begin
          s1 := Copy(s, j1+1, j-j1);
          ScrBmp.Canvas.Brush.Color := PrevAttr.BgColor;
          ScrBmp.Canvas.Font.Color := PrevAttr.TxColor;
          R := GetCharRect(Point(j1, i));
          ScrBmp.Canvas.TextOut(R.Left, R.Top, s1);
        end;
        PrevAttr := CurAttr;
        j1 := j;
      end;
      if j > LastVis then Break;
    end;
    Inc(FirstCharInLine, Length(s));
  end;

  // Draw region outlines
  for i:=0 to Length(FVisRegions)-1 do
    if (FVisRegions[i].FrameColor <> clNone) and
       (FVisRegions[i].Range.Intersects(0, TextLength)) then
    begin
      DrawRegionOutline(FVisRegions[i]);
    end;

  // Draw caret
  if (FShowCaret) and (CaretPos.Y >= 0) and (CaretPos.Y < Lines.Count) then
  with ScrBmp.Canvas do
  begin
    R := Rect(CharSize.cx * (CaretPos.X-HorzScrollPos) + 1, CharSize.cy * CaretPos.Y,
              CharSize.cx * (CaretPos.X-HorzScrollPos+1) + 1, CharSize.cy * (CaretPos.Y+1));
    if Focused then
    begin
      Pen.Color := clBlack;
      Brush.Color := clBlack;
    end
    else
    begin
      Pen.Color := clGray;
      Brush.Color := clGray;
    end;
    if InsertModeCaret then
    begin
      MoveTo(R.Left, R.Top);
      LineTo(R.Left, R.Bottom);
      MoveTo(R.Left-1, R.Top);
      LineTo(R.Left-1, R.Bottom);
    end
    else
    begin
      Pen.Mode := pmMergePenNot;
      Rectangle(R);
    end;
    Pen.Mode := pmCopy;
  end;

  {
  ScrBmp.Canvas.Pen.Color := clGray;
  ScrBmp.Canvas.Brush.Color := clGray;
  for i:=0 to Ord(High(TPenMode)) do
  begin
    R := Rect(i*CharSize.cx, 0, (i+1)*CharSize.cx, CharSize.cy);
    ScrBmp.Canvas.Pen.Mode := TPenMode(i);
    ScrBmp.Canvas.Rectangle(R);
  end;
  ScrBmp.Canvas.Pen.Color := clBlack;
  ScrBmp.Canvas.Brush.Color := clBlack;
  for i:=0 to Ord(High(TPenMode)) do
  begin
    R := Rect(i*CharSize.cx, CharSize.cy, (i+1)*CharSize.cx, 2*CharSize.cy);
    ScrBmp.Canvas.Pen.Mode := TPenMode(i);
    ScrBmp.Canvas.Rectangle(R);
  end;
  {}
end;

procedure TEditorPane.OnLinesChange(Sender: TObject);
begin
  Paint();
end;

procedure TEditorPane.Paint;
begin
//  inherited Paint;
  if FUpdating>0 then
  begin
    FNeedUpdate := True;
    Exit;
  end;
  FNeedUpdate := False;
  if (ScrBmp.Width<>Width) or (ScrBmp.Height<>Height) then
    ScrBmp.SetSize(Width, Height);
  InternalPaint();
  Canvas.Draw(0, 0, ScrBmp);
  PaintControls(Canvas.Handle, nil);
end;

procedure TEditorPane.SetCaretPos(const Value: TPoint);
begin
  FCaretPos := Value;
  Paint();
end;

procedure TEditorPane.SetHorzScrollPos(const Value: Integer);
begin
  if FHorzScrollPos <> Value then
  begin
    FHorzScrollPos := Value;
    Paint();
  end;
end;

procedure TEditorPane.SetSelection(AStart, ALength: Integer);
begin
  SelStart := AStart;
  SelLength := ALength;
  Paint();
end;

procedure TEditorPane.SetShowCaret(const Value: Boolean);
begin
  if Value <> FShowCaret then
  begin
    FShowCaret := Value;
    Paint();
  end;
end;

procedure TEditorPane.SetText(const Value: string);
begin
  FLines.Text := Value;
  Paint();
end;

procedure TEditorPane.SetVisRegions(const ARegions: TVisualTextRegionArray);
begin
  FVisRegions := ARegions;
  CalcCharAttributes();
  Paint();
end;

procedure TEditorPane.CalcCharAttributes;
// Calculate font and bg color for each character using VisRanges
var
  i, j, n1, n2: Integer;
  DefBgColor, DefTxColor: TColor;
begin
  CalcTextLength();
  SetLength(CharAttr, TextLength);

  // Default colors
  DefBgColor := Color;
  DefTxColor := Font.Color;
  for i:=0 to TextLength-1 do
  begin
    CharAttr[i].TxColor := DefTxColor;
    CharAttr[i].BgColor := DefBgColor;
  end;

  // Fill char attributes with colors from ranges
  for i:=0 to Length(FVisRegions)-1 do
  begin
    n1 := Max(FVisRegions[i].Range.Start, 0);
    n2 := Min(FVisRegions[i].Range.AEnd, TextLength);
    if n2 <= n1 then Continue;

    for j:=n1 to n2-1 do
    begin
      if FVisRegions[i].TextColor <> clNone then
        CharAttr[j].TxColor := FVisRegions[i].TextColor;
      if FVisRegions[i].BgColor <> clNone then
        CharAttr[j].BgColor := FVisRegions[i].BgColor;
    end;
  end;
end;

procedure TEditorPane.CalcTextLength();
// Re-calculate total char count
var
  i: Integer;
begin
  TextLength := 0;
  for i:=0 to FLines.Count-1 do
    Inc(TextLength, Length(FLines[i]));
end;

function TEditorPane.CharHeight: Integer;
begin
  if CharSize.cy>0 then
    Result := CharSize.cy
  else
    Result := ScrBmp.Canvas.TextHeight('O');
end;

function TEditorPane.CharWidth: Integer;
begin
  if CharSize.cx>0 then
    Result := CharSize.cx
  else
    Result := ScrBmp.Canvas.TextWidth('O');
end;

procedure TEditorPane.WMGetDlgCode(var Msg: TWMNoParams);
begin
  Msg.Result := DLGC_WANTARROWS or DLGC_WANTCHARS or DLGC_WANTTAB;
end;

{ TEditorPane.TCharAttributes }

function TEditorPane.TCharAttributes.Equals(
  const Other: TCharAttributes): Boolean;
begin
  Result := (TxColor = Other.TxColor) and (BgColor = Other.BgColor);
end;

end.