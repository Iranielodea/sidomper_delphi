object frmListaProblemaChamado: TfrmListaProblemaChamado
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Pesquisa de Chamados'
  ClientHeight = 671
  ClientWidth = 1018
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
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1018
    Height = 42
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 3
      Width = 208
      Height = 14
      Caption = 'Digite o Texto e Pressione ENTER'
    end
    object edtTexto: TEdit
      Left = 24
      Top = 18
      Width = 481
      Height = 22
      TabOrder = 0
      OnKeyDown = edtTextoKeyDown
    end
    object btnFiltrar: TBitBtn
      Left = 912
      Top = 11
      Width = 90
      Height = 25
      Hint = 'F3'
      Caption = 'Filtro'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnFiltrarClick
    end
  end
  object DBCtrlGrid1: TDBCtrlGrid
    Left = 0
    Top = 42
    Width = 1018
    Height = 630
    Align = alTop
    DataSource = dsPesquisa
    PanelHeight = 105
    PanelWidth = 1001
    TabOrder = 1
    RowCount = 6
    object lblIdChamado: TLabel
      Left = 8
      Top = 6
      Width = 71
      Height = 13
      Caption = 'Id Chamado'
      DragCursor = crHandPoint
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnDblClick = lblIdChamadoDblClick
      OnMouseMove = lblIdChamadoMouseMove
      OnMouseLeave = lblIdChamadoMouseLeave
    end
    object Label3: TLabel
      Left = 103
      Top = 6
      Width = 27
      Height = 13
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 8
      Top = 57
      Width = 27
      Height = 13
      Caption = 'Hora'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 90
      Width = 43
      Height = 13
      Caption = 'Usu'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 227
      Top = 6
      Width = 132
      Height = 13
      Caption = 'Descri'#231#227'o do Problema'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 603
      Top = 6
      Width = 123
      Height = 13
      Caption = 'Descri'#231#227'o da Solu'#231#227'o'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
    end
    object DBMemo1: TDBMemo
      Left = 227
      Top = 25
      Width = 370
      Height = 78
      TabStop = False
      Color = clSilver
      DataField = 'ChOco_DescricaoTecnica'
      DataSource = dsPesquisa
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object DBMemo2: TDBMemo
      Left = 603
      Top = 25
      Width = 390
      Height = 78
      TabStop = False
      Color = clSilver
      DataField = 'ChOco_DescricaoSolucao'
      DataSource = dsPesquisa
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 25
      Width = 89
      Height = 22
      TabStop = False
      Color = clSilver
      DataField = 'ChOco_Chamado'
      DataSource = dsPesquisa
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 103
      Top = 25
      Width = 118
      Height = 22
      TabStop = False
      Color = clSilver
      DataField = 'ChOco_Data'
      DataSource = dsPesquisa
      ReadOnly = True
      TabOrder = 3
    end
    object DBEdit3: TDBEdit
      Left = 103
      Top = 53
      Width = 118
      Height = 22
      TabStop = False
      Color = clSilver
      DataField = 'ChOco_HoraInicio'
      DataSource = dsPesquisa
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 103
      Top = 81
      Width = 118
      Height = 22
      TabStop = False
      Color = clSilver
      DataField = 'Usu_Nome'
      DataSource = dsPesquisa
      ReadOnly = True
      TabOrder = 5
    end
  end
  object dsPesquisa: TDataSource
    AutoEdit = False
    Left = 424
    Top = 47
  end
end
