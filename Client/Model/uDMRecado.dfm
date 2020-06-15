inherited DMRecado: TDMRecado
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 266
  Width = 229
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspRecadoCons'
    RemoteServer = DM.DSPConexao2
    object CDSConsultaRec_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Rec_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSConsultaNomeUsuarioLcto: TWideStringField
      DisplayLabel = 'Usu'#225'rio Lan'#231'amento'
      FieldName = 'NomeUsuarioLcto'
      Required = True
      Size = 100
    end
    object CDSConsultaRec_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Rec_Data'
      Required = True
    end
    object CDSConsultaRec_Hora: TTimeField
      Alignment = taCenter
      DisplayLabel = 'Hora'
      FieldName = 'Rec_Hora'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSConsultaRec_RazaoSocial: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'Rec_RazaoSocial'
      Size = 100
    end
    object CDSConsultaRec_Contato: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'Rec_Contato'
      Size = 200
    end
    object CDSConsultaRec_Telefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'Rec_Telefone'
      Size = 100
    end
    object CDSConsultaNomeUsuarioDest: TWideStringField
      DisplayLabel = 'Usu'#225'rio Destino'
      FieldName = 'NomeUsuarioDest'
      Required = True
      Size = 100
    end
    object CDSConsultaRec_Nivel: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Rec_Nivel'
    end
    object CDSConsultaSta_Nome: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'Sta_Nome'
      Required = True
      Size = 50
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspRecadoCad'
    RemoteServer = DM.DSPConexao2
    OnNewRecord = CDSCadastroNewRecord
    object CDSCadastroRec_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Rec_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSCadastroRec_data: TDateField
      FieldName = 'Rec_data'
      Required = True
      OnSetText = CDSCadastroRec_dataSetText
      EditMask = '##/##/####'
    end
    object CDSCadastroRec_Hora: TTimeField
      FieldName = 'Rec_Hora'
      Required = True
      OnSetText = CDSCadastroRec_HoraSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCadastroRec_UsuarioLcto: TIntegerField
      Alignment = taCenter
      FieldName = 'Rec_UsuarioLcto'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroRec_Nivel: TIntegerField
      FieldName = 'Rec_Nivel'
    end
    object CDSCadastroRec_Cliente: TIntegerField
      FieldName = 'Rec_Cliente'
    end
    object CDSCadastroRec_RazaoSocial: TStringField
      FieldName = 'Rec_RazaoSocial'
      Size = 100
    end
    object CDSCadastroRec_Fantasia: TStringField
      FieldName = 'Rec_Fantasia'
      Size = 100
    end
    object CDSCadastroRec_Endereco: TStringField
      FieldName = 'Rec_Endereco'
      Size = 200
    end
    object CDSCadastroRec_Telefone: TStringField
      FieldName = 'Rec_Telefone'
      Size = 100
    end
    object CDSCadastroRec_Contato: TStringField
      FieldName = 'Rec_Contato'
      Size = 200
    end
    object CDSCadastroRec_UsuarioDestino: TIntegerField
      FieldName = 'Rec_UsuarioDestino'
      Required = True
    end
    object CDSCadastroRec_Tipo: TIntegerField
      Alignment = taCenter
      FieldName = 'Rec_Tipo'
      DisplayFormat = '0000'
    end
    object CDSCadastroRec_Status: TIntegerField
      FieldName = 'Rec_Status'
    end
    object CDSCadastroRec_DescricaoInicial: TStringField
      FieldName = 'Rec_DescricaoInicial'
      Size = 1000
    end
    object CDSCadastroRec_DataFinal: TDateField
      FieldName = 'Rec_DataFinal'
      OnSetText = CDSCadastroRec_DataFinalSetText
      EditMask = '##/##/####'
    end
    object CDSCadastroRec_HoraFinal: TTimeField
      FieldName = 'Rec_HoraFinal'
      OnSetText = CDSCadastroRec_HoraFinalSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCadastroRec_DescricaoFinal: TStringField
      FieldName = 'Rec_DescricaoFinal'
      Size = 1000
    end
    object CDSCadastroNomeUsuarioLcto: TWideStringField
      FieldName = 'NomeUsuarioLcto'
      Required = True
      Size = 100
    end
    object CDSCadastroNomeUsuarioDest: TWideStringField
      FieldName = 'NomeUsuarioDest'
      Required = True
      Size = 100
    end
    object CDSCadastroCli_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Cli_Codigo'
      DisplayFormat = '000000'
    end
    object CDSCadastroCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Size = 100
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
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object CDSCadastroUsu_CodigoLcto: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_CodigoLcto'
      Required = True
      DisplayFormat = '0000'
    end
    object CDSCadastroUsu_CodigoDest: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_CodigoDest'
      Required = True
      DisplayFormat = '0000'
    end
  end
  object CDSQuadro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRecadoQuadro'
    Left = 152
    Top = 80
    object CDSQuadroTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Required = True
      Size = 1
    end
    object CDSQuadroRec_Id: TIntegerField
      FieldName = 'Rec_Id'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroRec_Data: TDateField
      FieldName = 'Rec_Data'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroRec_Nivel: TIntegerField
      FieldName = 'Rec_Nivel'
      ReadOnly = True
    end
    object CDSQuadroRec_RazaoSocial: TStringField
      FieldName = 'Rec_RazaoSocial'
      ReadOnly = True
      Size = 100
    end
    object CDSQuadroRec_Telefone: TStringField
      FieldName = 'Rec_Telefone'
      ReadOnly = True
      Size = 100
    end
    object CDSQuadroUsuarioLcto: TWideStringField
      FieldName = 'UsuarioLcto'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object CDSQuadroUsuarioDestino: TWideStringField
      FieldName = 'UsuarioDestino'
      ReadOnly = True
      Size = 100
    end
    object CDSQuadroRec_Hora: TTimeField
      FieldName = 'Rec_Hora'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroRec_UsuarioLcto: TIntegerField
      FieldName = 'Rec_UsuarioLcto'
      ReadOnly = True
      Required = True
    end
    object CDSQuadroRec_UsuarioDestino: TIntegerField
      FieldName = 'Rec_UsuarioDestino'
      ReadOnly = True
      Required = True
    end
  end
  object CDSLcto: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CDSLctoIndexNivel'
        Fields = 'Rec_Nivel'
        Options = [ixDescending]
      end>
    IndexName = 'CDSLctoIndexNivel'
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSLctoCalcFields
    Left = 152
    Top = 144
    object CDSLctoRec_Id: TIntegerField
      Alignment = taCenter
      FieldName = 'Rec_Id'
      DisplayFormat = '000000'
    end
    object CDSLctoRec_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Rec_Data'
    end
    object CDSLctoRec_Nivel: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Rec_Nivel'
    end
    object CDSLctoRec_RazaoSocial: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'Rec_RazaoSocial'
      Size = 100
    end
    object CDSLctoRec_Telefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'Rec_Telefone'
      Size = 100
    end
    object CDSLctoRec_Hora: TTimeField
      Alignment = taCenter
      FieldName = 'Rec_Hora'
      DisplayFormat = 'hh:mm'
    end
    object CDSLctoUsuarioLcto: TStringField
      DisplayLabel = 'Usu'#225'rio Lan'#231'amento'
      FieldName = 'UsuarioLcto'
      Size = 100
    end
    object CDSLctoUsuarioDestino: TStringField
      DisplayLabel = 'Usu'#225'rio Destino'
      FieldName = 'UsuarioDestino'
      Size = 100
    end
    object CDSLctoCTempo: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSLctoRec_UsuarioLcto: TIntegerField
      FieldName = 'Rec_UsuarioLcto'
    end
    object CDSLctoRec_UsuarioDestino: TIntegerField
      FieldName = 'Rec_UsuarioDestino'
    end
  end
  object CDSDestino: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CDSDestinoIndexNivel'
        Fields = 'Rec_Nivel'
        Options = [ixDescending]
      end>
    IndexName = 'CDSDestinoIndexNivel'
    Params = <>
    StoreDefs = True
    OnCalcFields = CDSDestinoCalcFields
    Left = 152
    Top = 200
    object CDSDestinoRec_Id: TIntegerField
      Alignment = taCenter
      FieldName = 'Rec_Id'
      DisplayFormat = '000000'
    end
    object CDSDestinoRec_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Rec_Data'
    end
    object CDSDestinoRec_Nivel: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Rec_Nivel'
    end
    object CDSDestinoRec_RazaoSocial: TStringField
      DisplayLabel = 'Raz'#227'o Social'
      FieldName = 'Rec_RazaoSocial'
      Size = 100
    end
    object CDSDestinoRec_Telefone: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'Rec_Telefone'
      Size = 100
    end
    object CDSDestinoRec_Hora: TTimeField
      Alignment = taCenter
      FieldName = 'Rec_Hora'
      DisplayFormat = 'hh:mm'
    end
    object CDSDestinoUsuarioLcto: TStringField
      DisplayLabel = 'Usu'#225'rio Lan'#231'amento'
      FieldName = 'UsuarioLcto'
      Size = 100
    end
    object CDSDestinoUsuarioDestino: TStringField
      DisplayLabel = 'Usu'#225'rio Destino'
      FieldName = 'UsuarioDestino'
      Size = 100
    end
    object CDSDestinoCTempo: TStringField
      Alignment = taCenter
      FieldKind = fkInternalCalc
      FieldName = 'CTempo'
      Size = 10
    end
    object CDSDestinoRec_UsuarioDestino: TIntegerField
      FieldName = 'Rec_UsuarioDestino'
    end
  end
end
