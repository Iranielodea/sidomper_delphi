inherited frmFeriado: TfrmFeriado
  Tag = 123
  Caption = 'Feriados'
  OnDestroy = FormDestroy
  ExplicitWidth = 666
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
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
              FieldName = 'Fer_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Fer_Data'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Fer_Descricao'
              Title.Caption = 'Descri'#231#227'o'
              Width = 507
              Visible = True
            end>
        end
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 337
      inherited Panel3: TPanel
        object Label4: TLabel
          Left = 24
          Top = 24
          Width = 21
          Height = 14
          Caption = 'Id*'
        end
        object Label5: TLabel
          Left = 24
          Top = 80
          Width = 38
          Height = 14
          Caption = 'Data*'
        end
        object Label6: TLabel
          Left = 24
          Top = 134
          Width = 68
          Height = 14
          Caption = 'Descri'#231#227'o*'
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 44
          Width = 57
          Height = 22
          TabStop = False
          DataField = 'Fer_Id'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 100
          Width = 145
          Height = 22
          DataField = 'Fer_Data'
          DataSource = dsCad
          TabOrder = 1
        end
        object DBEdit1: TDBEdit
          Left = 24
          Top = 154
          Width = 449
          Height = 22
          DataField = 'Fer_Descricao'
          DataSource = dsCad
          TabOrder = 2
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
          Left = 99
          Top = 7
          OnClick = btnImprimirClick
          ExplicitLeft = 99
          ExplicitTop = 7
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMFeriado.CDSConsulta
    Left = 316
    Top = 65
  end
  inherited dsCad: TDataSource
    DataSet = DMFeriado.CDSCadastro
    Left = 384
    Top = 64
  end
end
