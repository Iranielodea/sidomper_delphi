object frmAgendamentoMotivo: TfrmAgendamentoMotivo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Motivo'
  ClientHeight = 413
  ClientWidth = 588
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object lblData: TLabel
    Left = 8
    Top = 8
    Width = 30
    Height = 14
    Caption = 'Data'
  end
  object lblHora: TLabel
    Left = 103
    Top = 8
    Width = 30
    Height = 14
    Caption = 'Hora'
  end
  object lblMotivo: TLabel
    Left = 8
    Top = 56
    Width = 41
    Height = 14
    Caption = 'Motivo'
  end
  object edtData: TMaskEdit
    Left = 8
    Top = 28
    Width = 89
    Height = 22
    EditMask = '##/##/####'
    MaxLength = 10
    TabOrder = 0
    Text = '  /  /    '
  end
  object edtHora: TMaskEdit
    Left = 103
    Top = 28
    Width = 50
    Height = 22
    EditMask = '##:##'
    MaxLength = 5
    TabOrder = 1
    Text = '  :  '
  end
  object Panel1: TPanel
    Left = 0
    Top = 372
    Width = 588
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 3
    object btnConfirmar: TBitBtn
      Left = 380
      Top = 8
      Width = 90
      Height = 25
      Caption = '&Confirmar'
      TabOrder = 0
      OnClick = btnConfirmarClick
    end
    object btnCancelar: TBitBtn
      Left = 476
      Top = 8
      Width = 90
      Height = 25
      Caption = 'Cancela&r'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object mmoTexto: TRichEdit
    Left = 8
    Top = 76
    Width = 566
    Height = 290
    ScrollBars = ssVertical
    TabOrder = 2
    OnEnter = RichEdit1Enter
    OnExit = RichEdit1Exit
    OnKeyDown = FormKeyDown
  end
end
