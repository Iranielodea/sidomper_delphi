object DMFB: TDMFB
  OldCreateOrder = False
  Height = 179
  Width = 260
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 104
    Top = 112
  end
  object FBConexao: TFDConnection
    Params.Strings = (
      'Database=127.0.0.1/3050:D:\TEMP\SIDomper\WSDATABASE'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 64
    Top = 40
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 144
    Top = 24
  end
end
