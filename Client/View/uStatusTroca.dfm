object frmStatusTroca: TfrmStatusTroca
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Situa'#231#227'o'
  ClientHeight = 304
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
  object Panel4: TPanel
    Left = 0
    Top = 263
    Width = 582
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
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
  object pnlTipo: TPanel
    Left = 0
    Top = 109
    Width = 582
    Height = 59
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object Label2: TLabel
      Left = 48
      Top = 0
      Width = 34
      Height = 14
      Caption = 'Tipo*'
    end
    object btnTipo: TSpeedButton
      Left = 506
      Top = 20
      Width = 23
      Height = 22
      OnClick = btnTipoClick
    end
    object edtCodTipo: TEdit
      Left = 48
      Top = 20
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
      Top = 20
      Width = 394
      Height = 22
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object edtIdTipo: TEdit
      Left = 533
      Top = 20
      Width = 28
      Height = 22
      TabOrder = 2
      Visible = False
    end
  end
  object pnlModulo: TPanel
    Left = 0
    Top = 0
    Width = 582
    Height = 109
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = -6
    object Label3: TLabel
      Left = 48
      Top = 8
      Width = 45
      Height = 14
      Caption = 'M'#243'dulo'
    end
    object btnModulo: TSpeedButton
      Left = 506
      Top = 28
      Width = 23
      Height = 22
      OnClick = btnModuloClick
    end
    object Label4: TLabel
      Left = 48
      Top = 56
      Width = 50
      Height = 14
      Caption = 'Produto'
    end
    object edtCodModulo: TEdit
      Left = 48
      Top = 28
      Width = 57
      Height = 22
      Hint = '[F9] - Pesquisar'
      NumbersOnly = True
      TabOrder = 0
      OnExit = edtCodModuloExit
      OnKeyDown = edtCodModuloKeyDown
    end
    object edtNomeModulo: TEdit
      Left = 111
      Top = 28
      Width = 394
      Height = 22
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object edtCodProduto: TEdit
      Left = 48
      Top = 76
      Width = 57
      Height = 22
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 2
    end
    object edtNomeProduto: TEdit
      Left = 111
      Top = 76
      Width = 394
      Height = 22
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 3
    end
    object edtIdModulo: TEdit
      Left = 535
      Top = 28
      Width = 31
      Height = 22
      TabOrder = 4
      Visible = False
    end
    object edtIdProduto: TEdit
      Left = 535
      Top = 56
      Width = 31
      Height = 22
      TabOrder = 5
      Visible = False
    end
    object edtIdCliente: TEdit
      Left = 535
      Top = 81
      Width = 31
      Height = 22
      TabOrder = 6
      Visible = False
    end
  end
  object pnlStatus: TPanel
    Left = 0
    Top = 168
    Width = 582
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object Label1: TLabel
      Left = 48
      Top = -2
      Width = 49
      Height = 14
      Caption = 'Status*'
    end
    object btnStatus: TSpeedButton
      Left = 506
      Top = 14
      Width = 23
      Height = 22
      OnClick = btnStatusClick
    end
    object edtCodStatus: TEdit
      Left = 48
      Top = 14
      Width = 57
      Height = 22
      Hint = '[F9] - Pesquisar'
      NumbersOnly = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = edtCodStatusExit
      OnKeyDown = edtCodStatusKeyDown
    end
    object edtNome: TEdit
      Left = 111
      Top = 14
      Width = 394
      Height = 22
      TabStop = False
      Color = clSilver
      ReadOnly = True
      TabOrder = 1
    end
    object edtIdStatus: TEdit
      Left = 533
      Top = 14
      Width = 28
      Height = 22
      TabOrder = 2
      Visible = False
    end
  end
end
