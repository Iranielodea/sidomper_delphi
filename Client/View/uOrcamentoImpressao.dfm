object frmOrcamentoImpressao: TfrmOrcamentoImpressao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Impress'#227'o de Or'#231'amentos'
  ClientHeight = 364
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 323
    Width = 617
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object btnImprimir: TBitBtn
      Left = 235
      Top = 6
      Width = 90
      Height = 25
      Hint = 'F7'
      Caption = '&Imprimir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnImprimirClick
    end
    object btnVoltar: TBitBtn
      Left = 331
      Top = 6
      Width = 90
      Height = 25
      Hint = 'Esc'
      Caption = '&Cancelar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnVoltarClick
    end
    object btnEmail: TBitBtn
      Left = 139
      Top = 6
      Width = 90
      Height = 25
      Hint = 'F6'
      Caption = 'E-mail'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnEmailClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 617
    Height = 323
    ActivePage = tsConfig
    Align = alClient
    TabOrder = 0
    object tsImpressao: TTabSheet
      Caption = 'Impress'#227'o'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 609
        Height = 294
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 80
          Top = 212
          Width = 132
          Height = 14
          Caption = 'Modelo de Relat'#243'rios'
          Visible = False
        end
        object cbbModelo: TComboBox
          Left = 80
          Top = 232
          Width = 433
          Height = 22
          Style = csDropDownList
          TabOrder = 0
          Visible = False
        end
        object rgImpressao: TRadioGroup
          Left = 16
          Top = 20
          Width = 185
          Height = 105
          Caption = 'Modelos de Relat'#243'rios'
          ItemIndex = 0
          Items.Strings = (
            'Detalhado'
            'Simplificado')
          TabOrder = 1
        end
      end
    end
    object tsConfig: TTabSheet
      Caption = 'Configura'#231#227'o'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 609
        Height = 294
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object btnConfig: TButton
          Left = 8
          Top = 16
          Width = 297
          Height = 25
          Caption = 'Configura'#231#227'o de Relat'#243'rios'
          TabOrder = 0
          OnClick = btnConfigClick
        end
      end
    end
  end
end
