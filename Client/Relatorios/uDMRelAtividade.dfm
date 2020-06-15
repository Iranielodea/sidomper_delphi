object DMRelAtividade: TDMRelAtividade
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 352
  Width = 604
  object CDSRelChamadoDetModelo1: TClientDataSet
    Aggregates = <>
    DataSetField = CDSRelChamadoModelo1QRelChamadoDetModelo1
    IndexFieldNames = 'ChOco_Data'
    Params = <>
    Left = 184
    Top = 32
    object CDSRelChamadoDetModelo1ChOco_Data: TDateField
      FieldName = 'ChOco_Data'
      ProviderFlags = []
      Required = True
    end
    object CDSRelChamadoDetModelo1ChOco_HoraInicio: TTimeField
      FieldName = 'ChOco_HoraInicio'
      Required = True
    end
    object CDSRelChamadoDetModelo1ChOco_HoraFim: TTimeField
      FieldName = 'ChOco_HoraFim'
      ProviderFlags = []
      Required = True
    end
    object CDSRelChamadoDetModelo1ChOco_DescricaoSolucao: TStringField
      FieldName = 'ChOco_DescricaoSolucao'
      ProviderFlags = []
      Size = 2000
    end
    object CDSRelChamadoDetModelo1Usu_UserName: TWideStringField
      FieldName = 'Usu_UserName'
      Required = True
      Size = 50
    end
    object CDSRelChamadoDetModelo1ChOco_TotalHoras: TFloatField
      FieldName = 'ChOco_TotalHoras'
      Origin = 'ChOco_TotalHoras'
      Required = True
    end
  end
  object RelChamadoModelo1: TppReport
    AutoStop = False
    DataPipeline = dbRelChamadoModelo1
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
    Left = 424
    Top = 32
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelChamadoModelo1'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19844
      mmPrintPosition = 0
      object lblTitulo1: TppLabel
        UserName = 'lblTitulo1'
        Caption = 'Atividades - Relat'#243'rio por Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 103717
        mmTop = 529
        mmWidth = 79904
        BandType = 0
        LayerName = Foreground1
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
        LayerName = Foreground1
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 254530
        mmTop = 529
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 17463
        mmTop = 15081
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 40481
        mmTop = 15081
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Contato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 55298
        mmTop = 15081
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'N'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 150813
        mmTop = 15081
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 167217
        mmTop = 15081
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 214313
        mmTop = 15081
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground1
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'ID'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 15081
        mmWidth = 3704
        BandType = 0
        LayerName = Foreground1
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 18785
        mmWidth = 283634
        BandType = 0
        LayerName = Foreground1
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
        LayerName = Foreground1
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
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppSummaryBand1: TppSummaryBand
      BeforePrint = ppSummaryBand1BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'Cha_Id'
        DataPipeline = dbRelChamadoModelo1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelChamadoModelo1'
        mmHeight = 4498
        mmLeft = 40217
        mmTop = 4233
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 4233
        mmWidth = 22225
        BandType = 7
        LayerName = Foreground1
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 0
        mmWidth = 283634
        BandType = 7
        LayerName = Foreground1
      end
      object ppLabel32: TppLabel
        UserName = 'Label32'
        Caption = 'Total Horas:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 76200
        mmTop = 4233
        mmWidth = 22225
        BandType = 7
        LayerName = Foreground1
      end
      object SumTotalHorasModelo1B: TppDBCalc
        UserName = 'SumTotalHorasModelo1B'
        DataField = 'TotalHorasGeral'
        DataPipeline = dbRelChamadoModelo1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelChamadoModelo1'
        mmHeight = 4498
        mmLeft = 141817
        mmTop = 4233
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground1
      end
      object lblTotalHorasModelo1B: TppLabel
        UserName = 'lblTotalHorasModelo1B'
        AutoSize = False
        Caption = 'lblTotalHorasModelo1B'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 4233
        mmWidth = 23283
        BandType = 7
        LayerName = Foreground1
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'Cli_Codigo'
      DataPipeline = dbRelChamadoModelo1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      KeepTogether = True
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelChamadoModelo1'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6615
        mmPrintPosition = 0
        object ppShape1: TppShape
          UserName = 'Shape1'
          Brush.Color = clSilver
          Pen.Style = psClear
          mmHeight = 6082
          mmLeft = 0
          mmTop = 0
          mmWidth = 283634
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText4: TppDBText
          UserName = 'DBText4'
          DataField = 'Cli_Codigo'
          DataPipeline = dbRelChamadoModelo1
          DisplayFormat = '000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 17463
          mmTop = 1058
          mmWidth = 13494
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'Cli_Nome'
          DataPipeline = dbRelChamadoModelo1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 33602
          mmTop = 1058
          mmWidth = 117211
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Cliente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 1852
          mmTop = 1058
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand1BeforePrint
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 8467
        mmPrintPosition = 0
        object ppLabel11: TppLabel
          UserName = 'Label11'
          Caption = 'Total de Atividades:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2646
          mmWidth = 37042
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'Cha_Id'
          DataPipeline = dbRelChamadoModelo1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 40217
          mmTop = 2646
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLine2: TppLine
          UserName = 'Line2'
          Pen.Style = psDot
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6879
          mmWidth = 283634
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object ppLabel31: TppLabel
          UserName = 'Label31'
          Caption = 'Total Horas:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 76200
          mmTop = 2117
          mmWidth = 22225
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object SumTotalHorasModelo1A: TppDBCalc
          UserName = 'SumTotalHorasModelo1A'
          DataField = 'TotalHorasGeral'
          DataPipeline = dbRelChamadoModelo1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 139700
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
        object lblTotalHorasModelo1A: TppLabel
          UserName = 'lblTotalHorasModelo1A'
          AutoSize = False
          Caption = 'lblTotalHorasModelo1A'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 101600
          mmTop = 2117
          mmWidth = 23283
          BandType = 5
          GroupNo = 0
          LayerName = Foreground1
        end
      end
    end
    object ppGroup5: TppGroup
      BreakName = 'Cha_Id'
      DataPipeline = dbRelChamadoModelo1
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group5'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelChamadoModelo1'
      NewFile = False
      object ppGroupHeaderBand5: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        PrintHeight = phDynamic
        mmBottomOffset = 0
        mmHeight = 10054
        mmPrintPosition = 0
        object ppShape2: TppShape
          UserName = 'Shape2'
          Brush.Color = 14079702
          Pen.Style = psClear
          mmHeight = 4498
          mmLeft = 0
          mmTop = 265
          mmWidth = 283634
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'Cha_DataAbertura'
          DataPipeline = dbRelChamadoModelo1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 17463
          mmTop = 265
          mmWidth = 20373
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBText3: TppDBText
          UserName = 'DBText3'
          DataField = 'Cha_HoraAbertura'
          DataPipeline = dbRelChamadoModelo1
          DisplayFormat = 'h:nn'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 40481
          mmTop = 265
          mmWidth = 12700
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBText5: TppDBText
          UserName = 'DBText5'
          Border.Color = clWindow
          DataField = 'Cha_Contato'
          DataPipeline = dbRelChamadoModelo1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 55298
          mmTop = 265
          mmWidth = 94192
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBText6: TppDBText
          UserName = 'DBText6'
          DataField = 'Nivel'
          DataPipeline = dbRelChamadoModelo1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 150813
          mmTop = 265
          mmWidth = 15346
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBText7: TppDBText
          UserName = 'DBText7'
          DataField = 'Tip_Nome'
          DataPipeline = dbRelChamadoModelo1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = []
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 167217
          mmTop = 265
          mmWidth = 43392
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppDBText13: TppDBText
          UserName = 'DBText13'
          DataField = 'Cha_Id'
          DataPipeline = dbRelChamadoModelo1
          DisplayFormat = '000000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 0
          mmTop = 265
          mmWidth = 15081
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
        object ppSubReport1: TppSubReport
          UserName = 'SubReport1'
          ExpandAll = False
          NewPrintJob = False
          OutlineSettings.CreateNode = True
          TraverseAllData = False
          DataPipelineName = 'dbRelChamadoDetModelo1'
          mmHeight = 5027
          mmLeft = 0
          mmTop = 5027
          mmWidth = 284300
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
          mmBottomOffset = 0
          mmOverFlowOffset = 0
          mmStopPosition = 0
          mmMinHeight = 0
          object ppChildReport1: TppChildReport
            AutoStop = False
            DataPipeline = dbRelChamadoDetModelo1
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
            DataPipelineName = 'dbRelChamadoDetModelo1'
            object ppTitleBand1: TppTitleBand
              Background.Brush.Style = bsClear
              mmBottomOffset = 0
              mmHeight = 8467
              mmPrintPosition = 0
              object ppLabel13: TppLabel
                UserName = 'Label13'
                Caption = 'Data'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4234
                mmLeft = 14817
                mmTop = 1058
                mmWidth = 7408
                BandType = 1
                LayerName = Foreground
              end
              object ppLabel14: TppLabel
                UserName = 'Label14'
                Caption = 'Hora Inicial'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4234
                mmLeft = 38629
                mmTop = 1058
                mmWidth = 22225
                BandType = 1
                LayerName = Foreground
              end
              object ppLabel15: TppLabel
                UserName = 'Label15'
                Caption = 'Hora Final'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 62442
                mmTop = 1058
                mmWidth = 18521
                BandType = 1
                LayerName = Foreground
              end
              object ppLabel16: TppLabel
                UserName = 'Label16'
                Caption = 'Usu'#225'rio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4234
                mmLeft = 83873
                mmTop = 1058
                mmWidth = 12965
                BandType = 1
                LayerName = Foreground
              end
              object ppLine4: TppLine
                UserName = 'Line4'
                Weight = 0.750000000000000000
                mmHeight = 1057
                mmLeft = 14817
                mmTop = 0
                mmWidth = 268288
                BandType = 1
                LayerName = Foreground
              end
              object ppLabel17: TppLabel
                UserName = 'Label17'
                Caption = 'Descri'#231#227'o da Solu'#231#227'o'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4234
                mmLeft = 136790
                mmTop = 1058
                mmWidth = 37042
                BandType = 1
                LayerName = Foreground
              end
              object ppLine7: TppLine
                UserName = 'Line7'
                Position = lpBottom
                Weight = 0.750000000000000000
                mmHeight = 1058
                mmLeft = 15610
                mmTop = 7408
                mmWidth = 268288
                BandType = 1
                LayerName = Foreground
              end
            end
            object ppDetailBand1: TppDetailBand
              Background1.Brush.Style = bsClear
              Background2.Brush.Style = bsClear
              PrintHeight = phDynamic
              mmBottomOffset = 0
              mmHeight = 7144
              mmPrintPosition = 0
              object ppDBText9: TppDBText
                UserName = 'DBText9'
                DataField = 'ChOco_Data'
                DataPipeline = dbRelChamadoDetModelo1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'dbRelChamadoDetModelo1'
                mmHeight = 4498
                mmLeft = 14817
                mmTop = 2646
                mmWidth = 21167
                BandType = 4
                LayerName = Foreground
              end
              object ppDBText10: TppDBText
                UserName = 'DBText10'
                DataField = 'ChOco_HoraInicio'
                DataPipeline = dbRelChamadoDetModelo1
                DisplayFormat = 'h:nn'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'dbRelChamadoDetModelo1'
                mmHeight = 4498
                mmLeft = 43656
                mmTop = 2646
                mmWidth = 17198
                BandType = 4
                LayerName = Foreground
              end
              object ppDBText11: TppDBText
                UserName = 'DBText11'
                DataField = 'ChOco_HoraFim'
                DataPipeline = dbRelChamadoDetModelo1
                DisplayFormat = 'h:nn'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = []
                TextAlignment = taRightJustified
                Transparent = True
                DataPipelineName = 'dbRelChamadoDetModelo1'
                mmHeight = 4498
                mmLeft = 63765
                mmTop = 2646
                mmWidth = 17198
                BandType = 4
                LayerName = Foreground
              end
              object ppDBText12: TppDBText
                UserName = 'DBText12'
                DataField = 'Usu_UserName'
                DataPipeline = dbRelChamadoDetModelo1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = []
                Transparent = True
                DataPipelineName = 'dbRelChamadoDetModelo1'
                mmHeight = 4498
                mmLeft = 83873
                mmTop = 2646
                mmWidth = 47890
                BandType = 4
                LayerName = Foreground
              end
              object ppLine5: TppLine
                UserName = 'Line5'
                Pen.Style = psDot
                Weight = 0.750000000000000000
                mmHeight = 1852
                mmLeft = 14817
                mmTop = 0
                mmWidth = 268288
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
                DataField = 'ChOco_DescricaoSolucao'
                DataPipeline = dbRelChamadoDetModelo1
                RemoveEmptyLines = False
                Stretch = True
                Transparent = True
                DataPipelineName = 'dbRelChamadoDetModelo1'
                mmHeight = 4233
                mmLeft = 136790
                mmTop = 2646
                mmWidth = 142611
                BandType = 4
                LayerName = Foreground
                mmBottomOffset = 0
                mmOverFlowOffset = 0
                mmStopPosition = 0
                mmMinHeight = 0
              end
            end
            object ppSummaryBand2: TppSummaryBand
              BeforePrint = ppSummaryBand2BeforePrint
              Background.Brush.Style = bsClear
              mmBottomOffset = 0
              mmHeight = 9790
              mmPrintPosition = 0
              object ppLabel18: TppLabel
                UserName = 'Label18'
                Caption = 'Total Horas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                mmHeight = 4233
                mmLeft = 15610
                mmTop = 1852
                mmWidth = 20373
                BandType = 7
                LayerName = Foreground
              end
              object lblTotalHorasModelo1: TppLabel
                UserName = 'lblTotalHorasModelo1'
                Caption = 'lblTotalHorasModelo1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                TextAlignment = taRightJustified
                Transparent = True
                mmHeight = 4233
                mmLeft = 44715
                mmTop = 1852
                mmWidth = 16140
                BandType = 7
                LayerName = Foreground
              end
              object SumTotalHorasModelo1: TppDBCalc
                UserName = 'SumTotalHorasModelo1'
                DataField = 'ChOco_TotalHoras'
                DataPipeline = dbRelChamadoDetModelo1
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Name = 'Courier New'
                Font.Size = 9
                Font.Style = [fsBold]
                Transparent = True
                Visible = False
                DataPipelineName = 'dbRelChamadoDetModelo1'
                mmHeight = 4498
                mmLeft = 87048
                mmTop = 1323
                mmWidth = 23813
                BandType = 7
                LayerName = Foreground
              end
              object ppLine6: TppLine
                UserName = 'Line6'
                Position = lpBottom
                Weight = 0.750000000000000000
                mmHeight = 1588
                mmLeft = 14817
                mmTop = 6879
                mmWidth = 268288
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
          end
        end
        object ppDBText8: TppDBText
          UserName = 'DBText8'
          DataField = 'Sta_Nome'
          DataPipeline = dbRelChamadoModelo1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo1'
          mmHeight = 4498
          mmLeft = 214313
          mmTop = 265
          mmWidth = 52652
          BandType = 3
          GroupNo = 1
          LayerName = Foreground1
        end
      end
      object ppGroupFooterBand5: TppGroupFooterBand
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
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
  object dbRelChamadoModelo1: TppDBPipeline
    DataSource = dsRelChamadoModelo1
    UserName = 'dbRelChamadoModelo1'
    Left = 312
    Top = 32
  end
  object dsRelChamadoDetModelo1: TDataSource
    DataSet = CDSRelChamadoDetModelo1
    Left = 184
    Top = 88
  end
  object dsRelChamadoModelo1: TDataSource
    DataSet = CDSRelChamadoModelo1
    Left = 48
    Top = 88
  end
  object CDSRelChamadoModelo1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelChamadoModelo1'
    Left = 48
    Top = 32
    object CDSRelChamadoModelo1Cha_Id: TAutoIncField
      FieldName = 'Cha_Id'
      Origin = 'Cha_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSRelChamadoModelo1Cha_DataAbertura: TDateField
      FieldName = 'Cha_DataAbertura'
      Origin = 'Cha_DataAbertura'
      Required = True
    end
    object CDSRelChamadoModelo1Cha_HoraAbertura: TTimeField
      FieldName = 'Cha_HoraAbertura'
      Origin = 'Cha_HoraAbertura'
      Required = True
    end
    object CDSRelChamadoModelo1Cha_Contato: TStringField
      FieldName = 'Cha_Contato'
      Origin = 'Cha_Contato'
      Size = 100
    end
    object CDSRelChamadoModelo1Cha_Nivel: TIntegerField
      FieldName = 'Cha_Nivel'
      Origin = 'Cha_Nivel'
      Required = True
    end
    object CDSRelChamadoModelo1Nivel: TStringField
      FieldName = 'Nivel'
      Origin = 'Nivel'
      ReadOnly = True
      Size = 7
    end
    object CDSRelChamadoModelo1Tip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSRelChamadoModelo1Sta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object CDSRelChamadoModelo1QRelChamadoDetModelo1: TDataSetField
      FieldName = 'QRelChamadoDetModelo1'
    end
    object CDSRelChamadoModelo1Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      Required = True
    end
    object CDSRelChamadoModelo1Cli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSRelChamadoModelo1TotalHoraDecimal: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TotalHoraDecimal'
    end
    object CDSRelChamadoModelo1TotalHoras: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'TotalHoras'
      Size = 10
    end
    object CDSRelChamadoModelo1TotalHorasGeral: TFloatField
      FieldName = 'TotalHorasGeral'
      Origin = 'TotalHorasGeral'
      ReadOnly = True
    end
  end
  object dbRelChamadoDetModelo1: TppDBPipeline
    DataSource = dsRelChamadoDetModelo1
    UserName = 'dbRelChamadoDetModelo1'
    Left = 312
    Top = 88
  end
  object CDSRelChamadoModelo2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelChamadoModelo2'
    Left = 48
    Top = 152
    object CDSRelChamadoModelo2Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      Required = True
    end
    object CDSRelChamadoModelo2Cli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSRelChamadoModelo2Rev_Codigo: TIntegerField
      FieldName = 'Rev_Codigo'
      Origin = 'Rev_Codigo'
      Required = True
    end
    object CDSRelChamadoModelo2Rev_Nome: TWideStringField
      FieldName = 'Rev_Nome'
      Origin = 'Rev_Nome'
      Required = True
      Size = 100
    end
    object CDSRelChamadoModelo2QtdeChamados: TIntegerField
      FieldName = 'QtdeChamados'
      Origin = 'QtdeChamados'
      ReadOnly = True
    end
    object CDSRelChamadoModelo2TotalHoras: TFloatField
      FieldName = 'TotalHoras'
      ReadOnly = True
    end
  end
  object dsRelChamadoDetModelo2: TDataSource
    DataSet = CDSRelChamadoModelo2
    Left = 184
    Top = 152
  end
  object dbRelChamadoModelo2: TppDBPipeline
    DataSource = dsRelChamadoDetModelo2
    UserName = 'dbRelChamadoModelo2'
    Left = 312
    Top = 152
    object dbRelChamadoModelo2ppField1: TppField
      FieldAlias = 'Cli_Codigo'
      FieldName = 'Cli_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo2ppField2: TppField
      FieldAlias = 'Cli_Nome'
      FieldName = 'Cli_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo2ppField3: TppField
      FieldAlias = 'Rev_Codigo'
      FieldName = 'Rev_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo2ppField4: TppField
      FieldAlias = 'Rev_Nome'
      FieldName = 'Rev_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo2ppField5: TppField
      FieldAlias = 'QtdeChamados'
      FieldName = 'QtdeChamados'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo2ppField6: TppField
      FieldAlias = 'TotalHoras'
      FieldName = 'TotalHoras'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo2ppField7: TppField
      FieldAlias = 'CTotalHoras'
      FieldName = 'CTotalHoras'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
  end
  object RelChamadoModelo2: TppReport
    AutoStop = False
    DataPipeline = dbRelChamadoModelo2
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
    Left = 424
    Top = 152
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelChamadoModelo2'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 17198
      mmPrintPosition = 0
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
        mmTop = 0
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground2
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable4'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 169598
        mmTop = 0
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Atividades - Resumo de Horas por Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 46567
        mmTop = 0
        mmWidth = 101336
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 12965
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Qtde Atividades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 138642
        mmTop = 12700
        mmWidth = 27781
        BandType = 0
        LayerName = Foreground2
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Total Horas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 174625
        mmTop = 12965
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground2
      end
      object ppLine8: TppLine
        UserName = 'Line8'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1852
        mmLeft = 0
        mmTop = 15346
        mmWidth = 196321
        BandType = 0
        LayerName = Foreground2
      end
      object lblPeriodoModelo2: TppLabel
        UserName = 'lblPeriodoModelo2'
        AutoSize = False
        Caption = 'lblPeriodoModelo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 52917
        mmTop = 6350
        mmWidth = 92869
        BandType = 0
        LayerName = Foreground2
      end
      object ppSystemVariable9: TppSystemVariable
        UserName = 'SystemVariable9'
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
    end
    object ppDetailBand3: TppDetailBand
      BeforePrint = ppDetailBand3BeforePrint
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'Cli_Codigo'
        DataPipeline = dbRelChamadoModelo2
        DisplayFormat = '000000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo2'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 13758
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'Cli_Nome'
        DataPipeline = dbRelChamadoModelo2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo2'
        mmHeight = 4498
        mmLeft = 13229
        mmTop = 0
        mmWidth = 131234
        BandType = 4
        LayerName = Foreground2
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'QtdeChamados'
        DataPipeline = dbRelChamadoModelo2
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo2'
        mmHeight = 4498
        mmLeft = 149754
        mmTop = 0
        mmWidth = 16669
        BandType = 4
        LayerName = Foreground2
      end
      object txtQtdeHorasModelo2: TppDBText
        UserName = 'txtQtdeHorasModelo2'
        DataField = 'TotalHoras'
        DataPipeline = dbRelChamadoModelo2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelChamadoModelo2'
        mmHeight = 4498
        mmLeft = 144992
        mmTop = 0
        mmWidth = 6879
        BandType = 4
        LayerName = Foreground2
      end
      object lblTotalHorasModelo2: TppLabel
        UserName = 'lblTotalHorasModelo2'
        AutoSize = False
        Caption = 'lblTotalHorasModelo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 169598
        mmTop = 0
        mmWidth = 25400
        BandType = 4
        LayerName = Foreground2
      end
    end
    object ppSummaryBand3: TppSummaryBand
      BeforePrint = ppSummaryBand3BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 1058
        mmTop = 3175
        mmWidth = 22225
        BandType = 7
        LayerName = Foreground2
      end
      object sumTotalHorasModelo2: TppDBCalc
        UserName = 'sumTotalHorasModelo2'
        DataField = 'TotalHoras'
        DataPipeline = dbRelChamadoModelo2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelChamadoModelo2'
        mmHeight = 4498
        mmLeft = 80433
        mmTop = 3969
        mmWidth = 27781
        BandType = 7
        LayerName = Foreground2
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'Cli_Codigo'
        DataPipeline = dbRelChamadoModelo2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelChamadoModelo2'
        mmHeight = 4498
        mmLeft = 27781
        mmTop = 3175
        mmWidth = 16404
        BandType = 7
        LayerName = Foreground2
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'QtdeChamados'
        DataPipeline = dbRelChamadoModelo2
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo2'
        mmHeight = 4498
        mmLeft = 144992
        mmTop = 3175
        mmWidth = 21431
        BandType = 7
        LayerName = Foreground2
      end
      object lblTotalHorasGeralModelo2: TppLabel
        UserName = 'lblTotalHorasGeralModelo2'
        AutoSize = False
        Caption = 'lblTotalHorasGeralModelo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 169598
        mmTop = 3175
        mmWidth = 25400
        BandType = 7
        LayerName = Foreground2
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'Rev_Codigo'
      DataPipeline = dbRelChamadoModelo2
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelChamadoModelo2'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7144
        mmPrintPosition = 0
        object ppDBText18: TppDBText
          UserName = 'DBText18'
          DataField = 'Rev_Nome'
          DataPipeline = dbRelChamadoModelo2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo2'
          mmHeight = 4498
          mmLeft = 31485
          mmTop = 1323
          mmWidth = 110596
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLabel23: TppLabel
          UserName = 'Label23'
          Caption = 'Revenda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1323
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'Rev_Codigo'
          DataPipeline = dbRelChamadoModelo2
          DisplayFormat = '0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo2'
          mmHeight = 4498
          mmLeft = 17727
          mmTop = 1323
          mmWidth = 11377
          BandType = 3
          GroupNo = 0
          LayerName = Foreground2
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand2BeforePrint
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 8202
        mmPrintPosition = 0
        object ppLabel24: TppLabel
          UserName = 'Label24'
          Caption = 'Total Revenda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2646
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          DataField = 'Cli_Codigo'
          DataPipeline = dbRelChamadoModelo2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelChamadoModelo2'
          mmHeight = 4498
          mmLeft = 35454
          mmTop = 2646
          mmWidth = 8731
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppLine9: TppLine
          UserName = 'Line9'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 0
          mmTop = 5821
          mmWidth = 196321
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object sumSubTotalHorasModelo2: TppDBCalc
          UserName = 'sumSubTotalHorasModelo2'
          DataField = 'TotalHoras'
          DataPipeline = dbRelChamadoModelo2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRelChamadoModelo2'
          mmHeight = 4498
          mmLeft = 80433
          mmTop = 265
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object ppDBCalc4: TppDBCalc
          UserName = 'DBCalc4'
          DataField = 'QtdeChamados'
          DataPipeline = dbRelChamadoModelo2
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo2'
          mmHeight = 4498
          mmLeft = 144992
          mmTop = 2646
          mmWidth = 21431
          BandType = 5
          GroupNo = 0
          LayerName = Foreground2
        end
        object lblSubTotalHorasModelo2: TppLabel
          UserName = 'lblSubTotalHorasModelo2'
          AutoSize = False
          Caption = 'lblSubTotalHorasModelo2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 171715
          mmTop = 2646
          mmWidth = 23283
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
    object ppParameterList1: TppParameterList
    end
  end
  object CDSRelChamadoModelo3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelChamadoModelo3'
    Left = 48
    Top = 216
    object CDSRelChamadoModelo3Usu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      Required = True
    end
    object CDSRelChamadoModelo3QtdeChamados: TIntegerField
      FieldName = 'QtdeChamados'
      Origin = 'QtdeChamados'
      ReadOnly = True
    end
    object CDSRelChamadoModelo3TotalHoras: TFloatField
      FieldName = 'TotalHoras'
      Origin = 'TotalHoras'
      ReadOnly = True
    end
    object CDSRelChamadoModelo3Usu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object CDSRelChamadoModelo3TotalHorasDetalhes: TFloatField
      FieldName = 'TotalHorasDetalhes'
      ReadOnly = True
    end
  end
  object dsRelChamadoModelo3: TDataSource
    DataSet = CDSRelChamadoModelo3A
    Left = 184
    Top = 216
  end
  object dbRelChamadoModelo3: TppDBPipeline
    DataSource = dsRelChamadoModelo3
    UserName = 'dbRelChamadoModelo3'
    Left = 320
    Top = 216
    object dbRelChamadoModelo3ppField1: TppField
      FieldAlias = 'Usu_Codigo'
      FieldName = 'Usu_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo3ppField2: TppField
      FieldAlias = 'QtdeChamados'
      FieldName = 'QtdeChamados'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo3ppField3: TppField
      FieldAlias = 'TotalHoras'
      FieldName = 'TotalHoras'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo3ppField4: TppField
      FieldAlias = 'Usu_Nome'
      FieldName = 'Usu_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo3ppField5: TppField
      FieldAlias = 'TotalHorasDetalhes'
      FieldName = 'TotalHorasDetalhes'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
  end
  object RelChamadoModelo3: TppReport
    AutoStop = False
    DataPipeline = dbRelChamadoModelo3
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
    Left = 424
    Top = 216
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelChamadoModelo3'
    object ppHeaderBand3: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 19579
      mmPrintPosition = 0
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Atividades - Resumo de Ocorr'#234'ncias por Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 40217
        mmTop = 529
        mmWidth = 119327
        BandType = 0
        LayerName = Foreground3
      end
      object ppSystemVariable5: TppSystemVariable
        UserName = 'SystemVariable5'
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
      object ppSystemVariable6: TppSystemVariable
        UserName = 'SystemVariable6'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 169863
        mmTop = 529
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 0
        mmTop = 15610
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Qtde Ocorr'#234'ncias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 92542
        mmTop = 15610
        mmWidth = 29633
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Total Horas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 133817
        mmTop = 15610
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground3
      end
      object ppLine10: TppLine
        UserName = 'Line10'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 18521
        mmWidth = 195792
        BandType = 0
        LayerName = Foreground3
      end
      object lblPeriodoModelo3: TppLabel
        UserName = 'lblPeriodoModelo3'
        AutoSize = False
        Caption = 'lblPeriodoModelo3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 46567
        mmTop = 6350
        mmWidth = 103188
        BandType = 0
        LayerName = Foreground3
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Total Horas Colab'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 160867
        mmTop = 14817
        mmWidth = 31485
        BandType = 0
        LayerName = Foreground3
      end
      object ppSystemVariable11: TppSystemVariable
        UserName = 'SystemVariable11'
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
    end
    object ppDetailBand4: TppDetailBand
      BeforePrint = ppDetailBand4BeforePrint
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText19: TppDBText
        UserName = 'DBText19'
        DataField = 'Usu_Codigo'
        DataPipeline = dbRelChamadoModelo3
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo3'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 9525
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText20: TppDBText
        UserName = 'DBText20'
        DataField = 'Usu_Nome'
        DataPipeline = dbRelChamadoModelo3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo3'
        mmHeight = 4498
        mmLeft = 9523
        mmTop = 0
        mmWidth = 75142
        BandType = 4
        LayerName = Foreground3
      end
      object ppDBText21: TppDBText
        UserName = 'DBText21'
        DataField = 'QtdeChamados'
        DataPipeline = dbRelChamadoModelo3
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo3'
        mmHeight = 4498
        mmLeft = 98098
        mmTop = 0
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground3
      end
      object txtQtdeHorasModelo3: TppDBText
        UserName = 'txtQtdeHorasModelo3'
        DataField = 'TotalHoras'
        DataPipeline = dbRelChamadoModelo3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelChamadoModelo3'
        mmHeight = 4498
        mmLeft = 84667
        mmTop = 0
        mmWidth = 6615
        BandType = 4
        LayerName = Foreground3
      end
      object lblTotalHorasModelo3: TppLabel
        UserName = 'lblTotalHorasModelo3'
        AutoSize = False
        Caption = 'lblTotalHorasModelo3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 128261
        mmTop = 0
        mmWidth = 25929
        BandType = 4
        LayerName = Foreground3
      end
      object txtQtdeHorasColabModelo3: TppDBText
        UserName = 'txtQtdeHorasColabModelo3'
        DataField = 'TotalHorasDetalhes'
        DataPipeline = dbRelChamadoModelo3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelChamadoModelo3'
        mmHeight = 4498
        mmLeft = 92604
        mmTop = 0
        mmWidth = 6350
        BandType = 4
        LayerName = Foreground3
      end
      object lblTotalHorasColabModelo3: TppLabel
        UserName = 'lblTotalHorasColabModelo3'
        AutoSize = False
        Caption = 'lblTotalHorasColabModelo3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 162984
        mmTop = 0
        mmWidth = 29369
        BandType = 4
        LayerName = Foreground3
      end
    end
    object ppSummaryBand4: TppSummaryBand
      BeforePrint = ppSummaryBand4BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 3438
        mmWidth = 22225
        BandType = 7
        LayerName = Foreground3
      end
      object ppDBCalc8: TppDBCalc
        UserName = 'DBCalc8'
        DataField = 'Rev_Codigo'
        DataPipeline = dbRelChamadoModelo3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelChamadoModelo3'
        mmHeight = 4498
        mmLeft = 23283
        mmTop = 3438
        mmWidth = 19315
        BandType = 7
        LayerName = Foreground3
      end
      object ppDBCalc10: TppDBCalc
        UserName = 'DBCalc10'
        DataField = 'QtdeChamados'
        DataPipeline = dbRelChamadoModelo3
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo3'
        mmHeight = 4498
        mmLeft = 94659
        mmTop = 3438
        mmWidth = 27517
        BandType = 7
        LayerName = Foreground3
      end
      object sumTotalHorasModelo3: TppDBCalc
        UserName = 'sumTotalHorasModelo3'
        DataField = 'TotalHoras'
        DataPipeline = dbRelChamadoModelo3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelChamadoModelo3'
        mmHeight = 4498
        mmLeft = 59267
        mmTop = 2910
        mmWidth = 35454
        BandType = 7
        LayerName = Foreground3
      end
      object lblTotalHorasGeralModelo3: TppLabel
        UserName = 'lblTotalHorasGeralModelo3'
        AutoSize = False
        Caption = 'lblTotalHorasGeralModelo3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 128261
        mmTop = 3438
        mmWidth = 25929
        BandType = 7
        LayerName = Foreground3
      end
      object ppLine11: TppLine
        UserName = 'Line11'
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 0
        mmWidth = 195792
        BandType = 7
        LayerName = Foreground3
      end
      object sumTotalHorasColabModelo3: TppDBCalc
        UserName = 'sumTotalHorasColabModelo3'
        DataField = 'TotalHorasDetalhes'
        DataPipeline = dbRelChamadoModelo3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelChamadoModelo3'
        mmHeight = 4498
        mmLeft = 76200
        mmTop = 8467
        mmWidth = 16933
        BandType = 7
        LayerName = Foreground3
      end
      object lblTotalHorasGeralColabModelo3: TppLabel
        UserName = 'lblTotalHorasGeralColabModelo3'
        AutoSize = False
        Caption = 'lblTotalHorasGeralColabModelo3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 162984
        mmTop = 3440
        mmWidth = 29369
        BandType = 7
        LayerName = Foreground3
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
  object CDSRelChamadoModelo4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelChamadoModelo4'
    Left = 48
    Top = 272
    object CDSRelChamadoModelo4Tip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      Required = True
    end
    object CDSRelChamadoModelo4Tip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSRelChamadoModelo4Rev_Codigo: TIntegerField
      FieldName = 'Rev_Codigo'
      Origin = 'Rev_Codigo'
      Required = True
    end
    object CDSRelChamadoModelo4Rev_Nome: TWideStringField
      FieldName = 'Rev_Nome'
      Origin = 'Rev_Nome'
      Required = True
      Size = 100
    end
    object CDSRelChamadoModelo4QtdeChamados: TIntegerField
      FieldName = 'QtdeChamados'
      Origin = 'QtdeChamados'
      ReadOnly = True
    end
    object CDSRelChamadoModelo4TotalHoras: TFloatField
      FieldName = 'TotalHoras'
      ReadOnly = True
    end
  end
  object dsRelChamadoModelo4: TDataSource
    DataSet = CDSRelChamadoModelo4
    Left = 184
    Top = 272
  end
  object dbRelChamadoModelo4: TppDBPipeline
    DataSource = dsRelChamadoModelo4
    UserName = 'dbRelChamadoModelo4'
    Left = 320
    Top = 272
    object dbRelChamadoModelo4ppField1: TppField
      FieldAlias = 'Tip_Codigo'
      FieldName = 'Tip_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo4ppField2: TppField
      FieldAlias = 'Tip_Nome'
      FieldName = 'Tip_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo4ppField3: TppField
      FieldAlias = 'Rev_Codigo'
      FieldName = 'Rev_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo4ppField4: TppField
      FieldAlias = 'Rev_Nome'
      FieldName = 'Rev_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo4ppField5: TppField
      FieldAlias = 'QtdeChamados'
      FieldName = 'QtdeChamados'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object dbRelChamadoModelo4ppField6: TppField
      FieldAlias = 'TotalHoras'
      FieldName = 'TotalHoras'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
  end
  object RelChamadoModelo4: TppReport
    AutoStop = False
    DataPipeline = dbRelChamadoModelo4
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
    Left = 424
    Top = 272
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelChamadoModelo4'
    object ppHeaderBand4: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 22490
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
        UserName = 'SystemVariable7'
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
        LayerName = Foreground4
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
        mmLeft = 170127
        mmTop = 0
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        AutoSize = False
        Caption = 'Atividades - Resumo por Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 38100
        mmTop = 0
        mmWidth = 126207
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 0
        mmTop = 16933
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Qtde Atividades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 139965
        mmTop = 16933
        mmWidth = 27781
        BandType = 0
        LayerName = Foreground4
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Total Horas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4234
        mmLeft = 173832
        mmTop = 16933
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground4
      end
      object ppLine12: TppLine
        UserName = 'Line12'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 20373
        mmWidth = 196321
        BandType = 0
        LayerName = Foreground4
      end
      object lblPeriodoModelo4: TppLabel
        UserName = 'lblPeriodoModelo4'
        AutoSize = False
        Caption = 'lblPeriodoModelo4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 4233
        mmLeft = 48683
        mmTop = 6350
        mmWidth = 105834
        BandType = 0
        LayerName = Foreground4
      end
      object ppSystemVariable12: TppSystemVariable
        UserName = 'SystemVariable12'
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
        LayerName = Foreground4
      end
    end
    object ppDetailBand5: TppDetailBand
      BeforePrint = ppDetailBand5BeforePrint
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4498
      mmPrintPosition = 0
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'Tip_Codigo'
        DataPipeline = dbRelChamadoModelo4
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo4'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 0
        mmWidth = 10319
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText27: TppDBText
        UserName = 'DBText27'
        DataField = 'Tip_Nome'
        DataPipeline = dbRelChamadoModelo4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo4'
        mmHeight = 4498
        mmLeft = 11642
        mmTop = 0
        mmWidth = 122502
        BandType = 4
        LayerName = Foreground4
      end
      object ppDBText28: TppDBText
        UserName = 'DBText28'
        DataField = 'QtdeChamados'
        DataPipeline = dbRelChamadoModelo4
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo4'
        mmHeight = 4498
        mmLeft = 143669
        mmTop = 0
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground4
      end
      object txtQtdeHorasModelo4: TppDBText
        UserName = 'txtQtdeHorasModelo4'
        DataField = 'TotalHoras'
        DataPipeline = dbRelChamadoModelo4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelChamadoModelo4'
        mmHeight = 4498
        mmLeft = 135732
        mmTop = 0
        mmWidth = 7673
        BandType = 4
        LayerName = Foreground4
      end
      object lblTotalHorasModelo4: TppLabel
        UserName = 'lblTotalHorasModelo4'
        AutoSize = False
        Caption = 'lblTotalHorasModelo4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 173832
        mmTop = 0
        mmWidth = 20373
        BandType = 4
        LayerName = Foreground4
      end
    end
    object ppSummaryBand5: TppSummaryBand
      BeforePrint = ppSummaryBand5BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLabel39: TppLabel
        UserName = 'Label39'
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
        LayerName = Foreground4
      end
      object ppDBCalc12: TppDBCalc
        UserName = 'DBCalc12'
        DataField = 'Rev_Codigo'
        DataPipeline = dbRelChamadoModelo4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRelChamadoModelo4'
        mmHeight = 4498
        mmLeft = 30163
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground4
      end
      object sumTotalHorasModelo41: TppDBCalc
        UserName = 'sumTotalHorasModelo41'
        DataField = 'QtdeChamados'
        DataPipeline = dbRelChamadoModelo4
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRelChamadoModelo4'
        mmHeight = 4498
        mmLeft = 143669
        mmTop = 1852
        mmWidth = 24077
        BandType = 7
        LayerName = Foreground4
      end
      object lblTotalHorasGeralModelo4: TppLabel
        UserName = 'lblTotalHorasGeralModelo4'
        AutoSize = False
        Caption = 'lblTotalHorasGeralModelo4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 173832
        mmTop = 1852
        mmWidth = 20373
        BandType = 7
        LayerName = Foreground4
      end
      object sumTotalHorasModelo4: TppDBCalc
        UserName = 'sumTotalHorasModelo4'
        DataField = 'TotalHoras'
        DataPipeline = dbRelChamadoModelo4
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRelChamadoModelo4'
        mmHeight = 4498
        mmLeft = 113242
        mmTop = 1852
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground4
      end
    end
    object ppGroup4: TppGroup
      BreakName = 'Rev_Codigo'
      DataPipeline = dbRelChamadoModelo4
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group4'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRelChamadoModelo4'
      NewFile = False
      object ppGroupHeaderBand4: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel36: TppLabel
          UserName = 'Label36'
          Caption = 'Revenda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1588
          mmWidth = 14817
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBText24: TppDBText
          UserName = 'DBText24'
          DataField = 'Rev_Codigo'
          DataPipeline = dbRelChamadoModelo4
          DisplayFormat = '0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo4'
          mmHeight = 4498
          mmLeft = 17198
          mmTop = 1588
          mmWidth = 9790
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBText25: TppDBText
          UserName = 'DBText25'
          DataField = 'Rev_Nome'
          DataPipeline = dbRelChamadoModelo4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo4'
          mmHeight = 4498
          mmLeft = 27781
          mmTop = 1588
          mmWidth = 129911
          BandType = 3
          GroupNo = 0
          LayerName = Foreground4
        end
      end
      object ppGroupFooterBand4: TppGroupFooterBand
        BeforePrint = ppGroupFooterBand4BeforePrint
        Background.Brush.Style = bsClear
        HideWhenOneDetail = False
        mmBottomOffset = 0
        mmHeight = 7673
        mmPrintPosition = 0
        object ppLabel38: TppLabel
          UserName = 'Label38'
          Caption = 'Total Revenda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 1852
          mmWidth = 25929
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'Rev_Codigo'
          DataPipeline = dbRelChamadoModelo4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRelChamadoModelo4'
          mmHeight = 4498
          mmLeft = 35190
          mmTop = 1852
          mmWidth = 12171
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object ppLine13: TppLine
          UserName = 'Line13'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1588
          mmLeft = 0
          mmTop = 6085
          mmWidth = 196321
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object sumSubTotalHorasModelo41: TppDBCalc
          UserName = 'sumSubTotalHorasModelo41'
          DataField = 'QtdeChamados'
          DataPipeline = dbRelChamadoModelo4
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRelChamadoModelo4'
          mmHeight = 4498
          mmLeft = 143669
          mmTop = 1588
          mmWidth = 24077
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object lblSubTotalHorasModelo4: TppLabel
          UserName = 'lblSubTotalHorasModelo4'
          AutoSize = False
          Caption = 'lblSubTotalHorasModelo4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 173832
          mmTop = 1588
          mmWidth = 20373
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
        object sumSubTotalHorasModelo4: TppDBCalc
          UserName = 'sumSubTotalHorasModelo4'
          DataField = 'TotalHoras'
          DataPipeline = dbRelChamadoModelo4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup4
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRelChamadoModelo4'
          mmHeight = 4498
          mmLeft = 113242
          mmTop = 1588
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground4
        end
      end
    end
    object ppDesignLayers5: TppDesignLayers
      object ppDesignLayer5: TppDesignLayer
        UserName = 'Foreground4'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object CDSRelChamadoModelo3A: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 216
    object CDSRelChamadoModelo3AUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
    end
    object CDSRelChamadoModelo3AQtdeChamados: TIntegerField
      FieldName = 'QtdeChamados'
    end
    object CDSRelChamadoModelo3ATotalHoras: TFloatField
      FieldName = 'TotalHoras'
    end
    object CDSRelChamadoModelo3AUsu_Nome: TStringField
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSRelChamadoModelo3ATotalHorasDetalhes: TFloatField
      FieldName = 'TotalHorasDetalhes'
    end
  end
end
