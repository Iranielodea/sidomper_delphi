object frmChamadoDetalhes2: TfrmChamadoDetalhes2
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Detalhes'
  ClientHeight = 621
  ClientWidth = 1018
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object mmoGeral: TRichEdit
    Left = 0
    Top = 0
    Width = 1018
    Height = 621
    Align = alClient
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 160
    object cdsDadosDocumento: TStringField
      FieldName = 'Documento'
      Size = 30
    end
    object cdsDadosData: TDateField
      FieldName = 'Data'
    end
    object cdsDadosHoraInicial: TStringField
      FieldName = 'HoraInicial'
      Size = 5
    end
    object cdsDadosHoraFinal: TStringField
      FieldName = 'HoraFinal'
      Size = 5
    end
    object cdsDadosUsuario: TStringField
      FieldName = 'Usuario'
      Size = 60
    end
    object cdsDadosColaborador1: TStringField
      FieldName = 'Colaborador1'
      Size = 60
    end
    object cdsDadosColaborador2: TStringField
      FieldName = 'Colaborador2'
      Size = 60
    end
    object cdsDadosColaborador3: TStringField
      FieldName = 'Colaborador3'
      Size = 60
    end
    object cdsDadosDescricaoProblema: TStringField
      FieldName = 'DescricaoProblema'
      Size = 1000
    end
    object cdsDadosDescricaoSolucao: TStringField
      FieldName = 'DescricaoSolucao'
      Size = 1000
    end
    object cdsDadosAnexo: TStringField
      FieldName = 'Anexo'
      Size = 200
    end
    object cdsDadosNomeStatus: TStringField
      FieldName = 'NomeStatus'
      Size = 60
    end
    object cdsDadosTipo: TIntegerField
      FieldName = 'Tipo'
    end
    object cdsDadosIdOcorrencia: TIntegerField
      FieldName = 'IdOcorrencia'
    end
  end
  object cdsStatus: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 160
    object cdsStatusData: TDateField
      FieldName = 'Data'
    end
    object cdsStatusHora: TTimeField
      FieldName = 'Hora'
    end
    object cdsStatusNomeStatus: TStringField
      FieldName = 'NomeStatus'
      Size = 60
    end
    object cdsStatusNomeUsuario: TStringField
      FieldName = 'NomeUsuario'
      Size = 60
    end
  end
end
