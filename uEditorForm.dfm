object EditorForm: TEditorForm
  Left = 0
  Top = 0
  Caption = 'EditorForm'
  ClientHeight = 643
  ClientWidth = 1049
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001001010000001000800680500001600000028000000100000002000
    0000010008000000000000000000000000000000000000000000000000008281
    7E0083828000848482008685830087868500888886008A8988008B8A89008D8C
    8B008C8C8C008E8D8C008F8F8D0091908F009292900093939200959493009696
    950097979600999898009A9A99009B9B9B009D9D9C009F9E9D009E9E9E00A09F
    9F00A1A1A000A1A1A100A2A2A200A3A3A300A4A4A300A5A5A500A6A6A600D5D5
    D500D6D6D600EAEAEA00EBEAEA00EBEBEB00F7F6F500F7F6F600F7F7F600F8F7
    F600F8F7F700F8F8F700F9F8F700F9F8F800F9F9F800FAF9F800FAF9F900FAFA
    F900FBFAFA00FBFBFA00FBFBFB00FCFBFB00FCFCFB00FCFCFC00FDFCFC00FDFD
    FC00FDFDFD000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000003A3A
    0C0B0A0807060504030201003A3A3A3A0D32323232323232323232013A3A3A3A
    0E34282826252525252532023A3A3A3A0F34282828282725252532033A3A3A3A
    1035292928282828252532043A3A3A3A11352B2B2B2A2828282632053A3A3A3A
    12362C2B2B2B2A29282833063A3A3A3A13372D2D2C2B2B2B292834073A3A3A3A
    14372E2E2E2D2C2B2A2834083A3A3A3A15372F2E2E2E2D2B2B2A340A3A3A3A3A
    1738302F2E2E2E2C2B2B340B3A3A3A3A183930302F2E2E2D2C2B340C3A3A3A3A
    1A393130302F2E2D1F09090D3A3A3A3A1B393231302F2E2E1F2220163A3A3A3A
    1D393939383737371F2119233A3A3A3A1E1D1B1A18171514131C243A3A3AC003
    0000C0030000C0030000C0030000C0030000C0030000C0030000C0030000C003
    0000C0030000C0030000C0030000C0030000C0030000C0030000C0070000}
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 99
    Top = 0
    Width = 4
    Height = 624
    AutoSnap = False
    ResizeStyle = rsUpdate
    OnMoved = Splitter1Moved
    ExplicitHeight = 596
  end
  object Splitter2: TSplitter
    Left = 788
    Top = 0
    Width = 4
    Height = 624
    AutoSnap = False
    ResizeStyle = rsUpdate
    OnMoved = Splitter1Moved
    ExplicitHeight = 596
  end
  object PaneHex: TEditorPane
    Left = 103
    Top = 0
    Width = 685
    Height = 624
    Align = alLeft
    BevelOuter = bvNone
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    PopupMenu = EditorPopupMenu
    TabOrder = 0
    TabStop = True
    OnEnter = PaneHexEnter
    OnMouseDown = PaneHexMouseDown
    OnMouseMove = PaneHexMouseMove
    OnMouseUp = PaneHexMouseUp
    Text = ''
    ShowCaret = True
    OnKeyDown = PaneHexKeyDown
    OnKeyPress = PaneHexKeyPress
    OnMouseWheel = PaneHexMouseWheel
  end
  object PaneLnNum: TEditorPane
    Left = 0
    Top = 0
    Width = 99
    Height = 624
    Align = alLeft
    BevelOuter = bvNone
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    Text = ''
    ShowCaret = False
    OnMouseWheel = PaneHexMouseWheel
  end
  object PaneText: TEditorPane
    Left = 792
    Top = 0
    Width = 240
    Height = 624
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    PopupMenu = EditorPopupMenu
    TabOrder = 2
    TabStop = True
    OnEnter = PaneHexEnter
    OnMouseDown = PaneHexMouseDown
    OnMouseMove = PaneHexMouseMove
    OnMouseUp = PaneHexMouseUp
    Text = ''
    ShowCaret = True
    OnKeyDown = PaneHexKeyDown
    OnKeyPress = PaneTextKeyPress
    OnMouseWheel = PaneHexMouseWheel
  end
  object VertScrollBar: TScrollBar
    Left = 1032
    Top = 0
    Width = 17
    Height = 624
    Align = alRight
    Kind = sbVertical
    Max = 0
    PageSize = 0
    TabOrder = 3
    OnChange = VertScrollBarChange
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 624
    Width = 1049
    Height = 19
    Panels = <
      item
        Text = 'Addr: ? (0x?)'
        Width = 200
      end
      item
        Text = 'Byte: ?'
        Width = 200
      end>
  end
  object EditorPopupMenu: TPopupMenu
    Left = 286
    Top = 72
    object PMICut: TMenuItem
      Action = MainForm.ActionCut
    end
    object PMICopy: TMenuItem
      Action = MainForm.ActionCopy
    end
    object PMIPaste: TMenuItem
      Action = MainForm.ActionPaste
    end
    object PMISelectAll: TMenuItem
      Action = MainForm.ActionSelectAll
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object PMIBitsEditor: TMenuItem
      Action = MainForm.ActionBitsEditor
    end
  end
end