inherited frmFormaPagto: TfrmFormaPagto
  Tag = 115
  Caption = 'Formas de Pagamento'
  ClientHeight = 416
  OnDestroy = FormDestroy
  ExplicitWidth = 666
  ExplicitHeight = 445
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Height = 416
    ActivePage = tsEdicao
    ExplicitHeight = 416
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 387
      inherited Panel1: TPanel
        Height = 346
        ExplicitHeight = 346
        inherited dbDados: TDBGrid
          Height = 288
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Fpg_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Fpg_Codigo'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Fpg_Nome'
              Width = 530
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 346
        ExplicitTop = 346
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 387
      inherited Panel3: TPanel
        Height = 346
        ExplicitHeight = 346
        object Label4: TLabel
          Left = 24
          Top = 24
          Width = 52
          Height = 14
          Caption = 'C'#243'digo*'
        end
        object Label5: TLabel
          Left = 24
          Top = 72
          Width = 68
          Height = 14
          Caption = 'Descri'#231#227'o*'
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 44
          Width = 57
          Height = 22
          DataField = 'Fpg_Codigo'
          DataSource = dsCad
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 92
          Width = 601
          Height = 22
          DataField = 'Fpg_Nome'
          DataSource = dsCad
          TabOrder = 1
        end
        object Ativo: TDBCheckBox
          Left = 24
          Top = 323
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'Fpg_Ativo'
          DataSource = dsCad
          TabOrder = 3
        end
        object dbForma: TDBGrid
          Left = 24
          Top = 128
          Width = 601
          Height = 189
          DataSource = dsItens
          TabOrder = 2
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDrawColumnCell = dbFormaDrawColumnCell
          OnEnter = dbFormaEnter
          OnExit = dbFormaExit
          OnKeyDown = dbFormaKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'FpgIte_Dias'
              Width = 71
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FpgIte_Obs'
              Width = 486
              Visible = True
            end>
        end
      end
      inherited Panel4: TPanel
        Top = 346
        ExplicitTop = 346
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 387
      inherited Panel5: TPanel
        Height = 346
        ExplicitHeight = 346
        inherited PageControl2: TPageControl
          Height = 344
          ExplicitHeight = 344
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 642
            ExplicitHeight = 315
            inherited pnlGeral: TPanel
              Height = 315
              ExplicitHeight = 315
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 346
        ExplicitTop = 346
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
    DataSet = DMFormaPagto.CDSConsulta
    Left = 316
    Top = 65
  end
  inherited dsCad: TDataSource
    DataSet = DMFormaPagto.CDSCadastro
    Left = 384
    Top = 64
  end
  object dsItens: TDataSource
    DataSet = DMFormaPagto.CDSItens
    OnStateChange = dsItensStateChange
    Left = 320
    Top = 208
  end
end
