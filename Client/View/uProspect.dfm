inherited frmProspect: TfrmProspect
  Tag = 113
  Caption = 'Prospect'
  ClientHeight = 634
  ClientWidth = 1018
  OnDestroy = FormDestroy
  ExplicitWidth = 1024
  ExplicitHeight = 663
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 1018
    Height = 634
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
          Columns = <
            item
              Expanded = False
              FieldName = 'Pros_Codigo'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Pros_Nome'
              Width = 389
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Pros_Fantasia'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Pros_Docto'
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Pros_Telefone'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_Nome'
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Rev_Nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Pros_Enquadramento'
              Width = 64
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 564
        Width = 1010
        ExplicitTop = 564
        ExplicitWidth = 1010
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
          object tsPrincipal: TTabSheet
            Caption = 'Principal'
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
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
                Left = 16
                Top = 56
                Width = 91
                Height = 14
                Caption = 'Raz'#227'o Social *'
              end
              object Label6: TLabel
                Left = 16
                Top = 104
                Width = 93
                Height = 14
                Caption = 'Nome Fantasia'
              end
              object Label7: TLabel
                Left = 16
                Top = 152
                Width = 72
                Height = 14
                Caption = 'CNPJ/CPF *'
              end
              object Label8: TLabel
                Left = 16
                Top = 200
                Width = 59
                Height = 14
                Caption = 'Endere'#231'o'
              end
              object Label9: TLabel
                Left = 16
                Top = 296
                Width = 53
                Height = 14
                Caption = 'Telefone'
              end
              object Label10: TLabel
                Left = 16
                Top = 344
                Width = 51
                Height = 14
                Caption = 'Contato'
              end
              object Label11: TLabel
                Left = 16
                Top = 432
                Width = 61
                Height = 14
                Caption = 'Consultor'
              end
              object Label12: TLabel
                Left = 16
                Top = 480
                Width = 67
                Height = 14
                Caption = 'Revenda *'
              end
              object btnUsuario: TSpeedButton
                Left = 459
                Top = 452
                Width = 23
                Height = 22
                OnClick = btnUsuarioClick
              end
              object btnRevenda: TSpeedButton
                Left = 459
                Top = 500
                Width = 23
                Height = 22
                OnClick = btnRevendaClick
              end
              object edtCodigo: TDBEdit
                Left = 16
                Top = 28
                Width = 79
                Height = 22
                DataField = 'Pros_Codigo'
                DataSource = dsCad
                TabOrder = 0
              end
              object edtNome: TDBEdit
                Left = 16
                Top = 76
                Width = 728
                Height = 22
                DataField = 'Pros_Nome'
                DataSource = dsCad
                TabOrder = 1
              end
              object DBEdit1: TDBEdit
                Left = 16
                Top = 124
                Width = 728
                Height = 22
                DataField = 'Pros_Fantasia'
                DataSource = dsCad
                TabOrder = 2
              end
              object edtCNPJ: TDBEdit
                Left = 16
                Top = 172
                Width = 209
                Height = 22
                DataField = 'Pros_Docto'
                DataSource = dsCad
                TabOrder = 3
                OnExit = edtCNPJExit
              end
              object dbmEndereco: TDBMemo
                Left = 16
                Top = 220
                Width = 728
                Height = 70
                DataField = 'Pros_Endereco'
                DataSource = dsCad
                ScrollBars = ssVertical
                TabOrder = 4
                OnEnter = dbmEnderecoEnter
                OnExit = dbmEnderecoExit
                OnKeyDown = dbmEnderecoKeyDown
              end
              object DBEdit4: TDBEdit
                Left = 16
                Top = 316
                Width = 728
                Height = 22
                DataField = 'Pros_Telefone'
                DataSource = dsCad
                TabOrder = 5
              end
              object dbmContato: TDBMemo
                Left = 16
                Top = 361
                Width = 728
                Height = 56
                DataField = 'Pros_Contato'
                DataSource = dsCad
                ScrollBars = ssVertical
                TabOrder = 6
                OnEnter = dbmEnderecoEnter
                OnExit = dbmEnderecoExit
                OnKeyDown = dbmEnderecoKeyDown
              end
              object edtUsuario: TDBEdit
                Left = 16
                Top = 452
                Width = 51
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Usu_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 7
                OnExit = edtUsuarioExit
                OnKeyDown = edtUsuarioKeyDown
              end
              object DBEdit6: TDBEdit
                Left = 73
                Top = 452
                Width = 384
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Usu_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 8
              end
              object edtRevenda: TDBEdit
                Left = 16
                Top = 500
                Width = 51
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Rev_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 9
                OnExit = edtRevendaExit
                OnKeyDown = edtUsuarioKeyDown
              end
              object DBEdit8: TDBEdit
                Left = 73
                Top = 500
                Width = 384
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Rev_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 10
              end
              object DBRadioGroup1: TDBRadioGroup
                Left = 495
                Top = 447
                Width = 145
                Height = 81
                Caption = 'Enquadramento:'
                DataField = 'Pros_Enquadramento'
                DataSource = dsCad
                Items.Strings = (
                  'Simples'
                  'Lucro Presumido'
                  'Lucro Real'
                  'N'#227'o Definido')
                TabOrder = 11
                Values.Strings = (
                  '01'
                  '02'
                  '03'
                  '00')
              end
              object Ativo: TDBCheckBox
                Left = 684
                Top = 511
                Width = 97
                Height = 17
                Caption = 'Ativo'
                DataField = 'Pros_Ativo'
                DataSource = dsCad
                TabOrder = 12
              end
            end
          end
          object tsEmail: TTabSheet
            Caption = 'Email'
            ImageIndex = 1
            ExplicitLeft = 0
            ExplicitTop = 0
            ExplicitWidth = 0
            ExplicitHeight = 0
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 1000
              Height = 533
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label17: TLabel
                Left = 16
                Top = 440
                Width = 45
                Height = 14
                Caption = 'Email *'
              end
              object Label13: TLabel
                Left = 16
                Top = 392
                Width = 72
                Height = 14
                Caption = 'Descri'#231#227'o *'
              end
              object dbEmail: TDBGrid
                Left = 1
                Top = 1
                Width = 998
                Height = 376
                Align = alTop
                DataSource = dsEmail
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnKeyDown = dbEmailKeyDown
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ProsEm_Id'
                    Visible = False
                  end
                  item
                    Expanded = False
                    FieldName = 'ProsEm_Email'
                    Width = 437
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ProsEm_Descricao'
                    Width = 523
                    Visible = True
                  end>
              end
              object edtEmail: TDBEdit
                Left = 16
                Top = 460
                Width = 921
                Height = 22
                CharCase = ecLowerCase
                DataField = 'ProsEm_Email'
                DataSource = dsEmail
                TabOrder = 2
                OnKeyDown = edtEmailKeyDown
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
                Left = 663
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
              object edtDescricaoEmail: TDBEdit
                Left = 16
                Top = 412
                Width = 921
                Height = 22
                CharCase = ecLowerCase
                DataField = 'ProsEm_Descricao'
                DataSource = dsEmail
                TabOrder = 1
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
            end
          end
          object tsUsuario: TTabSheet
            Caption = 'Consultor'
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
                inherited dbTabela: TDBGrid
                  Width = 992
                  Height = 492
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 859
                      Visible = True
                    end>
                end
              end
            end
          end
          object tsRevenda: TTabSheet
            Caption = 'Revenda'
            ImageIndex = 2
            object Panel10: TPanel
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
                inherited dbTabela: TDBGrid
                  Width = 992
                  Height = 492
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 854
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
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMProspect.CDSConsulta
  end
  inherited dsCad: TDataSource
    DataSet = DMProspect.CDSEmail
  end
  object dsEmail: TDataSource
    AutoEdit = False
    DataSet = DMProspect.CDSEmail
    OnStateChange = dsEmailStateChange
    Left = 496
    Top = 320
  end
end
