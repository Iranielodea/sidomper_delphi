object frmErro: TfrmErro
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Mensagem de Erro'
  ClientHeight = 309
  ClientWidth = 621
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object lblErro: TLabel
    Left = 24
    Top = 40
    Width = 569
    Height = 97
    Alignment = taCenter
    AutoSize = False
    Caption = 'lblErro'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 268
    Width = 621
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 0
    object btnOk: TBitBtn
      Left = 424
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnDetalhes: TBitBtn
      Left = 520
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Detalhes'
      TabOrder = 1
      OnClick = btnDetalhesClick
    end
  end
  object mmoErro: TMemo
    Left = 24
    Top = 152
    Width = 569
    Height = 110
    Color = clSilver
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
  end
end
