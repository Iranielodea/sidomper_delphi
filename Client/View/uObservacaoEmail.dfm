object frmObservacaoEmail: TfrmObservacaoEmail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Observa'#231#227'o para Email'
  ClientHeight = 316
  ClientWidth = 633
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 275
    Width = 633
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 2
    ExplicitLeft = 208
    ExplicitTop = 128
    ExplicitWidth = 185
    object btnConfirmar: TBitBtn
      Left = 192
      Top = 8
      Width = 90
      Height = 25
      Caption = '&Confirmar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnVoltar: TBitBtn
      Left = 288
      Top = 8
      Width = 90
      Height = 25
      Caption = '&Voltar'
      TabOrder = 1
      OnClick = btnVoltarClick
    end
  end
  object DBMemo1: TDBMemo
    Left = 8
    Top = 8
    Width = 617
    Height = 225
    DataField = 'Obs_ObsEmail'
    DataSource = dsCad
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Verdana'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    OnEnter = DBMemo1Enter
    OnExit = DBMemo1Exit
    OnKeyDown = FormKeyDown
  end
  object DBCheckBox1: TDBCheckBox
    Left = 8
    Top = 248
    Width = 97
    Height = 17
    Caption = 'Padr'#227'o'
    DataField = 'Obs_EmailPadrao'
    DataSource = dsCad
    TabOrder = 1
  end
  object dsCad: TDataSource
    DataSet = DMObservacao.CDSCadastro
    OnStateChange = dsCadStateChange
    Left = 464
    Top = 104
  end
end
