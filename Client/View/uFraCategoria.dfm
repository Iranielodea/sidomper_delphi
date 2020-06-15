object FraCategoria: TFraCategoria
  Left = 0
  Top = 0
  Width = 769
  Height = 236
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
  object dbTabela: TDBGrid
    Left = 3
    Top = 39
    Width = 763
    Height = 186
    DataSource = dsTabela
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 3
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDrawColumnCell = dbTabelaDrawColumnCell
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
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
  object dsTabela: TDataSource
    DataSet = CDSTabela
    Left = 392
    Top = 104
  end
  object CDSTabela: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 496
    Top = 104
    object CDSTabelaId: TIntegerField
      FieldName = 'Id'
    end
    object CDSTabelaCodigo: TIntegerField
      Alignment = taCenter
      FieldName = 'Codigo'
      DisplayFormat = '0000'
    end
    object CDSTabelaNome: TStringField
      FieldName = 'Nome'
      Size = 100
    end
  end
  object BalloonHint1: TBalloonHint
    Left = 336
    Top = 80
  end
end
