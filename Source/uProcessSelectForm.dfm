object ProcessSelectForm: TProcessSelectForm
  Left = 0
  Top = 0
  Caption = 'Select process'
  ClientHeight = 432
  ClientWidth = 458
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 470
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    458
    432)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 54
    Top = 15
    Width = 28
    Height = 13
    Caption = 'Filter:'
  end
  object BtnClearFilter: TSpeedButton
    Left = 217
    Top = 12
    Width = 21
    Height = 21
    Hint = 'Clear filter'
    Flat = True
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000130B0000130B00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      BFDDE02D595E52A1A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52A1A92D595EBFDD
      E0FFFFFFFFFFFFFFFFFFFFFFFFBFDDE02D595E2D595E2D595E52A1A9FFFFFFFF
      FFFFFFFFFF52A1A92D595E2D595E2D595EBFDDE0FFFFFFFFFFFFFFFFFF8DC2C8
      2D595E4282894282892D595E52A1A98DC2C852A1A92D595E4282894282892D59
      5E8DC2C8FFFFFFFFFFFFFFFFFFFFFFFF52A1A92D595E4282894282892D595E2D
      595E2D595E4282894282892D595E52A1A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF52A1A92D595E4282894282894282894282894282892D595E52A1A9FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2D595E42828942828942
      82894282894282892D595EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF2D595E42828942828952A1A94282894282892D595EFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF52A1A92D595E52A1A952A1A952
      A1A952A1A952A1A92D595E52A1A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      72B4BB45878E71B3BA71B3BA52A1A945878E52A1A971B3BA71B3BA45878E72B4
      BBFFFFFFFFFFFFFFFFFFFFFFFF8DC2C845878E71B3BA71B3BA45878E52A1A98D
      C2C852A1A945878E71B3BA71B3BA45878E8DC2C8FFFFFFFFFFFFFFFFFFBFDDE0
      45878E52A1A945878E72B4BBFFFFFFFFFFFFFFFFFF72B4BB45878E52A1A94587
      8EBFDDE0FFFFFFFFFFFFFFFFFFFFFFFFBFDDE045878E72B4BBFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF72B4BB45878EBFDDE0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    ParentShowHint = False
    ShowHint = True
    OnClick = BtnClearFilterClick
  end
  object BtnRefreshList: TSpeedButton
    Left = 8
    Top = 8
    Width = 30
    Height = 30
    Hint = 'Refresh process list'
    Glyph.Data = {
      42090000424D4209000000000000420000002800000018000000180000000100
      20000300000000090000130B0000130B00000000000000000000000000FF0000
      FF0000FF0000FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFBBC6BCFFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FF809486FF0D8F32FF969E98FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FF4B855DFF54FA71FF71FC8EFF969E98FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFC7C8C7FF2B
      8746FF7EFC98FF8CFEADFF7AFC95FF969E98FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF9EA8A1FF28AC48FF92
      FDACFF55FD82FF63FD8DFF81FC98FF5E8067FF9AA19CFFBFC1BFFFECECECFFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFECECECFF698672FF47EF64FF95FDAFFF2B
      FD60FF2CFD62FF45FD75FF9DFDB5FF5EFB7EFF6EFB8AFF51FA6EFF24A644FF61
      8D70FFCECFCEFFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF3C8151FF80FB94FF88FDA5FF15EF4EFF15
      EF4EFF17F050FF1CF755FF25FD5BFF2EFD64FF3AFD6BFF50FD7EFF82FEA3FF89
      FCA0FF2ABE4CFF809486FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF8B9B90FF34CA53FFAAFDBDFF2DFD61FF15
      EF4EFF15EF4EFF15EF4EFF81FD9EFF60FC82FF82FD9FFF91FEAEFF6AFD91FF44
      FD74FF83FEA4FF54FA71FF698672FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFB8BBB9FF289845FFA6FCB6FF55
      FD80FF15EF4EFF15EF4EFF98FCA8FF47845AFF568966FF338A4CFF39D958FF85
      FC9AFF92FDADFF75FD9AFF48F366FFA1ABA4FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFD9D9D9FF3E8552FF83
      FB96FF91FDACFF18F150FF9BFCABFF969E98FFF0F0F0FFF0F0F0FFD5D5D5FF7C
      9182FF229D44FF8AFCA0FF9CFDB4FF30884AFFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF6D
      8875FF49EF65FFBBFECBFF9BFCABFF969E98FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FF47845AFF78FB8EFF37D053FFD6DED9FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF658E72FF839589FFF0
      F0F0FFA1ABA4FF28AA48FF6EFA84FF969E98FFF0F0F0FFF0F0F0FF1E7D3BFF78
      8F7FFFECECECFFF0F0F0FF00AB27FF03AD27FFC1C7C3FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF5A8B69FF1F9E41FFBC
      C0BDFFF0F0F0FFC7C8C7FF257F41FF969E98FFF0F0F0FFF0F0F0FF2D974AFF5E
      FB7CFF438357FFF0F0F0FFF0F0F0FF167C36FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFF618D70FF98FCABFF25
      A745FFA5ADA7FFF0F0F0FFE8E8E8FFE8E8E8FFF0F0F0FFF0F0F0FF309D4CFFAD
      FEC3FF8CFCA3FF268B44FFC3C5C3FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFEEEEEEFFF0F0F0FFF0F0F0FFF0F0F0FFA0A6A2FF61FA7BFF90
      FDABFF4DF868FF438357FFADB1AEFFECECECFFF0F0F0FFF0F0F0FF309D4CFF77
      FD9AFF39FD69FF9DFDB3FF2BB74BFF96A29AFFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF308448FF98
      FDAEFF73FD96FF9CFDB1FF61FA7BFF29A748FF47845AFF658E72FF25A245FF7A
      FD9CFF15EF4EFF1EF755FF8DFDA9FF4CFA6AFF5E8067FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF26
      9443FF9FFDB2FF5FFD89FF56FD82FF88FEA7FF90FDACFF73FC92FF6AFC8BFF4C
      FD78FF15EF4EFF15EF4EFF15EF4EFF67FD8DFF7CFB93FF31814BFFD6D7D6FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FF308448FF6EFB85FFA3FDB9FF73FD99FF46FD76FF39FD6BFF2EFD64FF25
      FD5BFF1CF753FF17F04FFF15EF4EFF35FD66FFACFDBEFF26AF47FFB5C3B7FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FF809486FF34854CFF00AB27FF75FB8DFF76FB90FF82FC9BFF93
      FEB0FF35FD69FF2CFD61FF58FD82FF9CFCAEFF278C44FFC0C2C0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFA9AEAAFF969E98FF2BA447FFC0
      FED1FF52FD81FF8BFDAAFF74FB8BFF438357FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF34A050FFCD
      FEDBFFB1FEC5FF41E35EFF788F7FFFECECECFFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF34A050FFCD
      FDD4FF29A647FFA9B1ABFFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FF23863FFF30
      8649FFCFCFCFFFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFA6C0A9FFF0
      F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0F0F0FFF0
      F0F0FFF0F0F0}
    ParentShowHint = False
    ShowHint = True
    OnClick = BtnRefreshListClick
  end
  object Label2: TLabel
    Left = 16
    Top = 392
    Width = 221
    Height = 13
    Caption = 'Warning: this feature is incomplete and buggy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ListView1: TListView
    Left = 8
    Top = 47
    Width = 442
    Height = 329
    Anchors = [akLeft, akTop, akRight, akBottom]
    Columns = <
      item
        Caption = 'Name'
        Width = 150
      end
      item
        Caption = 'Process ID'
        Width = 70
      end
      item
        Caption = 'Command line'
        Width = 500
      end>
    ColumnClick = False
    DoubleBuffered = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    SortType = stText
    TabOrder = 0
    ViewStyle = vsReport
    OnChange = ListView1Change
    OnDblClick = ListView1DblClick
  end
  object BtnOpen: TButton
    Left = 263
    Top = 391
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Open'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object BtnCancel: TButton
    Left = 367
    Top = 391
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object EditFilter: TComboBox
    Left = 88
    Top = 12
    Width = 129
    Height = 21
    TabOrder = 3
    OnChange = EditFilterChange
  end
  object Panel1: TPanel
    Left = 262
    Top = 8
    Width = 177
    Height = 33
    Anchors = [akTop, akRight]
    BevelOuter = bvLowered
    TabOrder = 4
    object Image1: TImage
      AlignWithMargins = True
      Left = 133
      Top = 1
      Width = 33
      Height = 31
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alRight
      Center = True
      Picture.Data = {
        07544269746D6170F6060000424DF60600000000000036000000280000001800
        0000180000000100180000000000C0060000120B0000120B0000000000000000
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA8A8FF9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8FF9E9EFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACAFF6969FF4444FF3636FF3A3A
        FF4545FF7171FFCACAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADAFF5454FF5252FF9797FF
        CCCCFFA0A0FF9494FFCCCCFF9595FF2828FF4D4DFFE7E7FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCECEFF5454FF97
        97FFF6F6FFFFFFFFFFFFFFA8A8FF9E9EFFFFFFFFFFFFFFF9F9FF9292FF4A4AFF
        BDBDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE9E9
        FF1515FFBDBDFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8FF9E9EFFFFFFFFFFFFFFFF
        FFFFFFFFFFC1C1FF4242FFECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFBFBFF6262FF9797FFFEFEFFFFFFFFFFFFFFC8C8FF6E6EFF4A4AFF4848
        FF6D6DFFC3C3FFFFFFFFFFFFFFFFFFFF9090FF4C4CFFFDFDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFCFCFFF4141FFFFFFFFFFFFFFFFFFFF8D8DFF2E2EFF
        A9A9FF9A9AFF9191FFA7A7FF4242FF8C8CFFFFFFFFFFFFFFFBFBFF2D2DFFCCCC
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7E7EFF9393FFFFFFFFFFFFFFC3
        C3FF4646FFF2F2FFFFFFFFA8A8FF9E9EFFFFFFFFF1F1FF3333FFC7C7FFFFFFFF
        FFFFFF9292FF7777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF5A5AFFCDCD
        FFFFFFFFFFFFFF6C6CFFA5A5FFFFFFFFFFFFFFA8A8FF9E9EFFFFFFFFFFFFFFAA
        AAFF6D6DFFFFFFFFFFFFFFCDCDFF4C4CFFFFFFFFFFFFFFFFFFFFFFFFFF9797FF
        9191FF4747FF8989FF9191FF9191FF4747FF8686FF9191FF9191FF6E6EFF6A6A
        FF9191FF9191FF8686FF4949FF9191FF9191FF8888FF4040FF9191FF9191FFF9
        F9FFFFFFFFBABAFFB5B5FF4646FFABABFFB5B5FFB5B5FF4949FFA5A5FFB5B5FF
        B5B5FF8181FF7B7BFFB5B5FFB5B5FFA6A6FF4848FFB5B5FFB5B5FFACACFF3939
        FFB5B5FFB5B5FFFBFBFFFFFFFFFFFFFFFFFFFF5959FFCECEFFFFFFFFFFFFFF6D
        6DFFACACFFFFFFFFFFFFFFA8A8FF9E9EFFFFFFFFFFFFFFA7A7FF6E6EFFFFFFFF
        FFFFFFCDCDFF4949FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C7CFF9494
        FFFFFFFFFFFFFFC9C9FF2B2BFFF1F1FFFFFFFFA8A8FF9E9EFFFFFFFFF1F1FF3D
        3DFFC4C4FFFFFFFFFFFFFF9898FF6B6BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFCECEFF4949FFFFFFFFFFFFFFFFFFFF8E8EFF4949FFA6A6FF9B9BFF9191
        FFA9A9FF3737FF8D8DFFFFFFFFFFFFFFF6F6FF5656FFC9C9FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF6161FF9C9CFFFFFFFFFFFFFFFFFFFFC1C1FF
        6B6BFF3434FF3B3BFF6E6EFFC6C6FFFFFFFFFFFFFFFFFFFF9797FF5858FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1E1FF2020FFB5B5FFFF
        FFFFFFFFFFFFFFFFFFFFFFA8A8FF9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFB8B8FF
        5151FFD9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFD3D3FF4B4BFF9797FFF8F8FFFFFFFFFFFFFFA8A8FF9E9EFFFFFFFFFFFFFFFF
        FFFF9D9DFF1414FFD3D3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD9D9FF5B5BFF5454FF9999FFCDCDFF9F9FFF9595
        FFCDCDFF9393FF4646FF6161FFE5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCACAFF6E6EFF
        4E4EFF2F2FFF3F3FFF5B5BFF7E7EFFCECEFFFDFDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFA8A8FF9E9EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8A8FF9E9EFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF}
      Transparent = True
      ExplicitLeft = 168
      ExplicitTop = 0
      ExplicitHeight = 33
    end
    object LblDragPointer: TLabel
      Left = 1
      Top = 1
      Width = 132
      Height = 31
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'Drag pointer to select process by window'
      Layout = tlCenter
      WordWrap = True
      ExplicitLeft = 120
      ExplicitTop = 8
      ExplicitWidth = 31
      ExplicitHeight = 13
    end
    object PaintBox1: TPaintBox
      Left = 0
      Top = 0
      Width = 177
      Height = 33
      OnMouseDown = PaintBox1MouseDown
      OnMouseUp = PaintBox1MouseUp
    end
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 144
    Top = 160
  end
end