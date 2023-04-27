object fMain: TfMain
  Left = 348
  Top = 187
  Width = 416
  Height = 239
  Caption = 'fMain'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    400
    200)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 23
    Height = 13
    Caption = 'files:'
  end
  object Image1: TImage
    Left = 136
    Top = 24
    Width = 256
    Height = 167
    Anchors = [akLeft, akTop, akRight, akBottom]
    Center = True
    Proportional = True
  end
  object Label2: TLabel
    Left = 136
    Top = 8
    Width = 61
    Height = 13
    Caption = 'loading time:'
  end
  object Label3: TLabel
    Left = 200
    Top = 8
    Width = 12
    Height = 13
    Caption = '...'
  end
  object ListBox1: TListBox
    Left = 8
    Top = 24
    Width = 121
    Height = 161
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
  end
end
