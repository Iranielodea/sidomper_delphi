object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 818
  Width = 1008
  object QRevendaCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Rev_Ativo,'
      #9'Rev_Codigo,'
      #9'Rev_Id,'
      #9'Rev_Nome'#9
      'FROM Revenda'
      #9'WHERE Rev_Id = :Id')
    Left = 48
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QRevendaCadRev_Id: TFDAutoIncField
      FieldName = 'Rev_Id'
      Origin = 'Rev_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QRevendaCadRev_Ativo: TBooleanField
      FieldName = 'Rev_Ativo'
      Origin = 'Rev_Ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QRevendaCadRev_Codigo: TIntegerField
      FieldName = 'Rev_Codigo'
      Origin = 'Rev_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QRevendaCadRev_Nome: TWideStringField
      FieldName = 'Rev_Nome'
      Origin = 'Rev_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object dspRevendaCad: TDataSetProvider
    DataSet = QRevendaCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspRevendaCadUpdateError
    Left = 80
    Top = 16
  end
  object QRevendaCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      '        Rev_Ativo,'
      #9'Rev_Codigo,'
      #9'Rev_Id,'
      #9'Rev_Nome'#9
      'FROM Revenda')
    Left = 136
    Top = 16
  end
  object dspRevendaCons: TDataSetProvider
    DataSet = QRevendaCons
    Left = 168
    Top = 16
  end
  object QUsuarioCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Usu_Adm,'
      #9'Usu_Ativo,'
      #9'Usu_Cliente,'
      #9'Usu_Codigo,'
      #9'Usu_Departamento,'
      #9'Usu_Email,'
      #9'Usu_Id,'
      #9'Usu_Nome,'
      #9'Usu_Notificar,'
      #9'Usu_OnLine,'
      #9'Usu_Password,'
      #9'Usu_Revenda,'
      #9'Usu_UserName,'
      '        Usu_ContaEmail,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Dep_Codigo,'
      #9'Dep_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome,'
      #9'CtaEm_Codigo,'
      #9'CtaEm_Nome'
      'FROM Usuario'
      #9'LEFT JOIN Departamento ON Usu_Departamento = Dep_Id'
      #9'LEFT JOIN Cliente ON Usu_Cliente = Cli_Id'
      #9'LEFT JOIN Revenda ON Usu_Revenda = Rev_Id'
      #9'LEFT JOIN Conta_Email On Usu_ContaEmail = CtaEm_Id'
      'WHERE Usu_Id = :Id')
    Left = 48
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QUsuarioCadUsu_Id: TFDAutoIncField
      FieldName = 'Usu_Id'
      Origin = 'Usu_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QUsuarioCadUsu_Adm: TBooleanField
      FieldName = 'Usu_Adm'
      Origin = 'Usu_Adm'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QUsuarioCadUsu_Ativo: TBooleanField
      FieldName = 'Usu_Ativo'
      Origin = 'Usu_Ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QUsuarioCadUsu_Cliente: TIntegerField
      FieldName = 'Usu_Cliente'
      Origin = 'Usu_Cliente'
      ProviderFlags = [pfInUpdate]
    end
    object QUsuarioCadUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QUsuarioCadUsu_Departamento: TIntegerField
      FieldName = 'Usu_Departamento'
      Origin = 'Usu_Departamento'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QUsuarioCadUsu_Email: TWideStringField
      FieldName = 'Usu_Email'
      Origin = 'Usu_Email'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object QUsuarioCadUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object QUsuarioCadUsu_Notificar: TBooleanField
      FieldName = 'Usu_Notificar'
      Origin = 'Usu_Notificar'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QUsuarioCadUsu_OnLine: TBooleanField
      FieldName = 'Usu_OnLine'
      Origin = 'Usu_OnLine'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QUsuarioCadUsu_Password: TWideStringField
      FieldName = 'Usu_Password'
      Origin = 'Usu_Password'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object QUsuarioCadUsu_Revenda: TIntegerField
      FieldName = 'Usu_Revenda'
      Origin = 'Usu_Revenda'
      ProviderFlags = [pfInUpdate]
    end
    object QUsuarioCadUsu_UserName: TWideStringField
      FieldName = 'Usu_UserName'
      Origin = 'Usu_UserName'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object QUsuarioCadUsu_ContaEmail: TIntegerField
      FieldName = 'Usu_ContaEmail'
      Origin = 'Usu_ContaEmail'
      ProviderFlags = [pfInUpdate]
    end
    object QUsuarioCadCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      ProviderFlags = []
    end
    object QUsuarioCadCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QUsuarioCadDep_Codigo: TIntegerField
      FieldName = 'Dep_Codigo'
      Origin = 'Dep_Codigo'
      ProviderFlags = []
    end
    object QUsuarioCadDep_Nome: TWideStringField
      FieldName = 'Dep_Nome'
      Origin = 'Dep_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QUsuarioCadRev_Codigo: TIntegerField
      FieldName = 'Rev_Codigo'
      Origin = 'Rev_Codigo'
      ProviderFlags = []
    end
    object QUsuarioCadRev_Nome: TWideStringField
      FieldName = 'Rev_Nome'
      Origin = 'Rev_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QUsuarioCadCtaEm_Codigo: TIntegerField
      FieldName = 'CtaEm_Codigo'
      Origin = 'CtaEm_Codigo'
      ProviderFlags = []
    end
    object QUsuarioCadCtaEm_Nome: TStringField
      FieldName = 'CtaEm_Nome'
      Origin = 'CtaEm_Nome'
      ProviderFlags = []
      Size = 60
    end
  end
  object QUsuarioCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      '  Usu_id,'
      '  Usu_Codigo,'
      '  Usu_Nome,'
      '  Usu_Ativo,'
      '  Usu_Email,'
      '  CtaEm_Codigo'
      'FROM Usuario'
      '  LEFT JOIN Conta_Email ON Usu_ContaEmail = CtaEm_Id')
    Left = 136
    Top = 64
  end
  object dspUsuarioCad: TDataSetProvider
    DataSet = QUsuarioCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspUsuarioCadUpdateError
    Left = 80
    Top = 64
  end
  object dspUsuarioCons: TDataSetProvider
    DataSet = QUsuarioCons
    Left = 168
    Top = 64
  end
  object QDepartamentoCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Dep_Ativo,'
      #9'Dep_Codigo,'
      #9'Dep_Id,'
      #9'Dep_Nome,'
      #9'Dep_SolicitaAbertura,'
      #9'Dep_SolicitaAnalise,'
      #9'Dep_SolicitaOcorGeral,'
      #9'Dep_SolicitaOcorTecnica,'
      #9'Dep_SolicitaQuadro,'
      #9'Dep_SolicitaStatus,'
      #9'Dep_ChamadoAbertura,'
      #9'Dep_ChamadoQuadro,'
      #9'Dep_ChamadoStatus,'
      '  Dep_ChamadoOcor,'
      #9'Dep_AtividadeAbertura,'
      #9'Dep_AtividadeStatus,'
      #9'Dep_AtividadeQuadro,'
      #9'Dep_AtividadeOcor,'
      '  Dep_AgendamentoQuadro,'
      '  Dep_MostrarAnexos,'
      '  Dep_HoraAtendeInicial,'
      '  Dep_HoraAtendeFinal,'
      '  Dep_SolicitaOcorRegra'
      'FROM Departamento'
      #9'WHERE Dep_Id = :Id')
    Left = 48
    Top = 112
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QDepartamentoCadDep_Id: TFDAutoIncField
      FieldName = 'Dep_Id'
      Origin = 'Dep_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QDepartamentoCadDep_Ativo: TBooleanField
      FieldName = 'Dep_Ativo'
      Origin = 'Dep_Ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_Codigo: TIntegerField
      FieldName = 'Dep_Codigo'
      Origin = 'Dep_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_Nome: TWideStringField
      FieldName = 'Dep_Nome'
      Origin = 'Dep_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object QDepartamentoCadDep_SolicitaAbertura: TBooleanField
      FieldName = 'Dep_SolicitaAbertura'
      Origin = 'Dep_SolicitaAbertura'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_SolicitaAnalise: TBooleanField
      FieldName = 'Dep_SolicitaAnalise'
      Origin = 'Dep_SolicitaAnalise'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_SolicitaOcorGeral: TBooleanField
      FieldName = 'Dep_SolicitaOcorGeral'
      Origin = 'Dep_SolicitaOcorGeral'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_SolicitaOcorTecnica: TBooleanField
      FieldName = 'Dep_SolicitaOcorTecnica'
      Origin = 'Dep_SolicitaOcorTecnica'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_SolicitaQuadro: TBooleanField
      FieldName = 'Dep_SolicitaQuadro'
      Origin = 'Dep_SolicitaQuadro'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_SolicitaStatus: TBooleanField
      FieldName = 'Dep_SolicitaStatus'
      Origin = 'Dep_SolicitaStatus'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_ChamadoAbertura: TBooleanField
      FieldName = 'Dep_ChamadoAbertura'
      Origin = 'Dep_ChamadoAbertura'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_ChamadoQuadro: TBooleanField
      FieldName = 'Dep_ChamadoQuadro'
      Origin = 'Dep_ChamadoQuadro'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_ChamadoStatus: TBooleanField
      FieldName = 'Dep_ChamadoStatus'
      Origin = 'Dep_ChamadoStatus'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_ChamadoOcor: TBooleanField
      FieldName = 'Dep_ChamadoOcor'
      Origin = 'Dep_ChamadoOcor'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoCadDep_AtividadeAbertura: TBooleanField
      FieldName = 'Dep_AtividadeAbertura'
      Origin = 'Dep_AtividadeAbertura'
      ProviderFlags = [pfInUpdate]
    end
    object QDepartamentoCadDep_AtividadeStatus: TBooleanField
      FieldName = 'Dep_AtividadeStatus'
      Origin = 'Dep_AtividadeStatus'
      ProviderFlags = [pfInUpdate]
    end
    object QDepartamentoCadDep_AtividadeQuadro: TBooleanField
      FieldName = 'Dep_AtividadeQuadro'
      Origin = 'Dep_AtividadeQuadro'
      ProviderFlags = [pfInUpdate]
    end
    object QDepartamentoCadDep_AtividadeOcor: TBooleanField
      FieldName = 'Dep_AtividadeOcor'
      Origin = 'Dep_AtividadeOcor'
      ProviderFlags = [pfInUpdate]
    end
    object QDepartamentoCadDep_AgendamentoQuadro: TBooleanField
      FieldName = 'Dep_AgendamentoQuadro'
      Origin = 'Dep_AgendamentoQuadro'
      ProviderFlags = [pfInUpdate]
    end
    object QDepartamentoCadDep_MostrarAnexos: TBooleanField
      FieldName = 'Dep_MostrarAnexos'
      Origin = 'Dep_MostrarAnexos'
      ProviderFlags = [pfInUpdate]
    end
    object QDepartamentoCadDep_SolicitaOcorRegra: TBooleanField
      FieldName = 'Dep_SolicitaOcorRegra'
      Origin = 'Dep_SolicitaOcorRegra'
      ProviderFlags = [pfInUpdate]
    end
    object QDepartamentoCadDep_HoraAtendeInicial: TTimeField
      FieldName = 'Dep_HoraAtendeInicial'
      Origin = 'Dep_HoraAtendeInicial'
      ProviderFlags = [pfInUpdate]
    end
    object QDepartamentoCadDep_HoraAtendeFinal: TTimeField
      FieldName = 'Dep_HoraAtendeFinal'
      Origin = 'Dep_HoraAtendeFinal'
      ProviderFlags = [pfInUpdate]
    end
  end
  object QDepartamentoCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Dep_Codigo,'
      #9'Dep_Id,'
      #9'Dep_Nome,'
      '        Dep_Ativo'
      'FROM Departamento')
    Left = 136
    Top = 112
  end
  object dspDepartamentoCad: TDataSetProvider
    DataSet = QDepartamentoCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspDepartamentoCadUpdateError
    Left = 80
    Top = 112
  end
  object dspDepartamentoCons: TDataSetProvider
    DataSet = QDepartamentoCons
    Left = 168
    Top = 112
  end
  object QDepartamentoAcesso: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'DepAc_Acesso,'
      #9'DepAc_Departamento,'
      #9'DepAc_Editar,'
      #9'DepAc_Excluir,'
      #9'DepAc_Id,'
      #9'DepAc_Incluir,'
      #9'DepAc_Programa,'
      #9'DepAc_Relatorio,'
      #9'CASE DepAc_Programa'
      '                WHEN 1   THEN '#39'Chamados'#39
      '                WHEN 2   THEN '#39'Visitas'#39
      '                WHEN 3   THEN '#39'Solicita'#231#245'es'#39
      '                WHEN 4   THEN '#39'Vers'#245'es'#39
      '                WHEN 6   THEN '#39'Base Conh.'#39
      #9#9'WHEN 100 THEN '#39'Revenda'#39
      #9#9'WHEN 101 THEN '#39'Produto'#39
      #9#9'WHEN 102 THEN '#39'M'#243'dulo'#39
      #9#9'WHEN 103 THEN '#39'Cliente'#39
      #9#9'WHEN 104 THEN '#39'Usu'#225'rio'#39
      #9#9'WHEN 105 THEN '#39'Departamento'#39
      #9#9'WHEN 106 THEN '#39'Tipo'#39
      #9#9'WHEN 107 THEN '#39'Status'#39
      '                WHEN 108 THEN '#39'Especifica'#231#245'es'#39
      '                WHEN 109 THEN '#39'Par'#226'metros'#39
      '                WHEN 110 THEN '#39'Contas Email'#39
      '                WHEN 111 THEN '#39'Atividades'#39
      '                WHEN 112 THEN '#39'Agendamento'#39
      '                WHEN 114 THEN '#39'Or'#231'amento'#39'                '
      '                WHEN 115 THEN '#39'FormaPagto'#39
      '                WHEN 116 THEN '#39'Observa'#231#227'o'#39
      '                WHEN 117 THEN '#39'Mod.Relat'#243'rio'#39
      '                WHEN 118 THEN '#39'Ramais'#39
      '                WHEN 119 THEN '#39'Recados'#39
      '                WHEN 120 THEN '#39'Escalas'#39
      '                WHEN 121 THEN '#39'Cidades'#39
      '                WHEN 122 THEN '#39'Licen'#231'as'#39
      '                WHEN 123 THEN '#39'Feriados'#39
      '                WHEN 124 THEN '#39'Categorias'#39
      '                WHEN 125 THEN '#39'Tab.Pre'#231'os'#39
      #9'END AS Programa'
      'FROM Departamento_Acesso'
      '        WHERE DepAc_Departamento = :IdDepartamento')
    Left = 48
    Top = 168
    ParamData = <
      item
        Name = 'IDDEPARTAMENTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspDepartamentoAcesso: TDataSetProvider
    DataSet = QDepartamentoAcesso
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 168
  end
  object QProdutoCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Prod_Ativo,'
      #9'Prod_Codigo,'
      #9'Prod_Id,'
      #9'Prod_Nome'
      'FROM Produto'
      #9'WHERE Prod_Id = :Id')
    Left = 48
    Top = 216
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QProdutoCadProd_Id: TFDAutoIncField
      FieldName = 'Prod_Id'
      Origin = 'Prod_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QProdutoCadProd_Ativo: TBooleanField
      FieldName = 'Prod_Ativo'
      Origin = 'Prod_Ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QProdutoCadProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QProdutoCadProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object QProdutoCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Prod_Codigo,'
      #9'Prod_Id,'
      #9'Prod_Nome,'
      '        Prod_Ativo'
      'FROM Produto')
    Left = 136
    Top = 216
  end
  object dspProdutoCad: TDataSetProvider
    DataSet = QProdutoCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspProdutoCadUpdateError
    AfterUpdateRecord = dspProdutoCadAfterUpdateRecord
    Left = 80
    Top = 216
  end
  object dspProdutoCons: TDataSetProvider
    DataSet = QProdutoCons
    Left = 168
    Top = 216
  end
  object QModuloCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Mod_Ativo,'
      #9'Mod_Codigo,'
      #9'Mod_Id,'
      #9'Mod_Nome'
      'FROM Modulo'
      #9'WHERE Mod_Id = :Id')
    Left = 48
    Top = 264
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QModuloCadMod_Id: TFDAutoIncField
      FieldName = 'Mod_Id'
      Origin = 'Mod_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QModuloCadMod_Ativo: TBooleanField
      FieldName = 'Mod_Ativo'
      Origin = 'Mod_Ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QModuloCadMod_Codigo: TIntegerField
      FieldName = 'Mod_Codigo'
      Origin = 'Mod_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QModuloCadMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
  end
  object QModuloCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'#9
      #9'Mod_Codigo,'
      #9'Mod_Id,'
      #9'Mod_Nome,'
      '        Mod_Ativo'
      'FROM Modulo')
    Left = 136
    Top = 264
  end
  object dspModuloCad: TDataSetProvider
    DataSet = QModuloCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspModuloCadUpdateError
    Left = 80
    Top = 264
  end
  object dspModuloCons: TDataSetProvider
    DataSet = QModuloCons
    Left = 168
    Top = 264
  end
  object dspTipoCad: TDataSetProvider
    DataSet = QTipoCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspTipoCadUpdateError
    Left = 80
    Top = 312
  end
  object dspTipoCons: TDataSetProvider
    DataSet = QTipoCons
    Left = 168
    Top = 312
  end
  object QTipoCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'#9
      #9'Tip_Ativo,'
      #9'Tip_Codigo,'
      #9'Tip_Id,'
      #9'Tip_Nome,'
      #9'Tip_Programa,'
      '        Tip_Conceito'#9#9
      'FROM Tipo'
      #9'WHERE Tip_Id = :Id')
    Left = 48
    Top = 312
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QTipoCadTip_Id: TFDAutoIncField
      FieldName = 'Tip_Id'
      Origin = 'Tip_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QTipoCadTip_Ativo: TBooleanField
      FieldName = 'Tip_Ativo'
      Origin = 'Tip_Ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QTipoCadTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QTipoCadTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object QTipoCadTip_Programa: TIntegerField
      FieldName = 'Tip_Programa'
      Origin = 'Tip_Programa'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QTipoCadTip_Conceito: TStringField
      FieldName = 'Tip_Conceito'
      Origin = 'Tip_Conceito'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object QTipoCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Tip_Codigo,'
      #9'Tip_Id,'
      #9'Tip_Nome,'
      '        Tip_Ativo,'
      #9'Tip_Programa,'
      #9'CASE Tip_Programa'
      #9#9'WHEN 1 THEN '#39'1-Chamado'#39
      #9#9'WHEN 2 THEN '#39'2-Visita'#39
      #9#9'WHEN 3 THEN '#39'3-Solicita'#231#227'o'#39
      #9#9'WHEN 4 THEN '#39'4-Vers'#227'o'#39
      #9#9'WHEN 5 THEN '#39'5-Qualidade'#39
      #9#9'WHEN 6 THEN '#39'6-Base de Conhecimento'#39
      '    WHEN 7 THEN '#39'7-Atividade'#39
      '    WHEN 8 THEN '#39'8-Agendamento'#39
      '    WHEN 9 THEN '#39'9-Or'#231'amento'#39
      '    WHEN 11 THEN '#39'11-Tabela de Pre'#231'o'#39
      #9'END'#9'AS TipoDescricao'
      'FROM Tipo')
    Left = 136
    Top = 312
  end
  object QStatusCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sta_Ativo,'
      #9'Sta_Codigo,'
      #9'Sta_Id,'
      #9'Sta_Nome,'
      '        Sta_NotificarCliente,'
      '        Sta_NotificarSupervisor,'
      '        Sta_NotificarConsultor,'
      '        Sta_NotificarRevenda,'
      #9'Sta_Programa,'
      '        Sta_Conceito'
      'FROM Status'
      #9'WHERE Sta_Id = :Id')
    Left = 48
    Top = 360
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QStatusCadSta_Id: TFDAutoIncField
      FieldName = 'Sta_Id'
      Origin = 'Sta_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QStatusCadSta_Ativo: TBooleanField
      FieldName = 'Sta_Ativo'
      Origin = 'Sta_Ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QStatusCadSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QStatusCadSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object QStatusCadSta_Programa: TIntegerField
      FieldName = 'Sta_Programa'
      Origin = 'Sta_Programa'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QStatusCadSta_NotificarCliente: TBooleanField
      FieldName = 'Sta_NotificarCliente'
      Origin = 'Sta_NotificarCliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QStatusCadSta_NotificarSupervisor: TBooleanField
      FieldName = 'Sta_NotificarSupervisor'
      Origin = 'Sta_NotificarSupervisor'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QStatusCadSta_NotificarConsultor: TBooleanField
      FieldName = 'Sta_NotificarConsultor'
      Origin = 'Sta_NotificarConsultor'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QStatusCadSta_NotificarRevenda: TBooleanField
      FieldName = 'Sta_NotificarRevenda'
      Origin = 'Sta_NotificarRevenda'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QStatusCadSta_Conceito: TStringField
      FieldName = 'Sta_Conceito'
      Origin = 'Sta_Conceito'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object QStatusCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sta_Codigo,'
      #9'Sta_Id,'
      #9'Sta_Nome,'
      '        Sta_NotificarCliente,'
      '        Sta_NotificarSupervisor,'
      '        Sta_NotificarConsultor,'
      '        Sta_NotificarRevenda,'
      '        Sta_Ativo,'
      #9'Sta_Programa,'
      #9'CASE Sta_Programa'
      #9#9'WHEN 1 THEN '#39'1-Chamado'#39
      #9#9'WHEN 2 THEN '#39'2-Visita'#39
      #9#9'WHEN 3 THEN '#39'3-Solicita'#231#227'o'#39
      #9#9'WHEN 4 THEN '#39'4-Vers'#227'o'#39
      #9#9'WHEN 5 THEN '#39'5-Qualidade'#39
      #9#9'WHEN 6 THEN '#39'6-Base de Conhecimento'#39
      '    WHEN 7 THEN '#39'7-Atividade'#39
      '    WHEN 8 THEN '#39'8-Agendamento'#39
      '    WHEN 10 THEN '#39'10-Recado'#39
      '    WHEN 11 THEN '#39'11-Tabela de Pre'#231'o'#39
      #9'END'#9'AS StatusDescricao'
      'FROM Status')
    Left = 136
    Top = 360
  end
  object dspStatusCad: TDataSetProvider
    DataSet = QStatusCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspStatusCadUpdateError
    Left = 80
    Top = 360
  end
  object dspStatusCons: TDataSetProvider
    DataSet = QStatusCons
    Left = 168
    Top = 360
  end
  object QClienteCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cli_Ativo,'
      #9'Cli_Codigo,'
      #9'Cli_Contato,'
      #9'Cli_Dcto,'
      #9'Cli_Endereco,'
      #9'Cli_Enquadramento,'
      #9'Cli_Fantasia,'
      #9'Cli_Id,'
      #9'Cli_Nome,'
      #9'Cli_Restricao,'
      #9'Cli_Revenda,'
      #9'Cli_Telefone,'
      #9'Cli_Usuario,'
      #9'Cli_Versao,'
      #9'Cli_Logradouro,'
      #9'Cli_Bairro,'
      #9'Cli_CEP,'
      #9'Cli_Cidade,'
      #9'Cid_Codigo,'
      #9'Cid_Nome,'
      #9'Cid_UF,'
      #9'Cli_Fone1,'
      #9'Cli_Fone2,'
      #9'Cli_Celular,'
      #9'Cli_FoneOutro,'
      #9'Cli_ContatoFinanceiro,'
      #9'Cli_ContatoFinanceiroFone,'
      #9'Cli_ContatoCompraVenda,'
      #9'Cli_ContatoCompraVendaFone,'
      #9'Cli_IE,'
      #9'Cli_RepreLegal,'
      #9'Cli_RepreLegalCPF,'
      '  Cli_EmpresaVinculada,'
      '  Cli_Latitude,'
      '  Cli_Longitude,'
      '  Cli_Perfil,'
      #9'Rev_Codigo,'
      #9'Rev_Nome,'
      #9'Usu_Codigo,'
      #9'Usu_Nome'
      'FROM Cliente'
      #9'LEFT JOIN Revenda ON Cli_Revenda = Rev_Id'
      #9'LEFT JOIN Usuario ON Cli_Usuario = Usu_Id'
      #9'LEFT JOIN Cidade ON Cli_Cidade = Cid_Id'
      'WHERE Cli_Id = :Id'
      '')
    Left = 48
    Top = 408
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QClienteCadCli_Id: TFDAutoIncField
      FieldName = 'Cli_Id'
      Origin = 'Cli_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QClienteCadCli_Ativo: TBooleanField
      FieldName = 'Cli_Ativo'
      Origin = 'Cli_Ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteCadCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteCadCli_Contato: TWideStringField
      FieldName = 'Cli_Contato'
      Origin = 'Cli_Contato'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object QClienteCadCli_Dcto: TStringField
      FieldName = 'Cli_Dcto'
      Origin = 'Cli_Dcto'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 25
    end
    object QClienteCadCli_Endereco: TWideStringField
      FieldName = 'Cli_Endereco'
      Origin = 'Cli_Endereco'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object QClienteCadCli_Enquadramento: TStringField
      FieldName = 'Cli_Enquadramento'
      Origin = 'Cli_Enquadramento'
      ProviderFlags = [pfInUpdate]
      Required = True
      FixedChar = True
      Size = 2
    end
    object QClienteCadCli_Fantasia: TWideStringField
      FieldName = 'Cli_Fantasia'
      Origin = 'Cli_Fantasia'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object QClienteCadCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object QClienteCadCli_Restricao: TBooleanField
      FieldName = 'Cli_Restricao'
      Origin = 'Cli_Restricao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteCadCli_Revenda: TIntegerField
      FieldName = 'Cli_Revenda'
      Origin = 'Cli_Revenda'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteCadCli_Telefone: TStringField
      FieldName = 'Cli_Telefone'
      Origin = 'Cli_Telefone'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object QClienteCadCli_Usuario: TIntegerField
      FieldName = 'Cli_Usuario'
      Origin = 'Cli_Usuario'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteCadRev_Codigo: TIntegerField
      FieldName = 'Rev_Codigo'
      Origin = 'Rev_Codigo'
      ProviderFlags = []
    end
    object QClienteCadRev_Nome: TWideStringField
      FieldName = 'Rev_Nome'
      Origin = 'Rev_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QClienteCadUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QClienteCadUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QClienteCadCli_Versao: TStringField
      FieldName = 'Cli_Versao'
      Origin = 'Cli_Versao'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object QClienteCadCli_Logradouro: TStringField
      FieldName = 'Cli_Logradouro'
      Origin = 'Cli_Logradouro'
      ProviderFlags = [pfInUpdate]
      Size = 80
    end
    object QClienteCadCli_Bairro: TStringField
      FieldName = 'Cli_Bairro'
      Origin = 'Cli_Bairro'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object QClienteCadCli_CEP: TStringField
      FieldName = 'Cli_CEP'
      Origin = 'Cli_CEP'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object QClienteCadCli_Cidade: TIntegerField
      FieldName = 'Cli_Cidade'
      Origin = 'Cli_Cidade'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteCadCid_Codigo: TIntegerField
      FieldName = 'Cid_Codigo'
      Origin = 'Cid_Codigo'
      ProviderFlags = []
    end
    object QClienteCadCid_Nome: TStringField
      FieldName = 'Cid_Nome'
      Origin = 'Cid_Nome'
      ProviderFlags = []
      Size = 60
    end
    object QClienteCadCid_UF: TStringField
      FieldName = 'Cid_UF'
      Origin = 'Cid_UF'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object QClienteCadCli_Fone1: TStringField
      FieldName = 'Cli_Fone1'
      Origin = 'Cli_Fone1'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteCadCli_Fone2: TStringField
      FieldName = 'Cli_Fone2'
      Origin = 'Cli_Fone2'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteCadCli_Celular: TStringField
      FieldName = 'Cli_Celular'
      Origin = 'Cli_Celular'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteCadCli_FoneOutro: TStringField
      FieldName = 'Cli_FoneOutro'
      Origin = 'Cli_FoneOutro'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteCadCli_ContatoFinanceiro: TStringField
      FieldName = 'Cli_ContatoFinanceiro'
      Origin = 'Cli_ContatoFinanceiro'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object QClienteCadCli_ContatoFinanceiroFone: TStringField
      FieldName = 'Cli_ContatoFinanceiroFone'
      Origin = 'Cli_ContatoFinanceiroFone'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteCadCli_ContatoCompraVenda: TStringField
      FieldName = 'Cli_ContatoCompraVenda'
      Origin = 'Cli_ContatoCompraVenda'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object QClienteCadCli_ContatoCompraVendaFone: TStringField
      FieldName = 'Cli_ContatoCompraVendaFone'
      Origin = 'Cli_ContatoCompraVendaFone'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteCadCli_IE: TStringField
      FieldName = 'Cli_IE'
      Origin = 'Cli_IE'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object QClienteCadCli_RepreLegal: TStringField
      FieldName = 'Cli_RepreLegal'
      Origin = 'Cli_RepreLegal'
      ProviderFlags = [pfInUpdate]
      Size = 60
    end
    object QClienteCadCli_RepreLegalCPF: TStringField
      FieldName = 'Cli_RepreLegalCPF'
      Origin = 'Cli_RepreLegalCPF'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteCadCli_EmpresaVinculada: TIntegerField
      FieldName = 'Cli_EmpresaVinculada'
      Origin = 'Cli_EmpresaVinculada'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteCadCli_Latitude: TStringField
      FieldName = 'Cli_Latitude'
      Origin = 'Cli_Latitude'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object QClienteCadCli_Longitude: TStringField
      FieldName = 'Cli_Longitude'
      Origin = 'Cli_Longitude'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object QClienteCadCli_Perfil: TStringField
      FieldName = 'Cli_Perfil'
      Origin = 'Cli_Perfil'
      ProviderFlags = [pfInUpdate]
    end
  end
  object QClienteCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cli_Id,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Cli_Fantasia,'
      #9'Cli_Dcto,'
      #9'Cli_Telefone,'
      #9'Cli_Versao,'
      #9'Cli_Ativo,'
      #9'Cli_Fone1,'
      #9'Cli_Fone2,'
      #9'Cli_Celular,'
      #9'Cli_FoneOutro,'
      '  Cli_Perfil,'
      #9'CASE Cli_Enquadramento'
      #9#9'WHEN '#39'00'#39' THEN '#39'00-N'#227'o Definido'#39
      #9#9'WHEN '#39'01'#39' THEN '#39'01-Simples'#39
      #9#9'WHEN '#39'02'#39' THEN '#39'02-Lucro Presumido'#39
      #9#9'WHEN '#39'03'#39' THEN '#39'03-Lucro Real'#39
      #9'END AS Cli_Enquadramento,'
      #9'Usu_Nome,'
      #9'Rev_Nome'
      'FROM Cliente'
      #9'LEFT JOIN Usuario ON Cli_Usuario = Usu_Id'
      #9'LEFT JOIN Revenda ON Cli_Revenda = Rev_Id'
      #9'LEFT JOIN Cidade ON Cli_Cidade = Cid_Id')
    Left = 136
    Top = 408
  end
  object dspClienteCad: TDataSetProvider
    DataSet = QClienteCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspClienteCadUpdateError
    Left = 80
    Top = 408
  end
  object dspClienteCons: TDataSetProvider
    DataSet = QClienteCons
    Left = 168
    Top = 408
  end
  object QClienteEspCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'CliEsp_Data,'
      #9'CliEsp_Nome,'
      #9'CliEsp_Id,'
      #9'CliEsp_Item,'
      '        Cli_Codigo,'
      '        Cli_Nome'
      'FROM Cliente_Especificacao'
      '        INNER JOIN Cliente ON CliEsp_Cliente = Cli_Id'
      #9'WHERE CliEsp_Cliente = :IdCliente'
      'ORDER BY CliEsp_Item')
    Left = 136
    Top = 456
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QClienteEmailCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'CliEm_Cliente,'
      #9'CliEm_Email,'
      #9'CliEm_Id,'
      #9'CliEm_Notificar'
      'FROM Cliente_Email'
      '  WHERE CliEm_Cliente = :IdCliente'
      #9)
    Left = 240
    Top = 16
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QClienteEmailConsCliEm_Id: TFDAutoIncField
      FieldName = 'CliEm_Id'
      Origin = 'CliEm_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QClienteEmailConsCliEm_Cliente: TIntegerField
      FieldName = 'CliEm_Cliente'
      Origin = 'CliEm_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteEmailConsCliEm_Email: TWideStringField
      FieldName = 'CliEm_Email'
      Origin = 'CliEm_Email'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object QClienteEmailConsCliEm_Notificar: TBooleanField
      FieldName = 'CliEm_Notificar'
      Origin = 'CliEm_Notificar'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object dspClienteEspCons: TDataSetProvider
    DataSet = QClienteEspCons
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 456
  end
  object dspClienteEmailCons: TDataSetProvider
    DataSet = QClienteEmailCons
    UpdateMode = upWhereKeyOnly
    Left = 272
    Top = 16
  end
  object QClienteModuloCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'CliMod_Cliente,'
      #9'CliMod_Id,'
      #9'CliMod_Modulo,'
      #9'CliMod_Produto,'
      #9'Mod_Codigo,'
      #9'Mod_Nome,'
      #9'Prod_Codigo,'
      #9'Prod_Nome'#9
      'FROM Cliente_Modulo'
      #9'LEFT JOIN Modulo ON CliMod_Modulo = Mod_Id'
      #9'LEFT JOIN Produto ON CliMod_Produto = Prod_Id'
      'WHERE CliMod_Cliente = :IdCliente'
      '')
    Left = 328
    Top = 112
    ParamData = <
      item
        Name = 'IDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QClienteModuloConsCliMod_Id: TFDAutoIncField
      FieldName = 'CliMod_Id'
      Origin = 'CliMod_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QClienteModuloConsCliMod_Cliente: TIntegerField
      FieldName = 'CliMod_Cliente'
      Origin = 'CliMod_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteModuloConsCliMod_Modulo: TIntegerField
      FieldName = 'CliMod_Modulo'
      Origin = 'CliMod_Modulo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteModuloConsCliMod_Produto: TIntegerField
      FieldName = 'CliMod_Produto'
      Origin = 'CliMod_Produto'
      ProviderFlags = [pfInUpdate]
    end
    object QClienteModuloConsMod_Codigo: TIntegerField
      FieldName = 'Mod_Codigo'
      Origin = 'Mod_Codigo'
      ProviderFlags = []
    end
    object QClienteModuloConsMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QClienteModuloConsProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
      ProviderFlags = []
    end
    object QClienteModuloConsProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspClienteModuloCons: TDataSetProvider
    DataSet = QClienteModuloCons
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspClienteModuloConsUpdateError
    Left = 360
    Top = 112
  end
  object QClienteEspCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'CliEsp_Anexo,'
      #9'CliEsp_Cliente,'
      #9'CliEsp_Data,'
      #9'CliEsp_Descricao,'
      #9'CliEsp_Id,'
      #9'CliEsp_Item,'
      '        CliEsp_Nome,'
      #9'CliEsp_Usuario,'
      #9'Usu_Nome,'
      '        Usu_Codigo'
      'FROM Cliente_Especificacao'
      #9'LEFT JOIN Usuario ON CliEsp_Usuario = Usu_Id'
      #9'WHERE CliEsp_Id = :Id')
    Left = 48
    Top = 456
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QClienteEspCadCliEsp_Id: TFDAutoIncField
      FieldName = 'CliEsp_Id'
      Origin = 'CliEsp_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QClienteEspCadCliEsp_Cliente: TIntegerField
      FieldName = 'CliEsp_Cliente'
      Origin = 'CliEsp_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteEspCadCliEsp_Data: TDateField
      FieldName = 'CliEsp_Data'
      Origin = 'CliEsp_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteEspCadCliEsp_Descricao: TWideStringField
      FieldName = 'CliEsp_Descricao'
      Origin = 'CliEsp_Descricao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 800
    end
    object QClienteEspCadCliEsp_Item: TIntegerField
      FieldName = 'CliEsp_Item'
      Origin = 'CliEsp_Item'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteEspCadCliEsp_Usuario: TIntegerField
      FieldName = 'CliEsp_Usuario'
      Origin = 'CliEsp_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteEspCadCliEsp_Nome: TStringField
      FieldName = 'CliEsp_Nome'
      Origin = 'CliEsp_Nome'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object QClienteEspCadUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QClienteEspCadCliEsp_Anexo: TStringField
      FieldName = 'CliEsp_Anexo'
      Origin = 'CliEsp_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object QClienteEspCadUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspClienteEspCad: TDataSetProvider
    DataSet = QClienteEspCad
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 456
  end
  object QSolicitaCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol.Sol_Analista,'
      #9'Sol.Sol_Anexo,'
      #9'Sol.Sol_Cliente,'
      #9'Sol.Sol_Data,'
      #9'Sol.Sol_Descricao,'
      #9'Sol.Sol_DescricaoLiberacao,'
      #9'Sol.Sol_Desenvolvedor,'
      #9'Sol.Sol_Hora,'
      #9'Sol.Sol_Id,'
      #9'Sol.Sol_Modulo,'
      '  SOl.Sol_VersaoId,'
      #9'Sol.Sol_Nivel,'
      #9'Sol.Sol_PrevisaoEntrega,'
      #9'Sol.Sol_Produto,'
      #9'Sol.Sol_Status,'
      #9'Sol.Sol_TempoPrevisto,'
      #9'Sol.Sol_Tipo,'
      #9'Sol.Sol_Titulo,'
      #9'Sol.Sol_UsuarioAbertura,'
      #9'Sol.Sol_Versao,'
      '  Sol.Sol_UsuarioAtendeAtual,'
      '  Sol.Sol_Contato,'
      '  Sol.Sol_Categoria,'
      #9'Prod_Codigo,'
      #9'Prod_Nome,'
      #9'Sta_Codigo,'
      #9'Sta_Nome,'
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'UsuAb.Usu_Codigo AS UAb_Codigo,'
      #9'UsuAb.Usu_Nome AS UAb_Nome,'
      #9'Anal.Usu_Codigo AS Anal_Codigo,'
      #9'Anal.Usu_Nome AS Anal_Nome,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Desen.Usu_Codigo AS Desenv_Codigo,'
      #9'Desen.Usu_nome AS Desenv_Nome,'
      #9'Mod_Codigo,'
      #9'Mod_Nome,'
      #9'Ver_Versao,'
      '  Cat.Cat_Codigo,'
      '  Cat.Cat_Nome'
      'FROM Solicitacao Sol'
      #9'LEFT JOIN Cliente ON Sol.Sol_Cliente = Cli_Id'
      #9'LEFT JOIN Usuario Desen ON Sol.Sol_Desenvolvedor = Desen.Usu_Id'
      #9'LEFT JOIN Modulo ON Sol.Sol_Modulo = Mod_Id'
      #9'LEFT JOIN Produto ON Sol.Sol_Produto = Prod_Id'
      #9'LEFT JOIN Status ON Sol.Sol_Status = Sta_Id'
      #9'LEFT JOIN Tipo ON Sol.Sol_Tipo = Tip_Id'
      
        #9'LEFT JOIN Usuario UsuAb ON Sol.Sol_UsuarioAbertura = UsuAb.Usu_' +
        'Id'
      #9'LEFT JOIN Usuario Anal ON Sol.Sol_Analista = Anal.Usu_Id'
      #9'LEFT JOIN Versao ON Sol_VersaoId = Ver_Id'
      '  LEFT JOIN Categoria Cat ON Sol.Sol_Categoria = Cat.Cat_Id'
      'WHERE Sol.Sol_Id = :Id')
    Left = 240
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QSolicitaCadSol_Id: TFDAutoIncField
      FieldName = 'Sol_Id'
      Origin = 'Sol_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QSolicitaCadSol_Analista: TIntegerField
      FieldName = 'Sol_Analista'
      Origin = 'Sol_Analista'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCadSol_Anexo: TStringField
      FieldName = 'Sol_Anexo'
      Origin = 'Sol_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object QSolicitaCadSol_Cliente: TIntegerField
      FieldName = 'Sol_Cliente'
      Origin = 'Sol_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaCadSol_Data: TDateField
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaCadSol_Desenvolvedor: TIntegerField
      FieldName = 'Sol_Desenvolvedor'
      Origin = 'Sol_Desenvolvedor'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCadSol_Hora: TTimeField
      FieldName = 'Sol_Hora'
      Origin = 'Sol_Hora'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaCadSol_Modulo: TIntegerField
      FieldName = 'Sol_Modulo'
      Origin = 'Sol_Modulo'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCadSol_Nivel: TIntegerField
      FieldName = 'Sol_Nivel'
      Origin = 'Sol_Nivel'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCadSol_PrevisaoEntrega: TDateField
      FieldName = 'Sol_PrevisaoEntrega'
      Origin = 'Sol_PrevisaoEntrega'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCadSol_Produto: TIntegerField
      FieldName = 'Sol_Produto'
      Origin = 'Sol_Produto'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCadSol_Status: TIntegerField
      FieldName = 'Sol_Status'
      Origin = 'Sol_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaCadSol_TempoPrevisto: TBCDField
      FieldName = 'Sol_TempoPrevisto'
      Origin = 'Sol_TempoPrevisto'
      ProviderFlags = [pfInUpdate]
      Precision = 5
      Size = 2
    end
    object QSolicitaCadSol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
      Origin = 'Sol_Tipo'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCadSol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Origin = 'Sol_Titulo'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object QSolicitaCadSol_UsuarioAbertura: TIntegerField
      FieldName = 'Sol_UsuarioAbertura'
      Origin = 'Sol_UsuarioAbertura'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaCadSol_Versao: TStringField
      FieldName = 'Sol_Versao'
      Origin = 'Sol_Versao'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object QSolicitaCadSol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
      Origin = 'Sol_UsuarioAtendeAtual'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCadSol_Contato: TStringField
      FieldName = 'Sol_Contato'
      Origin = 'Sol_Contato'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object QSolicitaCadSol_Descricao: TMemoField
      FieldName = 'Sol_Descricao'
      Origin = 'Sol_Descricao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 2147483647
    end
    object QSolicitaCadSol_DescricaoLiberacao: TMemoField
      FieldName = 'Sol_DescricaoLiberacao'
      Origin = 'Sol_DescricaoLiberacao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 2147483647
    end
    object QSolicitaCadSol_VersaoId: TIntegerField
      FieldName = 'Sol_VersaoId'
      Origin = 'Sol_VersaoId'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCadProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCadProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QSolicitaCadSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCadSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QSolicitaCadTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCadTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QSolicitaCadUAb_Codigo: TIntegerField
      FieldName = 'UAb_Codigo'
      Origin = 'UAb_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCadAnal_Codigo: TIntegerField
      FieldName = 'Anal_Codigo'
      Origin = 'Anal_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCadCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCadCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QSolicitaCadDesenv_Codigo: TIntegerField
      FieldName = 'Desenv_Codigo'
      Origin = 'Desenv_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCadMod_Codigo: TIntegerField
      FieldName = 'Mod_Codigo'
      Origin = 'Mod_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCadMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QSolicitaCadUAb_Nome: TWideStringField
      FieldName = 'UAb_Nome'
      Origin = 'UAb_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QSolicitaCadAnal_Nome: TWideStringField
      FieldName = 'Anal_Nome'
      Origin = 'Anal_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QSolicitaCadDesenv_Nome: TWideStringField
      FieldName = 'Desenv_Nome'
      Origin = 'Desenv_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QSolicitaCadVer_Versao: TStringField
      FieldName = 'Ver_Versao'
      Origin = 'Ver_Versao'
      ProviderFlags = []
      Size = 25
    end
    object QSolicitaCadSol_Categoria: TIntegerField
      FieldName = 'Sol_Categoria'
      Origin = 'Sol_Categoria'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCadCat_Codigo: TIntegerField
      FieldName = 'Cat_Codigo'
      Origin = 'Cat_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCadCat_Nome: TStringField
      FieldName = 'Cat_Nome'
      Origin = 'Cat_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspSolicitacaoCad: TDataSetProvider
    DataSet = QSolicitaCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspSolicitacaoCadUpdateError
    Left = 272
    Top = 64
  end
  object dspSolicitacaoCons: TDataSetProvider
    DataSet = QSolicitaCons
    Left = 360
    Top = 64
  end
  object QSolicitaCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Data,'
      #9'Sol_Hora,'
      #9'Sol_Cliente,'
      '    Sol_Status,'
      #9'Sol_Titulo,'
      #9'CASE Sol_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 1 THEN '#39'3-Alto'#39
      #9#9'WHEN 1 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Sol_Nivel,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      '    Cli_Fantasia,'
      #9'Sta_Nome,'
      #9'Tip_Nome,'
      #9'Ver_Versao'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      '    INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'LEFT JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'LEFT JOIN Versao On Sol_VersaoId = Ver_Id'
      '')
    Left = 328
    Top = 64
  end
  object QClienteModuloCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'CliMod_Id,'
      #9'CliMod_Cliente,'
      #9'CliMod_Modulo,'
      #9'CliMod_Produto,'
      #9'Prod_Codigo,'
      #9'Prod_Nome'
      'FROM Cliente_Modulo'
      #9'INNER JOIN Produto ON CliMod_Produto = Prod_Id'
      'WHERE CliMod_Id = :Id')
    Left = 240
    Top = 112
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QClienteModuloCadCliMod_Id: TFDAutoIncField
      FieldName = 'CliMod_Id'
      Origin = 'CliMod_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QClienteModuloCadCliMod_Cliente: TIntegerField
      FieldName = 'CliMod_Cliente'
      Origin = 'CliMod_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteModuloCadCliMod_Modulo: TIntegerField
      FieldName = 'CliMod_Modulo'
      Origin = 'CliMod_Modulo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteModuloCadCliMod_Produto: TIntegerField
      FieldName = 'CliMod_Produto'
      Origin = 'CliMod_Produto'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QClienteModuloCadProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
      ProviderFlags = []
      Required = True
    end
    object QClienteModuloCadProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object dspClienteModuloCad: TDataSetProvider
    DataSet = QClienteModuloCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspClienteModuloCadUpdateError
    Left = 272
    Top = 112
  end
  object QSolicitaCronogramaCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'SCro_Data,'
      #9'SCro_HoraFim,'
      #9'SCro_HoraInicio,'
      #9'SCro_Id,'
      #9'SCro_Solicitacao,'
      #9'SCro_UsuarioOperacional,'
      #9'Usu_Codigo,'
      #9'Usu_Nome'
      'FROM Solicitacao_Cronograma'
      #9'LEFT JOIN Usuario ON SCro_UsuarioOperacional = Usu_Id'
      'WHERE SCro_Id = :Id')
    Left = 240
    Top = 160
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QSolicitaCronogramaCadSCro_Id: TFDAutoIncField
      FieldName = 'SCro_Id'
      Origin = 'SCro_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QSolicitaCronogramaCadSCro_Data: TDateField
      FieldName = 'SCro_Data'
      Origin = 'SCro_Data'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCronogramaCadSCro_HoraFim: TTimeField
      FieldName = 'SCro_HoraFim'
      Origin = 'SCro_HoraFim'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCronogramaCadSCro_HoraInicio: TTimeField
      FieldName = 'SCro_HoraInicio'
      Origin = 'SCro_HoraInicio'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCronogramaCadSCro_Solicitacao: TIntegerField
      FieldName = 'SCro_Solicitacao'
      Origin = 'SCro_Solicitacao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaCronogramaCadSCro_UsuarioOperacional: TIntegerField
      FieldName = 'SCro_UsuarioOperacional'
      Origin = 'SCro_UsuarioOperacional'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCronogramaCadUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCronogramaCadUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspSolicitaCronogramaCad: TDataSetProvider
    DataSet = QSolicitaCronogramaCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspSolicitaCronogramaCadUpdateError
    Left = 272
    Top = 160
  end
  object QSolicitaCronogramaCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'SCro_Data,'
      #9'SCro_HoraFim,'
      #9'SCro_HoraInicio,'
      #9'SCro_Id,'
      #9'SCro_Solicitacao,'
      #9'SCro_UsuarioOperacional,'
      #9'Usu_Codigo,'
      #9'Usu_Nome'
      'FROM Solicitacao_Cronograma'
      #9'LEFT JOIN Usuario ON SCro_UsuarioOperacional = Usu_Id'
      'WHERE SCro_Solicitacao = :IdSolicitacao')
    Left = 328
    Top = 160
    ParamData = <
      item
        Name = 'IDSOLICITACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QSolicitaCronogramaConsSCro_Id: TFDAutoIncField
      FieldName = 'SCro_Id'
      Origin = 'SCro_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QSolicitaCronogramaConsSCro_Data: TDateField
      FieldName = 'SCro_Data'
      Origin = 'SCro_Data'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCronogramaConsSCro_HoraFim: TTimeField
      FieldName = 'SCro_HoraFim'
      Origin = 'SCro_HoraFim'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCronogramaConsSCro_HoraInicio: TTimeField
      FieldName = 'SCro_HoraInicio'
      Origin = 'SCro_HoraInicio'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCronogramaConsSCro_Solicitacao: TIntegerField
      FieldName = 'SCro_Solicitacao'
      Origin = 'SCro_Solicitacao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaCronogramaConsSCro_UsuarioOperacional: TIntegerField
      FieldName = 'SCro_UsuarioOperacional'
      Origin = 'SCro_UsuarioOperacional'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaCronogramaConsUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QSolicitaCronogramaConsUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspSolicitaCronogramaCons: TDataSetProvider
    DataSet = QSolicitaCronogramaCons
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspSolicitaCronogramaConsUpdateError
    Left = 360
    Top = 160
  end
  object QSolicitaOcorrenciaGeralCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'SOcor_Anexo,'
      #9'SOcor_Classificacao,'
      #9'SOcor_Data,'
      #9'SOcor_Descricao,'
      #9'SOcor_Hora,'
      #9'SOcor_Id,'
      #9'SOcor_Solicitacao,'
      #9'SOcor_Tipo,'
      #9'SOcor_UsuarioOperacional,'
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Usu_Codigo,'
      #9'Usu_Nome'
      'FROM Solicitacao_Ocorrencia'
      #9'LEFT JOIN Tipo ON SOcor_Tipo = Tip_Id'
      #9'LEFT JOIN Usuario ON SOcor_UsuarioOperacional = Usu_Id'
      'WHERE SOcor_Solicitacao = :IdSolicitacao'
      'AND SOcor_Classificacao = 1')
    Left = 328
    Top = 208
    ParamData = <
      item
        Name = 'IDSOLICITACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QSolicitaOcorrenciaGeralConsSOcor_Id: TFDAutoIncField
      FieldName = 'SOcor_Id'
      Origin = 'SOcor_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QSolicitaOcorrenciaGeralConsSOcor_Anexo: TStringField
      FieldName = 'SOcor_Anexo'
      Origin = 'SOcor_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object QSolicitaOcorrenciaGeralConsSOcor_Classificacao: TIntegerField
      FieldName = 'SOcor_Classificacao'
      Origin = 'SOcor_Classificacao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaGeralConsSOcor_Descricao: TMemoField
      FieldName = 'SOcor_Descricao'
      Origin = 'SOcor_Descricao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 2147483647
    end
    object QSolicitaOcorrenciaGeralConsSOcor_Data: TDateField
      FieldName = 'SOcor_Data'
      Origin = 'SOcor_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaGeralConsSOcor_Hora: TTimeField
      FieldName = 'SOcor_Hora'
      Origin = 'SOcor_Hora'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaGeralConsSOcor_Solicitacao: TIntegerField
      FieldName = 'SOcor_Solicitacao'
      Origin = 'SOcor_Solicitacao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaGeralConsSOcor_Tipo: TIntegerField
      FieldName = 'SOcor_Tipo'
      Origin = 'SOcor_Tipo'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaOcorrenciaGeralConsSOcor_UsuarioOperacional: TIntegerField
      FieldName = 'SOcor_UsuarioOperacional'
      Origin = 'SOcor_UsuarioOperacional'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaGeralConsTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
    end
    object QSolicitaOcorrenciaGeralConsTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QSolicitaOcorrenciaGeralConsUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QSolicitaOcorrenciaGeralConsUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspSolicitaOcorrenciaGeralCons: TDataSetProvider
    DataSet = QSolicitaOcorrenciaGeralCons
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspSolicitaOcorrenciaGeralConsUpdateError
    Left = 360
    Top = 208
  end
  object QSolicitaOcorrenciaTecnicaCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'SOcor_Anexo,'
      #9'SOcor_Classificacao,'
      #9'SOcor_Data,'
      #9'SOcor_Descricao,'
      #9'SOcor_Hora,'
      #9'SOcor_Id,'
      #9'SOcor_Solicitacao,'
      #9'SOcor_Tipo,'
      #9'SOcor_UsuarioOperacional,'
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Usu_Codigo,'
      #9'Usu_Nome'
      'FROM Solicitacao_Ocorrencia'
      #9'LEFT JOIN Tipo ON SOcor_Tipo = Tip_Id'
      #9'LEFT JOIN Usuario ON SOcor_UsuarioOperacional = Usu_Id'
      'WHERE SOcor_Solicitacao = :IdSolicitacao'
      'AND SOcor_Classificacao = 2')
    Left = 328
    Top = 256
    ParamData = <
      item
        Name = 'IDSOLICITACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QSolicitaOcorrenciaTecnicaConsSOcor_Id: TFDAutoIncField
      FieldName = 'SOcor_Id'
      Origin = 'SOcor_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QSolicitaOcorrenciaTecnicaConsSOcor_Anexo: TStringField
      FieldName = 'SOcor_Anexo'
      Origin = 'SOcor_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object QSolicitaOcorrenciaTecnicaConsSOcor_Classificacao: TIntegerField
      FieldName = 'SOcor_Classificacao'
      Origin = 'SOcor_Classificacao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaTecnicaConsSOcor_Data: TDateField
      FieldName = 'SOcor_Data'
      Origin = 'SOcor_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaTecnicaConsSOcor_Hora: TTimeField
      FieldName = 'SOcor_Hora'
      Origin = 'SOcor_Hora'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaTecnicaConsSOcor_Solicitacao: TIntegerField
      FieldName = 'SOcor_Solicitacao'
      Origin = 'SOcor_Solicitacao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaTecnicaConsSOcor_Tipo: TIntegerField
      FieldName = 'SOcor_Tipo'
      Origin = 'SOcor_Tipo'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaOcorrenciaTecnicaConsSOcor_UsuarioOperacional: TIntegerField
      FieldName = 'SOcor_UsuarioOperacional'
      Origin = 'SOcor_UsuarioOperacional'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaTecnicaConsSOcor_Descricao: TMemoField
      FieldName = 'SOcor_Descricao'
      Origin = 'SOcor_Descricao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 2147483647
    end
    object QSolicitaOcorrenciaTecnicaConsTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
    end
    object QSolicitaOcorrenciaTecnicaConsTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QSolicitaOcorrenciaTecnicaConsUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QSolicitaOcorrenciaTecnicaConsUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspSolicitaOcorrenciaTecnicaCons: TDataSetProvider
    DataSet = QSolicitaOcorrenciaTecnicaCons
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspSolicitaOcorrenciaTecnicaConsUpdateError
    Left = 360
    Top = 256
  end
  object QSolicitaStatusCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'SSta_Data,'
      #9'Sta_Nome,'
      '        SSta_Hora,'
      #9'Usu_nome'
      'FROM Solicitacao_Status'
      #9'LEFT JOIN Status ON SSta_Status = Sta_Id'
      #9'LEFT JOIN Usuario ON SSta_UsuarioOperacional = Usu_Id'
      'WHERE SSta_Solicitacao = :IdSolicitacao'
      'ORDER BY SSta_Data DESC')
    Left = 328
    Top = 304
    ParamData = <
      item
        Name = 'IDSOLICITACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspSolicitaStatusCons: TDataSetProvider
    DataSet = QSolicitaStatusCons
    Left = 360
    Top = 304
  end
  object QVisitaCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Vis_Id,'
      #9'Vis_Dcto,'
      #9'Vis_Data,'
      #9'Vis_HoraInicio,'
      #9'Vis_HoraFim,'
      #9'Vis_Cliente,'
      #9'Vis_Usuario,'
      #9'Vis_Contato,'
      #9'Vis_Tipo,'
      #9'Vis_Status,'
      #9'Vis_Descricao,'
      #9'Vis_Anexo,'
      #9'Vis_TotalHoras,'
      #9'Vis_Valor,'
      #9'Vis_FormaPagto,'
      '  Vis_Versao,'
      '  Vis_Latitude,'
      '  Vis_Longitude,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Usu_Codigo,'
      #9'Usu_Nome,'
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Sta_Codigo,'
      #9'Sta_Nome'
      'FROM Visita'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON Vis_Usuario = Usu_Id'
      #9'INNER JOIN Tipo ON Vis_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      'WHERE Vis_Id = :Id'
      '')
    Left = 232
    Top = 352
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QVisitaCadVis_Id: TFDAutoIncField
      FieldName = 'Vis_Id'
      Origin = 'Vis_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QVisitaCadVis_Dcto: TStringField
      FieldName = 'Vis_Dcto'
      Origin = 'Vis_Dcto'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object QVisitaCadVis_Data: TDateField
      FieldName = 'Vis_Data'
      Origin = 'Vis_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVisitaCadVis_HoraInicio: TTimeField
      FieldName = 'Vis_HoraInicio'
      Origin = 'Vis_HoraInicio'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVisitaCadVis_HoraFim: TTimeField
      FieldName = 'Vis_HoraFim'
      Origin = 'Vis_HoraFim'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVisitaCadVis_Cliente: TIntegerField
      FieldName = 'Vis_Cliente'
      Origin = 'Vis_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVisitaCadVis_Usuario: TIntegerField
      FieldName = 'Vis_Usuario'
      Origin = 'Vis_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVisitaCadVis_Contato: TStringField
      FieldName = 'Vis_Contato'
      Origin = 'Vis_Contato'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object QVisitaCadVis_Tipo: TIntegerField
      FieldName = 'Vis_Tipo'
      Origin = 'Vis_Tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVisitaCadVis_Status: TIntegerField
      FieldName = 'Vis_Status'
      Origin = 'Vis_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVisitaCadVis_Descricao: TStringField
      FieldName = 'Vis_Descricao'
      Origin = 'Vis_Descricao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2000
    end
    object QVisitaCadVis_Anexo: TStringField
      FieldName = 'Vis_Anexo'
      Origin = 'Vis_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object QVisitaCadVis_TotalHoras: TFloatField
      FieldName = 'Vis_TotalHoras'
      Origin = 'Vis_TotalHoras'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVisitaCadVis_FormaPagto: TStringField
      FieldName = 'Vis_FormaPagto'
      Origin = 'Vis_FormaPagto'
      ProviderFlags = [pfInUpdate]
      Size = 500
    end
    object QVisitaCadVis_Valor: TCurrencyField
      FieldName = 'Vis_Valor'
      Origin = 'Vis_Valor'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVisitaCadCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      ProviderFlags = []
    end
    object QVisitaCadCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QVisitaCadUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QVisitaCadTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
    end
    object QVisitaCadTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QVisitaCadSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = []
    end
    object QVisitaCadSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QVisitaCadUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object QVisitaCadVis_Versao: TStringField
      FieldName = 'Vis_Versao'
      Origin = 'Vis_Versao'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object QVisitaCadVis_Latitude: TStringField
      FieldName = 'Vis_Latitude'
      Origin = 'Vis_Latitude'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object QVisitaCadVis_Longitude: TStringField
      FieldName = 'Vis_Longitude'
      Origin = 'Vis_Longitude'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
  end
  object dspVisitaCad: TDataSetProvider
    DataSet = QVisitaCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspVisitaCadUpdateError
    Left = 264
    Top = 352
  end
  object dspVisitaCons: TDataSetProvider
    DataSet = QVisitaCons
    Left = 360
    Top = 352
  end
  object QVisitaCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Vis_Id,'
      #9'Vis_Dcto,'
      #9'Vis_Data,'
      '        Vis_Status,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      '        Cli_Fantasia,'
      #9'Usu_Codigo,'
      #9'Usu_Nome'
      'FROM Visita'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON Vis_Usuario = Usu_Id'
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 328
    Top = 352
  end
  object QBaseCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Bas_Id,'
      #9'Bas_Data,'
      #9'Bas_Nome,'
      #9'Bas_Usuario,'
      #9'Bas_Produto,'
      #9'Bas_Modulo,'
      #9'Bas_Tipo,'
      #9'Bas_Status,'
      #9'Bas_Descricao,'
      #9'Bas_Anexo,'
      #9'Usu_Codigo,'
      #9'Usu_Nome,'
      #9'Prod_Codigo,'
      #9'Prod_Nome,'
      #9'Mod_Codigo,'
      #9'Mod_Nome,'
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Sta_Codigo,'
      #9'Sta_Nome'
      'FROM Base'
      #9'INNER JOIN Usuario ON Bas_Usuario = Usu_Id'
      #9'LEFT JOIN Produto ON Bas_Produto = Prod_Id'
      #9'LEFT JOIN Modulo ON Bas_Modulo = Mod_Id'
      #9'LEFT JOIN Tipo ON Bas_Tipo = Tip_Id'
      #9'LEFT JOIN Status ON Bas_Status = Sta_Id'#9
      'WHERE Bas_Id = :Id')
    Left = 232
    Top = 400
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QBaseCadBas_Id: TFDAutoIncField
      FieldName = 'Bas_Id'
      Origin = 'Bas_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QBaseCadBas_Data: TDateField
      FieldName = 'Bas_Data'
      Origin = 'Bas_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QBaseCadBas_Nome: TStringField
      FieldName = 'Bas_Nome'
      Origin = 'Bas_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object QBaseCadBas_Usuario: TIntegerField
      FieldName = 'Bas_Usuario'
      Origin = 'Bas_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QBaseCadBas_Produto: TIntegerField
      FieldName = 'Bas_Produto'
      Origin = 'Bas_Produto'
      ProviderFlags = [pfInUpdate]
    end
    object QBaseCadBas_Modulo: TIntegerField
      FieldName = 'Bas_Modulo'
      Origin = 'Bas_Modulo'
      ProviderFlags = [pfInUpdate]
    end
    object QBaseCadBas_Tipo: TIntegerField
      FieldName = 'Bas_Tipo'
      Origin = 'Bas_Tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QBaseCadBas_Status: TIntegerField
      FieldName = 'Bas_Status'
      Origin = 'Bas_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QBaseCadBas_Descricao: TStringField
      FieldName = 'Bas_Descricao'
      Origin = 'Bas_Descricao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 2000
    end
    object QBaseCadBas_Anexo: TStringField
      FieldName = 'Bas_Anexo'
      Origin = 'Bas_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object QBaseCadUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QBaseCadProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
      ProviderFlags = []
    end
    object QBaseCadProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QBaseCadMod_Codigo: TIntegerField
      FieldName = 'Mod_Codigo'
      Origin = 'Mod_Codigo'
      ProviderFlags = []
    end
    object QBaseCadMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QBaseCadTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
    end
    object QBaseCadTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QBaseCadSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = []
    end
    object QBaseCadSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QBaseCadUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object QBaseCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Bas_Id,'
      #9'Bas_Data,'
      #9'Bas_Nome,'
      #9'Tip_Nome,'
      #9'Sta_Nome,'
      '        Usu_Nome'
      'FROM Base'
      #9'INNER JOIN Usuario ON Bas_Usuario = Usu_Id'
      #9'INNER JOIN Tipo ON Bas_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Bas_Status = Sta_Id')
    Left = 328
    Top = 400
  end
  object dspBaseCad: TDataSetProvider
    DataSet = QBaseCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspBaseCadUpdateError
    Left = 264
    Top = 400
  end
  object dspBaseCons: TDataSetProvider
    DataSet = QBaseCons
    UpdateMode = upWhereKeyOnly
    Left = 360
    Top = 400
  end
  object QParametrosCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Par_Id,'
      #9'Par_Codigo,'
      #9'Par_programa,'
      #9'Par_Nome,'
      #9'Par_Valor,'
      #9'Par_Obs'
      'FROM Parametros'
      #9'WHERE Par_Id = :Id')
    Left = 232
    Top = 456
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QParametrosCadPar_Id: TFDAutoIncField
      FieldName = 'Par_Id'
      Origin = 'Par_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QParametrosCadPar_Codigo: TIntegerField
      FieldName = 'Par_Codigo'
      Origin = 'Par_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QParametrosCadPar_programa: TIntegerField
      FieldName = 'Par_programa'
      Origin = 'Par_programa'
      ProviderFlags = [pfInUpdate]
    end
    object QParametrosCadPar_Nome: TStringField
      FieldName = 'Par_Nome'
      Origin = 'Par_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object QParametrosCadPar_Valor: TStringField
      FieldName = 'Par_Valor'
      Origin = 'Par_Valor'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 250
    end
    object QParametrosCadPar_Obs: TStringField
      FieldName = 'Par_Obs'
      Origin = 'Par_Obs'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
  end
  object QParametrosCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Par_Id,'
      #9'Par_Codigo,'
      #9'Par_programa,'
      #9'Par_Nome,'
      '        Par_Valor'
      'FROM Parametros')
    Left = 328
    Top = 456
  end
  object dspParametrosCad: TDataSetProvider
    DataSet = QParametrosCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspParametrosCadUpdateError
    Left = 264
    Top = 456
  end
  object dspParametrosCons: TDataSetProvider
    DataSet = QParametrosCons
    UpdateMode = upWhereKeyOnly
    Left = 360
    Top = 456
  end
  object QVersaoCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Ver_DataInicio,'
      #9'Ver_DataLiberacao,'
      #9'Ver_Descricao,'
      #9'Ver_Id,'
      #9'Ver_Status,'
      #9'Ver_Tipo,'
      #9'Ver_Usuario,'
      '  Ver_Versao,'
      '  Ver_Produto,'
      #9'Sta_Codigo,'
      #9'Sta_Nome,'
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Usu_Codigo,'
      #9'Usu_Nome,'
      '  Prod_Codigo,'
      '  Prod_Nome'
      'FROM Versao'
      #9'INNER JOIN Status ON Ver_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Ver_Tipo = Tip_Id'
      #9'INNER JOIN Usuario ON Ver_Usuario = Usu_Id'
      '  LEFT JOIN Produto ON Ver_Produto = Prod_Id'
      'WHERE Ver_Id = :Id')
    Left = 328
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QVersaoCadVer_Id: TFDAutoIncField
      FieldName = 'Ver_Id'
      Origin = 'Ver_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QVersaoCadVer_DataInicio: TDateField
      FieldName = 'Ver_DataInicio'
      Origin = 'Ver_DataInicio'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVersaoCadVer_DataLiberacao: TDateField
      FieldName = 'Ver_DataLiberacao'
      Origin = 'Ver_DataLiberacao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVersaoCadVer_Descricao: TStringField
      FieldName = 'Ver_Descricao'
      Origin = 'Ver_Descricao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object QVersaoCadVer_Status: TIntegerField
      FieldName = 'Ver_Status'
      Origin = 'Ver_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVersaoCadVer_Tipo: TIntegerField
      FieldName = 'Ver_Tipo'
      Origin = 'Ver_Tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVersaoCadVer_Usuario: TIntegerField
      FieldName = 'Ver_Usuario'
      Origin = 'Ver_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QVersaoCadVer_Versao: TStringField
      FieldName = 'Ver_Versao'
      Origin = 'Ver_Versao'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object QVersaoCadSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = []
    end
    object QVersaoCadSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QVersaoCadTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
    end
    object QVersaoCadTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QVersaoCadUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QVersaoCadUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object QVersaoCadVer_Produto: TIntegerField
      FieldName = 'Ver_Produto'
      Origin = 'Ver_Produto'
      ProviderFlags = [pfInUpdate]
    end
    object QVersaoCadProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
      ProviderFlags = []
    end
    object QVersaoCadProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object QVersaoCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Ver_DataInicio,'
      #9'Ver_DataLiberacao,'
      #9'Ver_Descricao,'
      '        Ver_Versao,'
      #9'Ver_Id,'
      #9'Sta_Nome,'
      #9'Tip_Nome,'
      #9'Usu_Nome'
      'FROM Versao'
      #9'INNER JOIN Status ON Ver_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Ver_Tipo = Tip_Id'
      #9'INNER JOIN Usuario ON Ver_Usuario = Usu_Id')
    Left = 416
    Top = 16
  end
  object dspVersaoCad: TDataSetProvider
    DataSet = QVersaoCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspVersaoCadUpdateError
    Left = 368
    Top = 16
  end
  object dspVersaoCons: TDataSetProvider
    DataSet = QVersaoCons
    UpdateMode = upWhereKeyOnly
    Left = 448
    Top = 16
  end
  object QChamadoCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cha_Cliente,'
      #9'Cha_UsuarioAbertura,'
      #9'Cha_Contato,'
      #9'Cha_Nivel,'
      #9'Cha_Tipo,'
      #9'Cha_Status,'
      #9'Cha_Descricao,'
      #9'Cha_Modulo,'
      #9'Cha_Produto,'
      #9'Cha_UsuarioAtendeAtual,'
      '  Cha_HoraAtendeAtual,'
      '  Cha_TipoMovimento,'
      '  Cha_Origem,'
      #9'Usu_Codigo,'
      #9'Usu_Nome,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Sta_Codigo,'
      #9'Sta_Nome,'
      #9'Mod_Codigo,'
      #9'Mod_Nome,'
      #9'Prod_Codigo,'
      #9'Prod_Nome'
      'FROM Chamado'
      #9'INNER JOIN Usuario ON Cha_UsuarioAbertura = Usu_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'LEFT JOIN Modulo ON Cha_Modulo = Mod_Id'
      #9'LEFT JOIN Produto ON Cha_Produto = Prod_Id'
      'WHERE Cha_Id = :Id')
    Left = 544
    Top = 16
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QChamadoCadCha_Id: TFDAutoIncField
      FieldName = 'Cha_Id'
      Origin = 'Cha_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QChamadoCadCha_DataAbertura: TDateField
      FieldName = 'Cha_DataAbertura'
      Origin = 'Cha_DataAbertura'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoCadCha_HoraAbertura: TTimeField
      FieldName = 'Cha_HoraAbertura'
      Origin = 'Cha_HoraAbertura'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoCadCha_Cliente: TIntegerField
      FieldName = 'Cha_Cliente'
      Origin = 'Cha_Cliente'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoCadCha_UsuarioAbertura: TIntegerField
      FieldName = 'Cha_UsuarioAbertura'
      Origin = 'Cha_UsuarioAbertura'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoCadCha_Contato: TStringField
      FieldName = 'Cha_Contato'
      Origin = 'Cha_Contato'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object QChamadoCadCha_Nivel: TIntegerField
      FieldName = 'Cha_Nivel'
      Origin = 'Cha_Nivel'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoCadCha_Tipo: TIntegerField
      FieldName = 'Cha_Tipo'
      Origin = 'Cha_Tipo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoCadCha_Status: TIntegerField
      FieldName = 'Cha_Status'
      Origin = 'Cha_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoCadCha_Descricao: TStringField
      FieldName = 'Cha_Descricao'
      Origin = 'Cha_Descricao'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 1000
    end
    object QChamadoCadCha_Modulo: TIntegerField
      FieldName = 'Cha_Modulo'
      Origin = 'Cha_Modulo'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoCadCha_Produto: TIntegerField
      FieldName = 'Cha_Produto'
      Origin = 'Cha_Produto'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoCadCha_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Cha_UsuarioAtendeAtual'
      Origin = 'Cha_UsuarioAtendeAtual'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoCadCha_HoraAtendeAtual: TTimeField
      FieldName = 'Cha_HoraAtendeAtual'
      Origin = 'Cha_HoraAtendeAtual'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoCadCha_TipoMovimento: TIntegerField
      FieldName = 'Cha_TipoMovimento'
      Origin = 'Cha_TipoMovimento'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoCadCha_Origem: TIntegerField
      FieldName = 'Cha_Origem'
      Origin = 'Cha_Origem'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoCadUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
      Required = True
    end
    object QChamadoCadCli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      ProviderFlags = []
      Required = True
    end
    object QChamadoCadCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object QChamadoCadTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
      Required = True
    end
    object QChamadoCadTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Required = True
      Size = 50
    end
    object QChamadoCadSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = []
      Required = True
    end
    object QChamadoCadSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = []
      Required = True
      Size = 50
    end
    object QChamadoCadMod_Codigo: TIntegerField
      FieldName = 'Mod_Codigo'
      Origin = 'Mod_Codigo'
      ProviderFlags = []
    end
    object QChamadoCadMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QChamadoCadProd_Codigo: TIntegerField
      FieldName = 'Prod_Codigo'
      Origin = 'Prod_Codigo'
      ProviderFlags = []
    end
    object QChamadoCadProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QChamadoCadUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
  end
  object QChamadoCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cha_Descricao,'
      '        Cha_Status,'
      #9'Usu_nome,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      #9'Cli_Nome,'
      '        Cli_Fantasia,'
      #9'Tip_Nome,'
      #9'Sta_Nome'
      'FROM Chamado'
      #9'INNER JOIN Usuario ON Cha_UsuarioAbertura = Usu_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id')
    Left = 648
    Top = 16
  end
  object dspChamadoCad: TDataSetProvider
    DataSet = QChamadoCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspChamadoCadUpdateError
    Left = 584
    Top = 16
  end
  object dspChamadoCons: TDataSetProvider
    DataSet = QChamadoCons
    Left = 680
    Top = 16
  end
  object QChamadoOcorrenciaCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'ChOco_Id,'
      #9'ChOco_Chamado,'
      #9'ChOco_Docto,'
      #9'ChOco_Data,'
      #9'ChOco_HoraInicio,'
      #9'ChOco_HoraFim,'
      #9'ChOco_Usuario,'
      #9'ChOco_UsuarioColab1,'
      #9'ChOco_UsuarioColab2,'
      #9'ChOco_UsuarioColab3,'
      #9'ChOco_DescricaoTecnica,'
      #9'ChOco_DescricaoSolucao,'
      #9'ChOco_Anexo,'
      '        ChOco_Versao,'
      '        ChOco_TotalHoras, '
      #9'usu0.Usu_Codigo,'
      #9'usu0.Usu_Nome,'
      #9'usu1.Usu_Codigo AS Usu_Codigo1,'
      #9'usu1.Usu_Nome AS Usu_Nome1,'
      #9'usu2.Usu_Codigo AS Usu_Codigo2,'
      #9'usu2.Usu_Nome AS Usu_Nome2,'
      #9'usu3.Usu_Codigo AS Usu_Codigo3,'
      #9'usu3.Usu_Nome AS Usu_Nome3'
      'FROM Chamado_Ocorrencia'
      #9'INNER JOIN Usuario Usu0 ON ChOco_Usuario = usu0.Usu_Id'
      #9'LEFT JOIN Usuario usu1  ON ChOco_UsuarioColab1 = usu1.Usu_Id'
      #9'LEFT JOIN Usuario usu2  ON ChOco_UsuarioColab2 = usu2.Usu_Id'
      #9'LEFT JOIN Usuario usu3  ON ChOco_UsuarioColab3 = usu3.Usu_Id'
      'WHERE ChOco_Id = :Id')
    Left = 544
    Top = 64
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QChamadoOcorrenciaCadChOco_Id: TFDAutoIncField
      Alignment = taLeftJustify
      FieldName = 'ChOco_Id'
      Origin = 'ChOco_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QChamadoOcorrenciaCadChOco_Chamado: TIntegerField
      FieldName = 'ChOco_Chamado'
      Origin = 'ChOco_Chamado'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaCadChOco_Docto: TStringField
      FieldName = 'ChOco_Docto'
      Origin = 'ChOco_Docto'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object QChamadoOcorrenciaCadChOco_Data: TDateField
      FieldName = 'ChOco_Data'
      Origin = 'ChOco_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaCadChOco_HoraInicio: TTimeField
      FieldName = 'ChOco_HoraInicio'
      Origin = 'ChOco_HoraInicio'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaCadChOco_HoraFim: TTimeField
      FieldName = 'ChOco_HoraFim'
      Origin = 'ChOco_HoraFim'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaCadChOco_Usuario: TIntegerField
      FieldName = 'ChOco_Usuario'
      Origin = 'ChOco_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaCadChOco_UsuarioColab1: TIntegerField
      FieldName = 'ChOco_UsuarioColab1'
      Origin = 'ChOco_UsuarioColab1'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoOcorrenciaCadChOco_UsuarioColab2: TIntegerField
      FieldName = 'ChOco_UsuarioColab2'
      Origin = 'ChOco_UsuarioColab2'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoOcorrenciaCadChOco_UsuarioColab3: TIntegerField
      FieldName = 'ChOco_UsuarioColab3'
      Origin = 'ChOco_UsuarioColab3'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoOcorrenciaCadChOco_DescricaoTecnica: TStringField
      FieldName = 'ChOco_DescricaoTecnica'
      Origin = 'ChOco_DescricaoTecnica'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object QChamadoOcorrenciaCadChOco_DescricaoSolucao: TStringField
      FieldName = 'ChOco_DescricaoSolucao'
      Origin = 'ChOco_DescricaoSolucao'
      ProviderFlags = [pfInUpdate]
      Size = 2000
    end
    object QChamadoOcorrenciaCadChOco_Anexo: TStringField
      FieldName = 'ChOco_Anexo'
      Origin = 'ChOco_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object QChamadoOcorrenciaCadChOco_TotalHoras: TFloatField
      FieldName = 'ChOco_TotalHoras'
      Origin = 'ChOco_TotalHoras'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaCadChOco_Versao: TStringField
      FieldName = 'ChOco_Versao'
      Origin = 'ChOco_Versao'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object QChamadoOcorrenciaCadUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QChamadoOcorrenciaCadUsu_Codigo1: TIntegerField
      FieldName = 'Usu_Codigo1'
      Origin = 'Usu_Codigo1'
      ProviderFlags = []
    end
    object QChamadoOcorrenciaCadUsu_Codigo2: TIntegerField
      FieldName = 'Usu_Codigo2'
      Origin = 'Usu_Codigo2'
      ProviderFlags = []
    end
    object QChamadoOcorrenciaCadUsu_Codigo3: TIntegerField
      FieldName = 'Usu_Codigo3'
      Origin = 'Usu_Codigo3'
      ProviderFlags = []
    end
    object QChamadoOcorrenciaCadUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object QChamadoOcorrenciaCadUsu_Nome1: TWideStringField
      FieldName = 'Usu_Nome1'
      Origin = 'Usu_Nome1'
      ProviderFlags = []
      Size = 100
    end
    object QChamadoOcorrenciaCadUsu_Nome2: TWideStringField
      FieldName = 'Usu_Nome2'
      Origin = 'Usu_Nome2'
      ProviderFlags = []
      Size = 100
    end
    object QChamadoOcorrenciaCadUsu_Nome3: TWideStringField
      FieldName = 'Usu_Nome3'
      Origin = 'Usu_Nome3'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspChamadoOcorrenciaCad: TDataSetProvider
    DataSet = QChamadoOcorrenciaCad
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspChamadoOcorrenciaCadUpdateError
    Left = 584
    Top = 64
  end
  object QChamadoOcorrenciaCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'ChOco_Id,'
      #9'ChOco_Chamado,'
      #9'ChOco_Docto,'
      #9'ChOco_Data,'
      #9'ChOco_HoraInicio,'
      #9'ChOco_HoraFim,'
      #9'ChOco_Usuario,'
      #9'ChOco_UsuarioColab1,'
      #9'ChOco_UsuarioColab2,'
      #9'ChOco_UsuarioColab3,'
      #9'ChOco_DescricaoTecnica,'
      #9'ChOco_DescricaoSolucao,'
      #9'ChOco_Anexo,'
      '        ChOco_TotalHoras, '
      '        ChOco_Versao,'
      #9'usu0.Usu_Codigo,'
      #9'usu0.Usu_Nome,'
      #9'usu1.Usu_Codigo AS Usu_Codigo1,'
      #9'usu1.Usu_Nome AS Usu_Nome1,'
      #9'usu2.Usu_Codigo AS Usu_Codigo2,'
      #9'usu2.Usu_Nome AS Usu_Nome2,'
      #9'usu3.Usu_Codigo AS Usu_Codigo3,'
      #9'usu3.Usu_Nome AS Usu_Nome3'
      'FROM Chamado_Ocorrencia'
      #9'INNER JOIN Usuario Usu0 ON ChOco_Usuario = usu0.Usu_Id'
      #9'LEFT JOIN Usuario usu1  ON ChOco_UsuarioColab1 = usu1.Usu_Id'
      #9'LEFT JOIN Usuario usu2  ON ChOco_UsuarioColab2 = usu2.Usu_Id'
      #9'LEFT JOIN Usuario usu3  ON ChOco_UsuarioColab3 = usu3.Usu_Id'
      'WHERE ChOco_Chamado = :IdChamado'
      'ORDER BY ChOco_Id')
    Left = 648
    Top = 64
    ParamData = <
      item
        Name = 'IDCHAMADO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QChamadoOcorrenciaConsChOco_Id: TFDAutoIncField
      FieldName = 'ChOco_Id'
      Origin = 'ChOco_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QChamadoOcorrenciaConsChOco_Chamado: TIntegerField
      FieldName = 'ChOco_Chamado'
      Origin = 'ChOco_Chamado'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaConsChOco_Docto: TStringField
      FieldName = 'ChOco_Docto'
      Origin = 'ChOco_Docto'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object QChamadoOcorrenciaConsChOco_Data: TDateField
      FieldName = 'ChOco_Data'
      Origin = 'ChOco_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaConsChOco_HoraInicio: TTimeField
      FieldName = 'ChOco_HoraInicio'
      Origin = 'ChOco_HoraInicio'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaConsChOco_HoraFim: TTimeField
      FieldName = 'ChOco_HoraFim'
      Origin = 'ChOco_HoraFim'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaConsChOco_Usuario: TIntegerField
      FieldName = 'ChOco_Usuario'
      Origin = 'ChOco_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaConsChOco_UsuarioColab1: TIntegerField
      FieldName = 'ChOco_UsuarioColab1'
      Origin = 'ChOco_UsuarioColab1'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoOcorrenciaConsChOco_UsuarioColab2: TIntegerField
      FieldName = 'ChOco_UsuarioColab2'
      Origin = 'ChOco_UsuarioColab2'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoOcorrenciaConsChOco_UsuarioColab3: TIntegerField
      FieldName = 'ChOco_UsuarioColab3'
      Origin = 'ChOco_UsuarioColab3'
      ProviderFlags = [pfInUpdate]
    end
    object QChamadoOcorrenciaConsChOco_DescricaoTecnica: TStringField
      FieldName = 'ChOco_DescricaoTecnica'
      Origin = 'ChOco_DescricaoTecnica'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object QChamadoOcorrenciaConsChOco_DescricaoSolucao: TStringField
      FieldName = 'ChOco_DescricaoSolucao'
      Origin = 'ChOco_DescricaoSolucao'
      ProviderFlags = [pfInUpdate]
      Size = 2000
    end
    object QChamadoOcorrenciaConsChOco_Anexo: TStringField
      FieldName = 'ChOco_Anexo'
      Origin = 'ChOco_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 1000
    end
    object QChamadoOcorrenciaConsChOco_TotalHoras: TFloatField
      FieldName = 'ChOco_TotalHoras'
      Origin = 'ChOco_TotalHoras'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoOcorrenciaConsChOco_Versao: TStringField
      FieldName = 'ChOco_Versao'
      Origin = 'ChOco_Versao'
      ProviderFlags = [pfInUpdate]
      Size = 25
    end
    object QChamadoOcorrenciaConsUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QChamadoOcorrenciaConsUsu_Codigo1: TIntegerField
      FieldName = 'Usu_Codigo1'
      Origin = 'Usu_Codigo1'
      ProviderFlags = []
    end
    object QChamadoOcorrenciaConsUsu_Codigo2: TIntegerField
      FieldName = 'Usu_Codigo2'
      Origin = 'Usu_Codigo2'
      ProviderFlags = []
    end
    object QChamadoOcorrenciaConsUsu_Codigo3: TIntegerField
      FieldName = 'Usu_Codigo3'
      Origin = 'Usu_Codigo3'
      ProviderFlags = []
    end
    object QChamadoOcorrenciaConsUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object QChamadoOcorrenciaConsUsu_Nome1: TWideStringField
      FieldName = 'Usu_Nome1'
      Origin = 'Usu_Nome1'
      ProviderFlags = []
      Size = 100
    end
    object QChamadoOcorrenciaConsUsu_Nome2: TWideStringField
      FieldName = 'Usu_Nome2'
      Origin = 'Usu_Nome2'
      ProviderFlags = []
      Size = 100
    end
    object QChamadoOcorrenciaConsUsu_Nome3: TWideStringField
      FieldName = 'Usu_Nome3'
      Origin = 'Usu_Nome3'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspChamadoOcorrenciaCons: TDataSetProvider
    DataSet = QChamadoOcorrenciaCons
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspChamadoOcorrenciaConsUpdateError
    Left = 680
    Top = 64
  end
  object QChamadoStatus: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'ChSta_Chamado,'
      #9'ChSta_Data,'
      #9'ChSta_Hora,'
      #9'ChSta_Id,'
      #9'ChSta_Status,'
      #9'ChSta_Usuario,'
      #9'Sta_Codigo,'
      #9'Sta_Nome,'
      #9'Usu_Codigo,'
      #9'Usu_Nome'
      'FROM Chamado_Status'
      #9'INNER JOIN Chamado ON ChSta_Chamado = Cha_Id'
      #9'INNER JOIN Status ON ChSta_Status = Sta_Id'
      #9'INNER JOIN Usuario ON ChSta_Usuario = Usu_Id'
      'WHERE ChSta_Chamado = :IdChamado'
      'ORDER BY ChSta_Data DESC')
    Left = 416
    Top = 64
    ParamData = <
      item
        Name = 'IDCHAMADO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QChamadoStatusChSta_Id: TFDAutoIncField
      FieldName = 'ChSta_Id'
      Origin = 'ChSta_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QChamadoStatusChSta_Chamado: TIntegerField
      FieldName = 'ChSta_Chamado'
      Origin = 'ChSta_Chamado'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoStatusChSta_Data: TDateField
      FieldName = 'ChSta_Data'
      Origin = 'ChSta_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoStatusChSta_Status: TIntegerField
      FieldName = 'ChSta_Status'
      Origin = 'ChSta_Status'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoStatusChSta_Usuario: TIntegerField
      FieldName = 'ChSta_Usuario'
      Origin = 'ChSta_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamadoStatusSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QChamadoStatusSta_Codigo: TIntegerField
      FieldName = 'Sta_Codigo'
      Origin = 'Sta_Codigo'
      ProviderFlags = []
    end
    object QChamadoStatusUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QChamadoStatusUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Required = True
      Size = 100
    end
    object QChamadoStatusChSta_Hora: TTimeField
      FieldName = 'ChSta_Hora'
      Origin = 'ChSta_Hora'
    end
  end
  object dspChamadoStatus: TDataSetProvider
    DataSet = QChamadoStatus
    UpdateMode = upWhereKeyOnly
    Left = 448
    Top = 64
  end
  object spBackup: TFDStoredProc
    Connection = DM.Conexao
    SchemaName = 'dbo'
    StoredProcName = 'Backup_SIDomper_sp'
    Left = 488
    Top = 8
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
      end
      item
        Position = 2
        Name = '@Destino'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
  object QRelChamadoModelo1: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cha_Contato,'
      #9'Cha_Nivel,'
      #9'CASE Cha_Nivel'
      #9#9'WHEN 1 THEN '#39'Baixo'#39
      #9#9'WHEN 2 THEN '#39'Normal'#39
      #9#9'WHEN 3 THEN '#39'Alto'#39
      #9#9'WHEN 4 THEN '#39'Critico'#39
      #9'END AS Nivel,'
      #9'Tip_Nome,'
      #9'Sta_Nome,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      
        #9'TotalHorasGeral = (SELECT SUM(ChOco_TotalHoras) FROM Chamado_Oc' +
        'orrencia'
      #9#9#9#9#9'WHERE Cha_Id = ChOco_Chamado)'
      'FROM Chamado'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      '        INNER JOIN Usuario ON Cha_UsuarioAbertura = Usu_Id'
      '        INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 544
    Top = 120
    object QRelChamadoModelo1Cha_Id: TFDAutoIncField
      FieldName = 'Cha_Id'
      Origin = 'Cha_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QRelChamadoModelo1Cha_DataAbertura: TDateField
      FieldName = 'Cha_DataAbertura'
      Origin = 'Cha_DataAbertura'
      Required = True
    end
    object QRelChamadoModelo1Cha_HoraAbertura: TTimeField
      FieldName = 'Cha_HoraAbertura'
      Origin = 'Cha_HoraAbertura'
      Required = True
    end
    object QRelChamadoModelo1Cha_Contato: TStringField
      FieldName = 'Cha_Contato'
      Origin = 'Cha_Contato'
      Size = 100
    end
    object QRelChamadoModelo1Cha_Nivel: TIntegerField
      FieldName = 'Cha_Nivel'
      Origin = 'Cha_Nivel'
      Required = True
    end
    object QRelChamadoModelo1Nivel: TStringField
      FieldName = 'Nivel'
      Origin = 'Nivel'
      ReadOnly = True
      Size = 7
    end
    object QRelChamadoModelo1Tip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Required = True
      Size = 50
    end
    object QRelChamadoModelo1Sta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object QRelChamadoModelo1Cli_Codigo: TIntegerField
      FieldName = 'Cli_Codigo'
      Origin = 'Cli_Codigo'
      Required = True
    end
    object QRelChamadoModelo1Cli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object QRelChamadoModelo1TotalHorasGeral: TFloatField
      FieldName = 'TotalHorasGeral'
      Origin = 'TotalHorasGeral'
      ReadOnly = True
    end
  end
  object QRelChamadoDetModelo1: TFDQuery
    MasterSource = dsChamadoModelo1
    MasterFields = 'Cha_Id'
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'ChOco_Data,'
      #9'ChOco_HoraInicio,'
      #9'ChOco_HoraFim,'
      #9'ChOco_DescricaoSolucao,'
      '        ChOco_TotalHoras,'
      #9'Usu_UserName'
      'FROM Chamado_Ocorrencia'
      #9'INNER JOIN Usuario ON ChOco_Usuario = Usu_Id'
      'WHERE ChOco_Chamado = :Cha_Id')
    Left = 656
    Top = 120
    ParamData = <
      item
        Name = 'CHA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QRelChamadoDetModelo1ChOco_Data: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ChOco_Data'
      ProviderFlags = []
      Required = True
    end
    object QRelChamadoDetModelo1ChOco_HoraInicio: TTimeField
      FieldName = 'ChOco_HoraInicio'
      Required = True
    end
    object QRelChamadoDetModelo1ChOco_HoraFim: TTimeField
      AutoGenerateValue = arDefault
      FieldName = 'ChOco_HoraFim'
      ProviderFlags = []
      Required = True
    end
    object QRelChamadoDetModelo1ChOco_DescricaoSolucao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ChOco_DescricaoSolucao'
      ProviderFlags = []
      Size = 1000
    end
    object QRelChamadoDetModelo1Usu_UserName: TWideStringField
      FieldName = 'Usu_UserName'
      Required = True
      Size = 50
    end
    object QRelChamadoDetModelo1ChOco_TotalHoras: TFloatField
      FieldName = 'ChOco_TotalHoras'
      Origin = 'ChOco_TotalHoras'
      Required = True
    end
  end
  object dsChamadoModelo1: TDataSource
    DataSet = QRelChamadoModelo1
    Left = 600
    Top = 120
  end
  object dspRelChamadoModelo1: TDataSetProvider
    DataSet = QRelChamadoModelo1
    Left = 544
    Top = 168
  end
  object dspRelChamadoDetModelo1: TDataSetProvider
    DataSet = QRelChamadoDetModelo1
    Left = 640
    Top = 168
  end
  object QRelChamadoModelo2: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome,'
      #9'COUNT(DISTINCT Cha_Id) AS QtdeChamados,'
      #9'SUM(ChOco_TotalHoras) TotalHoras'#9
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON Cha_UsuarioAbertura = Usu_Id'#9#9
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Chamado_Ocorrencia ON Cha_Id = ChOco_Chamado'
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id'
      'GROUP BY '
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome'
      '')
    Left = 416
    Top = 112
  end
  object dspRelChamadoModelo2: TDataSetProvider
    DataSet = QRelChamadoModelo2
    Left = 448
    Top = 112
  end
  object QRelChamadoModelo3: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Usu_Codigo,'
      #9'Usu_Nome,'
      #9'COUNT(DISTINCT Cha_Id) AS QtdeChamados,'
      #9'SUM(DISTINCT ChOco_TotalHoras) AS TotalHoras,'
      '        SUM(ChOco_TotalHoras) AS TotalHorasDetalhes'
      'FROM Chamado_Ocorrencia'
      #9'INNER JOIN Chamado ON ChOco_Chamado = Cha_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON ChOco_Usuario  = Usu_Id'#9#9
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id'
      'GROUP BY'
      #9'Usu_Codigo,'
      #9'Usu_Nome')
    Left = 416
    Top = 160
  end
  object dspRelChamadoModelo3: TDataSetProvider
    DataSet = QRelChamadoModelo3
    Left = 448
    Top = 160
  end
  object QRelChamadoModelo4: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome,'
      #9'COUNT(DISTINCT Cha_Id) AS QtdeChamados,'
      #9'SUM(DISTINCT ChOco_TotalHoras) TotalHoras'#9
      'FROM Chamado_Ocorrencia'
      #9'INNER JOIN Chamado ON ChOco_Chamado = Cha_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON ChOco_Usuario  = Usu_Id'#9#9
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id'
      'GROUP BY'
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome')
    Left = 416
    Top = 208
  end
  object dspRelChamadoModelo4: TDataSetProvider
    DataSet = QRelChamadoModelo4
    Left = 448
    Top = 208
  end
  object QRelVisitaModelo1: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Vis_Id,'
      #9'Vis_Data,'
      #9'Vis_HoraInicio,'
      #9'Vis_Dcto,'
      #9'Vis_HoraFim,'
      #9'Vis_Contato,'
      #9'Vis_Descricao,'
      #9'Vis_TotalHoras,'
      #9'Vis_FormaPagto,'
      #9'Vis_Valor,'
      #9'Tip_Nome,'
      #9'Sta_Nome,'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      '        Usu_Codigo,'
      '        Usu_Nome'
      'FROM Visita'
      #9'INNER JOIN Tipo ON Vis_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      '        INNER JOIN Usuario ON Vis_Usuario = Usu_Id'
      '        INNER JOIN Revenda ON Cli_Revenda = Rev_Id')
    Left = 416
    Top = 256
  end
  object QRelVisitaModelo3: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Usu_Id,'
      #9'Usu_Codigo,'
      #9'Usu_Nome,'
      #9'COUNT(Vis_Id) AS QtdeChamados,'
      #9'SUM(Vis_TotalHoras) TotalHoras,'
      '    SUM(Vis_Valor) AS TotalValor'
      'FROM Visita'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Vis_Tipo = Tip_Id'
      #9'INNER JOIN Usuario ON Vis_Usuario = Usu_Id'
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id'
      'GROUP BY'
      #9'Usu_Id,'
      #9'Usu_Codigo,'
      #9'Usu_Nome')
    Left = 416
    Top = 352
  end
  object QRelVisitaModelo4: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome,'
      #9'COUNT(Vis_Id) AS QtdeChamados,'
      #9'SUM(Vis_TotalHoras) TotalHoras,'
      '        SUM(Vis_Valor) AS TotalValor'
      'FROM Visita'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON Vis_Usuario  = Usu_Id'#9#9
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Vis_Status = Tip_Id'#9
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id'
      'GROUP BY'
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome')
    Left = 416
    Top = 400
  end
  object dspRelVisitaModelo1: TDataSetProvider
    DataSet = QRelVisitaModelo1
    Left = 448
    Top = 256
  end
  object dspRelVisitaModelo3: TDataSetProvider
    DataSet = QRelVisitaModelo3
    Left = 448
    Top = 352
  end
  object dspRelVisitaModelo4: TDataSetProvider
    DataSet = QRelVisitaModelo4
    Left = 448
    Top = 400
  end
  object QRelVisitaModelo2: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome,'
      #9'COUNT(Vis_Id) AS QtdeChamados,'
      #9'SUM(Vis_TotalHoras)AS TotalHoras,'
      '        SUM(Vis_Valor) AS TotalValor'
      'FROM Visita'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON Vis_Usuario = Usu_Id'#9#9
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Vis_Tipo = Tip_Id'
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id'
      'GROUP BY'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      #9'Rev_Codigo,'
      #9'Rev_Nome'
      '')
    Left = 416
    Top = 304
  end
  object dspRelVisitaModelo2: TDataSetProvider
    DataSet = QRelVisitaModelo2
    Left = 448
    Top = 304
  end
  object QParametrosTitulosChamados: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Par_Codigo,'
      #9'Sta_Codigo,'
      #9'Sta_Nome'
      'FROM Parametros'#9
      #9'INNER JOIN Status ON Par_Valor = Sta_Codigo'
      
        #9'WHERE Par_Codigo IN (3,4,5,6,7,8,12,13,14,15,16,17,19,20,21,22,' +
        '23,24,25,26,27,28,29,30)')
    Left = 544
    Top = 224
  end
  object dspParametrosTitulosChamados: TDataSetProvider
    DataSet = QParametrosTitulosChamados
    Left = 584
    Top = 224
  end
  object QChamadoQuadro1: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,        '
      '        Usu_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),        '
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        cha_HoraAtendeAtual'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE par_Codigo = 3')
    Left = 544
    Top = 272
  end
  object dspChamadoQuadro1: TDataSetProvider
    DataSet = QChamadoQuadro1
    Left = 584
    Top = 272
  end
  object QChamadoQuadro2: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Cli_Codigo,'
      '        Sta_Codigo,'
      #9'Tip_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        cha_HoraAtendeAtual,'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '    LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 4'
      'AND Par_Programa = 1'#9#9
      '')
    Left = 544
    Top = 320
  end
  object dspChamadoQuadro2: TDataSetProvider
    DataSet = QChamadoQuadro2
    Left = 584
    Top = 320
  end
  object QChamadoQuadro3: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '        Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        cha_HoraAtendeAtual,'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '    LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 5'
      'AND Par_Programa = 1'#9#9)
    Left = 544
    Top = 368
  end
  object dspChamadoQuadro3: TDataSetProvider
    DataSet = QChamadoQuadro3
    Left = 584
    Top = 368
  end
  object QChamadoQuadro4: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        cha_HoraAtendeAtual,'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '    LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 6'
      'AND Par_Programa = 1'#9#9)
    Left = 544
    Top = 416
  end
  object dspChamadoQuadro4: TDataSetProvider
    DataSet = QChamadoQuadro4
    Left = 584
    Top = 416
  end
  object QChamadoQuadro5: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        cha_HoraAtendeAtual,'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '    LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 7'
      'AND Par_Programa = 1'#9#9)
    Left = 544
    Top = 464
  end
  object dspChamadoQuadro5: TDataSetProvider
    DataSet = QChamadoQuadro5
    Left = 584
    Top = 464
  end
  object QChamadoQuadro6: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        cha_HoraAtendeAtual,'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '    LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 8'
      'AND Par_Programa = 1'#9#9)
    Left = 544
    Top = 515
  end
  object dspChamadoQuadro6: TDataSetProvider
    DataSet = QChamadoQuadro6
    Left = 584
    Top = 515
  end
  object QUsuarioAcessoMenu: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'DepAc_Acesso,'
      #9'DepAc_Programa'
      'FROM Usuario'
      #9'INNER JOIN Departamento ON Usu_Departamento = Dep_Id'
      #9'INNER JOIN Departamento_Acesso ON Dep_Id = DepAc_Departamento'
      'WHERE Usu_Id = :IdUsuario'
      'AND DepAc_Acesso = 0')
    Left = 750
    Top = 16
    ParamData = <
      item
        Name = 'IDUSUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspUsuarioAcessoMenu: TDataSetProvider
    DataSet = QUsuarioAcessoMenu
    Left = 800
    Top = 16
  end
  object QListarTabelas: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT name AS Tabelas FROM SYSOBJECTS WHERE xtype = '#39'U'#39
      'ORDER BY name')
    Left = 752
    Top = 64
  end
  object QListarCampos: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT COLUMN_NAME AS COLUNA'
      'FROM INFORMATION_SCHEMA.COLUMNS'
      'WHERE TABLE_NAME = :Tabela AND TABLE_SCHEMA='#39'dbo'#39
      'ORDER BY COLUMN_NAME')
    Left = 752
    Top = 112
    ParamData = <
      item
        Name = 'TABELA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspListarTabelas: TDataSetProvider
    DataSet = QListarTabelas
    Left = 800
    Top = 64
  end
  object dspListarCampos: TDataSetProvider
    DataSet = QListarCampos
    Left = 800
    Top = 112
  end
  object QInstrucaoSQL: TFDQuery
    Connection = DM.Conexao
    Left = 752
    Top = 160
  end
  object dspInstrucaoSQL: TDataSetProvider
    DataSet = QInstrucaoSQL
    Left = 800
    Top = 160
  end
  object QSolicitacaoQuadro1: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      '        Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 12'
      'AND Par_Programa = 3'#9#9
      ''
      'ORDER BY Sol_Data')
    Left = 640
    Top = 272
  end
  object dspSolicitacaoQuadro1: TDataSetProvider
    DataSet = QSolicitacaoQuadro1
    Left = 680
    Top = 272
  end
  object QSolicitacaoQuadro2: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      '        Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      '        Usu_Nome,'
      '  Cli_Perfil,'
      #9'Cli_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 13'
      'AND Par_Programa = 3'#9#9)
    Left = 640
    Top = 320
  end
  object dspSolicitacaoQuadro2: TDataSetProvider
    DataSet = QSolicitacaoQuadro2
    Left = 680
    Top = 320
  end
  object QSolicitacaoQuadro3: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '    LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 14'
      'AND Par_Programa = 3'#9#9)
    Left = 640
    Top = 368
  end
  object dspSolicitacaoQuadro3: TDataSetProvider
    DataSet = QSolicitacaoQuadro3
    Left = 680
    Top = 368
  end
  object QSolicitacaoQuadro4: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '    LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 15'
      'AND Par_Programa = 3'#9#9)
    Left = 640
    Top = 416
  end
  object dspSolicitacaoQuadro4: TDataSetProvider
    DataSet = QSolicitacaoQuadro4
    Left = 680
    Top = 416
  end
  object QSolicitacaoQuadro5: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome, '
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 16'
      'AND Par_Programa = 3'#9#9)
    Left = 640
    Top = 464
  end
  object dspSolicitacaoQuadro5: TDataSetProvider
    DataSet = QSolicitacaoQuadro5
    Left = 680
    Top = 464
  end
  object QSolicitacaoQuadro6: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome,'
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 17'
      'AND Par_Programa = 3'#9#9)
    Left = 640
    Top = 512
  end
  object dspSolicitacaoQuadro6: TDataSetProvider
    DataSet = QSolicitacaoQuadro6
    Left = 680
    Top = 512
  end
  object QChamadoProblemaSolucao: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'ChOco_Chamado,'
      #9'ChOco_Data,'
      #9'ChOco_HoraInicio,'
      #9'ChOco_HoraFim,'
      #9'ChOco_DescricaoSolucao,'
      #9'ChOco_DescricaoTecnica,'
      #9'Usu_Nome'
      'FROM Chamado_Ocorrencia'
      #9'INNER JOIN Usuario ON ChOco_Usuario = Usu_Id'#9
      #9'WHERE ChOco_Chamado < 10'
      'ORDER BY ChOco_Data')
    Left = 752
    Top = 216
  end
  object dspChamadoProblemaSolucao: TDataSetProvider
    DataSet = QChamadoProblemaSolucao
    Left = 800
    Top = 216
  end
  object dspUsuarioPermissaoListar: TDataSetProvider
    DataSet = QUsuarioPermissaoListar
    UpdateMode = upWhereKeyOnly
    Left = 800
    Top = 264
  end
  object QSolicitacaoQuadro7: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome,'
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 19'
      'AND Par_Programa = 3'#9#9)
    Left = 752
    Top = 320
  end
  object dspSolicitacaoQuadro7: TDataSetProvider
    DataSet = QSolicitacaoQuadro7
    Left = 792
    Top = 320
  end
  object QSolicitacaoQuadro8: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome,'
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 20'
      'AND Par_Programa = 3'#9#9)
    Left = 752
    Top = 368
  end
  object dspSolicitacaoQuadro8: TDataSetProvider
    DataSet = QSolicitacaoQuadro8
    Left = 792
    Top = 368
  end
  object QSolicitacaoQuadro9: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome,'
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 21'
      'AND Par_Programa = 3'#9#9)
    Left = 752
    Top = 416
  end
  object dspSolicitacaoQuadro9: TDataSetProvider
    DataSet = QSolicitacaoQuadro9
    Left = 792
    Top = 416
  end
  object QSolicitacaoQuadro10: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome,'
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 22'
      'AND Par_Programa = 3'#9#9)
    Left = 752
    Top = 464
  end
  object dspSolicitacaoQuadro10: TDataSetProvider
    DataSet = QSolicitacaoQuadro10
    Left = 792
    Top = 464
  end
  object QSolicitacaoQuadro11: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome,'
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 23'
      'AND Par_Programa = 3'#9#9)
    Left = 752
    Top = 512
  end
  object dspSolicitacaoQuadro11: TDataSetProvider
    DataSet = QSolicitacaoQuadro11
    Left = 792
    Top = 512
  end
  object QSolicitacaoQuadro12: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '        Sol_UsuarioAtendeAtual,'
      #9'Cli_Nome,'
      '        Usu_Nome'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 24'
      'AND Par_Programa = 3'#9#9)
    Left = 752
    Top = 560
  end
  object dspSolicitacaoQuadro12: TDataSetProvider
    DataSet = QSolicitacaoQuadro12
    Left = 792
    Top = 560
  end
  object QUsuarioPermissaoListar: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'#9
      '        UsuP_Id,'
      #9'UsuP_Sigla,'
      '        UsuP_Usuario'
      'FROM Usuario_Permissao'
      #9'WHERE UsuP_Usuario = :IdUsuario')
    Left = 752
    Top = 264
    ParamData = <
      item
        Name = 'IDUSUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QContaEmailCad: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'CtaEm_Id,'
      #9'CtaEm_Codigo,'
      #9'CtaEm_Nome,'
      #9'CtaEm_Email,'
      #9'CtaEm_Senha,'
      #9'CtaEm_SMTP,'
      #9'CtaEm_Porta,'
      #9'CtaEm_Ativo,'
      '        CtaEm_Autenticar,'
      '        CtaEm_AutenticarSSL'
      'FROM Conta_Email'
      #9'WHERE CtaEm_Id = :Id')
    Left = 48
    Top = 504
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QContaEmailCadCtaEm_Id: TFDAutoIncField
      FieldName = 'CtaEm_Id'
      Origin = 'CtaEm_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QContaEmailCadCtaEm_Codigo: TIntegerField
      FieldName = 'CtaEm_Codigo'
      Origin = 'CtaEm_Codigo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QContaEmailCadCtaEm_Nome: TStringField
      FieldName = 'CtaEm_Nome'
      Origin = 'CtaEm_Nome'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 60
    end
    object QContaEmailCadCtaEm_Email: TStringField
      FieldName = 'CtaEm_Email'
      Origin = 'CtaEm_Email'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object QContaEmailCadCtaEm_Senha: TStringField
      FieldName = 'CtaEm_Senha'
      Origin = 'CtaEm_Senha'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 30
    end
    object QContaEmailCadCtaEm_SMTP: TStringField
      FieldName = 'CtaEm_SMTP'
      Origin = 'CtaEm_SMTP'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 100
    end
    object QContaEmailCadCtaEm_Porta: TIntegerField
      FieldName = 'CtaEm_Porta'
      Origin = 'CtaEm_Porta'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QContaEmailCadCtaEm_Ativo: TBooleanField
      FieldName = 'CtaEm_Ativo'
      Origin = 'CtaEm_Ativo'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QContaEmailCadCtaEm_Autenticar: TBooleanField
      FieldName = 'CtaEm_Autenticar'
      Origin = 'CtaEm_Autenticar'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QContaEmailCadCtaEm_AutenticarSSL: TBooleanField
      FieldName = 'CtaEm_AutenticarSSL'
      Origin = 'CtaEm_AutenticarSSL'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
  end
  object QContaEmailCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      '   CtaEm_Id, '
      '   CtaEm_Codigo, '
      '   CtaEm_Ativo, '
      '   CtaEm_Nome,'
      '   CtaEm_Email'
      'FROM Conta_Email')
    Left = 136
    Top = 504
  end
  object dspContaEmailCad: TDataSetProvider
    DataSet = QContaEmailCad
    UpdateMode = upWhereKeyOnly
    Left = 80
    Top = 504
  end
  object dspContaEmailCons: TDataSetProvider
    DataSet = QContaEmailCons
    Left = 168
    Top = 504
  end
  object QDepartamentoEmail: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'DepEm_Departamento,'
      #9'DepEm_Email,'
      #9'DepEm_Id'
      'FROM Departamento_Email'
      #9'WHERE DepEm_Departamento = :IdDepartamento')
    Left = 232
    Top = 504
    ParamData = <
      item
        Name = 'IDDEPARTAMENTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QDepartamentoEmailDepEm_Id: TFDAutoIncField
      AutoGenerateValue = arNone
      FieldName = 'DepEm_Id'
      Origin = 'DepEm_Id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object QDepartamentoEmailDepEm_Departamento: TIntegerField
      FieldName = 'DepEm_Departamento'
      Origin = 'DepEm_Departamento'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QDepartamentoEmailDepEm_Email: TStringField
      FieldName = 'DepEm_Email'
      Origin = 'DepEm_Email'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 80
    end
  end
  object dspDepartamentoEmail: TDataSetProvider
    DataSet = QDepartamentoEmail
    UpdateMode = upWhereKeyOnly
    Left = 264
    Top = 504
  end
  object QRevendaEmail: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'RevEm_Id,'
      #9'RevEm_Revenda,'
      #9'RevEm_Email'
      'FROM Revenda_Email'
      #9'WHERE RevEm_Revenda = :IdRevenda')
    Left = 136
    Top = 553
    ParamData = <
      item
        Name = 'IDREVENDA'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QRevendaEmailRevEm_Id: TFDAutoIncField
      FieldName = 'RevEm_Id'
      Origin = 'RevEm_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QRevendaEmailRevEm_Revenda: TIntegerField
      FieldName = 'RevEm_Revenda'
      Origin = 'RevEm_Revenda'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QRevendaEmailRevEm_Email: TStringField
      FieldName = 'RevEm_Email'
      Origin = 'RevEm_Email'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 80
    end
  end
  object dspRevendaEmail: TDataSetProvider
    DataSet = QRevendaEmail
    UpdateMode = upWhereKeyOnly
    Left = 168
    Top = 552
  end
  object QAtividadeQuadro1: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,        '
      '        Usu_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      ''
      '        cha_HoraAtendeAtual'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE par_Codigo = 25'
      'ORDER BY UltimaHora DESC')
    Left = 879
    Top = 264
  end
  object dspAtividadeQuadro1: TDataSetProvider
    DataSet = QAtividadeQuadro1
    Left = 927
    Top = 264
  end
  object QAtividadeQuadro2: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,        '
      '        Usu_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        cha_HoraAtendeAtual'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE par_Codigo = 26'
      'ORDER BY UltimaHora DESC')
    Left = 881
    Top = 312
  end
  object dspAtividadeQuadro2: TDataSetProvider
    DataSet = QAtividadeQuadro2
    Left = 929
    Top = 312
  end
  object QAtividadeQuadro3: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,        '
      '        Usu_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        cha_HoraAtendeAtual'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE par_Codigo = 27'
      'ORDER BY UltimaHora DESC')
    Left = 880
    Top = 360
  end
  object dspAtividadeQuadro3: TDataSetProvider
    DataSet = QAtividadeQuadro3
    Left = 928
    Top = 360
  end
  object QAtividadeQuadro4: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,        '
      '        Usu_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        cha_HoraAtendeAtual'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE par_Codigo = 28'
      'ORDER BY UltimaHora DESC')
    Left = 881
    Top = 408
  end
  object dspAtividadeQuadro4: TDataSetProvider
    DataSet = QAtividadeQuadro4
    Left = 929
    Top = 408
  end
  object QAtividadeQuadro5: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,        '
      '        Usu_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        cha_HoraAtendeAtual'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE par_Codigo = 29'
      'ORDER BY UltimaHora DESC')
    Left = 881
    Top = 456
  end
  object dspAtividadeQuadro5: TDataSetProvider
    DataSet = QAtividadeQuadro5
    Left = 929
    Top = 456
  end
  object QAtividadeQuadro6: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '        Cha_Nivel as Nivel,'
      '        Cha_UsuarioAtendeAtual,'
      '        Sta_Codigo,'
      '        Cli_Codigo,'
      #9'Tip_Nome,        '
      '        Usu_Nome,'
      
        '        UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia' +
        ' (Cha_Id),'
      '        ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '        Par_Codigo,'
      '        cha_HoraAtendeAtual'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '        LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE par_Codigo = 30'
      'ORDER BY UltimaHora DESC')
    Left = 882
    Top = 504
  end
  object dspAtividadeQuadro6: TDataSetProvider
    DataSet = QAtividadeQuadro6
    Left = 922
    Top = 504
  end
  object QChamado_Ocorr_Colaborador: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'[ChaOCol_Id],'
      #9'[ChaOCol_ChamadoOcorrencia],'
      #9'[ChaOCol_Usuario],'
      #9'[ChaOcol_HoraInicio],'
      #9'[ChaOCol_HoraFim],'
      #9'[ChaOcol_TotalHoras],'
      #9'[Usu_Nome],'
      #9'[Usu_Codigo]'
      'FROM dbo.Chamado_Ocorr_Colaborador AS CHL'
      
        #9'LEFT JOIN Chamado_Ocorrencia CHA ON CHA.ChOco_Id = CHL.ChaOCol_' +
        'ChamadoOcorrencia'
      
        #9'LEFT JOIN dbo.Usuario AS USU ON CHL.ChaOCol_Usuario = USU.Usu_I' +
        'd'
      'WHERE CHA.ChOco_Chamado = :IdChamado')
    Left = 880
    Top = 208
    ParamData = <
      item
        Name = 'IDCHAMADO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QChamado_Ocorr_ColaboradorChaOCol_Id: TFDAutoIncField
      FieldName = 'ChaOCol_Id'
      Origin = 'ChaOCol_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QChamado_Ocorr_ColaboradorChaOCol_ChamadoOcorrencia: TIntegerField
      FieldName = 'ChaOCol_ChamadoOcorrencia'
      Origin = 'ChaOCol_ChamadoOcorrencia'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamado_Ocorr_ColaboradorChaOCol_Usuario: TIntegerField
      FieldName = 'ChaOCol_Usuario'
      Origin = 'ChaOCol_Usuario'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamado_Ocorr_ColaboradorChaOcol_HoraInicio: TTimeField
      FieldName = 'ChaOcol_HoraInicio'
      Origin = 'ChaOcol_HoraInicio'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamado_Ocorr_ColaboradorChaOCol_HoraFim: TTimeField
      FieldName = 'ChaOCol_HoraFim'
      Origin = 'ChaOCol_HoraFim'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QChamado_Ocorr_ColaboradorChaOcol_TotalHoras: TFloatField
      FieldName = 'ChaOcol_TotalHoras'
      Origin = 'ChaOcol_TotalHoras'
      ProviderFlags = [pfInUpdate]
    end
    object QChamado_Ocorr_ColaboradorUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
    object QChamado_Ocorr_ColaboradorUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
  end
  object dspChamado_Ocorr_Colaborador: TDataSetProvider
    DataSet = QChamado_Ocorr_Colaborador
    UpdateMode = upWhereKeyOnly
    Left = 928
    Top = 208
  end
  object QChamadoAnexo: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      #9'CHA.Cha_Id,'
      #9'CHA.Cha_DataAbertura,'
      #9'CHA.Cha_HoraAbertura,'
      #9'CHA.Cha_Contato,'
      #9'CLI.Cli_Nome,'
      #9'CHA2.ChOco_Docto,'
      #9'CHA2.ChOco_Data,'
      #9'CHA2.ChOco_Anexo'
      'FROM dbo.Chamado AS CHA'
      #9'INNER JOIN dbo.Cliente AS CLI ON CHA.Cha_Cliente = CLI.Cli_Id'
      
        #9'INNER JOIN dbo.Chamado_Ocorrencia AS CHA2 ON CHA.Cha_Id = CHA2.' +
        'ChOco_Chamado'
      'WHERE CHA.Cha_Id = :Id'
      
        'AND ((CHA2.ChOco_Anexo IS NOT NULL) AND (LEN(CHA2.ChOco_Anexo) >' +
        ' 0))'
      'ORDER BY CHA2.ChOco_Data')
    Left = 883
    Top = 553
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object QSolicitacaoAnexo: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'SOL.Sol_Id,'
      #9'SOL.Sol_Data,'
      #9'SOL.Sol_Hora,'
      #9'SOL.Sol_Contato,'
      #9'SOL.Sol_Anexo,'
      #9'CLI.Cli_Nome,'
      #9'SOL2.SOcor_Data,'
      #9'SOL2.SOcor_Hora,'
      #9'IIF(SOL2.SOcor_Classificacao = 1, '#39'Geral'#39', '#39'T'#233'cnico'#39') AS Tipo,'
      #9'SOL2.SOcor_Anexo'
      'FROM dbo.Solicitacao AS SOL'
      #9'INNER JOIN dbo.Cliente AS CLI ON SOL.Sol_Cliente = CLI.Cli_Id'
      
        #9'INNER JOIN dbo.Solicitacao_Ocorrencia AS SOL2 ON SOL.Sol_Id = S' +
        'OL2.SOcor_Solicitacao'
      'WHERE sol.Sol_Id = :Id'
      'ORDER BY SOL2.SOcor_Data')
    Left = 880
    Top = 600
    ParamData = <
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspChamadoAnexo: TDataSetProvider
    DataSet = QChamadoAnexo
    Left = 928
    Top = 552
  end
  object dspSolicitacaoAnexo: TDataSetProvider
    DataSet = QSolicitacaoAnexo
    Left = 928
    Top = 600
  end
  object QRelChamadoModelo5: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'CAST(Cha_DataAbertura AS Date) as Cha_DataAbertura,'
      #9'COUNT(DISTINCT Cha_Id) AS QtdeChamados,'
      #9'SUM(ChOco_TotalHoras) as TotalHoras'
      'FROM Chamado'
      #9'INNER JOIN Chamado_Ocorrencia On Cha_Id = ChOco_Chamado'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      '        INNER JOIN Usuario ON Cha_UsuarioAbertura = Usu_Id'
      '        INNER JOIN Revenda ON Cli_Revenda = Rev_Id'
      'GROUP BY Cha_DataAbertura')
    Left = 864
    Top = 16
  end
  object dspRelChamadoModelo5: TDataSetProvider
    DataSet = QRelChamadoModelo5
    Left = 920
    Top = 16
  end
  object spChamado: TFDStoredProc
    Connection = DM.Conexao
    StoredProcName = 'Chamado_sp_IU'
    Left = 608
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
      end
      item
        Position = 2
        Name = '@IU'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 3
        Name = '@Id'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = '@DataAbertura'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 5
        Name = '@HoraAbertura'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 6
        Name = '@IdCliente'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 7
        Name = '@IdUsuarioAbertura'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 8
        Name = '@Contato'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Position = 9
        Name = '@Nivel'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = '@IdTipo'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = '@IdStatus'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 12
        Name = '@Descricao'
        DataType = ftString
        ParamType = ptInput
        Size = 1000
      end
      item
        Position = 13
        Name = '@IdModulo'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 14
        Name = '@IdProduto'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 15
        Name = '@IdUsuarioAtendeAtual'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 16
        Name = '@HoraAtendeAtual'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 17
        Name = '@TipoMovimento'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 18
        Name = '@RetornoId'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object spChamadoOcorrencia: TFDStoredProc
    Connection = DM.Conexao
    StoredProcName = 'ChamadoOcorrencia_sp_IU'
    Left = 608
    Top = 64
    ParamData = <
      item
        Position = 1
        Name = '@RETURN_VALUE'
        DataType = ftInteger
        ParamType = ptResult
      end
      item
        Position = 2
        Name = '@IU'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Position = 3
        Name = '@Id'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 4
        Name = '@IdChamado'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = '@Docto'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Position = 6
        Name = '@Data'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Position = 7
        Name = '@HoraInicio'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 8
        Name = '@HoraFim'
        DataType = ftTime
        ParamType = ptInput
      end
      item
        Position = 9
        Name = '@idUsuario'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 10
        Name = '@IdUsuarioColab1'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 11
        Name = '@IdUsuarioColab2'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 12
        Name = '@IdUsuarioColab3'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 13
        Name = '@DescricaoTecnica'
        DataType = ftString
        ParamType = ptInput
        Size = 1000
      end
      item
        Position = 14
        Name = '@DescricaoSolucao'
        DataType = ftString
        ParamType = ptInput
        Size = 2000
      end
      item
        Position = 15
        Name = '@Anexo'
        DataType = ftString
        ParamType = ptInput
        Size = 1000
      end
      item
        Position = 16
        Name = '@TotalHoras'
        DataType = ftFloat
        Precision = 16
        ParamType = ptInput
      end
      item
        Position = 17
        Name = '@Versao'
        DataType = ftString
        ParamType = ptInput
        Size = 25
      end
      item
        Position = 18
        Name = '@RetornoId'
        DataType = ftInteger
        ParamType = ptInputOutput
      end>
  end
  object QVersaoVersao: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Ver_Id,'
      #9'Ver_Versao,'
      #9'Sol_Tipo,'
      #9'Tip_Nome,'
      #9'COUNT(Sol_Id) AS Quantidade'
      'FROM Versao'
      #9'LEFT JOIN Solicitacao On Ver_Id = Sol_VersaoId'
      #9'LEFT JOIN Tipo ON Sol_Tipo = Tip_Id'
      'WHERE Ver_Id = :IdVersao'
      'GROUP BY'
      #9'Ver_Id,'
      #9'Ver_Versao,'
      #9'Sol_Tipo,'
      #9'Tip_Nome')
    Left = 30
    Top = 596
    ParamData = <
      item
        Name = 'IDVERSAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspVersaoVersao: TDataSetProvider
    DataSet = QVersaoVersao
    Left = 80
    Top = 600
  end
  object QVersaoDocumento: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Ver_Id,'
      #9'Ver_Versao,'
      #9'Sol_Tipo,'
      #9'Prod_Nome,'
      '  Prod_Codigo,'
      '  Prod_Id,'
      #9'Mod_Nome,'
      #9'Sol_DescricaoLiberacao,'
      '  (SELECT SUM(STemp_TotalHoras) FROM Solicitacao_Tempo'
      #9#9'WHERE STemp_Solicitacao = sol_id'
      #9') as TotalHoras'
      'FROM Versao'
      #9'LEFT JOIN Solicitacao On Ver_Id = Sol_VersaoId'
      #9'LEFT JOIN Produto On Sol_Produto = Prod_Id'
      #9'LEFT JOIN Modulo On Sol_Modulo = Mod_Id'
      'WHERE Ver_Id < 100')
    Left = 168
    Top = 600
  end
  object dspVersaoDocumento: TDataSetProvider
    DataSet = QVersaoDocumento
    Left = 240
    Top = 600
  end
  object QChamadoQuadro: TFDQuery
    Connection = DM.Conexao
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'SELECT'
      #9#39'Q1'#39' AS Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '  Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      '  Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      #9'cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      #9'Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE par_Codigo = 3'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q2'#39' As Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9'  WHEN 1 THEN '#39'1-Baixo'#39
      #9'  WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '  Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      #9'Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      '  cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      '  Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 4'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q3'#39' As Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '  Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      '  Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      '  cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      '  Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 5'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q4'#39' As Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      #9'Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      '  Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      '  cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      '  Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 6'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q5'#39' As Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '  Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      '  Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      '  cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      '  Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 7'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q6'#39' As Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '  Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      '  Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      '  cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      '  Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 8'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      'order by 6 desc, 7 desc')
    Left = 336
    Top = 568
    ParamData = <
      item
        Name = 'IdUsuario'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IdRevenda'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object dspChamadoQuadro: TDataSetProvider
    DataSet = QChamadoQuadro
    Left = 368
    Top = 568
  end
  object QSolicitacaoQuadro: TFDQuery
    Connection = DM.Conexao
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'SELECT'
      '    '#39'Q01'#39' As Quadro,'
      '    ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      '  '#9') AS Aberta,'
      '    Sol_Id,'
      '    Sol_Titulo,'
      '    Sol_UsuarioAtendeAtual,'
      '    Sol_Nivel as Nivel,'
      '    Cli_Nome,'
      '    Cli_Perfil,'
      '    Usu_Nome,'
      '    Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      ''
      'WHERE Par_Codigo = 12'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      '    '#39'Q02'#39' As Quadro,'
      '    ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      '  '#9') AS Aberta,'
      '    Sol_Id,'
      '    Sol_Titulo,'
      '    Sol_UsuarioAtendeAtual,'
      '    Sol_Nivel as Nivel,'
      '    Cli_Nome,'
      '    Cli_Perfil,'
      '    Usu_Nome,'
      '    Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 13'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q03'#39' As Quadro,'
      '  ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      '  ) AS Aberta,'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '  Sol_UsuarioAtendeAtual,'
      '  Sol_Nivel as Nivel,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '  Usu_Nome,'
      '  Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 14'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      '    '#39'Q04'#39' As Quadro,'
      '    ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      '  '#9') AS Aberta,'
      '    Sol_Id,'
      '    Sol_Titulo,'
      '    Sol_UsuarioAtendeAtual,'
      '    Sol_Nivel as Nivel,'
      '    Cli_Nome,'
      '    Cli_Perfil,'
      '    Usu_Nome,'
      '    Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 15'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q05'#39' As Quadro,'
      '  ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      #9') AS Aberta,'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '  Sol_UsuarioAtendeAtual,'
      '  Sol_Nivel as Nivel,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '  Usu_Nome,'
      '  Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 16'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q06'#39' As Quadro,'
      '  ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      #9') AS Aberta,'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '  Sol_UsuarioAtendeAtual,'
      '  Sol_Nivel as Nivel,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '  Usu_Nome,'
      '  Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 17'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q07'#39' As Quadro,'
      '  ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      ' '#9') AS Aberta,'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '  Sol_UsuarioAtendeAtual,'
      '  Sol_Nivel as Nivel,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '  Usu_Nome,'
      '  Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 19'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q08'#39' As Quadro,'
      '  ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      #9') AS Aberta,'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '  Sol_UsuarioAtendeAtual,'
      '  Sol_Nivel as Nivel,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '  Usu_Nome,'
      '  Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 20'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q09'#39' As Quadro,'
      '  ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      #9') AS Aberta,'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '  Sol_UsuarioAtendeAtual,'
      '  Sol_Nivel as Nivel,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '  Usu_Nome,'
      '  Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 21'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q10'#39' As Quadro,'
      '  ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      ' '#9') AS Aberta,'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '  Sol_UsuarioAtendeAtual,'
      '  Sol_Nivel as Nivel,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '  Usu_Nome,'
      '  Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 22'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q11'#39' As Quadro,'
      '  ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      ' '#9') AS Aberta,'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '  Sol_UsuarioAtendeAtual,'
      '  Sol_Nivel as Nivel,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '  Usu_Nome,'
      '  Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 23'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q12'#39' As Quadro,'
      '  ('
      #9#9'  SELECT 1 FROM Solicitacao_Tempo'
      '  '#9#9'  WHERE Sol_Id = STemp_Solicitacao'
      '    '#9#9'AND STemp_Data IS NOT NULL'
      #9#9'    AND STemp_HoraFim IS NULL'
      ' '#9') AS Aberta,'
      #9'Sol_Id,'
      #9'Sol_Titulo,'
      '  Sol_UsuarioAtendeAtual,'
      '  Sol_Nivel as Nivel,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      '  Usu_Nome,'
      '  Sol_Status'
      'FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Sol_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 24'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      '')
    Left = 336
    Top = 616
    ParamData = <
      item
        Name = 'IDUSUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dspSolicitacaoQuadro: TDataSetProvider
    DataSet = QSolicitacaoQuadro
    Left = 368
    Top = 616
  end
  object QAtividadeQuadro: TFDQuery
    Connection = DM.Conexao
    FetchOptions.AssignedValues = [evItems]
    FetchOptions.Items = [fiBlobs, fiDetails]
    SQL.Strings = (
      'SELECT'
      #9#39'Q1'#39' AS Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '  Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      '  Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      #9'cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      #9'Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE par_Codigo = 25'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q2'#39' As Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9'  WHEN 1 THEN '#39'1-Baixo'#39
      #9'  WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '  Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      #9'Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      '  cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      '  Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 26'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q3'#39' As Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '  Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      '  Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      '  cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      '  Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 27'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q4'#39' As Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      #9'Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      '  Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      '  cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      '  Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 28'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q5'#39' As Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '  Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      '  Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      '  cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      '  Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 29'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      
        '--==============================================================' +
        '==============='
      'UNION'
      'SELECT'
      #9#39'Q6'#39' As Quadro,'
      #9'Cha_Id,'
      #9'Cha_DataAbertura,'
      #9'Cha_HoraAbertura,'
      #9'Cli_Nome,'
      '  Cli_Perfil,'
      #9'CASE cha_Nivel'
      #9#9'WHEN 1 THEN '#39'1-Baixo'#39
      #9#9'WHEN 2 THEN '#39'2-Normal'#39
      #9#9'WHEN 3 THEN '#39'3-Alto'#39
      #9#9'WHEN 4 THEN '#39'4-Cr'#237'tico'#39
      #9'END AS Cha_Nivel,'
      '  Cha_Nivel as Nivel,'
      '  Cha_UsuarioAtendeAtual,'
      '  Sta_Codigo,'
      '  Cli_Codigo,'
      #9'Tip_Nome,'
      
        '  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_' +
        'Id),'
      '  cha_HoraAtendeAtual,'
      '  ('
      
        #9'   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS C' +
        'HAO'
      #9#9'WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id'
      ' '#9') AS UltimaData,'
      '  Par_Codigo,'
      '  Usu_Nome'
      'FROM Chamado'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)'
      '  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id'
      'WHERE Par_Codigo = 30'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Us' +
        'u_Revenda IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND EXISTS('
      
        #9'SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cli' +
        'ente IS NULL))'
      #9'AND Usu_Id = :IdUsuario)'
      'AND ((Cli_Revenda = :IdRevenda) OR (:IdRevenda = 0))'
      'ORDER BY 6 DESC, 7 DESC')
    Left = 440
    Top = 608
    ParamData = <
      item
        Name = 'IDUSUARIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'IDREVENDA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object dspAtividadeQuadro: TDataSetProvider
    DataSet = QAtividadeQuadro
    Left = 480
    Top = 608
  end
  object QSolicitacaoRelatorio1: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      '      SELECT '
      '      '#9'Sol_Id, '
      '      '#9'Ver_Id, '
      '      '#9'Ver_Versao, '
      '      '#9'Sol_Data, '
      '      '#9'Sol_Hora, '
      '      '#9'Sol_Tipo, '
      '      '#9'Sol_Nivel, '
      '      '#9'Cli_Nome, '
      '      '#9'Cli_Fantasia, '
      '      '#9'Tip_Nome, '
      '      '#9'Sta_Nome, '
      '      '#9'Mod_Nome, '
      '      '#9'Prod_Nome,'
      '        Sol_Titulo,'
      '        Usu_Nome AS Analista,'
      '      '#9'Sol_TempoPrevisto,'
      '      '#9'Sol_PrevisaoEntrega,'
      '        ('
      '          SELECT Usu_Nome FROM Usuario'
      '            WHERE Sol_Desenvolvedor = Usu_Id'
      '        ) AS Desenvolvedor,'
      '      '#9'('
      '      '#9#9'SELECT SUM(STemp_TotalHoras) FROM Solicitacao_Tempo'
      '      '#9#9#9'WHERE Sol_Id = STemp_Solicitacao'
      '      '#9') AS TotalTempo'
      '      FROM Solicitacao'
      '      '#9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      '      '#9'INNER JOIN Status ON Sol_Status = Sta_Id'
      '      '#9'LEFT JOIN Versao On Sol_VersaoId = Ver_Id'
      '      '#9'LEFT JOIN Tipo ON Sol_Tipo = Tip_Id'
      '      '#9'LEFT JOIN Modulo ON Sol_Modulo = Mod_Id'
      '      '#9'LEFT JOIN Produto ON Sol_Produto = Prod_Id'
      '        LEFT JOIN Usuario ON Sol_Analista = Usu_Id'
      ''
      '')
    Left = 544
    Top = 568
    object QSolicitacaoRelatorio1Sol_Id: TFDAutoIncField
      FieldName = 'Sol_Id'
      Origin = 'Sol_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QSolicitacaoRelatorio1Ver_Id: TFDAutoIncField
      FieldName = 'Ver_Id'
      Origin = 'Ver_Id'
      ReadOnly = True
    end
    object QSolicitacaoRelatorio1Ver_Versao: TStringField
      FieldName = 'Ver_Versao'
      Origin = 'Ver_Versao'
      Size = 25
    end
    object QSolicitacaoRelatorio1Sol_Data: TDateField
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      Required = True
    end
    object QSolicitacaoRelatorio1Sol_Hora: TTimeField
      FieldName = 'Sol_Hora'
      Origin = 'Sol_Hora'
      Required = True
    end
    object QSolicitacaoRelatorio1Sol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
      Origin = 'Sol_Tipo'
    end
    object QSolicitacaoRelatorio1Sol_Nivel: TIntegerField
      FieldName = 'Sol_Nivel'
      Origin = 'Sol_Nivel'
    end
    object QSolicitacaoRelatorio1Cli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object QSolicitacaoRelatorio1Cli_Fantasia: TWideStringField
      FieldName = 'Cli_Fantasia'
      Origin = 'Cli_Fantasia'
      Size = 100
    end
    object QSolicitacaoRelatorio1Tip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      Size = 50
    end
    object QSolicitacaoRelatorio1Sta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object QSolicitacaoRelatorio1Mod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      Size = 100
    end
    object QSolicitacaoRelatorio1Prod_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      Size = 100
    end
    object QSolicitacaoRelatorio1Sol_TempoPrevisto: TBCDField
      FieldName = 'Sol_TempoPrevisto'
      Origin = 'Sol_TempoPrevisto'
      Precision = 5
      Size = 2
    end
    object QSolicitacaoRelatorio1Sol_PrevisaoEntrega: TDateField
      FieldName = 'Sol_PrevisaoEntrega'
      Origin = 'Sol_PrevisaoEntrega'
    end
    object QSolicitacaoRelatorio1TotalTempo: TFloatField
      FieldName = 'TotalTempo'
      Origin = 'TotalTempo'
      ReadOnly = True
    end
    object QSolicitacaoRelatorio1Analista: TWideStringField
      FieldName = 'Analista'
      Origin = 'Analista'
      Size = 100
    end
    object QSolicitacaoRelatorio1Desenvolvedor: TWideStringField
      FieldName = 'Desenvolvedor'
      Origin = 'Desenvolvedor'
      ReadOnly = True
      Size = 100
    end
    object QSolicitacaoRelatorio1Sol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Required = True
      Size = 100
    end
  end
  object dspSolicitacaoRelatorio1: TDataSetProvider
    DataSet = QSolicitacaoRelatorio1
    Left = 592
    Top = 568
  end
  object dsSolicitacaoRelatorio1: TDataSource
    DataSet = QSolicitacaoRelatorio1
    Left = 544
    Top = 616
  end
  object QSolicitacaoRelTempo1: TFDQuery
    MasterSource = dsSolicitacaoRelatorio1
    MasterFields = 'Sol_Id'
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Usu_Nome,'
      #9'STemp_HoraFim,'
      #9'STemp_HoraInicio,'
      #9'STemp_TotalHoras'
      'FROM Solicitacao_Tempo'
      #9'INNER JOIN Usuario ON STemp_UsuarioOperacional = Usu_Id'
      'WHERE STemp_Solicitacao = :Sol_Id'
      'AND STemp_TotalHoras > 0')
    Left = 544
    Top = 664
    ParamData = <
      item
        Name = 'SOL_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QSolicitacaoRelTempo1Usu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object QSolicitacaoRelTempo1STemp_HoraFim: TTimeField
      FieldName = 'STemp_HoraFim'
      Origin = 'STemp_HoraFim'
    end
    object QSolicitacaoRelTempo1STemp_HoraInicio: TTimeField
      FieldName = 'STemp_HoraInicio'
      Origin = 'STemp_HoraInicio'
      Required = True
    end
    object QSolicitacaoRelTempo1STemp_TotalHoras: TFloatField
      FieldName = 'STemp_TotalHoras'
      Origin = 'STemp_TotalHoras'
    end
  end
  object dspSolicitacaoRelTempo1: TDataSetProvider
    DataSet = QSolicitacaoRelTempo1
    Left = 608
    Top = 664
  end
  object QRelChamadoModelo06: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'RelCha_Usuario,RelCha_Revenda,RelCha_Tipo,'
      #9'Usu_Codigo, Usu_Nome,'
      #9'Rev_Nome,'
      '  Rev_Codigo,'
      '  Tip_Codigo,'
      #9'Tip_Nome,'
      
        #9'Mes1, Mes2, Mes3, Mes4, Mes5, Mes6, Mes7, Mes8, Mes9, Mes10, Me' +
        's11, Mes12,'
      
        #9'Valor1, Valor2, Valor3, Valor4, Valor5, Valor6, Valor7, Valor8,' +
        ' Valor9, Valor10, Valor11, Valor12,'
      
        #9'Qtde1, Qtde2, Qtde3, Qtde4, Qtde5, Qtde6, Qtde7, Qtde8, Qtde9, ' +
        'Qtde10, Qtde11, Qtde12,'
      #9'ISNULL(Horas1,0) + ISNULL(HorasB1,0) AS Horas1,'
      '  ISNULL(Horas2,0) + ISNULL(HorasB2,0) AS Horas2,'
      '  ISNULL(Horas3,0) + ISNULL(HorasB3,0) AS Horas3,'
      '  ISNULL(Horas4,0) + ISNULL(HorasB4,0) AS Horas4,'
      '  ISNULL(Horas5,0) + ISNULL(HorasB5,0) AS Horas5,'
      '  ISNULL(Horas6,0) + ISNULL(HorasB6,0) AS Horas6,'
      '  ISNULL(Horas7,0) + ISNULL(HorasB7,0) AS Horas7,'
      '  ISNULL(Horas8,0) + ISNULL(HorasB8,0) AS Horas8,'
      '  ISNULL(Horas9,0) + ISNULL(HorasB9,0) AS Horas9,'
      '  ISNULL(Horas10,0) + ISNULL(HorasB10,0) AS Horas10,'
      '  ISNULL(Horas11,0) + ISNULL(HorasB11,0) AS Horas11,'
      '  ISNULL(Horas12,0) + ISNULL(HorasB12,0) AS Horas12'
      'FROM Rel_Chamado_Temp'
      #9'INNER JOIN Usuario ON RelCha_Usuario = Usu_Id'
      #9'LEFT JOIN Revenda ON RelCha_Revenda = Rev_Codigo'
      #9'LEFT JOIN Tipo ON RelCha_Tipo = Tip_Codigo')
    Left = 752
    Top = 608
  end
  object dspRelChamadoModelo06: TDataSetProvider
    DataSet = QRelChamadoModelo06
    Left = 792
    Top = 608
  end
  object QSolicitacaoTipo: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      '  SELECT'
      '  '#9'Tip_Codigo,'
      '  '#9'Tip_Nome,'
      '  '#9'Sol_Tipo,'
      '  '#9'Sol_Data,'
      '  '#9'Sol_Titulo,'
      '  '#9'Sol_Cliente,'
      '  '#9'Sol_Status,'
      '  '#9'Cli_Codigo,'
      '  '#9'Cli_Nome,'
      '  '#9'Sta_Codigo,'
      '  '#9'Sta_Nome,'
      
        '  '#9'ISNULL((SELECT SUM(STemp_TotalHoras) FROM Solicitacao_Tempo W' +
        'HERE Sol_Id = STemp_Solicitacao),0) AS Tempo'
      '  FROM Solicitacao'
      #9'INNER JOIN Tipo ON Sol_Tipo = Tip_Id'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id')
    Left = 846
    Top = 64
  end
  object dspSolicitacaoTipo: TDataSetProvider
    DataSet = QSolicitacaoTipo
    Left = 894
    Top = 64
  end
  object dspSolicitacaoStatus: TDataSetProvider
    DataSet = QSolicitacaoStatus
    Left = 96
    Top = 648
  end
  object QSolicitacaoStatus: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      '  '#9'Sol_Produto,'
      '  '#9'Sol_Data,'
      '  '#9'Sol_Titulo,'
      '  '#9'Sol_Cliente,'
      '  '#9'Sol_Status,'
      '  '#9'Cli_Codigo,'
      '  '#9'Cli_Nome,'
      '  '#9'Sta_Codigo,'
      '  '#9'Sta_Nome,'
      #9'  Prod_Codigo,'
      #9'  Prod_Nome,'
      #9'  Sol_tipo,'
      #9'  Tip_Codigo,'
      #9'  Tip_Nome,'
      
        '  '#9'ISNULL((SELECT SUM(STemp_TotalHoras) FROM Solicitacao_Tempo W' +
        'HERE Sol_Id = STemp_Solicitacao),0) AS Tempo'
      '  FROM Solicitacao'
      #9'INNER JOIN Cliente ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Sol_Status = Sta_Id'
      #9'LEFT JOIN Produto ON Sol_Produto = Prod_Id'
      #9'LEFT JOIN Tipo ON Sol_Tipo = Tip_Id')
    Left = 24
    Top = 648
  end
  object QClienteRelatorio2: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT DISTINCT'
      #9'Cli_Codigo,'
      #9'Cli_Nome,'
      '  Cli_Fantasia,'
      #9'Cli_Fone1,'
      #9'Cli_Versao,'
      #9'CliMod_Produto,'
      #9'Prod_Codigo,'
      #9'Prod_Nome'
      'FROM Cliente'
      #9'LEFT JOIN Cliente_Modulo ON Cli_Id = CliMod_Cliente'
      #9'LEFT JOIN Produto ON CliMod_Produto = Prod_Id')
    Left = 24
    Top = 696
  end
  object dspClienteRelatorio2: TDataSetProvider
    DataSet = QClienteRelatorio2
    Left = 72
    Top = 696
  end
  object QRelVisitaModelo8: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cli_Perfil,'
      #9'COUNT(Vis_Id) AS QtdeChamados,'
      #9'SUM(Vis_TotalHoras) TotalHoras,'
      '    SUM(Vis_Valor) AS TotalValor'
      'FROM Visita'
      #9'INNER JOIN Cliente ON Vis_Cliente = Cli_Id'
      #9'INNER JOIN Status ON Vis_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Vis_Tipo = Tip_Id'
      #9'INNER JOIN Usuario ON Vis_Usuario = Usu_Id'
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id'
      'GROUP BY'
      '  Cli_Perfil')
    Left = 416
    Top = 448
  end
  object dspRelVisitaModelo8: TDataSetProvider
    DataSet = QRelVisitaModelo8
    Left = 448
    Top = 448
  end
  object QRelChamadoModelo8: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'Cli_Perfil,'
      #9'COUNT(DISTINCT Cha_Id) AS QtdeChamados,'
      #9'SUM(DISTINCT ChOco_TotalHoras) AS TotalHoras,'
      '        SUM(ChOco_TotalHoras) AS TotalHorasDetalhes'
      'FROM Chamado_Ocorrencia'
      #9'INNER JOIN Chamado ON ChOco_Chamado = Cha_Id'
      #9'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      #9'INNER JOIN Usuario ON ChOco_Usuario  = Usu_Id'
      #9'INNER JOIN Status ON Cha_Status = Sta_Id'
      #9'INNER JOIN Tipo ON Cha_Tipo = Tip_Id'
      #9'INNER JOIN Revenda ON Cli_Revenda = Rev_Id'
      'GROUP BY'
      '  Cli_Perfil')
    Left = 416
    Top = 504
  end
  object dspRelChamadoModelo8: TDataSetProvider
    DataSet = QRelChamadoModelo8
    Left = 448
    Top = 504
  end
  object QSolicitaOcorrenciaRegraCons: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'SOcor_Anexo,'
      #9'SOcor_Classificacao,'
      #9'SOcor_Data,'
      #9'SOcor_Descricao,'
      #9'SOcor_Hora,'
      #9'SOcor_Id,'
      #9'SOcor_Solicitacao,'
      #9'SOcor_Tipo,'
      #9'SOcor_UsuarioOperacional,'
      #9'Tip_Codigo,'
      #9'Tip_Nome,'
      #9'Usu_Codigo,'
      #9'Usu_Nome'
      'FROM Solicitacao_Ocorrencia'
      #9'LEFT JOIN Tipo ON SOcor_Tipo = Tip_Id'
      #9'LEFT JOIN Usuario ON SOcor_UsuarioOperacional = Usu_Id'
      'WHERE SOcor_Solicitacao = :IdSolicitacao'
      'AND SOcor_Classificacao = 3'
      'ORDER BY SOcor_Data')
    Left = 240
    Top = 672
    ParamData = <
      item
        Name = 'IDSOLICITACAO'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QSolicitaOcorrenciaRegraConsSOcor_Anexo: TStringField
      FieldName = 'SOcor_Anexo'
      Origin = 'SOcor_Anexo'
      ProviderFlags = [pfInUpdate]
      Size = 200
    end
    object QSolicitaOcorrenciaRegraConsSOcor_Classificacao: TIntegerField
      FieldName = 'SOcor_Classificacao'
      Origin = 'SOcor_Classificacao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaRegraConsSOcor_Data: TDateField
      FieldName = 'SOcor_Data'
      Origin = 'SOcor_Data'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaRegraConsSOcor_Descricao: TMemoField
      FieldName = 'SOcor_Descricao'
      Origin = 'SOcor_Descricao'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 2147483647
    end
    object QSolicitaOcorrenciaRegraConsSOcor_Hora: TTimeField
      FieldName = 'SOcor_Hora'
      Origin = 'SOcor_Hora'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaRegraConsSOcor_Id: TFDAutoIncField
      FieldName = 'SOcor_Id'
      Origin = 'SOcor_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QSolicitaOcorrenciaRegraConsSOcor_Solicitacao: TIntegerField
      FieldName = 'SOcor_Solicitacao'
      Origin = 'SOcor_Solicitacao'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaRegraConsSOcor_Tipo: TIntegerField
      FieldName = 'SOcor_Tipo'
      Origin = 'SOcor_Tipo'
      ProviderFlags = [pfInUpdate]
    end
    object QSolicitaOcorrenciaRegraConsSOcor_UsuarioOperacional: TIntegerField
      FieldName = 'SOcor_UsuarioOperacional'
      Origin = 'SOcor_UsuarioOperacional'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object QSolicitaOcorrenciaRegraConsTip_Codigo: TIntegerField
      FieldName = 'Tip_Codigo'
      Origin = 'Tip_Codigo'
      ProviderFlags = []
    end
    object QSolicitaOcorrenciaRegraConsTip_Nome: TWideStringField
      FieldName = 'Tip_Nome'
      Origin = 'Tip_Nome'
      ProviderFlags = []
      Size = 50
    end
    object QSolicitaOcorrenciaRegraConsUsu_Codigo: TIntegerField
      FieldName = 'Usu_Codigo'
      Origin = 'Usu_Codigo'
      ProviderFlags = []
    end
    object QSolicitaOcorrenciaRegraConsUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      Origin = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object dspSolicitaOcorrenciaRegraCons: TDataSetProvider
    DataSet = QSolicitaOcorrenciaRegraCons
    UpdateMode = upWhereKeyOnly
    Left = 296
    Top = 672
  end
  object QSolicitacaoCategoria: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      #9'   [Sol_Id]'
      '      ,[Sol_Data]'
      '      ,[Sol_Hora]'
      '      ,[Sol_Cliente]'
      '      ,[Sol_UsuarioAbertura]'
      '      ,[Sol_Modulo]'
      '      ,[Sol_Produto]'
      '      ,[Sol_Titulo]'
      '      ,[Sol_Descricao]'
      '      ,[Sol_Nivel]'
      '      ,[Sol_Versao]'
      '      ,[Sol_Anexo]'
      '      ,[Sol_Analista]'
      '      ,[Sol_Status]'
      '      ,[Sol_Tipo]'
      '      ,[Sol_TempoPrevisto]'
      '      ,[Sol_PrevisaoEntrega]'
      '      ,[Sol_Desenvolvedor]'
      '      ,[Sol_DescricaoLiberacao]'
      '      ,[Sol_UsuarioAtendeAtual]'
      '      ,[Sol_Contato]'
      '      ,[Sol_VersaoId]'
      '      ,[Sol_Categoria]'
      #9'  ,[Cli_Nome]'
      #9'  ,[Sta_Nome]'
      #9'  ,[Mod_Nome]'
      #9'  ,[Prod_Nome]'
      #9'  ,Aber.Usu_Nome AS UsuAbertura'
      #9'  ,Desenv.Usu_Nome AS UsuDesenv'
      #9'  ,Anal.Usu_Nome AS UsuAnalista'
      '  FROM [dbo].[Solicitacao]'
      #9'INNER JOIN [Cliente] ON Sol_Cliente = Cli_Id'
      #9'INNER JOIN [Status] ON Sol_Status = Sta_Id'
      
        #9'INNER JOIN [Usuario] AS Aber ON Sol_UsuarioAbertura = Aber.Usu_' +
        'Id'
      #9'LEFT JOIN [Modulo] ON Sol_Modulo = Mod_Id'
      #9'LEFT JOIN [Produto] ON Sol_Produto = Prod_Id'
      
        #9'LEFT JOIN [Usuario] AS Desenv ON Sol_Desenvolvedor = Desenv.Usu' +
        '_Id'
      #9'LEFT JOIN [Usuario] AS Anal ON Sol_Analista = Anal.Usu_Id'
      ''
      #9'WHERE Sol_Categoria = :IdCategoria'
      ' ORDER BY Sol_Data, Sol_Id'
      '')
    Left = 752
    Top = 664
    ParamData = <
      item
        Name = 'IDCATEGORIA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object QSolicitacaoCategoriaSol_Id: TFDAutoIncField
      FieldName = 'Sol_Id'
      Origin = 'Sol_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QSolicitacaoCategoriaSol_Data: TDateField
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      Required = True
    end
    object QSolicitacaoCategoriaSol_Hora: TTimeField
      FieldName = 'Sol_Hora'
      Origin = 'Sol_Hora'
      Required = True
    end
    object QSolicitacaoCategoriaSol_Cliente: TIntegerField
      FieldName = 'Sol_Cliente'
      Origin = 'Sol_Cliente'
      Required = True
    end
    object QSolicitacaoCategoriaSol_UsuarioAbertura: TIntegerField
      FieldName = 'Sol_UsuarioAbertura'
      Origin = 'Sol_UsuarioAbertura'
      Required = True
    end
    object QSolicitacaoCategoriaSol_Modulo: TIntegerField
      FieldName = 'Sol_Modulo'
      Origin = 'Sol_Modulo'
    end
    object QSolicitacaoCategoriaSol_Produto: TIntegerField
      FieldName = 'Sol_Produto'
      Origin = 'Sol_Produto'
    end
    object QSolicitacaoCategoriaSol_Titulo: TStringField
      FieldName = 'Sol_Titulo'
      Origin = 'Sol_Titulo'
      Required = True
      Size = 100
    end
    object QSolicitacaoCategoriaSol_Descricao: TMemoField
      FieldName = 'Sol_Descricao'
      Origin = 'Sol_Descricao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object QSolicitacaoCategoriaSol_Nivel: TIntegerField
      FieldName = 'Sol_Nivel'
      Origin = 'Sol_Nivel'
    end
    object QSolicitacaoCategoriaSol_Versao: TStringField
      FieldName = 'Sol_Versao'
      Origin = 'Sol_Versao'
      Size = 25
    end
    object QSolicitacaoCategoriaSol_Anexo: TStringField
      FieldName = 'Sol_Anexo'
      Origin = 'Sol_Anexo'
      Size = 200
    end
    object QSolicitacaoCategoriaSol_Analista: TIntegerField
      FieldName = 'Sol_Analista'
      Origin = 'Sol_Analista'
    end
    object QSolicitacaoCategoriaSol_Status: TIntegerField
      FieldName = 'Sol_Status'
      Origin = 'Sol_Status'
      Required = True
    end
    object QSolicitacaoCategoriaSol_Tipo: TIntegerField
      FieldName = 'Sol_Tipo'
      Origin = 'Sol_Tipo'
    end
    object QSolicitacaoCategoriaSol_TempoPrevisto: TBCDField
      FieldName = 'Sol_TempoPrevisto'
      Origin = 'Sol_TempoPrevisto'
      Precision = 5
      Size = 2
    end
    object QSolicitacaoCategoriaSol_PrevisaoEntrega: TDateField
      FieldName = 'Sol_PrevisaoEntrega'
      Origin = 'Sol_PrevisaoEntrega'
    end
    object QSolicitacaoCategoriaSol_Desenvolvedor: TIntegerField
      FieldName = 'Sol_Desenvolvedor'
      Origin = 'Sol_Desenvolvedor'
    end
    object QSolicitacaoCategoriaSol_DescricaoLiberacao: TMemoField
      FieldName = 'Sol_DescricaoLiberacao'
      Origin = 'Sol_DescricaoLiberacao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object QSolicitacaoCategoriaSol_UsuarioAtendeAtual: TIntegerField
      FieldName = 'Sol_UsuarioAtendeAtual'
      Origin = 'Sol_UsuarioAtendeAtual'
    end
    object QSolicitacaoCategoriaSol_Contato: TStringField
      FieldName = 'Sol_Contato'
      Origin = 'Sol_Contato'
      Size = 100
    end
    object QSolicitacaoCategoriaSol_VersaoId: TIntegerField
      FieldName = 'Sol_VersaoId'
      Origin = 'Sol_VersaoId'
    end
    object QSolicitacaoCategoriaSol_Categoria: TIntegerField
      FieldName = 'Sol_Categoria'
      Origin = 'Sol_Categoria'
    end
    object QSolicitacaoCategoriaCli_Nome: TWideStringField
      FieldName = 'Cli_Nome'
      Origin = 'Cli_Nome'
      Required = True
      Size = 100
    end
    object QSolicitacaoCategoriaSta_Nome: TWideStringField
      FieldName = 'Sta_Nome'
      Origin = 'Sta_Nome'
      Required = True
      Size = 50
    end
    object QSolicitacaoCategoriaMod_Nome: TWideStringField
      FieldName = 'Mod_Nome'
      Origin = 'Mod_Nome'
      Size = 100
    end
    object QSolicitacaoCategoriaProd_Nome: TWideStringField
      FieldName = 'Prod_Nome'
      Origin = 'Prod_Nome'
      Size = 100
    end
    object QSolicitacaoCategoriaUsuAbertura: TWideStringField
      FieldName = 'UsuAbertura'
      Origin = 'UsuAbertura'
      Required = True
      Size = 100
    end
    object QSolicitacaoCategoriaUsuDesenv: TWideStringField
      FieldName = 'UsuDesenv'
      Origin = 'UsuDesenv'
      Size = 100
    end
    object QSolicitacaoCategoriaUsuAnalista: TWideStringField
      FieldName = 'UsuAnalista'
      Origin = 'UsuAnalista'
      Size = 100
    end
  end
  object QSolicitacaoProblemaSolucao: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT  top(1)'
      #9'Sol_Id,'
      #9'Sol_Data,'
      #9'Sol_Hora,'
      #9'Sol_Descricao,'
      #9'Sol_DescricaoLiberacao,'
      #9'SOcor_Descricao as DescricaoOco,'
      #9'SOcor_Classificacao,'
      #9'SOcor_Data as DataOco,'
      #9'SOcor_Hora as HoraOco'
      'FROM Solicitacao'
      #9'INNER JOIN Solicitacao_Ocorrencia ON Sol_Id = SOcor_Solicitacao'
      #9'LEFT JOIN Cliente ON Sol_Cliente = Cli_Id')
    Left = 240
    Top = 728
    object QSolicitacaoProblemaSolucaoSol_Id: TFDAutoIncField
      FieldName = 'Sol_Id'
      Origin = 'Sol_Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QSolicitacaoProblemaSolucaoSol_Data: TDateField
      FieldName = 'Sol_Data'
      Origin = 'Sol_Data'
      Required = True
    end
    object QSolicitacaoProblemaSolucaoSol_Hora: TTimeField
      FieldName = 'Sol_Hora'
      Origin = 'Sol_Hora'
      Required = True
    end
    object QSolicitacaoProblemaSolucaoSol_Descricao: TMemoField
      FieldName = 'Sol_Descricao'
      Origin = 'Sol_Descricao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object QSolicitacaoProblemaSolucaoSol_DescricaoLiberacao: TMemoField
      FieldName = 'Sol_DescricaoLiberacao'
      Origin = 'Sol_DescricaoLiberacao'
      BlobType = ftMemo
      Size = 2147483647
    end
    object QSolicitacaoProblemaSolucaoDescricaoOco: TMemoField
      FieldName = 'DescricaoOco'
      Origin = 'DescricaoOco'
      BlobType = ftMemo
      Size = 2147483647
    end
    object QSolicitacaoProblemaSolucaoSOcor_Classificacao: TIntegerField
      FieldName = 'SOcor_Classificacao'
      Origin = 'SOcor_Classificacao'
      Required = True
    end
    object QSolicitacaoProblemaSolucaoDataOco: TDateField
      FieldName = 'DataOco'
      Origin = 'DataOco'
      Required = True
    end
    object QSolicitacaoProblemaSolucaoHoraOco: TTimeField
      FieldName = 'HoraOco'
      Origin = 'HoraOco'
      Required = True
    end
  end
  object dspSolicitacaoProblemaSolucao: TDataSetProvider
    DataSet = QSolicitacaoProblemaSolucao
    Left = 280
    Top = 728
  end
  object QRelChamadoModelo9: TFDQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT'
      'CASE Cha_Origem'
      #9'WHEN 1 THEN '#39'Telefone'#39
      #9'WHEN 2 THEN '#39'WhatsApp'#39
      #9'WHEN 3 THEN '#39'Chat'#39
      #9'WHEN 4 THEN '#39'Aplicativo'#39
      #9'WHEN 5 THEN '#39'ERP'#39
      'END ORIGEM,'
      'COUNT(Cha_Id) AS Qtde'
      'FROM Chamado'
      'INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
      'LEFT JOIN Revenda ON Cli_Revenda = Rev_Id'
      'GROUP BY Cha_Origem')
    Left = 416
    Top = 552
  end
  object dspRelChamadoModelo9: TDataSetProvider
    DataSet = QRelChamadoModelo9
    Left = 448
    Top = 552
  end
end
