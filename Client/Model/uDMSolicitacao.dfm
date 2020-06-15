inherited DMSolicitacao: TDMSolicitacao
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 448
  Width = 717
  inherited CDSConsulta: TClientDataSet
    ProviderName = 'dspSolicitacaoCons'
    object CDSConsultaSol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      Origin = 'Sol_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSConsultaSol_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      Required = True
    end
    object CDSConsultaSol_Hora: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'Sol_Hora'
      Origin = 'Sol_Hora'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSConsultaSol_Cliente: TIntegerField
      FieldName = 'Sol_Cliente'
      Origin = 'Sol_Cliente'
      Required = True
    end
    object CDSConsultaSol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Origin = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSConsultaCli_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Cli_Codigo'
      Required = True
      DisplayFormat = '000000'
    end
    object CDSConsultaCli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaSol_Nivel: TStringField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'Sol_Nivel'
      ReadOnly = True
      Size = 9
    end
    object CDSConsultaSta_Nome: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object CDSConsultaTip_Nome: TWideStringField
      DisplayLabel = 'Tipo'
      FieldName = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object CDSConsultaCli_Fantasia: TWideStringField
      DisplayLabel = 'Nome Fantasia'
      FieldName = 'Cli_Fantasia'
      Size = 100
    end
    object CDSConsultaSol_Status: TIntegerField
      FieldName = 'Sol_Status'
      Required = True
    end
    object CDSConsultaVer_Versao: TStringField
      DisplayLabel = 'Vers'#227'o'
      FieldName = 'Ver_Versao'
      Size = 25
    end
  end
  inherited CDSCadastro: TClientDataSet
    ProviderName = 'dspSolicitacaoCad'
    BeforePost = CDSCadastroBeforePost
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    object CDSCadastroSol_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Sol_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000000'
    end
    object CDSCadastroSol_Analista: TIntegerField
      FieldName = 'Sol_Analista'
    end
    object CDSCadastroSol_Anexo: TStringField
      FieldName = 'Sol_Anexo'
      Size = 200
    end
    object CDSCadastroSol_Cliente: TIntegerField
      FieldName = 'Sol_Cliente'
      Required = True
    end
    object CDSCadastroSol_Data: TDateField
      FieldName = 'Sol_Data'
      Required = True
      OnSetText = CDSCadastroSol_DataSetText
      EditMask = '##/##/####'
    end
    object CDSCadastroSol_Desenvolvedor: TIntegerField
      FieldName = 'Sol_Desenvolvedor'
    end
    object CDSCadastroSol_Hora: TTimeField
      FieldName = 'Sol_Hora'
      Required = True
      OnSetText = CDSCadastroSol_HoraSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCadastroSol_Modulo: TIntegerField
      FieldName = 'Sol_Modulo'
    end
    object CDSCadastroSol_Nivel: TIntegerField
      FieldName = 'Sol_Nivel'
    end
    object CDSCadastroSol_PrevisaoEntrega: TDateField
      FieldName = 'Sol_PrevisaoEntrega'
      OnSetText = CDSCadastroSol_PrevisaoEntregaSetText
      EditMask = '##/##/####'
    end
    object CDSCadastroSol_Produto: TIntegerField
      FieldName = 'Sol_Produto'
    end
    object CDSCadastroSol_Status: TIntegerField
      FieldName = 'Sol_Status'
      Required = True
    end
    object CDSCadastroSol_TempoPrevisto: TBCDField
      FieldName = 'Sol_TempoPrevisto'
      DisplayFormat = '#0.00'
      Precision = 5
      Size = 2
    end
    object CDSCadastroSol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
    end
    object CDSCadastroSol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSCadastroSol_UsuarioAbertura: TIntegerField
      FieldName = 'Sol_UsuarioAbertura'
      Required = True
    end
    object CDSCadastroSol_Versao: TStringField
      FieldName = 'Sol_Versao'
      Size = 25
    end
    object CDSCadastroSol_Contato: TStringField
      FieldName = 'Sol_Contato'
      Size = 100
    end
    object CDSCadastroSol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSCadastroSol_DescricaoLiberacao: TMemoField
      FieldName = 'Sol_DescricaoLiberacao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object CDSCadastroSol_Descricao: TMemoField
      FieldName = 'Sol_Descricao'
      BlobType = ftMemo
      Size = 2147483647
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
    object CDSCadastroTip_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Tip_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCadastroTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSCadastroUAb_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'UAb_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCadastroAnal_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Anal_Codigo'
      DisplayFormat = '0000'
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
    object CDSCadastroDesenv_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Desenv_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCadastroMod_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Mod_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCadastroMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Size = 100
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
    object CDSCadastroUAb_Nome: TWideStringField
      FieldName = 'UAb_Nome'
      Size = 100
    end
    object CDSCadastroAnal_Nome: TWideStringField
      FieldName = 'Anal_Nome'
      Size = 100
    end
    object CDSCadastroDesenv_Nome: TWideStringField
      FieldName = 'Desenv_Nome'
      Size = 100
    end
    object CDSCadastroSol_VersaoId: TIntegerField
      Alignment = taCenter
      FieldName = 'Sol_VersaoId'
      DisplayFormat = '000000'
    end
    object CDSCadastroVer_Versao: TStringField
      FieldName = 'Ver_Versao'
      Size = 25
    end
    object CDSCadastroSol_Categoria: TIntegerField
      FieldName = 'Sol_Categoria'
    end
    object CDSCadastroCat_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Cat_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroCat_Nome: TStringField
      FieldName = 'Cat_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object CDSCronogramaConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitaCronogramaCons'
    BeforePost = CDSCronogramaConsultaBeforePost
    OnNewRecord = CDSCronogramaConsultaNewRecord
    OnReconcileError = CDSCronogramaConsultaReconcileError
    Left = 152
    Top = 80
    object CDSCronogramaConsultaSCro_Id: TAutoIncField
      FieldName = 'SCro_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSCronogramaConsultaSCro_Data: TDateField
      FieldName = 'SCro_Data'
      OnSetText = CDSCronogramaConsultaSCro_DataSetText
      EditMask = '##/##/####'
    end
    object CDSCronogramaConsultaSCro_HoraFim: TTimeField
      FieldName = 'SCro_HoraFim'
      OnSetText = CDSCronogramaConsultaSCro_HoraFimSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCronogramaConsultaSCro_HoraInicio: TTimeField
      FieldName = 'SCro_HoraInicio'
      OnSetText = CDSCronogramaConsultaSCro_HoraInicioSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCronogramaConsultaSCro_Solicitacao: TIntegerField
      FieldName = 'SCro_Solicitacao'
      Required = True
    end
    object CDSCronogramaConsultaSCro_UsuarioOperacional: TIntegerField
      FieldName = 'SCro_UsuarioOperacional'
    end
    object CDSCronogramaConsultaUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      DisplayFormat = '0000'
    end
    object CDSCronogramaConsultaUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSOcorrenciaGeralConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitaOcorrenciaGeralCons'
    BeforePost = CDSOcorrenciaGeralConsultaBeforePost
    OnNewRecord = CDSOcorrenciaGeralConsultaNewRecord
    OnReconcileError = CDSOcorrenciaGeralConsultaReconcileError
    Left = 152
    Top = 136
    object CDSOcorrenciaGeralConsultaSOcor_Id: TAutoIncField
      FieldName = 'SOcor_Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CDSOcorrenciaGeralConsultaSOcor_Anexo: TStringField
      FieldName = 'SOcor_Anexo'
      Size = 200
    end
    object CDSOcorrenciaGeralConsultaSOcor_Classificacao: TIntegerField
      FieldName = 'SOcor_Classificacao'
      Required = True
    end
    object CDSOcorrenciaGeralConsultaSOcor_Data: TDateField
      FieldName = 'SOcor_Data'
      Required = True
      OnSetText = CDSOcorrenciaGeralConsultaSOcor_DataSetText
      EditMask = '##/##/####'
    end
    object CDSOcorrenciaGeralConsultaSOcor_Hora: TTimeField
      FieldName = 'SOcor_Hora'
      Required = True
      OnSetText = CDSOcorrenciaGeralConsultaSOcor_HoraSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSOcorrenciaGeralConsultaSOcor_Solicitacao: TIntegerField
      FieldName = 'SOcor_Solicitacao'
      Required = True
    end
    object CDSOcorrenciaGeralConsultaSOcor_Tipo: TIntegerField
      FieldName = 'SOcor_Tipo'
    end
    object CDSOcorrenciaGeralConsultaSOcor_UsuarioOperacional: TIntegerField
      FieldName = 'SOcor_UsuarioOperacional'
      Required = True
    end
    object CDSOcorrenciaGeralConsultaSOcor_Descricao: TMemoField
      FieldName = 'SOcor_Descricao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object CDSOcorrenciaGeralConsultaTip_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Tip_Codigo'
      DisplayFormat = '0000'
    end
    object CDSOcorrenciaGeralConsultaTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSOcorrenciaGeralConsultaUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      DisplayFormat = '0000'
    end
    object CDSOcorrenciaGeralConsultaUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSOcorrenciaTecnicaConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitaOcorrenciaTecnicaCons'
    BeforePost = CDSOcorrenciaTecnicaConsultaBeforePost
    OnNewRecord = CDSOcorrenciaTecnicaConsultaNewRecord
    OnReconcileError = CDSOcorrenciaTecnicaConsultaReconcileError
    Left = 152
    Top = 184
    object CDSOcorrenciaTecnicaConsultaSOcor_Id: TAutoIncField
      FieldName = 'SOcor_Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CDSOcorrenciaTecnicaConsultaSOcor_Anexo: TStringField
      FieldName = 'SOcor_Anexo'
      Size = 200
    end
    object CDSOcorrenciaTecnicaConsultaSOcor_Classificacao: TIntegerField
      FieldName = 'SOcor_Classificacao'
      Required = True
    end
    object CDSOcorrenciaTecnicaConsultaSOcor_Data: TDateField
      FieldName = 'SOcor_Data'
      Required = True
      OnSetText = CDSOcorrenciaTecnicaConsultaSOcor_DataSetText
      EditMask = '##/##/####'
    end
    object CDSOcorrenciaTecnicaConsultaSOcor_Hora: TTimeField
      FieldName = 'SOcor_Hora'
      Required = True
      OnSetText = CDSOcorrenciaTecnicaConsultaSOcor_HoraSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSOcorrenciaTecnicaConsultaSOcor_Solicitacao: TIntegerField
      FieldName = 'SOcor_Solicitacao'
      Required = True
    end
    object CDSOcorrenciaTecnicaConsultaSOcor_Tipo: TIntegerField
      FieldName = 'SOcor_Tipo'
    end
    object CDSOcorrenciaTecnicaConsultaSOcor_UsuarioOperacional: TIntegerField
      FieldName = 'SOcor_UsuarioOperacional'
      Required = True
    end
    object CDSOcorrenciaTecnicaConsultaSOcor_Descricao: TMemoField
      FieldName = 'SOcor_Descricao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object CDSOcorrenciaTecnicaConsultaTip_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Tip_Codigo'
      DisplayFormat = '0000'
    end
    object CDSOcorrenciaTecnicaConsultaTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Size = 50
    end
    object CDSOcorrenciaTecnicaConsultaUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      DisplayFormat = '0000'
    end
    object CDSOcorrenciaTecnicaConsultaUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSStatusConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitaStatusCons'
    Left = 152
    Top = 240
    object CDSStatusConsultaSSta_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'SSta_Data'
      Required = True
    end
    object CDSStatusConsultaSta_Nome: TWideStringField
      DisplayLabel = 'Status'
      FieldName = 'Sta_Nome'
      Size = 50
    end
    object CDSStatusConsultaUsu_nome: TWideStringField
      DisplayLabel = 'Operador'
      FieldName = 'Usu_nome'
      Size = 100
    end
    object CDSStatusConsultaSSta_Hora: TTimeField
      DisplayLabel = 'Hora'
      FieldName = 'SSta_Hora'
      DisplayFormat = 'hh:mm'
    end
  end
  object CDSSolicitacaoQuadro1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro1'
    Left = 288
    Top = 32
    object CDSSolicitacaoQuadro1Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro1Sol_Titulo: TStringField
      DisplayLabel = 'Titulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro1Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro1Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro1Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro2'
    Left = 288
    Top = 80
    object CDSSolicitacaoQuadro2Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro2Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro2Sol_Titulo: TStringField
      DisplayLabel = 'Titulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro2Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro2Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro3: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro3'
    Left = 288
    Top = 136
    object CDSSolicitacaoQuadro3Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro3Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro3Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro3Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro3Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro4: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro4'
    Left = 288
    Top = 192
    object CDSSolicitacaoQuadro4Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro4Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro4Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro4Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro4Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro5: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro5'
    Left = 288
    Top = 248
    object CDSSolicitacaoQuadro5Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro5Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro5Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro5Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro5Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro6: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro6'
    Left = 288
    Top = 304
    object CDSSolicitacaoQuadro6Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro6Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro6Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro6Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro6Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro7: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro7'
    Left = 392
    Top = 32
    object CDSSolicitacaoQuadro7Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro7Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro7Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro7Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro7Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro8: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro8'
    Left = 392
    Top = 88
    object CDSSolicitacaoQuadro8Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro8Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro8Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro8Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro8Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro9: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro9'
    Left = 392
    Top = 144
    object CDSSolicitacaoQuadro9Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro9Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro9Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro9Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro9Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro10: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro10'
    Left = 392
    Top = 200
    object CDSSolicitacaoQuadro10Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro10Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro10Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro10Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro10Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro11: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro11'
    Left = 392
    Top = 256
    object CDSSolicitacaoQuadro11Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro11Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro11Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro11Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro11Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoQuadro12: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro12'
    Left = 392
    Top = 304
    object CDSSolicitacaoQuadro12Sol_Id: TAutoIncField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoQuadro12Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro12Cli_Nome: TWideStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoQuadro12Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object CDSSolicitacaoQuadro12Usu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
  end
  object CDSSolicitacaoAnexo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoAnexo'
    Left = 152
    Top = 296
    object CDSSolicitacaoAnexoSol_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSSolicitacaoAnexoSol_Data: TDateField
      FieldName = 'Sol_Data'
      Required = True
    end
    object CDSSolicitacaoAnexoSol_Hora: TTimeField
      Alignment = taCenter
      FieldName = 'Sol_Hora'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSSolicitacaoAnexoSol_Contato: TStringField
      FieldName = 'Sol_Contato'
      Size = 100
    end
    object CDSSolicitacaoAnexoSol_Anexo: TStringField
      FieldName = 'Sol_Anexo'
      Size = 200
    end
    object CDSSolicitacaoAnexoCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object CDSSolicitacaoAnexoSOcor_Data: TDateField
      FieldName = 'SOcor_Data'
      Required = True
    end
    object CDSSolicitacaoAnexoSOcor_Hora: TTimeField
      Alignment = taCenter
      FieldName = 'SOcor_Hora'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSSolicitacaoAnexoTipo: TStringField
      FieldName = 'Tipo'
      ReadOnly = True
      Required = True
      Size = 7
    end
    object CDSSolicitacaoAnexoSOcor_Anexo: TStringField
      FieldName = 'SOcor_Anexo'
      Size = 200
    end
  end
  object cdsQuadro1: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 32
    object cdsQuadro1Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro1Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro1Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro1Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro1Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro1Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro1Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro1Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro1Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro2: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 88
    object cdsQuadro2Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro2Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro2Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro2Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro2Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro2Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro2Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro2Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro2Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro3: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 144
    object cdsQuadro3Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro3Sol_Titulo: TStringField
      DisplayLabel = 'Titulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro3Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro3Sol_UsuarioAtendeAtual: TIntegerField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro3Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro3Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro3Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro3Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro3Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro4: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 200
    object cdsQuadro4Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro4Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro4Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro4Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro4Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro4Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro4Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro4Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro4Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro5: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 256
    object cdsQuadro5Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro5Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro5Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro5Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro5Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro5Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro5Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro5Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro5Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro6: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 528
    Top = 312
    object cdsQuadro6Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro6Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro6Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro6Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro6Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro6Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro6Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro6Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro6Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro7: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 32
    object cdsQuadro7Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro7Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro7Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro7Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro7Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro7Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro7Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro7Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro7Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro8: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 88
    object cdsQuadro8Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro8Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro8Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro8Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro8Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro8Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro8Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro8Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro8Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro9: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 144
    object cdsQuadro9Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro9Sol_Titulo: TStringField
      DisplayLabel = 'Titulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro9Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro9Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro9Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro9Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro9Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro9Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro9Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro10: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 200
    object cdsQuadro10Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro10Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro10Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro10Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro10Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro10Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro10Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro10Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro10Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro11: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 256
    object cdsQuadro11Sol_Id: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'Id'
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro11Sol_Titulo: TStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro11Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro11Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro11Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro11Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro11Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro11Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro11Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro12: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 608
    Top = 312
    object cdsQuadro12Sol_Id: TIntegerField
      Alignment = taCenter
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object cdsQuadro12Sol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object cdsQuadro12Cli_Nome: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object cdsQuadro12Sol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
    end
    object cdsQuadro12Usu_Nome: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object cdsQuadro12Nivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
    end
    object cdsQuadro12Aberta: TIntegerField
      FieldName = 'Aberta'
    end
    object cdsQuadro12Sol_StatusId: TIntegerField
      FieldName = 'Sol_StatusId'
    end
    object cdsQuadro12Cli_Perfil: TStringField
      Alignment = taCenter
      FieldName = 'Cli_Perfil'
    end
  end
  object cdsQuadro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoQuadro'
    Left = 568
    Top = 8
    object cdsQuadroQuadro: TStringField
      FieldName = 'Quadro'
      ReadOnly = True
      Required = True
      Size = 3
    end
    object cdsQuadroSol_Id: TIntegerField
      FieldName = 'Sol_Id'
      ReadOnly = True
      Required = True
    end
    object cdsQuadroSol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      ReadOnly = True
      Required = True
      Size = 100
    end
    object cdsQuadroSol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
      ReadOnly = True
    end
    object cdsQuadroCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      ReadOnly = True
      Size = 100
    end
    object cdsQuadroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      ReadOnly = True
      Size = 100
    end
    object cdsQuadroNivel: TIntegerField
      Alignment = taCenter
      FieldName = 'Nivel'
      ReadOnly = True
    end
    object cdsQuadroAberta: TIntegerField
      FieldName = 'Aberta'
      ReadOnly = True
    end
    object cdsQuadroSol_Status: TIntegerField
      FieldName = 'Sol_Status'
      ReadOnly = True
      Required = True
    end
  end
  object CDSTempo: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 288
    object CDSTempoSTemp_Id: TIntegerField
      FieldName = 'STemp_Id'
    end
    object CDSTempoSTemp_Solicitacao: TIntegerField
      FieldName = 'STemp_Solicitacao'
    end
    object CDSTempoSTemp_UsuarioOperacional: TIntegerField
      FieldName = 'STemp_UsuarioOperacional'
    end
    object CDSTempoSTemp_Data: TDateField
      FieldName = 'STemp_Data'
    end
    object CDSTempoSTemp_HoraInicio: TTimeField
      Alignment = taCenter
      FieldName = 'STemp_HoraInicio'
      DisplayFormat = 'hh:mm'
    end
    object CDSTempoSTemp_HoraFim: TTimeField
      Alignment = taCenter
      FieldName = 'STemp_HoraFim'
      DisplayFormat = 'hh:mm'
    end
    object CDSTempoUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
    end
    object CDSTempoUsu_Nome: TStringField
      FieldName = 'Usu_Nome'
      Size = 100
    end
    object CDSTempoSol_Id: TIntegerField
      Alignment = taCenter
      FieldName = 'Sol_Id'
      DisplayFormat = '000000'
    end
    object CDSTempoSol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Size = 100
    end
    object CDSTempoSol_Cliente: TIntegerField
      FieldName = 'Sol_Cliente'
    end
    object CDSTempoSTemp_TotalHoras: TFloatField
      FieldName = 'STemp_TotalHoras'
    end
    object CDSTempoSTemp_Status: TIntegerField
      FieldName = 'STemp_Status'
    end
    object CDSTempoSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
    end
    object CDSTempoSta_Nome: TStringField
      FieldName = 'Sta_Nome'
      Size = 50
    end
    object CDSTempoCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
    end
    object CDSTempoCli_Nome: TStringField
      FieldName = 'Cli_Nome'
      Size = 100
    end
    object CDSTempoPrograma: TStringField
      FieldName = 'Programa'
    end
  end
  object CDSOcorrenciaRegraConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitaOcorrenciaRegraCons'
    BeforePost = CDSOcorrenciaRegraConsultaBeforePost
    OnNewRecord = CDSOcorrenciaRegraConsultaNewRecord
    OnReconcileError = CDSOcorrenciaRegraConsultaReconcileError
    Left = 152
    Top = 352
    object CDSOcorrenciaRegraConsultaSOcor_Anexo: TStringField
      FieldName = 'SOcor_Anexo'
      Size = 200
    end
    object CDSOcorrenciaRegraConsultaSOcor_Classificacao: TIntegerField
      FieldName = 'SOcor_Classificacao'
      Required = True
    end
    object CDSOcorrenciaRegraConsultaSOcor_Data: TDateField
      FieldName = 'SOcor_Data'
      Required = True
      OnSetText = CDSOcorrenciaRegraConsultaSOcor_DataSetText
      EditMask = '##/##/####'
    end
    object CDSOcorrenciaRegraConsultaSOcor_Descricao: TMemoField
      FieldName = 'SOcor_Descricao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object CDSOcorrenciaRegraConsultaSOcor_Hora: TTimeField
      FieldName = 'SOcor_Hora'
      Required = True
      OnSetText = CDSOcorrenciaRegraConsultaSOcor_HoraSetText
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSOcorrenciaRegraConsultaSOcor_Id: TAutoIncField
      FieldName = 'SOcor_Id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object CDSOcorrenciaRegraConsultaSOcor_Solicitacao: TIntegerField
      FieldName = 'SOcor_Solicitacao'
      Required = True
    end
    object CDSOcorrenciaRegraConsultaSOcor_Tipo: TIntegerField
      FieldName = 'SOcor_Tipo'
    end
    object CDSOcorrenciaRegraConsultaSOcor_UsuarioOperacional: TIntegerField
      FieldName = 'SOcor_UsuarioOperacional'
      Required = True
    end
    object CDSOcorrenciaRegraConsultaTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      ProviderFlags = []
    end
    object CDSOcorrenciaRegraConsultaTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object CDSOcorrenciaRegraConsultaUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSOcorrenciaRegraConsultaUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object CDSListarProblemaSolucao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoProblemaSolucao'
    RemoteServer = DM.DSPConexao
    Left = 288
    Top = 352
    object CDSListarProblemaSolucaoSol_Id: TAutoIncField
      Alignment = taCenter
      FieldName = 'Sol_Id'
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object CDSListarProblemaSolucaoSol_Data: TDateField
      FieldName = 'Sol_Data'
      Required = True
      EditMask = '##/##/####'
    end
    object CDSListarProblemaSolucaoSol_Hora: TTimeField
      FieldName = 'Sol_Hora'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSListarProblemaSolucaoSol_Descricao: TMemoField
      FieldName = 'Sol_Descricao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object CDSListarProblemaSolucaoSol_DescricaoLiberacao: TMemoField
      FieldName = 'Sol_DescricaoLiberacao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object CDSListarProblemaSolucaoDescricaoOco: TMemoField
      FieldName = 'DescricaoOco'
      BlobType = ftMemo
      Size = 2147483647
    end
    object CDSListarProblemaSolucaoSOcor_Classificacao: TIntegerField
      FieldName = 'SOcor_Classificacao'
      Required = True
    end
    object CDSListarProblemaSolucaoDataOco: TDateField
      FieldName = 'DataOco'
      Required = True
      EditMask = '##/##/####'
    end
    object CDSListarProblemaSolucaoHoraOco: TTimeField
      FieldName = 'HoraOco'
      Required = True
      DisplayFormat = 'hh:mm'
    end
  end
end
