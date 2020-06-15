object frmChamadoModulos: TfrmChamadoModulos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'M'#243'dulos'
  ClientHeight = 382
  ClientWidth = 740
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object dbDados: TDBGrid
    Left = 0
    Top = 0
    Width = 740
    Height = 341
    Align = alClient
    DataSource = dsCad
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Verdana'
    TitleFont.Style = []
    OnDrawColumnCell = dbDadosDrawColumnCell
    OnTitleClick = dbDadosTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'Mod_Nome'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Prod_Nome'
        Width = 350
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 341
    Width = 740
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object btnCancelar: TBitBtn
      Left = 632
      Top = 6
      Width = 90
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 0
      OnClick = btnCancelarClick
    end
  end
  object dsCad: TDataSource
    DataSet = DMClienteModulo.CDSConsulta
    Left = 328
    Top = 88
  end
end
