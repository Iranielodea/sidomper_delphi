inherited frmDepartamento: TfrmDepartamento
  Tag = 105
  Caption = 'Departamentos'
  ClientHeight = 581
  ClientWidth = 724
  OnDestroy = FormDestroy
  ExplicitWidth = 730
  ExplicitHeight = 610
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 724
    Height = 581
    ActivePage = tsEdicao
    ExplicitWidth = 724
    ExplicitHeight = 581
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 716
      ExplicitHeight = 552
      inherited Panel1: TPanel
        Width = 716
        Height = 511
        ExplicitWidth = 716
        ExplicitHeight = 511
        inherited GroupBox1: TGroupBox
          Width = 714
          ExplicitWidth = 714
        end
        inherited dbDados: TDBGrid
          Width = 714
          Height = 453
          DataSource = dsPesquisa
          PopupMenu = pmPadrao
          Columns = <
            item
              Expanded = False
              FieldName = 'Dep_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Dep_Codigo'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Dep_Nome'
              Width = 576
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 511
        Width = 716
        ExplicitTop = 511
        ExplicitWidth = 716
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 716
      ExplicitHeight = 552
      inherited Panel3: TPanel
        Width = 716
        Height = 511
        ExplicitWidth = 716
        ExplicitHeight = 511
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 714
          Height = 509
          ActivePage = tsPrincipal
          Align = alClient
          TabOrder = 0
          OnChange = PageControl1Change
          object tsPrincipal: TTabSheet
            Caption = 'Principal'
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 706
              Height = 480
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
                Left = 87
                Top = 24
                Width = 48
                Height = 14
                Caption = 'Nome *'
              end
              object edtCodigo: TDBEdit
                Left = 24
                Top = 44
                Width = 57
                Height = 22
                DataField = 'Dep_Codigo'
                DataSource = dsCad
                TabOrder = 0
              end
              object edtNome: TDBEdit
                Left = 87
                Top = 44
                Width = 449
                Height = 22
                DataField = 'Dep_Nome'
                DataSource = dsCad
                TabOrder = 1
              end
              object Ativo: TDBCheckBox
                Left = 542
                Top = 49
                Width = 50
                Height = 17
                Caption = 'Ativo'
                DataField = 'Dep_Ativo'
                DataSource = dsCad
                TabOrder = 2
              end
              object GroupBox2: TGroupBox
                Left = 24
                Top = 72
                Width = 633
                Height = 273
                Caption = 'Acessos:'
                TabOrder = 3
                object dbItens: TDBGrid
                  Left = 5
                  Top = 24
                  Width = 622
                  Height = 246
                  DataSource = dsItens
                  Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                  TabOrder = 0
                  TitleFont.Charset = ANSI_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -12
                  TitleFont.Name = 'Verdana'
                  TitleFont.Style = []
                  OnCellClick = dbItensCellClick
                  OnDrawColumnCell = dbItensDrawColumnCell
                  OnKeyDown = dbItensKeyDown
                  OnKeyUp = dbItensKeyUp
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'DepAc_Programa'
                      Title.Alignment = taCenter
                      Width = 73
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Programa'
                      Title.Caption = 'Descri'#231#227'o'
                      Width = 200
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'CAcesso'
                      Title.Alignment = taCenter
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'CIncluir'
                      Title.Alignment = taCenter
                      Width = 64
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'CEditar'
                      Title.Alignment = taCenter
                      Width = 64
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'CExcluir'
                      Title.Alignment = taCenter
                      Width = 64
                      Visible = True
                    end
                    item
                      Alignment = taCenter
                      Expanded = False
                      FieldName = 'CRelatorio'
                      Title.Alignment = taCenter
                      Title.Caption = 'Relatorio'
                      Width = 64
                      Visible = True
                    end>
                end
              end
              object PageControl3: TPageControl
                Left = 24
                Top = 348
                Width = 630
                Height = 103
                ActivePage = tsAtividade
                TabOrder = 4
                object tsSolicitacao: TTabSheet
                  Caption = 'Solicita'#231#227'o'
                  object grpSolicitacao: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 622
                    Height = 74
                    Align = alClient
                    TabOrder = 0
                    object DBCheckBox1: TDBCheckBox
                      Left = 16
                      Top = 12
                      Width = 97
                      Height = 17
                      Caption = 'Abertura'
                      DataField = 'Dep_SolicitaAbertura'
                      DataSource = dsCad
                      TabOrder = 0
                    end
                    object DBCheckBox2: TDBCheckBox
                      Left = 16
                      Top = 32
                      Width = 97
                      Height = 17
                      Caption = 'Analise'
                      DataField = 'Dep_SolicitaAnalise'
                      DataSource = dsCad
                      TabOrder = 1
                    end
                    object DBCheckBox3: TDBCheckBox
                      Left = 16
                      Top = 52
                      Width = 129
                      Height = 17
                      Caption = 'Ocorr'#234'ncia Geral'
                      DataField = 'Dep_SolicitaOcorGeral'
                      DataSource = dsCad
                      TabOrder = 2
                    end
                    object DBCheckBox4: TDBCheckBox
                      Left = 200
                      Top = 12
                      Width = 144
                      Height = 17
                      Caption = 'Ocorr'#234'ncia T'#233'cnica'
                      DataField = 'Dep_SolicitaOcorTecnica'
                      DataSource = dsCad
                      TabOrder = 3
                    end
                    object DBCheckBox5: TDBCheckBox
                      Left = 200
                      Top = 54
                      Width = 129
                      Height = 17
                      Caption = 'Status'
                      DataField = 'Dep_SolicitaStatus'
                      DataSource = dsCad
                      TabOrder = 5
                    end
                    object DBCheckBox6: TDBCheckBox
                      Left = 379
                      Top = 12
                      Width = 129
                      Height = 17
                      Caption = 'Quadro'
                      DataField = 'Dep_SolicitaQuadro'
                      DataSource = dsCad
                      TabOrder = 6
                    end
                    object DBCheckBox17: TDBCheckBox
                      Left = 200
                      Top = 32
                      Width = 144
                      Height = 17
                      Caption = 'Ocorr'#234'ncia Regra'
                      DataField = 'Dep_SolicitaOcorRegra'
                      DataSource = dsCad
                      TabOrder = 4
                    end
                  end
                end
                object tsChamado: TTabSheet
                  Caption = 'Chamado'
                  ImageIndex = 1
                  object grpChamado: TGroupBox
                    Left = 3
                    Top = 1
                    Width = 616
                    Height = 70
                    TabOrder = 0
                    object DBCheckBox7: TDBCheckBox
                      Left = 12
                      Top = 37
                      Width = 129
                      Height = 17
                      Caption = 'Ocorr'#234'ncia'
                      DataField = 'Dep_ChamadoOcor'
                      DataSource = dsCad
                      TabOrder = 0
                    end
                    object DBCheckBox8: TDBCheckBox
                      Left = 12
                      Top = 14
                      Width = 97
                      Height = 17
                      Caption = 'Abertura'
                      DataField = 'Dep_ChamadoAbertura'
                      DataSource = dsCad
                      TabOrder = 1
                    end
                    object DBCheckBox9: TDBCheckBox
                      Left = 168
                      Top = 14
                      Width = 129
                      Height = 17
                      Caption = 'Status'
                      DataField = 'Dep_ChamadoStatus'
                      DataSource = dsCad
                      TabOrder = 2
                    end
                    object DBCheckBox10: TDBCheckBox
                      Left = 168
                      Top = 37
                      Width = 129
                      Height = 17
                      Caption = 'Quadro'
                      DataField = 'Dep_ChamadoQuadro'
                      DataSource = dsCad
                      TabOrder = 3
                    end
                  end
                end
                object tsAtividade: TTabSheet
                  Caption = 'Atividade'
                  ImageIndex = 2
                  object grpAtividade: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 622
                    Height = 74
                    Align = alClient
                    TabOrder = 0
                    object DBCheckBox11: TDBCheckBox
                      Left = 20
                      Top = 45
                      Width = 129
                      Height = 17
                      Caption = 'Ocorr'#234'ncia'
                      DataField = 'Dep_AtividadeOcor'
                      DataSource = dsCad
                      TabOrder = 0
                    end
                    object DBCheckBox12: TDBCheckBox
                      Left = 20
                      Top = 22
                      Width = 97
                      Height = 17
                      Caption = 'Abertura'
                      DataField = 'Dep_AtividadeAbertura'
                      DataSource = dsCad
                      TabOrder = 1
                    end
                    object DBCheckBox13: TDBCheckBox
                      Left = 176
                      Top = 22
                      Width = 129
                      Height = 17
                      Caption = 'Status'
                      DataField = 'Dep_AtividadeStatus'
                      DataSource = dsCad
                      TabOrder = 2
                    end
                    object DBCheckBox14: TDBCheckBox
                      Left = 176
                      Top = 45
                      Width = 129
                      Height = 17
                      Caption = 'Quadro'
                      DataField = 'Dep_AtividadeQuadro'
                      DataSource = dsCad
                      TabOrder = 3
                    end
                  end
                end
                object tsAgendamento: TTabSheet
                  Caption = 'Agendamento'
                  ImageIndex = 3
                  object GroupBox3: TGroupBox
                    Left = 0
                    Top = 0
                    Width = 622
                    Height = 74
                    Align = alClient
                    TabOrder = 0
                    object DBCheckBox15: TDBCheckBox
                      Left = 16
                      Top = 13
                      Width = 129
                      Height = 17
                      Caption = 'Quadro'
                      DataField = 'Dep_AgendamentoQuadro'
                      DataSource = dsCad
                      TabOrder = 0
                    end
                  end
                end
              end
              object DBCheckBox16: TDBCheckBox
                Left = 28
                Top = 462
                Width = 125
                Height = 17
                Caption = 'Mostrar Anexos'
                DataField = 'Dep_MostrarAnexos'
                DataSource = dsCad
                TabOrder = 5
              end
            end
          end
          object tsEmail: TTabSheet
            Caption = 'Email Supervisor'
            ImageIndex = 1
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 706
              Height = 480
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label6: TLabel
                Left = 16
                Top = 344
                Width = 33
                Height = 14
                Caption = 'Email'
              end
              object dbEmail: TDBGrid
                Left = 1
                Top = 1
                Width = 704
                Height = 328
                Align = alTop
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
                    FieldName = 'DepEm_Email'
                    Width = 653
                    Visible = True
                  end>
              end
              object edtEmail: TDBEdit
                Left = 16
                Top = 359
                Width = 633
                Height = 22
                DataField = 'DepEm_Email'
                DataSource = dsEmail
                TabOrder = 1
                OnKeyDown = edtEmailKeyDown
              end
              object btnNovoEmail: TBitBtn
                Left = 232
                Top = 428
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
              object btnExcluirEmail: TBitBtn
                Left = 512
                Top = 428
                Width = 90
                Height = 25
                Hint = '[Ctrl + Del] - Excluir Item'
                CustomHint = BalloonHint1
                Caption = 'Excluir'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                OnClick = btnExcluirEmailClick
              end
              object btnCancelarEmail: TBitBtn
                Left = 608
                Top = 428
                Width = 90
                Height = 25
                Hint = '[Esc] - Cancelar Item'
                CustomHint = BalloonHint1
                Caption = 'Cancelar'
                Enabled = False
                ParentShowHint = False
                ShowHint = True
                TabOrder = 4
                OnClick = btnCancelarEmailClick
              end
              object btnSalvarEmail: TBitBtn
                Left = 416
                Top = 428
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
                Left = 320
                Top = 428
                Width = 90
                Height = 25
                Hint = '[F2] - Editar Item'
                CustomHint = BalloonHint1
                Caption = 'Editar'
                ParentShowHint = False
                ShowHint = True
                TabOrder = 6
                OnClick = btnEditarEmailClick
              end
            end
          end
          object tsHorario: TTabSheet
            Caption = 'Hor'#225'rios'
            ImageIndex = 2
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 706
              Height = 480
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label7: TLabel
                Left = 16
                Top = 80
                Width = 70
                Height = 14
                Caption = 'Hora Inicial'
              end
              object Label8: TLabel
                Left = 108
                Top = 80
                Width = 63
                Height = 14
                Caption = 'Hora Final'
              end
              object DBEdit1: TDBEdit
                Left = 16
                Top = 100
                Width = 74
                Height = 22
                DataField = 'Dep_HoraAtendeInicial'
                DataSource = dsCad
                TabOrder = 0
              end
              object DBEdit2: TDBEdit
                Left = 108
                Top = 100
                Width = 74
                Height = 22
                DataField = 'Dep_HoraAtendeFinal'
                DataSource = dsCad
                TabOrder = 1
              end
              object Panel10: TPanel
                Left = 1
                Top = 1
                Width = 704
                Height = 41
                Align = alTop
                BevelOuter = bvLowered
                Caption = 
                  'Hor'#225'rios para entrar no sitema SIDomper. Se deixado em branco te' +
                  'r'#225' acesso em qualquer hor'#225'rio.'
                TabOrder = 2
              end
            end
          end
        end
      end
      inherited Panel4: TPanel
        Top = 511
        Width = 716
        ExplicitTop = 511
        ExplicitWidth = 716
        inherited btnSalvar: TBitBtn
          Left = 5
          ExplicitLeft = 5
        end
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 716
      ExplicitHeight = 552
      inherited Panel5: TPanel
        Width = 716
        Height = 511
        ExplicitWidth = 716
        ExplicitHeight = 511
        inherited PageControl2: TPageControl
          Width = 714
          Height = 509
          ExplicitWidth = 714
          ExplicitHeight = 509
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 706
            ExplicitHeight = 480
            inherited pnlGeral: TPanel
              Width = 706
              Height = 480
              ExplicitWidth = 706
              ExplicitHeight = 480
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 511
        Width = 716
        ExplicitTop = 511
        ExplicitWidth = 716
        inherited btnImprimir: TBitBtn
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMDepartamento.CDSConsulta
    Left = 436
    Top = 249
  end
  inherited dsCad: TDataSource
    DataSet = DMDepartamento.CDSCadastro
    Left = 504
    Top = 248
  end
  object dsItens: TDataSource
    DataSet = DMDepartamento.CDSItens
    Left = 564
    Top = 249
  end
  object dsEmail: TDataSource
    AutoEdit = False
    DataSet = DMDepartamento.CDSDepartamentoEmail
    OnStateChange = dsEmailStateChange
    Left = 625
    Top = 251
  end
  object pmPadrao: TPopupMenu
    Left = 292
    Top = 241
    object DuplicarRegistro1: TMenuItem
      Caption = 'Duplicar Registro'
      OnClick = DuplicarRegistro1Click
    end
  end
end
