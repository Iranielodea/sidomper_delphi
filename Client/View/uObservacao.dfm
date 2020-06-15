inherited frmObservacao: TfrmObservacao
  Tag = 116
  Caption = 'Observa'#231#245'es'
  ClientHeight = 509
  OnDestroy = FormDestroy
  ExplicitTop = -76
  ExplicitWidth = 666
  ExplicitHeight = 538
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Height = 509
    ActivePage = tsEdicao
    ParentFont = False
    ExplicitHeight = 509
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 480
      inherited Panel1: TPanel
        Height = 439
        ExplicitHeight = 439
        inherited dbDados: TDBGrid
          Height = 292
          DataSource = dsPesquisa
          Columns = <
            item
              Expanded = False
              FieldName = 'Obs_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Obs_Codigo'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Obs_Nome'
              Width = 543
              Visible = True
            end>
        end
        object DBRichEdit1: TDBRichEdit
          Left = 1
          Top = 349
          Width = 650
          Height = 89
          TabStop = False
          Align = alBottom
          DataField = 'Obs_Descricao'
          DataSource = dsPesquisa
          ParentFont = True
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
      inherited Panel2: TPanel
        Top = 439
        ExplicitTop = 439
        inherited btnNovo: TBitBtn
          ParentFont = False
        end
      end
    end
    inherited tsEdicao: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 480
      inherited Panel3: TPanel
        Height = 439
        ExplicitHeight = 439
        object Label4: TLabel
          Left = 24
          Top = 24
          Width = 52
          Height = 14
          Caption = 'C'#243'digo*'
        end
        object Label5: TLabel
          Left = 23
          Top = 115
          Width = 68
          Height = 14
          Caption = 'Descri'#231#227'o*'
        end
        object Label6: TLabel
          Left = 24
          Top = 74
          Width = 44
          Height = 14
          Caption = 'Nome*'
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 44
          Width = 57
          Height = 22
          DataField = 'Obs_Codigo'
          DataSource = dsCad
          TabOrder = 0
        end
        object Ativo: TDBCheckBox
          Left = 113
          Top = 404
          Width = 97
          Height = 17
          Caption = 'Ativo'
          DataField = 'Obs_Ativo'
          DataSource = dsCad
          TabOrder = 7
        end
        object edtObservacao: TDBRichEdit
          Left = 513
          Top = 0
          Width = 120
          Height = 25
          DataField = 'Obs_Descricao'
          DataSource = dsCad
          ParentFont = True
          ScrollBars = ssVertical
          TabOrder = 4
          Visible = False
          OnEnter = edtObservacaoEnter
          OnExit = edtObservacaoExit
          OnKeyDown = edtObservacaoKeyDown
        end
        object btnFormatarTecnico: TBitBtn
          Left = 513
          Top = 31
          Width = 120
          Height = 36
          Hint = 'Formata'#231#227'o'
          Caption = 'Formatar Texto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Bell MT'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TabStop = False
          Visible = False
          OnClick = btnFormatarTecnicoClick
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 89
          Width = 609
          Height = 22
          DataField = 'Obs_Nome'
          DataSource = dsCad
          TabOrder = 1
        end
        object DBRadioGroup1: TDBRadioGroup
          Left = 24
          Top = 293
          Width = 609
          Height = 105
          Caption = 'Programa:'
          Columns = 3
          DataField = 'Obs_Programa'
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
            '9-Or'#231'amento'
            '10-Tabela de Pre'#231'o')
          TabOrder = 5
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
            '10')
          OnClick = DBRadioGroup1Click
        end
        object DBCheckBox1: TDBCheckBox
          Left = 25
          Top = 404
          Width = 73
          Height = 17
          Caption = 'Padr'#227'o'
          DataField = 'Obs_Padrao'
          DataSource = dsCad
          TabOrder = 6
        end
        object DBMemo1: TDBMemo
          Left = 24
          Top = 135
          Width = 609
          Height = 146
          DataField = 'Obs_Descricao'
          DataSource = dsCad
          ScrollBars = ssVertical
          TabOrder = 2
          OnEnter = DBMemo1Enter
          OnExit = DBMemo1Exit
          OnKeyDown = DBMemo1KeyDown
        end
      end
      inherited Panel4: TPanel
        Top = 439
        ExplicitTop = 439
        object btnEmail: TBitBtn
          Left = 186
          Top = 6
          Width = 90
          Height = 25
          Caption = 'Obs Email'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = btnEmailClick
        end
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 652
      ExplicitHeight = 480
      inherited Panel5: TPanel
        Height = 439
        ExplicitHeight = 439
        inherited PageControl2: TPageControl
          Height = 437
          ExplicitHeight = 437
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 642
            ExplicitHeight = 408
            inherited pnlGeral: TPanel
              Height = 408
              ExplicitHeight = 408
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 439
        ExplicitTop = 439
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
    DataSet = DMObservacao.CDSConsulta
    Left = 348
    Top = 1
  end
  inherited dsCad: TDataSource
    DataSet = DMObservacao.CDSCadastro
    Left = 384
    Top = 0
  end
  inherited BalloonHint1: TBalloonHint
    Left = 428
    Top = 1
  end
end
