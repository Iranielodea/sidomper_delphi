inherited frmUsuario: TfrmUsuario
  Tag = 104
  Caption = 'Usu'#225'rios'
  ClientHeight = 643
  ClientWidth = 787
  OnDestroy = FormDestroy
  ExplicitTop = -100
  ExplicitWidth = 793
  ExplicitHeight = 672
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 787
    Height = 643
    ActivePage = tsEdicao
    ExplicitWidth = 787
    ExplicitHeight = 643
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 779
      ExplicitHeight = 614
      inherited Panel1: TPanel
        Width = 779
        Height = 573
        ExplicitWidth = 779
        ExplicitHeight = 573
        inherited GroupBox1: TGroupBox
          Width = 777
          ExplicitWidth = 777
        end
        inherited dbDados: TDBGrid
          Width = 777
          Height = 515
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Usu_id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Usu_Codigo'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_Nome'
              Width = 287
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CtaEm_Codigo'
              Title.Alignment = taCenter
              Title.Caption = 'Conta'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_Email'
              Title.Caption = 'Email'
              Width = 305
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 573
        Width = 779
        ExplicitTop = 573
        ExplicitWidth = 779
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
      ExplicitWidth = 779
      ExplicitHeight = 614
      inherited Panel3: TPanel
        Width = 779
        Height = 573
        ExplicitWidth = 779
        ExplicitHeight = 573
        object Label11: TLabel
          Left = 16
          Top = 360
          Width = 103
          Height = 14
          Caption = 'Departamento *'
        end
        object DBEdit8: TDBEdit
          Left = 77
          Top = 380
          Width = 543
          Height = 22
          TabStop = False
          Color = clSilver
          DataField = 'Dep_Nome'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 1
        end
        object PageControl1: TPageControl
          Left = 1
          Top = 1
          Width = 777
          Height = 571
          ActivePage = tsPrincipal
          Align = alClient
          TabOrder = 0
          object tsPrincipal: TTabSheet
            Caption = 'Principal'
            object Panel10: TPanel
              Left = 0
              Top = 0
              Width = 769
              Height = 542
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Label4: TLabel
                Left = 17
                Top = 24
                Width = 56
                Height = 14
                Caption = 'C'#243'digo *'
              end
              object Label5: TLabel
                Left = 16
                Top = 72
                Width = 48
                Height = 14
                Caption = 'Nome *'
              end
              object Label6: TLabel
                Left = 17
                Top = 168
                Width = 53
                Height = 14
                Caption = 'Telefone'
              end
              object Label7: TLabel
                Left = 312
                Top = 120
                Width = 52
                Height = 14
                Caption = 'Senha *'
              end
              object Label8: TLabel
                Left = 16
                Top = 216
                Width = 45
                Height = 14
                Caption = 'Email *'
              end
              object Label9: TLabel
                Left = 16
                Top = 358
                Width = 55
                Height = 14
                Caption = 'Revenda'
              end
              object btnRevenda: TSpeedButton
                Left = 621
                Top = 378
                Width = 23
                Height = 22
                OnClick = btnRevendaClick
              end
              object Label10: TLabel
                Left = 16
                Top = 406
                Width = 44
                Height = 14
                Caption = 'Cliente'
              end
              object btnCliente: TSpeedButton
                Left = 621
                Top = 426
                Width = 23
                Height = 22
                OnClick = btnClienteClick
              end
              object Label14: TLabel
                Left = 16
                Top = 311
                Width = 75
                Height = 14
                Caption = 'Conta Email'
              end
              object btnContaEmail: TSpeedButton
                Left = 621
                Top = 331
                Width = 23
                Height = 22
                OnClick = btnContaEmailClick
              end
              object btnDepartamento: TSpeedButton
                Left = 621
                Top = 284
                Width = 23
                Height = 22
                OnClick = btnDepartamentoClick
              end
              object Label15: TLabel
                Left = 17
                Top = 264
                Width = 103
                Height = 14
                Caption = 'Departamento *'
              end
              object Label16: TLabel
                Left = 16
                Top = 120
                Width = 60
                Height = 14
                Caption = 'Usu'#225'rio *'
              end
              object edtCodigo: TDBEdit
                Left = 16
                Top = 44
                Width = 48
                Height = 22
                DataField = 'Usu_Codigo'
                DataSource = dsCad
                TabOrder = 0
              end
              object edtNome: TDBEdit
                Left = 16
                Top = 92
                Width = 604
                Height = 22
                DataField = 'Usu_Nome'
                DataSource = dsCad
                TabOrder = 1
              end
              object DBEdit1: TDBEdit
                Left = 16
                Top = 140
                Width = 281
                Height = 22
                DataField = 'Usu_UserName'
                DataSource = dsCad
                TabOrder = 2
              end
              object DBEdit2: TDBEdit
                Left = 312
                Top = 140
                Width = 308
                Height = 22
                DataField = 'Usu_Password'
                DataSource = dsCad
                PasswordChar = '*'
                TabOrder = 3
              end
              object DBEdit3: TDBEdit
                Left = 16
                Top = 236
                Width = 604
                Height = 22
                DataField = 'Usu_Email'
                DataSource = dsCad
                TabOrder = 5
              end
              object edtRevenda: TDBEdit
                Left = 16
                Top = 378
                Width = 55
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Rev_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 10
                OnExit = edtRevendaExit
                OnKeyDown = edtRevendaKeyDown
              end
              object DBEdit4: TDBEdit
                Left = 77
                Top = 378
                Width = 543
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Rev_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 11
              end
              object edtCliente: TDBEdit
                Left = 16
                Top = 426
                Width = 55
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Cli_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 12
                OnExit = edtClienteExit
                OnKeyDown = edtRevendaKeyDown
              end
              object DBEdit6: TDBEdit
                Left = 77
                Top = 426
                Width = 543
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Cli_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 13
              end
              object GroupBox2: TGroupBox
                Left = 17
                Top = 461
                Width = 133
                Height = 70
                TabOrder = 14
                object DBCheckBox2: TDBCheckBox
                  Left = 12
                  Top = 11
                  Width = 110
                  Height = 17
                  Caption = 'Administrador'
                  DataField = 'Usu_Adm'
                  DataSource = dsCad
                  TabOrder = 0
                end
                object DBCheckBox3: TDBCheckBox
                  Left = 12
                  Top = 57
                  Width = 97
                  Height = 17
                  Caption = 'Notificar'
                  DataField = 'Usu_Notificar'
                  DataSource = dsCad
                  TabOrder = 2
                  Visible = False
                end
                object Ativo: TDBCheckBox
                  Left = 11
                  Top = 34
                  Width = 97
                  Height = 17
                  Caption = 'Ativo'
                  DataField = 'Usu_Ativo'
                  DataSource = dsCad
                  TabOrder = 1
                end
              end
              object edtCodContaEmail: TDBEdit
                Left = 16
                Top = 331
                Width = 55
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'CtaEm_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 8
                OnExit = edtCodContaEmailExit
                OnKeyDown = edtRevendaKeyDown
              end
              object DBEdit5: TDBEdit
                Left = 77
                Top = 331
                Width = 543
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'CtaEm_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 9
              end
              object edtDepartamento: TDBEdit
                Left = 16
                Top = 283
                Width = 55
                Height = 22
                Hint = '[F9] - Pesquisar'
                CustomHint = BalloonHint1
                DataField = 'Dep_Codigo'
                DataSource = dsCad
                ParentShowHint = False
                ShowHint = True
                TabOrder = 6
                OnExit = edtDepartamentoExit
                OnKeyDown = edtRevendaKeyDown
              end
              object DBEdit7: TDBEdit
                Left = 77
                Top = 284
                Width = 543
                Height = 22
                TabStop = False
                Color = clSilver
                DataField = 'Dep_Nome'
                DataSource = dsCad
                ReadOnly = True
                TabOrder = 7
              end
              object dbedtUsu_UserName: TDBEdit
                Left = 17
                Top = 188
                Width = 281
                Height = 22
                DataField = 'Usu_Telefone'
                DataSource = dsCad
                TabOrder = 4
              end
            end
          end
          object tsPermissao: TTabSheet
            Caption = 'Permiss'#245'es'
            ImageIndex = 1
            object Panel11: TPanel
              Left = 0
              Top = 0
              Width = 769
              Height = 542
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object SpeedButton1: TSpeedButton
                Left = 367
                Top = 152
                Width = 33
                Height = 22
                Caption = '>'
                OnClick = SpeedButton1Click
              end
              object SpeedButton2: TSpeedButton
                Left = 367
                Top = 180
                Width = 33
                Height = 22
                Caption = '>>'
                OnClick = SpeedButton2Click
              end
              object SpeedButton3: TSpeedButton
                Left = 367
                Top = 208
                Width = 33
                Height = 22
                Caption = '<'
                OnClick = SpeedButton3Click
              end
              object SpeedButton4: TSpeedButton
                Left = 367
                Top = 236
                Width = 33
                Height = 22
                Caption = '<<'
                OnClick = SpeedButton4Click
              end
              object Label12: TLabel
                Left = 11
                Top = 10
                Width = 350
                Height = 16
                Alignment = taCenter
                AutoSize = False
                Caption = 'Permiss'#245'es Dispon'#237'veis'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Label13: TLabel
                Left = 406
                Top = 10
                Width = 350
                Height = 16
                Alignment = taCenter
                AutoSize = False
                Caption = 'Permiss'#245'es do Usu'#225'rio'
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Verdana'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lstPermissao: TListBox
                Left = 11
                Top = 32
                Width = 350
                Height = 443
                ItemHeight = 14
                TabOrder = 0
              end
              object dbPermissao: TDBGrid
                Left = 406
                Top = 32
                Width = 350
                Height = 443
                DataSource = dsPermissao
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 1
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -12
                TitleFont.Name = 'Verdana'
                TitleFont.Style = []
                OnDrawColumnCell = dbPermissaoDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'UsuP_Sigla'
                    Title.Caption = 'Op'#231#245'es'
                    Width = 300
                    Visible = True
                  end>
              end
            end
          end
        end
      end
      inherited Panel4: TPanel
        Top = 573
        Width = 779
        ExplicitTop = 573
        ExplicitWidth = 779
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 779
      ExplicitHeight = 614
      inherited Panel5: TPanel
        Width = 779
        Height = 573
        ExplicitWidth = 779
        ExplicitHeight = 573
        inherited PageControl2: TPageControl
          Width = 777
          Height = 571
          ExplicitWidth = 777
          ExplicitHeight = 571
          inherited tsGeral: TTabSheet
            OnShow = tsGeralShow
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 769
            ExplicitHeight = 542
            inherited pnlGeral: TPanel
              Width = 769
              Height = 542
              ExplicitWidth = 769
              ExplicitHeight = 542
              object lblDataInicial: TLabel [1]
                Left = 18
                Top = 72
                Width = 70
                Height = 14
                Caption = 'Data Inicial'
              end
              object lblDataFinal: TLabel [2]
                Left = 17
                Top = 120
                Width = 63
                Height = 14
                Caption = 'Data Final'
              end
              object lblDiasUteis: TLabel [3]
                Left = 129
                Top = 120
                Width = 134
                Height = 14
                Caption = 'Dias '#250'teis no per'#237'odo'
                Visible = False
              end
              object medtDataInicial: TMaskEdit
                Left = 18
                Top = 92
                Width = 87
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object medtDataFinal: TMaskEdit
                Left = 17
                Top = 140
                Width = 89
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
              end
              object edtDias: TEdit
                Left = 129
                Top = 140
                Width = 134
                Height = 22
                NumbersOnly = True
                TabOrder = 3
                Visible = False
              end
              object grp1: TGroupBox
                Left = 16
                Top = 176
                Width = 745
                Height = 365
                Caption = 'Relat'#243'rios:'
                TabOrder = 4
                object lbl4: TLabel
                  Left = 16
                  Top = 32
                  Width = 52
                  Height = 14
                  Caption = 'Modelos'
                end
                object cbbModelo: TComboBox
                  Left = 16
                  Top = 52
                  Width = 329
                  Height = 22
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 0
                  Text = '01 - Relat'#243'rio do Cadastro'
                  OnClick = cbbModeloClick
                  Items.Strings = (
                    '01 - Relat'#243'rio do Cadastro'
                    '02 - Relat'#243'rio de Rendimento por Usu'#225'rio')
                end
              end
            end
          end
          object tsRevenda: TTabSheet
            Caption = 'Revenda'
            ImageIndex = 1
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 769
              Height = 542
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraRevenda: TFraRevenda
                Left = 1
                Top = 1
                Width = 767
                Height = 540
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
                ExplicitWidth = 767
                ExplicitHeight = 540
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Width = 644
                  Height = 405
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 520
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsCliente: TTabSheet
            Caption = 'Cliente'
            ImageIndex = 2
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 769
              Height = 542
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraCliente: TFraCliente
                Left = 1
                Top = 1
                Width = 767
                Height = 540
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
                ExplicitWidth = 767
                ExplicitHeight = 540
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbCliente: TDBGrid
                  Left = 2
                  Width = 644
                  Height = 405
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Cli_Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Cli_Nome'
                      Width = 520
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
          object tsDepartamento: TTabSheet
            Caption = 'Departamento'
            ImageIndex = 3
            object Panel9: TPanel
              Left = 0
              Top = 0
              Width = 769
              Height = 542
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraDepartamento: TFraDepartamento
                Left = 1
                Top = 1
                Width = 767
                Height = 540
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
                ExplicitWidth = 767
                ExplicitHeight = 540
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Width = 644
                  Height = 408
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 520
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
        Top = 573
        Width = 779
        ExplicitTop = 573
        ExplicitWidth = 779
        inherited btnImprimir: TBitBtn
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMUsuario.CDSConsulta
    Left = 420
    Top = 105
  end
  inherited dsCad: TDataSource
    DataSet = DMUsuario.CDSCadastro
    Left = 488
    Top = 104
  end
  inherited BalloonHint1: TBalloonHint
    Left = 356
    Top = 105
  end
  object dsPermissao: TDataSource
    DataSet = DMUsuario.CDSListarPermissaoListar
    Left = 473
    Top = 155
  end
end
