inherited frmCliente: TfrmCliente
  Tag = 103
  Caption = 'Clientes'
  ClientHeight = 634
  ClientWidth = 1018
  OnDestroy = FormDestroy
  ExplicitTop = -268
  ExplicitWidth = 1024
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 1018
    Height = 634
    ParentFont = False
    ExplicitWidth = 1018
    ExplicitHeight = 634
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 605
      inherited Panel1: TPanel
        Width = 1010
        Height = 564
        ExplicitWidth = 1010
        ExplicitHeight = 564
        inherited GroupBox1: TGroupBox
          Width = 1008
          ExplicitWidth = 1008
        end
        inherited dbDados: TDBGrid
          Width = 1008
          Height = 506
          DataSource = dsPesquisa
          PopupMenu = pm1
          Columns = <
            item
              Expanded = False
              FieldName = 'Cli_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Cli_Codigo'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Nome'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Fantasia'
              Width = 128
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Dcto'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Perfil'
              Title.Alignment = taCenter
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Fone1'
              Title.Caption = 'Telefone'
              Width = 126
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_Nome'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Rev_Nome'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Enquadramento'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cli_Versao'
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 564
        Width = 1010
        ExplicitTop = 564
        ExplicitWidth = 1010
        object lblRegistros: TLabel [0]
          Left = 932
          Top = 16
          Width = 73
          Height = 14
          Alignment = taRightJustify
          Caption = 'lblRegistros'
        end
        inherited btnNovo: TBitBtn
          TabOrder = 4
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
          Left = 582
          TabOrder = 9
          ExplicitLeft = 582
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
        object btnEspecificacao: TBitBtn
          Left = 493
          Top = 6
          Width = 90
          Height = 25
          Hint = 'Especifica'#231#245'es'
          CustomHint = BalloonHint1
          Caption = 'E&specif.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = btnEspecificacaoClick
        end
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 605
      inherited Panel3: TPanel
        Width = 1010
        Height = 564
        ExplicitWidth = 1010
        ExplicitHeight = 564
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 1008
          Height = 562
          ActivePage = tsPrincipal
          Align = alClient
          TabOrder = 0
          OnChange = PageControl1Change
          object tsPrincipal: TTabSheet
            Caption = '&Principal'
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 533
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label4: TLabel
                Left = 16
                Top = 8
                Width = 56
                Height = 14
                Caption = 'C'#243'digo *'
              end
              object Label5: TLabel
                Left = 101
                Top = 8
                Width = 91
                Height = 14
                Caption = 'Raz'#227'o Social *'
              end
              object Label6: TLabel
                Left = 16
                Top = 56
                Width = 93
                Height = 14
                Caption = 'Nome Fantasia'
              end
              object Label7: TLabel
                Left = 16
                Top = 104
                Width = 72
                Height = 14
                Caption = 'CNPJ/CPF *'
              end
              object Label8: TLabel
                Left = 16
                Top = 152
                Width = 59
                Height = 14
                Caption = 'Endere'#231'o'
              end
              object Label9: TLabel
                Left = 16
                Top = 284
                Width = 43
                Height = 14
                Caption = 'Fone 1'
              end
              object Label11: TLabel
                Left = 551
                Top = 8
                Width = 61
                Height = 14
                Caption = 'Consultor'
              end
              object Label12: TLabel
                Left = 551
                Top = 56
                Width = 67
                Height = 14
                Caption = 'Revenda *'
              end
              object btnUsuario: TSpeedButton
                Left = 966
                Top = 28
                Width = 23
                Height = 22
                OnClick = btnUsuarioClick
              end
              object btnRevenda: TSpeedButton
                Left = 966
                Top = 70
                Width = 23
                Height = 22
                OnClick = btnRevendaClick
              end
              object Label14: TLabel
                Left = 352
                Top = 103
                Width = 79
                Height = 14
                Caption = 'Vers'#227'o Atual'
              end
              object Label15: TLabel
                Left = 16
                Top = 200
                Width = 37
                Height = 14
                Caption = 'Bairro'
              end
              object Label19: TLabel
                Left = 16
                Top = 242
                Width = 44
                Height = 14
                Caption = 'Cidade'
              end
              object Label20: TLabel
                Left = 359
                Top = 242
                Width = 25
                Height = 14
                Caption = 'CEP'
              end
              object Label21: TLabel
                Left = 479
                Top = 242
                Width = 16
                Height = 14
                Caption = 'UF'
              end
              object Label22: TLabel
                Left = 151
                Top = 284
                Width = 43
                Height = 14
                Caption = 'Fone 2'
              end
              object Label23: TLabel
                Left = 279
                Top = 284
                Width = 44
                Height = 14
                Caption = 'Celular'
              end
              object Label24: TLabel
                Left = 405
                Top = 284
                Width = 93
                Height = 14
                Caption = 'Outro Telefone'
              end
              object Label28: TLabel
                Left = 198
                Top = 103
                Width = 115
                Height = 14
                Caption = 'Inscri'#231#227'o Estadual'
              end
              object btnCidade: TSpeedButton
                Left = 330
                Top = 256
                Width = 23
                Height = 22
                OnClick = btnCidadeClick
              end
              object Label33: TLabel
                Left = 352
                Top = 56
                Width = 31
                Height = 14
                Caption = 'Perfil'
              end
              object edtCodigo: TDBEdit
                Left = 16
                Top = 28
                Width = 79
                Height = 22
                DataField = 'Cli_Codigo'
                DataSource = dsCad
                TabOrder = 0
                StyleElements = [seFont, seBorder]
              end
              object edtNome: TDBEdit
                Left = 101
                Top = 28
                Width = 425
                Height = 22
                DataField = 'Cli_Nome'
                DataSource = dsCad
                TabOrder = 1
              end
              object DBEdit1: TDBEdit
                Left = 16
                Top = 76
                Width = 330
                Height = 22
                DataField = 'Cli_Fantasia'
                DataSource = dsCad
                TabOrder = 2
              end
              object edtCNPJ: TDBEdit
                Left = 16
                Top = 124
                Width = 176
                Height = 22
                DataField = 'Cli_Dcto'
                DataSource = dsCad
                TabOrder = 4
                OnExit = edtCNPJExit
              end
              object DBRadioGroup1: TDBRadioGroup
                Left = 551
                Top = 254
                Width = 438
                Height = 81
                Caption = 'Enquadramento:'
                DataField = 'Cli_Enquadramento'
                DataSource = dsCad
                Items.Strings = (
                  'Simples'
                  'Lucro Presumido'
                  'Lucro Real'
                  'N'#227'o Definido')
                TabOrder = 24
                Values.Strings = (
                  '01'
                  '02'
                  '03'
                  '00')
              end
              object edtUsuario: TDBEdit
                Left = 551
                Top = 28
                Width = 51
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Usu_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 19
                OnExit = edtUsuarioExit
                OnKeyDown = edtUsuarioKeyDown
              end
              object DBEdit6: TDBEdit
                Left = 608
                Top = 28
                Width = 352
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 20
              end
              object edtRevenda: TDBEdit
                Left = 551
                Top = 70
                Width = 51
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Rev_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 21
                OnExit = edtRevendaExit
                OnKeyDown = edtUsuarioKeyDown
              end
              object DBEdit8: TDBEdit
                Left = 608
                Top = 70
                Width = 352
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Rev_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 22
              end
              object GroupBox4: TGroupBox
                Left = 665
                Top = 480
                Width = 101
                Height = 59
                Caption = 'Op'#231#245'es:'
                TabOrder = 25
                Visible = False
                object DBCheckBox1: TDBCheckBox
                  Left = 3
                  Top = 23
                  Width = 97
                  Height = 17
                  Caption = 'Restri'#231#227'o'
                  DataField = 'Cli_Restricao'
                  DataSource = dsCad
                  TabOrder = 0
                end
              end
              object Ativo: TDBCheckBox
                Left = 19
                Top = 515
                Width = 97
                Height = 17
                Caption = 'Ativo'
                DataField = 'Cli_Ativo'
                DataSource = dsCad
                TabOrder = 26
              end
              object DBEdit2: TDBEdit
                Left = 352
                Top = 123
                Width = 174
                Height = 22
                DataField = 'Cli_Versao'
                DataSource = dsCad
                TabOrder = 6
              end
              object DBEdit3: TDBEdit
                Left = 16
                Top = 172
                Width = 510
                Height = 22
                DataField = 'Cli_Logradouro'
                DataSource = dsCad
                TabOrder = 7
              end
              object DBEdit5: TDBEdit
                Left = 16
                Top = 214
                Width = 510
                Height = 22
                DataField = 'Cli_Bairro'
                DataSource = dsCad
                TabOrder = 8
              end
              object edtCodCidade: TDBEdit
                Left = 16
                Top = 256
                Width = 79
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Cid_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                OnExit = edtCodCidadeExit
                OnKeyDown = edtUsuarioKeyDown
              end
              object DBEdit10: TDBEdit
                Left = 101
                Top = 256
                Width = 227
                Height = 22
                TabStop = False
                DataField = 'Cid_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 10
              end
              object DBEdit12: TDBEdit
                Left = 359
                Top = 256
                Width = 114
                Height = 22
                DataField = 'Cli_CEP'
                DataSource = dsCad
                TabOrder = 11
              end
              object DBEdit13: TDBEdit
                Left = 479
                Top = 256
                Width = 47
                Height = 22
                TabStop = False
                DataField = 'Cid_UF'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 12
              end
              object DBEdit4: TDBEdit
                Left = 16
                Top = 304
                Width = 129
                Height = 22
                DataField = 'Cli_Fone1'
                DataSource = dsCad
                TabOrder = 13
              end
              object DBEdit14: TDBEdit
                Left = 151
                Top = 304
                Width = 122
                Height = 22
                DataField = 'Cli_Fone2'
                DataSource = dsCad
                TabOrder = 14
              end
              object DBEdit15: TDBEdit
                Left = 279
                Top = 304
                Width = 120
                Height = 22
                DataField = 'Cli_Celular'
                DataSource = dsCad
                TabOrder = 15
              end
              object DBEdit16: TDBEdit
                Left = 405
                Top = 304
                Width = 121
                Height = 22
                DataField = 'Cli_FoneOutro'
                DataSource = dsCad
                TabOrder = 16
              end
              object DBEdit21: TDBEdit
                Left = 198
                Top = 123
                Width = 148
                Height = 22
                DataField = 'Cli_IE'
                DataSource = dsCad
                TabOrder = 5
              end
              object GroupBox5: TGroupBox
                Left = 16
                Top = 342
                Width = 510
                Height = 77
                Caption = 'Contato Financeiro:'
                TabOrder = 17
                object Label10: TLabel
                  Left = 3
                  Top = 28
                  Width = 36
                  Height = 14
                  Caption = 'Nome'
                end
                object Label25: TLabel
                  Left = 335
                  Top = 28
                  Width = 53
                  Height = 14
                  Caption = 'Telefone'
                end
                object DBEdit17: TDBEdit
                  Left = 3
                  Top = 48
                  Width = 326
                  Height = 22
                  DataField = 'Cli_ContatoFinanceiro'
                  DataSource = dsCad
                  TabOrder = 0
                end
                object DBEdit18: TDBEdit
                  Left = 335
                  Top = 48
                  Width = 162
                  Height = 22
                  DataField = 'Cli_ContatoFinanceiroFone'
                  DataSource = dsCad
                  TabOrder = 1
                end
              end
              object GroupBox6: TGroupBox
                Left = 16
                Top = 425
                Width = 510
                Height = 72
                Caption = 'Contato Compra/Venda:'
                TabOrder = 18
                object Label29: TLabel
                  Left = 3
                  Top = 20
                  Width = 36
                  Height = 14
                  Caption = 'Nome'
                end
                object Label30: TLabel
                  Left = 335
                  Top = 20
                  Width = 53
                  Height = 14
                  Caption = 'Telefone'
                end
                object DBEdit22: TDBEdit
                  Left = 3
                  Top = 40
                  Width = 326
                  Height = 22
                  DataField = 'Cli_ContatoCompraVenda'
                  DataSource = dsCad
                  TabOrder = 0
                end
                object DBEdit23: TDBEdit
                  Left = 335
                  Top = 40
                  Width = 162
                  Height = 22
                  DataField = 'Cli_ContatoCompraVendaFone'
                  DataSource = dsCad
                  TabOrder = 1
                end
              end
              object GroupBox7: TGroupBox
                Left = 551
                Top = 98
                Width = 438
                Height = 150
                Caption = 'Representante Legal:'
                TabOrder = 23
                object Label26: TLabel
                  Left = 16
                  Top = 28
                  Width = 36
                  Height = 14
                  Caption = 'Nome'
                end
                object Label27: TLabel
                  Left = 16
                  Top = 76
                  Width = 24
                  Height = 14
                  Caption = 'CPF'
                end
                object Label32: TLabel
                  Left = 290
                  Top = 76
                  Width = 119
                  Height = 14
                  Caption = 'Empresa Vinculada'
                end
                object DBEdit7: TDBEdit
                  Left = 14
                  Top = 48
                  Width = 395
                  Height = 22
                  DataField = 'Cli_RepreLegal'
                  DataSource = dsCad
                  TabOrder = 0
                end
                object DBEdit19: TDBEdit
                  Left = 14
                  Top = 96
                  Width = 207
                  Height = 22
                  DataField = 'Cli_RepreLegalCPF'
                  DataSource = dsCad
                  TabOrder = 1
                end
                object DBEdit20: TDBEdit
                  Left = 227
                  Top = 96
                  Width = 182
                  Height = 22
                  DataField = 'Cli_EmpresaVinculada'
                  DataSource = dsCad
                  TabOrder = 2
                end
              end
              object dbContatos: TDBGrid
                Left = 550
                Top = 341
                Width = 443
                Height = 156
                DataSource = dsContato
                TabOrder = 27
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnDrawColumnCell = dbContatosDrawColumnCell
                OnEnter = dbContatosEnter
                OnExit = dbContatosExit
                OnKeyDown = dbContatosKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'Cont_Nome'
                    Title.Caption = 'Nome do Contato'
                    Width = 179
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Cont_Fone1'
                    Width = 109
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Cont_Fone2'
                    Width = 111
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Cont_Depto'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'Cont_Email'
                    Width = 64
                    Visible = True
                  end>
              end
              object DBEdit24: TDBEdit
                Left = 352
                Top = 75
                Width = 174
                Height = 22
                DataField = 'Cli_Perfil'
                DataSource = dsCad
                TabOrder = 3
              end
            end
          end
          object tsEmail: TTabSheet
            Caption = 'Em&ails'
            ImageIndex = 1
            OnShow = tsEmailShow
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 533
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object GroupBox2: TGroupBox
                Left = 1
                Top = 1
                Width = 998
                Height = 531
                Align = alClient
                TabOrder = 0
                object Label17: TLabel
                  Left = 16
                  Top = 392
                  Width = 45
                  Height = 14
                  Caption = 'Email *'
                end
                object dbEmail: TDBGrid
                  Left = 2
                  Top = 16
                  Width = 994
                  Height = 360
                  Align = alTop
                  DataSource = dsEmail
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  TabOrder = 0
                  TitleFont.Charset = ANSI_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = 'Verdana'
                  TitleFont.Style = []
                  OnCellClick = dbEmailCellClick
                  OnDrawColumnCell = dbEmailDrawColumnCell
                  OnKeyDown = dbEmailKeyDown
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'CliEm_Id'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'CliEm_Email'
                      Title.Caption = 'Email'
                      Width = 902
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CNotificar'
                      Title.Caption = 'Notificar'
                      Visible = True
                    end>
                end
                object edtEmail: TDBEdit
                  Left = 16
                  Top = 412
                  Width = 921
                  Height = 22
                  CharCase = ecLowerCase
                  DataField = 'CliEm_Email'
                  DataSource = dsEmail
                  TabOrder = 1
                end
                object DBCheckBox2: TDBCheckBox
                  Left = 16
                  Top = 440
                  Width = 97
                  Height = 17
                  Caption = 'Notificar'
                  DataField = 'CliEm_Notificar'
                  DataSource = dsEmail
                  TabOrder = 2
                  OnKeyDown = DBCheckBox2KeyDown
                end
                object btnNovoEmail: TBitBtn
                  Left = 483
                  Top = 503
                  Width = 90
                  Height = 25
                  Hint = '[Insert] - Novo Item'
                  CustomHint = BalloonHint1
                  Caption = 'Novo'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  OnClick = btnNovoEmailClick
                end
                object btnExcluirEmail: TBitBtn
                  Left = 756
                  Top = 503
                  Width = 90
                  Height = 25
                  Hint = '[Ctrl + Del] - Excluir Item'
                  CustomHint = BalloonHint1
                  Caption = 'Excluir'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                  OnClick = btnExcluirEmailClick
                end
                object btnCancelarEmail: TBitBtn
                  Left = 847
                  Top = 503
                  Width = 90
                  Height = 25
                  Hint = '[Esc] - Cancelar Item'
                  CustomHint = BalloonHint1
                  Caption = 'Cancelar'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 7
                  OnClick = btnCancelarEmailClick
                end
                object btnSalvarEmail: TBitBtn
                  Left = 666
                  Top = 503
                  Width = 90
                  Height = 25
                  Hint = '[F8] - Salvar Item'
                  CustomHint = BalloonHint1
                  Caption = 'Sa&lvar'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  OnClick = btnSalvarEmailClick
                end
                object btnEditarEmail: TBitBtn
                  Left = 574
                  Top = 503
                  Width = 90
                  Height = 25
                  Hint = '[F2] - Editar Item'
                  CustomHint = BalloonHint1
                  Caption = 'Editar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                  OnClick = btnEditarEmailClick
                end
              end
            end
          end
          object tsModulo: TTabSheet
            Caption = '&M'#243'dulos'
            ImageIndex = 3
            OnShow = tsModuloShow
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 533
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object GroupBox3: TGroupBox
                Left = 1
                Top = 1
                Width = 998
                Height = 531
                Align = alClient
                TabOrder = 0
                object Label16: TLabel
                  Left = 16
                  Top = 392
                  Width = 57
                  Height = 14
                  Caption = 'M'#243'dulo *'
                end
                object btnModulo: TSpeedButton
                  Left = 466
                  Top = 412
                  Width = 23
                  Height = 22
                  OnClick = btnModuloClick
                end
                object Label18: TLabel
                  Left = 16
                  Top = 440
                  Width = 50
                  Height = 14
                  Caption = 'Produto'
                end
                object btnProduto: TSpeedButton
                  Left = 466
                  Top = 460
                  Width = 23
                  Height = 22
                  OnClick = btnProdutoClick
                end
                object dbModulo: TDBGrid
                  Left = 2
                  Top = 16
                  Width = 994
                  Height = 360
                  Align = alTop
                  DataSource = dsModulo
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  TabOrder = 0
                  TitleFont.Charset = ANSI_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = 'Verdana'
                  TitleFont.Style = []
                  OnDrawColumnCell = dbModuloDrawColumnCell
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'CliMod_Id'
                      Visible = False
                    end
                    item
                      Expanded = False
                      FieldName = 'Mod_Nome'
                      ReadOnly = True
                      Width = 423
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Prod_Nome'
                      ReadOnly = True
                      Width = 522
                      Visible = True
                    end>
                end
                object edtModulo: TDBEdit
                  Left = 16
                  Top = 412
                  Width = 45
                  Height = 22
                  Hint = '[F9] - Pesquisar'
                  CustomHint = BalloonHint1
                  DataField = 'Mod_Codigo'
                  DataSource = dsModulo
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  OnExit = edtModuloExit
                  OnKeyDown = edtUsuarioKeyDown
                end
                object DBEdit9: TDBEdit
                  Left = 67
                  Top = 412
                  Width = 398
                  Height = 22
                  TabStop = False
                  Color = clSilver
                  DataField = 'Mod_Nome'
                  DataSource = dsModulo
                  TabOrder = 2
                end
                object edtProduto: TDBEdit
                  Left = 16
                  Top = 460
                  Width = 45
                  Height = 22
                  Hint = '[F9] - Pesquisar'
                  CustomHint = BalloonHint1
                  DataField = 'Prod_Codigo'
                  DataSource = dsModulo
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  OnExit = edtProdutoExit
                  OnKeyDown = edtUsuarioKeyDown
                end
                object DBEdit11: TDBEdit
                  Left = 67
                  Top = 460
                  Width = 398
                  Height = 22
                  TabStop = False
                  Color = clSilver
                  DataField = 'Prod_Nome'
                  DataSource = dsModulo
                  TabOrder = 4
                end
                object btnNovoModulo: TBitBtn
                  Left = 528
                  Top = 503
                  Width = 90
                  Height = 25
                  Hint = '[Insert] - Novo Item'
                  CustomHint = BalloonHint1
                  Caption = 'Novo'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 5
                  OnClick = btnNovoModuloClick
                end
                object btnExcluirModulo: TBitBtn
                  Left = 806
                  Top = 503
                  Width = 90
                  Height = 25
                  Hint = '[Ctrl + Del] - Excluir Item'
                  CustomHint = BalloonHint1
                  Caption = 'Excluir'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 8
                  TabStop = False
                  OnClick = btnExcluirModuloClick
                end
                object btnCancelarModulo: TBitBtn
                  Left = 896
                  Top = 503
                  Width = 90
                  Height = 25
                  Hint = '[Esc] - Cancelar Item'
                  CustomHint = BalloonHint1
                  Caption = 'Cancelar'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 9
                  OnClick = btnCancelarModuloClick
                end
                object btnSalvarModulo: TBitBtn
                  Left = 715
                  Top = 503
                  Width = 90
                  Height = 25
                  Hint = '[Insert] - Novo Item'
                  CustomHint = BalloonHint1
                  Caption = 'Sa&lvar'
                  Enabled = False
                  ParentShowHint = False
                  ShowHint = False
                  TabOrder = 7
                  OnClick = btnSalvarModuloClick
                end
                object btnEditarModulo: TBitBtn
                  Left = 619
                  Top = 503
                  Width = 90
                  Height = 25
                  Hint = '[F2] - Editar'
                  CustomHint = BalloonHint1
                  Caption = 'Editar'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                  OnClick = btnEditarModuloClick
                end
              end
            end
          end
        end
      end
      inherited Panel4: TPanel
        Top = 564
        Width = 1010
        ExplicitTop = 564
        ExplicitWidth = 1010
        inherited btnSalvar: TBitBtn
          Left = 5
          Top = 5
          ExplicitLeft = 5
          ExplicitTop = 5
        end
        inherited btnCancelar: TBitBtn
          Top = 5
          ExplicitTop = 5
        end
        object btnEspecificacao1: TBitBtn
          Left = 188
          Top = 5
          Width = 90
          Height = 25
          Caption = 'E&specif.'
          Enabled = False
          TabOrder = 2
          OnClick = btnEspecificacao1Click
        end
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 1010
      ExplicitHeight = 605
      inherited Panel5: TPanel
        Width = 1010
        Height = 564
        ExplicitWidth = 1010
        ExplicitHeight = 564
        inherited PageControl2: TPageControl
          Width = 1008
          Height = 562
          ExplicitWidth = 1008
          ExplicitHeight = 562
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 1000
            ExplicitHeight = 533
            inherited pnlGeral: TPanel
              Width = 1000
              Height = 533
              ExplicitWidth = 1000
              ExplicitHeight = 533
              object Label13: TLabel [1]
                Left = 16
                Top = 71
                Width = 58
                Height = 14
                Caption = 'Restri'#231#227'o'
              end
              object Label31: TLabel [2]
                Left = 16
                Top = 126
                Width = 43
                Height = 14
                Caption = 'Vers'#227'o'
              end
              object Label34: TLabel [3]
                Left = 182
                Top = 127
                Width = 31
                Height = 14
                Caption = 'Perfil'
              end
              object cbbRestricao: TComboBox
                Left = 16
                Top = 88
                Width = 145
                Height = 22
                Style = csDropDownList
                ItemIndex = 2
                TabOrder = 1
                Text = 'Todos'
                Items.Strings = (
                  'Sim'
                  'N'#227'o'
                  'Todos')
              end
              object GroupBox8: TGroupBox
                Left = 16
                Top = 174
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
                  Items.Strings = (
                    '01 - Relat'#243'rio Anal'#237'tico'
                    '02 - Relat'#243'rio por Produto')
                end
              end
              object edtVersao: TEdit
                Left = 17
                Top = 146
                Width = 144
                Height = 22
                TabOrder = 2
              end
              object RGEmpVinculada: TRadioGroup
                Left = 182
                Top = 16
                Width = 193
                Height = 105
                Caption = 'Listar Empresas Vinculadas'
                ItemIndex = 1
                Items.Strings = (
                  'Sim'
                  'N'#227'o'
                  'Todas')
                TabOrder = 3
              end
              object edtPerfil: TEdit
                Left = 182
                Top = 147
                Width = 121
                Height = 22
                TabOrder = 4
              end
            end
          end
          object tsFiltroUsuario: TTabSheet
            Caption = 'Usu'#225'rio'
            ImageIndex = 1
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 533
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraUsuario: TFraUsuario
                Left = 1
                Top = 1
                Width = 998
                Height = 531
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
                ExplicitHeight = 531
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
                  Height = 479
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
          object tsFiltroRevenda: TTabSheet
            Caption = 'Revenda'
            ImageIndex = 2
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 533
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraRevenda: TFraRevenda
                Left = 1
                Top = 1
                Width = 998
                Height = 531
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
                ExplicitHeight = 531
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
                  Height = 479
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 865
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsCidade: TTabSheet
            Caption = 'Cidade'
            ImageIndex = 3
            object Panel12: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 533
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraCidade: TFraCidade
                Left = 1
                Top = 1
                Width = 998
                Height = 531
                Align = alClient
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 998
                ExplicitHeight = 531
                inherited edtCodigo: TEdit
                  Height = 22
                  ExplicitHeight = 22
                end
                inherited edtNome: TEdit
                  Height = 22
                  ExplicitHeight = 22
                end
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 479
                  TitleFont.Charset = ANSI_CHARSET
                  TitleFont.Height = -12
                  TitleFont.Name = 'Verdana'
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
                      Width = 866
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  Height = 22
                  ExplicitHeight = 22
                end
              end
            end
          end
          object tsFiltroModulo: TTabSheet
            Caption = 'M'#243'dulo'
            ImageIndex = 4
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 533
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraModulo: TFraModulo
                Left = 1
                Top = 1
                Width = 998
                Height = 531
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
                ExplicitHeight = 531
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 479
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
                      Width = 866
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsFiltroProduto: TTabSheet
            Caption = 'Produto'
            ImageIndex = 5
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 533
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraProduto: TFraProduto
                Left = 1
                Top = 1
                Width = 998
                Height = 531
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
                ExplicitHeight = 531
                inherited dbTabela: TDBGrid
                  Left = 0
                  Top = 48
                  Width = 998
                  Height = 479
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
                      Width = 866
                      Visible = True
                    end>
                end
              end
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 564
        Width = 1010
        ExplicitTop = 564
        ExplicitWidth = 1010
        inherited btnImprimir: TBitBtn
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMCliente.CDSConsulta
    Left = 652
    Top = 161
  end
  inherited dsCad: TDataSource
    DataSet = DMCliente.CDSCadastro
    Left = 704
    Top = 168
  end
  inherited BalloonHint1: TBalloonHint
    Left = 756
    Top = 169
  end
  object dsEmail: TDataSource
    AutoEdit = False
    DataSet = DMClienteEmail.CDSConsulta
    OnStateChange = dsEmailStateChange
    Left = 577
    Top = 115
  end
  object dsEspecificacao: TDataSource
    DataSet = DMClienteEspecificacao.CDSConsulta
    Left = 673
    Top = 191
  end
  object dsModulo: TDataSource
    AutoEdit = False
    DataSet = DMClienteModulo.CDSConsulta
    OnStateChange = dsModuloStateChange
    Left = 692
    Top = 153
  end
  object dlgAbrirArquivo: TOpenDialog
    Left = 473
    Top = 191
  end
  object dlgSalvarArquivo: TSaveDialog
    Left = 521
    Top = 191
  end
  object pm1: TPopupMenu
    Left = 444
    Top = 225
    object ImpressodoHistrico1: TMenuItem
      Caption = 'Impress'#227'o do Hist'#243'rico'
      OnClick = ImpressodoHistrico1Click
    end
  end
  object dsContato: TDataSource
    DataSet = DMCliente.CDSContato
    Left = 881
    Top = 347
  end
end
