inherited frmCidade: TfrmCidade
  Tag = 121
  Caption = 'Cidades'
  ClientHeight = 471
  ClientWidth = 694
  OnDestroy = FormDestroy
  ExplicitTop = -88
  ExplicitWidth = 700
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 694
    Height = 471
    ActivePage = tsEdicao
    ExplicitWidth = 694
    ExplicitHeight = 471
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 686
      ExplicitHeight = 442
      inherited Panel1: TPanel
        Width = 686
        Height = 401
        ExplicitWidth = 686
        ExplicitHeight = 401
        inherited GroupBox1: TGroupBox
          Width = 684
          ExplicitWidth = 684
        end
        inherited dbDados: TDBGrid
          Width = 684
          Height = 343
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Cid_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Cid_Codigo'
              Title.Alignment = taCenter
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cid_Nome'
              Width = 516
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cid_UF'
              Width = 37
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 401
        Width = 686
        ExplicitTop = 401
        ExplicitWidth = 686
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
      ExplicitWidth = 686
      ExplicitHeight = 442
      inherited Panel3: TPanel
        Width = 686
        Height = 401
        ExplicitWidth = 686
        ExplicitHeight = 401
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
          Top = 120
          Width = 16
          Height = 14
          Caption = 'UF'
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 44
          Width = 74
          Height = 22
          DataField = 'Cid_Codigo'
          DataSource = dsCad
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 92
          Width = 449
          Height = 22
          DataField = 'Cid_Nome'
          DataSource = dsCad
          TabOrder = 1
        end
        object Ativo: TDBCheckBox
          Left = 24
          Top = 168
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'Cid_Ativo'
          DataSource = dsCad
          TabOrder = 3
        end
        object DBEdit1: TDBEdit
          Left = 24
          Top = 134
          Width = 74
          Height = 22
          DataField = 'Cid_UF'
          DataSource = dsCad
          TabOrder = 2
        end
      end
      inherited Panel4: TPanel
        Top = 401
        Width = 686
        ExplicitTop = 401
        ExplicitWidth = 686
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 686
      ExplicitHeight = 442
      inherited Panel5: TPanel
        Width = 686
        Height = 401
        ExplicitWidth = 686
        ExplicitHeight = 401
        inherited PageControl2: TPageControl
          Width = 684
          Height = 399
          ExplicitWidth = 684
          ExplicitHeight = 399
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 676
            ExplicitHeight = 370
            inherited pnlGeral: TPanel
              Width = 676
              Height = 370
              ExplicitWidth = 676
              ExplicitHeight = 370
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 401
        Width = 686
        ExplicitTop = 401
        ExplicitWidth = 686
        inherited btnImprimir: TBitBtn
          OnClick = btnImprimirClick
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = DMCidade.CDSConsulta
    Left = 316
    Top = 65
  end
  inherited dsCad: TDataSource
    DataSet = DMCidade.CDSCadastro
    Left = 384
    Top = 64
  end
end
