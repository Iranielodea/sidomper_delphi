object frmTrocaSenha: TfrmTrocaSenha
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Troca de Senha'
  ClientHeight = 183
  ClientWidth = 407
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
  object Label1: TLabel
    Left = 32
    Top = 32
    Width = 76
    Height = 14
    Caption = 'Senha atual'
  end
  object Label2: TLabel
    Left = 32
    Top = 60
    Width = 75
    Height = 14
    Caption = 'Nova senha'
  end
  object Label3: TLabel
    Left = 32
    Top = 88
    Width = 139
    Height = 14
    Caption = 'Confirmar nova senha'
  end
  object edtSenhaAtual: TEdit
    Left = 184
    Top = 29
    Width = 177
    Height = 22
    PasswordChar = '*'
    TabOrder = 0
  end
  object edtNovaSenha: TEdit
    Left = 184
    Top = 57
    Width = 177
    Height = 22
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtRedigitar: TEdit
    Left = 184
    Top = 85
    Width = 177
    Height = 22
    PasswordChar = '*'
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 142
    Width = 407
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object btnConfirmar: TBitBtn
      Left = 104
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Con&firmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TBitBtn
      Left = 200
      Top = 8
      Width = 90
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
