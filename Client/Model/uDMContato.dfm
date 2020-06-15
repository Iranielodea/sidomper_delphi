inherited DMContato: TDMContato
  OnCreate = DataModuleCreate
  inherited CDSConsulta: TClientDataSet
    RemoteServer = DM.DSPConexao2
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspContato'
    RemoteServer = DM.DSPConexao2
    object CDSCadastroCont_Id: TAutoIncField
      FieldName = 'Cont_Id'
      ReadOnly = True
    end
    object CDSCadastroCont_Cliente: TIntegerField
      FieldName = 'Cont_Cliente'
    end
    object CDSCadastroCont_Orcamento: TIntegerField
      FieldName = 'Cont_Orcamento'
    end
    object CDSCadastroCont_Nome: TStringField
      FieldName = 'Cont_Nome'
      Size = 100
    end
    object CDSCadastroCont_Fone1: TStringField
      FieldName = 'Cont_Fone1'
      Size = 25
    end
    object CDSCadastroCont_Fone2: TStringField
      FieldName = 'Cont_Fone2'
      Size = 25
    end
    object CDSCadastroCont_Depto: TStringField
      FieldName = 'Cont_Depto'
      Size = 60
    end
    object CDSCadastroCont_Email: TStringField
      FieldName = 'Cont_Email'
      Size = 100
    end
  end
  object CDSTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = CDSTabelaBeforePost
    Left = 152
    Top = 80
    object CDSTabelaCont_Id: TIntegerField
      FieldName = 'Cont_Id'
    end
    object CDSTabelaCont_Cliente: TIntegerField
      FieldName = 'Cont_Cliente'
    end
    object CDSTabelaCont_Orcamento: TIntegerField
      FieldName = 'Cont_Orcamento'
    end
    object CDSTabelaCont_Nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Cont_Nome'
      Size = 100
    end
    object CDSTabelaCont_Fone1: TStringField
      DisplayLabel = 'Fone1'
      FieldName = 'Cont_Fone1'
      Size = 25
    end
    object CDSTabelaCont_Fone2: TStringField
      DisplayLabel = 'Fone2'
      FieldName = 'Cont_Fone2'
      Size = 25
    end
    object CDSTabelaCont_Depto: TStringField
      DisplayLabel = 'Departamento'
      FieldName = 'Cont_Depto'
      Size = 60
    end
    object CDSTabelaCont_Email: TStringField
      DisplayLabel = 'E-mail'
      FieldName = 'Cont_Email'
      Size = 100
    end
  end
end
