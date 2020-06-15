inherited DMBaseConh: TDMBaseConh
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspBaseCons'
    object CDSConsultaBas_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Bas_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSConsultaBas_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Bas_Data'
      Required = True
    end
    object CDSConsultaBas_Nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Bas_Nome'
      Required = True
      Size = 200
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
    object CDSConsultaUsu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Required = True
      Size = 100
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspBaseCad'
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroBas_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Bas_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object CDSCadastroBas_Data: TDateField
      FieldName = 'Bas_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
      OnSetText = CDSCadastroBas_DataSetText
      EditMask = '##/##/####'
    end
    object CDSCadastroBas_Nome: TStringField
      FieldName = 'Bas_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object CDSCadastroBas_Usuario: TIntegerField
      FieldName = 'Bas_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroBas_Produto: TIntegerField
      FieldName = 'Bas_Produto'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCadastroBas_Modulo: TIntegerField
      FieldName = 'Bas_Modulo'
      ProviderFlags = [pfInUpdate]
    end
    object CDSCadastroBas_Tipo: TIntegerField
      FieldName = 'Bas_Tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroBas_Status: TIntegerField
      FieldName = 'Bas_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSCadastroBas_Descricao: TStringField
      FieldName = 'Bas_Descricao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2000
    end
    object CDSCadastroBas_Anexo: TStringField
      FieldName = 'Bas_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object CDSCadastroUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroProd_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Prod_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSCadastroMod_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Mod_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object CDSCadastroTip_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Tip_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object CDSCadastroSta_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Sta_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      ProviderFlags = []
      Size = 50
    end
    object CDSCadastroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
end
