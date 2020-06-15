inherited frmRevenda: TfrmRevenda
  Tag = 100
  Caption = 'Revendas'
  OnDestroy = FormDestroy
  ExplicitWidth = 666
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    ActivePage = tsEdicao
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 337
      inherited Panel1: TPanel
        inherited dbDados: TDBGrid
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Rev_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Rev_Codigo'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Rev_Nome'
              Width = 555
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
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
      ExplicitWidth = 652
      ExplicitHeight = 337
      inherited Panel3: TPanel
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 650
          Height = 294
          ActivePage = tsEmail
          Align = alClient
          TabOrder = 0
          OnChange = PageControl1Change
          object tsPrincipal: TTabSheet
            Caption = 'Principal'
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 642
              Height = 265
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label4: TLabel
                Left = 24
                Top = 24
                Width = 56
                Height = 14
                Caption = 'C'#243'digo *'
              end
              object Label5: TLabel
                Left = 24
                Top = 72
                Width = 48
                Height = 14
                Caption = 'Nome *'
              end
              object edtCodigo: TDBEdit
                Left = 24
                Top = 44
                Width = 57
                Height = 22
                DataField = 'Rev_Codigo'
                DataSource = dsCad
                TabOrder = 0
              end
              object edtNome: TDBEdit
                Left = 24
                Top = 92
                Width = 449
                Height = 22
                DataField = 'Rev_Nome'
                DataSource = dsCad
                TabOrder = 1
              end
              object Ativo: TDBCheckBox
                Left = 24
                Top = 136
                Width = 97
                Height = 17
                Caption = 'Ativo'
                DataField = 'Rev_Ativo'
                DataSource = dsCad
                TabOrder = 2
              end
            end
          end
          object tsEmail: TTabSheet
            Caption = 'Email'
            ImageIndex = 1
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 642
              Height = 265
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label6: TLabel
                Left = 16
                Top = 176
                Width = 45
                Height = 14
                Caption = 'Email *'
              end
              object dbEmail: TDBGrid
                Left = 3
                Top = 0
                Width = 638
                Height = 169
                DataSource = dsEmail
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnDrawColumnCell = dbEmailDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'RevEm_Email'
                    Width = 589
                    Visible = True
                  end>
              end
              object edtEmail: TDBEdit
                Left = 16
                Top = 196
                Width = 617
                Height = 22
                DataField = 'RevEm_Email'
                DataSource = dsEmail
                TabOrder = 1
              end
              object btnNovoEmail: TBitBtn
                Left = 168
                Top = 239
                Width = 90
                Height = 25
                Hint = '[Insert] - Novo Item'
                CustomHint = BalloonHint1
                Caption = 'Novo'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnClick = btnNovoEmailClick
              end
              object btnEditarEmail: TBitBtn
                Left = 264
                Top = 239
                Width = 90
                Height = 25
                Hint = '[F2] - Editar Item'
                CustomHint = BalloonHint1
                Caption = 'Editar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnClick = btnEditarEmailClick
              end
              object btnSalvarEmail: TBitBtn
                Left = 351
                Top = 239
                Width = 90
                Height = 25
                Hint = '[F8] - Salvar Item'
                CustomHint = BalloonHint1
                Caption = 'Sa&lvar'
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnClick = btnSalvarEmailClick
              end
              object btnExcluirEmail: TBitBtn
                Left = 447
                Top = 239
                Width = 90
                Height = 25
                Hint = '[Ctrl + Del] - Excluir Item'
                CustomHint = BalloonHint1
                Caption = 'Excluir'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 5
                OnClick = btnExcluirEmailClick
              end
              object btnCancelarEmail: TBitBtn
                Left = 543
                Top = 239
                Width = 90
                Height = 25
                Hint = '[Esc] - Cancelar Item'
                CustomHint = BalloonHint1
                Caption = 'Cancelar'
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 6
                OnClick = btnCancelarEmailClick
              end
            end
          end
        end
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 337
      inherited Panel5: TPanel
        inherited PageControl2: TPageControl
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 642
            ExplicitHeight = 265
          end
        end
      end
      inherited Panel6: TPanel
        inherited btnImprimir: TBitBtn
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMRevenda.CDSConsulta
    Left = 316
    Top = 65
  end
  inherited dsCad: TDataSource
    DataSet = DMRevenda.CDSCadastro
    Left = 384
    Top = 64
  end
  inherited BalloonHint1: TBalloonHint
    Left = 436
    Top = 57
  end
  object dsEmail: TDataSource
    AutoEdit = False
    DataSet = DMRevenda.CDSEmail
    OnStateChange = dsEmailStateChange
    Left = 137
    Top = 99
  end
end
