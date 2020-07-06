object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 205
  Width = 321
  object Conexao: TSQLConnection
    DriverName = 'DataSnap'
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=acesso.domper.com.br'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=19.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Filters={}'
      'DSProxyPort=8888')
    BeforeConnect = ConexaoBeforeConnect
    Left = 24
    Top = 24
    UniqueId = '{E9E25421-D735-45FF-9636-71A9C560A4A5}'
  end
  object DSPConexao: TDSProviderConnection
    ServerClassName = 'TServerMethods1'
    SQLConnection = Conexao
    Left = 128
    Top = 24
  end
  object BalloonHint1: TBalloonHint
    Left = 192
    Top = 16
  end
  object DSPConexao2: TDSProviderConnection
    ServerClassName = 'TServerModule2'
    SQLConnection = Conexao
    Left = 128
    Top = 72
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 120
    object cdsUsuarioId: TIntegerField
      FieldName = 'Id'
    end
    object cdsUsuarioCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsUsuarioUserName: TStringField
      FieldName = 'UserName'
      Size = 50
    end
    object cdsUsuarioNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
    object cdsUsuarioPassword: TStringField
      FieldName = 'Password'
      Size = 50
    end
    object cdsUsuarioEmail: TStringField
      FieldName = 'Email'
      Size = 100
    end
    object cdsUsuarioAdm: TBooleanField
      FieldName = 'Adm'
    end
    object cdsUsuarioNotificar: TBooleanField
      FieldName = 'Notificar'
    end
  end
  object cdsUsuarioPermissao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 136
    Top = 136
    object cdsUsuarioPermissaoId: TIntegerField
      FieldName = 'Id'
    end
    object cdsUsuarioPermissaoIdUsuario: TIntegerField
      FieldName = 'IdUsuario'
    end
    object cdsUsuarioPermissaoSigla: TStringField
      FieldName = 'Sigla'
      Size = 50
    end
  end
  object cdsParametro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
    Top = 72
    object cdsParametroCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsParametroPrograma: TIntegerField
      FieldName = 'Programa'
    end
    object cdsParametroValor: TStringField
      FieldName = 'Valor'
      Size = 250
    end
  end
end
