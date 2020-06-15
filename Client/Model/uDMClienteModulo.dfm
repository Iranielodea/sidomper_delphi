inherited DMClienteModulo: TDMClienteModulo
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 200
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspClienteModuloCons'
    BeforePost = CDSConsultaBeforePost
    OnNewRecord = CDSConsultaNewRecord
    OnReconcileError = CDSConsultaReconcileError
    object CDSConsultaCliMod_Id: TAutoIncField
      FieldName = 'CliMod_Id'
    end
    object CDSConsultaCliMod_Cliente: TIntegerField
      FieldName = 'CliMod_Cliente'
      Required = True
    end
    object CDSConsultaCliMod_Modulo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CliMod_Modulo'
      Required = True
    end
    object CDSConsultaCliMod_Produto: TIntegerField
      FieldName = 'CliMod_Produto'
    end
    object CDSConsultaMod_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Mod_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSConsultaMod_Nome: TWideStringField
      DisplayLabel = 'M'#243'dulo'
      FieldName = 'Mod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSConsultaProd_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Prod_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSConsultaProd_Nome: TWideStringField
      DisplayLabel = 'Produto'
      FieldName = 'Prod_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspClienteModuloCad'
    RemoteServer = DM.DSPConexao
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroCliMod_Id: TAutoIncField
      FieldName = 'CliMod_Id'
      ReadOnly = True
    end
    object CDSCadastroCliMod_Cliente: TIntegerField
      FieldName = 'CliMod_Cliente'
      Required = True
    end
    object CDSCadastroCliMod_Modulo: TIntegerField
      FieldName = 'CliMod_Modulo'
      Required = True
    end
    object CDSCadastroCliMod_Produto: TIntegerField
      FieldName = 'CliMod_Produto'
    end
    object CDSCadastroProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Required = True
    end
    object CDSCadastroProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Required = True
      Size = 100
    end
  end
end
