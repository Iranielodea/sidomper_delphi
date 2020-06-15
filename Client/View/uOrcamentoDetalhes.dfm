inherited frmOrcamentoDetalhe: TfrmOrcamentoDetalhe
  Caption = 'Itens do Or'#231'amento'
  ClientHeight = 571
  ClientWidth = 677
  OnClose = FormClose
  OnShow = FormShow
  ExplicitWidth = 683
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 14
  inherited Panel4: TPanel
    Top = 555
    Width = 677
    Height = 16
    Visible = False
    ExplicitTop = 555
    ExplicitWidth = 677
    ExplicitHeight = 16
    inherited btnSalvar: TBitBtn
      TabOrder = 1
      OnClick = btnSalvarClick
    end
    inherited btnCancelar: TBitBtn
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnNovo: TBitBtn
      Left = 186
      Top = 6
      Width = 90
      Height = 25
      Hint = 'Esc'
      Caption = '&Novo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnNovoClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 677
    Height = 555
    ActivePage = tsModulo
    Align = alClient
    TabOrder = 1
    OnChange = PageControl1Change
    object tsItens: TTabSheet
      Caption = 'Itens'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 669
        Height = 526
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 24
          Top = 24
          Width = 52
          Height = 14
          Caption = 'C'#243'digo*'
          FocusControl = edtCodProduto
        end
        object Label2: TLabel
          Left = 100
          Top = 24
          Width = 110
          Height = 14
          Caption = 'Nome do Produto'
          FocusControl = DBEdit2
        end
        object Label3: TLabel
          Left = 222
          Top = 384
          Width = 99
          Height = 14
          Caption = 'Desconto Inicial'
          FocusControl = DBEdit3
        end
        object Label4: TLabel
          Left = 214
          Top = 428
          Width = 107
          Height = 14
          Caption = 'Desconto Mensal'
          FocusControl = DBEdit4
        end
        object Label5: TLabel
          Left = 82
          Top = 384
          Width = 71
          Height = 14
          Caption = 'Valor Inicial'
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 74
          Top = 428
          Width = 79
          Height = 14
          Caption = 'Valor Mensal'
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 24
          Top = 68
          Width = 75
          Height = 14
          Caption = 'Observa'#231#227'o'
        end
        object btnProduto: TSpeedButton
          Left = 631
          Top = 40
          Width = 23
          Height = 22
          OnClick = btnProdutoClick
        end
        object edtCodProduto: TDBEdit
          Left = 24
          Top = 40
          Width = 70
          Height = 22
          Hint = '[F9] - Pesquisar'
          DataField = 'Prod_Codigo'
          DataSource = dsCad
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = edtCodProdutoExit
          OnKeyDown = edtCodProdutoKeyDown
        end
        object DBEdit2: TDBEdit
          Left = 100
          Top = 40
          Width = 525
          Height = 22
          TabStop = False
          Color = clSilver
          DataField = 'Prod_Nome'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 192
          Top = 400
          Width = 129
          Height = 22
          DataField = 'OrcIte_ValorDescImpl'
          DataSource = dsCad
          TabOrder = 4
        end
        object DBEdit4: TDBEdit
          Left = 192
          Top = 448
          Width = 129
          Height = 22
          DataField = 'OrcIte_ValorDescMensal'
          DataSource = dsCad
          TabOrder = 6
        end
        object DBEdit5: TDBEdit
          Left = 24
          Top = 400
          Width = 129
          Height = 22
          DataField = 'OrcIte_ValorLicencaImpl'
          DataSource = dsCad
          TabOrder = 3
        end
        object DBEdit6: TDBEdit
          Left = 24
          Top = 448
          Width = 129
          Height = 22
          DataField = 'OrcIte_ValorLicencaMensal'
          DataSource = dsCad
          TabOrder = 5
        end
        object DBMemo1: TDBMemo
          Left = 24
          Top = 88
          Width = 630
          Height = 290
          DataField = 'OrcIte_Descricao'
          DataSource = dsCad
          ScrollBars = ssVertical
          TabOrder = 2
          OnEnter = DBMemo2Enter
          OnExit = DBMemo2Exit
          OnKeyDown = DBMemo2KeyDown
        end
        object Panel3: TPanel
          Left = 1
          Top = 484
          Width = 667
          Height = 41
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 7
          object btnSalvarItem: TBitBtn
            Left = 104
            Top = 15
            Width = 90
            Height = 25
            Hint = 'F8'
            Caption = 'Salvar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = btnSalvarItemClick
          end
          object btnCancelarItem: TBitBtn
            Left = 200
            Top = 15
            Width = 90
            Height = 25
            Hint = 'Esc'
            Caption = 'Cancelar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnCancelarItemClick
          end
          object btnNovoItem: TBitBtn
            Left = 8
            Top = 15
            Width = 90
            Height = 25
            Hint = 'Insert'
            Caption = 'Novo'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnNovoItemClick
          end
        end
      end
    end
    object tsModulo: TTabSheet
      Caption = 'M'#243'dulo'
      ImageIndex = 1
      OnShow = tsModuloShow
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 669
        Height = 526
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label8: TLabel
          Left = 11
          Top = 304
          Width = 53
          Height = 14
          Caption = 'M'#243'dulo*'
        end
        object btnModulo: TSpeedButton
          Left = 634
          Top = 323
          Width = 23
          Height = 22
          OnClick = btnModuloClick
        end
        object Label9: TLabel
          Left = 11
          Top = 351
          Width = 60
          Height = 14
          Caption = 'Descri'#231#227'o'
        end
        object edtModulo: TDBEdit
          Left = 11
          Top = 323
          Width = 45
          Height = 22
          Hint = '[F9] - Pesquisar'
          DataField = 'Mod_Codigo'
          DataSource = dsModulo
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = edtModuloExit
          OnKeyDown = edtModuloKeyDown
        end
        object DBEdit9: TDBEdit
          Left = 62
          Top = 323
          Width = 566
          Height = 22
          TabStop = False
          Color = clSilver
          DataField = 'Mod_Nome'
          DataSource = dsModulo
          TabOrder = 1
        end
        object DBMemo2: TDBMemo
          Left = 11
          Top = 371
          Width = 646
          Height = 110
          DataField = 'OrcIteMod_Descricao'
          DataSource = dsModulo
          ScrollBars = ssVertical
          TabOrder = 2
          OnEnter = DBMemo2Enter
          OnExit = DBMemo2Exit
          OnKeyDown = DBMemo2KeyDown
        end
        object dbModulo: TDBGrid
          Left = 11
          Top = 8
          Width = 646
          Height = 281
          DataSource = dsModulo
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 8
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDrawColumnCell = dbModuloDrawColumnCell
          OnKeyDown = dbModuloKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'Mod_Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Mod_Nome'
              Title.Caption = 'Descri'#231#227'o'
              Width = 511
              Visible = True
            end>
        end
        object btnNovoModulo: TBitBtn
          Left = 183
          Top = 488
          Width = 90
          Height = 25
          Hint = 'Insert'
          Caption = 'Novo'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnNovoModuloClick
        end
        object btnEditarModulo: TBitBtn
          Left = 279
          Top = 487
          Width = 90
          Height = 25
          Hint = 'F2'
          Caption = 'Editar'
          TabOrder = 4
          OnClick = btnEditarModuloClick
        end
        object btnSalvarModulo: TBitBtn
          Left = 471
          Top = 487
          Width = 90
          Height = 25
          Hint = 'F8'
          Caption = 'Salvar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnSalvarModuloClick
        end
        object btnExcluirModulo: TBitBtn
          Left = 375
          Top = 488
          Width = 90
          Height = 25
          Hint = 'CTRL + DEL'
          Caption = 'Excluir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnExcluirModuloClick
        end
        object btnCancelarModulo: TBitBtn
          Left = 567
          Top = 487
          Width = 90
          Height = 25
          Hint = 'Esc'
          Caption = 'Cancelar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = btnCancelarModuloClick
        end
      end
    end
  end
  object dsCad: TDataSource
    DataSet = DMOrcamento.CDSItens
    OnStateChange = dsCadStateChange
    Left = 376
    Top = 224
  end
  object dsModulo: TDataSource
    AutoEdit = False
    DataSet = DMOrcamento.CDSItensModulo
    OnStateChange = dsModuloStateChange
    Left = 432
    Top = 232
  end
end
