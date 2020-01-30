unit uMainForm;

{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_PLATFORM OFF}
//{$WARN SYMBOL_DEPRECATED OFF}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Menus,
  System.Math, Generics.Collections, Clipbrd, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin, System.Types, System.ImageList,
  Vcl.ImgList, System.UITypes, Winapi.SHFolder, System.Rtti, Winapi.ShellAPI,
  Vcl.FileCtrl, KControls, KGrids, Vcl.Buttons, Vcl.Samples.Gauges,
  System.StrUtils,

  uUtil, uLargeStr, uEditorPane, uLogFile, superobject,
  uDWHexTypes, uDWHexDataSources, uEditorForm,
  uValueFrame, uStructFrame, uCRC, uCompareFrame, uScriptFrame, uCoDWHex,
  uBitmapFrame, uCallbackList, ColoredPanel;

const
  Color_ChangedByte = $B0FFFF;
  Color_SelectionBg = clHighlight;
  Color_SelectionTx = clHighlightText;
  Color_ValueHighlightBg = $FFD0A0;
  Color_DiffBg = $05CBEF;

//  MAX_TAB_WIDTH = 200;

type
  TDWHexSettings = class
  public type
    TRecentFileRec = record
      FileName: string;
    end;
  public
    ScrollWithWheel: Integer;
    ByteColumns: Integer;  // -1 - auto
    ActiveRightPage: Integer;
    RightPanelWidth: Integer;
    Script: record
      Text: string;
    end;
    RecentFiles: array of TRecentFileRec;
