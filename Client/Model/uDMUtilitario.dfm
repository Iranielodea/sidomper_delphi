object DMUtilitario: TDMUtilitario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 226
  Width = 306
  object CDSListarTabelas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListarTabelas'
    Left = 40
    Top = 32
    object CDSListarTabelasTabelas: TWideStringField
      FieldName = 'Tabelas'
      Required = True
      Size = 128
    end
  end
  object CDSListarCampos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListarCampos'
    Left = 112
    Top = 32
    object CDSListarCamposCOLUNA: TWideStringField
      FieldName = 'COLUNA'
      Size = 128
    end
  end
  object CDSInstrucaoSQL: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspInstrucaoSQL'
    RemoteServer = DM.DSPConexao
    Left = 184
    Top = 32
  end
end
