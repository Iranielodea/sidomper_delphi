inherited DMUsuario: TDMUsuario
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 315
  Width = 452
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspUsuarioCons'
    OnCalcFields = CDSConsultaCalcFields
    object CDSConsultaUsu_id: TAutoIncField
      FieldName = 'Usu_id'
      Origin = 'Usu_id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      Visible = False
    end
    object CDSConsultaUsu_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSConsultaUsu_Nome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaUsu_Ativo: TBooleanField
      FieldName = 'Usu_Ativo'
      Origin = 'Usu_Ativo'
      Required = True
    end
    object CDSConsultaCAtivo: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CAtivo'
      Size = 3
    end
    object CDSConsultaUsu_Email: TWideStringField
      FieldName = 'Usu_Email'
      Required = True
      Size = 100
    end
    object CDSConsultaCtaEm_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'CtaEm_Codigo'
      DisplayFormat = '0000'
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspUsuarioCad'
    BeforePost = CDSCadastroBeforePost
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroUsu_Id: TAutoIncField
      FieldName = 'Usu_Id'
      ProviderFlags = [pfInWhere]
    end
    object CDSCadastroUsu_Adm: TBooleanField
      FieldName = 'Usu_Adm'
      Required = True
    end
    object CDSCadastroUsu_Ativo: TBooleanField
      FieldName = 'Usu_Ativo'
      Required = True
    end
    object CDSCadastroUsu_Cliente: TIntegerField
      FieldName = 'Usu_Cliente'
    end
    object CDSCadastroUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroUsu_Departamento: TIntegerField
      FieldName = 'Usu_Departamento'
      Required = True
    end
    object CDSCadastroUsu_Email: TWideStringField
      FieldName = 'Usu_Email'
      Required = True
      Size = 100
    end
    object CDSCadastroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object CDSCadastroUsu_Notificar: TBooleanField
      FieldName = 'Usu_Notificar'
      Required = True
    end
    object CDSCadastroUsu_OnLine: TBooleanField
      FieldName = 'Usu_OnLine'
      Required = True
    end
    object CDSCadastroUsu_Password: TWideStringField
      FieldName = 'Usu_Password'
      Required = True
      Size = 50
    end
    object CDSCadastroUsu_Revenda: TIntegerField
      FieldName = 'Usu_Revenda'
    end
    object CDSCadastroUsu_UserName: TWideStringField
      FieldName = 'Usu_UserName'
      Required = True
      Size = 50
    end
    object CDSCadastroCli_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Cli_Codigo'
      ProviderFlags = []
      DisplayFormat = '000000'
    end
    object CDSCadastroCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSCadastroDep_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Dep_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroDep_Nome: TWideStringField
      FieldName = 'Dep_Nome'
      ProviderFlags = []
      Size = 50
    end
    object CDSCadastroRev_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Rev_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroRev_Nome: TWideStringField
      FieldName = 'Rev_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSCadastroUsu_ContaEmail: TIntegerField
      FieldName = 'Usu_ContaEmail'
    end
    object CDSCadastroCtaEm_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'CtaEm_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCadastroCtaEm_Nome: TStringField
      FieldName = 'CtaEm_Nome'
      Size = 60
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
    Top = 152
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
        Caption = 'Relat'#243'rio de Usu'#225'rios'
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
        DataField = 'Usu_Codigo'
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
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'Usu_Nome'
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
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
        DataPipeline = DBConsulta
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Courier New'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        DataPipelineName = 'DBConsulta'
        mmHeight = 4498
        mmLeft = 131498
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
        DataField = 'Usu_id'
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
  object CDSUsuarioAcessoMenu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarioAcessoMenu'
    Left = 152
    Top = 88
    object CDSUsuarioAcessoMenuDepAc_Acesso: TBooleanField
      FieldName = 'DepAc_Acesso'
      Required = True
    end
    object CDSUsuarioAcessoMenuDepAc_Programa: TIntegerField
      FieldName = 'DepAc_Programa'
      Required = True
    end
  end
  object CDSListarPermissaoListar: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptInput
      end>
    ProviderName = 'dspUsuarioPermissaoListar'
    BeforePost = CDSListarPermissaoListarBeforePost
    OnNewRecord = CDSListarPermissaoListarNewRecord
    OnReconcileError = CDSListarPermissaoListarReconcileError
    Left = 240
    Top = 24
    object CDSListarPermissaoListarUsuP_Id: TAutoIncField
      FieldName = 'UsuP_Id'
      Origin = 'UsuP_Id'
    end
    object CDSListarPermissaoListarUsuP_Sigla: TStringField
      FieldName = 'UsuP_Sigla'
      Origin = 'UsuP_Sigla'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object CDSListarPermissaoListarUsuP_Usuario: TIntegerField
      FieldName = 'UsuP_Usuario'
      Origin = 'UsuP_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
end
