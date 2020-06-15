inherited frmParametros: TfrmParametros
  Tag = 109
  Caption = 'Par'#226'metros'
  ClientHeight = 451
  ClientWidth = 894
  OnDestroy = FormDestroy
  ExplicitWidth = 900
  ExplicitHeight = 480
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 894
    Height = 451
    ExplicitWidth = 894
    ExplicitHeight = 451
    inherited tsPesquisa: TTabSheet
      ExplicitWidth = 886
      ExplicitHeight = 422
      inherited Panel1: TPanel
        Width = 886
        Height = 381
        ExplicitWidth = 886
        ExplicitHeight = 381
        inherited GroupBox1: TGroupBox
          Width = 884
          ExplicitWidth = 884
        end
        inherited dbDados: TDBGrid
          Width = 884
          Height = 323
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Par_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Par_Codigo'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Par_programa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Par_Nome'
              Width = 384
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Par_Valor'
              Width = 300
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 381
        Width = 886
        ExplicitTop = 381
        ExplicitWidth = 886
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
      ExplicitWidth = 886
      ExplicitHeight = 422
      inherited Panel3: TPanel
        Width = 886
        Height = 381
        ExplicitWidth = 886
        ExplicitHeight = 381
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
          Left = 24
          Top = 128
          Width = 61
          Height = 14
          Caption = 'Programa'
        end
        object Label7: TLabel
          Left = 24
          Top = 176
          Width = 43
          Height = 14
          Caption = 'Valor *'
        end
        object Label8: TLabel
          Left = 24
          Top = 224
          Width = 75
          Height = 14
          Caption = 'Observa'#231#227'o'
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 44
          Width = 61
          Height = 22
          DataField = 'Par_Codigo'
          DataSource = dsCad
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 92
          Width = 721
          Height = 22
          DataField = 'Par_Nome'
          DataSource = dsCad
          TabOrder = 1
        end
        object DBEdit1: TDBEdit
          Left = 24
          Top = 148
          Width = 175
          Height = 22
          DataField = 'Par_programa'
          DataSource = dsCad
          TabOrder = 2
        end
        object DBEdit2: TDBEdit
          Left = 24
          Top = 196
          Width = 719
          Height = 22
          DataField = 'Par_Valor'
          DataSource = dsCad
          TabOrder = 3
        end
        object DBMemo1: TDBMemo
          Left = 24
          Top = 238
          Width = 719
          Height = 137
          DataField = 'Par_Obs'
          DataSource = dsCad
          TabOrder = 4
        end
      end
      inherited Panel4: TPanel
        Top = 381
        Width = 886
        ExplicitTop = 381
        ExplicitWidth = 886
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 886
      ExplicitHeight = 422
      inherited Panel5: TPanel
        Width = 886
        Height = 381
        ExplicitWidth = 886
        ExplicitHeight = 381
        inherited PageControl2: TPageControl
          Width = 884
          Height = 379
          ExplicitWidth = 884
          ExplicitHeight = 379
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 876
            ExplicitHeight = 350
            inherited pnlGeral: TPanel
              Width = 876
              Height = 350
              ExplicitWidth = 876
              ExplicitHeight = 350
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 381
        Width = 886
        ExplicitTop = 381
        ExplicitWidth = 886
        inherited btnImprimir: TBitBtn
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMParametros.CDSConsulta
    Left = 316
    Top = 65
  end
  inherited dsCad: TDataSource
    DataSet = DMParametros.CDSCadastro
    Left = 384
    Top = 64
  end
end
