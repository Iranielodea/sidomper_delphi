object DMRevenda: TDMRevenda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 224
  Width = 301
  object CDSConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRevendaCons'
    OnCalcFields = CDSConsultaCalcFields
    Left = 32
    Top = 24
    object CDSConsultaRev_Id: TAutoIncField
      FieldName = 'Rev_Id'
      Origin = 'Rev_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSConsultaRev_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Rev_Codigo'
      Origin = 'Rev_Codigo'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSConsultaRev_Nome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'Rev_Nome'
      Origin = 'Rev_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaRev_Ativo: TBooleanField
      FieldName = 'Rev_Ativo'
      Origin = 'Rev_Ativo'
      Required = True
    end
    object CDSConsultaCAtivo: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CAtivo'
      Size = 3
    end
  end
  object CDSCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRevendaCad'
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    Left = 112
    Top = 24
    object CDSCadastroRev_Id: TAutoIncField
      FieldName = 'Rev_Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CDSCadastroRev_Ativo: TBooleanField
      FieldName = 'Rev_Ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroRev_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Rev_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroRev_Nome: TWideStringField
      FieldName = 'Rev_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
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
        Caption = 'Relat'#243'rio de Revendas'
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
        Caption = 'Ativo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 132557
        mmTop = 12700
        mmWidth = 9260
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
        DataField = 'Rev_Codigo'
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
        DataField = 'Rev_Nome'
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
        DataField = 'CAtivo'
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
        mmWidth = 17198
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
        DataField = 'Rev_Id'
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
  object CDSEmail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRevendaEmail'
    BeforePost = CDSEmailBeforePost
    Left = 184
    Top = 24
    object CDSEmailRevEm_Id: TAutoIncField
      FieldName = 'RevEm_Id'
    end
    object CDSEmailRevEm_Revenda: TIntegerField
      FieldName = 'RevEm_Revenda'
      Required = True
    end
    object CDSEmailRevEm_Email: TStringField
      DisplayLabel = 'Email'
      FieldName = 'RevEm_Email'
      Required = True
      Size = 80
    end
  end
end
