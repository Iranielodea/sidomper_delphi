inherited frmStatus: TfrmStatus
  Tag = 107
  Caption = 'Status'
  ClientHeight = 571
  ClientWidth = 692
  OnDestroy = FormDestroy
  ExplicitWidth = 698
  ExplicitHeight = 600
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 692
    Height = 571
    ExplicitWidth = 692
    ExplicitHeight = 571
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 684
      ExplicitHeight = 542
      inherited Panel1: TPanel
        Width = 684
        Height = 501
        ExplicitWidth = 684
        ExplicitHeight = 501
        inherited GroupBox1: TGroupBox
          Width = 682
          ExplicitWidth = 682
        end
        inherited dbDados: TDBGrid
          Width = 682
          Height = 443
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Sta_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Sta_Codigo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sta_Nome'
              Width = 375
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Sta_Programa'
              Width = 176
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 501
        Width = 684
        ExplicitTop = 501
        ExplicitWidth = 684
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 684
      ExplicitHeight = 542
      inherited Panel3: TPanel
        Width = 684
        Height = 501
        ExplicitWidth = 684
        ExplicitHeight = 501
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
        object Label6: TLabel
          Left = 25
          Top = 324
          Width = 55
          Height = 14
          Caption = 'Conceito'
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 44
          Width = 57
          Height = 22
          DataField = 'Sta_Codigo'
          DataSource = dsCad
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 92
          Width = 449
          Height = 22
          DataField = 'Sta_Nome'
          DataSource = dsCad
          TabOrder = 1
        end
        object Ativo: TDBCheckBox
          Left = 24
          Top = 470
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'Sta_Ativo'
          DataSource = dsCad
          TabOrder = 5
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 24
          Top = 120
          Width = 201
          Height = 198
          Caption = 'Programa:'
          DataField = 'Sta_Programa'
          DataSource = dsCad
          Items.Strings = (
            '1-Chamado'
            '2-Visita'
            '3-Solicita'#231#227'o'
            '4-Vers'#227'o'
            '5-Qualidade'
            '6-Base de Conhecimento'
            '7-Atividade'
            '8-Agendamento'
            '10-Recado'
            '11-Tabela de Pre'#231'o')
          TabOrder = 2
          Values.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7'
            '8'
            '10'
            '11')
        end
        object GroupBox2: TGroupBox
          Left = 231
          Top = 120
          Width = 242
          Height = 198
          Caption = 'Notifica'#231#227'o:'
          TabOrder = 3
          object DBCheckBox1: TDBCheckBox
            Left = 16
            Top = 24
            Width = 129
            Height = 17
            Caption = 'Notificar Cliente'
            DataField = 'Sta_NotificarCliente'
            DataSource = dsCad
            TabOrder = 0
          end
          object DBCheckBox2: TDBCheckBox
            Left = 16
            Top = 47
            Width = 163
            Height = 17
            Caption = 'Notificar Supervisor'
            DataField = 'Sta_NotificarSupervisor'
            DataSource = dsCad
            TabOrder = 1
          end
          object DBCheckBox3: TDBCheckBox
            Left = 16
            Top = 70
            Width = 145
            Height = 17
            Caption = 'Notificar Consultor'
            DataField = 'Sta_NotificarConsultor'
            DataSource = dsCad
            TabOrder = 2
          end
          object DBCheckBox4: TDBCheckBox
            Left = 16
            Top = 93
            Width = 145
            Height = 17
            Caption = 'Notificar Revenda'
            DataField = 'Sta_NotificarRevenda'
            DataSource = dsCad
            TabOrder = 3
          end
        end
        object DBMemo1: TDBMemo
          Left = 24
          Top = 344
          Width = 449
          Height = 120
          DataField = 'Sta_Conceito'
          DataSource = dsCad
          ScrollBars = ssVertical
          TabOrder = 4
        end
      end
      inherited Panel4: TPanel
        Top = 501
        Width = 684
        ExplicitTop = 501
        ExplicitWidth = 684
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 684
      ExplicitHeight = 542
      inherited Panel5: TPanel
        Width = 684
        Height = 501
        ExplicitWidth = 684
        ExplicitHeight = 501
        inherited PageControl2: TPageControl
          Width = 682
          Height = 499
          ExplicitWidth = 682
          ExplicitHeight = 499
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 674
            ExplicitHeight = 470
            inherited pnlGeral: TPanel
              Width = 674
              Height = 470
              ExplicitWidth = 674
              ExplicitHeight = 470
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 501
        Width = 684
        ExplicitTop = 501
        ExplicitWidth = 684
        inherited btnImprimir: TBitBtn
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMStatus.CDSConsulta
    Left = 204
    Top = 209
  end
  inherited dsCad: TDataSource
    DataSet = DMStatus.CDSCadastro
    Left = 640
    Top = 24
  end
  inherited BalloonHint1: TBalloonHint
    Left = 140
    Top = 153
  end
end
