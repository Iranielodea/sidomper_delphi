object DMChamado: TDMChamado
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 408
  Width = 574
  object CDSConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoCons'
    Left = 40
    Top = 24
    object CDSConsultaCha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSConsultaCha_DataAbertura: TDateField
      DisplayLabel = 'Data Abertura'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSConsultaCha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSConsultaCha_Descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Cha_Descricao'
      Required = True
      Size = 1000
    end
    object CDSConsultaCli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaTip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSConsultaSta_Nome: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object CDSConsultaCha_Nivel: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSConsultaUsu_nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio Abertura'
      FieldName = 'Usu_nome'
      Required = True
      Size = 100
    end
    object CDSConsultaCli_Fantasia: TWideStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'Cli_Fantasia'
      Size = 100
    end
    object CDSConsultaCha_Status: TIntegerField
      FieldName = 'Cha_Status'
      Required = True
    end
  end
  object CDSCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoCad'
    BeforePost = CDSCadastroBeforePost
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    Left = 128
    Top = 24
    object CDSCadastroCha_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Cha_Id'
      Origin = 'Cha_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object CDSCadastroCha_DataAbertura: TDateField
      FieldName = 'Cha_DataAbertura'
      Origin = 'Cha_DataAbertura'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = CDSCadastroCha_DataAberturaSetText
      EditMask = '##/##/####'
    end
    object CDSCadastroCha_HoraAbertura: TTimeField
      FieldName = 'Cha_HoraAbertura'
      Origin = 'Cha_HoraAbertura'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = CDSCadastroCha_HoraAberturaSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCadastroCha_Cliente: TIntegerField
      FieldName = 'Cha_Cliente'
      Origin = 'Cha_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroCha_UsuarioAbertura: TIntegerField
      FieldName = 'Cha_UsuarioAbertura'
      Origin = 'Cha_UsuarioAbertura'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroCha_Contato: TStringField
      FieldName = 'Cha_Contato'
      Origin = 'Cha_Contato'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CDSCadastroCha_Nivel: TIntegerField
      FieldName = 'Cha_Nivel'
      Origin = 'Cha_Nivel'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroCha_Tipo: TIntegerField
      FieldName = 'Cha_Tipo'
      Origin = 'Cha_Tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroCha_Status: TIntegerField
      FieldName = 'Cha_Status'
      Origin = 'Cha_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroCha_Descricao: TStringField
      FieldName = 'Cha_Descricao'
      Origin = 'Cha_Descricao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1000
    end
    object CDSCadastroCha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCadastroCha_TipoMovimento: TIntegerField
      FieldName = 'Cha_TipoMovimento'
    end
    object CDSCadastroUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroCli_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      ProviderFlags = []
      Required = True
      DisplayFormat = '000000'
    end
    object CDSCadastroCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object CDSCadastroTip_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Required = True
      Size = 50
    end
    object CDSCadastroSta_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = []
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = []
      Required = True
      Size = 50
    end
    object CDSCadastroCha_Modulo: TIntegerField
      FieldName = 'Cha_Modulo'
      Origin = 'Cha_Modulo'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCadastroCha_Produto: TIntegerField
      FieldName = 'Cha_Produto'
      Origin = 'Cha_Produto'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCadastroCha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
      Origin = 'Cha_UsuarioAtendeAtual'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCadastroMod_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Mod_Codigo'
      Origin = 'Mod_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSCadastroProd_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSCadastroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object CDSCadastroCha_Origem: TIntegerField
      FieldName = 'Cha_Origem'
    end
  end
  object dbConsulta: TppDBPipeline
    DataSource = DSConsulta
    UserName = 'dbConsulta'
    Left = 392
    Top = 24
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
    Left = 464
    Top = 24
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
        Font.Name = 'Courier New'
        Font.Size = 16
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
    Left = 312
    Top = 24
  end
  object CDSChamadoOcorrenciaCons: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoOcorrenciaCons'
    BeforePost = CDSChamadoOcorrenciaConsBeforePost
    OnNewRecord = CDSChamadoOcorrenciaConsNewRecord
    OnReconcileError = CDSChamadoOcorrenciaConsReconcileError
    Left = 208
    Top = 24
    object CDSChamadoOcorrenciaConsChOco_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'ChOco_Id'
      Origin = 'ChOco_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object CDSChamadoOcorrenciaConsChOco_Chamado: TIntegerField
      FieldName = 'ChOco_Chamado'
      Origin = 'ChOco_Chamado'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSChamadoOcorrenciaConsChOco_Docto: TStringField
      FieldName = 'ChOco_Docto'
      Origin = 'ChOco_Docto'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object CDSChamadoOcorrenciaConsChOco_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'ChOco_Data'
      Origin = 'ChOco_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = CDSChamadoOcorrenciaConsChOco_DataSetText
      EditMask = '##/##/####'
    end
    object CDSChamadoOcorrenciaConsChOco_HoraInicio: TTimeField
      DisplayLabel = 'Hora Inicial'
      FieldName = 'ChOco_HoraInicio'
      Origin = 'ChOco_HoraInicio'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = CDSChamadoOcorrenciaConsChOco_HoraInicioSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSChamadoOcorrenciaConsChOco_HoraFim: TTimeField
      DisplayLabel = 'Hora Inicial'
      FieldName = 'ChOco_HoraFim'
      Origin = 'ChOco_HoraFim'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = CDSChamadoOcorrenciaConsChOco_HoraFimSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSChamadoOcorrenciaConsChOco_Usuario: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'ChOco_Usuario'
      Origin = 'ChOco_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSChamadoOcorrenciaConsChOco_UsuarioColab1: TIntegerField
      FieldName = 'ChOco_UsuarioColab1'
      Origin = 'ChOco_UsuarioColab1'
      ProviderFlags = [pfInUpdate]
    end
    object CDSChamadoOcorrenciaConsChOco_UsuarioColab2: TIntegerField
      FieldName = 'ChOco_UsuarioColab2'
      Origin = 'ChOco_UsuarioColab2'
      ProviderFlags = [pfInUpdate]
    end
    object CDSChamadoOcorrenciaConsChOco_UsuarioColab3: TIntegerField
      FieldName = 'ChOco_UsuarioColab3'
      Origin = 'ChOco_UsuarioColab3'
      ProviderFlags = [pfInUpdate]
    end
    object CDSChamadoOcorrenciaConsChOco_DescricaoTecnica: TStringField
      FieldName = 'ChOco_DescricaoTecnica'
      Origin = 'ChOco_DescricaoTecnica'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object CDSChamadoOcorrenciaConsChOco_DescricaoSolucao: TStringField
      FieldName = 'ChOco_DescricaoSolucao'
      Origin = 'ChOco_DescricaoSolucao'
      ProviderFlags = [pfInUpdate]
      Size = 2000
    end
    object CDSChamadoOcorrenciaConsChOco_Anexo: TStringField
      FieldName = 'ChOco_Anexo'
      Origin = 'ChOco_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object CDSChamadoOcorrenciaConsChOco_TotalHoras: TFloatField
      FieldName = 'ChOco_TotalHoras'
      Origin = 'ChOco_TotalHoras'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSChamadoOcorrenciaConsChOco_Versao: TStringField
      FieldName = 'ChOco_Versao'
      Size = 25
    end
    object CDSChamadoOcorrenciaConsUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSChamadoOcorrenciaConsUsu_Codigo1: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo1'
      Origin = 'Usu_Codigo1'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSChamadoOcorrenciaConsUsu_Codigo2: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo2'
      Origin = 'Usu_Codigo2'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSChamadoOcorrenciaConsUsu_Codigo3: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo3'
      Origin = 'Usu_Codigo3'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSChamadoOcorrenciaConsUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object CDSChamadoOcorrenciaConsUsu_Nome1: TWideStringField
      FieldName = 'Usu_Nome1'
      Size = 100
    end
    object CDSChamadoOcorrenciaConsUsu_Nome2: TWideStringField
      FieldName = 'Usu_Nome2'
      Size = 100
    end
    object CDSChamadoOcorrenciaConsUsu_Nome3: TWideStringField
      FieldName = 'Usu_Nome3'
      Size = 100
    end
  end
  object CDSChamadoStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoStatus'
    Left = 40
    Top = 72
    object CDSChamadoStatusChSta_Id: TAutoIncField
      FieldName = 'ChSta_Id'
      Origin = 'ChSta_Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CDSChamadoStatusChSta_Chamado: TIntegerField
      FieldName = 'ChSta_Chamado'
      Origin = 'ChSta_Chamado'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSChamadoStatusChSta_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'ChSta_Data'
      Origin = 'ChSta_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSChamadoStatusChSta_Status: TIntegerField
      FieldName = 'ChSta_Status'
      Origin = 'ChSta_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSChamadoStatusChSta_Usuario: TIntegerField
      FieldName = 'ChSta_Usuario'
      Origin = 'ChSta_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSChamadoStatusSta_Nome: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = []
      Size = 50
    end
    object CDSChamadoStatusSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = []
    end
    object CDSChamadoStatusUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object CDSChamadoStatusUsu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object CDSChamadoStatusChSta_Hora: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'ChSta_Hora'
      DisplayFormat = 'hh:mm'
    end
  end
  object CDSChamadoQuadro1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoQuadro1'
    OnCalcFields = CDSChamadoQuadro1CalcFields
    Left = 40
    Top = 128
    object CDSChamadoQuadro1Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      Origin = 'Cha_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSChamadoQuadro1Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Origin = 'Cha_DataAbertura'
      Required = True
    end
    object CDSChamadoQuadro1Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Origin = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSChamadoQuadro1Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSChamadoQuadro1Cha_Nivel: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Cha_Nivel'
      Origin = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSChamadoQuadro1Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSChamadoQuadro1CTempo: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSChamadoQuadro1Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSChamadoQuadro1Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSChamadoQuadro1Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSChamadoQuadro1Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSChamadoQuadro1Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSChamadoQuadro1cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSChamadoQuadro1CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSChamadoQuadro1CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSChamadoQuadro1UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSChamadoQuadro1Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSChamadoQuadro1UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSChamadoQuadro2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoQuadro2'
    OnCalcFields = CDSChamadoQuadro2CalcFields
    Left = 128
    Top = 128
    object CDSChamadoQuadro2Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSChamadoQuadro2Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSChamadoQuadro2Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSChamadoQuadro2Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSChamadoQuadro2Cha_Nivel: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSChamadoQuadro2Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSChamadoQuadro2CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSChamadoQuadro2Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSChamadoQuadro2Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSChamadoQuadro2Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSChamadoQuadro2Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSChamadoQuadro2Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSChamadoQuadro2cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSChamadoQuadro2CTempoPar10: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSChamadoQuadro2CTempoParOutro: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSChamadoQuadro2UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSChamadoQuadro2Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSChamadoQuadro2UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSChamadoQuadro3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoQuadro3'
    OnCalcFields = CDSChamadoQuadro3CalcFields
    Left = 208
    Top = 128
    object CDSChamadoQuadro3Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSChamadoQuadro3Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSChamadoQuadro3Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSChamadoQuadro3Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSChamadoQuadro3Cha_Nivel: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSChamadoQuadro3Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSChamadoQuadro3CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSChamadoQuadro3Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSChamadoQuadro3Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSChamadoQuadro3Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSChamadoQuadro3Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSChamadoQuadro3Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSChamadoQuadro3cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSChamadoQuadro3CTempoPar10: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSChamadoQuadro3CTempoParOutro: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSChamadoQuadro3UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSChamadoQuadro3Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSChamadoQuadro3UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSChamadoQuadro4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoQuadro4'
    OnCalcFields = CDSChamadoQuadro4CalcFields
    Left = 288
    Top = 128
    object CDSChamadoQuadro4Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSChamadoQuadro4Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSChamadoQuadro4Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSChamadoQuadro4Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSChamadoQuadro4Cha_Nivel: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSChamadoQuadro4Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSChamadoQuadro4CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSChamadoQuadro4Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSChamadoQuadro4Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSChamadoQuadro4Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSChamadoQuadro4Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSChamadoQuadro4Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSChamadoQuadro4cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSChamadoQuadro4CTempoPar10: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSChamadoQuadro4CTempoParOutro: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSChamadoQuadro4UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSChamadoQuadro4Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSChamadoQuadro4UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSChamadoQuadro5: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoQuadro5'
    OnCalcFields = CDSChamadoQuadro5CalcFields
    Left = 368
    Top = 128
    object CDSChamadoQuadro5Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSChamadoQuadro5Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSChamadoQuadro5Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSChamadoQuadro5Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSChamadoQuadro5Cha_Nivel: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSChamadoQuadro5Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSChamadoQuadro5CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSChamadoQuadro5Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSChamadoQuadro5Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSChamadoQuadro5Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSChamadoQuadro5Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSChamadoQuadro5Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSChamadoQuadro5cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSChamadoQuadro5CTempoPar10: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSChamadoQuadro5CTempoParOutro: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSChamadoQuadro5UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSChamadoQuadro5Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSChamadoQuadro5UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSChamadoQuadro6: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoQuadro6'
    OnCalcFields = CDSChamadoQuadro6CalcFields
    Left = 448
    Top = 128
    object CDSChamadoQuadro6Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSChamadoQuadro6Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSChamadoQuadro6Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSChamadoQuadro6Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSChamadoQuadro6Cha_Nivel: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSChamadoQuadro6Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSChamadoQuadro6CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSChamadoQuadro6Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSChamadoQuadro6Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSChamadoQuadro6Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSChamadoQuadro6Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSChamadoQuadro6Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSChamadoQuadro6cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSChamadoQuadro6CTempoPar10: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSChamadoQuadro6CTempoParOutro: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSChamadoQuadro6UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSChamadoQuadro6Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSChamadoQuadro6UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSListarProblemaSolucao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoProblemaSolucao'
    Left = 128
    Top = 72
    object CDSListarProblemaSolucaoChOco_Chamado: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'ChOco_Chamado'
      Origin = 'ChOco_Chamado'
      Required = True
      DisplayFormat = '000000'
    end
    object CDSListarProblemaSolucaoChOco_Data: TDateField
      FieldName = 'ChOco_Data'
      Origin = 'ChOco_Data'
      Required = True
    end
    object CDSListarProblemaSolucaoChOco_HoraInicio: TTimeField
      DisplayLabel = 'Hora In'#237'cio'
      FieldName = 'ChOco_HoraInicio'
      Origin = 'ChOco_HoraInicio'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSListarProblemaSolucaoChOco_HoraFim: TTimeField
      DisplayLabel = 'Hora Fim'
      FieldName = 'ChOco_HoraFim'
      Origin = 'ChOco_HoraFim'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSListarProblemaSolucaoChOco_DescricaoSolucao: TStringField
      DisplayLabel = 'Descri'#231#227'o da Solu'#231#227'o'
      FieldName = 'ChOco_DescricaoSolucao'
      Origin = 'ChOco_DescricaoSolucao'
      Size = 2000
    end
    object CDSListarProblemaSolucaoChOco_DescricaoTecnica: TStringField
      DisplayLabel = 'Descri'#231#227'o do Problema'
      FieldName = 'ChOco_DescricaoTecnica'
      Origin = 'ChOco_DescricaoTecnica'
      Size = 1000
    end
    object CDSListarProblemaSolucaoCTempo: TStringField
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSListarProblemaSolucaoUsu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Required = True
      Size = 100
    end
  end
  object CDSAtividadeQuadro1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtividadeQuadro1'
    OnCalcFields = CDSAtividadeQuadro1CalcFields
    Left = 40
    Top = 192
    object CDSAtividadeQuadro1Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object CDSAtividadeQuadro1Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSAtividadeQuadro1Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividadeQuadro1Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSAtividadeQuadro1Cha_Nivel: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSAtividadeQuadro1Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSAtividadeQuadro1Cha_UsuarioAtendeAtual: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividadeQuadro1Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro1Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro1Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSAtividadeQuadro1Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividadeQuadro1cha_HoraAtendeAtual: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'cha_HoraAtendeAtual'
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividadeQuadro1CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividadeQuadro1CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividadeQuadro1CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividadeQuadro1UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSAtividadeQuadro1Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro1UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSAtividadeQuadro2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtividadeQuadro2'
    OnCalcFields = CDSAtividadeQuadro2CalcFields
    Left = 128
    Top = 192
    object CDSAtividadeQuadro2Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object CDSAtividadeQuadro2Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSAtividadeQuadro2Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividadeQuadro2Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSAtividadeQuadro2Cha_Nivel: TStringField
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSAtividadeQuadro2Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSAtividadeQuadro2Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividadeQuadro2Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro2Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro2Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSAtividadeQuadro2Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividadeQuadro2cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSAtividadeQuadro2CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividadeQuadro2CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividadeQuadro2CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividadeQuadro2UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSAtividadeQuadro2UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
    object CDSAtividadeQuadro2Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
  end
  object CDSAtividadeQuadro3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtividadeQuadro3'
    OnCalcFields = CDSAtividadeQuadro3CalcFields
    Left = 208
    Top = 192
    object CDSAtividadeQuadro3Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object CDSAtividadeQuadro3Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSAtividadeQuadro3Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividadeQuadro3Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSAtividadeQuadro3Cha_Nivel: TStringField
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSAtividadeQuadro3Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSAtividadeQuadro3Cha_UsuarioAtendeAtual: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividadeQuadro3Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro3Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro3Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSAtividadeQuadro3Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividadeQuadro3cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSAtividadeQuadro3CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividadeQuadro3CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividadeQuadro3CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividadeQuadro3UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSAtividadeQuadro3Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro3UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSAtividadeQuadro4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtividadeQuadro4'
    OnCalcFields = CDSAtividadeQuadro4CalcFields
    Left = 288
    Top = 192
    object CDSAtividadeQuadro4Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object CDSAtividadeQuadro4Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSAtividadeQuadro4Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividadeQuadro4Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSAtividadeQuadro4Cha_Nivel: TStringField
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSAtividadeQuadro4Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSAtividadeQuadro4Cha_UsuarioAtendeAtual: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividadeQuadro4Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro4Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro4Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSAtividadeQuadro4Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividadeQuadro4cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSAtividadeQuadro4CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividadeQuadro4CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividadeQuadro4CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividadeQuadro4UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSAtividadeQuadro4Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro4UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSAtividadeQuadro5: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtividadeQuadro5'
    OnCalcFields = CDSAtividadeQuadro5CalcFields
    Left = 368
    Top = 192
    object CDSAtividadeQuadro5Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object CDSAtividadeQuadro5Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSAtividadeQuadro5Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividadeQuadro5Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSAtividadeQuadro5Cha_Nivel: TStringField
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSAtividadeQuadro5Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSAtividadeQuadro5Cha_UsuarioAtendeAtual: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividadeQuadro5Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro5Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro5Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSAtividadeQuadro5Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividadeQuadro5cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSAtividadeQuadro5CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividadeQuadro5CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividadeQuadro5CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividadeQuadro5UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSAtividadeQuadro5Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro5UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSAtividadeQuadro6: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAtividadeQuadro6'
    OnCalcFields = CDSAtividadeQuadro6CalcFields
    Left = 448
    Top = 192
    object CDSAtividadeQuadro6Cha_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '00000'
    end
    object CDSAtividadeQuadro6Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSAtividadeQuadro6Cha_HoraAbertura: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividadeQuadro6Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSAtividadeQuadro6Cha_Nivel: TStringField
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSAtividadeQuadro6Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      Required = True
    end
    object CDSAtividadeQuadro6Cha_UsuarioAtendeAtual: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividadeQuadro6Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro6Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro6Tip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSAtividadeQuadro6Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividadeQuadro6cha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
    end
    object CDSAtividadeQuadro6CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividadeQuadro6CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividadeQuadro6CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividadeQuadro6UltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSAtividadeQuadro6Par_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Required = True
    end
    object CDSAtividadeQuadro6UltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
  end
  object CDSChamadoOcorrColaborador: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDCHAMADO'
        ParamType = ptInput
      end>
    ProviderName = 'dspChamado_Ocorr_Colaborador'
    BeforePost = CDSChamadoOcorrColaboradorBeforePost
    OnReconcileError = CDSChamadoOcorrColaboradorReconcileError
    Left = 208
    Top = 72
    object CDSChamadoOcorrColaboradorChaOCol_Id: TAutoIncField
      FieldName = 'ChaOCol_Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CDSChamadoOcorrColaboradorChaOCol_ChamadoOcorrencia: TIntegerField
      FieldName = 'ChaOCol_ChamadoOcorrencia'
      Required = True
    end
    object CDSChamadoOcorrColaboradorChaOCol_Usuario: TIntegerField
      FieldName = 'ChaOCol_Usuario'
      Required = True
    end
    object CDSChamadoOcorrColaboradorChaOcol_HoraInicio: TTimeField
      DisplayLabel = 'Hora In'#237'cio'
      FieldName = 'ChaOcol_HoraInicio'
      Required = True
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSChamadoOcorrColaboradorChaOCol_HoraFim: TTimeField
      DisplayLabel = 'Hora Fim'
      FieldName = 'ChaOCol_HoraFim'
      Required = True
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSChamadoOcorrColaboradorUsu_Nome: TWideStringField
      DisplayLabel = 'Colaborador'
      FieldName = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSChamadoOcorrColaboradorUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      ProviderFlags = []
    end
    object CDSChamadoOcorrColaboradorChaOcol_TotalHoras: TFloatField
      FieldName = 'ChaOcol_TotalHoras'
    end
  end
  object CDSChamadoAnexo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoAnexo'
    Left = 40
    Top = 248
    object CDSChamadoAnexoCha_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Cha_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSChamadoAnexoCha_DataAbertura: TDateField
      FieldName = 'Cha_DataAbertura'
      Required = True
    end
    object CDSChamadoAnexoCha_HoraAbertura: TTimeField
      Alignment = taCenter
      FieldName = 'Cha_HoraAbertura'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSChamadoAnexoCha_Contato: TStringField
      FieldName = 'Cha_Contato'
      Size = 100
    end
    object CDSChamadoAnexoCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSChamadoAnexoChOco_Docto: TStringField
      FieldName = 'ChOco_Docto'
      Size = 25
    end
    object CDSChamadoAnexoChOco_Data: TDateField
      FieldName = 'ChOco_Data'
      Required = True
    end
    object CDSChamadoAnexoChOco_Anexo: TStringField
      FieldName = 'ChOco_Anexo'
      Size = 1000
    end
  end
  object CDSQuadro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspChamadoQuadro'
    OnCalcFields = CDSQuadroCalcFields
    Left = 40
    Top = 304
    object CDSQuadroQuadro: TStringField
      FieldName = 'Quadro'
      ReadOnly = True
      Required = True
      Size = 2
    end
    object CDSQuadroCha_Id: TIntegerField
      FieldName = 'Cha_Id'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroCha_DataAbertura: TDateField
      FieldName = 'Cha_DataAbertura'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroCha_HoraAbertura: TTimeField
      FieldName = 'Cha_HoraAbertura'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object CDSQuadroCha_Nivel: TStringField
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSQuadroNivel: TIntegerField
      FieldName = 'Nivel'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroCha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
      ReadOnly = True
    end
    object CDSQuadroSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object CDSQuadroUltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
    object CDSQuadrocha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
      ReadOnly = True
    end
    object CDSQuadroUltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSQuadroPar_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      ReadOnly = True
      Size = 100
    end
    object CDSQuadroCTempo: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSQuadroCTempoPar10: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSQuadroCTempoParOutro: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSQuadroCli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
      ReadOnly = True
    end
  end
  object CDSQuadro1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSQuadro1CalcFields
    Left = 104
    Top = 304
    object CDSQuadro1Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSQuadro1Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
      EditMask = '##/##/####'
    end
    object CDSQuadro1Cha_horaAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_horaAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSQuadro1Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSQuadro1Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSQuadro1Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSQuadro1Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSQuadro1CTempo: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSQuadro1CTempoParOutro: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSQuadro1CTempoPar10: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSQuadro1Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSQuadro1Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSQuadro1UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSQuadro1Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSQuadro1Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSQuadro1UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSQuadro1Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSQuadro2: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSQuadro2CalcFields
    Left = 168
    Top = 304
    object CDSQuadro2Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSQuadro2Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSQuadro2Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_horaAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSQuadro2Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSQuadro2Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSQuadro2Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSQuadro2Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSQuadro2CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSQuadro2CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSQuadro2CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSQuadro2Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSQuadro2Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSQuadro2UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSQuadro2Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSQuadro2Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSQuadro2UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSQuadro2Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSQuadro3: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSQuadro3CalcFields
    Left = 232
    Top = 304
    object CDSQuadro3Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSQuadro3Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSQuadro3Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_horaAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSQuadro3Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSQuadro3Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSQuadro3Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSQuadro3Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSQuadro3CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSQuadro3CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSQuadro3CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSQuadro3Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSQuadro3Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSQuadro3UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSQuadro3Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSQuadro3Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSQuadro3UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSQuadro3Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSQuadro4: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSQuadro4CalcFields
    Left = 288
    Top = 304
    object CDSQuadro4Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSQuadro4Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSQuadro4Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_horaAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSQuadro4Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSQuadro4Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSQuadro4Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSQuadro4Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSQuadro4CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSQuadro4CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSQuadro4CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSQuadro4Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSQuadro4Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSQuadro4UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSQuadro4Cha_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSQuadro4Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSQuadro4UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSQuadro4Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSQuadro5: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSQuadro5CalcFields
    Left = 344
    Top = 304
    object CDSQuadro5Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSQuadro5Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSQuadro5Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_horaAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSQuadro5Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSQuadro5Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSQuadro5Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSQuadro5Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSQuadro5CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSQuadro5CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSQuadro5CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSQuadro5Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSQuadro5Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSQuadro5UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSQuadro5Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSQuadro5Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSQuadro5UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSQuadro5Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSQuadro6: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSQuadro6CalcFields
    Left = 400
    Top = 304
    object CDSQuadro6Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSQuadro6Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSQuadro6Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_horaAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSQuadro6Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSQuadro6Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSQuadro6Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSQuadro6Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSQuadro6CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSQuadro6CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSQuadro6CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSQuadro6Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSQuadro6Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSQuadro6UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSQuadro6Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSQuadro6Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSQuadro6UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSQuadro6Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSAtividade: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'IndexPerfil'
        Fields = 'Cli_Perfil'
        Options = [ixDescending]
      end>
    Params = <>
    ProviderName = 'dspAtividadeQuadro'
    StoreDefs = True
    Left = 40
    Top = 352
    object CDSAtividadeQuadro: TStringField
      FieldName = 'Quadro'
      ReadOnly = True
      Required = True
      Size = 2
    end
    object CDSAtividadeCha_Id: TIntegerField
      FieldName = 'Cha_Id'
      ReadOnly = True
      Required = True
    end
    object CDSAtividadeCha_DataAbertura: TDateField
      FieldName = 'Cha_DataAbertura'
      ReadOnly = True
      Required = True
    end
    object CDSAtividadeCha_HoraAbertura: TTimeField
      FieldName = 'Cha_HoraAbertura'
      ReadOnly = True
      Required = True
    end
    object CDSAtividadeCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object CDSAtividadeCha_Nivel: TStringField
      FieldName = 'Cha_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSAtividadeNivel: TIntegerField
      FieldName = 'Nivel'
      ReadOnly = True
      Required = True
    end
    object CDSAtividadeCha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
      ReadOnly = True
    end
    object CDSAtividadeSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      ReadOnly = True
      Required = True
    end
    object CDSAtividadeCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      ReadOnly = True
      Required = True
    end
    object CDSAtividadeTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      ReadOnly = True
      Required = True
      Size = 50
    end
    object CDSAtividadeUltimaHora: TTimeField
      FieldName = 'UltimaHora'
      ReadOnly = True
    end
    object CDSAtividadecha_HoraAtendeAtual: TTimeField
      FieldName = 'cha_HoraAtendeAtual'
      ReadOnly = True
    end
    object CDSAtividadeUltimaData: TDateField
      FieldName = 'UltimaData'
      ReadOnly = True
    end
    object CDSAtividadePar_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      ReadOnly = True
      Required = True
    end
    object CDSAtividadeUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      ReadOnly = True
      Size = 100
    end
    object CDSAtividadeCli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSAtividade1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSAtividade1CalcFields
    Left = 104
    Top = 352
    object CDSAtividade1Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSAtividade1Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSAtividade1Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividade1Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSAtividade1Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSAtividade1Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSAtividade1Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividade1CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividade1CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividade1CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividade1Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividade1Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSAtividade1Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSAtividade1Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSAtividade1UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSAtividade1UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSAtividade1Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSAtividade2: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSAtividade2CalcFields
    Left = 168
    Top = 352
    object CDSAtividade2Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSAtividade2Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSAtividade2Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividade2Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSAtividade2Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSAtividade2Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSAtividade2Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividade2CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividade2CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividade2CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividade2Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividade2Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSAtividade2Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSAtividade2Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSAtividade2UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSAtividade2UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSAtividade2Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSAtividade3: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSAtividade3CalcFields
    Left = 232
    Top = 352
    object CDSAtividade3Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSAtividade3Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSAtividade3Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividade3Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSAtividade3Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSAtividade3Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSAtividade3Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividade3CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividade3CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividade3CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividade3Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividade3Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSAtividade3UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSAtividade3Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSAtividade3Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSAtividade3UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSAtividade3Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSAtividade4: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSAtividade4CalcFields
    Left = 288
    Top = 352
    object CDSAtividade4Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSAtividade4Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSAtividade4Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividade4Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSAtividade4Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSAtividade4Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSAtividade4Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividade4CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividade4CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividade4CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividade4Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividade4Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSAtividade4Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSAtividade4Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSAtividade4UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSAtividade4UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSAtividade4Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSAtividade5: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSAtividade5CalcFields
    Left = 344
    Top = 352
    object CDSAtividade5Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSAtividade5Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSAtividade5Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividade5Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSAtividade5Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSAtividade5Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSAtividade5Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividade5CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividade5CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividade5CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividade5Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividade5Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSAtividade5Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSAtividade5Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSAtividade5UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSAtividade5UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSAtividade5Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object CDSAtividade6: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSAtividade6CalcFields
    Left = 400
    Top = 352
    object CDSAtividade6Cha_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Cha_Id'
      DisplayFormat = '000000'
    end
    object CDSAtividade6Cha_DataAbertura: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Cha_DataAbertura'
    end
    object CDSAtividade6Cha_HoraAbertura: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Cha_HoraAbertura'
      DisplayFormat = 'hh:mm'
    end
    object CDSAtividade6Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSAtividade6Nivel: TStringField
      Alignment = taCenter
      FieldName = 'Nivel'
      Size = 25
    end
    object CDSAtividade6Tip_Nome: TStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSAtividade6Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSAtividade6CTempo: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSAtividade6CTempoParOutro: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoParOutro'
      Size = 10
    end
    object CDSAtividade6CTempoPar10: TStringField
      Alignment = taCenter
      DisplayLabel = 'Tempo'
      FieldKind = fkInternalCalc
      FieldName = 'CTempoPar10'
      Size = 10
    end
    object CDSAtividade6Cha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
    end
    object CDSAtividade6Cha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
    end
    object CDSAtividade6Sta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSAtividade6Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSAtividade6UltimaData: TDateField
      FieldName = 'UltimaData'
    end
    object CDSAtividade6UltimaHora: TTimeField
      FieldName = 'UltimaHora'
    end
    object CDSAtividade6Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
end
