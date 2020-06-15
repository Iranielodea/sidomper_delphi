object frmChamadoGrafico1: TfrmChamadoGrafico1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Gr'#225'fico'
  ClientHeight = 399
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object DBChart1: TDBChart
    Left = 0
    Top = 0
    Width = 794
    Height = 358
    Title.Font.Color = clBlack
    Title.Font.Height = -19
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'Chamados - Estat'#237'stica de Chamados e Horas por Per'#237'odo')
    Title.Transparency = 6
    BottomAxis.LabelsFormat.TextAlignment = taCenter
    DepthAxis.LabelsFormat.TextAlignment = taCenter
    DepthTopAxis.LabelsFormat.TextAlignment = taCenter
    LeftAxis.LabelsFormat.TextAlignment = taCenter
    RightAxis.LabelsFormat.TextAlignment = taCenter
    TopAxis.LabelsFormat.TextAlignment = taCenter
    Zoom.Pen.Mode = pmNotXor
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 400
    ExplicitHeight = 250
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TFastLineSeries
      Marks.Visible = False
      DataSource = DBCrossTabSource1
      Title = 'Chamados'
      LinePen.Color = 10708548
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      object TeeFunction1: TAddTeeFunction
        CalcByValue = False
      end
    end
    object Series2: TFastLineSeries
      Marks.Visible = False
      DataSource = DBCrossTabSource2
      Title = 'Horas'
      LinePen.Color = 3513587
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      object TeeFunction2: TAddTeeFunction
        CalcByValue = False
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 358
    Width = 794
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 256
    ExplicitTop = 312
    ExplicitWidth = 185
    object btnSair: TBitBtn
      Left = 12
      Top = 6
      Width = 90
      Height = 25
      Hint = 'Esc'
      CustomHint = DM.BalloonHint1
      Caption = 'Sair'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSairClick
    end
  end
  object CDSGrafico1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelChamadoModelo5'
    RemoteServer = DM.DSPConexao
    Left = 32
    Top = 32
    object CDSGrafico1Cha_DataAbertura: TDateField
      FieldName = 'Cha_DataAbertura'
      ReadOnly = True
    end
    object CDSGrafico1QtdeChamados: TIntegerField
      FieldName = 'QtdeChamados'
      ReadOnly = True
    end
    object CDSGrafico1TotalHoras: TFloatField
      FieldName = 'TotalHoras'
      ReadOnly = True
    end
  end
  object DBCrossTabSource1: TDBCrossTabSource
    Active = True
    DataSet = CDSGrafico1
    LabelField = 'Cha_DataAbertura'
    Series = Series1
    ValueField = 'QtdeChamados'
  end
  object DBCrossTabSource2: TDBCrossTabSource
    Active = True
    DataSet = CDSGrafico1
    LabelField = 'Cha_DataAbertura'
    Series = Series2
    ValueField = 'TotalHoras'
  end
end
