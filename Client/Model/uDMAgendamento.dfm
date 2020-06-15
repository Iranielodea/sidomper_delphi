inherited dmAgendamento: TdmAgendamento
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 202
  Width = 260
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspAgendamentoCons'
    RemoteServer = DM.DSPConexao2
    object CDSConsultaAge_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Age_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSConsultaAge_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Age_Data'
      Required = True
    end
    object CDSConsultaAge_Hora: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Age_Hora'
      Required = True
      DisplayFormat = 'hh:mm'
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
    object CDSConsultaAge_NomeCliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Age_NomeCliente'
      Size = 100
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspAgendamentoCad'
    RemoteServer = DM.DSPConexao2
    BeforePost = CDSCadastroBeforePost
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroAge_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Age_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSCadastroAge_Data: TDateField
      FieldName = 'Age_Data'
      Required = True
      OnSetText = CDSCadastroAge_DataSetText
      EditMask = '##/##/####'
    end
    object CDSCadastroAge_Hora: TTimeField
      FieldName = 'Age_Hora'
      Required = True
      OnSetText = CDSCadastroAge_HoraSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCadastroAge_Usuario: TIntegerField
      FieldName = 'Age_Usuario'
      Required = True
    end
    object CDSCadastroAge_Cliente: TIntegerField
      FieldName = 'Age_Cliente'
      Required = True
      DisplayFormat = '000000'
    end
    object CDSCadastroAge_Contato: TStringField
      FieldName = 'Age_Contato'
      Size = 100
    end
    object CDSCadastroAge_Programa: TIntegerField
      FieldName = 'Age_Programa'
      Required = True
    end
    object CDSCadastroAge_Tipo: TIntegerField
      FieldName = 'Age_Tipo'
    end
    object CDSCadastroAge_Status: TIntegerField
      FieldName = 'Age_Status'
    end
    object CDSCadastroAge_Descricao: TStringField
      FieldName = 'Age_Descricao'
      Size = 500
    end
    object CDSCadastroAge_Motivo: TStringField
      FieldName = 'Age_Motivo'
      Size = 500
    end
    object CDSCadastroAge_Visita: TIntegerField
      FieldName = 'Age_Visita'
    end
    object CDSCadastroAge_Atividade: TIntegerField
      FieldName = 'Age_Atividade'
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
    object CDSCadastroCli_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Cli_Codigo'
      DisplayFormat = '000000'
    end
    object CDSCadastroTip_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Tip_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCadastroTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSCadastroSta_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Sta_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCadastroSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Size = 50
    end
    object CDSCadastroAge_NomeCliente: TStringField
      FieldName = 'Age_NomeCliente'
      Size = 100
    end
  end
  object CDSQuadro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgendaQuadro'
    RemoteServer = DM.DSPConexao2
    Left = 152
    Top = 80
    object CDSQuadroAge_Id: TAutoIncField
      FieldName = 'Age_Id'
      ReadOnly = True
    end
    object CDSQuadroAge_Data: TDateField
      FieldName = 'Age_Data'
      Required = True
    end
    object CDSQuadroAge_Hora: TTimeField
      FieldName = 'Age_Hora'
      Required = True
    end
    object CDSQuadroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object CDSQuadroSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object CDSQuadroAge_Cliente: TIntegerField
      FieldName = 'Age_Cliente'
      Required = True
    end
    object CDSQuadroAge_NomeCliente: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Age_NomeCliente'
      Size = 100
    end
  end
end
