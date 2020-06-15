object dmPlanoBackup: TdmPlanoBackup
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object CDSCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanoBackup'
    RemoteServer = DM.DSPConexao2
    OnNewRecord = CDSCadastroNewRecord
    Left = 40
    Top = 24
    object CDSCadastroPlb_Id: TAutoIncField
      FieldName = 'Plb_Id'
      ReadOnly = True
    end
    object CDSCadastroPlb_Destino: TStringField
      FieldName = 'Plb_Destino'
      Required = True
      Size = 200
    end
    object CDSCadastroPlb_Domingo: TBooleanField
      FieldName = 'Plb_Domingo'
      Required = True
    end
    object CDSCadastroPlb_Segunda: TBooleanField
      FieldName = 'Plb_Segunda'
      Required = True
    end
    object CDSCadastroPlb_Terca: TBooleanField
      FieldName = 'Plb_Terca'
      Required = True
    end
    object CDSCadastroPlb_Quarta: TBooleanField
      FieldName = 'Plb_Quarta'
      Required = True
    end
    object CDSCadastroPlb_Quinta: TBooleanField
      FieldName = 'Plb_Quinta'
      Required = True
    end
    object CDSCadastroPlb_Sexta: TBooleanField
      FieldName = 'Plb_Sexta'
      Required = True
    end
    object CDSCadastroPlb_Sabado: TBooleanField
      FieldName = 'Plb_Sabado'
      Required = True
    end
    object CDSCadastroPlb_Ativo: TBooleanField
      FieldName = 'Plb_Ativo'
      Required = True
    end
    object CDSCadastroPlb_DataUltimoBackup: TDateField
      FieldName = 'Plb_DataUltimoBackup'
    end
  end
  object CDSItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPlanoBackupItens'
    RemoteServer = DM.DSPConexao2
    BeforePost = CDSItensBeforePost
    Left = 104
    Top = 24
    object CDSItensPlbIte_Id: TAutoIncField
      FieldName = 'PlbIte_Id'
    end
    object CDSItensPlbIte_Hora: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'PlbIte_Hora'
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSItensPlbIte_PlanoBackup: TIntegerField
      FieldName = 'PlbIte_PlanoBackup'
      Required = True
    end
    object CDSItensPlbIte_Status: TBooleanField
      FieldName = 'PlbIte_Status'
    end
  end
end
