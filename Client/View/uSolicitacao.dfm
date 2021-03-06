﻿inherited frmSolicitacao: TfrmSolicitacao
  Tag = 3
  Caption = 'Solicita'#231#245'es'
  ClientHeight = 636
  ClientWidth = 1018
  ExplicitWidth = 1024
  ExplicitHeight = 665
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 1018
    Height = 636
    ActivePage = tsEdicao
    ParentFont = False
    ExplicitWidth = 1018
    ExplicitHeight = 636
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 607
      inherited Panel1: TPanel
        Width = 1010
        Height = 566
        ExplicitWidth = 1010
        ExplicitHeight = 566
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
          Height = 508
          DataSource = dsPesquisa
          PopupMenu = pmConsulta
          Columns = <
            item
              Expanded = False
              FieldName = 'Sol_Id'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ver_Versao'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sol_Data'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sol_Hora'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sol_Titulo'
              Width = 217
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sol_Nivel'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Nome'
              Width = 225
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Fantasia'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tip_Nome'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Sta_Nome'
              Width = 78
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 566
        Width = 1010
        ExplicitTop = 566
        ExplicitWidth = 1010
        inherited btnNovo: TBitBtn
          Left = 136
          TabOrder = 4
          ExplicitLeft = 136
        end
        inherited btnEditar: TBitBtn
          TabOrder = 5
        end
        inherited btnExcluir: TBitBtn
          TabOrder = 6
        end
        inherited btnFiltrar: TBitBtn
          TabOrder = 7
        end
        inherited btnSair: TBitBtn
          Left = 674
          TabOrder = 10
          ExplicitLeft = 674
        end
        inherited btnAnterior: TBitBtn
          TabOrder = 1
        end
        inherited btnProximo: TBitBtn
          TabOrder = 2
        end
        inherited btnPrimeiro: TBitBtn
          TabOrder = 0
        end
        inherited btnUltimo: TBitBtn
          TabOrder = 3
        end
        object btnDetalhes2: TBitBtn
          Left = 493
          Top = 6
          Width = 90
          Height = 25
          Caption = '&Detalhes'
          TabOrder = 8
          OnClick = btnDetalhes2Click
        end
        object btnAnexo: TBitBtn
          Left = 583
          Top = 6
          Width = 90
          Height = 25
          Caption = 'Anexos'
          TabOrder = 9
          OnClick = btnAnexoClick
        end
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 607
      inherited Panel3: TPanel
        Width = 1010
        Height = 566
        ExplicitWidth = 1010
        ExplicitHeight = 566
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 1008
          Height = 564
          ActivePage = tsAbertura
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = PageControl1Change
          object tsAbertura: TTabSheet
            Caption = '&Abertura'
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              CustomHint = BalloonHint1
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label4: TLabel
                Left = 24
                Top = 5
                Width = 14
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'ID'
              end
              object Label5: TLabel
                Left = 24
                Top = 53
                Width = 42
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Data *'
              end
              object Label6: TLabel
                Left = 143
                Top = 53
                Width = 42
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Hora *'
              end
              object Label7: TLabel
                Left = 24
                Top = 149
                Width = 56
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Cliente *'
              end
              object Label8: TLabel
                Left = 528
                Top = 149
                Width = 45
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'M'#243'dulo'
              end
              object Label9: TLabel
                Left = 24
                Top = 101
                Width = 107
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Usu'#225'rio Abertura'
              end
              object Label10: TLabel
                Left = 528
                Top = 197
                Width = 50
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Produto'
              end
              object Label11: TLabel
                Left = 24
                Top = 244
                Width = 46
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'T'#237'tulo *'
              end
              object Label13: TLabel
                Left = 526
                Top = 101
                Width = 94
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Vers'#227'o em Uso'
              end
              object Label14: TLabel
                Left = 526
                Top = 348
                Width = 39
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Anexo'
              end
              object btnCliente: TSpeedButton
                Left = 487
                Top = 169
                Width = 23
                Height = 22
                CustomHint = BalloonHint1
                OnClick = btnClienteClick
              end
              object btnModulo: TSpeedButton
                Left = 978
                Top = 169
                Width = 23
                Height = 22
                CustomHint = BalloonHint1
                OnClick = btnModuloClick
              end
              object btnAnexar: TSpeedButton
                Left = 954
                Top = 368
                Width = 23
                Height = 22
                Hint = 'Anexar Arquivo'
                CustomHint = BalloonHint1
                ParentShowHint = False
                ShowHint = True
                OnClick = btnAnexarClick
              end
              object btnVisualizar: TSpeedButton
                Left = 976
                Top = 368
                Width = 23
                Height = 22
                Hint = 'Visualizar Arquivo'
                CustomHint = BalloonHint1
                ParentShowHint = False
                ShowHint = True
                OnClick = btnVisualizarClick
              end
              object Label22: TLabel
                Left = 24
                Top = 296
                Width = 53
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Status *'
              end
              object Label42: TLabel
                Left = 24
                Top = 196
                Width = 51
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Contato'
              end
              object Label43: TLabel
                Left = 24
                Top = 352
                Width = 26
                Height = 14
                CustomHint = BalloonHint1
                Caption = 'Tipo'
              end
              object btnTipoAbertura: TSpeedButton
                Left = 487
                Top = 368
                Width = 23
                Height = 22
                CustomHint = BalloonHint1
                OnClick = btnTipoAberturaClick
              end
              object edtCodigo: TDBEdit
                Left = 24
                Top = 25
                Width = 57
                Height = 22
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Sol_Id'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 0
              end
              object edtNome: TDBEdit
                Left = 24
                Top = 73
                Width = 113
                Height = 22
                CustomHint = BalloonHint1
                DataField = 'Sol_Data'
                DataSource = dsCad
                TabOrder = 1
              end
              object DBEdit1: TDBEdit
                Left = 143
                Top = 73
                Width = 74
                Height = 22
                CustomHint = BalloonHint1
                DataField = 'Sol_Hora'
                DataSource = dsCad
                TabOrder = 2
              end
              object edtCodCliente: TDBEdit
                Left = 24
                Top = 169
                Width = 57
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Cli_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnExit = edtCodClienteExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit3: TDBEdit
                Left = 87
                Top = 169
                Width = 394
                Height = 22
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Cli_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 6
              end
              object edtCodModulo: TDBEdit
                Left = 528
                Top = 169
                Width = 57
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Mod_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 14
                OnExit = edtCodModuloExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit5: TDBEdit
                Left = 591
                Top = 169
                Width = 386
                Height = 22
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Mod_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 15
              end
              object edtCodAbertura: TDBEdit
                Left = 24
                Top = 121
                Width = 57
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'UAb_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ReadOnly = True
                ShowHint = False
                TabOrder = 3
                OnExit = edtCodAberturaExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit7: TDBEdit
                Left = 87
                Top = 121
                Width = 394
                Height = 22
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'UAb_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 4
              end
              object edtCodProduto: TDBEdit
                Left = 528
                Top = 217
                Width = 57
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Prod_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 16
                OnExit = edtCodProdutoExit
                OnKeyDown = edtCodClienteKeyDown
              end
              object DBEdit9: TDBEdit
                Left = 591
                Top = 217
                Width = 386
                Height = 22
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Prod_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 17
              end
              object DBEdit10: TDBEdit
                Left = 24
                Top = 264
                Width = 457
                Height = 22
                CustomHint = BalloonHint1
                CharCase = ecUpperCase
                DataField = 'Sol_Titulo'
                DataSource = dsCad
                TabOrder = 8
              end
              object DBEdit11: TDBEdit
                Left = 528
                Top = 121
                Width = 196
                Height = 22
                CustomHint = BalloonHint1
                DataField = 'Sol_Versao'
                DataSource = dsCad
                TabOrder = 13
              end
              object edtNomeArquivo: TDBEdit
                Left = 528
                Top = 368
                Width = 420
                Height = 22
                CustomHint = BalloonHint1
                DataField = 'Sol_Anexo'
                DataSource = dsCad
                TabOrder = 19
              end
              object DBRadioGroup1: TDBRadioGroup
                Left = 528
                Top = 245
                Width = 449
                Height = 93
                CustomHint = BalloonHint1
                Caption = 'N'#237'vel:'
                Columns = 4
                DataField = 'Sol_Nivel'
                DataSource = dsCad
                Items.Strings = (
                  '1-Baixo'
                  '2-Normal'
                  '3-Alto'
                  '4-Cr'#237'tico')
                TabOrder = 18
                Values.Strings = (
                  '1'
                  '2'
                  '3'
                  '4')
              end
              object edtCodStatus: TDBEdit
                Left = 24
                Top = 316
                Width = 57
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
                TabOrder = 9
              end
              object DBEdit4: TDBEdit
                Left = 87
                Top = 316
                Width = 394
                Height = 22
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Sta_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 10
              end
              object DBEdit2: TDBEdit
                Left = 24
                Top = 216
                Width = 457
                Height = 22
                CustomHint = BalloonHint1
                CharCase = ecUpperCase
                DataField = 'Sol_Contato'
                DataSource = dsCad
                TabOrder = 7
              end
              object edtCodTipoAbertura: TDBEdit
                Left = 24
                Top = 368
                Width = 57
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Tip_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 11
                OnExit = edtCodTipoAberturaExit
                OnKeyDown = edtCodTipoAberturaKeyDown
              end
              object DBEdit19: TDBEdit
                Left = 87
                Top = 368
                Width = 394
                Height = 22
                CustomHint = BalloonHint1
                TabStop = False
                Color = clSilver
                DataField = 'Tip_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 12
              end
            end
          end
          object tsDescricaoAbertura: TTabSheet
            Caption = 'Descri'#231#227'o Abertura'
            ImageIndex = 5
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Panel22: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object dbmDescricaoAbertura: TDBMemo
                Left = 1
                Top = 41
                Width = 998
                Height = 493
                Align = alClient
                DataField = 'Sol_Descricao'
                DataSource = dsCad
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                ScrollBars = ssVertical
                TabOrder = 1
                OnEnter = EditorAnalista2Enter
                OnExit = EditorAnalista2Exit
                OnKeyDown = EditorAnalista2KeyDown
              end
              object Panel31: TPanel
                Left = 1
                Top = 1
                Width = 998
                Height = 40
                Align = alTop
                BevelOuter = bvLowered
                Caption = 
                  'Descri'#231#227'o (descrever de forma simples e objetiva o que deve ser ' +
                  'realizado na solicita'#231#227'o)'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
            end
          end
          object tsAnalista: TTabSheet
            Caption = 'A&nalista'
            ImageIndex = 1
            OnShow = tsAnalistaShow
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object pgcAnalista: TPageControl
                Left = 1
                Top = 1
                Width = 998
                Height = 533
                ActivePage = tsAnalistaPrincipal
                Align = alClient
                TabOrder = 0
                OnChange = pgcAnalistaChange
                object tsAnalistaPrincipal: TTabSheet
                  Caption = 'Principal'
                  object Panel15: TPanel
                    Left = 0
                    Top = 0
                    Width = 990
                    Height = 504
                    Align = alClient
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object Label15: TLabel
                      Left = 14
                      Top = 7
                      Width = 50
                      Height = 14
                      Caption = 'Analista'
                    end
                    object btnAnalista: TSpeedButton
                      Left = 491
                      Top = 25
                      Width = 23
                      Height = 22
                      OnClick = btnAnalistaClick
                    end
                    object Label17: TLabel
                      Left = 14
                      Top = 53
                      Width = 96
                      Height = 14
                      Caption = 'Tempo Previsto'
                    end
                    object Label18: TLabel
                      Left = 125
                      Top = 53
                      Width = 108
                      Height = 14
                      Caption = 'Previs'#227'o Entrega'
                    end
                    object Label19: TLabel
                      Left = 14
                      Top = 99
                      Width = 94
                      Height = 14
                      Caption = 'Desenvolvedor'
                    end
                    object btnDesenv: TSpeedButton
                      Left = 451
                      Top = 117
                      Width = 23
                      Height = 22
                      OnClick = btnDesenvClick
                    end
                    object Label44: TLabel
                      Left = 527
                      Top = 53
                      Width = 26
                      Height = 14
                      Caption = 'Tipo'
                    end
                    object btnTipoAnalise: TSpeedButton
                      Left = 964
                      Top = 69
                      Width = 23
                      Height = 22
                      OnClick = btnTipoAnaliseClick
                    end
                    object Label16: TLabel
                      Left = 527
                      Top = 97
                      Width = 45
                      Height = 14
                      CustomHint = BalloonHint1
                      Caption = 'M'#243'dulo'
                    end
                    object btnModulo2: TSpeedButton
                      Left = 964
                      Top = 117
                      Width = 23
                      Height = 22
                      CustomHint = BalloonHint1
                      OnClick = btnModulo2Click
                    end
                    object Label21: TLabel
                      Left = 527
                      Top = 151
                      Width = 50
                      Height = 14
                      CustomHint = BalloonHint1
                      Caption = 'Produto'
                    end
                    object Label20: TLabel
                      Left = 527
                      Top = 7
                      Width = 55
                      Height = 14
                      Caption = 'Vers'#227'o *'
                    end
                    object btnVersao: TSpeedButton
                      Left = 964
                      Top = 25
                      Width = 23
                      Height = 22
                      OnClick = btnVersaoClick
                    end
                    object Label50: TLabel
                      Left = 14
                      Top = 145
                      Width = 62
                      Height = 14
                      Caption = 'Categoria'
                    end
                    object btnCategoria: TSpeedButton
                      Left = 451
                      Top = 162
                      Width = 23
                      Height = 22
                      OnClick = btnCategoriaClick
                    end
                    object Label51: TLabel
                      Left = 14
                      Top = 189
                      Width = 46
                      Height = 14
                      CustomHint = BalloonHint1
                      Caption = 'Titulo *'
                    end
                    object edtCodAnalista: TDBEdit
                      Left = 14
                      Top = 25
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      DataField = 'Anal_Codigo'
                      DataSource = dsCad
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 0
                      OnExit = edtCodAnalistaExit
                      OnKeyDown = edtCodClienteKeyDown
                    end
                    object edtNomeAnalista: TDBEdit
                      Left = 77
                      Top = 25
                      Width = 412
                      Height = 22
                      TabStop = False
                      Color = clSilver
                      DataField = 'Anal_Nome'
                      DataSource = dsCad
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object edtTempoPrevisto: TDBEdit
                      Left = 14
                      Top = 73
                      Width = 105
                      Height = 22
                      DataField = 'Sol_TempoPrevisto'
                      DataSource = dsCad
                      TabOrder = 4
                    end
                    object edtPrevisaoEntrega: TDBEdit
                      Left = 125
                      Top = 73
                      Width = 122
                      Height = 22
                      DataField = 'Sol_PrevisaoEntrega'
                      DataSource = dsCad
                      TabOrder = 5
                    end
                    object edtCodDesenv: TDBEdit
                      Left = 14
                      Top = 117
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      DataField = 'Desenv_Codigo'
                      DataSource = dsCad
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 8
                      OnExit = edtCodDesenvExit
                      OnKeyDown = edtCodClienteKeyDown
                    end
                    object edtNomeDesenvolvedor: TDBEdit
                      Left = 77
                      Top = 117
                      Width = 371
                      Height = 22
                      TabStop = False
                      Color = clSilver
                      DataField = 'Desenv_Nome'
                      DataSource = dsCad
                      ReadOnly = True
                      TabOrder = 9
                    end
                    object btnEditarAnalista: TBitBtn
                      Left = 895
                      Top = 477
                      Width = 90
                      Height = 25
                      Hint = '[F2] - Editar'
                      CustomHint = BalloonHint1
                      Caption = 'Editar'
                      TabOrder = 18
                      OnClick = btnEditarAnalistaClick
                    end
                    object btnSalvarAnalista: TBitBtn
                      Left = 494
                      Top = 478
                      Width = 90
                      Height = 25
                      Hint = '[F8] - Salvar'
                      CustomHint = BalloonHint1
                      Caption = 'Salvar'
                      Enabled = False
                      TabOrder = 19
                      Visible = False
                      OnClick = btnSalvarAnalistaClick
                    end
                    object btnCancelarAnalista: TBitBtn
                      Left = 590
                      Top = 478
                      Width = 90
                      Height = 25
                      Hint = '[Esc] - Cancelar'
                      CustomHint = BalloonHint1
                      Caption = 'Cancelar'
                      Enabled = False
                      TabOrder = 20
                      Visible = False
                      OnClick = btnCancelarAnalistaClick
                    end
                    object edtCodTipoAnalise: TDBEdit
                      Left = 527
                      Top = 69
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      DataField = 'Tip_Codigo'
                      DataSource = dsCad
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 6
                      OnExit = edtCodTipoAnaliseExit
                      OnKeyDown = edtCodTipoAberturaKeyDown
                    end
                    object edtNomeTipoAnalise: TDBEdit
                      Left = 590
                      Top = 69
                      Width = 371
                      Height = 22
                      TabStop = False
                      Color = clSilver
                      DataField = 'Tip_Nome'
                      DataSource = dsCad
                      ReadOnly = True
                      TabOrder = 7
                    end
                    object Panel25: TPanel
                      Left = 14
                      Top = 237
                      Width = 971
                      Height = 238
                      BevelOuter = bvLowered
                      TabOrder = 17
                      object Panel24: TPanel
                        Left = 1
                        Top = 1
                        Width = 969
                        Height = 32
                        Align = alTop
                        BevelOuter = bvLowered
                        TabOrder = 0
                        object Label12: TLabel
                          Left = 320
                          Top = 8
                          Width = 145
                          Height = 14
                          Caption = 'Descri'#231#227'o da Libera'#231#227'o'
                        end
                        object btnNegrito2: TBitBtn
                          Left = 1
                          Top = 1
                          Width = 152
                          Height = 30
                          Hint = 'Formata'#231#227'o'
                          Align = alLeft
                          Caption = 'Formatar Texto'
                          Font.Charset = ANSI_CHARSET
                          Font.Color = clWindowText
                          Font.Height = -19
                          Font.Name = 'Bell MT'
                          Font.Style = [fsBold]
                          ParentFont = False
                          ParentShowHint = False
                          ShowHint = True
                          TabOrder = 0
                          TabStop = False
                          OnClick = btnNegrito2Click
                        end
                      end
                      object EditorAnalista2: TDBRichEdit
                        Left = 1
                        Top = 37
                        Width = 969
                        Height = 200
                        Align = alBottom
                        DataField = 'Sol_DescricaoLiberacao'
                        DataSource = dsCad
                        ParentFont = True
                        ScrollBars = ssVertical
                        TabOrder = 1
                        OnEnter = EditorAnalista2Enter
                        OnExit = EditorAnalista2Exit
                        OnKeyDown = EditorAnalista2KeyDown
                      end
                    end
                    object edtCodModulo2: TDBEdit
                      Left = 527
                      Top = 117
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      DataField = 'Mod_Codigo'
                      DataSource = dsCad
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 10
                      OnExit = edtCodModulo2Exit
                      OnKeyDown = edtCodClienteKeyDown
                    end
                    object edtNomeModulo2: TDBEdit
                      Left = 590
                      Top = 117
                      Width = 371
                      Height = 22
                      CustomHint = BalloonHint1
                      TabStop = False
                      Color = clSilver
                      DataField = 'Mod_Nome'
                      DataSource = dsCad
                      ReadOnly = True
                      TabOrder = 11
                    end
                    object DBEdit24: TDBEdit
                      Left = 527
                      Top = 169
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      TabStop = False
                      Color = clSilver
                      DataField = 'Prod_Codigo'
                      DataSource = dsCad
                      ParentShowHint = False
                      ReadOnly = True
                      ShowHint = True
                      TabOrder = 13
                      OnExit = edtCodProdutoExit
                      OnKeyDown = edtCodClienteKeyDown
                    end
                    object DBEdit25: TDBEdit
                      Left = 590
                      Top = 169
                      Width = 371
                      Height = 22
                      CustomHint = BalloonHint1
                      TabStop = False
                      Color = clSilver
                      DataField = 'Prod_Nome'
                      DataSource = dsCad
                      ReadOnly = True
                      TabOrder = 14
                    end
                    object edtVersao: TDBEdit
                      Left = 527
                      Top = 25
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      DataField = 'Sol_VersaoId'
                      DataSource = dsCad
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 2
                      OnExit = edtVersaoExit
                      OnKeyDown = edtVersaoKeyDown
                    end
                    object edtNomeVersao: TDBEdit
                      Left = 590
                      Top = 25
                      Width = 371
                      Height = 22
                      TabStop = False
                      Color = clSilver
                      DataField = 'Ver_Versao'
                      DataSource = dsCad
                      ReadOnly = True
                      TabOrder = 3
                    end
                    object edtCodCategoria: TDBEdit
                      Left = 14
                      Top = 162
                      Width = 55
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      DataField = 'Cat_Codigo'
                      DataSource = dsCad
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 12
                      OnExit = edtCodCategoriaExit
                      OnKeyDown = edtCodClienteKeyDown
                    end
                    object edtNomeCategoria: TDBEdit
                      Left = 77
                      Top = 162
                      Width = 371
                      Height = 22
                      TabStop = False
                      Color = clSilver
                      DataField = 'Cat_Nome'
                      DataSource = dsCad
                      ReadOnly = True
                      TabOrder = 16
                    end
                    object edtTituloAnal: TDBEdit
                      Left = 14
                      Top = 205
                      Width = 947
                      Height = 22
                      CustomHint = BalloonHint1
                      CharCase = ecUpperCase
                      DataField = 'Sol_Titulo'
                      DataSource = dsCad
                      TabOrder = 15
                    end
                  end
                end
                object tsCronograma: TTabSheet
                  Caption = 'Cronograma'
                  ImageIndex = 1
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object Panel21: TPanel
                    Left = 0
                    Top = 0
                    Width = 990
                    Height = 504
                    Align = alClient
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object Label23: TLabel
                      Left = 22
                      Top = 341
                      Width = 72
                      Height = 14
                      Caption = 'Operador *'
                    end
                    object Label24: TLabel
                      Left = 22
                      Top = 389
                      Width = 91
                      Height = 14
                      Caption = 'Previs'#227'o In'#237'cio'
                    end
                    object Label25: TLabel
                      Left = 22
                      Top = 437
                      Width = 67
                      Height = 14
                      Caption = 'Hora In'#237'cio'
                    end
                    object Label26: TLabel
                      Left = 102
                      Top = 437
                      Width = 55
                      Height = 14
                      Caption = 'Hora Fim'
                    end
                    object btnOperAnalista: TSpeedButton
                      Left = 503
                      Top = 361
                      Width = 23
                      Height = 22
                      OnClick = btnOperAnalistaClick
                    end
                    object edtCodOperAnalista: TDBEdit
                      Left = 22
                      Top = 361
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      DataField = 'Usu_Codigo'
                      DataSource = dsCronograma
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 1
                      OnExit = edtCodOperAnalistaExit
                      OnKeyDown = edtCodClienteKeyDown
                    end
                    object DBEdit6: TDBEdit
                      Left = 85
                      Top = 361
                      Width = 412
                      Height = 22
                      TabStop = False
                      Color = clSilver
                      DataField = 'Usu_Nome'
                      DataSource = dsCronograma
                      ReadOnly = True
                      TabOrder = 2
                    end
                    object edtDataPrevCrono: TDBEdit
                      Left = 22
                      Top = 409
                      Width = 122
                      Height = 22
                      DataField = 'SCro_Data'
                      DataSource = dsCronograma
                      TabOrder = 4
                    end
                    object edtHoraIniCrono: TDBEdit
                      Left = 22
                      Top = 457
                      Width = 74
                      Height = 22
                      DataField = 'SCro_HoraInicio'
                      DataSource = dsCronograma
                      TabOrder = 5
                    end
                    object edtHoraFim: TDBEdit
                      Left = 102
                      Top = 457
                      Width = 74
                      Height = 22
                      DataField = 'SCro_HoraFim'
                      DataSource = dsCronograma
                      TabOrder = 6
                      OnKeyDown = edtHoraFimKeyDown
                    end
                    object dbCronograma: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 988
                      Height = 327
                      Align = alTop
                      DataSource = dsCronograma
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                      TabOrder = 0
                      TitleFont.Charset = ANSI_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -12
                      TitleFont.Name = 'Verdana'
                      TitleFont.Style = []
                      OnDrawColumnCell = dbCronogramaDrawColumnCell
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'SCro_Data'
                          Title.Caption = 'Previs'#227'o In'#237'cio'
                          Width = 100
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'SCro_HoraInicio'
                          Title.Caption = 'Hora In'#237'cio'
                          Width = 90
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'SCro_HoraFim'
                          Title.Caption = 'Hora Fim'
                          Width = 90
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'Usu_Nome'
                          Title.Caption = 'Operador'
                          Width = 644
                          Visible = True
                        end>
                    end
                    object btnNovoCrono: TBitBtn
                      Left = 517
                      Top = 469
                      Width = 90
                      Height = 25
                      Hint = '[Insert] - Novo Item'
                      CustomHint = BalloonHint1
                      Caption = 'Novo'
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 7
                      OnClick = btnNovoCronoClick
                    end
                    object btnExcluirCrono: TBitBtn
                      Left = 792
                      Top = 469
                      Width = 90
                      Height = 25
                      Hint = '[Ctrl + Del] - Excluir Item'
                      CustomHint = BalloonHint1
                      Caption = 'Excluir'
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 10
                      OnClick = btnExcluirCronoClick
                    end
                    object btnCancelarCrono: TBitBtn
                      Left = 888
                      Top = 469
                      Width = 90
                      Height = 25
                      Hint = '[Esc] - Cancelar Item'
                      CustomHint = BalloonHint1
                      Caption = 'Cancelar'
                      Enabled = False
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 11
                      OnClick = btnCancelarCronoClick
                    end
                    object edtIdOperadorAnalista: TEdit
                      Left = 449
                      Top = 361
                      Width = 33
                      Height = 22
                      TabStop = False
                      TabOrder = 3
                      Text = 'Edit1'
                    end
                    object btnSalvarCronograma: TBitBtn
                      Left = 702
                      Top = 469
                      Width = 90
                      Height = 25
                      Hint = '[F8] - Salvar Item'
                      CustomHint = BalloonHint1
                      Caption = 'Sa&lvar'
                      Enabled = False
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 9
                      OnClick = btnSalvarCronogramaClick
                    end
                    object btnEditarCrono: TBitBtn
                      Left = 614
                      Top = 469
                      Width = 90
                      Height = 25
                      Hint = '[F2] - Editar Item'
                      CustomHint = BalloonHint1
                      Caption = 'Editar'
                      Enabled = False
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 8
                      OnClick = btnEditarCronoClick
                    end
                  end
                end
              end
            end
          end
          object tsOcorrenciaGeral: TTabSheet
            Caption = 'Oc&orr'#234'ncia Geral'
            ImageIndex = 2
            OnShow = tsOcorrenciaGeralShow
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Panel28: TPanel
                Left = 1
                Top = 493
                Width = 998
                Height = 41
                Align = alBottom
                BevelOuter = bvLowered
                TabOrder = 1
                object btnNovoGeral: TBitBtn
                  Left = 525
                  Top = 16
                  Width = 90
                  Height = 25
                  Hint = '[Insert] - Novo Item'
                  CustomHint = BalloonHint1
                  Caption = 'Novo'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  OnClick = btnNovoGeralClick
                end
                object btnEditarGeral: TBitBtn
                  Left = 621
                  Top = 16
                  Width = 90
                  Height = 25
                  Hint = '[F2] - Editar Item'
                  CustomHint = BalloonHint1
                  Caption = 'Editar'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnClick = btnEditarGeralClick
                end
                object btnSalvarGeral: TBitBtn
                  Left = 709
                  Top = 16
                  Width = 90
                  Height = 25
                  Hint = '[F8] - Salvar Item'
                  CustomHint = BalloonHint1
                  Caption = 'Sa&lvar'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnClick = btnSalvarGeralClick
                end
                object btnExcluirGeral: TBitBtn
                  Left = 799
                  Top = 16
                  Width = 90
                  Height = 25
                  Hint = '[Ctrl + Del] - Excluir Item'
                  CustomHint = BalloonHint1
                  Caption = 'Excluir'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  OnClick = btnExcluirGeralClick
                end
                object btnCancelarGeral: TBitBtn
                  Left = 895
                  Top = 16
                  Width = 90
                  Height = 25
                  Hint = '[Esc] - Cancelar Item'
                  CustomHint = BalloonHint1
                  Caption = 'Cancelar'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                  OnClick = btnCancelarGeralClick
                end
              end
              object PageControl4: TPageControl
                Left = 1
                Top = 1
                Width = 998
                Height = 492
                ActivePage = tsEdicaoGeral
                Align = alClient
                TabOrder = 0
                object tsEdicaoGeral: TTabSheet
                  Caption = 'Edi'#231#227'o Geral'
                  object Panel29: TPanel
                    Left = 0
                    Top = 0
                    Width = 990
                    Height = 463
                    Align = alClient
                    BevelOuter = bvLowered
                    Font.Charset = ANSI_CHARSET
                    Font.Color = clWindowText
                    Font.Height = -12
                    Font.Name = 'Verdana'
                    Font.Style = []
                    ParentFont = False
                    TabOrder = 0
                    object btnVisualizarOcor: TSpeedButton
                      Left = 779
                      Top = 438
                      Width = 23
                      Height = 22
                      Hint = 'Visualizar Arquivo'
                      CustomHint = BalloonHint1
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btnVisualizarOcorClick
                    end
                    object btnAnexarOcor: TSpeedButton
                      Left = 755
                      Top = 438
                      Width = 23
                      Height = 22
                      Hint = 'Anexar Arquivo'
                      CustomHint = BalloonHint1
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btnAnexarOcorClick
                    end
                    object Label32: TLabel
                      Left = 14
                      Top = 419
                      Width = 39
                      Height = 14
                      Caption = 'Anexo'
                    end
                    object Label31: TLabel
                      Left = 14
                      Top = 57
                      Width = 72
                      Height = 14
                      Caption = 'Descri'#231#227'o *'
                    end
                    object Label28: TLabel
                      Left = 593
                      Top = 9
                      Width = 30
                      Height = 14
                      Caption = 'Data'
                    end
                    object Label29: TLabel
                      Left = 721
                      Top = 9
                      Width = 30
                      Height = 14
                      Caption = 'Hora'
                    end
                    object btnTipoGeral: TSpeedButton
                      Left = 906
                      Top = 29
                      Width = 23
                      Height = 22
                      Visible = False
                      OnClick = btnTipoGeralClick
                    end
                    object Label30: TLabel
                      Left = 801
                      Top = 11
                      Width = 38
                      Height = 14
                      Caption = 'Tipo *'
                      Visible = False
                    end
                    object Label27: TLabel
                      Left = 14
                      Top = 9
                      Width = 60
                      Height = 14
                      Caption = 'Operador'
                    end
                    object edtAnexoOcorrencia: TDBEdit
                      Left = 14
                      Top = 439
                      Width = 739
                      Height = 22
                      DataField = 'SOcor_Anexo'
                      DataSource = dsOcorrenciaGeral
                      TabOrder = 8
                      OnKeyDown = edtAnexoOcorrenciaKeyDown
                    end
                    object dbmDescricaoGeral: TDBMemo
                      Left = 14
                      Top = 72
                      Width = 979
                      Height = 342
                      DataField = 'SOcor_Descricao'
                      DataSource = dsOcorrenciaGeral
                      MaxLength = 2000
                      ScrollBars = ssVertical
                      TabOrder = 7
                      OnEnter = dbmDescricaoGeralEnter
                      OnExit = dbmDescricaoGeralExit
                      OnKeyDown = dbmDescricaoGeralKeyDown
                    end
                    object edtDataGeral: TDBEdit
                      Left = 593
                      Top = 29
                      Width = 122
                      Height = 22
                      DataField = 'SOcor_Data'
                      DataSource = dsOcorrenciaGeral
                      TabOrder = 3
                    end
                    object HoraGeral: TDBEdit
                      Left = 721
                      Top = 29
                      Width = 74
                      Height = 22
                      DataField = 'SOcor_Hora'
                      DataSource = dsOcorrenciaGeral
                      TabOrder = 4
                    end
                    object DBEdit23: TDBEdit
                      Left = 864
                      Top = 29
                      Width = 36
                      Height = 22
                      TabStop = False
                      Color = clSilver
                      DataField = 'Tip_Nome'
                      DataSource = dsOcorrenciaGeral
                      ReadOnly = True
                      TabOrder = 6
                      Visible = False
                    end
                    object edtCodTipoGeral: TDBEdit
                      Left = 801
                      Top = 29
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      DataField = 'Tip_Codigo'
                      DataSource = dsOcorrenciaGeral
                      ParentShowHint = False
                      ShowHint = True
                      TabOrder = 5
                      Visible = False
                      OnExit = edtCodTipoGeralExit
                      OnKeyDown = edtCodClienteKeyDown
                    end
                    object DBEdit15: TDBEdit
                      Left = 77
                      Top = 29
                      Width = 510
                      Height = 22
                      TabStop = False
                      Color = clSilver
                      DataField = 'Usu_Nome'
                      DataSource = dsOcorrenciaGeral
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object Edit1: TEdit
                      Left = 545
                      Top = 29
                      Width = 33
                      Height = 22
                      TabOrder = 2
                      Text = 'Edit1'
                    end
                    object edtCodOperGeral: TDBEdit
                      Left = 14
                      Top = 29
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      TabStop = False
                      Color = clSilver
                      DataField = 'Usu_Codigo'
                      DataSource = dsOcorrenciaGeral
                      ParentShowHint = False
                      ReadOnly = True
                      ShowHint = False
                      TabOrder = 0
                      OnKeyDown = edtCodClienteKeyDown
                    end
                  end
                end
                object tsPesquisaGeral: TTabSheet
                  Caption = 'Pesquisa'
                  ImageIndex = 1
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object Panel30: TPanel
                    Left = 0
                    Top = 0
                    Width = 990
                    Height = 463
                    Align = alClient
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object dbGeral: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 988
                      Height = 461
                      Align = alClient
                      DataSource = dsOcorrenciaGeral
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                      TabOrder = 0
                      TitleFont.Charset = ANSI_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -12
                      TitleFont.Name = 'Verdana'
                      TitleFont.Style = []
                      OnDrawColumnCell = dbGeralDrawColumnCell
                      OnKeyDown = dbGeralKeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'SOcor_Data'
                          Title.Caption = 'Data'
                          Width = 100
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'SOcor_Hora'
                          Title.Caption = 'Hora'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'Tip_Nome'
                          Title.Caption = 'Tipo'
                          Visible = False
                        end
                        item
                          Expanded = False
                          FieldName = 'Usu_Nome'
                          Title.Caption = 'Operador'
                          Width = 758
                          Visible = True
                        end>
                    end
                  end
                end
              end
            end
          end
          object tsOcorrenciaTecnica: TTabSheet
            Caption = 'Oco&rr'#234'ncia T'#233'cnica'
            ImageIndex = 4
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Verdana'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              object btnNovoTecnico: TBitBtn
                Left = 497
                Top = 503
                Width = 90
                Height = 25
                Hint = '[Insert] - Novo Item'
                CustomHint = BalloonHint1
                Caption = 'Novo'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                OnClick = btnNovoTecnicoClick
              end
              object btnExcluirTecnico: TBitBtn
                Left = 779
                Top = 503
                Width = 90
                Height = 25
                Hint = '[Ctrl + Del] - Excluir Item'
                CustomHint = BalloonHint1
                Caption = 'Excluir'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnClick = btnExcluirTecnicoClick
              end
              object btnCancelarTecnico: TBitBtn
                Left = 866
                Top = 503
                Width = 90
                Height = 25
                Hint = '[Esc] - Cancelar Item'
                CustomHint = BalloonHint1
                Caption = 'Cancelar'
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnClick = btnCancelarTecnicoClick
              end
              object btnSalvarTecnico: TBitBtn
                Left = 689
                Top = 503
                Width = 90
                Height = 25
                CustomHint = BalloonHint1
                Caption = 'Sa&lvar'
                Enabled = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 3
                OnClick = btnSalvarTecnicoClick
              end
              object btnEditarTecnico: TBitBtn
                Left = 593
                Top = 503
                Width = 90
                Height = 25
                Hint = '[F2] - Editar'
                CustomHint = BalloonHint1
                Caption = 'Editar'
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = btnEditarTecnicoClick
              end
              object PageControl3: TPageControl
                Left = 1
                Top = 1
                Width = 998
                Height = 496
                ActivePage = tsEdicaoTecnica
                Align = alTop
                TabOrder = 0
                object tsEdicaoTecnica: TTabSheet
                  Caption = 'Edi'#231#227'o T'#233'cnica'
                  object Panel23: TPanel
                    Left = 0
                    Top = 0
                    Width = 990
                    Height = 467
                    Align = alClient
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object Label33: TLabel
                      Left = 10
                      Top = 33
                      Width = 60
                      Height = 14
                      Caption = 'Operador'
                    end
                    object Label37: TLabel
                      Left = 714
                      Top = 33
                      Width = 30
                      Height = 14
                      Caption = 'Hora'
                    end
                    object Label36: TLabel
                      Left = 586
                      Top = 33
                      Width = 30
                      Height = 14
                      Caption = 'Data'
                    end
                    object Label38: TLabel
                      Left = 10
                      Top = 81
                      Width = 72
                      Height = 14
                      Caption = 'Descri'#231#227'o *'
                    end
                    object Label34: TLabel
                      Left = 14
                      Top = 421
                      Width = 39
                      Height = 14
                      Caption = 'Anexo'
                    end
                    object btnAnexarTecnico: TSpeedButton
                      Left = 755
                      Top = 441
                      Width = 23
                      Height = 22
                      Hint = 'Anexar Arquivo'
                      CustomHint = BalloonHint1
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btnAnexarTecnicoClick
                    end
                    object btnVisualizarTecnico: TSpeedButton
                      Left = 779
                      Top = 441
                      Width = 23
                      Height = 22
                      Hint = 'Visualizar Arquivo'
                      CustomHint = BalloonHint1
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btnVisualizarTecnicoClick
                    end
                    object edtCodOperTecnico: TDBEdit
                      Left = 10
                      Top = 53
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      TabStop = False
                      Color = clSilver
                      DataField = 'Usu_Codigo'
                      DataSource = dsOcorrenciaTecnica
                      ParentShowHint = False
                      ReadOnly = True
                      ShowHint = False
                      TabOrder = 1
                      OnKeyDown = edtCodClienteKeyDown
                    end
                    object DBEdit22: TDBEdit
                      Left = 69
                      Top = 53
                      Width = 511
                      Height = 22
                      TabStop = False
                      Color = clSilver
                      DataField = 'Usu_Nome'
                      DataSource = dsOcorrenciaTecnica
                      ReadOnly = True
                      TabOrder = 2
                    end
                    object Edit2: TEdit
                      Left = 516
                      Top = 53
                      Width = 56
                      Height = 22
                      TabOrder = 3
                      Text = 'Edit2'
                    end
                    object edtHoraTecnica: TDBEdit
                      Left = 719
                      Top = 53
                      Width = 74
                      Height = 22
                      DataField = 'SOcor_Hora'
                      DataSource = dsOcorrenciaTecnica
                      TabOrder = 5
                    end
                    object edtDataTecnica: TDBEdit
                      Left = 586
                      Top = 53
                      Width = 122
                      Height = 22
                      DataField = 'SOcor_Data'
                      DataSource = dsOcorrenciaTecnica
                      TabOrder = 4
                    end
                    object edtAnexoTecnico: TDBEdit
                      Left = 10
                      Top = 441
                      Width = 739
                      Height = 22
                      DataField = 'SOcor_Anexo'
                      DataSource = dsOcorrenciaTecnica
                      TabOrder = 7
                      OnKeyDown = edtAnexoTecnicoKeyDown
                    end
                    object Panel27: TPanel
                      Left = 1
                      Top = 1
                      Width = 988
                      Height = 32
                      Align = alTop
                      BevelOuter = bvLowered
                      Font.Charset = ANSI_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -12
                      Font.Name = 'Verdana'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 0
                      object lblSolicitacaoTecnica: TLabel
                        Left = 848
                        Top = 8
                        Width = 138
                        Height = 14
                        Alignment = taRightJustify
                        Caption = 'lblSolicitacaoTecnica'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -12
                        Font.Name = 'Verdana'
                        Font.Style = [fsBold]
                        ParentFont = False
                      end
                      object btnFormatarTecnico: TBitBtn
                        Left = 1
                        Top = 1
                        Width = 152
                        Height = 30
                        Hint = 'Formata'#231#227'o'
                        Align = alLeft
                        Caption = 'Formatar Texto'
                        Font.Charset = ANSI_CHARSET
                        Font.Color = clWindowText
                        Font.Height = -19
                        Font.Name = 'Bell MT'
                        Font.Style = [fsBold]
                        ParentFont = False
                        ParentShowHint = False
                        ShowHint = True
                        TabOrder = 0
                        TabStop = False
                        OnClick = btnFormatarTecnicoClick
                      end
                    end
                    object EditorTecnico2: TDBRichEdit
                      Left = 10
                      Top = 96
                      Width = 975
                      Height = 319
                      DataField = 'SOcor_Descricao'
                      DataSource = dsOcorrenciaTecnica
                      ParentFont = True
                      ScrollBars = ssVertical
                      TabOrder = 6
                      OnEnter = EditorTecnico2Enter
                      OnExit = EditorTecnico2Exit
                      OnKeyDown = EditorTecnico2KeyDown
                    end
                  end
                end
                object tsPesquisaTecnica: TTabSheet
                  Caption = 'Pesquisa'
                  ImageIndex = 1
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object Panel26: TPanel
                    Left = 0
                    Top = 0
                    Width = 990
                    Height = 467
                    Align = alClient
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object dbTecnica: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 988
                      Height = 465
                      Align = alClient
                      DataSource = dsOcorrenciaTecnica
                      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                      TabOrder = 0
                      TitleFont.Charset = ANSI_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -12
                      TitleFont.Name = 'Verdana'
                      TitleFont.Style = []
                      OnCellClick = dbTecnicaCellClick
                      OnDrawColumnCell = dbTecnicaDrawColumnCell
                      OnKeyDown = dbTecnicaKeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'SOcor_Data'
                          Title.Caption = 'Data'
                          Width = 104
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'SOcor_Hora'
                          Title.Caption = 'Hora'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'Tip_Nome'
                          Title.Caption = 'Tipo'
                          Visible = False
                        end
                        item
                          Expanded = False
                          FieldName = 'Usu_Nome'
                          Title.Caption = 'Operador'
                          Width = 754
                          Visible = True
                        end>
                    end
                  end
                end
              end
            end
          end
          object tsOcorrenciaRegra: TTabSheet
            Caption = 'Ocorr'#234'ncia Regras'
            ImageIndex = 5
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Panel34: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object PageControl5: TPageControl
                Left = 1
                Top = 1
                Width = 998
                Height = 492
                ActivePage = tsEdicaoRegra
                Align = alClient
                TabOrder = 0
                object tsEdicaoRegra: TTabSheet
                  Caption = 'Edi'#231#227'o Regra'
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object Panel36: TPanel
                    Left = 0
                    Top = 0
                    Width = 990
                    Height = 463
                    Align = alClient
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object Label45: TLabel
                      Left = 14
                      Top = 9
                      Width = 60
                      Height = 14
                      Caption = 'Operador'
                    end
                    object Label46: TLabel
                      Left = 593
                      Top = 9
                      Width = 30
                      Height = 14
                      Caption = 'Data'
                    end
                    object Label47: TLabel
                      Left = 721
                      Top = 9
                      Width = 30
                      Height = 14
                      Caption = 'Hora'
                    end
                    object Label48: TLabel
                      Left = 14
                      Top = 57
                      Width = 72
                      Height = 14
                      Caption = 'Descri'#231#227'o *'
                    end
                    object Label49: TLabel
                      Left = 14
                      Top = 419
                      Width = 39
                      Height = 14
                      Caption = 'Anexo'
                    end
                    object btnAnexarRegra: TSpeedButton
                      Left = 755
                      Top = 438
                      Width = 23
                      Height = 22
                      Hint = 'Anexar Arquivo'
                      CustomHint = BalloonHint1
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btnAnexarRegraClick
                    end
                    object btnVisualizarOcorrenciaRegra: TSpeedButton
                      Left = 779
                      Top = 438
                      Width = 23
                      Height = 22
                      Hint = 'Visualizar Arquivo'
                      CustomHint = BalloonHint1
                      ParentShowHint = False
                      ShowHint = True
                      OnClick = btnVisualizarOcorrenciaRegraClick
                    end
                    object edtCodOperRegra: TDBEdit
                      Left = 14
                      Top = 29
                      Width = 57
                      Height = 22
                      Hint = '[F9] - Pesquisar'
                      CustomHint = BalloonHint1
                      TabStop = False
                      Color = clSilver
                      DataField = 'Usu_Codigo'
                      DataSource = dsOcorrenciaRegra
                      ParentShowHint = False
                      ReadOnly = True
                      ShowHint = False
                      TabOrder = 0
                    end
                    object edtDataRegra: TDBEdit
                      Left = 593
                      Top = 29
                      Width = 122
                      Height = 22
                      DataField = 'SOcor_Data'
                      DataSource = dsOcorrenciaRegra
                      TabOrder = 2
                    end
                    object edtHoraRegra: TDBEdit
                      Left = 721
                      Top = 29
                      Width = 74
                      Height = 22
                      DataField = 'SOcor_Hora'
                      DataSource = dsOcorrenciaRegra
                      TabOrder = 3
                    end
                    object dbmDescricaoRegra: TDBMemo
                      Left = 14
                      Top = 72
                      Width = 979
                      Height = 342
                      DataField = 'SOcor_Descricao'
                      DataSource = dsOcorrenciaRegra
                      MaxLength = 3000
                      ScrollBars = ssVertical
                      TabOrder = 4
                      OnEnter = dbmDescricaoRegraEnter
                      OnExit = dbmDescricaoRegraExit
                      OnKeyDown = dbmDescricaoRegraKeyDown
                    end
                    object edtAnexoOcorrenciaRegra: TDBEdit
                      Left = 14
                      Top = 439
                      Width = 739
                      Height = 22
                      DataField = 'SOcor_Anexo'
                      DataSource = dsOcorrenciaRegra
                      TabOrder = 5
                      OnKeyDown = edtAnexoOcorrenciaRegraKeyDown
                    end
                    object DBEdit12: TDBEdit
                      Left = 77
                      Top = 29
                      Width = 510
                      Height = 22
                      TabStop = False
                      Color = clSilver
                      DataField = 'Usu_Nome'
                      DataSource = dsOcorrenciaRegra
                      ReadOnly = True
                      TabOrder = 1
                    end
                    object Edit3: TEdit
                      Left = 546
                      Top = 29
                      Width = 33
                      Height = 22
                      TabOrder = 6
                      Text = 'Edit1'
                    end
                  end
                end
                object tsPesquisaRegra: TTabSheet
                  Caption = 'Pesquisa'
                  ImageIndex = 1
                  ExplicitLeft = 0
                  ExplicitTop = 0
                  ExplicitWidth = 0
                  ExplicitHeight = 0
                  object Panel37: TPanel
                    Left = 0
                    Top = 0
                    Width = 990
                    Height = 463
                    Align = alClient
                    BevelOuter = bvLowered
                    TabOrder = 0
                    object dbRegras: TDBGrid
                      Left = 1
                      Top = 1
                      Width = 988
                      Height = 461
                      Align = alClient
                      DataSource = dsOcorrenciaRegra
                      TabOrder = 0
                      TitleFont.Charset = ANSI_CHARSET
                      TitleFont.Color = clWindowText
                      TitleFont.Height = -12
                      TitleFont.Name = 'Verdana'
                      TitleFont.Style = []
                      OnDrawColumnCell = dbRegrasDrawColumnCell
                      OnKeyDown = dbRegrasKeyDown
                      Columns = <
                        item
                          Expanded = False
                          FieldName = 'SOcor_Data'
                          Title.Caption = 'Data'
                          Width = 104
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'SOcor_Hora'
                          Title.Caption = 'Hora'
                          Visible = True
                        end
                        item
                          Expanded = False
                          FieldName = 'Tip_Nome'
                          Visible = False
                        end
                        item
                          Expanded = False
                          FieldName = 'Usu_Nome'
                          Title.Caption = 'Operador'
                          Width = 754
                          Visible = True
                        end>
                    end
                  end
                end
              end
              object Panel35: TPanel
                Left = 1
                Top = 493
                Width = 998
                Height = 41
                Align = alBottom
                BevelInner = bvLowered
                TabOrder = 1
                object btnNovoRegra: TBitBtn
                  Left = 504
                  Top = 6
                  Width = 90
                  Height = 25
                  Caption = 'Novo'
                  TabOrder = 0
                  OnClick = btnNovoRegraClick
                end
                object btnEditarRegra: TBitBtn
                  Left = 600
                  Top = 6
                  Width = 90
                  Height = 25
                  Caption = 'Editar'
                  Enabled = False
                  TabOrder = 1
                  OnClick = btnEditarRegraClick
                end
                object btnSalvarRegra: TBitBtn
                  Left = 696
                  Top = 6
                  Width = 90
                  Height = 25
                  Caption = 'Salvar'
                  Enabled = False
                  TabOrder = 2
                  OnClick = btnSalvarRegraClick
                end
                object btnExcluirRegra: TBitBtn
                  Left = 792
                  Top = 6
                  Width = 90
                  Height = 25
                  Caption = 'Excluir'
                  TabOrder = 3
                  OnClick = btnExcluirRegraClick
                end
                object btnCancelarRegra: TBitBtn
                  Left = 888
                  Top = 6
                  Width = 90
                  Height = 25
                  Caption = 'Cancelar'
                  Enabled = False
                  TabOrder = 4
                  OnClick = btnCancelarRegraClick
                end
              end
            end
          end
          object tsStatus: TTabSheet
            Caption = 'S&tatus'
            ImageIndex = 3
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object dbStatus: TDBGrid
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                    FieldName = 'SSta_Data'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SSta_Hora'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Sta_Nome'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Usu_nome'
                    Width = 357
                    Visible = True
                  end>
              end
            end
          end
        end
      end
      inherited Panel4: TPanel
        Top = 566
        Width = 1010
        ExplicitTop = 566
        ExplicitWidth = 1010
        inherited btnSalvar: TBitBtn
          Left = 2
          Top = 5
          Enabled = True
          ExplicitLeft = 2
          ExplicitTop = 5
        end
        inherited btnCancelar: TBitBtn
          Left = 98
          ExplicitLeft = 98
        end
        object btnDetalhes: TBitBtn
          Left = 191
          Top = 6
          Width = 90
          Height = 25
          Caption = 'Detalhes'
          TabOrder = 2
          OnClick = btnDetalhesClick
        end
        object btnBuscarCliente: TBitBtn
          Left = 282
          Top = 6
          Width = 90
          Height = 25
          Caption = 'Clientes'
          TabOrder = 3
          TabStop = False
          OnClick = btnBuscarClienteClick
        end
        object btnListarAnexo2: TBitBtn
          Left = 373
          Top = 6
          Width = 90
          Height = 25
          Caption = 'Anexos'
          TabOrder = 4
          OnClick = btnListarAnexo2Click
        end
      end
    end
    inherited tsFiltro: TTabSheet
      OnShow = tsFiltroShow
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 607
      inherited Panel5: TPanel
        Width = 1010
        Height = 566
        ExplicitWidth = 1010
        ExplicitHeight = 566
        inherited PageControl2: TPageControl
          Width = 1008
          Height = 564
          Align = alBottom
          ExplicitWidth = 1008
          ExplicitHeight = 564
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 1000
            ExplicitHeight = 535
            inherited pnlGeral: TPanel
              Width = 1000
              Height = 535
              ExplicitWidth = 1000
              ExplicitHeight = 535
              inherited Situação: TLabel
                Left = 264
                Top = 112
                Visible = False
                ExplicitLeft = 264
                ExplicitTop = 112
              end
              object Label39: TLabel [1]
                Left = 17
                Top = 64
                Width = 70
                Height = 14
                Caption = 'Data Inicial'
              end
              object Label40: TLabel [2]
                Left = 17
                Top = 112
                Width = 63
                Height = 14
                Caption = 'Data Final'
              end
              object Label41: TLabel [3]
                Left = 17
                Top = 15
                Width = 30
                Height = 14
                Caption = 'N'#237'vel'
              end
              object lbl1: TLabel [4]
                Left = 128
                Top = 112
                Width = 13
                Height = 14
                Caption = 'Id'
              end
              inherited cbbSituacao: TComboBox
                Left = 264
                Top = 132
                Width = 62
                TabOrder = 4
                Visible = False
                ExplicitLeft = 264
                ExplicitTop = 132
                ExplicitWidth = 62
              end
              object edtDataInicial: TMaskEdit
                Left = 17
                Top = 84
                Width = 89
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object edtDataFinal: TMaskEdit
                Left = 17
                Top = 132
                Width = 89
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
              end
              object cbbNivel: TComboBox
                Left = 17
                Top = 35
                Width = 145
                Height = 22
                Style = csDropDownList
                ItemIndex = 4
                TabOrder = 0
                Text = 'Todos'
                Items.Strings = (
                  'Baixo'
                  'Normal'
                  'Alto'
                  'Cr'#237'tico'
                  'Todos')
              end
              object GroupBox2: TGroupBox
                Left = 17
                Top = 176
                Width = 976
                Height = 358
                Anchors = [akLeft, akTop, akRight, akBottom]
                Caption = 'Relat'#243'rios:'
                TabOrder = 5
                object Label35: TLabel
                  Left = 13
                  Top = 32
                  Width = 52
                  Height = 14
                  Caption = 'Modelos'
                end
                object cbbModelo: TComboBox
                  Left = 13
                  Top = 52
                  Width = 340
                  Height = 22
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 0
                  Text = '01 - Relat'#243'rio Anal'#237'tico'
                  OnClick = cbbModeloClick
                  Items.Strings = (
                    '01 - Relat'#243'rio Anal'#237'tico'
                    '02 - Relat'#243'rio por Tipo'
                    '03 - Relat'#243'rio por Status e Produtos')
                end
                object chkMostrarTempo: TCheckBox
                  Left = 13
                  Top = 84
                  Width = 121
                  Height = 17
                  Caption = 'Mostrar Tempo'
                  TabOrder = 1
                end
              end
              object edtIdFiltro: TEdit
                Left = 128
                Top = 132
                Width = 81
                Height = 22
                Alignment = taCenter
                NumbersOnly = True
                TabOrder = 3
                OnExit = edtIdFiltroExit
              end
            end
          end
          object tsFiltroUsuario: TTabSheet
            Caption = 'Usu'#225'rio Abertura'
            ImageIndex = 2
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraUsuario: TFraColaborador
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 485
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
                      Width = 869
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
            object Panel12: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraCliente: TFraCliente
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbCliente: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 485
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
                      Width = 870
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
            ImageIndex = 3
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraModulo: TFraModulo
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 485
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
                      Width = 871
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsFiltroAnalista: TTabSheet
            Caption = 'Analista'
            ImageIndex = 5
            object Panel16: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraAnalista: TFraAnalista
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 485
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Title.Caption = 'C'#243'digo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 869
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
            ImageIndex = 6
            object Panel17: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraTipo: TFraTipo
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
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
                  Top = 48
                  Width = 998
                  Height = 485
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
                      Width = 870
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
            ImageIndex = 10
            object Panel18: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraStatus: TFraStatus
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
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
                  Top = 48
                  Width = 998
                  Height = 485
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
                      Width = 870
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsFiltroDesenv: TTabSheet
            Caption = 'Desenvolvedor'
            ImageIndex = 8
            object Panel19: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraDesenvolvedor: TFraDesenvolvedor
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 485
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
                      Width = 870
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsFiltroOperador: TTabSheet
            Caption = 'Operador'
            ImageIndex = 9
            object Panel20: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraOperador: TFraOperador
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 485
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
                      Width = 864
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsColaborador: TTabSheet
            Caption = 'Colaborador'
            ImageIndex = 9
            object Panel32: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraColaborador: TFraColaborador
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 485
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 864
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsVersao: TTabSheet
            Caption = 'Vers'#227'o'
            ImageIndex = 10
            object Panel33: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraVersao: TFraVersao
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 485
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Title.Caption = 'C'#243'digo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 869
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsCategoria: TTabSheet
            Caption = 'Categoria'
            ImageIndex = 11
            object Panel38: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 535
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraCategoria: TFraCategoria
                Left = 1
                Top = 1
                Width = 998
                Height = 533
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
                ExplicitHeight = 533
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 485
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Title.Caption = 'C'#243'digo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 869
                      Visible = True
                    end>
                end
              end
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 566
        Width = 1010
        ExplicitTop = 566
        ExplicitWidth = 1010
        inherited btnFiltro: TBitBtn
          TabOrder = 1
        end
        inherited btnImprimir: TBitBtn
          Left = 98
          TabOrder = 0
          OnClick = btnImprimirClick
          ExplicitLeft = 98
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    Left = 804
    Top = 17
  end
  inherited dsCad: TDataSource
    Left = 632
    Top = 224
  end
  inherited BalloonHint1: TBalloonHint
    Left = 924
    Top = 41
  end
  object dlgAbrirArquivo: TOpenDialog
    Left = 881
    Top = 15
  end
  object dlgSalvarArquivo: TSaveDialog
    Left = 865
    Top = 15
  end
  object dsCronograma: TDataSource
    AutoEdit = False
    OnStateChange = dsCronogramaStateChange
    Left = 921
    Top = 203
  end
  object dsOcorrenciaGeral: TDataSource
    AutoEdit = False
    OnStateChange = dsOcorrenciaGeralStateChange
    Left = 369
    Top = 107
  end
  object dsOcorrenciaTecnica: TDataSource
    AutoEdit = False
    OnStateChange = dsOcorrenciaTecnicaStateChange
    Left = 369
    Top = 155
  end
  object dsStatus: TDataSource
    Left = 857
    Top = 195
  end
  object pmConsulta: TPopupMenu
    Left = 508
    Top = 177
    object EnviarEmail1: TMenuItem
      Caption = 'Enviar Email'
      OnClick = EnviarEmail1Click
    end
    object pmTempo: TMenuItem
      Caption = 'Tempo'
      OnClick = pmTempoClick
    end
    object pmConferenciaTempo: TMenuItem
      Caption = 'Confer'#234'ncia de Tempos'
      OnClick = pmConferenciaTempoClick
    end
  end
  object dsOcorrenciaRegra: TDataSource
    AutoEdit = False
    OnStateChange = dsOcorrenciaRegraStateChange
    Left = 366
    Top = 205
  end
end
