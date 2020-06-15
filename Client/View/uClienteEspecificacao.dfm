inherited frmClienteEspecificacao: TfrmClienteEspecificacao
  Tag = 108
  Caption = 'Cliente Especifica'#231#245'es'
  ClientHeight = 375
  ClientWidth = 994
  OnDestroy = FormDestroy
  ExplicitWidth = 1000
  ExplicitHeight = 404
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 994
    Height = 375
    ActivePage = tsPesquisa
    ExplicitWidth = 994
    ExplicitHeight = 375
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 986
      ExplicitHeight = 346
      inherited Panel1: TPanel
        Width = 986
        Height = 305
        Color = clCream
        ExplicitWidth = 986
        ExplicitHeight = 305
        inherited GroupBox1: TGroupBox
          Width = 984
          ExplicitWidth = 984
          inherited Label1: TLabel
            Left = 535
            Visible = False
            ExplicitLeft = 535
          end
          inherited Label2: TLabel
            Left = 583
            Visible = False
            ExplicitLeft = 583
          end
          object Label7: TLabel [2]
            Left = 15
            Top = 8
            Width = 44
            Height = 14
            Caption = 'Cliente'
          end
          inherited Label3: TLabel
            Visible = False
          end
          inherited cbbCampos: TComboBox
            Left = 535
            Width = 42
            Visible = False
            ExplicitLeft = 535
            ExplicitWidth = 42
          end
          inherited edtDescricao: TEdit
            Left = 495
            Width = 34
            TabOrder = 4
            ExplicitLeft = 495
            ExplicitWidth = 34
          end
          inherited cbbPesquisa: TComboBox
            Visible = False
          end
          object edtCliente: TEdit
            Left = 15
            Top = 28
            Width = 65
            Height = 22
            TabStop = False
            Alignment = taCenter
            Color = clSilver
            ReadOnly = True
            TabOrder = 2
          end
          object edtNomeCliente: TEdit
            Left = 86
            Top = 28
            Width = 443
            Height = 22
            TabStop = False
            Color = clSilver
            ReadOnly = True
            TabOrder = 3
          end
        end
        inherited dbDados: TDBGrid
          Width = 984
          Height = 247
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'CliEsp_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CliEsp_Item'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CliEsp_Data'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CliEsp_Nome'
              Width = 765
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 305
        Width = 986
        ExplicitTop = 305
        ExplicitWidth = 986
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 986
      ExplicitHeight = 346
      inherited Panel3: TPanel
        Width = 986
        Height = 305
        ExplicitWidth = 986
        ExplicitHeight = 305
        object Label4: TLabel
          Left = 24
          Top = 24
          Width = 44
          Height = 14
          Caption = 'C'#243'digo'
        end
        object Label5: TLabel
          Left = 24
          Top = 72
          Width = 42
          Height = 14
          Caption = 'Data *'
        end
        object Label8: TLabel
          Left = 24
          Top = 121
          Width = 60
          Height = 14
          Caption = 'Usu'#225'rio *'
        end
        object Label9: TLabel
          Left = 512
          Top = 24
          Width = 72
          Height = 14
          Caption = 'Descri'#231#227'o *'
        end
        object Label15: TLabel
          Left = 24
          Top = 220
          Width = 167
          Height = 14
          Caption = 'Nome do Arquivo a Anexar'
        end
        object btnUsuario: TSpeedButton
          Left = 442
          Top = 141
          Width = 23
          Height = 22
          OnClick = btnUsuarioClick
        end
        object btnAnexar: TSpeedButton
          Left = 442
          Top = 240
          Width = 23
          Height = 22
          Hint = 'Anexar Arquivo'
          CustomHint = BalloonHint1
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAnexarClick
        end
        object btnVisualizar: TSpeedButton
          Left = 466
          Top = 240
          Width = 23
          Height = 22
          Hint = 'Visualizar Arquivo'
          CustomHint = BalloonHint1
          ParentShowHint = False
          ShowHint = True
          OnClick = btnVisualizarClick
        end
        object Label6: TLabel
          Left = 24
          Top = 177
          Width = 48
          Height = 14
          Caption = 'Nome *'
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 44
          Width = 57
          Height = 22
          TabStop = False
          Color = clSilver
          DataField = 'CliEsp_Item'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 92
          Width = 97
          Height = 22
          DataField = 'CliEsp_Data'
          DataSource = dsCad
          TabOrder = 1
        end
        object edtUsuario: TDBEdit
          Left = 24
          Top = 141
          Width = 48
          Height = 22
          Hint = '[F9] - Pesquisar'
          CustomHint = BalloonHint1
          DataField = 'Usu_Codigo'
          DataSource = dsCad
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnExit = edtUsuarioExit
          OnKeyDown = edtUsuarioKeyDown
        end
        object DBEdit2: TDBEdit
          Left = 78
          Top = 141
          Width = 363
          Height = 22
          TabStop = False
          Color = clSilver
          DataField = 'Usu_Nome'
          DataSource = dsCad
          TabOrder = 3
        end
        object DBMemo2: TDBMemo
          Left = 512
          Top = 44
          Width = 465
          Height = 218
          DataField = 'CliEsp_Descricao'
          DataSource = dsCad
          ScrollBars = ssVertical
          TabOrder = 5
          OnEnter = DBMemo2Enter
          OnExit = DBMemo2Exit
          OnKeyDown = DBMemo2KeyDown
        end
        object edtNomeArquivo: TDBEdit
          Left = 24
          Top = 240
          Width = 417
          Height = 22
          DataField = 'CliEsp_Anexo'
          DataSource = dsCad
          TabOrder = 6
        end
        object DBEdit1: TDBEdit
          Left = 24
          Top = 192
          Width = 417
          Height = 22
          DataField = 'CliEsp_Nome'
          DataSource = dsCad
          TabOrder = 4
        end
      end
      inherited Panel4: TPanel
        Top = 305
        Width = 986
        ExplicitTop = 305
        ExplicitWidth = 986
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 986
      ExplicitHeight = 346
      inherited Panel5: TPanel
        Width = 986
        Height = 305
        ExplicitWidth = 986
        ExplicitHeight = 305
        inherited PageControl2: TPageControl
          Width = 984
          Height = 303
          ExplicitWidth = 984
          ExplicitHeight = 303
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 976
            ExplicitHeight = 274
            inherited pnlGeral: TPanel
              Width = 976
              Height = 274
              ExplicitWidth = 976
              ExplicitHeight = 274
              inherited Situação: TLabel
                Visible = False
              end
              inherited cbbSituacao: TComboBox
                Visible = False
              end
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 305
        Width = 986
        ExplicitTop = 305
        ExplicitWidth = 986
        inherited btnFiltro: TBitBtn
          Left = 296
          Visible = False
          ExplicitLeft = 296
        end
        inherited btnImprimir: TBitBtn
          Left = 9
          OnClick = btnImprimirClick
          ExplicitLeft = 9
        end
        inherited btnFecharFiltro: TBitBtn
          Left = 99
          ExplicitLeft = 99
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMClienteEspecificacao.CDSConsulta
    Left = 316
    Top = 65
  end
  inherited dsCad: TDataSource
    DataSet = DMClienteEspecificacao.CDSCadastro
    Left = 384
    Top = 64
  end
  inherited BalloonHint1: TBalloonHint
    Left = 428
    Top = 81
  end
  object dlgAbrirArquivo: TOpenDialog
    Left = 289
    Top = 39
  end
  object dlgSalvarArquivo: TSaveDialog
    Left = 441
    Top = 39
  end
end
