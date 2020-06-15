inherited frmTipo: TfrmTipo
  Tag = 106
  Caption = 'Tipos'
  ClientHeight = 456
  OnDestroy = FormDestroy
  ExplicitWidth = 666
  ExplicitHeight = 485
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Height = 456
    ExplicitHeight = 456
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 427
      inherited Panel1: TPanel
        Height = 386
        ExplicitHeight = 386
        inherited dbDados: TDBGrid
          Height = 328
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Tip_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Tip_Codigo'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tip_Nome'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Tip_Programa'
              Width = 142
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 386
        ExplicitTop = 386
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 427
      inherited Panel3: TPanel
        Height = 386
        ExplicitHeight = 386
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
          Left = 231
          Top = 120
          Width = 55
          Height = 14
          Caption = 'Conceito'
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 44
          Width = 57
          Height = 22
          DataField = 'Tip_Codigo'
          DataSource = dsCad
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 92
          Width = 617
          Height = 22
          DataField = 'Tip_Nome'
          DataSource = dsCad
          TabOrder = 1
        end
        object Ativo: TDBCheckBox
          Left = 24
          Top = 355
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'Tip_Ativo'
          DataSource = dsCad
          TabOrder = 3
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 24
          Top = 134
          Width = 217
          Height = 215
          Caption = 'Programa:'
          DataField = 'Tip_Programa'
          DataSource = dsCad
          Items.Strings = (
            '1-Chamado'
            '2-Visita'
            '3-Solicita'#231#227'o'
            '4-Vers'#227'o'
            '5-Qualidade'
            '6-Base de Conhecimento'
            '7-Atividades'
            '8-Agendamento'
            '9-Or'#231'amento'
            '9.1-Or'#231'amento n'#227'o Aprovado'
            '10-Recados'
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
            '9'
            '91'
            '10'
            '11')
        end
        object DBMemo1: TDBMemo
          Left = 247
          Top = 140
          Width = 394
          Height = 151
          DataField = 'Tip_Conceito'
          DataSource = dsCad
          TabOrder = 4
        end
      end
      inherited Panel4: TPanel
        Top = 386
        ExplicitTop = 386
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 427
      inherited Panel5: TPanel
        Height = 386
        ExplicitHeight = 386
        inherited PageControl2: TPageControl
          Height = 384
          ExplicitHeight = 384
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 642
            ExplicitHeight = 355
            inherited pnlGeral: TPanel
              Height = 355
              ExplicitHeight = 355
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 386
        ExplicitTop = 386
        inherited btnImprimir: TBitBtn
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMTipo.CDSConsulta
    Left = 316
    Top = 65
  end
  inherited dsCad: TDataSource
    DataSet = DMTipo.CDSCadastro
    Left = 384
    Top = 64
  end
end
