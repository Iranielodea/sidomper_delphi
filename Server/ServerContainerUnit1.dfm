object ServerContainer1: TServerContainer1
  OldCreateOrder = False
  Height = 200
  Width = 353
  object DSServer1: TDSServer
    AutoStart = False
    Left = 96
    Top = 11
  end
  object DSTCPServerTransport1: TDSTCPServerTransport
    Server = DSServer1
    Filters = <>
    Left = 96
    Top = 73
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    LifeCycle = 'Server'
    Left = 200
    Top = 11
  end
  object DSServerClass2: TDSServerClass
    OnGetClass = DSServerClass2GetClass
    Server = DSServer1
    LifeCycle = 'Server'
    Left = 200
    Top = 72
  end
end
