object Form4: TForm4
  Left = 0
  Top = 0
  Width = 755
  Height = 460
  Caption = 'Easy Search'
  Color = clGradientActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 88
    Width = 40
    Height = 19
    Caption = #1060#1072#1081#1083':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 130
    Top = 144
    Width = 78
    Height = 19
    Caption = #1055#1088#1086#1075#1088#1072#1084#1084#1072':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 135
    Top = 248
    Width = 72
    Height = 19
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label6: TLabel
    Left = 216
    Top = 376
    Width = 9
    Height = 15
    Caption = '...'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 33
    Top = 352
    Width = 175
    Height = 19
    Caption = #1048#1079#1085#1072#1095#1072#1083#1100#1085#1086#1077' '#1088#1072#1089#1096#1080#1088#1077#1085#1080#1077':'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 216
    Top = 355
    Width = 3
    Height = 15
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object EFileName: TEdit
    Left = 216
    Top = 88
    Width = 297
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 528
    Top = 86
    Width = 75
    Height = 26
    Caption = #1042#1099#1073#1088#1072#1090#1100
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo2: TMemo
    Left = 216
    Top = 145
    Width = 265
    Height = 89
    Color = clGradientActiveCaption
    ReadOnly = True
    TabOrder = 2
    Visible = False
  end
  object Memo3: TMemo
    Left = 216
    Top = 249
    Width = 265
    Height = 89
    Color = clGradientActiveCaption
    ReadOnly = True
    TabOrder = 3
    Visible = False
  end
  object CheckBox1: TCheckBox
    Left = 512
    Top = 128
    Width = 201
    Height = 17
    Caption = #1048#1089#1087#1086#1083#1100#1079#1086#1074#1072#1090#1100' '#1087#1086#1080#1089#1082' '#1087#1086' Hex'
    Checked = True
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Times New Roman'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 4
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=extension.mdb;Persi' +
      'st Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
  end
  object MainMenu1: TMainMenu
    Left = 32
    object Selectfile1: TMenuItem
      Caption = '&'#1060#1072#1081#1083
      object Open1: TMenuItem
        Caption = #1054#1090#1082#1088#1099#1090#1100
        OnClick = Button1Click
      end
      object Close1: TMenuItem
        Caption = #1042#1099#1081#1090#1080
        OnClick = Close1Click
      end
    end
    object Help1: TMenuItem
      Caption = #1055#1086#1084#1086#1097#1100
      object N1: TMenuItem
        Caption = #1055#1086#1084#1086#1097#1100
        OnClick = Help1Click
      end
      object About1: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = About1Click
      end
    end
  end
end
