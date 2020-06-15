object DMRelSolicitacao: TDMRelSolicitacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 254
  Width = 359
  object cdsRelatorio1: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Ver_Id;Tip_Nome;Sol_Data'
    Params = <>
    ProviderName = 'dspSolicitacaoRelatorio1'
    OnCalcFields = cdsRelatorio1CalcFields
    Left = 40
    Top = 16
    object cdsRelatorio1Sol_Id: TAutoIncField
      FieldName = 'Sol_Id'
      Origin = 'Sol_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsRelatorio1Ver_Id: TAutoIncField
      FieldName = 'Ver_Id'
      Origin = 'Ver_Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object cdsRelatorio1Ver_Versao: TStringField
      FieldName = 'Ver_Versao'
      Origin = 'Ver_Versao'
      Size = 25
    end
    object cdsRelatorio1Sol_Data: TDateField
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      Required = True
    end
    object cdsRelatorio1Sol_Hora: TTimeField
      FieldName = 'Sol_Hora'
      Origin = 'Sol_Hora'
      Required = True
    end
    object cdsRelatorio1Sol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
      Origin = 'Sol_Tipo'
    end
    object cdsRelatorio1Sol_Nivel: TIntegerField
      FieldName = 'Sol_Nivel'
      Origin = 'Sol_Nivel'
    end
    object cdsRelatorio1Cli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object cdsRelatorio1Cli_Fantasia: TWideStringField
      FieldName = 'Cli_Fantasia'
      Origin = 'Cli_Fantasia'
      Size = 100
    end
    object cdsRelatorio1Tip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Size = 50
    end
    object cdsRelatorio1Sta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object cdsRelatorio1Mod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      Size = 100
    end
    object cdsRelatorio1Prod_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      Size = 100
    end
    object cdsRelatorio1Sol_TempoPrevisto: TBCDField
      FieldName = 'Sol_TempoPrevisto'
      Origin = 'Sol_TempoPrevisto'
      Precision = 5
      Size = 2
    end
    object cdsRelatorio1Sol_PrevisaoEntrega: TDateField
      FieldName = 'Sol_PrevisaoEntrega'
      Origin = 'Sol_PrevisaoEntrega'
    end
    object cdsRelatorio1TotalTempo: TFloatField
      FieldName = 'TotalTempo'
      Origin = 'TotalTempo'
      ReadOnly = True
    end
    object cdsRelatorio1Analista: TWideStringField
      FieldName = 'Analista'
      Origin = 'Analista'
      Size = 100
    end
    object cdsRelatorio1Desenvolvedor: TWideStringField
      FieldName = 'Desenvolvedor'
      Origin = 'Desenvolvedor'
      ReadOnly = True
      Size = 100
    end
    object cdsRelatorio1Sol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object cdsRelatorio1QSolicitacaoRelTempo1: TDataSetField
      FieldName = 'QSolicitacaoRelTempo1'
    end
    object cdsRelatorio1CTotalHoras: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CTotalHoras'
    end
  end
  object cdsRelatorioTempo1: TClientDataSet
    Aggregates = <>
    DataSetField = cdsRelatorio1QSolicitacaoRelTempo1
    Params = <>
    OnCalcFields = cdsRelatorioTempo1CalcFields
    Left = 40
    Top = 72
    object cdsRelatorioTempo1Usu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object cdsRelatorioTempo1STemp_HoraFim: TTimeField
      FieldName = 'STemp_HoraFim'
      Origin = 'STemp_HoraFim'
    end
    object cdsRelatorioTempo1STemp_HoraInicio: TTimeField
      FieldName = 'STemp_HoraInicio'
      Origin = 'STemp_HoraInicio'
      Required = True
    end
    object cdsRelatorioTempo1STemp_TotalHoras: TFloatField
      FieldName = 'STemp_TotalHoras'
      Origin = 'STemp_TotalHoras'
    end
    object cdsRelatorioTempo1CTotalHoras: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CTotalHoras'
    end
  end
  object dsRelatorio1: TDataSource
    DataSet = cdsRelatorio1
    Left = 104
    Top = 16
  end
  object dsRelatorioTempo1: TDataSource
    DataSet = cdsRelatorioTempo1
    Left = 104
    Top = 72
  end
  object dbRelatorio1: TppDBPipeline
    DataSource = dsRelatorio1
    UserName = 'dbRelatorio1'
    Left = 160
    Top = 16
    object dbRelatorio1ppField1: TppField
      FieldAlias = 'Sol_Id'
      FieldName = 'Sol_Id'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField2: TppField
      FieldAlias = 'Ver_Id'
      FieldName = 'Ver_Id'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField3: TppField
      FieldAlias = 'Ver_Versao'
      FieldName = 'Ver_Versao'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField4: TppField
      FieldAlias = 'Sol_Data'
      FieldName = 'Sol_Data'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField5: TppField
      FieldAlias = 'Sol_Hora'
      FieldName = 'Sol_Hora'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField6: TppField
      FieldAlias = 'Sol_Tipo'
      FieldName = 'Sol_Tipo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField7: TppField
      FieldAlias = 'Sol_Nivel'
      FieldName = 'Sol_Nivel'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField8: TppField
      FieldAlias = 'Cli_Nome'
      FieldName = 'Cli_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField9: TppField
      FieldAlias = 'Cli_Fantasia'
      FieldName = 'Cli_Fantasia'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField10: TppField
      FieldAlias = 'Tip_Nome'
      FieldName = 'Tip_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField11: TppField
      FieldAlias = 'Sta_Nome'
      FieldName = 'Sta_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField12: TppField
      FieldAlias = 'Mod_Nome'
      FieldName = 'Mod_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField13: TppField
      FieldAlias = 'Prod_Nome'
      FieldName = 'Prod_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField14: TppField
      FieldAlias = 'Sol_TempoPrevisto'
      FieldName = 'Sol_TempoPrevisto'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField15: TppField
      FieldAlias = 'Sol_PrevisaoEntrega'
      FieldName = 'Sol_PrevisaoEntrega'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField16: TppField
      FieldAlias = 'TotalTempo'
      FieldName = 'TotalTempo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField17: TppField
      FieldAlias = 'Analista'
      FieldName = 'Analista'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField18: TppField
      FieldAlias = 'Desenvolvedor'
      FieldName = 'Desenvolvedor'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField19: TppField
      FieldAlias = 'Sol_Titulo'
      FieldName = 'Sol_Titulo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField20: TppField
      FieldAlias = 'QSolicitacaoRelTempo1'
      FieldName = 'QSolicitacaoRelTempo1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField21: TppField
      FieldAlias = 'CTotalHoras'
      FieldName = 'CTotalHoras'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
  end
  object Relatorio1: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
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
    Left = 224
    Top = 48
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object lblTitulo1: TppLabel
        UserName = 'lblTitulo1'
        Caption = 'Solicita'#231#245'es - Relat'#243'rio Anal'#237'tico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 103717
        mmTop = 529
        mmWidth = 78581
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
        mmTop = 529
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground
      end
      object lblPeriodoModelo1: TppLabel
        UserName = 'lblPeriodoModelo1'
        AutoSize = False
        Caption = 'lblPeriodoModelo1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 91017
        mmTop = 6350
        mmWidth = 99484
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable10: TppSystemVariable
        UserName = 'SystemVariable10'
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
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 17198
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 21167
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'T'#237'tulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 17198
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'N'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 22225
        mmTop = 21167
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 67998
        mmTop = 17198
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 67998
        mmTop = 21167
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 134938
        mmTop = 21167
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'M'#243'dulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 169069
        mmTop = 17198
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 169069
        mmTop = 21167
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Analista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 211667
        mmTop = 17198
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Denvolvedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 211667
        mmTop = 21167
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Tempo Prev.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 234421
        mmTop = 17198
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Prev. Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 234421
        mmTop = 21167
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Tempo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 262996
        mmTop = 17198
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 23548
        mmWidth = 283369
        BandType = 0
        LayerName = Foreground
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 250561
        mmTop = 529
        mmWidth = 29633
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 23548
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'Cli_Nome'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 67998
        mmTop = 0
        mmWidth = 65352
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Sol_Titulo'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 22225
        mmTop = 0
        mmWidth = 43127
        BandType = 4
        LayerName = Foreground
      end
      object ppSbTempo: TppSubReport
        UserName = 'SbTempo'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'dbRelatorioTempo1'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 16140
        mmWidth = 284300
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = dbRelatorioTempo1
          PrinterSetup.BinName = 'Default'
          PrinterSetup.DocumentName = 'Report'
          PrinterSetup.Orientation = poLandscape
          PrinterSetup.PaperName = 'A4'
          PrinterSetup.PrinterName = 'Default'
          PrinterSetup.SaveDeviceSettings = False
          PrinterSetup.mmMarginBottom = 6350
          PrinterSetup.mmMarginLeft = 6350
          PrinterSetup.mmMarginRight = 6350
          PrinterSetup.mmMarginTop = 6350
          PrinterSetup.mmPaperHeight = 210000
          PrinterSetup.mmPaperWidth = 297000
          PrinterSetup.PaperSize = 9
          Units = utMillimeters
          Version = '15.03'
          mmColumnWidth = 0
          DataPipelineName = 'dbRelatorioTempo1'
          object ppTitleBand1: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 7673
            mmPrintPosition = 0
            object ppLine1: TppLine
              UserName = 'Line1'
              Weight = 0.750000000000000000
              mmHeight = 2381
              mmLeft = 203994
              mmTop = 0
              mmWidth = 79111
              BandType = 1
              LayerName = Foreground1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Tempo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 273844
              mmTop = 3175
              mmWidth = 9260
              BandType = 1
              LayerName = Foreground1
            end
            object ppLabel20: TppLabel
              UserName = 'Label20'
              Caption = 'Usu'#225'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 203994
              mmTop = 3175
              mmWidth = 12965
              BandType = 1
              LayerName = Foreground1
            end
          end
          object ppDetailBand2: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 4498
            mmPrintPosition = 0
            object ppDBText3: TppDBText
              UserName = 'DBText3'
              DataField = 'Usu_Nome'
              DataPipeline = dbRelatorioTempo1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbRelatorioTempo1'
              mmHeight = 4498
              mmLeft = 203994
              mmTop = 0
              mmWidth = 53446
              BandType = 4
              LayerName = Foreground1
            end
            object ppDBText4: TppDBText
              UserName = 'DBText4'
              DataField = 'CTotalHoras'
              DataPipeline = dbRelatorioTempo1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              TextAlignment = taRightJustified
              Transparent = True
              DataPipelineName = 'dbRelatorioTempo1'
              mmHeight = 4498
              mmLeft = 261673
              mmTop = 0
              mmWidth = 21431
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppSummaryBand2: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 5821
            mmPrintPosition = 0
            object ppLine4: TppLine
              UserName = 'Line4'
              Pen.Style = psDot
              Weight = 0.750000000000000000
              mmHeight = 1852
              mmLeft = 0
              mmTop = 0
              mmWidth = 283105
              BandType = 7
              LayerName = Foreground1
            end
          end
          object ppDesignLayers2: TppDesignLayers
            object ppDesignLayer2: TppDesignLayer
              UserName = 'Foreground1'
              LayerType = ltBanded
              Index = 0
            end
          end
        end
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'Sol_Data'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 20373
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'Sol_Hora'
        DataPipeline = dbRelatorio1
        DisplayFormat = 'hh:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 4763
        mmWidth = 20373
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'Sol_Nivel'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 22225
        mmTop = 4763
        mmWidth = 9260
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'Cli_Fantasia'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 67998
        mmTop = 4763
        mmWidth = 65352
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'Sta_Nome'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 134938
        mmTop = 0
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'Mod_Nome'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 169069
        mmTop = 0
        mmWidth = 41804
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'Prod_Nome'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 169069
        mmTop = 4763
        mmWidth = 41804
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'Analista'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 211667
        mmTop = 0
        mmWidth = 25135
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'Desenvolvedor'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 211667
        mmTop = 4763
        mmWidth = 25135
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'Sol_TempoPrevisto'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 237596
        mmTop = 0
        mmWidth = 20902
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
        DataField = 'Sol_PrevisaoEntrega'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 237596
        mmTop = 4763
        mmWidth = 20902
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'CTotalHoras'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 259028
        mmTop = 0
        mmWidth = 24342
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      BeforePrint = ppSummaryBand1BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Total Geral ==>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 1852
        mmTop = 1588
        mmWidth = 27781
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'Sol_Id'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 43392
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object Relatorio1CalcTempoGeral: TppDBCalc
        UserName = 'Relatorio1CalcTempoGeral'
        DataField = 'TotalTempo'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 202936
        mmTop = 1588
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object lblRelatorio1TotalHoraGeral: TppLabel
        UserName = 'lblRelatorio1TotalHoraGeral'
        AutoSize = False
        Caption = 'lblRelatorio1TotalHoraGeral'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 259028
        mmTop = 1588
        mmWidth = 24342
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'Ver_Id'
      DataPipeline = dbRelatorio1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio1'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppLabel15: TppLabel
          UserName = 'Label15'
          Caption = 'Vers'#227'o:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4234
          mmLeft = 0
          mmTop = 2381
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'Ver_Id'
          DataPipeline = dbRelatorio1
          DisplayFormat = '000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelatorio1'
          mmHeight = 4498
          mmLeft = 14288
          mmTop = 1852
          mmWidth = 12965
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText19: TppDBText
          UserName = 'DBText19'
          DataField = 'Ver_Versao'
          DataPipeline = dbRelatorio1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelatorio1'
          mmHeight = 4498
          mmLeft = 29633
          mmTop = 1852
          mmWidth = 77788
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 11113
        mmPrintPosition = 0
        object ppLabel17: TppLabel
          UserName = 'Label17'
          Caption = 'Total da Vers'#227'o: ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 2646
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'Sol_Id'
          DataPipeline = dbRelatorio1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorio1'
          mmHeight = 4498
          mmLeft = 43392
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object lblRelatorio1TotalHoraVersao: TppLabel
          UserName = 'lblRelatorio1TotalHoraVersao'
          AutoSize = False
          Caption = 'lblRelatorio1TotalHoraVersao'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 259028
          mmTop = 2381
          mmWidth = 24342
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object Relatorio1CalcTempoVersao: TppDBCalc
          UserName = 'Relatorio1CalcTempoVersao'
          DataField = 'TotalTempo'
          DataPipeline = dbRelatorio1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRelatorio1'
          mmHeight = 4498
          mmLeft = 202936
          mmTop = 2381
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 0
          mmTop = 7144
          mmWidth = 283369
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'Sol_Tipo'
      DataPipeline = dbRelatorio1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorio1'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppLabel7: TppLabel
          UserName = 'Label7'
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4234
          mmLeft = 9790
          mmTop = 1058
          mmWidth = 7408
          BandType = 3
          GroupNo = 1
          LayerName = Foreground
        end
        object ppDBText10: TppDBText
          UserName = 'DBText10'
          DataField = 'Tip_Nome'
          DataPipeline = dbRelatorio1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelatorio1'
          mmHeight = 4498
          mmLeft = 20108
          mmTop = 1058
          mmWidth = 45244
          BandType = 3
          GroupNo = 1
          LayerName = Foreground
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand2BeforePrint
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object ppLabel18: TppLabel
          UserName = 'Label18'
          Caption = 'Total do Tipo ==>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 9790
          mmTop = 529
          mmWidth = 31485
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object Relatorio1CalcTotalTipo: TppDBCalc
          UserName = 'Relatorio1CalcTotalTipo'
          DataField = 'Sol_Id'
          DataPipeline = dbRelatorio1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorio1'
          mmHeight = 4498
          mmLeft = 43392
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object ppLine5: TppLine
          UserName = 'Line5'
          Pen.Style = psDot
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 2117
          mmLeft = 0
          mmTop = 4762
          mmWidth = 283369
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object Relatorio1CalcTempoTipo: TppDBCalc
          UserName = 'Relatorio1CalcTempoTipo'
          DataField = 'TotalTempo'
          DataPipeline = dbRelatorio1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRelatorio1'
          mmHeight = 4498
          mmLeft = 202936
          mmTop = 529
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object lblRelatorio1TotalHoraTipo: TppLabel
          UserName = 'lblRelatorio1TotalHoraTipo'
          AutoSize = False
          Caption = 'lblRelatorio1TotalHoraTipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 259028
          mmTop = 529
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object lblRelatorio1PercTipo: TppLabel
          UserName = 'lblRelatorio1PercTipo'
          AutoSize = False
          Caption = 'lblRelatorio1PercTipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 69056
          mmTop = 529
          mmWidth = 15610
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
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
  object dbRelatorioTempo1: TppDBPipeline
    DataSource = dsRelatorioTempo1
    UserName = 'dbRelatorioTempo1'
    Left = 152
    Top = 72
  end
  object cdsRelatorioTipo: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Tip_Nome;Sol_Data'
    Params = <>
    ProviderName = 'dspSolicitacaoTipo'
    OnCalcFields = cdsRelatorioTipoCalcFields
    Left = 40
    Top = 128
    object cdsRelatorioTipoTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      Required = True
    end
    object cdsRelatorioTipoTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object cdsRelatorioTipoSol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
      Origin = 'Sol_Tipo'
    end
    object cdsRelatorioTipoSol_Data: TDateField
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      Required = True
    end
    object cdsRelatorioTipoSol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Origin = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object cdsRelatorioTipoSol_Cliente: TIntegerField
      FieldName = 'Sol_Cliente'
      Origin = 'Sol_Cliente'
      Required = True
    end
    object cdsRelatorioTipoSol_Status: TIntegerField
      FieldName = 'Sol_Status'
      Origin = 'Sol_Status'
      Required = True
    end
    object cdsRelatorioTipoCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      Required = True
    end
    object cdsRelatorioTipoCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object cdsRelatorioTipoSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      Required = True
    end
    object cdsRelatorioTipoSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object cdsRelatorioTipoTempo: TFloatField
      FieldName = 'Tempo'
      Origin = 'Tempo'
      ReadOnly = True
      Required = True
    end
    object cdsRelatorioTipoCTempo: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
    end
  end
  object dsRelatorioTipo: TDataSource
    DataSet = cdsRelatorioTipo
    Left = 104
    Top = 128
  end
  object dbRelatorioTipo: TppDBPipeline
    DataSource = dsRelatorioTipo
    UserName = 'dbRelatorioTipo'
    Left = 152
    Top = 128
  end
  object RelatorioTipo: TppReport
    AutoStop = False
    DataPipeline = dbRelatorioTipo
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
    Left = 224
    Top = 128
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorioTipo'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19579
      mmPrintPosition = 0
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Solicita'#231#245'es - Relat'#243'rio por Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 61648
        mmTop = 529
        mmWidth = 78317
        BandType = 0
        LayerName = Foreground2
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground2
      end
      object lblPeriodoPorTipo: TppLabel
        UserName = 'lblPeriodoPorTipo'
        AutoSize = False
        Caption = 'lblPeriodoModelo1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 48948
        mmTop = 6350
        mmWidth = 99484
        BandType = 0
        LayerName = Foreground2
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable101'
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
        LayerName = Foreground2
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 169069
        mmTop = 529
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 13758
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'T'#237'tulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23548
        mmTop = 13758
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 78052
        mmTop = 13758
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 147109
        mmTop = 13758
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Tempo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 185473
        mmTop = 13758
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine6: TppLine
        UserName = 'Line6'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 17463
        mmWidth = 194734
        BandType = 0
        LayerName = Foreground2
      end
    end
    object ppDetailBand3: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText22: TppDBText
        UserName = 'DBText22'
        DataField = 'Sol_Data'
        DataPipeline = dbRelatorioTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'dbRelatorioTipo'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 20108
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText23: TppDBText
        UserName = 'DBText23'
        DataField = 'Sol_Titulo'
        DataPipeline = dbRelatorioTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorioTipo'
        mmHeight = 4498
        mmLeft = 21960
        mmTop = 0
        mmWidth = 53446
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'Cli_Nome'
        DataPipeline = dbRelatorioTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorioTipo'
        mmHeight = 4498
        mmLeft = 78052
        mmTop = 0
        mmWidth = 67204
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'Sta_Nome'
        DataPipeline = dbRelatorioTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorioTipo'
        mmHeight = 4498
        mmLeft = 147109
        mmTop = 0
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'CTempo'
        DataPipeline = dbRelatorioTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorioTipo'
        mmHeight = 4498
        mmLeft = 173832
        mmTop = 0
        mmWidth = 20902
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppSummaryBand3: TppSummaryBand
      BeforePrint = ppSummaryBand3BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 68792
      mmPrintPosition = 0
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 2381
        mmWidth = 22225
        BandType = 7
        LayerName = Foreground2
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'Sol_Cliente'
        DataPipeline = dbRelatorioTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelatorioTipo'
        mmHeight = 4498
        mmLeft = 28310
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground2
      end
      object CalcGeralTipo: TppDBCalc
        UserName = 'CalcGeralTipo'
        DataField = 'Tempo'
        DataPipeline = dbRelatorioTipo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelatorioTipo'
        mmHeight = 4498
        mmLeft = 76465
        mmTop = 2381
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground2
      end
      object lblGeralTipo: TppLabel
        UserName = 'lblGeralTipo'
        Caption = 'lblGeralTipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4234
        mmLeft = 172509
        mmTop = 2381
        mmWidth = 22225
        BandType = 7
        LayerName = Foreground2
      end
      object tcGraficoTipo: TppTeeChart
        UserName = 'tcGraficoUsuario2'
        mmHeight = 58473
        mmLeft = 0
        mmTop = 9790
        mmWidth = 194205
        BandType = 7
        LayerName = Foreground2
        object ppTeeChartControl2: TppTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          BackWall.Color = clWhite
          BackWall.Pen.Visible = False
          BottomWall.Brush.Gradient.EndColor = clSilver
          BottomWall.Brush.Gradient.StartColor = clGray
          BottomWall.Brush.Gradient.Visible = True
          BottomWall.Pen.Color = clGray
          BottomWall.Size = 4
          Gradient.Direction = gdFromTopLeft
          Gradient.EndColor = 8454016
          Gradient.StartColor = clOlive
          Gradient.Visible = True
          LeftWall.Brush.Gradient.EndColor = clSilver
          LeftWall.Brush.Gradient.StartColor = clGray
          LeftWall.Brush.Gradient.Visible = True
          LeftWall.Color = clWhite
          LeftWall.Pen.Color = clGray
          LeftWall.Size = 4
          MarginBottom = 5
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Color = clBlack
          Title.Font.Height = -24
          Title.Font.Style = [fsBold]
          Title.Font.Shadow.Color = clGray
          Title.Font.Shadow.HorizSize = 1
          Title.Font.Shadow.SmoothBlur = 2
          Title.Font.Shadow.VertSize = 1
          Title.Text.Strings = (
            'Gr'#225'fico por Tipo - Solicita'#231#227'o')
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          View3DOptions.Elevation = 350
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 55
          View3DOptions.Zoom = 90
          AllowPanning = pmNone
          Zoom.Animated = True
          Zoom.Pen.Mode = pmNotXor
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          BackColor = clWhite
          BottomAxis.Grid.Color = 14540253
          BottomAxis.LabelsFormat.Font.Height = -9
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.LabelStyle = talValue
          Chart3DPercent = 100
          ClipPoints = False
          Frame.Visible = False
          LeftAxis.Grid.Color = 14540253
          LeftAxis.LabelsFormat.Font.Height = -9
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelStyle = talValue
          Legend.TextStyle = ltsRightValue
          MaxPointsPerPage = 0
          Page = 1
          RightAxis.LabelsFormat.TextAlignment = taCenter
          ScaleLastPage = True
          TopAxis.LabelsFormat.TextAlignment = taCenter
          View3D = False
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clWhite
          DefaultCanvas = 'TTeeCanvas3D'
          ColorPaletteIndex = 13
          object Series1: TBarSeries
            Marks.Visible = True
            Marks.Style = smsPercent
            MultiBar = mbStacked
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
    end
    object ppGroup3: TppGroup
      BreakName = 'Tip_Codigo'
      DataPipeline = dbRelatorioTipo
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group3'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorioTipo'
      NewFile = False
      object ppGroupHeaderBand3: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLabel29: TppLabel
          UserName = 'Label29'
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1588
          mmWidth = 7408
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          DataField = 'Tip_Codigo'
          DataPipeline = dbRelatorioTipo
          DisplayFormat = '0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelatorioTipo'
          mmHeight = 4498
          mmLeft = 9790
          mmTop = 1588
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBText21: TppDBText
          UserName = 'DBText21'
          DataField = 'Tip_Nome'
          DataPipeline = dbRelatorioTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelatorioTipo'
          mmHeight = 4498
          mmLeft = 23548
          mmTop = 1588
          mmWidth = 101600
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
      end
      object ppGroupFooterBand3: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand3BeforePrint
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 10848
        mmPrintPosition = 0
        object ppLine7: TppLine
          UserName = 'Line7'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 0
          mmTop = 8996
          mmWidth = 194734
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel30: TppLabel
          UserName = 'Label30'
          Caption = 'Total do Tipo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2117
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'Sol_Data'
          DataPipeline = dbRelatorioTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorioTipo'
          mmHeight = 4498
          mmLeft = 28310
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object CalcGTipo: TppDBCalc
          UserName = 'CalcGTipo'
          DataField = 'Tempo'
          DataPipeline = dbRelatorioTipo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup3
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRelatorioTipo'
          mmHeight = 4498
          mmLeft = 76465
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object lblGTempo: TppLabel
          UserName = 'lblGTempo'
          Caption = 'lblGTempo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 173832
          mmTop = 2117
          mmWidth = 20902
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
      end
    end
    object ppDesignLayers3: TppDesignLayers
      object ppDesignLayer3: TppDesignLayer
        UserName = 'Foreground2'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object cdsRelatorioStatus: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'Sta_Nome;Sol_Status;Prod_Nome;Sol_Produto;Cli_Nome'
    Params = <>
    ProviderName = 'dspSolicitacaoStatus'
    OnCalcFields = cdsRelatorioStatusCalcFields
    Left = 40
    Top = 176
    object cdsRelatorioStatusSol_Produto: TIntegerField
      FieldName = 'Sol_Produto'
      Origin = 'Sol_Produto'
    end
    object cdsRelatorioStatusSol_Data: TDateField
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      Required = True
    end
    object cdsRelatorioStatusSol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Origin = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object cdsRelatorioStatusSol_Cliente: TIntegerField
      FieldName = 'Sol_Cliente'
      Origin = 'Sol_Cliente'
      Required = True
    end
    object cdsRelatorioStatusSol_Status: TIntegerField
      FieldName = 'Sol_Status'
      Origin = 'Sol_Status'
      Required = True
    end
    object cdsRelatorioStatusCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      Required = True
    end
    object cdsRelatorioStatusCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object cdsRelatorioStatusSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      Required = True
    end
    object cdsRelatorioStatusSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object cdsRelatorioStatusProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
    end
    object cdsRelatorioStatusProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      Size = 100
    end
    object cdsRelatorioStatusTempo: TFloatField
      FieldName = 'Tempo'
      Origin = 'Tempo'
      ReadOnly = True
      Required = True
    end
    object cdsRelatorioStatusCTempo: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
    end
    object cdsRelatorioStatusSol_tipo: TIntegerField
      FieldName = 'Sol_tipo'
      Origin = 'Sol_tipo'
    end
    object cdsRelatorioStatusTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
    end
    object cdsRelatorioStatusTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Size = 50
    end
  end
  object dsRelatorioStatus: TDataSource
    DataSet = cdsRelatorioStatus
    Left = 104
    Top = 176
  end
  object dbRelatorioStatus: TppDBPipeline
    DataSource = dsRelatorioStatus
    UserName = 'dbRelatorioStatus'
    Left = 152
    Top = 176
    object dbRelatorioStatusppField1: TppField
      FieldAlias = 'Sol_Produto'
      FieldName = 'Sol_Produto'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField2: TppField
      FieldAlias = 'Sol_Data'
      FieldName = 'Sol_Data'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField3: TppField
      FieldAlias = 'Sol_Titulo'
      FieldName = 'Sol_Titulo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField4: TppField
      FieldAlias = 'Sol_Cliente'
      FieldName = 'Sol_Cliente'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField5: TppField
      FieldAlias = 'Sol_Status'
      FieldName = 'Sol_Status'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField6: TppField
      FieldAlias = 'Cli_Codigo'
      FieldName = 'Cli_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField7: TppField
      FieldAlias = 'Cli_Nome'
      FieldName = 'Cli_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField8: TppField
      FieldAlias = 'Sta_Codigo'
      FieldName = 'Sta_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField9: TppField
      FieldAlias = 'Sta_Nome'
      FieldName = 'Sta_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField10: TppField
      FieldAlias = 'Prod_Codigo'
      FieldName = 'Prod_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField11: TppField
      FieldAlias = 'Prod_Nome'
      FieldName = 'Prod_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField12: TppField
      FieldAlias = 'Tempo'
      FieldName = 'Tempo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField13: TppField
      FieldAlias = 'CTempo'
      FieldName = 'CTempo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField14: TppField
      FieldAlias = 'Sol_tipo'
      FieldName = 'Sol_tipo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField15: TppField
      FieldAlias = 'Tip_Codigo'
      FieldName = 'Tip_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object dbRelatorioStatusppField16: TppField
      FieldAlias = 'Tip_Nome'
      FieldName = 'Tip_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
  end
  object RelatorioStatus: TppReport
    AutoStop = False
    DataPipeline = dbRelatorioStatus
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
    OutlineSettings.CreatePageNodes = False
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
    Left = 224
    Top = 176
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorioStatus'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'T'#237'tulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23548
        mmTop = 13758
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 117475
        mmTop = 13758
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Tempo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 187855
        mmTop = 13758
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground3
      end
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 529
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground3
      end
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
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
        LayerName = Foreground3
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 13758
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Solicita'#231#245'es - Relat'#243'rio por Status e Produtos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 43127
        mmTop = 529
        mmWidth = 111125
        BandType = 0
        LayerName = Foreground3
      end
      object ppSystemVariable8: TppSystemVariable
        UserName = 'SystemVariable8'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 169069
        mmTop = 529
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpBottom
        Style = lsDouble
        Weight = 0.750000000000000000
        mmHeight = 1323
        mmLeft = 0
        mmTop = 17727
        mmWidth = 198173
        BandType = 0
        LayerName = Foreground3
      end
      object lblPeriodoModelo3: TppLabel
        UserName = 'lblPeriodoPorTipo1'
        AutoSize = False
        Caption = 'lblPeriodoModelo3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 48948
        mmTop = 6350
        mmWidth = 99484
        BandType = 0
        LayerName = Foreground3
      end
    end
    object ppDetailBand4: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText31: TppDBText
        UserName = 'DBText31'
        DataField = 'Sol_Data'
        DataPipeline = dbRelatorioStatus
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorioStatus'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 20373
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText34: TppDBText
        UserName = 'DBText34'
        DataField = 'CTempo'
        DataPipeline = dbRelatorioStatus
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelatorioStatus'
        mmHeight = 4498
        mmLeft = 182563
        mmTop = 0
        mmWidth = 14552
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBMemo1: TppDBMemo
        UserName = 'DBMemo1'
        CharWrap = False
        DataField = 'Sol_Titulo'
        DataPipeline = dbRelatorioStatus
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        RemoveEmptyLines = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'dbRelatorioStatus'
        mmHeight = 4498
        mmLeft = 22490
        mmTop = 0
        mmWidth = 93134
        BandType = 4
        LayerName = Foreground3
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
      object ppDBMemo2: TppDBMemo
        UserName = 'DBMemo2'
        CharWrap = False
        DataField = 'Cli_Nome'
        DataPipeline = dbRelatorioStatus
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        RemoveEmptyLines = False
        Stretch = True
        Transparent = True
        DataPipelineName = 'dbRelatorioStatus'
        mmHeight = 4498
        mmLeft = 117475
        mmTop = 0
        mmWidth = 63765
        BandType = 4
        LayerName = Foreground3
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeading = 0
      end
    end
    object ppSummaryBand4: TppSummaryBand
      BeforePrint = ppSummaryBand4BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 75406
      mmPrintPosition = 0
      object ppLabel40: TppLabel
        UserName = 'Label40'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 1852
        mmWidth = 22225
        BandType = 7
        LayerName = Foreground3
      end
      object ppDBCalc7: TppDBCalc
        UserName = 'DBCalc7'
        DataField = 'Sol_Cliente'
        DataPipeline = dbRelatorioStatus
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelatorioStatus'
        mmHeight = 4498
        mmLeft = 56356
        mmTop = 1587
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground3
      end
      object lblTempoStatus3: TppLabel
        UserName = 'lblTempoStatus3'
        Caption = 'lblTempoStatus3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 169333
        mmTop = 1852
        mmWidth = 27782
        BandType = 7
        LayerName = Foreground3
      end
      object CalcTempoStatus3: TppDBCalc
        UserName = 'CalcTempoStatus3'
        DataField = 'Tempo'
        DataPipeline = dbRelatorioStatus
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelatorioStatus'
        mmHeight = 4498
        mmLeft = 109009
        mmTop = 1587
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground3
      end
      object tcGraficoStatus: TppTeeChart
        UserName = 'tcGraficoStatus'
        mmHeight = 58473
        mmLeft = 0
        mmTop = 9790
        mmWidth = 194205
        BandType = 7
        LayerName = Foreground3
        object ppTeeChartControl2: TppTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          BackWall.Color = clWhite
          BackWall.Pen.Visible = False
          BottomWall.Brush.Gradient.EndColor = clSilver
          BottomWall.Brush.Gradient.StartColor = clGray
          BottomWall.Brush.Gradient.Visible = True
          BottomWall.Pen.Color = clGray
          BottomWall.Size = 4
          Gradient.Direction = gdFromTopLeft
          Gradient.EndColor = 8454016
          Gradient.StartColor = clOlive
          Gradient.Visible = True
          LeftWall.Brush.Gradient.EndColor = clSilver
          LeftWall.Brush.Gradient.StartColor = clGray
          LeftWall.Brush.Gradient.Visible = True
          LeftWall.Color = clWhite
          LeftWall.Pen.Color = clGray
          LeftWall.Size = 4
          MarginBottom = 5
          MarginLeft = 5
          MarginRight = 5
          MarginTop = 5
          Title.Font.Color = clBlack
          Title.Font.Height = -24
          Title.Font.Style = [fsBold]
          Title.Font.Shadow.Color = clGray
          Title.Font.Shadow.HorizSize = 1
          Title.Font.Shadow.SmoothBlur = 2
          Title.Font.Shadow.VertSize = 1
          Title.Text.Strings = (
            'Gr'#225'fico por Status - Solicita'#231#227'o')
          DepthAxis.LabelsFormat.TextAlignment = taCenter
          View3DOptions.Elevation = 350
          View3DOptions.Orthogonal = False
          View3DOptions.Perspective = 55
          View3DOptions.Zoom = 90
          AllowPanning = pmNone
          Zoom.Animated = True
          Zoom.Pen.Mode = pmNotXor
          DepthTopAxis.LabelsFormat.TextAlignment = taCenter
          BackColor = clWhite
          BottomAxis.Grid.Color = 14540253
          BottomAxis.LabelsFormat.Font.Height = -9
          BottomAxis.LabelsFormat.TextAlignment = taCenter
          BottomAxis.LabelStyle = talValue
          Chart3DPercent = 100
          ClipPoints = False
          Frame.Visible = False
          LeftAxis.Grid.Color = 14540253
          LeftAxis.LabelsFormat.Font.Height = -9
          LeftAxis.LabelsFormat.TextAlignment = taCenter
          LeftAxis.LabelStyle = talValue
          Legend.TextStyle = ltsRightValue
          MaxPointsPerPage = 0
          Page = 1
          RightAxis.LabelsFormat.TextAlignment = taCenter
          ScaleLastPage = True
          TopAxis.LabelsFormat.TextAlignment = taCenter
          View3D = False
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clWhite
          DefaultCanvas = 'TTeeCanvas3D'
          ColorPaletteIndex = 13
          object Series1: TBarSeries
            Marks.Visible = True
            Marks.Style = smsPercent
            MultiBar = mbStacked
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'Sol_Status'
      DataPipeline = dbRelatorioStatus
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorioStatus'
      NewFile = False
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLabel33: TppLabel
          UserName = 'Label33'
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1323
          mmWidth = 11113
          BandType = 3
          GroupNo = 0
          LayerName = Foreground3
        end
        object ppDBText27: TppDBText
          UserName = 'DBText27'
          DataField = 'Sta_Codigo'
          DataPipeline = dbRelatorioStatus
          DisplayFormat = '0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelatorioStatus'
          mmHeight = 4498
          mmLeft = 13229
          mmTop = 1323
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
          LayerName = Foreground3
        end
        object ppDBText28: TppDBText
          UserName = 'DBText28'
          DataField = 'Sta_Nome'
          DataPipeline = dbRelatorioStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelatorioStatus'
          mmHeight = 4498
          mmLeft = 26194
          mmTop = 1323
          mmWidth = 102394
          BandType = 3
          GroupNo = 0
          LayerName = Foreground3
        end
        object ppLine11: TppLine
          UserName = 'Line11'
          Position = lpBottom
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 2381
          mmLeft = 0
          mmTop = 5556
          mmWidth = 198174
          BandType = 3
          GroupNo = 0
          LayerName = Foreground3
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand4BeforePrint
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel39: TppLabel
          UserName = 'Label39'
          Caption = 'Total Status:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1322
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
          LayerName = Foreground3
        end
        object ppDBCalc6: TppDBCalc
          UserName = 'DBCalc6'
          DataField = 'Sol_Cliente'
          DataPipeline = dbRelatorioStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorioStatus'
          mmHeight = 4498
          mmLeft = 56356
          mmTop = 1057
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground3
        end
        object ppLine10: TppLine
          UserName = 'Line10'
          Position = lpBottom
          Style = lsDouble
          Weight = 0.750000000000000000
          mmHeight = 2117
          mmLeft = 0
          mmTop = 4233
          mmWidth = 198173
          BandType = 5
          GroupNo = 0
          LayerName = Foreground3
        end
        object lblTempoStatus2: TppLabel
          UserName = 'lblTempoStatus2'
          Caption = 'lblTempoStatus2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 169333
          mmTop = 1322
          mmWidth = 27782
          BandType = 5
          GroupNo = 0
          LayerName = Foreground3
        end
        object CalcTempoStatus2: TppDBCalc
          UserName = 'CalcTempoStatus2'
          DataField = 'Tempo'
          DataPipeline = dbRelatorioStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup4
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRelatorioStatus'
          mmHeight = 4498
          mmLeft = 109009
          mmTop = 1057
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground3
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'Sol_Produto'
      DataPipeline = dbRelatorioStatus
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelatorioStatus'
      NewFile = False
      object ppGroupHeaderBand5: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object ppLabel37: TppLabel
          UserName = 'Label37'
          Caption = 'Produto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7408
          mmTop = 1588
          mmWidth = 12965
          BandType = 3
          GroupNo = 1
          LayerName = Foreground3
        end
        object ppDBText29: TppDBText
          UserName = 'DBText29'
          DataField = 'Prod_Codigo'
          DataPipeline = dbRelatorioStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelatorioStatus'
          mmHeight = 4498
          mmLeft = 22490
          mmTop = 1588
          mmWidth = 12171
          BandType = 3
          GroupNo = 1
          LayerName = Foreground3
        end
        object ppDBText30: TppDBText
          UserName = 'DBText30'
          DataField = 'Prod_Nome'
          DataPipeline = dbRelatorioStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelatorioStatus'
          mmHeight = 4498
          mmLeft = 35983
          mmTop = 1588
          mmWidth = 133615
          BandType = 3
          GroupNo = 1
          LayerName = Foreground3
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand5BeforePrint
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object ppLabel38: TppLabel
          UserName = 'Label38'
          Caption = 'Total Produto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 7408
          mmTop = 1322
          mmWidth = 25930
          BandType = 5
          GroupNo = 1
          LayerName = Foreground3
        end
        object ppDBCalc5: TppDBCalc
          UserName = 'DBCalc5'
          DataField = 'Sol_Produto'
          DataPipeline = dbRelatorioStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup5
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelatorioStatus'
          mmHeight = 4498
          mmLeft = 56356
          mmTop = 1057
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
          LayerName = Foreground3
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 0
          mmTop = 5027
          mmWidth = 198173
          BandType = 5
          GroupNo = 1
          LayerName = Foreground3
        end
        object lblTempoStatus1: TppLabel
          UserName = 'lblTempoStatus1'
          Caption = 'lblTempoStatus1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 169334
          mmTop = 1323
          mmWidth = 27781
          BandType = 5
          GroupNo = 1
          LayerName = Foreground3
        end
        object CalcTempoStatus1: TppDBCalc
          UserName = 'CalcTempoStatus1'
          DataField = 'Tempo'
          DataPipeline = dbRelatorioStatus
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          ResetGroup = ppGroup5
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRelatorioStatus'
          mmHeight = 4498
          mmLeft = 109009
          mmTop = 1057
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
          LayerName = Foreground3
        end
      end
    end
    object ppDesignLayers4: TppDesignLayers
      object ppDesignLayer4: TppDesignLayer
        UserName = 'Foreground3'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
end