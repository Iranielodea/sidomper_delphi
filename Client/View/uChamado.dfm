inherited frmChamado: TfrmChamado
  Tag = 1
  Caption = 'Chamados'
  ClientHeight = 671
  ClientWidth = 1018
  OnDestroy = FormDestroy
  ExplicitTop = -133
  ExplicitWidth = 1024
  ExplicitHeight = 700
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 1018
    Height = 671
    ActivePage = tsEdicao
    ExplicitWidth = 1018
    ExplicitHeight = 671
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 642
      inherited Panel1: TPanel
        Width = 1010
        Height = 601
        ExplicitWidth = 1010
        ExplicitHeight = 601
        inherited GroupBox1: TGroupBox
          Width = 1008
          ExplicitWidth = 1008
          object lblMensagem: TLabel [2]
            Left = 582
            Top = 36
            Width = 260
            Height = 14
            Caption = 'Pesquisar data em formato: AAAA-MM-DD'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'Verdana'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          inherited Label3: TLabel
            Top = 8
            ExplicitTop = 8
          end
          inherited cbbCampos: TComboBox
            OnChange = cbbCamposChange
          end
        end
        inherited dbDados: TDBGrid
          Width = 1008
          Height = 543
          DataSource = dsPesquisa
          PopupMenu = pmConsulta
          Columns = <
            item
              Expanded = False
              FieldName = 'Cha_Id'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cha_DataAbertura'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cha_HoraAbertura'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cha_Nivel'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Nome'
              Width = 251
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Fantasia'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tip_Nome'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sta_Nome'
              Width = 109
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_nome'
              Width = 172
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 601
        Width = 1010
        ExplicitTop = 601
        ExplicitWidth = 1010
        inherited btnNovo: TBitBtn
          Left = 139
          TabOrder = 4
          ExplicitLeft = 139
        end
        inherited btnEditar: TBitBtn
          Left = 233
          TabOrder = 5
          ExplicitLeft = 233
        end
        inherited btnExcluir: TBitBtn
          TabOrder = 6
        end
        inherited btnFiltrar: TBitBtn
          TabOrder = 7
        end
        inherited btnSair: TBitBtn
          Left = 764
          TabOrder = 11
          ExplicitLeft = 764
        end
        inherited btnAnterior: TBitBtn
          TabOrder = 1
        end
        inherited btnProximo: TBitBtn
          TabOrder = 2
        end
        inherited btnPrimeiro: TBitBtn
          Left = 6
          TabOrder = 0
          ExplicitLeft = 6
        end
        inherited btnUltimo: TBitBtn
          TabOrder = 3
        end
        object btnListarProblemas: TBitBtn
          Left = 494
          Top = 6
          Width = 90
          Height = 25
          Caption = 'S&olu'#231#245'es'
          TabOrder = 8
          OnClick = btnListarProblemasClick
        end
        object btnDetalhes2: TBitBtn
          Left = 584
          Top = 6
          Width = 90
          Height = 25
          Caption = '&Detalhes'
          TabOrder = 9
          OnClick = btnDetalhes2Click
        end
        object btnListarAnexo: TBitBtn
          Left = 674
          Top = 6
          Width = 90
          Height = 25
          Caption = '&Anexos'
          TabOrder = 10
          OnClick = btnListarAnexoClick
        end
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 642
      inherited Panel3: TPanel
        Width = 1010
        Height = 601
        ExplicitWidth = 1010
        ExplicitHeight = 601
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 1008
          Height = 599
          ActivePage = tsChamadoOcorrencia
          Align = alClient
          TabOrder = 0
          OnChange = PageControl1Change
          object tsPrincipal: TTabSheet
            Caption = 'Abertura'
            object pnlAbertura: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label4: TLabel
                Left = 24
                Top = 5
                Width = 14
                Height = 14
                Caption = 'ID'
              end
              object Label6: TLabel
                Left = 101
                Top = 5
                Width = 97
                Height = 14
                Caption = 'Data Abertura*'
              end
              object Label7: TLabel
                Left = 204
                Top = 5
                Width = 101
                Height = 14
                Caption = 'Hora Abertura *'
              end
              object Label9: TLabel
                Left = 24
                Top = 101
                Width = 56
                Height = 14
                Caption = 'Cliente *'
              end
              object btnCliente: TSpeedButton
                Left = 512
                Top = 117
                Width = 23
                Height = 22
                OnClick = btnClienteClick
              end
              object Label10: TLabel
                Left = 24
                Top = 53
                Width = 107
                Height = 14
                Caption = 'Usu'#225'rio Abertura'
              end
              object Label12: TLabel
                Left = 23
                Top = 347
                Width = 38
                Height = 14
                Caption = 'Tipo *'
              end
              object btnTipo: TSpeedButton
                Left = 512
                Top = 365
                Width = 23
                Height = 22
                OnClick = btnTipoClick
              end
              object Label13: TLabel
                Left = 23
                Top = 395
                Width = 53
                Height = 14
                Caption = 'Status *'
              end
              object Label14: TLabel
                Left = 548
                Top = 5
                Width = 72
                Height = 14
                Caption = 'Descri'#231#227'o *'
              end
              object Label25: TLabel
                Left = 23
                Top = 259
                Width = 45
                Height = 14
                Caption = 'M'#243'dulo'
              end
              object btnModulo: TSpeedButton
                Left = 512
                Top = 277
                Width = 23
                Height = 22
                OnClick = btnModuloClick
              end
              object Label26: TLabel
                Left = 23
                Top = 305
                Width = 50
                Height = 14
                Caption = 'Produto'
              end
              object Label30: TLabel
                Left = 25
                Top = 145
                Width = 51
                Height = 14
                Caption = 'Contato'
              end
              object Label27: TLabel
                Left = 25
                Top = 444
                Width = 108
                Height = 14
                Caption = 'Dados do Cliente'
              end
              object Label18: TLabel
                Left = 314
                Top = 5
                Width = 45
                Height = 14
                Caption = 'Origem'
              end
              object edtCodigo: TDBEdit
                Left = 24
                Top = 25
                Width = 71
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Cha_Id'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 0
              end
              object edtNome: TDBEdit
                Left = 101
                Top = 25
                Width = 94
                Height = 22
                DataField = 'Cha_DataAbertura'
                DataSource = dsCad
                TabOrder = 1
              end
              object DBEdit2: TDBEdit
                Left = 204
                Top = 25
                Width = 101
                Height = 22
                DataField = 'Cha_HoraAbertura'
                DataSource = dsCad
                TabOrder = 2
              end
              object edtCodCliente: TDBEdit
                Left = 24
                Top = 117
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Cli_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 6
                OnExit = edtCodClienteExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit5: TDBEdit
                Left = 101
                Top = 117
                Width = 411
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Cli_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 7
              end
              object edtCodUsuario: TDBEdit
                Left = 24
                Top = 69
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 4
                OnExit = edtCodUsuarioExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit7: TDBEdit
                Left = 101
                Top = 69
                Width = 412
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 5
              end
              object edtCodTipo: TDBEdit
                Left = 23
                Top = 365
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Tip_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 14
                OnExit = edtCodTipoExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit10: TDBEdit
                Left = 100
                Top = 365
                Width = 412
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Tip_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 15
              end
              object edtCodStatus: TDBEdit
                Left = 23
                Top = 413
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Sta_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 16
              end
              object DBEdit12: TDBEdit
                Left = 100
                Top = 413
                Width = 412
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Sta_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 17
              end
              object DBMemo1: TDBMemo
                Left = 548
                Top = 20
                Width = 445
                Height = 544
                DataField = 'Cha_Descricao'
                DataSource = dsCad
                MaxLength = 1000
                ScrollBars = ssVertical
                TabOrder = 19
                OnEnter = DBMemo1Enter
                OnExit = DBMemo1Exit
                OnKeyDown = DBMemo1KeyDown
              end
              object DBRadioGroup1: TDBRadioGroup
                Left = 24
                Top = 193
                Width = 336
                Height = 56
                Caption = 'Nivel:'
                Columns = 4
                DataField = 'Cha_Nivel'
                DataSource = dsCad
                Items.Strings = (
                  '1-Baixo'
                  '2-Normal'
                  '3-Alto'
                  '4-Cr'#237'tico')
                TabOrder = 9
                Values.Strings = (
                  '1'
                  '2'
                  '3'
                  '4')
              end
              object edtCodModulo: TDBEdit
                Left = 23
                Top = 277
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Mod_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 10
                OnExit = edtCodModuloExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit8: TDBEdit
                Left = 100
                Top = 277
                Width = 412
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Mod_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 11
              end
              object edtCodProduto: TDBEdit
                Left = 23
                Top = 319
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                TabStop = False
                Color = clSilver
                DataField = 'Prod_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 12
              end
              object DBEdit11: TDBEdit
                Left = 100
                Top = 319
                Width = 412
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Prod_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 13
              end
              object DBEdit1: TDBEdit
                Left = 24
                Top = 165
                Width = 489
                Height = 22
                CharCase = ecUpperCase
                DataField = 'Cha_Contato'
                DataSource = dsCad
                TabOrder = 8
              end
              object mmoCliente2: TMemo
                Left = 23
                Top = 464
                Width = 487
                Height = 105
                TabStop = False
                Color = clSilver
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 18
              end
              object cbbOrigemChamado: TComboBox
                Left = 313
                Top = 25
                Width = 198
                Height = 22
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 3
                Text = 'Telefone'
                OnClick = cbbOrigemChamadoClick
                Items.Strings = (
                  'Telefone'
                  'WhatsApp'
                  'Chat'
                  'Aplicativo'
                  'ERP')
              end
            end
          end
          object tsChamadoOcorrencia: TTabSheet
            Caption = 'Ocorr'#234'ncia'
            ImageIndex = 1
            object Panel12: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label5: TLabel
                Left = 16
                Top = 128
                Width = 71
                Height = 14
                Caption = 'Documento'
              end
              object Label8: TLabel
                Left = 167
                Top = 128
                Width = 42
                Height = 14
                Caption = 'Data *'
              end
              object Label11: TLabel
                Left = 303
                Top = 128
                Width = 82
                Height = 14
                Caption = 'Hora Inicial *'
              end
              object Label15: TLabel
                Left = 403
                Top = 128
                Width = 75
                Height = 14
                Caption = 'Hora Final *'
              end
              object Label16: TLabel
                Left = 16
                Top = 176
                Width = 48
                Height = 14
                Caption = 'Usu'#225'rio'
              end
              object Label20: TLabel
                Left = 528
                Top = 128
                Width = 143
                Height = 14
                Caption = 'Descri'#231#227'o do Problema'
              end
              object Label21: TLabel
                Left = 528
                Top = 320
                Width = 133
                Height = 14
                Caption = 'Descri'#231#227'o da Solu'#231#227'o'
              end
              object Label22: TLabel
                Left = 528
                Top = 494
                Width = 39
                Height = 14
                Caption = 'Anexo'
              end
              object btnAnexar: TSpeedButton
                Left = 946
                Top = 514
                Width = 23
                Height = 22
                Enabled = False
                OnClick = btnAnexarClick
              end
              object btnVisualizar: TSpeedButton
                Left = 968
                Top = 514
                Width = 23
                Height = 22
                OnClick = btnVisualizarClick
              end
              object Label31: TLabel
                Left = 14
                Top = 224
                Width = 43
                Height = 14
                Caption = 'Vers'#227'o'
              end
              object Label33: TLabel
                Left = 15
                Top = 271
                Width = 88
                Height = 14
                Caption = 'Dados Cliente'
              end
              object dbOcorrencia: TDBGrid
                Left = 1
                Top = 1
                Width = 998
                Height = 113
                Align = alTop
                DataSource = dsOcorrencia
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnDrawColumnCell = dbOcorrenciaDrawColumnCell
                OnKeyDown = dbOcorrenciaKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ChOco_Id'
                    Title.Alignment = taCenter
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ChOco_Data'
                    Width = 99
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ChOco_HoraInicio'
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ChOco_HoraFim'
                    Title.Caption = 'Hora Final'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ChOco_Docto'
                    Title.Caption = 'Documento'
                    Width = 131
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Usu_Nome'
                    Title.Caption = 'Usu'#225'rio'
                    Width = 528
                    Visible = True
                  end>
              end
              object edtDocumento: TDBEdit
                Left = 16
                Top = 148
                Width = 145
                Height = 22
                DataField = 'ChOco_Docto'
                DataSource = dsOcorrencia
                TabOrder = 1
              end
              object edtData: TDBEdit
                Left = 167
                Top = 148
                Width = 130
                Height = 22
                Hint = 'Duplo Click para Liberar'
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'ChOco_Data'
                DataSource = dsOcorrencia
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 3
                OnDblClick = edtDataDblClick
              end
              object edtHoraInicial: TDBEdit
                Left = 303
                Top = 148
                Width = 94
                Height = 22
                Hint = 'Duplo Click para Liberar'
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'ChOco_HoraInicio'
                DataSource = dsOcorrencia
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 4
                OnDblClick = edtDataDblClick
              end
              object edtHoraFinal: TDBEdit
                Left = 403
                Top = 148
                Width = 110
                Height = 22
                Hint = 'Duplo Click para Liberar'
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'ChOco_HoraFim'
                DataSource = dsOcorrencia
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 5
                OnDblClick = edtDataDblClick
              end
              object edtUsuario: TDBEdit
                Left = 16
                Top = 196
                Width = 57
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Codigo'
                DataSource = dsOcorrencia
                ReadOnly = True
                TabOrder = 6
              end
              object DBEdit9: TDBEdit
                Left = 79
                Top = 196
                Width = 434
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Nome'
                DataSource = dsOcorrencia
                ReadOnly = True
                TabOrder = 7
              end
              object mmoTecnica: TDBMemo
                Left = 528
                Top = 148
                Width = 465
                Height = 166
                DataField = 'ChOco_DescricaoTecnica'
                DataSource = dsOcorrencia
                MaxLength = 1000
                ScrollBars = ssVertical
                TabOrder = 11
                OnEnter = mmoTecnicaEnter
                OnExit = mmoTecnicaExit
                OnKeyDown = mmoTecnicaKeyDown
              end
              object mmoSolucao: TDBMemo
                Left = 528
                Top = 338
                Width = 465
                Height = 150
                DataField = 'ChOco_DescricaoSolucao'
                DataSource = dsOcorrencia
                MaxLength = 2000
                ScrollBars = ssVertical
                TabOrder = 12
                OnEnter = mmoSolucaoEnter
                OnExit = mmoSolucaoExit
                OnKeyDown = mmoSolucaoKeyDown
              end
              object edtNomeArquivo: TDBEdit
                Left = 528
                Top = 514
                Width = 417
                Height = 22
                DataField = 'ChOco_Anexo'
                DataSource = dsOcorrencia
                TabOrder = 13
                OnKeyDown = edtNomeArquivoKeyDown
              end
              object btnNovoOcorrencia: TBitBtn
                Left = 533
                Top = 544
                Width = 90
                Height = 25
                Hint = '[Insert] - Novo Item'
                CustomHint = BalloonHint1
                Caption = 'Novo'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 14
                OnClick = btnNovoOcorrenciaClick
              end
              object btnExcluirOcorrencia: TBitBtn
                Left = 821
                Top = 544
                Width = 90
                Height = 25
                Hint = '[Ctrl + Del] - Excluir Item'
                CustomHint = BalloonHint1
                Caption = 'Excluir'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 17
                OnClick = btnExcluirOcorrenciaClick
              end
              object btnCancelarOcorrencia: TBitBtn
                Left = 902
                Top = 544
                Width = 90
                Height = 25
                Hint = '[Esc] - Cancelar Item'
                CustomHint = BalloonHint1
                Caption = 'Cancelar'
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 18
                OnClick = btnCancelarOcorrenciaClick
              end
              object Edit1: TEdit
                Left = 112
                Top = 148
                Width = 49
                Height = 22
                TabStop = False
                TabOrder = 2
                Text = 'Edit1'
              end
              object btnSalvarOcorrencia: TBitBtn
                Left = 725
                Top = 544
                Width = 90
                Height = 25
                Hint = '[F8] - Salvar Item'
                CustomHint = BalloonHint1
                Caption = 'Sa&lvar'
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 16
                OnClick = btnSalvarOcorrenciaClick
              end
              object btnEditarOcorr: TBitBtn
                Left = 629
                Top = 544
                Width = 90
                Height = 25
                Hint = '[F2] - Editar Item'
                CustomHint = BalloonHint1
                Caption = 'Editar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 15
                OnClick = btnEditarOcorrClick
              end
              object edtVersao: TDBEdit
                Left = 16
                Top = 243
                Width = 217
                Height = 22
                DataField = 'ChOco_Versao'
                DataSource = dsOcorrencia
                TabOrder = 8
              end
              object mmoCliente: TMemo
                Left = 16
                Top = 291
                Width = 497
                Height = 158
                TabStop = False
                Color = clSilver
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Courier'
                Font.Style = []
                Lines.Strings = (
                  '')
                ParentFont = False
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 9
              end
              object btnColaborar: TBitBtn
                Left = 375
                Top = 455
                Width = 138
                Height = 25
                Caption = 'Colaborador'
                Enabled = False
                TabOrder = 10
                TabStop = False
                OnClick = btnColaborarClick
              end
            end
          end
          object tsStatus: TTabSheet
            Caption = 'Status'
            ImageIndex = 2
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object dbStatus: TDBGrid
                Left = 1
                Top = 1
                Width = 998
                Height = 568
                TabStop = False
                Align = alClient
                DataSource = dsStatus
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnDrawColumnCell = dbStatusDrawColumnCell
                OnKeyDown = dbStatusKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ChSta_Data'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ChSta_Hora'
                    Width = 81
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Sta_Nome'
                    Width = 240
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Usu_Nome'
                    Width = 522
                    Visible = True
                  end>
              end
            end
          end
        end
      end
      inherited Panel4: TPanel
        Top = 601
        Width = 1010
        ExplicitTop = 601
        ExplicitWidth = 1010
        inherited btnSalvar: TBitBtn
          Left = 1
          TabOrder = 1
          ExplicitLeft = 1
        end
        inherited btnCancelar: TBitBtn
          TabOrder = 2
        end
        object btnEspecificacao: TBitBtn
          Left = 186
          Top = 6
          Width = 90
          Height = 25
          Caption = '&Especif.'
          TabOrder = 3
          OnClick = btnEspecificacaoClick
        end
        object btnModulo2: TBitBtn
          Left = 275
          Top = 6
          Width = 90
          Height = 25
          Caption = '&M'#243'dulos'
          TabOrder = 4
          OnClick = btnModulo2Click
        end
        object btnConsultaDescricao: TBitBtn
          Left = 364
          Top = 6
          Width = 90
          Height = 25
          Caption = 'S&olu'#231#245'es'
          Enabled = False
          TabOrder = 5
          OnClick = btnConsultaDescricaoClick
        end
        object btnDetalhes: TBitBtn
          Left = 455
          Top = 6
          Width = 90
          Height = 25
          Caption = '&Detalhes'
          TabOrder = 6
          OnClick = btnDetalhesClick
        end
        object btnBuscarCliente: TBitBtn
          Left = 545
          Top = 6
          Width = 90
          Height = 25
          Caption = 'C&lientes'
          TabOrder = 7
          TabStop = False
          OnClick = btnBuscarClienteClick
        end
        object btnListarAnexo2: TBitBtn
          Left = 641
          Top = 5
          Width = 90
          Height = 25
          Caption = '&Anexos'
          TabOrder = 0
          OnClick = btnListarAnexo2Click
        end
      end
    end
    inherited tsFiltro: TTabSheet
      OnShow = tsFiltroShow
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 642
      inherited Panel5: TPanel
        Width = 1010
        Height = 601
        ExplicitWidth = 1010
        ExplicitHeight = 601
        inherited PageControl2: TPageControl
          Width = 1008
          Height = 599
          ExplicitWidth = 1008
          ExplicitHeight = 599
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 1000
            ExplicitHeight = 570
            inherited pnlGeral: TPanel
              Width = 1000
              Height = 570
              ExplicitWidth = 1000
              ExplicitHeight = 570
              inherited Situação: TLabel
                Left = 319
                Top = 65
                Visible = False
                ExplicitLeft = 319
                ExplicitTop = 65
              end
              object Label39: TLabel [1]
                Left = 15
                Top = 16
                Width = 70
                Height = 14
                Caption = 'Data Inicial'
              end
              object Label40: TLabel [2]
                Left = 14
                Top = 64
                Width = 63
                Height = 14
                Caption = 'Data Final'
              end
              object lbl1: TLabel [3]
                Left = 128
                Top = 64
                Width = 13
                Height = 14
                Caption = 'Id'
              end
              object Label19: TLabel [4]
                Left = 16
                Top = 112
                Width = 31
                Height = 14
                Caption = 'Perfil'
              end
              object Label17: TLabel [5]
                Left = 128
                Top = 112
                Width = 45
                Height = 14
                Caption = 'Origem'
              end
              inherited cbbSituacao: TComboBox
                Left = 318
                Top = 84
                TabOrder = 5
                Visible = False
                ExplicitLeft = 318
                ExplicitTop = 84
              end
              object edtDataInicial: TMaskEdit
                Left = 15
                Top = 36
                Width = 88
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
              object edtDataFinal: TMaskEdit
                Left = 14
                Top = 84
                Width = 89
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object GroupBox2: TGroupBox
                Left = 15
                Top = 232
                Width = 978
                Height = 337
                Caption = 'Relat'#243'rios:'
                TabOrder = 6
                object Label23: TLabel
                  Left = 13
                  Top = 32
                  Width = 52
                  Height = 14
                  Caption = 'Modelos'
                end
                object lblOrdemRelatorio: TLabel
                  Left = 13
                  Top = 88
                  Width = 122
                  Height = 14
                  Caption = 'Ordem do Relat'#243'rio'
                  Visible = False
                end
                object cbbModelo: TComboBox
                  Left = 13
                  Top = 52
                  Width = 340
                  Height = 22
                  Style = csDropDownList
                  TabOrder = 0
                  OnClick = cbbModeloClick
                  Items.Strings = (
                    '01 - Chamado por Cliente'
                    '02 - Resumo de Horas por Cliente'
                    '03 - Resumo de Ocorr'#234'ncias por Usu'#225'rio'
                    '04 - Resumo de Horas por Tipo '
                    '05 - Estat'#237'sticas'
                    '06 - Resumo por Tipo M'#234's'
                    '07 - Resumo de Ocorr'#234'ncias por Usu'#225'rio M'#234's'
                    '08 - Resumo de Ocorr'#234'ncias por Perfil de Cliente'
                    '09 - Chamados por Origem')
                end
                object cbbOrdemRelatorio: TComboBox
                  Left = 13
                  Top = 108
                  Width = 340
                  Height = 22
                  Style = csDropDownList
                  TabOrder = 1
                  Visible = False
                end
              end
              object edtIdFiltro: TEdit
                Left = 128
                Top = 84
                Width = 81
                Height = 22
                Alignment = taCenter
                NumbersOnly = True
                TabOrder = 2
                OnExit = edtIdFiltroExit
              end
              object edtPerfil: TEdit
                Left = 15
                Top = 132
                Width = 89
                Height = 22
                TabOrder = 3
              end
              object cbbOrigem: TComboBox
                Left = 128
                Top = 132
                Width = 145
                Height = 22
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 4
                Text = 'Todos'
                Items.Strings = (
                  'Todos'
                  'Telefone'
                  'Whats'
                  'Chat'
                  'Aplictivo'
                  'ERP')
              end
            end
          end
          object tsFiltroUsuario: TTabSheet
            Caption = 'Usu'#225'rio'
            ImageIndex = 2
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraUsuario: TFraUsuario
                Left = 1
                Top = 1
                Width = 998
                Height = 568
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 42
                  Width = 998
                  Height = 526
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 861
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsFiltroCliente: TTabSheet
            Caption = 'Cliente'
            ImageIndex = 1
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraCliente: TFraCliente
                Left = 1
                Top = 1
                Width = 998
                Height = 568
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbCliente: TDBGrid
                  Left = 0
                  Top = 42
                  Width = 998
                  Height = 526
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Cli_Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Cli_Nome'
                      Width = 861
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsFiltroTipo: TTabSheet
            Caption = 'Tipo'
            ImageIndex = 3
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraTipo: TFraTipo
                Left = 1
                Top = 1
                Width = 998
                Height = 568
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited btnProc: TSpeedButton
                  OnClick = FraTipobtnProcClick
                end
                inherited edtCodigo: TEdit
                  TabOrder = 0
                  OnEnter = FraTipoedtCodigoEnter
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 42
                  Width = 998
                  Height = 526
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 862
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsFiltroStatus: TTabSheet
            Caption = 'Status'
            ImageIndex = 4
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraStatus: TFraStatus
                Left = 1
                Top = 1
                Width = 998
                Height = 568
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited btnProc: TSpeedButton
                  OnClick = FraStatusbtnProcClick
                end
                inherited edtCodigo: TEdit
                  TabOrder = 0
                  OnEnter = FraStatusedtCodigoEnter
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 42
                  Width = 998
                  Height = 526
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 860
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsRevenda: TTabSheet
            Caption = 'Revenda'
            ImageIndex = 5
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraRevenda: TFraRevenda
                Left = 1
                Top = 1
                Width = 998
                Height = 568
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 42
                  Width = 998
                  Height = 526
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 862
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsFiltroModulo: TTabSheet
            Caption = 'M'#243'dulo'
            ImageIndex = 6
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraModulo: TFraModulo
                Left = 1
                Top = 1
                Width = 998
                Height = 568
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 42
                  Width = 998
                  Height = 526
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 863
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsConsultor: TTabSheet
            Caption = 'Consultor'
            ImageIndex = 7
            object Panel15: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraConsultor: TFraAnalista
                Left = 1
                Top = 1
                Width = 998
                Height = 568
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 998
                ExplicitHeight = 568
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 42
                  Width = 998
                  Height = 526
                  Align = alBottom
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 863
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 601
        Width = 1010
        ExplicitTop = 601
        ExplicitWidth = 1010
        inherited btnImprimir: TBitBtn
          Left = 98
          OnClick = btnImprimirClick
          ExplicitLeft = 98
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    Left = 828
    Top = 249
  end
  inherited dsCad: TDataSource
    Left = 752
    Top = 240
  end
  inherited BalloonHint1: TBalloonHint
    Left = 620
    Top = 81
  end
  object dlgAbrirArquivo: TOpenDialog
    Left = 825
    Top = 7
  end
  object dsOcorrencia: TDataSource
    AutoEdit = False
    OnStateChange = dsOcorrenciaStateChange
    Left = 289
    Top = 139
  end
  object OpenDialog1: TOpenDialog
    Left = 833
    Top = 15
  end
  object dlgSalvarArquivo: TSaveDialog
    Left = 865
    Top = 15
  end
  object dsStatus: TDataSource
    Left = 721
    Top = 235
  end
  object pmConsulta: TPopupMenu
    Left = 404
    Top = 145
    object EnviarEmail1: TMenuItem
      Caption = 'Enviar Email'
      OnClick = EnviarEmail1Click
    end
  end
end
