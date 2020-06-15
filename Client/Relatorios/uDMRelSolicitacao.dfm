object DMRelSolicitacao: TDMRelSolicitacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 286
  Width = 667
  object CDSRelatorio1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoRelatorio1'
    RemoteServer = DM.DSPConexao
    OnCalcFields = CDSRelatorio1CalcFields
    Left = 32
    Top = 16
    object CDSRelatorio1Sol_Id: TAutoIncField
      FieldName = 'Sol_Id'
      Origin = 'Sol_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object CDSRelatorio1Ver_Id: TAutoIncField
      FieldName = 'Ver_Id'
      Origin = 'Ver_Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object CDSRelatorio1Ver_Versao: TStringField
      FieldName = 'Ver_Versao'
      Origin = 'Ver_Versao'
      Size = 25
    end
    object CDSRelatorio1Sol_Data: TDateField
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      Required = True
    end
    object CDSRelatorio1Sol_Hora: TTimeField
      FieldName = 'Sol_Hora'
      Origin = 'Sol_Hora'
      Required = True
    end
    object CDSRelatorio1Sol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
      Origin = 'Sol_Tipo'
    end
    object CDSRelatorio1Sol_Nivel: TIntegerField
      FieldName = 'Sol_Nivel'
      Origin = 'Sol_Nivel'
    end
    object CDSRelatorio1Cli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSRelatorio1Cli_Fantasia: TWideStringField
      FieldName = 'Cli_Fantasia'
      Origin = 'Cli_Fantasia'
      Size = 100
    end
    object CDSRelatorio1Tip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Size = 50
    end
    object CDSRelatorio1Sta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object CDSRelatorio1Mod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      Size = 100
    end
    object CDSRelatorio1Prod_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      Size = 100
    end
    object CDSRelatorio1Sol_TempoPrevisto: TBCDField
      FieldName = 'Sol_TempoPrevisto'
      Origin = 'Sol_TempoPrevisto'
      Precision = 5
      Size = 2
    end
    object CDSRelatorio1Sol_PrevisaoEntrega: TDateField
      FieldName = 'Sol_PrevisaoEntrega'
      Origin = 'Sol_PrevisaoEntrega'
    end
    object CDSRelatorio1TotalTempo: TFloatField
      FieldName = 'TotalTempo'
      Origin = 'TotalTempo'
      ReadOnly = True
    end
    object CDSRelatorio1Analista: TWideStringField
      FieldName = 'Analista'
      Origin = 'Analista'
      Size = 100
    end
    object CDSRelatorio1Desenvolvedor: TWideStringField
      FieldName = 'Desenvolvedor'
      Origin = 'Desenvolvedor'
      ReadOnly = True
      Size = 100
    end
    object CDSRelatorio1QSolicitacaoTempo1: TDataSetField
      FieldName = 'QSolicitacaoTempo1'
    end
    object CDSRelatorio1Sol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSRelatorio1sTotalHoras: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'sTotalHoras'
    end
  end
  object CDSTempo1: TClientDataSet
    Aggregates = <>
    DataSetField = CDSRelatorio1QSolicitacaoTempo1
    Params = <>
    RemoteServer = DM.DSPConexao
    OnCalcFields = CDSTempo1CalcFields
    Left = 96
    Top = 64
    object CDSTempo1Usu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object CDSTempo1STemp_HoraFim: TTimeField
      FieldName = 'STemp_HoraFim'
      Origin = 'STemp_HoraFim'
    end
    object CDSTempo1STemp_HoraInicio: TTimeField
      FieldName = 'STemp_HoraInicio'
      Origin = 'STemp_HoraInicio'
      Required = True
    end
    object CDSTempo1STemp_TotalHoras: TFloatField
      FieldName = 'STemp_TotalHoras'
      Origin = 'STemp_TotalHoras'
    end
    object CDSTempo1TotalHoras: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'TotalHoras'
    end
  end
  object dbRelatorio1: TppDBPipeline
    DataSource = dsRelatorio1
    UserName = 'dbRelatorio1'
    Left = 264
    Top = 136
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
      FieldAlias = 'QSolicitacaoTempo1'
      FieldName = 'QSolicitacaoTempo1'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField20: TppField
      FieldAlias = 'Sol_Titulo'
      FieldName = 'Sol_Titulo'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object dbRelatorio1ppField21: TppField
      FieldAlias = 'sTotalHoras'
      FieldName = 'sTotalHoras'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
  end
  object dsRelatorio1: TDataSource
    DataSet = CDSRelatorio1
    Left = 96
    Top = 16
  end
  object dbTempo1: TppDBPipeline
    DataSource = dsTempo1
    UserName = 'dbTempo1'
    Left = 336
    Top = 136
    MasterDataPipelineName = 'dbRelatorio1'
  end
  object dsTempo1: TDataSource
    DataSet = CDSTempo1
    Left = 160
    Top = 64
  end
  object Rep01: TppReport
    AutoStop = False
    DataPipeline = dbRelatorio1
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
    Left = 408
    Top = 136
    Version = '15.03'
    mmColumnWidth = 0
    DataPipelineName = 'dbRelatorio1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Relat'#243'rio Anal'#237'tico - Solicita'#231#245'es '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6085
        mmLeft = 73290
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
        mmLeft = 246857
        mmTop = 0
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        Position = lpBottom
        Weight = 0.750000000000000000
        mmHeight = 2117
        mmLeft = 0
        mmTop = 25664
        mmWidth = 282046
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
        mmTop = 17463
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'T'#237'tulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23813
        mmTop = 16933
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Cliente'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 72231
        mmTop = 17463
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 135996
        mmTop = 17463
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'M'#243'dulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 167482
        mmTop = 17463
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Analista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 203465
        mmTop = 16933
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Tempo Prev.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 234157
        mmTop = 17463
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Tempo Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 260086
        mmTop = 16140
        mmWidth = 20373
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Hora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 21960
        mmWidth = 7408
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'N'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 23813
        mmTop = 21960
        mmWidth = 9260
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Fantasia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 72231
        mmTop = 21960
        mmWidth = 14817
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Status'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 135996
        mmTop = 21960
        mmWidth = 11113
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Produto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 167482
        mmTop = 21960
        mmWidth = 12965
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Desenvolvedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 203465
        mmTop = 21960
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Prev. Entrega'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 234157
        mmTop = 21960
        mmWidth = 24077
        BandType = 0
        LayerName = Foreground
      end
      object lblPeriodoRelatorio1: TppLabel
        UserName = 'lblPeriodoRelatorio1'
        AutoSize = False
        Caption = 'lblPeriodoRelatorio1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 73290
        mmTop = 7938
        mmWidth = 133086
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 19050
      mmPrintPosition = 0
      object ppDBText3: TppDBText
        UserName = 'DBText3'
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
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'Sol_Hora'
        DataPipeline = dbRelatorio1
        DisplayFormat = 'h:nn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 0
        mmTop = 5027
        mmWidth = 14817
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
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
        mmLeft = 23813
        mmTop = 5027
        mmWidth = 9260
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
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
        mmLeft = 72231
        mmTop = 0
        mmWidth = 58738
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
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
        mmLeft = 72231
        mmTop = 5027
        mmWidth = 58738
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'Tip_Nome'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 135996
        mmTop = 0
        mmWidth = 29104
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
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
        mmLeft = 135996
        mmTop = 5027
        mmWidth = 29104
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
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
        mmLeft = 167482
        mmTop = 0
        mmWidth = 34396
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
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
        mmLeft = 167482
        mmTop = 5027
        mmWidth = 34396
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
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
        mmLeft = 203465
        mmTop = 0
        mmWidth = 28575
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
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
        mmLeft = 203465
        mmTop = 5027
        mmWidth = 28575
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'Sol_TempoPrevisto'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 234157
        mmTop = 0
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText15: TppDBText
        UserName = 'DBText15'
        DataField = 'Sol_PrevisaoEntrega'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 234157
        mmTop = 5027
        mmWidth = 24077
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText16: TppDBText
        UserName = 'DBText16'
        DataField = 'sTotalHoras'
        DataPipeline = dbRelatorio1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'dbRelatorio1'
        mmHeight = 4498
        mmLeft = 263261
        mmTop = 0
        mmWidth = 17198
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText17: TppDBText
        UserName = 'DBText17'
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
        mmLeft = 23813
        mmTop = 0
        mmWidth = 46302
        BandType = 4
        LayerName = Foreground
      end
      object subRelTempo1: TppSubReport
        UserName = 'subRelTempo1'
        ExpandAll = False
        NewPrintJob = False
        OutlineSettings.CreateNode = True
        TraverseAllData = False
        DataPipelineName = 'dbTempo1'
        mmHeight = 5027
        mmLeft = 0
        mmTop = 13229
        mmWidth = 284300
        BandType = 4
        LayerName = Foreground
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        object ppChildReport1: TppChildReport
          AutoStop = False
          DataPipeline = dbTempo1
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
          DataPipelineName = 'dbTempo1'
          object ppTitleBand1: TppTitleBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 6615
            mmPrintPosition = 0
            object ppLabel18: TppLabel
              UserName = 'Label18'
              Caption = 'Tempo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 266171
              mmTop = 0
              mmWidth = 9260
              BandType = 1
              LayerName = Foreground1
            end
            object ppLine2: TppLine
              UserName = 'Line2'
              Weight = 0.750000000000000000
              mmHeight = 2381
              mmLeft = 192088
              mmTop = 4233
              mmWidth = 83344
              BandType = 1
              LayerName = Foreground1
            end
            object ppLabel19: TppLabel
              UserName = 'Label19'
              Caption = 'Usu'#225'rio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              mmHeight = 3969
              mmLeft = 192088
              mmTop = 0
              mmWidth = 12964
              BandType = 1
              LayerName = Foreground1
            end
          end
          object ppDetailBand2: TppDetailBand
            Background1.Brush.Style = bsClear
            Background2.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 7144
            mmPrintPosition = 0
            object ppDBText18: TppDBText
              UserName = 'DBText18'
              DataField = 'TotalHoras'
              DataPipeline = dbTempo1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbTempo1'
              mmHeight = 4498
              mmLeft = 258234
              mmTop = 0
              mmWidth = 17198
              BandType = 4
              LayerName = Foreground1
            end
            object ppDBText19: TppDBText
              UserName = 'DBText19'
              DataField = 'Usu_Nome'
              DataPipeline = dbTempo1
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Name = 'Courier New'
              Font.Size = 9
              Font.Style = []
              Transparent = True
              DataPipelineName = 'dbTempo1'
              mmHeight = 4498
              mmLeft = 192088
              mmTop = 0
              mmWidth = 59796
              BandType = 4
              LayerName = Foreground1
            end
          end
          object ppSummaryBand2: TppSummaryBand
            Background.Brush.Style = bsClear
            mmBottomOffset = 0
            mmHeight = 0
            mmPrintPosition = 0
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
    end
    object ppSummaryBand1: TppSummaryBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
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
        mmHeight = 9260
        mmPrintPosition = 0
        object ppLabel12: TppLabel
          UserName = 'Label12'
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
        object ppDBText1: TppDBText
          UserName = 'DBText1'
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
          mmLeft = 15875
          mmTop = 2381
          mmWidth = 17198
          BandType = 3
          GroupNo = 0
          LayerName = Foreground
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
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
          mmLeft = 35983
          mmTop = 2381
          mmWidth = 56356
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
  object master: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoRelatorio1'
    RemoteServer = DM.DSPConexao
    OnCalcFields = masterCalcFields
    Left = 128
    Top = 136
    object masterSol_Id: TAutoIncField
      FieldName = 'Sol_Id'
      Origin = 'Sol_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object masterVer_Id: TAutoIncField
      FieldName = 'Ver_Id'
      Origin = 'Ver_Id'
      ProviderFlags = [pfInWhere]
      ReadOnly = True
    end
    object masterVer_Versao: TStringField
      FieldName = 'Ver_Versao'
      Origin = 'Ver_Versao'
      Size = 25
    end
    object masterSol_Data: TDateField
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      Required = True
    end
    object masterSol_Hora: TTimeField
      FieldName = 'Sol_Hora'
      Origin = 'Sol_Hora'
      Required = True
    end
    object masterSol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
      Origin = 'Sol_Tipo'
    end
    object masterSol_Nivel: TIntegerField
      FieldName = 'Sol_Nivel'
      Origin = 'Sol_Nivel'
    end
    object masterCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object masterCli_Fantasia: TWideStringField
      FieldName = 'Cli_Fantasia'
      Origin = 'Cli_Fantasia'
      Size = 100
    end
    object masterTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Size = 50
    end
    object masterSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object masterMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      Size = 100
    end
    object masterProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      Size = 100
    end
    object masterSol_TempoPrevisto: TBCDField
      FieldName = 'Sol_TempoPrevisto'
      Origin = 'Sol_TempoPrevisto'
      Precision = 5
      Size = 2
    end
    object masterSol_PrevisaoEntrega: TDateField
      FieldName = 'Sol_PrevisaoEntrega'
      Origin = 'Sol_PrevisaoEntrega'
    end
    object masterTotalTempo: TFloatField
      FieldName = 'TotalTempo'
      Origin = 'TotalTempo'
      ReadOnly = True
    end
    object masterAnalista: TWideStringField
      FieldName = 'Analista'
      Origin = 'Analista'
      Size = 100
    end
    object masterDesenvolvedor: TWideStringField
      FieldName = 'Desenvolvedor'
      Origin = 'Desenvolvedor'
      ReadOnly = True
      Size = 100
    end
    object masterSol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object masterQSolicitacaoRelTempo1: TDataSetField
      FieldName = 'QSolicitacaoRelTempo1'
    end
    object mastersTotalHoras: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'sTotalHoras'
      Size = 10
    end
  end
  object dsMaster: TDataSource
    DataSet = master
    Left = 184
    Top = 136
  end
  object detalhe: TClientDataSet
    Aggregates = <>
    DataSetField = masterQSolicitacaoRelTempo1
    MasterSource = dsMaster
    PacketRecords = 0
    Params = <>
    OnCalcFields = detalheCalcFields
    Left = 128
    Top = 192
    object detalheUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object detalheSTemp_HoraFim: TTimeField
      FieldName = 'STemp_HoraFim'
      Origin = 'STemp_HoraFim'
    end
    object detalheSTemp_HoraInicio: TTimeField
      FieldName = 'STemp_HoraInicio'
      Origin = 'STemp_HoraInicio'
      Required = True
    end
    object detalheSTemp_TotalHoras: TFloatField
      FieldName = 'STemp_TotalHoras'
      Origin = 'STemp_TotalHoras'
    end
    object detalheTotalHoras: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'TotalHoras'
      Size = 10
    end
  end
  object dsDetalhe: TDataSource
    DataSet = detalhe
    Left = 184
    Top = 192
  end
end
