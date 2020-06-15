object frmOrcamentoNAprovado: TfrmOrcamentoNAprovado
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Motivo Or'#231'amento n'#227'o Aprovado'
  ClientHeight = 304
  ClientWidth = 710
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
    Left = 8
    Top = 8
    Width = 26
    Height = 14
    Caption = 'Tipo'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 60
    Height = 14
    Caption = 'Descri'#231#227'o'
  end
  object btnTipo: TSpeedButton
    Left = 671
    Top = 28
    Width = 23
    Height = 22
    OnClick = btnTipoClick
  end
  object edtCodTipo: TEdit
    Left = 8
    Top = 28
    Width = 60
    Height = 22
    Hint = '[F9] - Pesquisar'
    Alignment = taCenter
    MaxLength = 4
    NumbersOnly = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnExit = edtCodTipoExit
  end
  object edtNomeTipo: TEdit
    Left = 74
    Top = 28
    Width = 591
    Height = 22
    TabStop = False
    Color = clSilver
    ReadOnly = True
    TabOrder = 1
  end
  object edtTipo: TEdit
    Left = 632
    Top = 0
    Width = 33
    Height = 22
    TabOrder = 2
    Visible = False
  end
  object mmoDescricao: TMemo
    Left = 8
    Top = 76
    Width = 657
    Height = 181
    MaxLength = 1000
    ScrollBars = ssVertical
    TabOrder = 3
    OnEnter = mmoDescricaoEnter
    OnExit = mmoDescricaoExit
    OnKeyDown = mmoDescricaoKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 263
    Width = 710
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    object btnSalvar: TBitBtn
      Left = 256
      Top = 8
      Width = 90
      Height = 25
      Caption = '&Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnCancelar: TBitBtn
      Left = 352
      Top = 8
      Width = 90
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
end
