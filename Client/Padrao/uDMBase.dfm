object DMBase: TDMBase
  OldCreateOrder = False
  Height = 249
  Width = 215
  object CDSConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 24
  end
  object CDSCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 152
    Top = 24
  end
  object DSConsulta: TDataSource
    DataSet = CDSConsulta
    Left = 24
    Top = 80
  end
  object DBConsulta: TppDBPipeline
    DataSource = DSConsulta
    UserName = 'DBConsulta'
    Left = 24
    Top = 144
  end
end
