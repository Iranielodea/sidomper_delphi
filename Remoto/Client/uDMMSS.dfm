object DMMSS: TDMMSS
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 274
  Width = 458
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=SIDomper_11_03_17'
      'User_Name=Domper'
      'Password=12'
      'Server=PROG223'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 64
    Top = 24
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 216
    Top = 16
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 216
    Top = 72
  end
  object Qry: TFDQuery
    Connection = Conexao
    Left = 80
    Top = 136
  end
end
