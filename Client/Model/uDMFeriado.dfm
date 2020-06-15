inherited DMFeriado: TDMFeriado
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspFeriadoCons'
    RemoteServer = DM.DSPConexao2
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspFeriadoCad'
    RemoteServer = DM.DSPConexao2
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroFer_Id: TAutoIncField
      FieldName = 'Fer_Id'
      ReadOnly = True
    end
    object CDSCadastroFer_Data: TDateField
      FieldName = 'Fer_Data'
      Required = True
      EditMask = '##/##/####'
    end
    object CDSCadastroFer_Descricao: TStringField
      FieldName = 'Fer_Descricao'
      Size = 100
    end
  end
end
