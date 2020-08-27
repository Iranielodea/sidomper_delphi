object DMRelVersao: TDMRelVersao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 206
  Width = 400
  object CDSRelVersao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVersaoVersao'
    OnCalcFields = CDSRelVersaoCalcFields
    Left = 32
    Top = 24
    object CDSRelVersaoVer_Id: TAutoIncField
      FieldName = 'Ver_Id'
      Origin = 'Ver_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSRelVersaoVer_Versao: TStringField
      FieldName = 'Ver_Versao'
      Origin = 'Ver_Versao'
      Size = 25
    end
    object CDSRelVersaoSol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
      Origin = 'Sol_Tipo'
    end
    object CDSRelVersaoTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Size = 50
    end
    object CDSRelVersaoQuantidade: TIntegerField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
      ReadOnly = True
    end
    object CDSRelVersaoPercentual: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'Percentual'
    end
  end
  object dsRelVersao: TDataSource
    DataSet = CDSRelVersao
    Left = 120
    Top = 24
  end
  object dbRelVersao: TppDBPipeline
    DataSource = dsRelVersao
    UserName = 'dbRelVersao'
    Left = 192
    Top = 24
    object pfldRelVersaoppField1: TppField
      FieldAlias = 'Ver_Id'
      FieldName = 'Ver_Id'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoppField2: TppField
      FieldAlias = 'Ver_Versao'
      FieldName = 'Ver_Versao'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoppField3: TppField
      FieldAlias = 'Sol_Tipo'
      FieldName = 'Sol_Tipo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoppField4: TppField
      FieldAlias = 'Tip_Nome'
      FieldName = 'Tip_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoppField5: TppField
      FieldAlias = 'Quantidade'
      FieldName = 'Quantidade'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoppField6: TppField
      FieldAlias = 'Percentual'
      FieldName = 'Percentual'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object RelVersao: TppReport
    AutoStop = False
    DataPipeline = dbRelVersao
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
    Units = utMillimeters
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
    Left = 264
    Top = 24
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelVersao'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 23283
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Vers'#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 12700
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Ver_Id'
        DataPipeline = dbRelVersao
        DisplayFormat = '000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbRelVersao'
        mmHeight = 4498
        mmLeft = 16933
        mmTop = 12700
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 19050
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Quantidade'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 69850
        mmTop = 19050
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = '%'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 103717
        mmTop = 19050
        mmWidth = 1852
        BandType = 0
        LayerName = Foreground
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 21166
        mmWidth = 196850
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
        mmHeight = 3969
        mmLeft = 0
        mmTop = 4233
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
        mmLeft = 169334
        mmTop = 0
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Estat'#237'sticas Vers'#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = []
        Transparent = True
        mmHeight = 5821
        mmLeft = 74083
        mmTop = 0
        mmWidth = 46303
        BandType = 0
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'Ver_Versao'
        DataPipeline = dbRelVersao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbRelVersao'
        mmHeight = 4498
        mmLeft = 35983
        mmTop = 12700
        mmWidth = 55033
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
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Tip_Nome'
        DataPipeline = dbRelVersao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelVersao'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 65617
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'Quantidade'
        DataPipeline = dbRelVersao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelVersao'
        mmHeight = 4498
        mmLeft = 71173
        mmTop = 0
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'Percentual'
        DataPipeline = dbRelVersao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelVersao'
        mmHeight = 4498
        mmLeft = 91017
        mmTop = 0
        mmWidth = 14817
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Total:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 0
        mmTop = 4233
        mmWidth = 9525
        BandType = 7
        LayerName = Foreground
      end
      object CalcTotal: TppDBCalc
        UserName = 'CalcTotal'
        DataField = 'Quantidade'
        DataPipeline = dbRelVersao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelVersao'
        mmHeight = 4498
        mmLeft = 71173
        mmTop = 4233
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 0
        mmWidth = 196850
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'Percentual'
        DataPipeline = dbRelVersao
        DisplayFormat = ',##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelVersao'
        mmHeight = 4498
        mmLeft = 91017
        mmTop = 4233
        mmWidth = 14817
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
  object CDSRelVersaoDoc: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVersaoDocumento'
    OnCalcFields = CDSRelVersaoDocCalcFields
    Left = 32
    Top = 72
    object CDSRelVersaoDocVer_Id: TAutoIncField
      FieldName = 'Ver_Id'
      Origin = 'Ver_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSRelVersaoDocVer_Versao: TStringField
      FieldName = 'Ver_Versao'
      Origin = 'Ver_Versao'
      Size = 25
    end
    object CDSRelVersaoDocSol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
      Origin = 'Sol_Tipo'
    end
    object CDSRelVersaoDocProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      Size = 100
    end
    object CDSRelVersaoDocMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      Size = 100
    end
    object CDSRelVersaoDocSol_DescricaoLiberacao: TMemoField
      FieldName = 'Sol_DescricaoLiberacao'
      Origin = 'Sol_DescricaoLiberacao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object CDSRelVersaoDocProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
    end
    object CDSRelVersaoDocProd_Id: TAutoIncField
      FieldName = 'Prod_Id'
      Origin = 'Prod_Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object CDSRelVersaoDocTotalHoras: TFloatField
      FieldName = 'TotalHoras'
      Origin = 'TotalHoras'
      ReadOnly = True
    end
    object CDSRelVersaoDocC_TotalHoras: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'C_TotalHoras'
    end
  end
  object dsRelVersaoDoc: TDataSource
    DataSet = CDSRelVersaoDoc
    Left = 112
    Top = 72
  end
  object dbRelVersaoDoc: TppDBPipeline
    DataSource = dsRelVersaoDoc
    UserName = 'dbRelVersaoDoc'
    Left = 192
    Top = 72
    object pfldRelVersaoDocppField1: TppField
      FieldAlias = 'Ver_Id'
      FieldName = 'Ver_Id'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoDocppField2: TppField
      FieldAlias = 'Ver_Versao'
      FieldName = 'Ver_Versao'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoDocppField3: TppField
      FieldAlias = 'Sol_Tipo'
      FieldName = 'Sol_Tipo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoDocppField4: TppField
      FieldAlias = 'Prod_Nome'
      FieldName = 'Prod_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoDocppField5: TppField
      FieldAlias = 'Mod_Nome'
      FieldName = 'Mod_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoDocppField6: TppField
      FieldAlias = 'Sol_DescricaoLiberacao'
      FieldName = 'Sol_DescricaoLiberacao'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoDocppField7: TppField
      FieldAlias = 'Prod_Codigo'
      FieldName = 'Prod_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoDocppField8: TppField
      FieldAlias = 'Prod_Id'
      FieldName = 'Prod_Id'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoDocppField9: TppField
      FieldAlias = 'TotalHoras'
      FieldName = 'TotalHoras'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pfldRelVersaoDocppField10: TppField
      FieldAlias = 'C_TotalHoras'
      FieldName = 'C_TotalHoras'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
  end
  object relVersaoDoc: TppReport
    AutoStop = False
    DataPipeline = dbRelVersaoDoc
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
    Units = utMillimeters
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
    Left = 264
    Top = 72
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelVersaoDoc'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'ALTERA'#199#213'ES, NOVAS FUNCIONALIDADES, MELHORIAS E CORRE'#199#213'ES '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 15346
        mmWidth = 120121
        BandType = 0
        LayerName = Foreground1
      end
      object ppImage2: TppImage
        UserName = 'Image1'
        AlignHorizontal = ahCenter
        AlignVertical = avCenter
        MaintainAspectRatio = False
        Stretch = True
        Picture.Data = {
          0A544A504547496D6167658F440000FFD8FFE000104A46494600010200006400
          640000FFEC00114475636B79000100040000003C0000FFEE002641646F626500
          64C0000000010300150403060A0D0000145F00001FF6000030150000448DFFDB
          0084000604040405040605050609060506090B080606080B0C0A0A0B0A0A0C10
          0C0C0C0C0C0C100C0E0F100F0E0C1313141413131C1B1B1B1C1F1F1F1F1F1F1F
          1F1F1F010707070D0C0D181010181A1511151A1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1FFFC2001108007F01F403011100021101031101FFC400E80001000301
          0101010000000000000000000005060704030201010100020301000000000000
          0000000000000304020506011000000503020602020301000300000000000102
          0304101205113220131415061631355034212233304124251100010202020B0D
          0705010101000000000102030011D1041021314171A112A2D2333520516191B1
          C122327282B2137381E142526292C250231434055363F1120001030402020203
          0000000000000000001001322011213130504061510290412213010002000307
          040301010100000000000100112131611020F04151718191A1B1D150C1F1E130
          40FFDA000C03010002110311000001D33CCEB115EFC7A0000000000000000000
          0000000000000000000000004B655E6A4AB46836B41AFB700000000000000000
          00000000000000000000000000048650ECF7799A257DB50E0DB7B7B8CCE75667
          3ADF871632C46166764A9D1EE1E6CA270B1F84DE757F0E2C66AE4773C3CCC0B6
          4BAFECCA21F870E3356E3BBE5E64000000000000000000000000077E50ED1779
          9A257DB50E0DB01A1D8D35D27D6089C2C65357A0D92E735D1EE0333ABBCEFCA2
          BED8D40E0C66C6A9F4BF1E7A377BFC9D120DB70632FD1379D49F92A64753A2E2
          C650000000000000000000000001DF943B45DE66895F6D43836C04C675B5FB9C
          E018DD2E96F76353699680AE457738AFBADAAEF30064D53A1818ED8DDEFF0027
          85D1EAFE3CF40D26CE938FC92855F6FD1EE165968F4FB847E3356E2BBF2F44A6
          75E632AFCDE670185B93CA095CE0E5C73AF4773F1E8B1494E4B2838FC92B71DE
          F3F3D13D25492CA0E2C65AEC773F1ECAE75E633AC21F0B315858EFCA1DA2EF33
          44AFB6A1C1B603B328B6BBBCC0192D4E86CD251BA4FAC10F859C869F47BB5FE4
          C0CC6AEF6AD15F1BBDFE4F0BA3D5FC79E81729B5B319D5CEABEEB63B9CD54A1D
          8C7E335824A7D1EE19655DFDBE6D6DE67D55421D9776515A25A115858ADC7767
          E4A7E1E6798D5DEDF6C6A66F3A9538B63359D593CA0C9AA7437FB1A89ACEAD5E
          2BF3F253F1F33CD6B6EF59B7CF78F994563627E4A79153E8FBF28768BBCCD12B
          EDA8706D80EFCA1DA2EF3206454FA2B64DAFB8CDAD1071DACA2AF41B9DEE540C
          B6AEFAB515E1BBDFE4F0BA3D5FC79E81709B5B379D5A6C3B3D1ACE9720A7D18F
          B79B85EE570CA3D5EAB6F9FA7C3B2AD45786D77797C92A7451F8CDEFEE1B45DE
          6710A3D4EC1739BCE2B6EE1B0B2375BDCA61B47AAD82E73798D6DEC561625338
          352B5A0C66974DACDBE7A8906DA063B6077E50ED17799A257DB50E0DB013F254
          D62DF3C06274BA8D2ACE8EC5253154876146836BB25DE680C7E9F47118591BBD
          FE4F0BA3D5FC79E81709B5B379D5A743B2D0ECE9B22A7D181BA5EE530BA3D5EA
          D6F9FA541B4AF47706D17798C9AA743C18CDF7EF9B6DDE5F0FA3D4EC3739BCD2
          B6F2270B0374BDCA61D4BAAD8ADF37E6F787196573AF4B83694B8767ACDBE7A8
          906DA063B6077E50ED17799A257DB50E0DB0165968EA56B42061D47AAD56D73F
          3925514F8763518765AF5CE700C66974B1D8CE377BFC9E1747ABF8F3D02F53EA
          BB328AA70EC343B3A6C8A9F4606E97B94C2E8F57AB5BE7E9506D2BD1DC1B45DE
          6326A9D0F06337DFBE6DB7797C3E8F53B0DCE6F34ADBC89C2C0DD2F7298752EA
          B62B7CDE695B77E4CB8B1979FCCC6B36F9EA241B6818ED81DF943B45DE66895F
          6D43836C049E506C9779A0322A7D15BE6D75BA6D70838ED65D577DB5DDE63EBD
          F0659577F5B8AE8DDEFF00278AD2E9F8B1944C675B52B5A1CE2B6EA2B1B1AFDB
          E7320A9D1F0E32D824A7A459D262F4BA7D5ADF3F4A83695E8EE0DA2EF319354E
          878319BEFDF36DBBCBE1F47A9D86E7375D8EE50ABEDE673ADA9DBD062347A9D6
          2DF3D5C8EED2E0D9F6651D864A7518763ACDBE7A8906DA063B6077E50ED17799
          A257DB50E0DB002E136B6E936B3EFDF22B0B145836B7A9F552D9D6F87B498369
          F0CAEF36ABD7DC78719735ADBC8FC66D7EE739D7EC7E5E65F5EF9C78C94E8765
          558B602D32D0B8CDADF7F70E1C65A241B687C2CDEA7D540E16E0E3B434AB3A4A
          0C1B6E3C65FD79A8DAD0E5B577FB0DCE6E3319E47287CBCCA8506DA0A3B72394
          3A158D34A67072E325321D95562D85EE7D4D763BB0D85903BF28768BBCCD12BE
          DA8706D80000000000000000000000000000000D82E7379AD6DE726327B7B8FD
          3CF6F713CE2F25EBF63E2C6593CE0FC7B1D8CD2794113858EECA289C2C77E50E
          D17799A257DB50E0DB00000000000000000000000000000001AEDCE7338ADBBE
          FCA1FB79EFEE3EBEE3FAF2A70EC6E73EB39B1CE130B521943D1EE03AFD8F8FC9
          2A10ECBBF28768BBCCD12BEDA8706D80000000000000000000000000000000B7
          4DAEAFC773DFDC3B7D8B9FCCFAF28FCFCCBE1EF4FB1F1E32C7E3375651F4FB87
          4FB1F97997B7B8D5E2BFDF943B45DE668B06D6855F6E00000000000000000000
          00000000000000000000000090CA1D9EEF331B8CD48836BF8000000000000000
          000000000000000000000000000013D9D4B64DAFFFDA00080101000105029121
          A8ED7B3441ECD107B3441ECD107B3441ECD107B3441ECD107B3441ECD107B344
          1ECD107B3441ECD107B3441ECD107B3441ECD107B3441ECD107B3441ECD107B3
          441ECD107B3441ECD107B3441ECD107B3441ECD107B3441ECD107B3441ECD107
          B3441ECD107B3441ECD107B3441ECD107B3441ECD107B3441ECD107B3441ECD1
          07B3441ECD107B3441ECD107B3441ECD107B3441ECD107B3441ECD107B3441EC
          D107B3441ECD1041CBC598A1E50A3B7F398E3329E3CA28926446C744907EAEB1
          EB0E073C766A074CCA56CE010FA7D5D615E30F87F11223947810DF3F5858F587
          03BE393921E65D65758DE3B29D6FD5D63D5D63D61C0F78ECF4075A75A57E0E07
          EF0F28E0F1FC82DD2A64A0225C78D25E8AF47792FB14CFC04477BC7B22BBE936
          1B52D85A1485D65F92292EFB2CE05E4D3044F228CEAA5438F2DA9915C8B23F05
          03F7879470621CE5E46B936F9790F1C72E814CFB77636139CA975CE37664AAE6
          FAF8ECB53B1FC9D92D0311DF7D6DF8DCD517AC3BA3DE3D3DB252548552363274
          92F5A9E1DF1FC8A02DB5B6A8F899EF97AD4F0F60722D119191D23E0A7BC5EB0F
          87BC767A096DADB5523E1320F17ACCB0F60320D9191918878C972C7AD4E1EB53
          84BC64C8A4207EF0F28E0867A4CAE73ED3C63FC29972D71A47A1D7C8FEC2AE6F
          AF8C9FFECF92FE8B4DA9D76346621C793E4A64A2F249FAE3F3C890E66F1E8911
          86071A87CE5CC8F11A5F93AB589E46CBAB723B2E2B21978D0CFD9DDD71F9A8F2
          D79DC721E8E3C7B1E834E4F2EDC21ECB3B581E42979DCBE3D12A30F1FC722CC9
          65D9840FC9A56B8ECE3729CCFC04391C60BEAE767188AF179427529F06542103
          F787947063D374EAE655764FC6527D2D336A22C6369B9CAF90AB5C8D5CDF5F19
          FDBF25FD1C397FF4B2E6658DA214695B9FE6301F59E40B51E4690946A8791333
          9E1859A1F91FE0313F5B9851AB25449EA95FF0BC59698FCAA8D59118C42D790C
          899140183FABCE7DA5607EF0F28E0C126EC9D662AE97804E98CA7922B4818C4D
          D90AE595764AAE6FAF8CFEDF92FE8E1BECF33F5955EC180FACCFFD9D207E8CFF
          00DE0DEF7FFC0627EBB2DF63446C737E37EBDEC5E3DF57AFE3431161C44E6F2E
          8792307F579CFB4AC0FDE1E51C1E3FF6557BFDB09A76BA7937EA61BECEB92FDF
          AB9BEBE30D1DDE4CAFFD5C37D9E67EB2ABD8301F599FFB3A40FD19FF00BC1BDE
          FF00F80C4FD765BEC688D8E6FC6FD7CD90FB590EEB91D1D90FBB5C1FD5E73ED2
          B03F787947063641479D5CBC65313FC7242551299A8CA7E0457B93252A4A934C
          FC75353EB2E3BCC3F4898A9B2550E237158CE4D4C99705E26264865322349852
          A328633172243F3DF4B110603EB33FF67481FA33FF007837BDFF00F0189FAECD
          621D75C525493C6E35E96F497D31E38C1BE9771F9BC4BFCF323236214B7CE478
          FB8D431823FF00E5E73ED2B03F7879470E2F3BC8423278F591E420109EBC4CC6
          8B9B01F899E84F27AF823B963C64A163DC5E3332A861BCA63D65D7C113178A94
          CC9884C988D9682FA0E4C3517331A0A463D01ECD639B190CF3D20A98DCEB9192
          DE6F1AB2EE58C20F67F1ED964726FCD50C2E5A3331F32EB6ECFA633330FA69AA
          4AA6023D0D39A80FC6189FAE567596A5965318E13D9BC736593CB3B34C419CF4
          3763E7E03A45908061DCCE35B2C9E71729230B968AD46CC38DBB91AC0FDE1E51
          F8CC4FD6E5BEC63C491255231D36326492BA72C3E48D18F81D4BEEC396D258C4
          CE7DB7E2BEC389C264D486F0B925939124B6F763C9DA88EF2DD7B1590650207E
          F0F28FC661BEB32DF638F931BA27A2BE98521D4B51DD4C6932B1E992DE4DC932
          5D2C9468EF05C98EECEC9BAEF72F225ABB84EE7B886E025996EC9623E65B86E6
          8207EF0F28FC662F3851999CF21F9711F8296DC9D09B8AECF6D6CF5184BD1975
          9649E7F124DAA7E3E4B6A970D12A5BC4F49C9CC4CB92BC985C9C338FBB3E1BB9
          06A7E362D207EF0F2823D3F398FF00DF13DA88EC73C3E3F5ECD04766823B3411
          D9A08ECD04766823B3411D9A08ECD04766823B3411D9A08ECD04766823B3411D
          9A08ECD04766823B3411D9A08ECD04766823B3411D9A08ECD04766823B3411D9
          A08ECD04766823B3411D9A08ECD04766823B3411D9A08ECD04766823B3411D9A
          08ECD04766823B3411D9A08ECD04766823B3411D9A08ECD04766823B3411D9A0
          8ECD04766823B3411D9A08ECD04766823B34118C838C8EE8FFDA000801020001
          0502178BC5E2F178BC5E2F178BC5E2F178BC5E2F178BC5E2F178BC5E2F178BC5
          E2F178BC5E2F178BC5E2F178BC5E2F178BC5E2F178BC5E2F178BC5E2F178BC5E
          2F178BC5E2F04AA2FF003A545D74160B05B4B4582C168D0582C16F0DA2C160B0
          5BF852A2F8127532E151049D4CB84D62F1782503207F832A2F813C06135502E0
          57FC126175B0582DE0D0582DA682C16F05A2C16F05A2C16D488582C06542A2F8
          0B815F28AAB857FF000405D6F1782505151240CC5E0954350BC12828A89206A1
          782505151240D42F04A0A2A27E0D42F1AD0A8BE02E0504555C2AFF008202C242
          B892155207C2415C240E840E89F857CD4A8BE04F0184D560B80FFE080B090AE2
          4855481F0903E121A0B46814AA27E15F352A2F813C29F8A2C2780FFE080B090A
          E24855481F0903E120635E04FC2BE6A545F01702822AAE15701D4881105182A6
          94220744855481F0905268455485153416D13F0AF9A9517C24A1A8D41E83E012
          86A35064094351A83D0694D782E06AA9285C3517033A24C2AA4A075BA842E1A8
          B819D08C5C3517035512615C0545FE30818D0694B4110D0694B45A3416D34A15
          17F8C48305C0543A185031A0FF00CE942A2FF184A06086A351FC0B87F0351A83
          066351FC0D46B42A2FF3A543168B45A2D168B45A2D168B45A2D168B45A2D168B
          45A2D168B45A2D168B45A2D168B45A2D168B45A2D168B45A2D168B45A2D168B4
          5A2D168B45A2D168B45A2D168B45A2D0454FFFDA00080103000105024A751D31
          8E98C74C63A631D318E98C74C63A631D318E98C74C63A631D318E98C74C63A63
          1D318E98C74C63A631D318E98C74C63A631D318E98C74C63A631D318E98C74C6
          3A631D318E98C74C63A631D318E98C74C63A631D318E98C74C63A631D318E98C
          74C63A631D318E98C74C63A631D318E98C74C63A631D318E98C74C63A630B68D
          348BF9D73688B5538643A91D4829042E306FE83A91D4902748C296643A91D482
          909047AF02A4110EA47523A90521208F5FC22F688BC121BD2ADAED352750A2D0
          E8C2F5121BAA17699702238E9923A620A8E6412B34842B52FC12F688BC0E97F5
          AB67FD6417F6A307FD965A95583FEB52E0909D0E31D0D4440E490EA41484F029
          C221D4A413E904614EA48752904FA4F814FA4875240A42411D54F248752409F4
          D56E12475291D4A425D25517B445E05FC558DB27E68D6EE08FB6A5C127E236E3
          3D02946A34C61D32438C681973430FB9A04A0D40A305473204A30DB46A1D3071
          934861CD0C487036D5C3A6485C7D034E68624381B6AE1D310718B430BFE43FB9
          0C1A874A2C51185ED11781CDB5676C9F9A33B8F823EDA97049F88DB9EDAD6EA9
          51FDD1F6D17F2DED07F09F90EEE676F03BB9ADA1DDADEE0FEE636D57B445E07F
          6D51F0FEEA46DCE6DAB5B6A5C127E236E7B6B3BAA547F731B68BDC8DA0C27E43
          BB9ADB43041CDC4EA88750A06A35065AD28FEE636D57B445E091B6A41EDD48DF
          2F6DAB7B6A5C124C46F97B6B3BAA547F731B68BDC8DA0C27E43BB9ADB43041CD
          C8491A794904922ABFB98DB55ED11781C4EA55695AA6427F9A32AD14A2D4AAC2
          B54D50AD4A8A74882D571B08D0965A924F434AC8E8E3A44484EA61FDCC6DA2F7
          2368309F90EEE65DD28E3968496A61F4E8A65D2D01AC882646A61FDCC6DAAF68
          8BC2EB1A8E5A872D4117A46E253064396A1CB506D6A0E337036942C504129212
          AD68A68C85A63450B54099506D8D2AE31A83654396A04C2836D9268F34666C96
          89A38C9EA8F8A7254461DDDC8D4B94A04CA836D5B45A09414C28872D4099506D
          8D28F34666C9689AAF688BF8C77735B54A2209708C27E79C90E2F42259183752
          40944639C906F24128B4E7A41A8813A93A2F688BF8C7B735B5C49EA4A2D525A9
          96A44E6969248836A32049324B65FD63ED4680DCD489266835D17B445FC63AC6
          A105A1288C120F5240B56395FD48962C510B0F449684DA2D2E58B57A120C9268
          52A8BDA22FE75CDA106647CE50E728739439CA1CE50E728739439CA1CE50E728
          739439CA1CE50E728739439CA1CE50E728739439CA1CE50E728739439CA1CE50
          E728739439CA1CE50E728739439CA1CE50E728739439CA1CE50E728739439CA1
          CE50E728739439CA1CE50E728739439CA1CE50E728739439CA1CE50E72873943
          9CA1CE50E728739439CA0E2D474FFFDA0008010202063F02FCF87FFFDA000801
          0302063F02EFDFBD7475D51835468D760E8F45F86FC19EA1D1FC9BF48E8FE6E6
          9B70592CB85B516A36AE8FD3B73B56E8FD338DC6F45DEB747F05BC571B8DC6E2
          747E1BF9AE35567AACFC4E8F4DD8D1A4CA68D1962EC9AABF6B9E1BB71DDABD51
          76A5D1FAECA3F05E9747EBAFB32D673EC59D86B7CA687F6BF6F835818FE991D1
          FACBA60BB8FED2C64C1957F65B058CA3A3F7AE98224489122448912244891224
          4891224489122448912244891224489122448912244891224489122448912244
          8912244891224489135664FFDA0008010101063F022EBAAC9408D5AF1531AA5E
          2A6354BC54C6A978A98D52F1531AA5E2A6354BC54C6A978A98D52F1531AA5E2A
          6354BC54C6A978A98D52F1531AA5E2A6354BC54C6A978A98D52F1531AA5E2A63
          54BC54C6A978A98D52F1531AA5E2A6354BC54C6A978A98D52F1531AA5E2A6354
          BC54C6A978A98D52F1531AA5E2A6354BC54C6A978A98D52F1531AA5E2A6354BC
          54C6A978A98D52F1531AA5E2A6354BC54C6A978A98D52F1531AA5E2A6354BC54
          C6A978A98D52F1531AA5E2A6354BC54C6A978A98D52F1531AA5E2A6354BC54C6
          A978A98D52F1531AA5E2A6354BC54C6A978A98D52F1531AA5E2A6354BC54C6A9
          78A98C844D2E7C8AE6B1574DE39478A54FEBB5797FD13CB62ADDFF00C6C7494A
          18133E71124570051F8549973C7F607DBEF8FEC0FB7DF13494B83E9BB8E5190F
          B8B6577F29BA0C65355B4AD3C03DF1FD81F6FBE3A2F24E10453194F05640BAB4
          0CA1CA2242B812ADE5A65CF28FEC0FB7DF1AF1F6FBE268297380191C7190EA0A
          15BC77016E2C353B605D31FD81F6FBE3FB03EDF7C6BC7DBEF89A325CC06471C6
          43892856F1FD12AFEAA3C562ADDFFC7706ACE99A9226D93BDBD64A65FB8356AE
          180E3664A1746FF01843C9B8B13B2979A126DDBA3795EF8FE2386625FB5ECBD6
          4B6B16FE056F1852156949323ECDC291576C10932CB55FF6094751AE255316DB
          6C8E09D3012F27C926FDD4C643A27F2AAF8C10A657745C3BE37FF43ABFAA8F15
          8AB77FF1DC3077D593F75ADC3E9FAC9E3B7193FF0035903979ECA8FC842B1CB9
          E195FCAB1B876571525718DC2B0EE14CA8CCB3D5EC9A2197AFDB41E516321941
          5AB823A6A42382E98D7A6782269C973B26DE39414A864A85D06CCDB6CE4FCC6D
          0C71D76F8CD11692973B2699464AD252A178DA89A1A927E655A8EBB7C6688984
          8707D069944889117459CA290D27EBA235C9E23134E4B9D936F1CA0A1692950B
          A0D99E464277D76B15D8D6A31D11300383E83CC651222445D1626D27A03E355A
          11D76B8D54475DAE3551194EA3A1F38B62C55FD5478AC55BBFF8EE183FFA2797
          70F777C221EED0E4B2FF00679E27B81D81CFB8561DC3A3E8E7847AA3C2612DA7
          ACB321ED8C845A4A44D6ADFE1304559B053F3AEFFB23AADE091A6032EA3CB715
          D522E130A740FDE684C1DF02F583587865368324A77CC65BA65F2A45D3823F6D
          812FA8C043C8F2A7715398F6DC84A9680A523AA4DE8C83D377E41CF1A812C31E
          591E5BB7926D8380C2AB091279B13277D37EC7F2DC1333935ECBF0101396F2AD
          E4EF0E18EA378246980D3E8C82AB4162E4E14A03F79B1342B9AC7F2DC1351D50
          DE95F8C99798E9F8298B4D225ED8F2969F2DD3D5DE306B291FBADF5B853EEB0C
          F7BC4614CE4296E26EDE16C4E2DD5E43B5EE871655FB52938955D162AFEAA3C5
          62ADDFFC771571FF00A279770F9E10388010EAB7D72E2165EE190C62129F9881
          B823E54A473F3EE158770EF639C423D51E130C61E687E5F2F29B2142EA4CE158
          0D8461572C1493692901231D96146E96D24F145627FF004572D86D62EA5408E3
          873B2792C31D987E778CB885907820E18ABF6043E4FCD2E2B561808BCB04E016
          CC5627FF0035725867BDE230F777C237157F551E2B156EFF00E3B86B8328E2DC
          3CADF5A8E3841F98A8E39735948F99C1C862AE3EB078ADEE1F3F54B8AD6E1587
          70EF639C423D51E130C613C861FC03946E1582C37855CB0E604F259ABFA48F0C
          563D55F8AC270C39D93C9618ECC3FDAB29C10AC3157EC082A5B40A8DD50B5C91
          D557DD04B684B63E25524C7F1983347C6BDFE01619EF788C3DDDF08DC55FD547
          8AC55BBFF8EE13D956E17DA30C77BC46CB7EA7318630F36E2B1EA2B9770AC3B8
          7DDBD6923961A4EFAE7C43DF0C613C861FC03946E1582C37855CB0E604F259AB
          FA48F0C563D55F8AC270C39D93C9618ECC3FDAB29C10AC3157EC08AC794E291F
          B87AA6512FE42A3F75C52FB467659EF788C3DDDF08DC55FD5478AC55BBFF008E
          E1A755D5064AC06D6E1C1F0ACE5A7DB0A67E26CDCE03EFB2B09B6A474C0C1EE8
          6DDF9140980A499A4DB06CA97F03BD2079770A43A9919DAE1C16464A0A517D6A
          B43DF09651705D3BE77E325066DB5D1077CDF30D3A6E2556F05F85B53B4E2653
          82975B23EABDC7610A520A58499A946FF00875C37936B0DEB0DE1572C39813C9
          66AFE923C3158F557E2B09C30E764F25863B306B3571944EB117ED5F11250293
          BC613D12191D75F07042DD55C409D86C7C4DF414393142AB2C272D0BEBA45D07
          04488918934D295C37B8E0BDE64DC40CA5A2F4B80D867BDE230F777C237157F5
          51E2B156EFFE3B90CD666A6C75562E8898AC23DA65CB28FEC37F708C872B0804
          7516089880EB2F21C95F4A8198DE22EC0F30F92E5F0AB9C71FD86BEF4C7F61BF
          B84176AB596D2A36D4D955AF64790FF4D9170A64726911315840ED1C9E5947F6
          1AFBD305B75F6E578E5A660F04741E43A8BC52A1C9601F352855F428C8E38917
          5B23B423ACCE6C4C38D27DA911ADCB3BC8B7EE82DB23CA68DD3F11A2C869D1E6
          343ABF308D6E49DE502227E7223A2A2E9DE48A651D2E8B63AAD8B1FC77CE448F
          4557ADC2D6DA8290426D8C165B69D5796E36909B772D5ABB0FA926692E2883ED
          B00EF42BA7E5ACA4F415BF2B0C7661C61F49010A9058B7C6235C8EF5AE58D6E5
          9DE45BF7464F5191711CE6C65B770F59178C74CF94ADE55223FB0DFDC235C15C
          09B70596464327AD3BA6C0ABBC720A4992AF19C3AB6D4148393250EC8DC55FD5
          478AC55BBFF8FE98C7661FED464B282B22EFFF006329E68A53BF74628AB7EC79
          768C9C1F1C65F9065EC9F15D875973292B420A80BF9408B4632DC69484EF9101
          C437D03709204F8E3CB75052BDE8CAF2BD8480627E4CBB4408F216D90E9B89DF
          C1195E57B26271E52104B9F2DF8CB5B27245D224792762AFEAA3C562ADDFFC7F
          4C6301E530FF006A1EAABAE9614E2A61D027ECB50E1ABD70562AE35A8145B8FF
          0025D509A51351180A60BCC7FA390B59E8A55312E09DA8AD87CCDE0CAA6AE291
          893AEAD63794A262AE1CAD06325A4C9B231C7F9ECB4AF3030424BA6F9B5443CA
          CA3342FA277A572253B4948908FF0033CB27CF523A2ABF3B57E12575F40AC850
          CA16EEEF4E2B61D25B0EA024389F84948B70BFE0D7FCD5C8CDBB692463B157F5
          51E2B156EFFE3FA6061E415213D5526EC3AEA3AAB331385375A64AC1330E23AC
          21C62A6DAC79DAC5B976430454D1E5CFF8D3CA06E2AD8A23CDF21D0ABBE58232
          2985570A2D2FA2A6FE98586185971770B86D2704A1BFE634BF35B4E4E5B72B60
          61861CABB250DB266667A4AB70EBA9B416A24031E72414DA02462A4509E9D544
          8CEE18FE4290FA1C27294139329FB61E7DC64B8C3A0091B4A1685B1C50A72A8D
          385E2240B84487158ABFAA8F158AB1BDD3E6FD76AFEA2396C64569410837144C
          ADF04E2D7FA2D81DDD28DA4D66E946D26B374A369359BA51B49ACDD28DA4D66E
          946D26B374A369359BA51B49ACDD28DA4D66E946D26B374A369359BA51B49ACD
          D28DA4D66E946D26B374A369359BA51B49ACDD28DA4D66E946D26B374A369359
          BA51B49ACDD28DA4D66E946D26B374A369359BA51B49ACDD28DA4D66E946D26B
          374A369359BA51B49ACDD28DA4D66E946D26B374A369359BA51B49ACDD28DA4D
          66E946D26B374A369359BA51B49ACDD28DA4D66E946D26B374A369359BA51B49
          ACDD28DA4D66E946D26B374A369359BA51B49ACDD28DA4D66E946D26B374A369
          359BA51B49ACDD28DA4D66E946D26B374A369359BA51B49ACDD28DA4D66E946D
          26B374A369359BA51B49ACDD28DA4D66E946D26B374A369359BA51948AC21F7F
          E1E90C4058FFDA0008010103013F21EA423D5E81CD8DAD39C9FC6430C30C30C3
          0C30C30C30C30C30C30C30C30C30C30C30C30C30C30C30C30C30C37FE0186186
          1861861861861861864899A29143428EC0DAC6635C1F97E7555535F848FB3B9C
          C70CD08826579EFC5D1F0CFEA23A5EA22FB9002AF455EF07CAB237ED7DA75CE8
          DB5DCC44FEA20863FD3E02167220CBBE31E4811FB26FBDF927F710D585FDD05A
          0F8000F78B007935E4EA6E1048D91A5EA601EB3FA88FEA21AB0BFBA0450FA7B4
          50F78A46733A7F09C73A37B9E6E754F2BE1CB6B6856BCF3A2FA3CE2566E80E61
          32E5E4E9799E1C36E28194E41D3B22317D2DCCCCF6D626D39D81EA7293F70DBB
          23D553B8D8A989707313079D9C4AF6C03FB460D822FEA3827A4A892983CCE6A6
          208BA2990EFF0083E39D1BDCB69CC787DB7003CA81C5D62BBF8335F35B4F9D9D
          C3D25456ACBDAF1F6DC1CB293C17EF7B9EE9F3B975E059F01E44A18CC8EA7E8C
          76755007277723CCBC77D3EC15EF1CB7505EBD6E3411397C010F1F002A4751DA
          22FBD3F134BF1043274670EC038EAC8D73CC6AF460E62E541F178BE20864E93B
          80ECF11F4B1F047CEC12608ECCF021F40C45D3E817D76389A9CE547A07CA6152
          715278DA1896C97EEF66C19F1F6A3E82F48FDCAA4C11D4D87A41294C4E9CD7C1
          B78F1D3C16FA9CCF3B38E746F730198A7A7FE1DB953EEF40C4019989B9C0FAEE
          3DD3E771BA66DE83EF671C71C3DF550C5170705062D0CA8CACF62ABD60ACA113
          2FD055F498E22F294466173C52BC65B31FC87CB355EA17305365980E4265E35A
          AFA0544A76D0E2FC1113FED92D529035DF4C72B728E574F7BF5AFD414D7C51EC
          0C7C40874539591EC626CCD38039191EFBC098504A5A8EA2FD4714530C053ED7
          3B211C4EF70A05CE79AC57A3F3B33BF1132181EFBC094186AC0D01D56353263D
          0DDF5B216D7C5D7CB9530C394D8ED63AE6DAF2E6A386B0018E2E4F48C37F352E
          FA57E614CABC12C324EAF2AD9C73A37B96A6EECEC05F6DC30397033A4172353C
          1F7B6E7E42EEC9CBC5A4EED6E09DCD3D370F74F9DE1B8926F5BE898EEA9C1E00
          7D9DB92B01DC6E011711F8B603BB77AE5FA3A6812DEEEDC4355354C5556D7E06
          1EC6CC287BC85A013711F9DB0853ABD563C2BA47600D828D98264C65B342C004
          C841EB004753D4B63EB68C76C0F6361C8AD1BABF011EF2D1E541EEEFFF00FF00
          1CE8DEEC5797B475EFB9FD6F1C1EB5BEBDA6888F027EA0B1FEE7D371DAE5ECCF
          D373DD3E7FE6371850BDF3E36700EB9C03A76F1CE89C73AB67B27CCE2FD5B3D9
          FE670FA6DF6CF89EE9F3389F48C9E9B2B5E7762DEF0BAECD2D2924F173AF2BDE
          677D89E54C4D0BC6F7FF00FF008E746F733B947A6E1415B405F31AA0A2BF6368
          6FE5120B3AFE7B812F6FEC56E7BA7CEE5906576B9BD308673BEF93750A102B46
          2B3DF3E36700EB9C03A76F1CE89C73AB67B27CCE2FD5B3D9FE670FA6DF6CF89E
          E9F3389F48DFD4579B49D01EF8FAC4EFB8BF2FF87FFF001CE8DEE692AE9A367C
          5DCCF136B08A52F51DFB36474B8F4F2EFDDB41BB4755CFEE674AC168389E9010
          041648E4EDA43826A8287AE3E771D45CB390BCD7336DA0AC9B4697F0989CE2AE
          699A862934592657C789822997AB0F631958A038E793FB824132A5BED9361864
          175431C4CEE2B7561AD943D76700EB9C03A76F1CE89C73AB67B27CCE2FD5B3D9
          FE6575194F30AD4C3323F39CC29F462C28850A2999D4B28986D3ABC8F2E1155B
          737382C737A0AFF088638C0DF32F3239CBF2E825304D83A2BC9504A585296462
          EA069B0103955F5B77FE39D1BFCA1B03C60F44E61280A69BF4BA096F8DFE199B
          E5589FD8F320BAD70309A1C5043D7074CBEB538E3F7106BDE2606E9209D7CBB4
          C0BE622DBA235E4947C7415E974E38FDC56BCC7A8B146BA999E6F7E97B2E3898
          513CCC97E269C6153E67F427CA9CFDC83B87A137F3F68B5B0166074B3276F5DA
          9DF0C8707A1799A4BF6A9C1E693DE6466BCC4BC7B631E748A0F7A209A73E2CBE
          ABCDD872C59A550AE9AC9B95F64318C0ED59BCE1D8344C997580B0AAC91689B2
          A4E6BF4960914E0E80E4ECF67F9992BD0EAF53D2106E397D0489DD0129F3F681
          417EEEBB7A9CDD96DEF01B275FD308DFCF253C587AD412CF39FCB2C0A395ADF4
          C3DE311CE3D1B58069B2EC7861415E664CC538A16344FB9B9C73A3F1DCC69E02
          CE1F48D3930601DD504E500319E4524A026FCE58CC5EDFB94C60EE94FA8FC21D
          1172551284D662B76AF05B3EA84F2B0CE97CB35DF44B1F1041AD967A18B8798B
          8223588FA2DC37420CF6D960BBF113D2DFEBAE637BD1AE04CEFA5458715A293A
          B7A6CE39D1F8FE85C3E92A990CAC518B372948E350898E0DD8F030B0898E9306
          EB90B7369175AA173C6A3872A864ADB00DF5A563589C8D29BC3886355E23B23A
          358DD58E10E45D0BB23C9D2A26D7A5C5E2D4B4560595C82C28C1314E2BB379EB
          0769156A3C98EBDE35C99B5CD82D9D9C73A3F1DD6A06C2505BA46AF17ACBCA39
          50D6B9C21A272B0AAB1AB260AF02CD0024E71956F4BCA579CD30D4979C19E778
          20824A83D0157D701814C2B357994DD6B068A62FD02C4541160C53358E61A40E
          9CD905BCE51D8B2ACCCF2818A949D0E5DC263E6DB78F6E6BC586446D7443014B
          BEA88A65C7C7A09BD9C73A366106042EAE1F8FCE85A4BC6F43B1A32B0BAF2AB0
          5C7E8C0D9F5A7E31145145145145145145145145145145145145145145145145
          1451451451451451FF00C08A28A28A28A28A28A28A28A26526CAE0E18DA5BAD9
          FFDA0008010203013F215A949494949494949494949494949494949494949494
          9494949494949494949494949494949494949494949494949494949494949494
          9494949494949480FE7D9F74079ED172A17E7B45100F3DA2E256E0F702E27E13
          36F395B6E83506F6D5397B6CDDE84B4B4196415F83CDBCCDB99E3C36E58B1DCC
          DFF186C0B82D85EE0D968BD8365A2F706EC2F704CB45ED565A5A29B336F337FC
          064DDCDFF0CD32408151E89697CB0D97CA369A806C59B5E74AA5B6361B39F2A9
          6974E76D28D8A26CCDBCCDB99A64DB93773FFC334C9334C9BD9667DB9267D847
          66599B772CCFB33CCBBE19B799B7334CBB724CFB99FF00E19A6499A64DECB33E
          DC9336D766599F772C4B2B004B30DF0CDBCCFB8EE19266DCCFFF0001324CD326
          F6599F6E499B6BB32CCFBB962C65E2FF00C0336F1D3B8298B0DA2C834EE1C770
          56D56512C62A6259146CBE2A366599F6E499B6BB32CE66CBE2D6C584E6EC131C
          3BF19B7D5E72B292CD81949585CA552B292C8EC05964C259112DDB5404AC4CBF
          60C58ED2A99B6D1366599E56225FB28819488976C1A8B1DCCDF8E6599E098B23
          2D2C8A836254B4B454B4A8BD99BF1CC933C45544C3062E04697396B62B09D65E
          2478CCF39266CF18B4A1D0ECCDF8E5515B11CE52B08E4D25C66B8B147394BC22
          B65CCE5D25C22E00CB666FCFB36C07394EB29D653ACA7594EB29D653ACA7594E
          B29D653ACA7594EB29D653ACA7594EB29D653ACA7594EB29D653ACA7594EB29D
          653ACA7594EB29D653ACA7594EB29D653ACA7594EB29D653ACA7594EB29D653A
          CA7594EB29D653ACA7594EB29D653ACA7594EB29D653ACA7594EB29D653ACA75
          846CFFDA0008010303013F214744D726B935C9AE4D726B935C9AE4D726B935C9
          AE4D726B935C9AE4D726B935C9AE4D726B935C9AE4D726B935C9AE4D726B935C
          9AE4D726B935C9AE4D726B935C9AE4D726B935C9AE4D726B935C9AE4D726B935
          C9AE4D726B935C9AE4D726B935C9AE4C79CB60F87E747A0ECFD1FBD8DCCCFDD2
          BD257A45E92C2C0F98F8144AF48738996E7AE13FD6CAC57A45676431663B8A51
          8CAF495E92BD23B3B20E23F09ED1D9FA3F7B8181B5F439C034CB43A6D734E640
          AAF9DA9611597B9696A6A3C788F5598E18C62C8371F83F68ECFD1FBDCB96E5C3
          B4ABB8DB577CB134DCB0EE64DCC31CE679B08B7081CAD95E919A41BDB9BB3B9C
          798AD20394CD19DCE3CCD320EDD43B4D26333C20389B79A5F69A6C76907666D9
          CD078F3341E3CCCAB3D9ED1D9FA3F7B99BD9DCC9E39CCAEDB72F77E6DCC9B995
          DE6676FA942FA4B833A89DC8A6CC48D572763E066C62883CD8658DC06039CC53
          2257AC12F32258C9D8997CC7C7913B92A5E28DA4EC4BAF98F8B226BB1859891C
          E83B3378E508BBA23C044B39F2D9ED1D9FA3F7B8A976DC1463C1DB69C3151B83
          DDB993732FBCCCEDF53361C3B52C99B667C1B429F760F40D86D1323BECCF828E
          D6194CCEF050EDB102BE93DE6CCDF1F1327CFCEE7B4767E8FDEE2C7B828F68F1
          ED1EC8E976DC3477326E65F7999DBEA66CC9DCCDB33E65EDF78CF686CC932366
          74CADB9A649EF2652EC73EC63F51B337C7C4C9F3F3B9ED1D9FA3F7FF00072933
          F8E5B73FB4CDDCF69B9937328871BA4CD993B99B667CCBDBEF19ED0D992646CC
          E995B734C93DE4B80BC26813202B6E6F8F8993E7E773DA3B3F47EF72ECDCA8D2
          55ADB7CD4BC3AC4ADB84733702C36F3BC62D8CCCF365E9316E9325766B29526C
          CF997B7DE33DA1B324C8D99D0C406E18D6531D76586B3961506674C0A6B07666
          F1CA64F9F9DCF68ECFD1FBDDB1CC89734D47A42960CC2A0932EC49A8F49AC842
          9BBCE9060393359E912B07D273C23B1ECAE1D3670AE59C9F78EE5071E2769633
          060F94D363B49DD7667822D0EDBA4C460A3D8D8C728B2F667410C29E4C772A87
          A9D8653324C66A3D22794276E2ECCF84401CFF00DDCF68ECFD1FBFC667CCA99A
          AA646CEA2FF5316AE532736604231CA5C61B6651BF383E7154384D5802DCA314
          3B3DA3B3F47EFF00199B32A50930728E3A04A0F5FF0062C51225CA7FA990012E
          2AD8C5170E8875ED0454DB9A642E294C69CBCC0C304EBB3DA3B3F47EFF001966
          99C711E51EDAA8B2A61D228AB8C1AB3F713DB97B11474E706B729EB0542B5958
          748D4439F00E223CC381A498332B4D9ED1D9FA3F7F9DF60ECBA678751EFF0053
          51C789A8E3C4D471E26A38F1351C789A8E3C4D471E26A38F1351C789A8E3C4D4
          71E26A38F1351C789A8E3C4D471E26A38F1351C789A8E3C4D471E26A38F1351C
          789A8E3C4D471E26A38F1351C789A8E3C4D471E26A38F1351C789A8E3C4D471E
          26A38F1351C789A8E3C4D471E26A38F1351C789A8E3C4D471E26A38F1351C789
          A8E3C4D471E26A38F1351C789A8E3C4D471E26A38F1351C789A8E3C4D471E26A
          38F1351C789A8E3C4D471E26A38F1351C789A8E3C4D471E21F8AD87FFFDA000C
          0301000211031100001004000000000000000000000000000000000000000000
          00A1492492492492492492492492492492492492492492492D1214DE89829A8A
          4913544924924924924924924924924918925E43048D48225211C94924924924
          9249249249249248C492724D24C648129125AAC44C9558D0FAC91090BBA84C46
          2491925F245244948925EDCFB56A934A5030E43229666A3124BC91C9199254A4
          4976A24BAB527918AA592F502B049189242492C9B490A5224BB7524D1C952A04
          E24E2DEA58248C4923241E4BA49D29124A3A9668E4A9502712717AD2C1246249
          2923D23FA4894293DA28B547254A813B99D4F911092312497D33D6D9EF48643F
          4B23F2412D57E9C9AACE26B2491892492492492492492492492492492492566C
          B7B5D12308C492492492492492492492492492492492B2F92A8FF25D46249249
          249249249249249249249249249493BA85CACAFA30A492492492492492492492
          4924924924924924924924939612492492492492492492492492492492492492
          4924925CFFDA0008010103013F101918055AA644C53904291D7101675AB7E324
          924924924924924924924924924924924924924924924924924924924924924F
          FC124924924924924924924924851B881888AA80665DE9B086CE56D20BC1EA7E
          752BB2D30692F283B9020E6252F461817791EB90ACB44D8B1A9B2F2122FD50C2
          45B68F7F627288CB680BE7889ACF2CF4BD9D310689B165F6A3809BEFFA6568F5
          85DCDC0C75094C3B15D5C82C1D08BA706AD720817DED0394BA525692F8B9B2E2
          4BAC4C303330DC1507CD882A6C1CB175ADAB160D5AE4102FBDA032574C43B326
          63191ABAD399AFE29AC5E3D456845AE2E31D17C8368FF574019676BA1E732562
          5CF788D407DBBCC14190DA862BD6C5B338042B0E15AB43212C3A8F2967492ED4
          629E8BD0A76A8224A72B8ACF3C9CC9A5856D81EA6E5D174A69D3402AC2FD196C
          6B71E744FEAFC7172B0BBEB818375EB439B19248D5BC61C71E73343222B12ED1
          E8E1F896B047A155C912B8EA770F1AA9B20550ED296DD031C0F681BE5F5F6D0A
          BC92B1843758C879669372AB6036B6BE4ADCE1FD5B8E3AC3ADA5CDEA6B443944
          940F39214791EBD9CF470700E16D43AA210BA19CE6B9FC580055CC18ED65FA42
          E9D778A73CF3B0B1C95DA8CE54136B0765324EA8A7CE1055BD44F464638E0685
          AD05BC130F7E1A7B80CC63F2B58E4DA06A18615EE6AD3D1908A0DAC2B42F3888
          E110503044711D80A02D70033587226D0E76DF813A9019BC52E54689E0518805
          B9DAAA7602A016B912B78AE381E74232B2C5E78C09CEDB653DC0E818EB901A06
          089889B350F838A8D20E7656D6AD45D8694C6B908F607FC1AC34B4E1D11CDC01
          595F79268BC32368906805B503E22434E27446CDC21519DFB970FEADC0728577
          1100B6B131623253672A02F4C7185D36A3B03C55E8606116A8A35E0E63B1D2EF
          A12C877309E10B0BD34BEB655F2437D609F041823D5B33D0E59BB027512D9C01
          72230C95C72A4F5CECE133A1CBAE01CE35826E912E4D13B2D8B7502A29C3103C
          AF1D688D7887D0E8BEBDF1CE0B760902A5A7C2FC8A5E7551162F55FD89060751
          344B402C0C691A5C47461028DF52959A573D8E4AE0F60B05CF13A14E93A8C4B6
          28545C51A063A4554B1D27ED6D1B81BF0A149566B5C3135ACE031040C2380663
          974C5D763890168A18079CBD0ABE782D78634DE053C4AC0057489B628F4060F8
          A56FCAB2F05A145464377D6F081A991A9B2DAACA3D2CE9B002052D9D5AE5D472
          11680353060C2F98391A2160F3A862F58C5EE4DB963FF06B005A1278A43B88E0
          982F553DE59D817CA976D53381EA17C6301A40466A54F7DC6205A972558BC6E3
          87F56F48D4B9B011A8CFA92FC806E81794DACA2238D34863E210000471115B08
          A14A57568F8233AE4501D06ABB5B2D56175F5625721AE2D25E0036220A28C1A4
          3E21180347111D81E9A1C23AA97CACB3901F2080F06C04EA041A44C918C0DA86
          A82C11E8D3A02083CD0B8D7E6196D83DD2B1F01B18C1DDB02AA9CAE957573DD6
          BDE96EF5D5B55783CBFE0D60502C54C793C9A8DC471B71EE8821ACC7B90DA55D
          38B66A7F710CAB041B90E35AB8BA03D773C3FABFE723574EB8FF0057FC5F2E6A
          D787F46DC1C73AA7BF7C36F1FE89C3FAA71FE98DB04BAAD258D3380DC6EBA7DA
          9F799AE806218E21A77A449D5F26F50005CC85619FFD3AE9AC1016910EAE2F83
          72DDC919A8C58818409A86BCB8ED652C005E56D1F1105514DBD513DF702AE5A3
          960B0F061B9C3FAB71944151CD288E82DDE5A330139D35BB74E80028A031559C
          7FABFE2F97356BC3FA36E0E39D53DFBE1B78FF0044E1FD538FF4C6232AD1B8F3
          117E6698AAF95E17E6580C36519D84D78FFB75D358D3014C63B41E9410096388
          9926D677C85D675DDF0424A73A8E1876A1F1D76BB9198B55AA6B80EACCD64719
          A57CD6238C58EC2B07A26DB4BE88AA5EEA0F01B97F9D89BAAB289A6CCE1A2B14
          8F99A07B2DE25C5D8FB469D391842C4C8AD2B474B00F3C5CE38D4B598D661AD0
          A0618C0AD9D674D43929A143EA65BD6FACCE3D08D05251A5EB56607B414A8AB5
          890AF3B678FF008BE5CD5AF0FE8DB838E754AC8C334001EA07330B2EE60F4378
          DD4048E25AF2A5A9D161966C68C10B000A3D6A1DE224B454E6AC10AE31629DAC
          792B812AE32C8E28064388C9BBC22E12CDC1E1962D358E3C24B1FE7F592D180D
          2BC717CC6A2D7A07F49FFA74D60A0A1A72B9D35621863851F682C31B6A7B12D8
          0658A7A230321DB2898D5B90D4D1A66003A580C52D033C30E4E17306301695CC
          918243839DA12E9226740F5148802141D6D430BF561A9022ECABD25A2171CB27
          2E901A27207BFC46C6AEBE6564306BE3A73CA31975C91E5652F835D86C0E6907
          61604EB68F15B374F0C70F7EE05441EB670CC113907241D80F74738CA23B3580
          9CCF630DA04AC000BB02E492BAD610D62C5F710F618C273B29CEC41EE95D74C1
          EBD4E8ED72879F6C02E7AB0F0BA28C8CEE3755FB13A054139955CE15B49F6204
          BD1DAC55080180838816531D23921EED7C0CC46F6292B400E56AE0889ACB12C8
          E7654F83671CEA8CB987D985390ABCED7D22C6A2C5917A8128C0EF054E940791
          10CD11B32A9568191EFB031482AD5E40C939189DAC96C3F991E74A8FE100063D
          5BD018A8FF0024A74128F226091C5158D961EA82DF5AC3632764E21541A15CF0
          D661824560889D10FC9358755615BD44FB93DFBE10EFB0BA8DCAEDAE56C20FE9
          48CB90357AB080A6D4451C033AE4B718FC9904F6B6D200417D0014CD631306E3
          B100F916169CE5116BABACD154079358CB3320BD52A85A1BC3147027008752AB
          4A31812B1811A6848D6A9E51BD1806334954579A98206B00F4F974956842B321
          86B231BCA29AC547B14140E6A7E45AC3AF7EF84295C730074CBCB8679C66A449
          E95A80B2DC4BAE751C5D0BAB5255E1786115388F5598801800F573BD39BCBDA1
          1832302B4953475A812825D39C62265530B4B18834476BD25315865629DF0BCE
          52D3790D40AF4394B36B17B6D9072579CB881D5AE1E6185DABAC71E65515230B
          C8D3448A60F0A9000E6CC0E0254AC2080A267850A67CCFC83585E509A9D26C8B
          11A56504360601406011CBAC06C935A586C133A5ABE4E158DF9C348A7360C75F
          4B0A0BF11560C6832C73E705A9E8C2D70588B720F11B5B79C200CC4631317A72
          71732022BB0DF27E963A1AE1972B895A071BED17AAD3A80D6AA0327C555546A8
          AAE0A2971235F5486945627470ED28DF044684E23104DE185CA109B678D5DCCC
          728C013A59F60ACD56473E53ABDAD66B805AE7D4DC6AA2A7901018F36FCE9EB2
          1818E0B5F01B0F19ED3215118378732F9470F3A93771F1CFE347F8D1FE347F8D
          1FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1
          FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1F
          E347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE
          347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE347F8D1FE3442D3D828
          55B398B6DC3A63B3FFDA0008010203013F10316CD066933499A4CD266933499A
          4CD266933499A4CD266933499A4CD266933499A4CD266933499A4CD266933499
          A4CD266933499A4CD266933499A4CD266933499A4CD266933499A4CD26693349
          9A4CD266933499A4CD266933499A4CD266933499A4CC24CF63CBF3B93DF672F9
          D854CB22FD65FAC14A8D2D7881888BF58BE4CCC3662FD65FAC1E58C454EE38B7
          097EB2FD65FAC1E58C4307F0997DF672F9DC7716D13AC7564A97B4559931AEDB
          40D3129ADCA1A134487408ACF080698AA9FC1E5F7D9CBE77151DC14E5DB62E68
          0EE1A7B8E7B9714F2994EC5544E625FAC1EB12B6E504ECC0C44CE65C4ECC0EB1
          36E952FD60F588983B7974D4207589B3219AA4D52663B32FBECE5F3B991DF733
          A6576E6EEFC3B8E7B99D327BCB1A86689D24ECC054E10ECE66C0C4C036C7A482
          B49512E2CC279CBF486EB26125999B0F340C3CE7665ED307536155A061E73488
          2E9C1829D46CCA86EAB1869838F2D997DF672F9DC367BEE2B70E2DAF1C0B771E
          E5CF733BB4C9EF3262C7B4698E5B3263DB563B458FBEC548CCAECCB8ADED2332
          E3B7B029A99BDB6654CEDCCBEFB397CEE1C3B8AD77830ED5EF82CEE3B7B8E7B9
          9DDA64F799333771CB664CCDDB97DA67F7D86732BB32E67ED328E7327B4CD8D9
          E43842C0D99533B732FBECE5F3FF000F3332B6E477993B99BDF71CF73398F01A
          CC999BB8E5B32666EDCBED33FBEC33995D99733F699473993DA28E9E735E2B9B
          B72A676E65F7D9CBE77291DCB596D3A6E6D4306F6D37EBB8AA9DBC9201A26519
          12A19847599C1B15692F1D9933376E5F699FDF619CCAECCB8CB489511E92A2EC
          BCE91EE912640472D78ECC899DB997DF672F9DDA95920BCC9AE4634A4C558911
          9E135C9AA44B689917283F39AE4434A4AB2476199C7AC4BD32BE641F38D80C0D
          AB81C48BE735481D6276EC314C06E6DA01C22B5DF699E6CCB8810CBF9C1F38BD
          BB1DD91B9E135C81E7170196C35180B4DCCBEFB397CFE332E67CCA099C132985
          7EE60DD4BC8F480C520D6115530AF283F28069319A706B467065A6CCBEFB397C
          FE332667CBC4D4516212A582C1045D9D4566C555D308948C6A25E39BA5738571
          406C73898E36CCBEFB397CFE32B53091200A11240CFAC141518F74C14A860631
          3146CE91008C0960C0BA3C8859BA6E29A9633170DEBB32FBECE5FCEE5F7D8C2A
          1E8F8F3347C799A3E3CCD1F1E668F8F3347C799A3E3CCD1F1E668F8F3347C799
          A3E3CCD1F1E668F8F3347C799A3E3CCD1F1E668F8F3347C799A3E3CCD1F1E668
          F8F3347C799A3E3CCD1F1E668F8F3347C799A3E3CCD1F1E668F8F3347C799A3E
          3CCD1F1E668F8F3347C799A3E3CCD1F1E668F8F3347C799A3E3CCD1F1E668F8F
          3347C799A3E3CCD1F1E668F8F3347C799A3E3CCD1F1E668F8F3347C799A3E3CC
          D1F1E668F8F3347C799A3E3CCD1F1E668F8F3347C799A3E3CCD1F1E62D836ECF
          FFDA0008010303013F100A76B0FE87D4E01FA9C03F53807EA700FD4E01FA9C03
          F53807EA700FD4E01FA9C03F53807EA700FD4E01FA9C03F53807EA700FD4E01F
          A9C03F53807EA700FD4E01FA9C03F53807EA700FD4E01FA9C03F53807EA700FD
          4E01FA9C03F53807EA700FD4E01FA9C03F53807EA700FD4E01FA9C03F53807EA
          700FD4E01FA9C03F53807EA700FD4E01FA9C03F53807EA700FD4E01FA9C03F53
          807EA700FD4E01FA9C03F53807EA700FD4E01FA9C03F53807EA0B80F51B02D73
          FF005F9D26CE237017287AFF008C32D53A96FD4D6FAFF935BEBFE4CE87BB2F6B
          F8984074FF003FB8EDB3BFF935BEBFE4E793D1FA8F53342FA307B52696FD5CD6
          7AFF0090EB7D7FC9C60F6FA96E41A6E3406BE09ADF5FF26B7D7FC875BEBFE4C0
          381DA15609A7E138974778140E8707BF5DA21E6C9A47E163C59159CD6D72F7EE
          9FE4151A785ED29E43A90486497B822AB791CBD67F648E4FD9FA855B5F47FD97
          16BA9D7BC05CEF67F07C4BA3BC15FE85FA63B975E1584C73A1F5FADB507427EF
          F535C96E76059EFB991DB7043B9EE7DC6BF3FE9FD6CBD209953D885F9FD63B4D
          F77F90C58D8ED7AB1BA18BC778F4BD2467EBDC7D5C06D09A446B13A18C7A5E92
          1AAB7BB86025996D76AD5C33CA714456ADDDFE406CB1DABD62797F9EF3803EE3
          F4AF77F97012CCB6608FB0CE7F248FE490D53EC73D9C4BA3BC06F84C373E5FCA
          715AED75DDFD44BC373E77EB7323B6E0C6E184F79F9835590B99A85C8FD10D2F
          1BA1F7FE468CFD67D462F467D4FB845B8D5D9EBB0116B31E84ACBDDE9DE52E6E
          847182F2AA7C7580A80CD07A775FD42BCF7DA500FE9EE4309CAECEC236570C25
          E269E7F50AB3F59F51D5A8727384C5C6C7EF662851C2A66ED5FA8518FB1F52C1
          757A90D37A5A3FEECF8FF0806A4F5E912B0C5C3AC1619F265C75D9C4BA3BC169
          D5F1B951D3E5582974FDB6B3E5F865A3D0DCACBD57D7EB7323B6E701A33DE7E6
          15767F6426DEBFADB703CE6477D8FD03E20853356F690CC8F9A114711B0D0C91
          9EC1F3B1DF760D1E9B121A523B115F7D0C670766A9879728168E8F9D9C3689C3
          6ADCE25D1DE0AF52BE4DCA4F41F12F0E81F17FBDB6A7A2F925EF57BE1B949D3E
          71DCC8EDB9C068CF79F98F6BFB27BDFD3B991DF67B03E27BC7E76F12EACE25D0
          D999DA7B83E767BB9ECF6E677991DA7BE42812BA38FCC7A87A4701AB91FE11DA
          AB90E9AECE1B44E1B56E712E8EF00C5DCDC57DA27C7F86D5C0EA43E8FECDC5E8
          3E37323B6E1D73F167647C93EA7B5FD93DEFE9DCC8EFB3D81F13DE3F3B789756
          712E86CCCED3DC1F3B3DDCF67B733BCC8ED3DF250560664C79651761B786D138
          6D5B9C4BA3BC082E75878C770FAC14F88C1C83DCFF0036882E583D7FD9A1A488
          91CCDA61A1FADC1CB786D3F1B7418BFE451CEF622DDD4F8E5149CD3DF9461E75
          0BB274E7E9B18022CC03F7189EBEDCF67B03E27BC7E76F12EACE25D0D999DA7B
          83E767BB96DA8327F4C1163645B8E923839A81115CB11C77950D6C9792404B21
          B647CFA6700E7143CFC9B0FB7F09C36ADCE25D1DF0B6C1599C9FF63D4F80BF88
          27DA986CB994E3171D4EA65D9CA3587B59FA7D4FE8A1FE0307321D1F30FDE385
          FD313A7C45FC4FECBEA7B97D8C51E543F3B13161D4C605B3D166841C1ABE23A1
          BBE1FEC484F88FBE30DAADFF000B1DE6EC92CC24FE20357EA19862B378E5B28C
          623139C2014DBF3B6BDD85C35D230DC13E2D82CA80F906277D9EEE2C17664FEA
          3FA37F917F930FF61779BCFEB67A0C7A4530574FA887DA8EE73BE12E5FC27DEC
          A094797382450BF96E712E8FE3807AB3D9C3AE07A897D3E6335230E1CE2181BF
          3F35530448078463968D199483A0B2E0DC0A9F162358FB5B2BC35FDCC4AF83F5
          2C70754A61BF27CECE25D1FC707BDFD13D9CAFA02B17BC02BCCDFEC515A687B4
          61F26694DEB51746561EE23D6C6804C7ADDE23EDC75803D82E8CFEE5568A716B
          70CB562ACC08C188F5E5110B534F5A8C66CCDB9E2847337421B389747F1C097A
          0B31CA66A421CC18C9C99D0C49FEA619986AB333FB9D17EB4FF88E01C710EB14
          3B21EEB98B92BAB60F8945B3D30233B98A971B78B32CB07E99CAD2828BC55E25
          A65AF51C5C3DE56623EAB7D76712E8EC458FCE8AB82C365605E80BC35947189C
          4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C
          4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C
          4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C
          4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B1C4B151E60C1F76B67FFD9}
        mmHeight = 17198
        mmLeft = 130440
        mmTop = 0
        mmWidth = 65088
        BandType = 0
        LayerName = Foreground1
      end
      object lblPeriodoVersao: TppLabel
        UserName = 'lblPeriodoVersao'
        Caption = 'lblPeriodoVersao'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 529
        mmTop = 3704
        mmWidth = 29104
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 21696
        mmWidth = 196850
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 10583
      mmPrintPosition = 0
      object ppDBRichText1: TppDBRichText
        UserName = 'DBRichText1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        DataField = 'Sol_DescricaoLiberacao'
        DataPipeline = dbRelVersaoDoc
        RemoveEmptyLines = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'dbRelVersaoDoc'
        mmHeight = 10583
        mmLeft = 0
        mmTop = 0
        mmWidth = 177007
        BandType = 4
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'C_TotalHoras'
        DataPipeline = dbRelVersaoDoc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelVersaoDoc'
        mmHeight = 4498
        mmLeft = 179652
        mmTop = 4763
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground1
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = '(Tempo)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 184415
        mmTop = 0
        mmWidth = 12435
        BandType = 4
        LayerName = Foreground1
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8996
      mmPrintPosition = 0
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Domper Sistemas '#8211' www.domper.com.br'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 2381
        mmWidth = 62177
        BandType = 8
        LayerName = Foreground1
      end
    end
    object ppSummaryBand2: TppSummaryBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppSubReport1: TppSubReport
        UserName = 'SubReport1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'dbRelVersao'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
        LayerName = Foreground1
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = dbRelVersao
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
          Units = utMillimeters
          Version = '15.03'
          mmColumnWidth = 0
          DataPipelineName = 'dbRelVersao'
          object ppTitleBand1: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 13229
            mmPrintPosition = 0
            object ppLine7: TppLine
              UserName = 'Line7'
              Position = lpBottom
              Weight = 0.750000000000000000
              mmHeight = 1852
              mmLeft = 0
              mmTop = 11377
              mmWidth = 197380
              BandType = 1
              LayerName = Foreground2
            end
            object ppLabel13: TppLabel
              UserName = 'Label13'
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 7408
              mmWidth = 7408
              BandType = 1
              LayerName = Foreground2
            end
            object ppLabel14: TppLabel
              UserName = 'Label14'
              Caption = 'Quantidade'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 24871
              mmTop = 7408
              mmWidth = 18521
              BandType = 1
              LayerName = Foreground2
            end
            object ppLabel15: TppLabel
              UserName = 'Label15'
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 68792
              mmTop = 7408
              mmWidth = 1852
              BandType = 1
              LayerName = Foreground2
            end
            object ppLabel17: TppLabel
              UserName = 'Label17'
              Caption = 'ESTAT'#205'STICAS VERS'#213'ES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 78317
              mmTop = 2910
              mmWidth = 37042
              BandType = 1
              LayerName = Foreground2
            end
          end
          object ppDetailBand3: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 5292
            mmPrintPosition = 0
            object ppDBText12: TppDBText
              UserName = 'DBText12'
              DataField = 'Tip_Nome'
              DataPipeline = dbRelVersao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRelVersao'
              mmHeight = 4498
              mmLeft = 0
              mmTop = 794
              mmWidth = 17198
              BandType = 4
              LayerName = Foreground2
            end
            object ppDBText13: TppDBText
              UserName = 'DBText13'
              DataField = 'Quantidade'
              DataPipeline = dbRelVersao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbRelVersao'
              mmHeight = 4498
              mmLeft = 24871
              mmTop = 0
              mmWidth = 17198
              BandType = 4
              LayerName = Foreground2
            end
            object ppDBText14: TppDBText
              UserName = 'DBText14'
              DataField = 'Percentual'
              DataPipeline = dbRelVersao
              DisplayFormat = ',#0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbRelVersao'
              mmHeight = 4498
              mmLeft = 53446
              mmTop = 0
              mmWidth = 17198
              BandType = 4
              LayerName = Foreground2
            end
          end
          object ppSummaryBand3: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 11906
            mmPrintPosition = 0
            object ppLine9: TppLine
              UserName = 'Line9'
              Weight = 0.750000000000000000
              mmHeight = 1588
              mmLeft = 0
              mmTop = 1058
              mmWidth = 197380
              BandType = 7
              LayerName = Foreground2
            end
            object ppLabel16: TppLabel
              UserName = 'Label16'
              Caption = 'Total:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              Transparent = True
              mmHeight = 4233
              mmLeft = 0
              mmTop = 3440
              mmWidth = 11113
              BandType = 7
              LayerName = Foreground2
            end
            object ppDBCalc2: TppDBCalc
              UserName = 'DBCalc2'
              DataField = 'Quantidade'
              DataPipeline = dbRelVersao
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbRelVersao'
              mmHeight = 4498
              mmLeft = 24871
              mmTop = 3440
              mmWidth = 17198
              BandType = 7
              LayerName = Foreground2
            end
            object ppDBCalc3: TppDBCalc
              UserName = 'DBCalc3'
              DataField = 'Percentual'
              DataPipeline = dbRelVersao
              DisplayFormat = ',##0.00'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = [fsBold]
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbRelVersao'
              mmHeight = 4498
              mmLeft = 53446
              mmTop = 3440
              mmWidth = 17198
              BandType = 7
              LayerName = Foreground2
            end
          end
          object ppDesignLayers3: TppDesignLayers
            object ppDesignLayer3: TppDesignLayer
              UserName = 'Foreground2'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'Prod_Id'
      DataPipeline = dbRelVersaoDoc
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelVersaoDoc'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLabel10: TppLabel
          UserName = 'Label10'
          Caption = 'Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 0
          mmTop = 261
          mmWidth = 17992
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'Prod_Codigo'
          DataPipeline = dbRelVersaoDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelVersaoDoc'
          mmHeight = 4498
          mmLeft = 20373
          mmTop = 261
          mmWidth = 17198
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'Prod_Nome'
          DataPipeline = dbRelVersaoDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelVersaoDoc'
          mmHeight = 4498
          mmLeft = 39952
          mmTop = 261
          mmWidth = 121973
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppLine4: TppLine
          UserName = 'Line4'
          Position = lpBottom
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 2117
          mmLeft = 0
          mmTop = 5819
          mmWidth = 196850
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 1058
        mmPrintPosition = 0
        object ppLine5: TppLine
          UserName = 'Line5'
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 263
          mmWidth = 196850
          BandType = 5
          GroupNo = 1
          LayerName = Foreground1
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'Ver_Id'
      DataPipeline = dbRelVersaoDoc
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelVersaoDoc'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppDBText9: TppDBText
          UserName = 'DBText9'
          DataField = 'Ver_Versao'
          DataPipeline = dbRelVersaoDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'dbRelVersaoDoc'
          mmHeight = 4498
          mmLeft = 25135
          mmTop = 529
          mmWidth = 46567
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Build:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 11642
          mmTop = 529
          mmWidth = 12171
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'Ver_Id'
          DataPipeline = dbRelVersaoDoc
          DisplayFormat = '000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRelVersaoDoc'
          mmHeight = 4498
          mmLeft = 74613
          mmTop = 529
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLine3: TppLine
          UserName = 'Line3'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 0
          mmTop = 5027
          mmWidth = 196850
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 794
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line6'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 794
          mmLeft = 0
          mmTop = 0
          mmWidth = 196850
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'Mod_Nome'
      DataPipeline = dbRelVersaoDoc
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelVersaoDoc'
      NewFile = False
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'Mod_Nome'
          DataPipeline = dbRelVersaoDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ParentDataPipeline = False
          Transparent = True
          DataPipelineName = 'dbRelVersaoDoc'
          mmHeight = 4498
          mmLeft = 3969
          mmTop = 1852
          mmWidth = 115094
          BandType = 3
          GroupNo = 2
          LayerName = Foreground1
        end
        object ppLabel8: TppLabel
          UserName = 'Label8'
          Caption = #8226
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 12
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 5027
          mmLeft = 529
          mmTop = 1852
          mmWidth = 1588
          BandType = 3
          GroupNo = 2
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand3BeforePrint
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 4498
        mmPrintPosition = 0
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Tempo Total:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 151077
          mmTop = 265
          mmWidth = 22225
          BandType = 5
          GroupNo = 2
          LayerName = Foreground1
        end
        object lblTotalHoras: TppLabel
          UserName = 'lblTotalHoras'
          Caption = 'lblTotalHoras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 175155
          mmTop = 265
          mmWidth = 22225
          BandType = 5
          GroupNo = 2
          LayerName = Foreground1
        end
        object dbCalcHoras: TppDBCalc
          UserName = 'dbCalcHoras'
          DataField = 'TotalHoras'
          DataPipeline = dbRelVersaoDoc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          ResetGroup = ppGroup3
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRelVersaoDoc'
          mmHeight = 4498
          mmLeft = 120121
          mmTop = 265
          mmWidth = 17198
          BandType = 5
          GroupNo = 2
          LayerName = Foreground1
        end
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
