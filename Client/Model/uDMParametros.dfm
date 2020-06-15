object DMParametros: TDMParametros
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 224
  Width = 301
  object CDSConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametrosCons'
    Left = 32
    Top = 24
    object CDSConsultaPar_Id: TAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'Par_Id'
      Origin = 'Par_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSConsultaPar_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Par_Codigo'
      Origin = 'Par_Codigo'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSConsultaPar_programa: TIntegerField
      DisplayLabel = 'Programa'
      FieldName = 'Par_programa'
      Origin = 'Par_programa'
    end
    object CDSConsultaPar_Nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Par_Nome'
      Origin = 'Par_Nome'
      Required = True
      Size = 200
    end
    object CDSConsultaPar_Valor: TStringField
      DisplayLabel = 'Valor'
      FieldName = 'Par_Valor'
      Required = True
      Size = 250
    end
  end
  object CDSCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametrosCad'
    OnReconcileError = CDSCadastroReconcileError
    Left = 112
    Top = 24
    object CDSCadastroPar_Id: TAutoIncField
      FieldName = 'Par_Id'
      Origin = 'Par_Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CDSCadastroPar_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Par_Codigo'
      Origin = 'Par_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroPar_programa: TIntegerField
      FieldName = 'Par_programa'
      Origin = 'Par_programa'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCadastroPar_Nome: TStringField
      FieldName = 'Par_Nome'
      Origin = 'Par_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object CDSCadastroPar_Valor: TStringField
      FieldName = 'Par_Valor'
      Origin = 'Par_Valor'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 250
    end
    object CDSCadastroPar_Obs: TStringField
      FieldName = 'Par_Obs'
      Origin = 'Par_Obs'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object dbConsulta: TppDBPipeline
    DataSource = DSConsulta
    UserName = 'dbConsulta'
    Left = 32
    Top = 136
  end
  object Rel: TppReport
    AutoStop = False
    DataPipeline = dbConsulta
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PreviewFormSettings.WindowState = wsMaximized
    PreviewFormSettings.ZoomSetting = zs100Percent
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<Texto a localizar>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 104
    Top = 136
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbConsulta'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 12700
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 19315
        mmTop = 12700
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 16668
        mmWidth = 196850
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relat'#243'rio de Par'#226'metros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 32015
        mmTop = 0
        mmWidth = 133086
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 0
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3968
        mmLeft = 0
        mmTop = 4763
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 170127
        mmTop = 0
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Programa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 132557
        mmTop = 12700
        mmWidth = 14816
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Par_Codigo'
        DataPipeline = dbConsulta
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'dbConsulta'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 13494
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Par_Nome'
        DataPipeline = dbConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbConsulta'
        mmHeight = 4498
        mmLeft = 19315
        mmTop = 0
        mmWidth = 110067
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'Par_programa'
        DataPipeline = dbConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbConsulta'
        mmHeight = 4498
        mmLeft = 132557
        mmTop = 0
        mmWidth = 27517
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        Weight = 0.750000000000000000
        mmHeight = 2381
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 7
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 4498
        mmWidth = 11113
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'Par_Id'
        DataPipeline = dbConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbConsulta'
        mmHeight = 4498
        mmLeft = 13758
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object DSConsulta: TDataSource
    DataSet = CDSConsulta
    Left = 32
    Top = 80
  end
  object CDSParametrosTitulosChamados: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParametrosTitulosChamados'
    Left = 200
    Top = 24
    object CDSParametrosTitulosChamadosPar_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSParametrosTitulosChamadosSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSParametrosTitulosChamadosSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Required = True
      Size = 50
    end
  end
end
