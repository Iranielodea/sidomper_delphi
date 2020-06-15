object frmListaAnexo: TfrmListaAnexo
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Lista de Anexos'
  ClientHeight = 362
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 994
    Height = 321
    ActivePage = tsChamado
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 481
    ExplicitHeight = 249
    object tsChamado: TTabSheet
      Caption = 'Chamado'
      ExplicitLeft = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 321
    Width = 994
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    ExplicitLeft = 208
    ExplicitTop = 288
    ExplicitWidth = 185
  end
end
