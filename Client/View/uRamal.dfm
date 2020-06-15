inherited frmRamal: TfrmRamal
  Tag = 118
  Caption = 'Ramal'
  ClientHeight = 443
  OnDestroy = FormDestroy
  ExplicitWidth = 666
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Height = 443
    ParentFont = False
    ExplicitHeight = 443
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 414
      inherited Panel1: TPanel
        Height = 373
        ExplicitHeight = 373
        inherited dbDados: TDBGrid
          Height = 315
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Ram_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Ram_Departamento'
              Width = 598
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ModR_Descricao'
              Visible = False
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 373
        ExplicitTop = 373
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 414
      inherited Panel3: TPanel
        Height = 373
        ExplicitHeight = 373
        object Label5: TLabel
          Left = 11
          Top = 16
          Width = 99
          Height = 14
          Caption = 'Departamento*'
        end
        object Label4: TLabel
          Left = 11
          Top = 76
          Width = 48
          Height = 14
          Caption = 'Ramais'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDepartamento: TDBEdit
          Left = 11
          Top = 36
          Width = 593
          Height = 22
          DataField = 'Ram_Departamento'
          DataSource = dsCad
          TabOrder = 0
        end
        object dbItens: TDBGrid
          Left = 11
          Top = 96
          Width = 593
          Height = 271
          DataSource = dsItens
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDrawColumnCell = dbItensDrawColumnCell
          OnEnter = dbItensEnter
          OnExit = dbItensExit
          OnKeyDown = dbItensKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'RamIt_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'RamIt_Numero'
              Title.Alignment = taCenter
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RamIt_Nome'
              Width = 454
              Visible = True
            end>
        end
      end
      inherited Panel4: TPanel
        Top = 373
        ExplicitTop = 373
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 414
      inherited Panel5: TPanel
        Height = 373
        ExplicitHeight = 373
        inherited PageControl2: TPageControl
          Height = 371
          ExplicitHeight = 371
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 642
            ExplicitHeight = 342
            inherited pnlGeral: TPanel
              Height = 342
              ExplicitHeight = 342
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
        Top = 373
        ExplicitTop = 373
        inherited btnImprimir: TBitBtn
          Left = 99
          Top = 7
          OnClick = btnImprimirClick
          ExplicitLeft = 99
          ExplicitTop = 7
        end
        inherited btnFecharFiltro: TBitBtn
          Top = 7
          ExplicitTop = 7
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    DataSet = dmRamal.CDSConsulta
    Left = 396
    Top = 217
  end
  inherited dsCad: TDataSource
    DataSet = dmRamal.CDSCadastro
    Left = 512
    Top = 232
  end
  inherited BalloonHint1: TBalloonHint
    Left = 460
    Top = 169
  end
  object dsItens: TDataSource
    DataSet = dmRamal.CDSItens
    OnStateChange = dsItensStateChange
    Left = 320
    Top = 224
  end
end
