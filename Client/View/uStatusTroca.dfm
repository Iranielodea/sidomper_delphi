object frmStatusTroca: TfrmStatusTroca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Situa'#231#227'o'
  ClientHeight = 214
  ClientWidth = 582
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
  object Label1: TLabel
    Left = 56
    Top = 80
    Width = 49
    Height = 14
    Caption = 'Status*'
  end
  object btnStatus: TSpeedButton
    Left = 514
    Top = 100
    Width = 23
    Height = 22
    OnClick = btnStatusClick
  end
  object Panel4: TPanel
    Left = 0
    Top = 173
    Width = 582
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
    object btnConfirmar: TBitBtn
      Left = 177
      Top = 6
      Width = 90
      Height = 25
      Hint = 'F8'
      Caption = 'Con&firmar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TBitBtn
      Left = 273
      Top = 6
      Width = 90
      Height = 25
      Hint = 'Esc'
      Caption = '&Cancelar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object edtCodStatus: TEdit
    Left = 56
    Top = 100
    Width = 57
    Height = 22
    Hint = '[F9] - Pesquisar'
    NumbersOnly = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnExit = edtCodStatusExit
    OnKeyDown = edtCodStatusKeyDown
  end
  object edtIdStatus: TEdit
    Left = 541
    Top = 100
    Width = 33
    Height = 22
    TabOrder = 3
    Visible = False
  end
  object edtNome: TEdit
    Left = 119
    Top = 100
    Width = 394
    Height = 22
    TabStop = False
    Color = clSilver
    ReadOnly = True
    TabOrder = 2
  end
  object pnlTipo: TPanel
    Left = 8
    Top = 8
    Width = 566
    Height = 66
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 48
      Top = 8
      Width = 34
      Height = 14
      Caption = 'Tipo*'
    end
    object btnTipo: TSpeedButton
      Left = 506
      Top = 28
      Width = 23
      Height = 22
      OnClick = btnTipoClick
    end
    object edtCodTipo: TEdit
      Left = 48
      Top = 28
      Width = 57
      Height = 22
      Hint = '[F9] - Pesquisar'
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = edtCodTipoExit
      OnKeyDown = edtCodStatusKeyDown
    end
    object edtNomeTipo: TEdit
      Left = 111
      Top = 28
      Width = 394
      Height = 22
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object edtIdTipo: TEdit
      Left = 533
      Top = 28
      Width = 28
      Height = 22
      TabOrder = 2
      Visible = False
    end
  end
end
