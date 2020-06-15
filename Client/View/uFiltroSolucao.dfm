object frmFiltroSolucao: TfrmFiltroSolucao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Filtro'
  ClientHeight = 352
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 729
    Height = 311
    ActivePage = tsCliente
    Align = alClient
    TabOrder = 0
    object tsCliente: TTabSheet
      Caption = 'Cliente'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 721
        Height = 283
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        inline FraCliente: TFraCliente
          Left = 1
          Top = 1
          Width = 719
          Height = 281
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
          ExplicitWidth = 719
          ExplicitHeight = 281
          inherited dbCliente: TDBGrid
            Left = 0
            Width = 719
            Height = 242
            Align = alBottom
            Columns = <
              item
                Expanded = False
                FieldName = 'Cli_Codigo'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Cli_Nome'
                Width = 576
                Visible = True
              end>
          end
          inherited BalloonHint1: TBalloonHint
            Top = 136
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 311
    Width = 729
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object btnConfirmar: TBitBtn
      Left = 240
      Top = 6
      Width = 90
      Height = 25
      Hint = 'F2'
      CustomHint = FraCliente.BalloonHint1
      Caption = '&Confirmar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnVoltar: TBitBtn
      Left = 432
      Top = 6
      Width = 90
      Height = 25
      Hint = 'Esc'
      CustomHint = FraCliente.BalloonHint1
      Caption = '&Voltar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnVoltarClick
    end
    object btnExcluir: TBitBtn
      Left = 336
      Top = 6
      Width = 90
      Height = 25
      Hint = 'Ctrl + Del'
      CustomHint = FraCliente.BalloonHint1
      Caption = '&Excluir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
  end
end
