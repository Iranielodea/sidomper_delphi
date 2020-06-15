object DMRelUsuario: TDMRelUsuario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 191
  Width = 348
  object CDSRendimento: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarioRenda'
    Left = 32
    Top = 16
    object CDSRendimentoTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Required = True
      Size = 4
    end
    object CDSRendimentoUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      ReadOnly = True
      Required = True
    end
    object CDSRendimentoUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object CDSRendimentoRev_Codigo: TIntegerField
      FieldName = 'Rev_Codigo'
      ReadOnly = True
    end
    object CDSRendimentoRev_Nome: TWideStringField
      FieldName = 'Rev_Nome'
      ReadOnly = True
      Size = 100
    end
    object CDSRendimentoQtde: TIntegerField
      FieldName = 'Qtde'
      ReadOnly = True
    end
    object CDSRendimentoHoras: TFloatField
      FieldName = 'Horas'
      ReadOnly = True
    end
    object CDSRendimentoValor: TCurrencyField
      FieldName = 'Valor'
      ReadOnly = True
    end
    object CDSRendimentoDep_Codigo: TIntegerField
      FieldName = 'Dep_Codigo'
      ReadOnly = True
      Required = True
    end
    object CDSRendimentoDep_Nome: TWideStringField
      FieldName = 'Dep_Nome'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object CDSRendimentoUsu_Id: TIntegerField
      FieldName = 'Usu_Id'
      ReadOnly = True
      Required = True
    end
  end
  object CDSRelRendimento: TClientDataSet
    Aggregates = <>
    Params = <>
    OnCalcFields = CDSRelRendimentoCalcFields
    Left = 32
    Top = 64
    object CDSRelRendimentoRev_Codigo: TIntegerField
      FieldName = 'Rev_Codigo'
    end
    object CDSRelRendimentoRev_Nome: TStringField
      FieldName = 'Rev_Nome'
      Size = 50
    end
    object CDSRelRendimentoUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
    end
    object CDSRelRendimentoUsu_Nome: TStringField
      FieldName = 'Usu_Nome'
      Size = 50
    end
    object CDSRelRendimentoCha_Qtde: TFloatField
      FieldName = 'Cha_Qtde'
    end
    object CDSRelRendimentoCha_Horas: TFloatField
      FieldName = 'Cha_Horas'
    end
    object CDSRelRendimentoAti_Qtde: TFloatField
      FieldName = 'Ati_Qtde'
    end
    object CDSRelRendimentoAti_Horas: TFloatField
      FieldName = 'Ati_Horas'
    end
    object CDSRelRendimentoVis_Qtde: TFloatField
      FieldName = 'Vis_Qtde'
    end
    object CDSRelRendimentoVis_Horas: TFloatField
      FieldName = 'Vis_Horas'
    end
    object CDSRelRendimentoVis_Valor: TFloatField
      FieldName = 'Vis_Valor'
    end
    object CDSRelRendimentoSol_Horas: TFloatField
      FieldName = 'Sol_Horas'
    end
    object CDSRelRendimentoTotalHoras: TFloatField
      FieldName = 'TotalHoras'
    end
    object CDSRelRendimentoDias: TIntegerField
      FieldName = 'Dias'
    end
    object CDSRelRendimentoMedia: TFloatField
      FieldName = 'Media'
    end
    object CDSRelRendimentoCha_HorasStr: TStringField
      FieldName = 'Cha_HorasStr'
    end
    object CDSRelRendimentoAti_HorasStr: TStringField
      FieldName = 'Ati_HorasStr'
    end
    object CDSRelRendimentoVis_HorasStr: TStringField
      FieldName = 'Vis_HorasStr'
    end
    object CDSRelRendimentoSol_HorasStr: TStringField
      FieldName = 'Sol_HorasStr'
    end
    object CDSRelRendimentoTotalHorasStr: TStringField
      FieldName = 'TotalHorasStr'
    end
    object CDSRelRendimentoMeiaHorasStr: TStringField
      FieldName = 'MeiaHorasStr'
    end
    object CDSRelRendimentoDep_Codigo: TIntegerField
      FieldName = 'Dep_Codigo'
    end
    object CDSRelRendimentoDep_Nome: TStringField
      FieldName = 'Dep_Nome'
      Size = 50
    end
    object CDSRelRendimentoUsu_Id: TIntegerField
      FieldName = 'Usu_Id'
    end
    object CDSRelRendimentoDiasUteis: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'DiasUteis'
    end
    object CDSRelRendimentoMediaHorasDiasUteis: TStringField
      FieldName = 'MediaHorasDiasUteis'
      Size = 10
    end
  end
  object dsRendimento: TDataSource
    DataSet = CDSRelRendimento
    Left = 120
    Top = 64
  end
  object RelRendimento: TppReport
    AutoStop = False
    DataPipeline = dbRendimento
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
    Top = 64
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRendimento'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 26194
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
        LayerName = Foreground
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
        mmLeft = 256117
        mmTop = 1852
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object plbl1: TppLabel
        UserName = 'plbl1'
        Caption = 'Usu'#225'rios - Rendimento por Usu'#225'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 92869
        mmTop = 0
        mmWidth = 88636
        BandType = 0
        LayerName = Foreground
      end
      object lblPeriodo01: TppLabel
        UserName = 'lblPeriodo01'
        AutoSize = False
        Caption = 'lblPeriodo01'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 92869
        mmTop = 6350
        mmWidth = 92869
        BandType = 0
        LayerName = Foreground
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
        LayerName = Foreground
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Usu'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 19315
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Chamados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 79865
        mmTop = 13494
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 73515
        mmTop = 19315
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Horas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 91771
        mmTop = 19315
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 73515
        mmTop = 18256
        mmWidth = 27517
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Atividades'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 108175
        mmTop = 13494
        mmWidth = 18521
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 106588
        mmTop = 19315
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Horas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 122198
        mmTop = 19315
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 106588
        mmTop = 18256
        mmWidth = 24871
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Visitas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 147598
        mmTop = 13494
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Qtde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 135692
        mmTop = 19315
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Horas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 151302
        mmTop = 19315
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 135692
        mmTop = 18256
        mmWidth = 43921
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 170352
        mmTop = 19315
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Solicita'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 181994
        mmTop = 13494
        mmWidth = 22225
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Horas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 190196
        mmTop = 19315
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 181994
        mmTop = 18256
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 227767
        mmTop = 13494
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 209511
        mmTop = 19315
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Horas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 227767
        mmTop = 19315
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLine5: TppLine
        UserName = 'Line5'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1058
        mmLeft = 209511
        mmTop = 18256
        mmWidth = 45508
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'M'#233'dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 245759
        mmTop = 19315
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLine7: TppLine
        UserName = 'Line7'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 0
        mmTop = 24606
        mmWidth = 283898
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 262467
        mmTop = 13494
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = #218'teis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 270934
        mmTop = 13494
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLine9: TppLine
        UserName = 'Line9'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 1588
        mmLeft = 259819
        mmTop = 17726
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Dias'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 261144
        mmTop = 19315
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'M'#233'dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 272786
        mmTop = 19315
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      BeforePrint = ppDetailBand1BeforePrint
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 4763
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'Usu_Codigo'
        DataPipeline = dbRendimento
        DisplayFormat = '0000'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 265
        mmWidth = 12965
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'Usu_Nome'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 13758
        mmTop = 265
        mmWidth = 49213
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'Cha_Qtde'
        DataPipeline = dbRendimento
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 69546
        mmTop = 265
        mmWidth = 11377
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'Cha_HorasStr'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 83834
        mmTop = 265
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'Ati_Qtde'
        DataPipeline = dbRendimento
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 102619
        mmTop = 265
        mmWidth = 11377
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'Ati_HorasStr'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 115319
        mmTop = 265
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'Vis_Qtde'
        DataPipeline = dbRendimento
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 131723
        mmTop = 265
        mmWidth = 11377
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'Vis_HorasStr'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 144423
        mmTop = 265
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'Vis_Valor'
        DataPipeline = dbRendimento
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 163473
        mmTop = 265
        mmWidth = 16140
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'Sol_HorasStr'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 181994
        mmTop = 0
        mmWidth = 17463
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'Dias'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 204748
        mmTop = 0
        mmWidth = 12171
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'TotalHorasStr'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 219565
        mmTop = 0
        mmWidth = 17463
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'MeiaHorasStr'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 237557
        mmTop = 0
        mmWidth = 17463
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText18: TppDBText
        UserName = 'DBText18'
        DataField = 'DiasUteis'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 259821
        mmTop = 0
        mmWidth = 8731
        BandType = 4
        LayerName = Foreground
      end
      object lblMediaHoraUtil: TppLabel
        UserName = 'lblMediaHoraUtil'
        Caption = 'lblMediaHoraUtil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3968
        mmLeft = 270934
        mmTop = 265
        mmWidth = 11113
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppSummaryBand1: TppSummaryBand
      BeforePrint = ppSummaryBand1BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 21167
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 0
        mmTop = 2117
        mmWidth = 22225
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        DataField = 'Cha_Qtde'
        DataPipeline = dbRendimento
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 63725
        mmTop = 2117
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        DataField = 'Ati_Qtde'
        DataPipeline = dbRendimento
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 102619
        mmTop = 2117
        mmWidth = 11377
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc3: TppDBCalc
        UserName = 'DBCalc3'
        DataField = 'Vis_Qtde'
        DataPipeline = dbRendimento
        DisplayFormat = ',##0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 131723
        mmTop = 2117
        mmWidth = 11377
        BandType = 7
        LayerName = Foreground
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        DataField = 'Vis_Valor'
        DataPipeline = dbRendimento
        DisplayFormat = ',#0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 163473
        mmTop = 2117
        mmWidth = 16140
        BandType = 7
        LayerName = Foreground
      end
      object CalcMedia: TppDBCalc
        UserName = 'CalcMedia'
        DataField = 'Usu_Codigo'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 34396
        mmTop = 2117
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object lblChaHora: TppLabel
        UserName = 'lblChaHora'
        AutoSize = False
        Caption = 'lblChaHora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 86215
        mmTop = 2117
        mmWidth = 14817
        BandType = 7
        LayerName = Foreground
      end
      object lblAtiHora: TppLabel
        UserName = 'lblAtiHora'
        AutoSize = False
        Caption = 'lblAtiHora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 115319
        mmTop = 2117
        mmWidth = 16140
        BandType = 7
        LayerName = Foreground
      end
      object lblVisHora: TppLabel
        UserName = 'lblVisHora'
        AutoSize = False
        Caption = 'lblVisHora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 147598
        mmTop = 2117
        mmWidth = 12965
        BandType = 7
        LayerName = Foreground
      end
      object lblSolHora: TppLabel
        UserName = 'lblSolHora'
        AutoSize = False
        Caption = 'lblSolHora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 181994
        mmTop = 2117
        mmWidth = 17463
        BandType = 7
        LayerName = Foreground
      end
      object lblTotalHora: TppLabel
        UserName = 'lblTotalHora'
        AutoSize = False
        Caption = 'lblTotalHora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 221682
        mmTop = 2117
        mmWidth = 15346
        BandType = 7
        LayerName = Foreground
      end
      object CalChaHora: TppDBCalc
        UserName = 'CalChaHora'
        DataField = 'Cha_Horas'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 83834
        mmTop = 12700
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object CalcAtiHora: TppDBCalc
        UserName = 'CalcAtiHora'
        DataField = 'Ati_Horas'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 114261
        mmTop = 12700
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object CalcVisHora: TppDBCalc
        UserName = 'CalcVisHora'
        DataField = 'Vis_Horas'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 144423
        mmTop = 12700
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object CalcSolHora: TppDBCalc
        UserName = 'CalcSolHora'
        DataField = 'Sol_Horas'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 181994
        mmTop = 12700
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object CalcTotalHora: TppDBCalc
        UserName = 'CalcTotalHora'
        DataField = 'TotalHoras'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 219830
        mmTop = 12700
        mmWidth = 30427
        BandType = 7
        LayerName = Foreground
      end
      object lblMedia: TppLabel
        UserName = 'lblMedia'
        AutoSize = False
        Caption = 'lblMedia2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 238880
        mmTop = 2117
        mmWidth = 16140
        BandType = 7
        LayerName = Foreground
      end
      object sumTotalDias: TppDBCalc
        UserName = 'sumTotalDias'
        DataField = 'Dias'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DBCalcType = dcAverage
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 203161
        mmTop = 2117
        mmWidth = 17198
        BandType = 7
        LayerName = Foreground
      end
      object CalcMediaHoraUtil2: TppDBCalc
        UserName = 'CalcMediaHoraUtil2'
        DataField = 'TotalHoras'
        DataPipeline = dbRendimento
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        Visible = False
        DataPipelineName = 'dbRendimento'
        mmHeight = 4498
        mmLeft = 256117
        mmTop = 11113
        mmWidth = 8467
        BandType = 7
        LayerName = Foreground
      end
      object lblMediaUtil2: TppLabel
        UserName = 'lblMediaUtil2'
        AutoSize = False
        Caption = 'lblSubMediaUtil2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 261144
        mmTop = 2117
        mmWidth = 20902
        BandType = 7
        LayerName = Foreground
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'Rev_Codigo'
      DataPipeline = dbRendimento
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRendimento'
      NewFile = False
      object ppGroupHeaderBand2: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 6085
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText1'
          DataField = 'Rev_Codigo'
          DataPipeline = dbRendimento
          DisplayFormat = '0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 15610
          mmTop = 794
          mmWidth = 10319
          BandType = 3
          GroupNo = 1
          LayerName = Foreground
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'Rev_Nome'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 27779
          mmTop = 794
          mmWidth = 104775
          BandType = 3
          GroupNo = 1
          LayerName = Foreground
        end
        object ppLabel21: TppLabel
          UserName = 'Label21'
          Caption = 'Revenda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 794
          mmWidth = 14817
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
        mmHeight = 7938
        mmPrintPosition = 0
        object ppLine8: TppLine
          UserName = 'Line8'
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1323
          mmLeft = 0
          mmTop = 6615
          mmWidth = 283898
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object plbl3: TppLabel
          UserName = 'plbl3'
          Caption = 'Total da Rev.:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2117
          mmWidth = 25929
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object CalcMedia1: TppDBCalc
          UserName = 'CalcMedia1'
          DataField = 'Usu_Codigo'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 29104
          mmTop = 2117
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object ppDBCalc8: TppDBCalc
          UserName = 'DBCalc8'
          DataField = 'Cha_Qtde'
          DataPipeline = dbRendimento
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 63725
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object ppDBCalc9: TppDBCalc
          UserName = 'DBCalc9'
          DataField = 'Ati_Qtde'
          DataPipeline = dbRendimento
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 102619
          mmTop = 2117
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object ppDBCalc10: TppDBCalc
          UserName = 'DBCalc10'
          DataField = 'Vis_Qtde'
          DataPipeline = dbRendimento
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 131723
          mmTop = 2117
          mmWidth = 11377
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object ppDBCalc11: TppDBCalc
          UserName = 'DBCalc11'
          DataField = 'Vis_Valor'
          DataPipeline = dbRendimento
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 163473
          mmTop = 2117
          mmWidth = 16140
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object lblChaHora1: TppLabel
          UserName = 'lblChaHora1'
          AutoSize = False
          Caption = 'lblChaHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 86215
          mmTop = 2117
          mmWidth = 14817
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object lblAtiHora1: TppLabel
          UserName = 'lblAtiHora1'
          AutoSize = False
          Caption = 'lblAtiHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 115319
          mmTop = 2117
          mmWidth = 16140
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object lblVisHora1: TppLabel
          UserName = 'lblVisHora1'
          AutoSize = False
          Caption = 'lblVisHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 147598
          mmTop = 2117
          mmWidth = 12965
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object lblSolHora1: TppLabel
          UserName = 'lblSolHora1'
          AutoSize = False
          Caption = 'lblSolHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 181994
          mmTop = 2117
          mmWidth = 17463
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object lblTotalHora1: TppLabel
          UserName = 'lblTotalHora1'
          AutoSize = False
          Caption = 'lblTotalHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 221682
          mmTop = 2117
          mmWidth = 15346
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object CalChaHora1: TppDBCalc
          UserName = 'DBCalc21'
          DataField = 'Cha_Horas'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 41804
          mmTop = 2117
          mmWidth = 5027
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object CalcAtiHora1: TppDBCalc
          UserName = 'CalcAtiHora1'
          DataField = 'Ati_Horas'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 41804
          mmTop = 2117
          mmWidth = 6615
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object CalcVisHora1: TppDBCalc
          UserName = 'DBCalc16'
          DataField = 'Vis_Horas'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 42863
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object CalcSolHora1: TppDBCalc
          UserName = 'DBCalc17'
          DataField = 'Sol_Horas'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 42863
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object CalcTotalHora1: TppDBCalc
          UserName = 'DBCalc18'
          DataField = 'TotalHoras'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 49477
          mmTop = 2381
          mmWidth = 5292
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object lblMedia1: TppLabel
          UserName = 'lblMedia1'
          AutoSize = False
          Caption = 'lblMedia2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 238880
          mmTop = 2117
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object sumTotalDias1: TppDBCalc
          UserName = 'sumTotalDias1'
          DataField = 'Dias'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DBCalcType = dcAverage
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 201838
          mmTop = 2381
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object lblSubMediaUtil2: TppLabel
          UserName = 'lblSubMediaUtil2'
          AutoSize = False
          Caption = 'lblSubMediaUtil2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 270934
          mmTop = 2117
          mmWidth = 11113
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object CalcSubMediaHoraUtil2: TppDBCalc
          UserName = 'CalcSubMediaHoraUtil2'
          DataField = 'TotalHoras'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup2
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 260086
          mmTop = 1852
          mmWidth = 8467
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'Dep_Codigo'
      DataPipeline = dbRendimento
      GroupFileSettings.NewFile = False
      GroupFileSettings.EmailFile = False
      OutlineSettings.CreateNode = True
      StartOnOddPage = False
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'dbRendimento'
      NewFile = False
      object ppGroupHeaderBand1: TppGroupHeaderBand
        Background.Brush.Style = bsClear
        mmBottomOffset = 0
        mmHeight = 7408
        mmPrintPosition = 0
        object plbl2: TppLabel
          UserName = 'plbl2'
          Caption = 'Departamento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 16404
          mmTop = 1323
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText16: TppDBText
          UserName = 'DBText16'
          DataField = 'Dep_Codigo'
          DataPipeline = dbRendimento
          DisplayFormat = '0000'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 41804
          mmTop = 1323
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText17: TppDBText
          UserName = 'DBText17'
          DataField = 'Dep_Nome'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 55561
          mmTop = 1323
          mmWidth = 102923
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
        mmHeight = 8731
        mmPrintPosition = 0
        object ppLine6: TppLine
          UserName = 'Line6'
          Pen.Style = psDot
          Position = lpBottom
          Weight = 0.750000000000000000
          mmHeight = 1852
          mmLeft = 0
          mmTop = 6879
          mmWidth = 283898
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object plbl4: TppLabel
          UserName = 'plbl4'
          Caption = 'Total do Depto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 2117
          mmWidth = 27781
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object CalcMedia2: TppDBCalc
          UserName = 'CalcMedia2'
          DataField = 'Usu_Codigo'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DBCalcType = dcCount
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 29104
          mmTop = 2117
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc12: TppDBCalc
          UserName = 'DBCalc12'
          DataField = 'Cha_Qtde'
          DataPipeline = dbRendimento
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 63725
          mmTop = 2117
          mmWidth = 17198
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc13: TppDBCalc
          UserName = 'DBCalc13'
          DataField = 'Ati_Qtde'
          DataPipeline = dbRendimento
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 102619
          mmTop = 2117
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc14: TppDBCalc
          UserName = 'DBCalc14'
          DataField = 'Vis_Qtde'
          DataPipeline = dbRendimento
          DisplayFormat = ',##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 131723
          mmTop = 2117
          mmWidth = 11377
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBCalc15: TppDBCalc
          UserName = 'DBCalc15'
          DataField = 'Vis_Valor'
          DataPipeline = dbRendimento
          DisplayFormat = ',#0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 163473
          mmTop = 2117
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object lblChaHora2: TppLabel
          UserName = 'lblChaHora2'
          AutoSize = False
          Caption = 'lblChaHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 86215
          mmTop = 2117
          mmWidth = 14817
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object lblAtiHora2: TppLabel
          UserName = 'lblAtiHora2'
          AutoSize = False
          Caption = 'lblAtiHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 115319
          mmTop = 2117
          mmWidth = 16140
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object lblVisHora2: TppLabel
          UserName = 'lblVisHora2'
          AutoSize = False
          Caption = 'lblVisHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 147598
          mmTop = 2117
          mmWidth = 12965
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object lblSolHora2: TppLabel
          UserName = 'lblSolHora2'
          AutoSize = False
          Caption = 'lblSolHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 181994
          mmTop = 2117
          mmWidth = 17463
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object lblTotalHora2: TppLabel
          UserName = 'lblTotalHora2'
          AutoSize = False
          Caption = 'lblTotalHora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 221682
          mmTop = 2117
          mmWidth = 15346
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object CalChaHora2: TppDBCalc
          UserName = 'CalChaHora1'
          DataField = 'Cha_Horas'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 44715
          mmTop = 2117
          mmWidth = 5027
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object CalcAtiHora2: TppDBCalc
          UserName = 'CalChaHora2'
          DataField = 'Ati_Horas'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 46038
          mmTop = 2117
          mmWidth = 6615
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object CalcVisHora2: TppDBCalc
          UserName = 'CalcVisHora1'
          DataField = 'Vis_Horas'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 48154
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object CalcSolHora2: TppDBCalc
          UserName = 'CalcSolHora1'
          DataField = 'Sol_Horas'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 49477
          mmTop = 3175
          mmWidth = 5556
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object CalcTotalHora2: TppDBCalc
          UserName = 'CalcTotalHora1'
          DataField = 'TotalHoras'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 56886
          mmTop = 2117
          mmWidth = 5292
          BandType = 5
          GroupNo = 0
          LayerName = Foreground
        end
        object lblMedia2: TppLabel
          UserName = 'lblMedia2'
          AutoSize = False
          Caption = 'lblMedia2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 238880
          mmTop = 2117
          mmWidth = 16140
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object sumTotalDias2: TppDBCalc
          UserName = 'sumTotalDias2'
          DataField = 'Dias'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DBCalcType = dcAverage
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 201838
          mmTop = 2117
          mmWidth = 5556
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object lblSubMediaUtil: TppLabel
          UserName = 'lblSubMediaUtil'
          AutoSize = False
          Caption = 'lblSubMediaUtil'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 270934
          mmTop = 2117
          mmWidth = 11113
          BandType = 5
          GroupNo = 1
          LayerName = Foreground
        end
        object CalcSubMediaHoraUtil: TppDBCalc
          UserName = 'CalcSubMediaHoraUtil'
          DataField = 'TotalHoras'
          DataPipeline = dbRendimento
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Courier New'
          Font.Size = 9
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          Visible = False
          DataPipelineName = 'dbRendimento'
          mmHeight = 4498
          mmLeft = 259821
          mmTop = 2117
          mmWidth = 8731
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
  object dbRendimento: TppDBPipeline
    DataSource = dsRendimento
    UserName = 'dbRendimento'
    Left = 192
    Top = 64
    object dbRendimentoppField1: TppField
      FieldAlias = 'Rev_Codigo'
      FieldName = 'Rev_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField2: TppField
      FieldAlias = 'Rev_Nome'
      FieldName = 'Rev_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField3: TppField
      FieldAlias = 'Usu_Codigo'
      FieldName = 'Usu_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField4: TppField
      FieldAlias = 'Usu_Nome'
      FieldName = 'Usu_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField5: TppField
      FieldAlias = 'Cha_Qtde'
      FieldName = 'Cha_Qtde'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField6: TppField
      FieldAlias = 'Cha_Horas'
      FieldName = 'Cha_Horas'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField7: TppField
      FieldAlias = 'Ati_Qtde'
      FieldName = 'Ati_Qtde'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField8: TppField
      FieldAlias = 'Ati_Horas'
      FieldName = 'Ati_Horas'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField9: TppField
      FieldAlias = 'Vis_Qtde'
      FieldName = 'Vis_Qtde'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField10: TppField
      FieldAlias = 'Vis_Horas'
      FieldName = 'Vis_Horas'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField11: TppField
      FieldAlias = 'Vis_Valor'
      FieldName = 'Vis_Valor'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField12: TppField
      FieldAlias = 'Sol_Horas'
      FieldName = 'Sol_Horas'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField13: TppField
      FieldAlias = 'TotalHoras'
      FieldName = 'TotalHoras'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField14: TppField
      FieldAlias = 'Dias'
      FieldName = 'Dias'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField15: TppField
      FieldAlias = 'Media'
      FieldName = 'Media'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField16: TppField
      FieldAlias = 'Cha_HorasStr'
      FieldName = 'Cha_HorasStr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField17: TppField
      FieldAlias = 'Ati_HorasStr'
      FieldName = 'Ati_HorasStr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField18: TppField
      FieldAlias = 'Vis_HorasStr'
      FieldName = 'Vis_HorasStr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField19: TppField
      FieldAlias = 'Sol_HorasStr'
      FieldName = 'Sol_HorasStr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField20: TppField
      FieldAlias = 'TotalHorasStr'
      FieldName = 'TotalHorasStr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField21: TppField
      FieldAlias = 'MeiaHorasStr'
      FieldName = 'MeiaHorasStr'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField22: TppField
      FieldAlias = 'Dep_Codigo'
      FieldName = 'Dep_Codigo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField23: TppField
      FieldAlias = 'Dep_Nome'
      FieldName = 'Dep_Nome'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField24: TppField
      FieldAlias = 'Usu_Id'
      FieldName = 'Usu_Id'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object dbRendimentoppField25: TppField
      FieldAlias = 'DiasUteis'
      FieldName = 'DiasUteis'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
  end
end