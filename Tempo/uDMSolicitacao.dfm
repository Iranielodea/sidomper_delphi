object dmSolicitacao: TdmSolicitacao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 214
  Width = 333
  object cdsCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSolicitacaoCad'
    RemoteServer = DM.DSPConexao
    Left = 32
    Top = 16
    object cdsCadastroSol_Id: TAutoIncField
      FieldName = 'Sol_Id'
      Origin = 'Sol_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cdsCadastroSol_Analista: TIntegerField
      FieldName = 'Sol_Analista'
      Origin = 'Sol_Analista'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadastroSol_Anexo: TStringField
      FieldName = 'Sol_Anexo'
      Origin = 'Sol_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object cdsCadastroSol_Cliente: TIntegerField
      FieldName = 'Sol_Cliente'
      Origin = 'Sol_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCadastroSol_Data: TDateField
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCadastroSol_Desenvolvedor: TIntegerField
      FieldName = 'Sol_Desenvolvedor'
      Origin = 'Sol_Desenvolvedor'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadastroSol_Hora: TTimeField
      FieldName = 'Sol_Hora'
      Origin = 'Sol_Hora'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCadastroSol_Modulo: TIntegerField
      FieldName = 'Sol_Modulo'
      Origin = 'Sol_Modulo'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadastroSol_Nivel: TIntegerField
      FieldName = 'Sol_Nivel'
      Origin = 'Sol_Nivel'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadastroSol_PrevisaoEntrega: TDateField
      FieldName = 'Sol_PrevisaoEntrega'
      Origin = 'Sol_PrevisaoEntrega'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadastroSol_Produto: TIntegerField
      FieldName = 'Sol_Produto'
      Origin = 'Sol_Produto'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadastroSol_Status: TIntegerField
      FieldName = 'Sol_Status'
      Origin = 'Sol_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCadastroSol_TempoPrevisto: TBCDField
      FieldName = 'Sol_TempoPrevisto'
      Origin = 'Sol_TempoPrevisto'
      ProviderFlags = [pfInUpdate]
      Precision = 5
      Size = 2
    end
    object cdsCadastroSol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
      Origin = 'Sol_Tipo'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadastroSol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Origin = 'Sol_Titulo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object cdsCadastroSol_UsuarioAbertura: TIntegerField
      FieldName = 'Sol_UsuarioAbertura'
      Origin = 'Sol_UsuarioAbertura'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object cdsCadastroSol_Versao: TStringField
      FieldName = 'Sol_Versao'
      Origin = 'Sol_Versao'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object cdsCadastroSol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
      Origin = 'Sol_UsuarioAtendeAtual'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadastroSol_Contato: TStringField
      FieldName = 'Sol_Contato'
      Origin = 'Sol_Contato'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object cdsCadastroSol_Descricao: TMemoField
      FieldName = 'Sol_Descricao'
      Origin = 'Sol_Descricao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 2147483647
    end
    object cdsCadastroSol_DescricaoLiberacao: TMemoField
      FieldName = 'Sol_DescricaoLiberacao'
      Origin = 'Sol_DescricaoLiberacao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 2147483647
    end
    object cdsCadastroSol_VersaoId: TIntegerField
      FieldName = 'Sol_VersaoId'
      Origin = 'Sol_VersaoId'
      ProviderFlags = [pfInUpdate]
    end
    object cdsCadastroProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
      ProviderFlags = []
    end
    object cdsCadastroProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object cdsCadastroSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = []
    end
    object cdsCadastroSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = []
      Size = 50
    end
    object cdsCadastroTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
    end
    object cdsCadastroTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object cdsCadastroUAb_Codigo: TIntegerField
      FieldName = 'UAb_Codigo'
      Origin = 'UAb_Codigo'
      ProviderFlags = []
    end
    object cdsCadastroAnal_Codigo: TIntegerField
      FieldName = 'Anal_Codigo'
      Origin = 'Anal_Codigo'
      ProviderFlags = []
    end
    object cdsCadastroCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      ProviderFlags = []
    end
    object cdsCadastroCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      ProviderFlags = []
      Size = 100
    end
    object cdsCadastroDesenv_Codigo: TIntegerField
      FieldName = 'Desenv_Codigo'
      Origin = 'Desenv_Codigo'
      ProviderFlags = []
    end
    object cdsCadastroMod_Codigo: TIntegerField
      FieldName = 'Mod_Codigo'
      Origin = 'Mod_Codigo'
      ProviderFlags = []
    end
    object cdsCadastroMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object cdsCadastroUAb_Nome: TWideStringField
      FieldName = 'UAb_Nome'
      Origin = 'UAb_Nome'
      ProviderFlags = []
      Size = 100
    end
    object cdsCadastroAnal_Nome: TWideStringField
      FieldName = 'Anal_Nome'
      Origin = 'Anal_Nome'
      ProviderFlags = []
      Size = 100
    end
    object cdsCadastroDesenv_Nome: TWideStringField
      FieldName = 'Desenv_Nome'
      Origin = 'Desenv_Nome'
      ProviderFlags = []
      Size = 100
    end
    object cdsCadastroVer_Versao: TStringField
      FieldName = 'Ver_Versao'
      Origin = 'Ver_Versao'
      ProviderFlags = []
      Size = 25
    end
  end
end
