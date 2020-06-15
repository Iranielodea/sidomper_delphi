inherited frmBaseConh: TfrmBaseConh
  Tag = 6
  Caption = 'Base de Conhecimento'
  ClientHeight = 671
  ClientWidth = 1018
  OnDestroy = FormDestroy
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
            Left = 217
            ExplicitLeft = 217
          end
          inherited cbbCampos: TComboBox
            OnChange = cbbCamposChange
          end
        end
        inherited dbDados: TDBGrid
          Width = 1008
          Height = 543
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Bas_Id'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Bas_Data'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Bas_Nome'
              Width = 342
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_Nome'
              Width = 167
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tip_Nome'
              Width = 122
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sta_Nome'
              Width = 157
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
        object btnDetalhes: TBitBtn
          Left = 493
          Top = 6
          Width = 90
          Height = 25
          Caption = '&Detalhes'
          TabOrder = 8
          OnClick = btnDetalhesClick
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
          ActivePage = tsPrincipal
          Align = alClient
          TabOrder = 0
          object tsPrincipal: TTabSheet
            Caption = 'Principal'
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label4: TLabel
                Left = 15
                Top = 5
                Width = 14
                Height = 14
                Caption = 'ID'
              end
              object Label6: TLabel
                Left = 15
                Top = 53
                Width = 42
                Height = 14
                Caption = 'Data *'
              end
              object Label9: TLabel
                Left = 15
                Top = 237
                Width = 50
                Height = 14
                Caption = 'Produto'
              end
              object btnProduto: TSpeedButton
                Left = 519
                Top = 253
                Width = 23
                Height = 22
                OnClick = btnProdutoClick
              end
              object Label10: TLabel
                Left = 15
                Top = 149
                Width = 48
                Height = 14
                Caption = 'Usu'#225'rio'
              end
              object Label11: TLabel
                Left = 15
                Top = 104
                Width = 48
                Height = 14
                Caption = 'Nome *'
              end
              object Label12: TLabel
                Left = 15
                Top = 283
                Width = 38
                Height = 14
                Caption = 'Tipo *'
              end
              object btnTipo: TSpeedButton
                Left = 519
                Top = 301
                Width = 23
                Height = 22
                OnClick = btnTipoClick
              end
              object Label13: TLabel
                Left = 15
                Top = 331
                Width = 53
                Height = 14
                Caption = 'Status *'
              end
              object btnStatus: TSpeedButton
                Left = 519
                Top = 349
                Width = 23
                Height = 22
                OnClick = btnStatusClick
              end
              object Label14: TLabel
                Left = 545
                Top = 5
                Width = 72
                Height = 14
                Caption = 'Descri'#231#227'o *'
              end
              object Label15: TLabel
                Left = 15
                Top = 381
                Width = 39
                Height = 14
                Caption = 'Anexo'
              end
              object btnAnexar: TSpeedButton
                Left = 496
                Top = 401
                Width = 23
                Height = 22
                Hint = 'Anexar Arquivo'
                CustomHint = BalloonHint1
                ParentShowHint = False
                ShowHint = True
                OnClick = btnAnexarClick
              end
              object btnVisualizar: TSpeedButton
                Left = 519
                Top = 401
                Width = 23
                Height = 22
                Hint = 'Visualizar Arquivo'
                CustomHint = BalloonHint1
                ParentShowHint = False
                ShowHint = True
                OnClick = btnVisualizarClick
              end
              object btnModulo: TSpeedButton
                Left = 519
                Top = 209
                Width = 23
                Height = 22
                OnClick = btnModuloClick
              end
              object Label5: TLabel
                Left = 15
                Top = 193
                Width = 45
                Height = 14
                Caption = 'Modulo'
              end
              object edtCodigo: TDBEdit
                Left = 15
                Top = 25
                Width = 71
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Bas_Id'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 0
              end
              object edtData: TDBEdit
                Left = 15
                Top = 73
                Width = 94
                Height = 22
                DataField = 'Bas_Data'
                DataSource = dsCad
                TabOrder = 1
              end
              object edtCodProduto: TDBEdit
                Left = 15
                Top = 253
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Prod_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 7
                OnExit = edtCodProdutoExit
                OnKeyDown = edtCodProdutoKeyDown
              end
              object DBEdit5: TDBEdit
                Left = 92
                Top = 253
                Width = 427
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Prod_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 8
              end
              object edtCodUsuario: TDBEdit
                Left = 15
                Top = 165
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
                TabOrder = 3
                OnExit = edtCodUsuarioExit
                OnKeyDown = edtCodProdutoKeyDown
              end
              object DBEdit7: TDBEdit
                Left = 92
                Top = 165
                Width = 427
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 4
              end
              object edtNome: TDBEdit
                Left = 15
                Top = 121
                Width = 504
                Height = 22
                DataField = 'Bas_Nome'
                DataSource = dsCad
                TabOrder = 2
              end
              object edtCodTipo: TDBEdit
                Left = 15
                Top = 301
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Tip_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                OnExit = edtCodTipoExit
                OnKeyDown = edtCodProdutoKeyDown
              end
              object DBEdit10: TDBEdit
                Left = 92
                Top = 301
                Width = 427
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Tip_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 10
              end
              object edtCodStatus: TDBEdit
                Left = 15
                Top = 349
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Sta_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 11
                OnExit = edtCodStatusExit
                OnKeyDown = edtCodProdutoKeyDown
              end
              object DBEdit12: TDBEdit
                Left = 92
                Top = 349
                Width = 427
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Sta_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 12
              end
              object DBMemo1: TDBMemo
                Left = 545
                Top = 25
                Width = 448
                Height = 544
                DataField = 'Bas_Descricao'
                DataSource = dsCad
                MaxLength = 2000
                ScrollBars = ssVertical
                TabOrder = 14
                OnEnter = DBMemo1Enter
                OnExit = DBMemo1Exit
                OnKeyDown = DBMemo1KeyDown
              end
              object edtNomeArquivo: TDBEdit
                Left = 15
                Top = 401
                Width = 481
                Height = 22
                DataField = 'Bas_Anexo'
                DataSource = dsCad
                TabOrder = 13
              end
              object edtCodModulo: TDBEdit
                Left = 15
                Top = 209
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Mod_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnExit = edtCodModuloExit
                OnKeyDown = edtCodProdutoKeyDown
              end
              object DBEdit3: TDBEdit
                Left = 92
                Top = 209
                Width = 427
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Mod_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 6
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
        object btnDetalhes2: TBitBtn
          Left = 186
          Top = 6
          Width = 90
          Height = 25
          Caption = '&Detalhes'
          TabOrder = 2
          OnClick = btnDetalhes2Click
        end
      end
    end
    inherited tsFiltro: TTabSheet
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
                Left = 124
                Top = 64
                Visible = False
                ExplicitLeft = 124
                ExplicitTop = 64
              end
              object Label39: TLabel [1]
                Left = 16
                Top = 15
                Width = 70
                Height = 14
                Caption = 'Data Inicial'
              end
              object Label40: TLabel [2]
                Left = 15
                Top = 63
                Width = 63
                Height = 14
                Caption = 'Data Final'
              end
              inherited cbbSituacao: TComboBox
                Left = 123
                Top = 83
                Width = 55
                TabOrder = 2
                Visible = False
                ExplicitLeft = 123
                ExplicitTop = 83
                ExplicitWidth = 55
              end
              object edtDataInicial: TMaskEdit
                Left = 16
                Top = 35
                Width = 88
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 0
                Text = '  /  /    '
              end
              object edtDataFinal: TMaskEdit
                Left = 15
                Top = 83
                Width = 89
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
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
          object tsFiltroModulo: TTabSheet
            Caption = 'M'#243'dulo'
            ImageIndex = 1
            object Panel8: TPanel
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
        end
      end
      inherited Panel6: TPanel
        Top = 601
        Width = 1010
        ExplicitTop = 601
        ExplicitWidth = 1010
        inherited btnImprimir: TBitBtn
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMBaseConh.CDSConsulta
    Left = 692
    Top = 105
  end
  inherited dsCad: TDataSource
    DataSet = DMBaseConh.CDSCadastro
    Left = 616
    Top = 96
  end
  inherited BalloonHint1: TBalloonHint
    Left = 524
    Top = 121
  end
  object dlgAbrirArquivo: TOpenDialog
    Left = 825
    Top = 7
  end
end
