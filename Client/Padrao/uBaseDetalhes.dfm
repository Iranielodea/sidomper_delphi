object frmBaseDetalhes: TfrmBaseDetalhes
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Base Detalhes'
  ClientHeight = 338
  ClientWidth = 669
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Panel4: TPanel
    Left = 0
    Top = 297
    Width = 669
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnSalvar: TBitBtn
      Left = 8
      Top = 6
      Width = 90
      Height = 25
      Hint = 'F8'
      Caption = '&Salvar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
    end
    object btnCancelar: TBitBtn
      Left = 97
      Top = 6
      Width = 90
      Height = 25
      Hint = 'Esc'
      Caption = '&Cancelar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
end
