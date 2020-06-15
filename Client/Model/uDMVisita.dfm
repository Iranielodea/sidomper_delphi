inherited DMVisita: TDMVisita
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspVisitaCons'
    RemoteServer = DM.DSPConexao
    object CDSConsultaVis_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Vis_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSConsultaVis_Dcto: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'Vis_Dcto'
      Size = 25
    end
    object CDSConsultaVis_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Vis_Data'
      Required = True
    end
    object CDSConsultaCli_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd. Cliente'
      FieldName = 'Cli_Codigo'
      Required = True
      DisplayFormat = '000000'
    end
    object CDSConsultaCli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaUsu_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'd. Consultor'
      FieldName = 'Usu_Codigo'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSConsultaUsu_Nome: TWideStringField
      DisplayLabel = 'Consultor'
      FieldName = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaCli_Fantasia: TWideStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'Cli_Fantasia'
      Size = 100
    end
    object CDSConsultaVis_Status: TIntegerField
      FieldName = 'Vis_Status'
      Required = True
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspVisitaCad'
    RemoteServer = DM.DSPConexao
    BeforePost = CDSCadastroBeforePost
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroVis_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Vis_Id'
      Origin = 'Vis_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object CDSCadastroVis_Dcto: TStringField
      FieldName = 'Vis_Dcto'
      Origin = 'Vis_Dcto'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object CDSCadastroVis_Data: TDateField
      FieldName = 'Vis_Data'
      Origin = 'Vis_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = CDSCadastroVis_DataSetText
      EditMask = '##/##/####'
    end
    object CDSCadastroVis_HoraInicio: TTimeField
      FieldName = 'Vis_HoraInicio'
      Origin = 'Vis_HoraInicio'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = CDSCadastroVis_HoraInicioSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCadastroVis_HoraFim: TTimeField
      FieldName = 'Vis_HoraFim'
      Origin = 'Vis_HoraFim'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = CDSCadastroVis_HoraFimSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCadastroVis_Cliente: TIntegerField
      FieldName = 'Vis_Cliente'
      Origin = 'Vis_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroVis_Usuario: TIntegerField
      FieldName = 'Vis_Usuario'
      Origin = 'Vis_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroVis_Contato: TStringField
      FieldName = 'Vis_Contato'
      Origin = 'Vis_Contato'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CDSCadastroVis_Tipo: TIntegerField
      FieldName = 'Vis_Tipo'
      Origin = 'Vis_Tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroVis_Status: TIntegerField
      FieldName = 'Vis_Status'
      Origin = 'Vis_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroVis_Descricao: TStringField
      FieldName = 'Vis_Descricao'
      Origin = 'Vis_Descricao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2000
    end
    object CDSCadastroVis_Anexo: TStringField
      FieldName = 'Vis_Anexo'
      Origin = 'Vis_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object CDSCadastroCli_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      ProviderFlags = []
      DisplayFormat = '000000'
    end
    object CDSCadastroCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSCadastroUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroTip_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object CDSCadastroSta_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = []
      Size = 50
    end
    object CDSCadastroVis_TotalHoras: TFloatField
      FieldName = 'Vis_TotalHoras'
      Origin = 'Vis_TotalHoras'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroVis_FormaPagto: TStringField
      FieldName = 'Vis_FormaPagto'
      Origin = 'Vis_FormaPagto'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object CDSCadastroVis_Valor: TCurrencyField
      FieldName = 'Vis_Valor'
      Origin = 'Vis_Valor'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = CDSCadastroVis_ValorSetText
      DisplayFormat = ',##0.00'
    end
    object CDSCadastroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object CDSCadastroVis_Versao: TStringField
      FieldName = 'Vis_Versao'
      Origin = 'Vis_Versao'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object CDSCadastroVis_Latitude: TStringField
      FieldName = 'Vis_Latitude'
      Origin = 'Vis_Latitude'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object CDSCadastroVis_Longitude: TStringField
      FieldName = 'Vis_Longitude'
      Origin = 'Vis_Longitude'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
end
