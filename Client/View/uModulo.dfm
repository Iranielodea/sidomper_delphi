inherited frmModulo: TfrmModulo
  Tag = 102
  Caption = 'M'#243'dulos'
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
              FieldName = 'Mod_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Mod_Codigo'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Mod_Nome'
              Width = 538
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
          DataField = 'Mod_Codigo'
          DataSource = dsCad
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 92
          Width = 449
          Height = 22
          DataField = 'Mod_Nome'
          DataSource = dsCad
          TabOrder = 1
        end
        object Ativo: TDBCheckBox
          Left = 24
          Top = 136
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'Mod_Ativo'
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
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMModulo.CDSConsulta
    Left = 316
    Top = 65
  end
  inherited dsCad: TDataSource
    DataSet = DMModulo.CDSCadastro
    Left = 384
    Top = 64
  end
end
