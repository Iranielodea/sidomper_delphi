object frmUsuarioSenha: TfrmUsuarioSenha
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Usu'#225'rio para Libera'#231#227'o'
  ClientHeight = 241
  ClientWidth = 467
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object lblUsuario: TLabel
    Left = 88
    Top = 64
    Width = 48
    Height = 14
    Caption = 'Usu'#225'rio'
  end
  object Label2: TLabel
    Left = 88
    Top = 92
    Width = 40
    Height = 14
    Caption = 'Senha'
  end
  object Panel1: TPanel
    Left = 0
    Top = 200
    Width = 467
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    object btnConfirmar: TBitBtn
      Left = 136
      Top = 8
      Width = 90
      Height = 25
      Caption = 'C&onfirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TBitBtn
      Left = 232
      Top = 8
      Width = 90
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object edtUsuario: TEdit
    Left = 150
    Top = 61
    Width = 147
    Height = 22
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 150
    Top = 89
    Width = 147
    Height = 22
    PasswordChar = '*'
    TabOrder = 1
  end
end
