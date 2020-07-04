object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 184
  Width = 335
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=SIDomper_22_01_20'
      'User_Name=Domper'
      'Password=12'
      'Server=DESKTOP-IRANI\SQLEXPRESS'
      'DriverID=MSSQL')
    LoginPrompt = False
    BeforeConnect = ConexaoBeforeConnect
    Left = 80
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 24
    Top = 80
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 128
    Top = 80
  end
end
