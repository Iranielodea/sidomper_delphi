inherited DMClienteEmail: TDMClienteEmail
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 200
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspClienteEmailCons'
    BeforePost = CDSConsultaBeforePost
    OnCalcFields = CDSConsultaCalcFields
    OnNewRecord = CDSConsultaNewRecord
    OnReconcileError = CDSConsultaReconcileError
    object CDSConsultaCliEm_Id: TAutoIncField
      FieldName = 'CliEm_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSConsultaCliEm_Cliente: TIntegerField
      FieldName = 'CliEm_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSConsultaCliEm_Email: TWideStringField
      FieldName = 'CliEm_Email'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object CDSConsultaCliEm_Notificar: TBooleanField
      FieldName = 'CliEm_Notificar'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSConsultaCNotificar: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'CNotificar'
      ProviderFlags = [pfInUpdate]
      Calculated = True
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspClienteEmailCad'
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroCliEm_Id: TAutoIncField
      FieldName = 'CliEm_Id'
    end
    object CDSCadastroCliEm_Cliente: TIntegerField
      FieldName = 'CliEm_Cliente'
      Required = True
    end
    object CDSCadastroCliEm_Email: TWideStringField
      FieldName = 'CliEm_Email'
      Required = True
      Size = 100
    end
    object CDSCadastroCliEm_Notificar: TBooleanField
      FieldName = 'CliEm_Notificar'
      Required = True
    end
  end
end
