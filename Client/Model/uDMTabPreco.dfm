inherited DMTabPreco: TDMTabPreco
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspTabPrecoCons'
    RemoteServer = DM.DSPConexao2
    object CDSConsultaTab_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Tab_Id'
      ReadOnly = True
      DisplayFormat = '0000'
    end
    object CDSConsultaTab_Nome: TStringField
      FieldName = 'Tab_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaTab_Referencia: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'Tab_Referencia'
      Size = 30
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspTabPrecoCad'
    OnNewRecord = CDSCadastroNewRecord
    object CDSCadastroTab_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Tab_Id'
      ReadOnly = True
      DisplayFormat = '0000'
    end
    object CDSCadastroTab_Data: TDateField
      FieldName = 'Tab_Data'
      Required = True
      EditMask = '##/##/####'
    end
    object CDSCadastroTab_Referencia: TStringField
      FieldName = 'Tab_Referencia'
      Size = 30
    end
    object CDSCadastroTab_Nome: TStringField
      FieldName = 'Tab_Nome'
      Required = True
      Size = 100
    end
    object CDSCadastroTab_Produto: TIntegerField
      FieldName = 'Tab_Produto'
    end
    object CDSCadastroTab_Status: TIntegerField
      FieldName = 'Tab_Status'
    end
    object CDSCadastroTab_Tipo: TIntegerField
      FieldName = 'Tab_Tipo'
    end
    object CDSCadastroTab_Ativo: TBooleanField
      FieldName = 'Tab_Ativo'
    end
    object CDSCadastroTab_ValorImplSimples: TBCDField
      FieldName = 'Tab_ValorImplSimples'
      DisplayFormat = ',##0.00'
      Precision = 15
      Size = 2
    end
    object CDSCadastroTab_ValorMensalSimples: TBCDField
      FieldName = 'Tab_ValorMensalSimples'
      DisplayFormat = ',##0.00'
      Precision = 15
      Size = 2
    end
    object CDSCadastroTab_Observacao: TStringField
      FieldName = 'Tab_Observacao'
      Size = 2000
    end
    object CDSCadastroTab_ValorImplRegNormal: TBCDField
      FieldName = 'Tab_ValorImplRegNormal'
      DisplayFormat = ',##0.00'
      Precision = 15
      Size = 2
    end
    object CDSCadastroTab_ValorMensalRegNormal: TBCDField
      FieldName = 'Tab_ValorMensalRegNormal'
      DisplayFormat = ',##0.00'
      Precision = 15
      Size = 2
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
  end
  object CDSItens: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDTABELA'
        ParamType = ptInput
      end>
    ProviderName = 'dspTabPrecoItens'
    BeforePost = CDSItensBeforePost
    Left = 152
    Top = 80
    object CDSItensTabM_Id: TAutoIncField
      FieldName = 'TabM_Id'
      Origin = 'TabM_Id'
      ProviderFlags = []
    end
    object CDSItensTabM_TabPreco: TIntegerField
      FieldName = 'TabM_TabPreco'
      Origin = 'TabM_TabPreco'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object CDSItensTabM_Modulo: TIntegerField
      FieldName = 'TabM_Modulo'
      Origin = 'TabM_Modulo'
      ProviderFlags = [pfInUpdate]
    end
    object CDSItensMod_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Mod_Codigo'
      Origin = 'Mod_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSItensMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
end
