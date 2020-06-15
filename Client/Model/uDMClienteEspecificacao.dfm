inherited DMClienteEspecificacao: TDMClienteEspecificacao
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 200
  inherited CDSConsulta: TClientDataSet
    AggregatesActive = True
    ProviderName = 'dspClienteEspCons'
    object CDSConsultaCliEsp_Id: TIntegerField
      FieldName = 'CliEsp_Id'
      Origin = 'CliEsp_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      Required = True
    end
    object CDSConsultaCliEsp_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'CliEsp_Data'
      Origin = 'CliEsp_Data'
      Required = True
      OnSetText = CDSConsultaCliEsp_DataSetText
      EditMask = '##/##/####'
    end
    object CDSConsultaCliEsp_Nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'CliEsp_Nome'
      Size = 100
    end
    object CDSConsultaCliEsp_Item: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Item'
      FieldName = 'CliEsp_Item'
      Origin = 'CliEsp_Item'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSConsultaCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      Required = True
    end
    object CDSConsultaCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaC_Item: TAggregateField
      FieldName = 'C_Item'
      Active = True
      DisplayName = ''
      Expression = 'MAX(CliEsp_Item)'
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspClienteEspCad'
    BeforePost = CDSCadastroBeforePost
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroCliEsp_Id: TAutoIncField
      FieldName = 'CliEsp_Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object CDSCadastroCliEsp_Cliente: TIntegerField
      FieldName = 'CliEsp_Cliente'
      Required = True
    end
    object CDSCadastroCliEsp_Data: TDateField
      FieldName = 'CliEsp_Data'
      Required = True
      EditMask = '##/##/####'
    end
    object CDSCadastroCliEsp_Descricao: TWideStringField
      FieldName = 'CliEsp_Descricao'
      Required = True
      Size = 800
    end
    object CDSCadastroCliEsp_Item: TIntegerField
      Alignment = taCenter
      FieldName = 'CliEsp_Item'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroCliEsp_Usuario: TIntegerField
      FieldName = 'CliEsp_Usuario'
      Required = True
    end
    object CDSCadastroCliEsp_Nome: TStringField
      FieldName = 'CliEsp_Nome'
      Size = 100
    end
    object CDSCadastroUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCadastroCliEsp_Anexo: TStringField
      FieldName = 'CliEsp_Anexo'
      Size = 200
    end
    object CDSCadastroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object Rel: TppReport
    AutoStop = False
    DataPipeline = DBConsulta
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
    DataPipelineName = 'DBConsulta'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 18785
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 12700
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = #205'tem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 23548
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
        Caption = 'Relat'#243'rio de Especifica'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 33867
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
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 37835
        mmTop = 12700
        mmWidth = 16669
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'CliEsp_Data'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 20373
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CliEsp_Item'
        DataPipeline = DBConsulta
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 21696
        mmTop = 0
        mmWidth = 13229
        BandType = 4
        LayerName = Foreground
      end
      object ppDBRichText1: TppDBRichText
        UserName = 'DBRichText1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        DataField = 'CliEsp_Descricao'
        DataPipeline = DBConsulta
        RemoveEmptyLines = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 37835
        mmTop = 0
        mmWidth = 156369
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
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
        DataField = 'CliEsp_Id'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 13758
        mmTop = 4498
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'Cli_Codigo'
      DataPipeline = DBConsulta
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'DBConsulta'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel6: TppLabel
          UserName = 'Label6'
          Caption = 'Cliente'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4234
          mmLeft = 0
          mmTop = 1058
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'Cli_Codigo'
          DataPipeline = DBConsulta
          DisplayFormat = '000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBConsulta'
          mmHeight = 4498
          mmLeft = 15346
          mmTop = 1058
          mmWidth = 18256
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'Cli_Nome'
          DataPipeline = DBConsulta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'DBConsulta'
          mmHeight = 4498
          mmLeft = 35983
          mmTop = 1058
          mmWidth = 137319
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
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
end
