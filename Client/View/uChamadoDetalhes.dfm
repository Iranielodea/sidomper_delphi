object frmChamadoDetalhes: TfrmChamadoDetalhes
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Detalhes do Chamado'
  ClientHeight = 604
  ClientWidth = 783
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 57
    Align = alTop
    BevelOuter = bvLowered
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 781
      Height = 55
      Align = alClient
      Caption = 'Siglas:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 34
        Top = 24
        Width = 50
        Height = 13
        Caption = 'Abertura'
      end
      object shpAbertura: TShape
        Left = 11
        Top = 24
        Width = 17
        Height = 13
      end
      object Label4: TLabel
        Left = 122
        Top = 24
        Width = 62
        Height = 13
        Caption = 'Ocorr'#234'ncia'
      end
      object shpOcorrGeral: TShape
        Left = 99
        Top = 24
        Width = 17
        Height = 13
      end
      object shpOcorrStatus: TShape
        Left = 201
        Top = 24
        Width = 17
        Height = 13
      end
      object Label6: TLabel
        Left = 224
        Top = 24
        Width = 36
        Height = 13
        Caption = 'Status'
      end
    end
  end
  object CategoryPanelGroup1: TCategoryPanelGroup
    Left = 0
    Top = 57
    Width = 783
    Height = 547
    VertScrollBar.Tracking = True
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'Tahoma'
    HeaderFont.Style = []
    TabOrder = 1
    object ctpOcorrencias: TCategoryPanel
      Top = 200
      Height = 450
      Caption = 'Ocorr'#234'ncias e Status'
      TabOrder = 0
      object mmoGeral: TRichEdit
        Left = 0
        Top = 0
        Width = 762
        Height = 424
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object ctpAbertura: TCategoryPanel
      Top = 0
      Caption = 'Abertura'
      TabOrder = 1
      object mmoObs: TRichEdit
        Left = 0
        Top = 0
        Width = 762
        Height = 174
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
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
end
