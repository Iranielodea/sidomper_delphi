object frmInstrucaoSQL: TfrmInstrucaoSQL
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Instru'#231#245'es SQL'
  ClientHeight = 671
  ClientWidth = 1194
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCorpo: TPanel
    Left = 0
    Top = 0
    Width = 1194
    Height = 630
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitTop = 41
    ExplicitHeight = 589
    DesignSize = (
      1194
      630)
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 217
      Height = 628
      Align = alLeft
      BevelOuter = bvLowered
      TabOrder = 0
      ExplicitHeight = 587
      object Panel2: TPanel
        Left = 1
        Top = 222
        Width = 215
        Height = 405
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        ExplicitHeight = 364
        object lstCampos: TListBox
          Left = 1
          Top = 30
          Width = 213
          Height = 374
          Align = alClient
          ItemHeight = 13
          TabOrder = 1
        end
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 213
          Height = 29
          Align = alTop
          Caption = 'Campos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 215
        Height = 221
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object lstTabelas: TListBox
          Left = 1
          Top = 30
          Width = 213
          Height = 190
          Align = alClient
          ItemHeight = 13
          TabOrder = 1
          OnClick = lstTabelasClick
        end
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 213
          Height = 29
          Align = alTop
          Caption = 'Tabelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ExplicitLeft = 3
          ExplicitTop = -5
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 224
      Top = 6
      Width = 960
      Height = 259
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Instru'#231#227'o:'
      TabOrder = 1
      DesignSize = (
        960
        259)
      object mmInstrucao: TMemo
        Left = 3
        Top = 16
        Width = 954
        Height = 201
        Anchors = [akLeft, akTop, akRight, akBottom]
        TabOrder = 0
      end
      object btnExecutar: TBitBtn
        Left = 867
        Top = 223
        Width = 90
        Height = 25
        Caption = '&Executar'
        TabOrder = 1
        OnClick = btnExecutarClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 224
      Top = 271
      Width = 958
      Height = 353
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Resultado:'
      TabOrder = 2
      ExplicitHeight = 312
      object dbGrade: TDBGrid
        Left = 2
        Top = 15
        Width = 954
        Height = 336
        Align = alClient
        DataSource = dsTabela
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbGradeDrawColumnCell
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 630
    Width = 1194
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object btnCancelar: TBitBtn
      Left = 1080
      Top = 6
      Width = 100
      Height = 25
      Hint = 'Esc'
      Caption = 'Cancela&r'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnCancelarClick
    end
  end
  object dsTabela: TDataSource
    DataSet = DMUtilitario.CDSInstrucaoSQL
    Left = 384
    Top = 384
  end
end
