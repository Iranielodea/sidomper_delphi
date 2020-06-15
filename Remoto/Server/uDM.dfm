object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 191
  Width = 337
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=127.0.0.1/3050:D:\TEMP\SIDomper\WSDATABASE'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 183
    Top = 8
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 104
    Top = 8
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 16
    Top = 8
  end
end
