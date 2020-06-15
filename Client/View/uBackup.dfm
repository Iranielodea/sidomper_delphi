object frmBackup: TfrmBackup
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'BACKUP'
  ClientHeight = 295
  ClientWidth = 552
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
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlRodape: TPanel
    Left = 0
    Top = 254
    Width = 552
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitTop = 260
    object btnOk: TBitBtn
      Left = 328
      Top = 8
      Width = 100
      Height = 25
      Caption = '&Confirmar'
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancelar: TBitBtn
      Left = 427
      Top = 8
      Width = 100
      Height = 25
      Hint = 'Esc'
      CustomHint = BalloonHint1
      Caption = 'Cancela&r'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object pnlBackup: TPanel
    Left = 0
    Top = 0
    Width = 552
    Height = 254
    Align = alClient
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitTop = 43
    ExplicitHeight = 213
    object Label1: TLabel
      Left = 32
      Top = 32
      Width = 88
      Height = 13
      Caption = 'Destino do Backup'
    end
    object btnBackup: TSpeedButton
      Left = 503
      Top = 48
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = btnBackupClick
    end
    object lblAguarde: TLabel
      Left = 224
      Top = 96
      Width = 89
      Height = 19
      Caption = 'Aguarde ...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edtDestino: TEdit
      Left = 32
      Top = 48
      Width = 465
      Height = 21
      TabOrder = 0
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'bak'
    Filter = '*.bak|*.bak'
    Left = 456
  end
  object BalloonHint1: TBalloonHint
    Left = 392
  end
end
