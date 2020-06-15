object frmEstiloTelas: TfrmEstiloTelas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Estilo de Telas'
  ClientHeight = 164
  ClientWidth = 470
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 21
    Width = 81
    Height = 13
    Caption = 'Escolha um Estilo'
  end
  object ComboBox1: TComboBox
    Left = 16
    Top = 40
    Width = 265
    Height = 21
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Panel1: TPanel
    Left = 0
    Top = 123
    Width = 470
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitTop = 301
    ExplicitWidth = 686
    object btnSalvar: TBitBtn
      Left = 8
      Top = 6
      Width = 90
      Height = 25
      Hint = 'F8'
      Caption = '&Salvar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSalvarClick
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
      OnClick = btnCancelarClick
    end
  end
end
