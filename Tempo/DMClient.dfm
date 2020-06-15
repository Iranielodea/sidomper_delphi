object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 180
  Width = 282
  object Conexao: TSQLConnection
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'HostName=localhost'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=19.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'Port=211'
      'CommunicationProtocol=tcp/ip'
      'DSAuthenticationPassword=12'
      'DSAuthenticationUser=Domper'
      'DatasnapContext=datasnap/'
      'Filters={}')
    Left = 48
    Top = 40
    UniqueId = '{FCBE2499-CFBC-4863-AEE7-F41DA1F8EC28}'
  end
end
