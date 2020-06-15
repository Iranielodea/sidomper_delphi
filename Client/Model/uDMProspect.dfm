inherited DMProspect: TDMProspect
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 311
  Width = 272
  inherited CDSConsulta: TClientDataSet
    PacketRecords = 50
    ProviderName = 'dspProspectCons'
    object CDSConsultaPros_Id: TAutoIncField
      FieldName = 'Pros_Id'
      ReadOnly = True
    end
    object CDSConsultaPros_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Pros_Codigo'
      Required = True
      DisplayFormat = '000000'
    end
    object CDSConsultaPros_Nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Pros_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaPros_Fantasia: TStringField
      DisplayLabel = 'Fantasia'
      FieldName = 'Pros_Fantasia'
      Size = 100
    end
    object CDSConsultaPros_Docto: TStringField
      DisplayLabel = 'Documento'
      FieldName = 'Pros_Docto'
      Required = True
      Size = 25
    end
    object CDSConsultaPros_Telefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'Pros_Telefone'
      Size = 100
    end
    object CDSConsultaPros_Ativo: TBooleanField
      FieldName = 'Pros_Ativo'
    end
    object CDSConsultaPros_Enquadramento: TStringField
      DisplayLabel = 'Enquadramento'
      FieldName = 'Pros_Enquadramento'
      ReadOnly = True
      Size = 18
    end
    object CDSConsultaUsu_Nome: TWideStringField
      DisplayLabel = 'Consultor'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSConsultaRev_Nome: TWideStringField
      DisplayLabel = 'Revenda'
      FieldName = 'Rev_Nome'
      Size = 100
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspProspectCad'
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroPros_Id: TAutoIncField
      FieldName = 'Pros_Id'
      ReadOnly = True
    end
    object CDSCadastroPros_Ativo: TBooleanField
      FieldName = 'Pros_Ativo'
    end
    object CDSCadastroPros_Contato: TStringField
      FieldName = 'Pros_Contato'
      Size = 200
    end
    object CDSCadastroPros_Docto: TStringField
      FieldName = 'Pros_Docto'
      Required = True
      OnSetText = CDSCadastroPros_DoctoSetText
      Size = 25
    end
    object CDSCadastroPros_Endereco: TStringField
      FieldName = 'Pros_Endereco'
      Size = 200
    end
    object CDSCadastroPros_Enquadramento: TStringField
      FieldName = 'Pros_Enquadramento'
      Size = 2
    end
    object CDSCadastroPros_Fantasia: TStringField
      FieldName = 'Pros_Fantasia'
      Size = 100
    end
    object CDSCadastroPros_Nome: TStringField
      FieldName = 'Pros_Nome'
      Required = True
      Size = 100
    end
    object CDSCadastroPros_Revenda: TIntegerField
      FieldName = 'Pros_Revenda'
      Required = True
    end
    object CDSCadastroPros_Telefone: TStringField
      FieldName = 'Pros_Telefone'
      Size = 100
    end
    object CDSCadastroPros_Usuario: TIntegerField
      FieldName = 'Pros_Usuario'
    end
    object CDSCadastroRev_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Rev_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCadastroPros_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Pros_Codigo'
      Required = True
      DisplayFormat = '000000'
    end
    object CDSCadastroRev_Nome: TWideStringField
      FieldName = 'Rev_Nome'
      Size = 100
    end
    object CDSCadastroUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCadastroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSEmail: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProspectEmail'
    BeforePost = CDSEmailBeforePost
    OnNewRecord = CDSEmailNewRecord
    OnReconcileError = CDSEmailReconcileError
    Left = 152
    Top = 80
    object CDSEmailProsEm_Id: TAutoIncField
      FieldName = 'ProsEm_Id'
    end
    object CDSEmailProsEm_Prospect: TIntegerField
      FieldName = 'ProsEm_Prospect'
      Required = True
    end
    object CDSEmailProsEm_Email: TStringField
      DisplayLabel = 'Email'
      FieldName = 'ProsEm_Email'
      Required = True
      Size = 100
    end
    object CDSEmailProsEm_Descricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'ProsEm_Descricao'
      Required = True
      Size = 100
    end
  end
end
