object frmProcesso: TfrmProcesso
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Processando ...'
  ClientHeight = 250
  ClientWidth = 463
  Color = clRed
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 463
    Height = 250
    Align = alClient
    BevelOuter = bvLowered
    BevelWidth = 4
    BorderStyle = bsSingle
    TabOrder = 0
    object lblMensagem: TLabel
      Left = 24
      Top = 88
      Width = 401
      Height = 129
      Alignment = taCenter
      AutoSize = False
      Caption = 'lblMensagem'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
  end
end
