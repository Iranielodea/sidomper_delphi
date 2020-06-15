object frmPlanoBackup: TfrmPlanoBackup
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Plano Backup'
  ClientHeight = 313
  ClientWidth = 683
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 84
    Height = 13
    Caption = 'Salvar Backup em'
  end
  object Label2: TLabel
    Left = 8
    Top = 167
    Width = 107
    Height = 13
    Caption = 'Data do '#218'ltimo Backup'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 78
    Width = 377
    Height = 83
    Caption = 'Dias da Semana:'
    TabOrder = 1
    object DBCheckBox1: TDBCheckBox
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Segunda'
      DataField = 'Plb_Segunda'
      DataSource = dsCad
      TabOrder = 0
    end
    object DBCheckBox2: TDBCheckBox
      Left = 16
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Ter'#231'a'
      DataField = 'Plb_Terca'
      DataSource = dsCad
      TabOrder = 1
    end
    object DBCheckBox3: TDBCheckBox
      Left = 112
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Quarta'
      DataField = 'Plb_Quarta'
      DataSource = dsCad
      TabOrder = 2
    end
    object DBCheckBox4: TDBCheckBox
      Left = 112
      Top = 48
      Width = 97
      Height = 17
      Caption = 'Quinta'
      DataField = 'Plb_Quinta'
      DataSource = dsCad
      TabOrder = 3
    end
    object DBCheckBox5: TDBCheckBox
      Left = 209
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Sexta'
      DataField = 'Plb_Sexta'
      DataSource = dsCad
      TabOrder = 4
    end
    object DBCheckBox6: TDBCheckBox
      Left = 209
      Top = 48
      Width = 97
      Height = 17
      Caption = 'S'#225'bado'
      DataField = 'Plb_Sabado'
      DataSource = dsCad
      TabOrder = 5
    end
    object DBCheckBox7: TDBCheckBox
      Left = 305
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Domingo'
      DataField = 'Plb_Domingo'
      DataSource = dsCad
      TabOrder = 6
    end
  end
  object DBGrid1: TDBGrid
    Left = 416
    Top = 78
    Width = 257
    Height = 159
    DataSource = dsItens
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PlbIte_Hora'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 272
    Width = 683
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    ExplicitTop = 304
    object btnSalvar: TBitBtn
      Left = 168
      Top = 8
      Width = 90
      Height = 25
      Hint = 'F8'
      CustomHint = BalloonHint1
      Caption = '&Salvar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object btnExcluir: TBitBtn
      Left = 264
      Top = 8
      Width = 90
      Height = 25
      Hint = 'Ctrl + Del'
      CustomHint = BalloonHint1
      Caption = '&Excluir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnSair: TBitBtn
      Left = 359
      Top = 8
      Width = 90
      Height = 25
      Hint = 'Esc'
      CustomHint = BalloonHint1
      Caption = 'Sai&r'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnSairClick
    end
  end
  object DBEdit1: TDBEdit
    Left = 8
    Top = 43
    Width = 667
    Height = 21
    DataField = 'Plb_Destino'
    DataSource = dsCad
    TabOrder = 0
  end
  object DBCheckBox8: TDBCheckBox
    Left = 8
    Top = 220
    Width = 97
    Height = 17
    Caption = 'Ativo'
    DataField = 'Plb_Ativo'
    DataSource = dsCad
    TabOrder = 3
  end
  object btnExcluirItem: TBitBtn
    Left = 585
    Top = 243
    Width = 90
    Height = 25
    Caption = 'E&xcluir'
    TabOrder = 5
    OnClick = btnExcluirItemClick
  end
  object DBEdit2: TDBEdit
    Left = 8
    Top = 186
    Width = 121
    Height = 21
    TabStop = False
    Color = clSilver
    DataField = 'Plb_DataUltimoBackup'
    DataSource = dsCad
    ReadOnly = True
    TabOrder = 6
  end
  object dsCad: TDataSource
    DataSet = dmPlanoBackup.CDSCadastro
    Left = 232
    Top = 8
  end
  object dsItens: TDataSource
    DataSet = dmPlanoBackup.CDSItens
    Left = 320
    Top = 8
  end
  object BalloonHint1: TBalloonHint
    Left = 312
    Top = 184
  end
end
