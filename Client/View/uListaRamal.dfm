object frmListaRamal: TfrmListaRamal
  Left = 439
  Top = 55
  HelpType = htKeyword
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Ramais'
  ClientHeight = 461
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbGrade: TDBGrid
    Left = 0
    Top = 0
    Width = 334
    Height = 461
    Align = alClient
    DataSource = dsCad
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDrawColumnCell = dbGradeDrawColumnCell
    OnKeyDown = dbGradeKeyDown
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'Numero'
        Title.Alignment = taCenter
        Title.Caption = 'Ramal'
        Width = 83
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Title.Alignment = taCenter
        Width = 209
        Visible = True
      end>
  end
  object dsCad: TDataSource
    DataSet = cdsDados
    Left = 120
    Top = 88
  end
  object cdsDados: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 200
    Top = 104
    object cdsDadosNumero: TStringField
      FieldName = 'Numero'
    end
    object cdsDadosNome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
  end
end
