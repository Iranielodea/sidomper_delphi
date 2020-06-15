object DMEscala: TDMEscala
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 224
  Width = 301
  object CDSConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEscalaCons'
    OnCalcFields = CDSConsultaCalcFields
    Left = 32
    Top = 24
    object CDSConsultaEsc_Id: TAutoIncField
      FieldName = 'Esc_Id'
      ReadOnly = True
    end
    object CDSConsultaEsc_Data: TDateField
      DisplayLabel = 'Data'
      FieldName = 'Esc_Data'
      Required = True
    end
    object CDSConsultaEsc_Usuario: TIntegerField
      FieldName = 'Esc_Usuario'
      Required = True
    end
    object CDSConsultaEsc_HoraInicio: TTimeField
      DisplayLabel = 'Hora Inicial'
      FieldName = 'Esc_HoraInicio'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSConsultaEsc_HoraFim: TTimeField
      DisplayLabel = 'Hora Final'
      FieldName = 'Esc_HoraFim'
      Required = True
      DisplayFormat = 'hh:mm'
    end
    object CDSConsultaUsu_Codigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Usu_Codigo'
      Required = True
    end
    object CDSConsultaUsu_Nome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'Usu_Nome'
      Required = True
      Size = 100
    end
    object CDSConsultaCalc_DataExtenso: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'Calc_DataExtenso'
      Size = 30
    end
  end
  object CDSCadastro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEscalaCad'
    OnNewRecord = CDSCadastroNewRecord
    OnReconcileError = CDSCadastroReconcileError
    Left = 112
    Top = 24
    object CDSCadastroEsc_Id: TAutoIncField
      FieldName = 'Esc_Id'
      ReadOnly = True
    end
    object CDSCadastroEsc_Data: TDateField
      FieldName = 'Esc_Data'
      Required = True
      EditMask = '##/##/####'
    end
    object CDSCadastroEsc_Usuario: TIntegerField
      FieldName = 'Esc_Usuario'
      Required = True
    end
    object CDSCadastroEsc_HoraInicio: TTimeField
      FieldName = 'Esc_HoraInicio'
      Required = True
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCadastroEsc_HoraFim: TTimeField
      FieldName = 'Esc_HoraFim'
      Required = True
      DisplayFormat = 'hh:mm'
      EditMask = '##:##'
    end
    object CDSCadastroUsu_Codigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Usu_Codigo'
      ProviderFlags = []
      DisplayFormat = '0000'
    end
    object CDSCadastroUsu_Nome: TWideStringField
      FieldName = 'Usu_Nome'
      ProviderFlags = []
      Size = 100
    end
  end
  object dbConsulta: TppDBPipeline
    DataSource = DSConsulta
    UserName = 'dbConsulta'
    Left = 32
    Top = 136
  end
  object DSConsulta: TDataSource
    DataSet = CDSConsulta
    Left = 32
    Top = 80
  end
end
