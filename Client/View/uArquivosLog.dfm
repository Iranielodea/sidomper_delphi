object frmArquivosLog: TfrmArquivosLog
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Arquivos de Importa'#231#227'o Logs'
  ClientHeight = 261
  ClientWidth = 615
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
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 58
    Width = 615
    Height = 203
    Align = alClient
    Color = clSilver
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 58
    Align = alTop
    Caption = 
      'Estes arquivos n'#227'o foram importados devido a alguma inconsist'#234'nc' +
      'ia. Ajuste-os para serem importados.'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
end
