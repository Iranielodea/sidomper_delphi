inherited frmVersao: TfrmVersao
  Tag = 4
  Caption = 'Vers'#245'es'
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
    ActivePage = tsFiltro
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
          PopupMenu = pmRelatorio
          Columns = <
            item
              Expanded = False
              FieldName = 'Ver_Id'
              Title.Alignment = taCenter
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ver_DataInicio'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ver_DataLiberacao'
              Width = 116
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ver_Versao'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ver_Descricao'
              Width = 299
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tip_Nome'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sta_Nome'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_Nome'
              Width = 71
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
          TabOrder = 8
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
                Left = 24
                Top = 5
                Width = 14
                Height = 14
                Caption = 'ID'
              end
              object Label5: TLabel
                Left = 201
                Top = 5
                Width = 107
                Height = 14
                Caption = 'Data Libera'#231#227'o *'
              end
              object Label6: TLabel
                Left = 101
                Top = 5
                Width = 79
                Height = 14
                Caption = 'Data In'#237'cio *'
              end
              object Label10: TLabel
                Left = 24
                Top = 53
                Width = 48
                Height = 14
                Caption = 'Usu'#225'rio'
              end
              object Label12: TLabel
                Left = 24
                Top = 99
                Width = 38
                Height = 14
                Caption = 'Tipo *'
              end
              object btnTipo: TSpeedButton
                Left = 579
                Top = 117
                Width = 23
                Height = 22
                OnClick = btnTipoClick
              end
              object Label13: TLabel
                Left = 24
                Top = 147
                Width = 53
                Height = 14
                Caption = 'Status *'
              end
              object btnStatus: TSpeedButton
                Left = 579
                Top = 165
                Width = 23
                Height = 22
                OnClick = btnStatusClick
              end
              object Label14: TLabel
                Left = 23
                Top = 246
                Width = 72
                Height = 14
                Caption = 'Descri'#231#227'o *'
              end
              object Label20: TLabel
                Left = 632
                Top = 188
                Width = 43
                Height = 14
                Caption = 'Vers'#227'o'
              end
              object Label11: TLabel
                Left = 24
                Top = 193
                Width = 50
                Height = 14
                Caption = 'Produto'
              end
              object btnProduto: TSpeedButton
                Left = 578
                Top = 208
                Width = 23
                Height = 22
                OnClick = btnProdutoClick
              end
              object edtCodigo: TDBEdit
                Left = 24
                Top = 25
                Width = 71
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Ver_Id'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 0
              end
              object edtNome: TDBEdit
                Left = 101
                Top = 25
                Width = 94
                Height = 22
                DataField = 'Ver_DataInicio'
                DataSource = dsCad
                TabOrder = 1
              end
              object DBEdit1: TDBEdit
                Left = 201
                Top = 25
                Width = 94
                Height = 22
                DataField = 'Ver_DataLiberacao'
                DataSource = dsCad
                TabOrder = 2
              end
              object edtCodUsuario: TDBEdit
                Left = 24
                Top = 69
                Width = 71
                Height = 22
                CustomHint = BalloonHint1
                ParentCustomHint = False
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ReadOnly = True
                ShowHint = True
                TabOrder = 3
                OnExit = edtCodUsuarioExit
              end
              object DBEdit7: TDBEdit
                Left = 101
                Top = 69
                Width = 476
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 4
              end
              object edtCodTipo: TDBEdit
                Left = 24
                Top = 117
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Tip_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnExit = edtCodTipoExit
                OnKeyDown = edtCodTipoKeyDown
              end
              object DBEdit10: TDBEdit
                Left = 102
                Top = 117
                Width = 476
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Tip_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 6
              end
              object edtCodStatus: TDBEdit
                Left = 24
                Top = 165
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Sta_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 7
                OnExit = edtCodStatusExit
                OnKeyDown = edtCodTipoKeyDown
              end
              object DBEdit12: TDBEdit
                Left = 102
                Top = 165
                Width = 476
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Sta_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 8
              end
              object DBMemo1: TDBMemo
                Left = 24
                Top = 264
                Width = 945
                Height = 289
                DataField = 'Ver_Descricao'
                DataSource = dsCad
                MaxLength = 100
                ScrollBars = ssVertical
                TabOrder = 12
                OnEnter = DBMemo1Enter
                OnExit = DBMemo1Exit
                OnKeyDown = DBMemo1KeyDown
              end
              object edtVersao: TDBEdit
                Left = 632
                Top = 208
                Width = 145
                Height = 22
                CustomHint = BalloonHint1
                DataField = 'Ver_Versao'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = False
                TabOrder = 11
              end
              object edtCodProduto: TDBEdit
                Left = 24
                Top = 208
                Width = 71
                Height = 22
                Hint = '[F9] - Pesquisar'
                DataField = 'Prod_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                OnExit = edtCodProdutoExit
                OnKeyDown = edtCodTipoKeyDown
              end
              object DBEdit2: TDBEdit
                Left = 101
                Top = 208
                Width = 476
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Prod_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 10
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
                Left = 273
                Top = 9
                Visible = False
                ExplicitLeft = 273
                ExplicitTop = 9
              end
              object Label39: TLabel [1]
                Left = 16
                Top = 8
                Width = 70
                Height = 14
                Caption = 'Data Inicial'
              end
              object Label40: TLabel [2]
                Left = 15
                Top = 56
                Width = 63
                Height = 14
                Caption = 'Data Final'
              end
              object Label7: TLabel [3]
                Left = 17
                Top = 128
                Width = 135
                Height = 14
                Caption = 'Data Libera'#231#227'o Inicial'
              end
              object Label8: TLabel [4]
                Left = 16
                Top = 176
                Width = 128
                Height = 14
                Caption = 'Data Libera'#231#227'o Final'
              end
              inherited cbbSituacao: TComboBox
                Left = 272
                Top = 28
                Visible = False
                ExplicitLeft = 272
                ExplicitTop = 28
              end
              object edtDataInicial: TMaskEdit
                Left = 16
                Top = 28
                Width = 136
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object edtDataFinal: TMaskEdit
                Left = 15
                Top = 76
                Width = 137
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
              end
              object edtDataLibInicial: TMaskEdit
                Left = 17
                Top = 148
                Width = 135
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 3
                Text = '  /  /    '
              end
              object edtDataLibFinal: TMaskEdit
                Left = 16
                Top = 196
                Width = 136
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 4
                Text = '  /  /    '
              end
              object GroupBox2: TGroupBox
                Left = 16
                Top = 260
                Width = 969
                Height = 297
                Caption = 'Relat'#243'rios:'
                TabOrder = 5
                object Label9: TLabel
                  Left = 25
                  Top = 48
                  Width = 52
                  Height = 14
                  Caption = 'Modelos'
                end
                object cbModelo: TComboBox
                  Left = 25
                  Top = 64
                  Width = 216
                  Height = 22
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 0
                  Text = 'Por Vers'#227'o'
                  Items.Strings = (
                    'Por Vers'#227'o')
                end
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
                      Width = 870
                      Visible = True
                    end>
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
                  OnEnter = FraTipoedtCodigoEnter
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
                      Width = 870
                      Visible = True
                    end>
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
                  OnEnter = FraStatusedtCodigoEnter
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
                      Width = 870
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsFiltroProduto: TTabSheet
            Caption = 'Produtos'
            ImageIndex = 4
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 570
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraProduto: TFraProduto
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
                      Title.Caption = 'C'#243'digo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 870
                      Visible = True
                    end>
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
    Left = 692
    Top = 105
  end
  inherited dsCad: TDataSource
    DataSet = DMVersao.CDSCadastro
    Left = 616
    Top = 96
  end
  inherited BalloonHint1: TBalloonHint
    Left = 540
    Top = 129
  end
  object dlgAbrirArquivo: TOpenDialog
    Left = 825
    Top = 7
  end
  object pmRelatorio: TPopupMenu
    Left = 228
    Top = 169
    object Estatsticas1: TMenuItem
      Caption = 'Estat'#237'sticas'
      OnClick = Estatsticas1Click
    end
    object DocumentospLiberao1: TMenuItem
      Caption = 'Documentos p/ Libera'#231#227'o'
      OnClick = DocumentospLiberao1Click
    end
  end
end