//    Colors: record
//      ValueHighlightBg: TColor;
//    end;
  end;

  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    ToolBar1: TToolBar;
    OpenDialog1: TOpenDialog;
    est1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ActionList1: TActionList;
    ActionNew: TAction;
    ActionOpen: TAction;
    ActionSave: TAction;
    ActionSaveAs: TAction;
    Regions1: TMenuItem;
    SaveDialog1: TSaveDialog;
    ActionCut: TAction;
    ActionCopy: TAction;
    ActionPaste: TAction;
    ActionCopyAs: TAction;
    MICut: TMenuItem;
    MICopy: TMenuItem;
    MICopyAs: TMenuItem;
    MIPaste: TMenuItem;
    ActionSelectAll: TAction;
    MISelectAll: TMenuItem;
    ActionGoToStart: TAction;
    ActionGoToEnd: TAction;
    ImageList16: TImageList;
    ActionRevert: TAction;
    Revert1: TMenuItem;
    N2: TMenuItem;
    ActionFind: TAction;
    MIFindReplace: TMenuItem;
    ActionFindNext: TAction;
    ActionFindPrev: TAction;
    FindNext1: TMenuItem;
    FindPrevious1: TMenuItem;
    ActionGoToAddr: TAction;
    GoToaddress1: TMenuItem;
    ActionSaveSelectionAs: TAction;
    Saveselectionas1: TMenuItem;
    MIRecentFilesMenu: TMenuItem;
    MIDummyRecentFile: TMenuItem;
    ActionExit: TAction;
    N3: TMenuItem;
    Exit1: TMenuItem;
    N4: TMenuItem;
    ActionOpenDisk: TAction;
    MIOpenDisk: TMenuItem;
    N5: TMenuItem;
    ActionOpenProcMemory: TAction;
    OpenProcessMemory1: TMenuItem;
    ActionBitsEditor: TAction;
    MDITabs: TTabControl;
    RecentFilesMenu: TPopupMenu;
    MIDummyRecentFile1: TMenuItem;
    RightPanel: TPanel;
    RightPanelPageControl: TPageControl;
    PgValue: TTabSheet;
    Splitter1: TSplitter;
    PgStruct: TTabSheet;
    ValueFrame: TValueFrame;
    StructFrame: TStructFrame;
    AfterEventTimer: TTimer;
    Tools1: TMenuItem;
    CRC321: TMenuItem;
    estchangespeed1: TMenuItem;
    MsgPanel: TPanel;
    Image1: TImage;
    MsgTextBox: TStaticText;
    ActionCompare: TAction;
    Compare1: TMenuItem;
    PgCompare: TTabSheet;
    CompareFrame: TCompareFrame;
    ToolButton4: TToolButton;
    EditByteCols: TComboBox;
    Timer1: TTimer;
    PgScript: TTabSheet;
    ScriptFrame: TScriptFrame;
    DbgToolsForm1: TMenuItem;
    ToolButton5: TToolButton;
    ActionUndo: TAction;
    ActionRedo: TAction;
    N1: TMenuItem;
    MIUndo: TMenuItem;
    MIRedo: TMenuItem;
    Undostack1: TMenuItem;
    CreateTestFile1: TMenuItem;
    PgBitmap: TTabSheet;
    BitmapFrame: TBitmapFrame;
    Something1: TMenuItem;
    N6: TMenuItem;
    Setfilesize1: TMenuItem;
    Insertbytes1: TMenuItem;
    HintImage: TImage;
    ActionSetFileSize: TAction;
    ActionFillBytes: TAction;
    procedure FormCreate(Sender: TObject);
    procedure ActionOpenExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActionSaveExecute(Sender: TObject);
    procedure Regions1Click(Sender: TObject);
    procedure ActionSaveAsExecute(Sender: TObject);
    procedure ActionNewExecute(Sender: TObject);
    procedure ActionCopyExecute(Sender: TObject);
    procedure ActionPasteExecute(Sender: TObject);
    procedure ActionSelectAllExecute(Sender: TObject);
    procedure ActionGoToStartExecute(Sender: TObject);
    procedure ActionGoToEndExecute(Sender: TObject);
    procedure ActionRevertExecute(Sender: TObject);
    procedure ActionFindExecute(Sender: TObject);
    procedure ActionFindNextExecute(Sender: TObject);
    procedure ActionFindPrevExecute(Sender: TObject);
    procedure ActionGoToAddrExecute(Sender: TObject);
    procedure ActionSaveSelectionAsExecute(Sender: TObject);
    procedure MIRecentFilesMenuClick(Sender: TObject);
    procedure MIDummyRecentFileClick(Sender: TObject);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionOpenDiskExecute(Sender: TObject);
    procedure ActionOpenProcMemoryExecute(Sender: TObject);
    procedure ActionBitsEditorExecute(Sender: TObject);
    procedure MDITabsChange(Sender: TObject);
    procedure MDITabsGetImageIndex(Sender: TObject; TabIndex: Integer;
      var ImageIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure MDITabsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RecentFilesMenuPopup(Sender: TObject);
    procedure AfterEventTimerTimer(Sender: TObject);
    procedure CRC321Click(Sender: TObject);
    procedure estchangespeed1Click(Sender: TObject);
    procedure ActionCompareExecute(Sender: TObject);
    procedure EditByteColsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditByteColsSelect(Sender: TObject);
    procedure RightPanelPageControlChange(Sender: TObject);
    procedure RightPanelResize(Sender: TObject);
    procedure DbgToolsForm1Click(Sender: TObject);
    procedure ActionUndoExecute(Sender: TObject);
    procedure ActionRedoExecute(Sender: TObject);
    procedure Undostack1Click(Sender: TObject);
    procedure CreateTestFile1Click(Sender: TObject);
    procedure Something1Click(Sender: TObject);
    procedure ActionSetFileSizeExecute(Sender: TObject);
    procedure ActionFillBytesExecute(Sender: TObject);
  private
    { Private declarations }
    FEditors: TObjectList<TEditorForm>;
    FInitialFilesOpened: Boolean;
    FDoAfterEvent: array of TProc;
    LastProgressRefresh: Cardinal;
    LastProgressText: string;
    OldOnActiveControlChange: TNotifyEvent;
    EditorActionShortcuts: TDictionary<TContainedAction, TShortCut>;
    procedure InitDefaultSettings();
    procedure LoadSettings();
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    function GetActiveEditor: TEditorForm;
    procedure SetActiveEditor(const Value: TEditorForm);
    function CreateNewEditor(): TEditorForm;
    function GetEditorCount: Integer;
    function GetEditor(Index: Integer): TEditorForm;
    procedure OpenInitialFiles();
    procedure GenerateRecentFilesMenu(Menu: TMenuItem);
    procedure ApplyByteColEdit();
    procedure UpdateByteColEdit();
    procedure ActiveControlChanged(Sender: TObject);
    procedure ShortCutsWhenEditorActive(const AActions: array of TContainedAction);
  public
    { Public declarations }
    SettingsFolder, SettingsFile: string;
    DWHexOle: TCoDWHex;
    OnVisibleRangeChanged: TCallbackListP1<TEditorForm>;
    OnSelectionChanged: TCallbackListP1<TEditorForm>;  // Called when either selection moves or data in selected range changes
    procedure OpenFile(DataSourceType: TDWHexDataSourceType; const AFileName: string);
    function CloseCurrentFile(AskSave: Boolean): TModalResult;
    procedure SaveSettings();
    procedure CheckEnabledActions();
    procedure UpdateMDITabs();
    procedure UpdateMsgPanel();
    procedure ActiveEditorChanged();
    procedure SelectionChanged();
    procedure VisibleRangeChanged();
    function GetIconIndex(DataSource: TDWHexDataSource): Integer;
    property ActiveEditor: TEditorForm read GetActiveEditor write SetActiveEditor;
    function GetActiveEditorNoEx: TEditorForm;
    property EditorCount: Integer read GetEditorCount;
    property Editors[Index: Integer]: TEditorForm read GetEditor;
    procedure AddEditor(AEditor: TEditorForm);
    procedure RemoveEditor(AEditor: TEditorForm);
    function GetEditorIndex(AEditor: TEditorForm): Integer;
    procedure DoAfterEvent(Proc: TProc);
    procedure ShowProgress(Sender: TObject; Pos, Total: TFilePointer; Text: string = '-');
    procedure OperationDone(Sender: TObject);
  end;

var
  MainForm: TMainForm;
  AppSettings: TDWHexSettings;

implementation

{$R *.dfm}

uses
  uFindReplaceForm, uDiskSelectForm, uProcessSelectForm, uBitsEditorForm,
  uDbgToolsForm, uEditedData, uProgressForm, uSetFileSizeForm, uFillBytesForm;

{ TMainForm }

procedure TMainForm.ActionBitsEditorExecute(Sender: TObject);
var
  Addr: TFilePointer;
  Buf: TBytes;
  x: Int64;
begin
  with ActiveEditor do
  begin
    Buf := GetSelectedOrAfterCaret(1, 4, Addr, True);

    BitsEditorForm.OkEnabled := (Length(Buf) > 0);

    x := 0;
    Move(Buf[0], x, Length(Buf));
    BitsEditorForm.Value := x;
    BitsEditorForm.ValueSize := Max(Length(Buf), 1);

    if BitsEditorForm.ShowModal() <> mrOk then Exit;

    if Length(Buf) > 0 then
    begin
      x := BitsEditorForm.Value;
      Move(x, Buf[0], Length(Buf));
      ChangeBytes(Addr, Buf);
    end;
  end;
end;

procedure TMainForm.ActionCompareExecute(Sender: TObject);
begin
  PgCompare.Show();
  CompareFrame.ShowCompareDialog();
end;

procedure TMainForm.ActionCopyExecute(Sender: TObject);
var
  Buf: TBytes;
  s: string;
begin
  with ActiveEditor do
  begin
    if SelLength > 100*MByte then
      if Application.MessageBox(PChar('Try to copy '+IntToStr(SelLength div MByte)+' megabytes to system clipboard?'), PChar('Copy'), MB_YESNO) <> IDYES then Exit;
    Buf := GetEditedData(SelStart, SelLength);
    if ActiveControl=PaneHex then
      s := Data2Hex(Buf, True)
    else
      s := MakeStr(Buf);
    Clipboard.AsText := s;

    if (Sender = ActionCut) and (InsertMode) then
      DeleteSelected();
  end;
end;

procedure TMainForm.ActionExitExecute(Sender: TObject);
begin
  Close();
end;

procedure TMainForm.ActionFillBytesExecute(Sender: TObject);
// Insert bytes / Fill selection
var
  Insert: Boolean;
  Addr: TFilePointer;
  Size: Integer;
  Data, Pattern: TBytes;
  Rnd1, Rnd2: Integer;
  i: Integer;
begin
  with ActiveEditor do
  begin
    FillBytesForm.FillEnabled := (SelLength > 0);

    if FillBytesForm.ShowModal() <> mrOk then Exit;

    Insert := (FillBytesForm.TabControl1.TabIndex = 0);
    if Insert then
    begin
      Addr := CaretPos;
      Size := StrToInt(FillBytesForm.EditCount.Text);
    end
    else
    begin
      Addr := SelStart;
      Size := SelLength;
    end;

    SetLength(Data, Size);
    if FillBytesForm.RBPattern.Checked then
    // Pattern
    begin
      Pattern := HexToData(FillBytesForm.EditPattern.Text);
      if Length(Pattern) = 0 then
        raise EInvalidUserInput.Create('Specify hex pattern');
      if Length(Pattern) = 1 then
        FillChar(Data[0], Size, Pattern[0])
      else
        for i:=0 to Size-1 do
          Data[i] := Pattern[i mod Length(Pattern)];
    end
    else
    if FillBytesForm.RBRandomBytes.Checked then
    // Random bytes
    begin
      Rnd1 := FillBytesForm.EditRandomMin.Value;
      Rnd2 := FillBytesForm.EditRandomMax.Value;
      for i:=0 to Size-1 do
        Data[i] := Rnd1 + Random(Rnd2 - Rnd1 + 1);
    end
    else Exit;

    UndoStack.BeginAction('', IfThen(Insert, 'Insert bytes', 'Fill selection'));
    try

      if Insert then
        EditedData.Insert(Addr, Size, @Data[0])
      else
        EditedData.Change(Addr, Size, @Data[0]);

    finally
      UndoStack.EndAction();
    end;
  end;
end;

procedure TMainForm.ActionFindExecute(Sender: TObject);
begin
  FindReplaceForm.Show();
end;

procedure TMainForm.ActionFindNextExecute(Sender: TObject);
begin
  if FindReplaceForm.Searcher.ParamsDefined() then
    FindReplaceForm.FindNext(1)
  else
    ActionFindExecute(Sender);
end;

procedure TMainForm.ActionFindPrevExecute(Sender: TObject);
begin
  if FindReplaceForm.Searcher.ParamsDefined() then
    FindReplaceForm.FindNext(-1)
  else
    ActionFindExecute(Sender);
end;

procedure TMainForm.ActionGoToAddrExecute(Sender: TObject);
var
  s: string;
  Pos: TFilePointer;
begin
  with ActiveEditor do
  begin
    s := IntToStr(CaretPos);
    if not InputQuery('Go to address', 'Go to address (use $ or 0x for hex value, + or - for relative jump):', s) then Exit;
    Pos := StrToInt64Relative(s, CaretPos);

    MoveCaret(Pos, []);
  end;
end;

procedure TMainForm.ActionGoToEndExecute(Sender: TObject);
begin
  with ActiveEditor do
  begin
    BeginUpdatePanes();
    try
      MoveCaret(GetFileSize(), KeyboardStateToShiftState());
      CaretInByte := 0;
    finally
      EndUpdatePanes();
    end;
  end;
end;

procedure TMainForm.ActionGoToStartExecute(Sender: TObject);
begin
  with ActiveEditor do
  begin
    BeginUpdatePanes();
    try
      MoveCaret(0, KeyboardStateToShiftState());
      CaretInByte := 0;
    finally
      EndUpdatePanes();
    end;
  end;
end;

procedure TMainForm.ActionNewExecute(Sender: TObject);
begin
  CreateNewEditor().OpenNewEmptyFile();
end;

procedure TMainForm.ActionOpenDiskExecute(Sender: TObject);
var
  s: string;
begin
  if DiskSelectForm.ShowModal() <> mrOk then Exit;
  s := DiskSelectForm.SelectedDrive;

  OpenFile(TDiskDataSource, s);
end;

procedure TMainForm.ActionOpenExecute(Sender: TObject);
var
  i: Integer;
begin
  if not OpenDialog1.Execute() then Exit;

  for i:=0 to OpenDialog1.Files.Count-1 do
    OpenFile(TFileDataSource, OpenDialog1.Files[i]);
end;

procedure TMainForm.ActionOpenProcMemoryExecute(Sender: TObject);
var
  s: string;
begin
  if ProcessSelectForm.ShowModal() <> mrOk then Exit;
  s := ProcessSelectForm.SelectedPID;

  OpenFile(TProcMemDataSource, s);
end;

procedure TMainForm.ActionPasteExecute(Sender: TObject);
var
  s: string;
  Buf: TBytes;
begin
  with ActiveEditor do
  begin
    s := Clipboard.AsText;
    if ActiveControl=PaneHex then
      Buf := HexToData(s)
    else
      Buf := Str2Bytes(AnsiString(s));
    if Length(Buf)=0 then Exit;

    BeginUpdatePanes();
    UndoStack.BeginAction('', 'Paste');
    try
      if InsertMode then
      begin
        ReplaceSelected(Length(Buf), @Buf[0]);
      end
      else
      begin
        ChangeBytes(CaretPos, Buf);
        MoveCaret(CaretPos + Length(Buf), []);
      end;
    finally
      UndoStack.EndAction();
      EndUpdatePanes();
    end;
  end;
end;

procedure TMainForm.ActionRedoExecute(Sender: TObject);
begin
  with ActiveEditor do
  begin
    BeginUpdatePanes();
    try
      UndoStack.Redo();
    finally
      EndUpdatePanes();
    end;
  end;
end;

procedure TMainForm.ActionRevertExecute(Sender: TObject);
begin
  with ActiveEditor do
  begin
    if Application.MessageBox('Revert unsaved changes?', 'Revert', MB_OKCANCEL) <> IDOK then Exit;
    NewFileOpened(False);
  end;
end;

procedure TMainForm.ActionSaveAsExecute(Sender: TObject);
var
  fn: string;
begin
  with ActiveEditor do
  begin
    fn := DataSource.Path;
    if DataSource.ClassType <> TFileDataSource then
      fn := MakeValidFileName(fn);
    SaveDialog1.FileName := fn;
    if not SaveDialog1.Execute() then Exit;
    SaveFile(TFileDataSource, SaveDialog1.FileName);
  end;
end;

procedure TMainForm.ActionSaveExecute(Sender: TObject);
begin
  with ActiveEditor do
  begin
    if DataSource.CanBeSaved() then
      SaveFile(TDWHexDataSourceType(DataSource.ClassType), DataSource.Path)
    else
      ActionSaveAsExecute(Sender);
  end;
end;

procedure TMainForm.ActionSaveSelectionAsExecute(Sender: TObject);
// Save selected part to another file.
// If same file is chosen, re-open it with new content
var
  SameFile: Boolean;
  Data: TBytes;
  fn: string;
begin
  with ActiveEditor do
  begin
    if SelLength > MaxInt then
      raise EInvalidUserInput.Create('This command is not supported for selection larger then 2 GBytes');

    fn := DataSource.Path;
    if DataSource.ClassType <> TFileDataSource then
      fn := MakeValidFileName(fn);
    fn := ChangeFileExt(fn, '_part'+ExtractFileExt(fn));

    SaveDialog1.FileName := fn;
    if not SaveDialog1.Execute() then Exit;
    fn := SaveDialog1.FileName;

    SameFile := SameFileName(fn, DataSource.Path);
    if SameFile then
      if Application.MessageBox('Current file will be overwritten and re-opened with new content', 'Replace file', MB_OKCANCEL) <> IDOK then Exit;

    Data := GetEditedData(SelStart, SelLength);

    if SameFile then CloseCurrentFile(False);

    SaveEntireFile(fn, Data);

    if SameFile then
      OpenFile(TDWHexDataSourceType(DataSource.ClassType), fn);
  end;
end;

procedure TMainForm.ActionSelectAllExecute(Sender: TObject);
begin
  with ActiveEditor do
  begin
    SetSelection(0, GetFileSize());
    UpdatePanes();
  end;
end;

procedure TMainForm.ActionSetFileSizeExecute(Sender: TObject);
var
  OldSize, NewSize: TFilePointer;
  Value: Byte;
  Buf: TBytes;
begin
  with ActiveEditor do
  begin
    OldSize := EditedData.GetSize();
    SetFileSizeForm.EditOldSize.Text := IntToStr(OldSize);
    SetFileSizeForm.EditNewSize.Text := IntToStr(OldSize);
    if SetFileSizeForm.ShowModal() <> mrOk then Exit;

    NewSize := StrToInt64Relative(SetFileSizeForm.EditNewSize.Text, OldSize);
    if NewSize < 0 then
      raise EInvalidUserInput.Create('Size can not be negative');
    if NewSize > OldSize + MaxInt then
      raise EInvalidUserInput.Create('Can not add more than 2 GBytes in one operation');
    Value := StrToInt(SetFileSizeForm.EditFillValue.Text);

    UndoStack.BeginAction('', 'Set file size');
    try
      if (NewSize = OldSize) then
      begin
        // Nothing changed
      end
      else
      if NewSize < OldSize then
      begin
        EditedData.Delete(NewSize, OldSize - NewSize);
      end
      else
      begin
        SetLength(Buf, NewSize - OldSize);
        FillChar(Buf[0], Length(Buf), Value);
        EditedData.Insert(OldSize, Length(Buf), @Buf[0]);
      end;
    finally
      UndoStack.EndAction();
    end;
  end;
end;

procedure TMainForm.ActionUndoExecute(Sender: TObject);
begin
  with ActiveEditor do
  begin
    BeginUpdatePanes();
    try
      UndoStack.Undo();
    finally
      EndUpdatePanes();
    end;
  end;
end;

procedure TMainForm.ActiveControlChanged(Sender: TObject);
begin
  if Assigned(OldOnActiveControlChange) then
    OldOnActiveControlChange(Sender);
  if Application.Terminated then Exit;
  CheckEnabledActions();
end;

procedure TMainForm.ActiveEditorChanged;
begin
  UpdateMDITabs();
  UpdateByteColEdit();
  VisibleRangeChanged();
  SelectionChanged();
  UpdateMsgPanel();
end;

procedure TMainForm.AddEditor(AEditor: TEditorForm);
begin
  FEditors.Add(AEditor);
//  UpdateMDITabs();
//  Tabs will be updated when editor changes caption
end;

procedure TMainForm.ApplyByteColEdit;
// Apply byte column count from edit field
var
  n: Integer;
begin
  n := StrToIntDef(EditByteCols.Text, -1);
  if n <> -1 then
    n := BoundValue(n, 1, 16384);
  AppSettings.ByteColumns := n;
  SaveSettings();
  with ActiveEditor do
    ByteColumnsSetting := n;
  DoAfterEvent(UpdateByteColEdit);
end;

procedure TMainForm.CheckEnabledActions;
// Enable/disable actions based on active window, selection etc.
var
  FocusInEditor: Boolean;
  S: string;
  AShortCut: TPair<TContainedAction, TShortCut>;
  i: Integer;
begin
  FocusInEditor := False;
  ActionCompare.Enabled := (EditorCount >= 2);

  try
    with ActiveEditor do
    begin
      FocusInEditor := (Screen.ActiveControl=PaneHex) or (Screen.ActiveControl=PaneText);

      ActionSave.Enabled := (DataSource <> nil) and (dspWritable in DataSource.GetProperties()) and ((HasUnsavedChanges) or (DataSource.Path=''));
      ActionRevert.Enabled := (HasUnsavedChanges);

      for i:=0 to ActionList1.ActionCount-1 do
        if (ActionList1.Actions[i].Category = 'Edit') or (ActionList1.Actions[i].Category = 'Navigation') then
          ActionList1.Actions[i].Enabled := True;

      ActionUndo.Enabled := UndoStack.CanUndo(S);
      ActionUndo.Caption := 'Undo ' + S;
      ActionRedo.Enabled := UndoStack.CanRedo(S);
      ActionRedo.Caption := 'Redo ' + S;

      ActionCopy.Enabled := (FocusInEditor) and (SelLength > 0);
      ActionCut.Enabled := (ActionCopy.Enabled) and (dspResizable in DataSource.GetProperties());
      ActionPaste.Enabled := FocusInEditor;

      ActionSelectAll.Enabled := FocusInEditor;

      ActionSetFileSize.Enabled := (DataSource <> nil) and (dspResizable in DataSource.GetProperties());
      ActionFillBytes.Enabled := (DataSource <> nil) and (dspWritable in DataSource.GetProperties());

      ActionBitsEditor.Enabled := (SelLength<=4);
    end;
  except
    on E: ENoActiveEditor do
    begin
      ActionSave.Enabled := False;
      ActionRevert.Enabled := False;

      for i:=0 to ActionList1.ActionCount-1 do
        if (ActionList1.Actions[i].Category = 'Edit') or (ActionList1.Actions[i].Category = 'Navigation') then
          ActionList1.Actions[i].Enabled := False;

      ActionUndo.Caption := 'Undo';
      ActionRedo.Caption := 'Redo';
    end;
  end;

  // Register/unregister action shortcuts
  for AShortCut in EditorActionShortcuts do
    if FocusInEditor then AShortCut.Key.ShortCut := AShortCut.Value
                     else AShortCut.Key.ShortCut := 0;
end;

function TMainForm.CloseCurrentFile(AskSave: Boolean): TModalResult;
begin
  with ActiveEditor do
  begin
    if (AskSave) then
    begin
      Result := AskSaveChanges();
      if Result = mrCancel then Exit;
    end;
    Result := mrNo;

    FreeAndNil(DataSource);
  end;
end;

procedure TMainForm.CRC321Click(Sender: TObject);
var
  AData: TBytes;
  crc: Cardinal;
  s: string;
begin
  with ActiveEditor do
  begin
    AData := GetEditedData(SelStart, SelLength);
  end;

  crc := CalcCRC32(@AData[0], Length(AData));

  s := IntToHex(crc, 8);
  InputQuery('CRC32', 'CRC32:', s);
end;

function TMainForm.CreateNewEditor: TEditorForm;
begin
  Result := TEditorForm.Create(Application);
  Result.ByteColumnsSetting := AppSettings.ByteColumns;
  Result.OnByteColsChanged.Add(procedure (Sender: TEditorForm)
    begin
      if Sender = GetActiveEditorNoEx() then UpdateByteColEdit();
    end);
  // Call ActiveEditorChanged when this editor has DataSource etc.
  DoAfterEvent(ActiveEditorChanged);
end;

procedure TMainForm.CreateTestFile1Click(Sender: TObject);
const
  BlockSize = 1*MByte;
var
  Size: Int64;
  i: Integer;
  Block: TBytes;
  s: string;
  fs: TFileStream;
  s1: AnsiString;
begin
  s := '1 GB';
  if not InputQuery('Create test file', 'Create test file of size:', s) then Exit;
  Size := Str2FileSize(s);

  fs := TFileStream.Create(ExePath + 'TestFile_'+s.Replace(' ','_')+'.dat', fmCreate);
  try
    SetLength(Block, BlockSize);
    for i:=0 to BlockSize div 4-1 do
      pCardinal(@Block[i*4])^ := Sqr(i);

    for i:=0 to Size div BlockSize-1 do
    begin
      s1 := Format('-------- Block %8d --------', [i]);
      Move(s1[Low(s1)], Block[0], Length(s1));
      fs.WriteBuffer(Block[0], BlockSize);
      ShowProgress(Sender, i+1, Size div BlockSize);
    end;

  finally
    OperationDone(Sender);
    fs.Free;
  end;

end;

procedure TMainForm.DbgToolsForm1Click(Sender: TObject);
begin
  DbgToolsForm.Show();
end;

procedure TMainForm.DoAfterEvent(Proc: TProc);
begin
  FDoAfterEvent := FDoAfterEvent + [TProc(Proc)];
  AfterEventTimer.Enabled := True;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  ws: string;
  i: Integer;
begin
  bWriteLogFile := True;
//  bThreadedLogWrite := False;
  AppSettings := TDWHexSettings.Create();

  // Get path to settings folder (AppData\DWHex)
  SetLength(ws, MAX_PATH);
  i:=SHGetFolderPath(0, CSIDL_LOCAL_APPDATA, 0, 0, @ws[Low(ws)]);
  if i=0 then  SettingsFolder := AddSlash(PChar(ws)) + 'DWHex\'
         else  SettingsFolder := ExePath + 'Settings\';
  SettingsFile := SettingsFolder + 'Settings.json';

  InitDefaultSettings();
  LoadSettings();

  // We will catch drag'n'dropped files
  DragAcceptFiles(Handle, True);

  FEditors := TObjectList<TEditorForm>.Create(False);
  RightPanelPageControl.ActivePageIndex := AppSettings.ActiveRightPage;
  if AppSettings.RightPanelWidth > 0 then
    RightPanel.Width := AppSettings.RightPanelWidth;

  OldOnActiveControlChange := Screen.OnActiveControlChange;
  Screen.OnActiveControlChange := ActiveControlChanged;

  // Remember actions whose shortcuts should only be active in main editors
  EditorActionShortcuts := TDictionary<TContainedAction, TShortCut>.Create();
  for i:=0 to ActionList1.ActionCount-1 do
    if (ActionList1.Actions[i].Category = 'Edit') or
       (ActionList1.Actions[i].Category = 'Navigation') then
      ShortCutsWhenEditorActive([ActionList1.Actions[i]]);
  ShortCutsWhenEditorActive([ActionSave, ActionSaveAs, ActionRevert]);

  FmtHint := tFmtHintWindow.Create(Self);

//  DWHexOle := TCoDWHex.Create();

  ScriptFrame.Init();
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  ScriptFrame.Uninit();

  SaveSettings();
  AppSettings.Free;
  EditorActionShortcuts.Free;
  FEditors.Free;

//  DWHexOle.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if not FInitialFilesOpened then
    OpenInitialFiles();
end;

procedure TMainForm.GenerateRecentFilesMenu(Menu: TMenuItem);
// Show menu items for "Recent files"
var
  i: Integer;
  mi: TMenuItem;
begin
  for i:=Menu.Count-1 downto 1 do
    Menu.Items[i].Free;

  for i:=0 to Length(AppSettings.RecentFiles)-1 do
  begin
    mi := TMenuItem.Create(Self);
    mi.Caption := AppSettings.RecentFiles[i].FileName;
    mi.OnClick := MIDummyRecentFileClick;
    Menu.Add(mi);
  end;
end;

function TMainForm.GetActiveEditor: TEditorForm;
begin
  Result := GetActiveEditorNoEx();
  if Result = nil then
    // Silently abort operation that requires active editor
    raise ENoActiveEditor.Create('No active editor');
end;

function TMainForm.GetActiveEditorNoEx: TEditorForm;
var
  Frm: TForm;
begin
  Frm := ActiveMDIChild;
  if (Frm <> nil) and (Frm is TEditorForm) then
    Result := TEditorForm(Frm)
  else
    Result := nil;
end;

function TMainForm.GetEditor(Index: Integer): TEditorForm;
begin
  Result := FEditors[Index];
end;

function TMainForm.GetEditorCount: Integer;
begin
  Result := FEditors.Count;
end;

function TMainForm.GetEditorIndex(AEditor: TEditorForm): Integer;
begin
  Result := FEditors.IndexOf(AEditor);
end;

function TMainForm.GetIconIndex(DataSource: TDWHexDataSource): Integer;
// Index in ImageList16 for given DataSource
var
  DSType: TDWHexDataSourceType;
begin
  DSType := TDWHexDataSourceType(DataSource.ClassType);
  if DSType = TDiskDataSource then  Result := 4
  else if DSType = TProcMemDataSource then  Result := 5
  else Result := 7;
end;

procedure TMainForm.InitDefaultSettings;
begin
  AppSettings.ScrollWithWheel := 3;
  AppSettings.ByteColumns := -1;

//  AppSettings.Colors.ValueHighlightBg := $FFD0A0;
end;

procedure TMainForm.LoadSettings;
var
  ctx: TSuperRttiContext;
  json: ISuperObject;
  Value: TValue;
begin
  if FileExists(SettingsFile) then
    json := TSuperObject.ParseFile(SettingsFile, False)
  else
    json := SO('');

  ctx := TSuperRttiContext.Create;
  Value := TValue.From<TDWHexSettings>(AppSettings);

  ctx.FromJson(TypeInfo(TDWHexSettings), json, Value);

  ctx.Free;
end;

procedure TMainForm.MDITabsChange(Sender: TObject);
var
  N: Integer;
begin
  N := MDITabs.TabIndex;
  Editors[N].BringToFront;
end;

procedure TMainForm.MDITabsGetImageIndex(Sender: TObject; TabIndex: Integer;
  var ImageIndex: Integer);
begin
  if (TabIndex >= EditorCount) or (Editors[TabIndex].DataSource = nil) then
  begin
    ImageIndex := 0;
    Exit;
  end;
  ImageIndex := GetIconIndex(Editors[TabIndex].DataSource);
end;

procedure TMainForm.MDITabsMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  n: Integer;
begin
  n := MDITabs.IndexOfTabAt(X, Y);
  if n >= 0 then
  begin
    case Button of
      mbMiddle:
        begin
          Editors[n].Close();
        end;
    end;
  end;
end;

procedure TMainForm.MIDummyRecentFileClick(Sender: TObject);
// Open file from "Recent files" menu
begin
  OpenFile(TFileDataSource, (Sender as TMenuItem).Caption);
end;

procedure TMainForm.MIRecentFilesMenuClick(Sender: TObject);
begin
  GenerateRecentFilesMenu(MIRecentFilesMenu);
end;

procedure TMainForm.OpenFile(DataSourceType: TDWHexDataSourceType; const AFileName: string);
var
  DS: TDWHexDataSource;
begin
  DS := DataSourceType.Create(AFileName);
  try
    DS.Open(fmOpenRead);
  except
    DS.Free;
    raise;
  end;
  with CreateNewEditor() do
  begin
    DataSource := DS;
    NewFileOpened(True);
  end;
end;

procedure TMainForm.OpenInitialFiles;
begin
  FInitialFilesOpened := True;
  if ParamCount()>0 then
    OpenFile(TFileDataSource, ParamStr(1))
  else
    ActionNewExecute(nil);
end;

procedure TMainForm.OperationDone(Sender: TObject);
// Hide progress window
begin
  ProgressForm.ProgressTextLabel.Caption := '';
  ProgressForm.Close();
  LastProgressRefresh := 0;
  LastProgressText := '';
end;

procedure TMainForm.RecentFilesMenuPopup(Sender: TObject);
begin
  GenerateRecentFilesMenu(RecentFilesMenu.Items);
end;

procedure TMainForm.Regions1Click(Sender: TObject);
var
  s: string;
begin
  s := ActiveEditor.EditedData.GetDebugDescr();
  Application.MessageBox(PChar(s),'');
end;

procedure TMainForm.RemoveEditor(AEditor: TEditorForm);
begin
  FEditors.Remove(AEditor);
  // Update tabs and interface when editor form will be destroyed
  DoAfterEvent(ActiveEditorChanged);
end;

procedure TMainForm.RightPanelPageControlChange(Sender: TObject);
var
  AFrame: IDWHexToolFrame;
begin
  AppSettings.ActiveRightPage := RightPanelPageControl.ActivePageIndex;
  if Supports(RightPanelPageControl.ActivePage.Controls[0], IDWHexToolFrame, AFrame) then
    AFrame.OnShown();
end;

procedure TMainForm.RightPanelResize(Sender: TObject);
begin
  AppSettings.RightPanelWidth := RightPanel.Width;
end;

procedure TMainForm.SaveSettings;
const
  BOM: array[0..1] of Byte = ($FF, $FE);
var
  ctx: TSuperRttiContext;
  fs: TFileStream;
begin
  System.SysUtils.ForceDirectories(SettingsFolder);
  fs := TFileStream.Create(SettingsFile, fmCreate);
  try
    fs.WriteBuffer(BOM, SizeOf(BOM));

    ctx := TSuperRttiContext.Create;
    ctx.AsJson<TDWHexSettings>(AppSettings).SaveTo(fs, True, False);
    ctx.Free;
  finally
    fs.Free;
  end;
end;

procedure TMainForm.SelectionChanged;
begin
  CheckEnabledActions();
  OnSelectionChanged.Call(GetActiveEditorNoEx());

  {}
//  ScriptFrame.MemoOutput.Text := ActiveEditor.EditedData.GetDebugDescr();
  {}
end;

procedure TMainForm.SetActiveEditor(const Value: TEditorForm);
begin
  if Value <> nil then
    Value.BringToFront();
end;

procedure TMainForm.ShortCutsWhenEditorActive(const AActions: array of TContainedAction);
// Passed Actions should have ShortCuts active only when focus is in main editor.
// Just setting Action.Enabled to False does not works, because even disabled
// actions make their shortcuts not work in other windows and controls
var
  i: Integer;
begin
  for i:=0 to Length(AActions)-1 do
  begin
    EditorActionShortcuts.AddOrSetValue(AActions[i], AActions[i].ShortCut);
  end;
end;

procedure TMainForm.ShowProgress(Sender: TObject; Pos, Total: TFilePointer; Text: string = '-');
// '-' => do not change text
begin
  if Text <> '-' then
    LastProgressText := Text;

  if LastProgressRefresh = 0 then LastProgressRefresh := GetTickCount();
  if (GetTickCount() - LastProgressRefresh < 100) then Exit;
  LastProgressRefresh := GetTickCount();

  ProgressForm.ProgressGauge.Progress := Round(Pos/Total*100);
  ProgressForm.ProgressTextLabel.Caption := LastProgressText;

  if not ProgressForm.Visible then
    ProgressForm.ShowLikeModal();

  ProgressForm.FOperationAborted := False;
  Application.ProcessMessages();
  if ProgressForm.FOperationAborted then Abort();
end;

procedure TMainForm.Something1Click(Sender: TObject);
var
  i: Integer;
begin
  StartTimeMeasure();
  for i:=0 to 999 do
    ActiveEditor;
  EndTimeMeasure('ActiveEditor', True);
end;

procedure TMainForm.EditByteColsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    ApplyByteColEdit();
end;

procedure TMainForm.EditByteColsSelect(Sender: TObject);
begin
  ApplyByteColEdit();
end;

procedure TMainForm.AfterEventTimerTimer(Sender: TObject);
var
  i: Integer;
  AProc: TProc;
begin
  AfterEventTimer.Enabled := False;

  for i:=0 to Length(FDoAfterEvent)-1 do
  begin
    AProc := FDoAfterEvent[0];
    Delete(FDoAfterEvent, 0, 1);
    AProc();
  end;
end;

procedure TMainForm.estchangespeed1Click(Sender: TObject);
const
  WriteCount = 100000;
var
  i: Integer;
  b: TBytes;
begin
  b := Str2Bytes(AnsiString('#SPEEDTEST'));

  with ActiveEditor do
  begin
    BeginUpdatePanes();
    try
      for i:=1 to WriteCount do
      begin
        StartTimeMeasure();
        ChangeBytes(Random(GetFileSize() - Length(b)), b);
        EndTimeMeasure('change', True, 'Timing');
        ShowProgress(Sender, i, WriteCount);
      end;
    finally
      EndUpdatePanes();
    end;
  end;
  OperationDone(Sender);
end;

procedure TMainForm.Undostack1Click(Sender: TObject);
var
  s: string;
  i: Integer;
begin
  s := '';
  with ActiveEditor.UndoStack do
    for i:=0 to Actions.Count-1 do
    begin
      if i = CurPointer then
        s := s + '<-- pointer' + #13#10;
      s := s + Actions[i].Code + ' ' + Actions[i].Caption+' ('+IntToStr(Actions[i].Changes.Count)+' changes) '+#13#10;
    end;
  Application.MessageBox(PChar(s),'');
end;

procedure TMainForm.UpdateByteColEdit;
var
  Editor: TEditorForm;
begin
  Editor := GetActiveEditorNoEx();
  if Editor <> nil then
  begin
    EditByteCols.Enabled := True;
    if Editor.ByteColumnsSetting <= 0 then
      EditByteCols.Text := 'Auto (' + IntToStr(Editor.ByteColumns) + ')'
    else
      EditByteCols.Text := IntToStr(Editor.ByteColumns);
  end
  else
    EditByteCols.Enabled := False;
end;

procedure TMainForm.UpdateMDITabs;
var
  i, Current: Integer;
  st: TStringList;
  s: string;
begin
  Current := -1;
  st := TStringList.Create();
  for i:=0 to EditorCount-1 do
  begin
//    s := MinimizeName(Editors[i].Caption, MDITabs.Canvas, MAX_TAB_WIDTH);
    s := ExtractFileName(Editors[i].Caption);
    if s = '' then s := Editors[i].Caption;
    st.Add(s);
    if Editors[i] = ActiveMDIChild then
      Current := i;
  end;

  MDITabs.Tabs.Assign(st);
  st.Free;

  MDITabs.TabIndex := Current;

  RedrawWindow(Handle, nil, 0, RDW_FRAME or RDW_INVALIDATE);
end;

procedure TMainForm.UpdateMsgPanel();
// Show warning for active editor if there is any
const
  WarnSize = 100*MByte;
var
  InplaceSaving, UseTempFile: Boolean;
  ShowMsg: Boolean;
  ASize: TFilePointer;
begin
  with ActiveEditor do
  begin
    ShowMsg := False;
    if (DataSource <> nil) then
    begin
      if ChooseSaveMethod(TDWHexDataSourceType(DataSource.ClassType), DataSource.Path, InplaceSaving, UseTempFile) then
      begin
        ASize := EditedData.GetSize();
        if ASize > WarnSize then
        begin
          if UseTempFile then
          begin
            ShowMsg := True;
            MsgTextBox.Caption := 'Saving your changes will require temporary file of ' + FileSize2Str(ASize);
          end;
        end;
      end
      else
      begin
        ShowMsg := True;
        MsgTextBox.Caption := 'Cannot save such changes to original source';
      end;
    end;
    MsgPanel.Visible := ShowMsg;
  end;
end;

procedure TMainForm.VisibleRangeChanged;
begin
  OnVisibleRangeChanged.Call(GetActiveEditorNoEx());
end;

procedure TMainForm.WMDropFiles(var Msg: TWMDropFiles);
var
  i:Integer;
  Catcher: TDropFileCatcher;
  s:string;
begin
  inherited;
  Catcher := TDropFileCatcher.Create(Msg.Drop);
  try
    for I := 0 to Catcher.FileCount-1 do
    begin
      s:=Catcher.Files[i];
      if FileExists(s) then OpenFile(TFileDataSource, s);
    end;
  finally
    Catcher.Free;
  end;
  Msg.Result := 0;
end;

end.
