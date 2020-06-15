﻿inherited frmEscala: TfrmEscala
  Tag = 120
  Caption = 'Escalas'
  ClientHeight = 591
  ClientWidth = 794
  OnDestroy = FormDestroy
  ExplicitWidth = 800
  ExplicitHeight = 620
  PixelsPerInch = 96
  TextHeight = 14
  inherited pgControl: TPageControl
    Width = 794
    Height = 591
    ActivePage = tsEdicao
    ExplicitWidth = 794
    ExplicitHeight = 591
    inherited tsPesquisa: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 786
      ExplicitHeight = 562
      inherited Panel1: TPanel
        Width = 786
        Height = 521
        ExplicitWidth = 786
        ExplicitHeight = 521
        inherited GroupBox1: TGroupBox
          Width = 784
          ExplicitWidth = 784
        end
        inherited dbDados: TDBGrid
          Width = 784
          Height = 463
          DataSource = dsPesquisa
          PopupMenu = PopupMenu1
          Columns = <
            item
              Expanded = False
              FieldName = 'Esc_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'Esc_Data'
              Title.Alignment = taCenter
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Calc_DataExtenso'
              Title.Caption = 'Dia'
              Width = 155
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Esc_HoraInicio'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Esc_HoraFim'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_Nome'
              Width = 321
              Visible = True
            end>
        end
      end
      inherited Panel2: TPanel
        Top = 521
        Width = 786
        ExplicitTop = 521
        ExplicitWidth = 786
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
      ExplicitWidth = 786
      ExplicitHeight = 562
      inherited Panel3: TPanel
        Width = 786
        Height = 521
        ExplicitWidth = 786
        ExplicitHeight = 521
        object Label4: TLabel
          Left = 24
          Top = 24
          Width = 38
          Height = 14
          Caption = 'Data*'
        end
        object Label5: TLabel
          Left = 24
          Top = 80
          Width = 75
          Height = 14
          Caption = 'Hora In'#237'cio*'
        end
        object Label6: TLabel
          Left = 112
          Top = 80
          Width = 71
          Height = 14
          Caption = 'Hora Final*'
        end
        object Label7: TLabel
          Left = 24
          Top = 133
          Width = 56
          Height = 14
          Caption = 'Usu'#225'rio*'
        end
        object btnUsuario: TSpeedButton
          Left = 544
          Top = 152
          Width = 23
          Height = 22
          OnClick = btnUsuarioClick
        end
        object edtCodigo: TDBEdit
          Left = 24
          Top = 44
          Width = 97
          Height = 22
          DataField = 'Esc_Data'
          DataSource = dsCad
          TabOrder = 0
        end
        object edtNome: TDBEdit
          Left = 24
          Top = 100
          Width = 75
          Height = 22
          DataField = 'Esc_HoraInicio'
          DataSource = dsCad
          TabOrder = 1
        end
        object dbedtProd_Nome: TDBEdit
          Left = 112
          Top = 100
          Width = 75
          Height = 22
          DataField = 'Esc_HoraFim'
          DataSource = dsCad
          TabOrder = 2
        end
        object edtCodUsuario: TDBEdit
          Left = 24
          Top = 153
          Width = 74
          Height = 22
          Hint = '[F9] - Pesquisar'
          CustomHint = BalloonHint1
          DataField = 'Usu_Codigo'
          DataSource = dsCad
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnExit = edtCodUsuarioExit
          OnKeyDown = edtCodUsuarioKeyDown
        end
        object DBEdit1: TDBEdit
          Left = 104
          Top = 153
          Width = 433
          Height = 22
          TabStop = False
          DataField = 'Usu_Nome'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 4
        end
      end
      inherited Panel4: TPanel
        Top = 521
        Width = 786
        ExplicitTop = 521
        ExplicitWidth = 786
      end
    end
    inherited tsFiltro: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 25
      ExplicitWidth = 786
      ExplicitHeight = 562
      inherited Panel5: TPanel
        Width = 786
        Height = 521
        ExplicitWidth = 786
        ExplicitHeight = 521
        inherited PageControl2: TPageControl
          Width = 784
          Height = 519
          ExplicitWidth = 784
          ExplicitHeight = 519
          inherited tsGeral: TTabSheet
            ExplicitLeft = 4
            ExplicitTop = 25
            ExplicitWidth = 776
            ExplicitHeight = 490
            inherited pnlGeral: TPanel
              Width = 776
              Height = 490
              ExplicitWidth = 776
              ExplicitHeight = 490
              inherited Situação: TLabel
                Left = 337
                Top = 8
                Visible = False
                ExplicitLeft = 337
                ExplicitTop = 8
              end
              object Label39: TLabel [1]
                Left = 15
                Top = 16
                Width = 70
                Height = 14
                Caption = 'Data Inicial'
              end
              object Label40: TLabel [2]
                Left = 14
                Top = 64
                Width = 63
                Height = 14
                Caption = 'Data Final'
              end
              inherited cbbSituacao: TComboBox
                Left = 336
                Top = 27
                Visible = False
                ExplicitLeft = 336
                ExplicitTop = 27
              end
              object edtDataInicial: TMaskEdit
                Left = 15
                Top = 36
                Width = 87
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 1
                Text = '  /  /    '
              end
              object edtDataFinal: TMaskEdit
                Left = 14
                Top = 84
                Width = 89
                Height = 22
                EditMask = '##/##/####'
                MaxLength = 10
                TabOrder = 2
                Text = '  /  /    '
              end
              object GroupBox2: TGroupBox
                Left = 1
                Top = 132
                Width = 774
                Height = 357
                Align = alBottom
                Caption = 'Relat'#243'rios:'
                TabOrder = 3
                object Label23: TLabel
                  Left = 13
                  Top = 32
                  Width = 52
                  Height = 14
                  Caption = 'Modelos'
                end
                object cbbModelo: TComboBox
                  Left = 13
                  Top = 52
                  Width = 340
                  Height = 22
                  Style = csDropDownList
                  ItemIndex = 0
                  TabOrder = 0
                  Text = '01 - Escalas por Usu'#225'rio'
                  Items.Strings = (
                    '01 - Escalas por Usu'#225'rio')
                end
              end
            end
          end
          object tsUsuario: TTabSheet
            Caption = 'Usu'#225'rio'
            ImageIndex = 1
            object Panel7: TPanel
              Left = 0
              Top = 0
              Width = 776
              Height = 490
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              inline FraUsuario: TFraUsuario
                Left = 1
                Top = 1
                Width = 774
                Height = 488
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Verdana'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                ExplicitLeft = 1
                ExplicitTop = 1
                ExplicitWidth = 774
                ExplicitHeight = 488
                inherited edtCodigo: TEdit
                  TabOrder = 0
                end
                inherited edtNome: TEdit
                  TabOrder = 1
                end
                inherited dbTabela: TDBGrid
                  Height = 429
                  Columns = <
                    item
                      Expanded = False
                      FieldName = 'Codigo'
                      Title.Caption = 'C'#243'digo'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'Nome'
                      Width = 572
                      Visible = True
                    end>
                end
                inherited edtId: TEdit
                  TabOrder = 2
                end
              end
            end
          end
        end
      end
      inherited Panel6: TPanel
        Top = 521
        Width = 786
        ExplicitTop = 521
        ExplicitWidth = 786
        inherited btnImprimir: TBitBtn
          Left = 98
          OnClick = btnImprimirClick
          ExplicitLeft = 98
        end
      end
    end
  end
  inherited dsPesquisa: TDataSource
    Left = 324
    Top = 137
  end
  inherited dsCad: TDataSource
    Left = 416
    Top = 168
  end
  inherited BalloonHint1: TBalloonHint
    Left = 500
  end
  object PopupMenu1: TPopupMenu
    Left = 260
    Top = 257
    object Duplicar1: TMenuItem
      Caption = 'Duplicar'
      OnClick = Duplicar1Click
    end
  end
end
