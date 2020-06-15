object frmChamadoColaborador: TfrmChamadoColaborador
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Colaboradores'
  ClientHeight = 355
  ClientWidth = 671
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 208
    Width = 68
    Height = 13
    Caption = 'Colaborador *'
  end
  object btnUsuario: TSpeedButton
    Left = 516
    Top = 226
    Width = 23
    Height = 22
    OnClick = btnUsuarioClick
  end
  object Label2: TLabel
    Left = 8
    Top = 256
    Width = 62
    Height = 13
    Caption = 'Hora Inicial *'
  end
  object Label3: TLabel
    Left = 96
    Top = 256
    Width = 57
    Height = 13
    Caption = 'Hora Final *'
  end
  object dbColaborador: TDBGrid
    Left = 8
    Top = 8
    Width = 655
    Height = 185
    DataSource = dsCad
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbColaboradorDrawColumnCell
    OnKeyDown = dbColaboradorKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'ChaOcol_HoraInicio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ChaOCol_HoraFim'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Usu_Nome'
        Width = 477
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 314
    Width = 671
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 6
    object btnNovo: TBitBtn
      Left = 189
      Top = 8
      Width = 90
      Height = 25
      Hint = '[Insert] - Novo Item'
      Caption = 'Novo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TBitBtn
      Left = 285
      Top = 8
      Width = 90
      Height = 25
      Hint = '[F2] - Editar Item'
      Caption = 'Editar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnSalvar: TBitBtn
      Left = 381
      Top = 8
      Width = 90
      Height = 25
      Hint = '[F8] - Salvar Item'
      Caption = 'Sa&lvar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnSalvarClick
    end
    object btnExcluir: TBitBtn
      Left = 477
      Top = 8
      Width = 90
      Height = 25
      Hint = '[Ctrl + Del] - Excluir Item'
      Caption = 'Excluir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnExcluirClick
    end
    object btnCancelar: TBitBtn
      Left = 573
      Top = 8
      Width = 90
      Height = 25
      Hint = '[Esc] - Cancelar Item'
      Caption = 'Cancelar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnCancelarClick
    end
  end
  object edtCodUsuario: TDBEdit
    Left = 8
    Top = 227
    Width = 49
    Height = 21
    Hint = 'F9 - Pesquisar'
    CustomHint = BalloonHint1
    DataField = 'Usu_Codigo'
    DataSource = dsCad
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnExit = edtCodUsuarioExit
    OnKeyDown = edtCodUsuarioKeyDown
  end
  object DBEdit1: TDBEdit
    Left = 63
    Top = 227
    Width = 450
    Height = 21
    TabStop = False
    Color = clSilver
    DataField = 'Usu_Nome'
    DataSource = dsCad
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 275
    Width = 73
    Height = 21
    DataField = 'ChaOcol_HoraInicio'
    DataSource = dsCad
    TabOrder = 4
  end
  object edtDataFim: TDBEdit
    Left = 96
    Top = 275
    Width = 73
    Height = 21
    DataField = 'ChaOCol_HoraFim'
    DataSource = dsCad
    TabOrder = 5
    OnKeyDown = edtDataFimKeyDown
  end
  object Edit1: TEdit
    Left = 469
    Top = 227
    Width = 41
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object dsCad: TDataSource
    AutoEdit = False
    OnStateChange = dsCadStateChange
    Left = 320
    Top = 64
  end
  object BalloonHint1: TBalloonHint
    Left = 328
    Top = 176
  end
end
