object frmSolicitacaoDetalhes: TfrmSolicitacaoDetalhes
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Detalhes da Solicita'#231#227'o'
  ClientHeight = 604
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 782
    Height = 57
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 3
      Top = 0
      Width = 550
      Height = 51
      Caption = 'Siglas:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 26
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Abertura'
      end
      object shpAbertura: TShape
        Left = 3
        Top = 24
        Width = 17
        Height = 13
      end
      object Label2: TLabel
        Left = 115
        Top = 22
        Width = 45
        Height = 13
        Caption = 'Analista'
      end
      object shpAnalista: TShape
        Left = 92
        Top = 22
        Width = 17
        Height = 13
      end
      object Label3: TLabel
        Left = 189
        Top = 22
        Width = 72
        Height = 13
        Caption = 'Cronograma'
      end
      object shpCronograma: TShape
        Left = 166
        Top = 22
        Width = 17
        Height = 13
      end
      object Label4: TLabel
        Left = 290
        Top = 22
        Width = 69
        Height = 13
        Caption = 'Ocorr. Geral'
      end
      object shpOcorrGeral: TShape
        Left = 267
        Top = 22
        Width = 17
        Height = 13
      end
      object shpOcorrTecnica: TShape
        Left = 366
        Top = 22
        Width = 17
        Height = 13
      end
      object Label5: TLabel
        Left = 389
        Top = 22
        Width = 81
        Height = 13
        Caption = 'Ocorr. T'#233'cnica'
      end
      object shpOcorrStatus: TShape
        Left = 481
        Top = 22
        Width = 17
        Height = 13
      end
      object Label6: TLabel
        Left = 504
        Top = 22
        Width = 36
        Height = 13
        Caption = 'Status'
      end
    end
  end
  object CategoryPanelGroup1: TCategoryPanelGroup
    Left = 0
    Top = 57
    Width = 783
    Height = 547
    VertScrollBar.Tracking = True
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    TabOrder = 1
    object ctpOcorrencias: TCategoryPanel
      Top = 210
      Height = 450
      Caption = 'Ocorr'#234'ncias e Status'
      TabOrder = 3
      ExplicitWidth = 781
      object mmoGeral: TRichEdit
        Left = 0
        Top = 0
        Width = 762
        Height = 424
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object ctpCronograma: TCategoryPanel
      Top = 180
      Height = 30
      Caption = 'Cronograma'
      Collapsed = True
      TabOrder = 2
      ExplicitWidth = 781
      ExpandedHeight = 80
      object mmoCronograma: TRichEdit
        Left = 0
        Top = 0
        Width = 762
        Height = 0
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object ctpAnalise: TCategoryPanel
      Top = 150
      Height = 30
      Caption = 'An'#225'lise'
      Collapsed = True
      TabOrder = 1
      ExplicitWidth = 781
      ExpandedHeight = 100
      object mmoAnalise: TRichEdit
        Left = 0
        Top = 0
        Width = 762
        Height = 0
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object ctpAbertura: TCategoryPanel
      Top = 0
      Height = 150
      Caption = 'Abertura'
      TabOrder = 0
      ExplicitWidth = 781
      object mmoObs: TRichEdit
        Left = 0
        Top = 0
        Width = 762
        Height = 124
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 96
    object cdsDadosTipo: TIntegerField
      FieldName = 'Tipo'
    end
    object cdsDadosData: TDateField
      FieldName = 'Data'
    end
    object cdsDadosHora: TStringField
      FieldName = 'Hora'
      Size = 5
    end
    object cdsDadosOperador: TStringField
      FieldName = 'Operador'
      Size = 50
    end
    object cdsDadosAnexo: TStringField
      FieldName = 'Anexo'
      Size = 200
    end
    object cdsDadosDescricao: TStringField
      FieldName = 'Descricao'
      Size = 500
    end
    object cdsDadosStatus: TStringField
      FieldName = 'Status'
      Size = 50
    end
    object cdsDadosDescricaoMemo: TMemoField
      FieldName = 'DescricaoMemo'
      BlobType = ftMemo
    end
  end
end
