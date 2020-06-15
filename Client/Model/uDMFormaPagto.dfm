inherited DMFormaPagto: TDMFormaPagto
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 243
  Width = 318
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspFormaPagtoCons'
    RemoteServer = DM.DSPConexao2
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultaFpg_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Fpg_Id'
      Origin = 'Fpg_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSConsultaFpg_Ativo: TBooleanField
      DisplayLabel = 'Ativo'
      FieldName = 'Fpg_Ativo'
      Origin = 'Fpg_Ativo'
      Required = True
    end
    object CDSConsultaFpg_Codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Fpg_Codigo'
      Origin = 'Fpg_Codigo'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSConsultaFpg_Nome: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Fpg_Nome'
      Origin = 'Fpg_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaCAtivo: TStringField
      DisplayLabel = 'Ativo'
      FieldKind = fkInternalCalc
      FieldName = 'CAtivo'
      Size = 3
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspFormaPagtoCad'
    RemoteServer = DM.DSPConexao2
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroFpg_Ativo: TBooleanField
      FieldName = 'Fpg_Ativo'
      Required = True
    end
    object CDSCadastroFpg_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Fpg_Codigo'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroFpg_Id: TAutoIncField
      FieldName = 'Fpg_Id'
      ReadOnly = True
    end
    object CDSCadastroFpg_Nome: TStringField
      FieldName = 'Fpg_Nome'
      Required = True
      Size = 100
    end
  end
  inherited DBConsulta: TppDBPipeline
    object DBConsultappField1: TppField
      FieldAlias = 'Fpg_Id'
      FieldName = 'Fpg_Id'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object DBConsultappField2: TppField
      FieldAlias = 'Fpg_Ativo'
      FieldName = 'Fpg_Ativo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object DBConsultappField3: TppField
      FieldAlias = 'Fpg_Codigo'
      FieldName = 'Fpg_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object DBConsultappField4: TppField
      FieldAlias = 'Fpg_Nome'
      FieldName = 'Fpg_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object DBConsultappField5: TppField
      FieldAlias = 'CAtivo'
      FieldName = 'CAtivo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
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
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 16933
        mmTop = 12700
        mmWidth = 16669
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
        Caption = 'Relat'#243'rio de Formas de Pagamento'
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
        mmLeft = 177800
        mmTop = 12700
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Fpg_Codigo'
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
        mmLeft = 0
        mmTop = 0
        mmWidth = 13494
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'CAtivo'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 177800
        mmTop = 0
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Fpg_Nome'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 16933
        mmTop = 0
        mmWidth = 158750
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
        DataField = 'Fpg_Id'
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
  object CDSItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFormaPagtoItemCons'
    RemoteServer = DM.DSPConexao2
    BeforePost = CDSItensBeforePost
    Left = 152
    Top = 80
    object CDSItensFpgIte_Id: TAutoIncField
      FieldName = 'FpgIte_Id'
    end
    object CDSItensFpgIte_Dias: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Dias'
      FieldName = 'FpgIte_Dias'
      Required = True
      DisplayFormat = '000'
    end
    object CDSItensFpgIte_Obs: TStringField
      DisplayLabel = 'Obs'
      FieldName = 'FpgIte_Obs'
      Size = 100
    end
    object CDSItensFpgIte_FormaPagto: TIntegerField
      FieldName = 'FpgIte_FormaPagto'
      Required = True
    end
  end
end
