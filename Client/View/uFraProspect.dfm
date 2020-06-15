object FraProspect: TFraProspect
  Left = 0
  Top = 0
  Width = 769
  Height = 242
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  object btnProc: TSpeedButton
    Left = 548
    Top = 11
    Width = 23
    Height = 22
    OnClick = btnProcClick
  end
  object edtCodigo: TEdit
    Left = 3
    Top = 11
    Width = 57
    Height = 22
    Hint = '[F9] - Pesquisar'
    CustomHint = BalloonHint1
    NumbersOnly = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnKeyDown = edtCodigoKeyDown
  end
  object edtNome: TEdit
    Left = 66
    Top = 11
    Width = 479
    Height = 22
    TabStop = False
    Color = clSilver
    ReadOnly = True
    TabOrder = 2
  end
  object dbCliente: TDBGrid
    Left = 3
    Top = 39
    Width = 763
    Height = 186
    DataSource = dsCliente
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDrawColumnCell = dbClienteDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Cli_Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cli_Nome'
        Width = 631
        Visible = True
      end>
  end
  object edtId: TEdit
    Left = 477
    Top = 11
    Width = 65
    Height = 22
    TabOrder = 0
  end
  object dsCliente: TDataSource
    DataSet = CDSCliente
    Left = 392
    Top = 104
  end
  object CDSCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 104
    object CDSClienteCli_Id: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'Cli_Id'
      Visible = False
    end
    object CDSClienteCli_Codigo: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'Cli_Codigo'
      DisplayFormat = '000000'
    end
    object CDSClienteCli_Nome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'Cli_Nome'
      Size = 100
    end
  end
  object BalloonHint1: TBalloonHint
    Left = 336
    Top = 80
  end
end
