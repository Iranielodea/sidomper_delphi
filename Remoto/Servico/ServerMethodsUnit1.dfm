object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 216
  Width = 433
  object QItens: TFDQuery
    SQL.Strings = (
      'SELECT'
      '  LICID,'
      '  LICCNPJCPF,'
      '  LICDATAHORALCTO,'
      '  LICLICENCA,'
      '  LICUTILIZADA,'
      '  LICDATAHRUTILIZACAO,'
      '  LICSITUACAO'
      'FROM TLICENCA')
    Left = 48
    Top = 24
  end
  object dspItens: TDataSetProvider
    DataSet = QItens
    Left = 112
    Top = 24
  end
end