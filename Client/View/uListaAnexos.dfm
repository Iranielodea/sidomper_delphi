object frmListaAnexos: TfrmListaAnexos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Lista de Anexos'
  ClientHeight = 411
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 779
    Height = 370
    ActivePage = tsChamado
    Align = alClient
    TabOrder = 0
    object tsChamado: TTabSheet
      Caption = 'Chamado'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 771
        Height = 73
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 16
          Width = 10
          Height = 13
          Caption = 'Id'
        end
        object Label2: TLabel
          Left = 87
          Top = 16
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label3: TLabel
          Left = 183
          Top = 16
          Width = 23
          Height = 13
          Caption = 'Hora'
        end
        object Label4: TLabel
          Left = 254
          Top = 16
          Width = 33
          Height = 13
          Caption = 'Cliente'
        end
        object Label5: TLabel
          Left = 567
          Top = 16
          Width = 39
          Height = 13
          Caption = 'Contato'
        end
        object DBEdit1: TDBEdit
          Left = 16
          Top = 35
          Width = 65
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Cha_Id'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 87
          Top = 35
          Width = 90
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Cha_DataAbertura'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 183
          Top = 35
          Width = 65
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Cha_HoraAbertura'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 254
          Top = 35
          Width = 307
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Cli_Nome'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 567
          Top = 35
          Width = 202
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Cha_Contato'
          DataSource = dsCad
          ReadOnly = True
          TabOrder = 4
        end
      end
      object dbDados: TDBGrid
        Left = 0
        Top = 73
        Width = 771
        Height = 269
        Align = alClient
        DataSource = dsCad
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbDadosDrawColumnCell
        OnDblClick = dbDadosDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ChOco_Docto'
            Title.Caption = 'Documento'
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ChOco_Data'
            Title.Caption = 'Data'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ChOco_Anexo'
            Title.Caption = 'Anexo'
            Width = 510
            Visible = True
          end>
      end
    end
    object tsSolicitacao: TTabSheet
      Caption = 'Solicita'#231#227'o'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 771
        Height = 113
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label6: TLabel
          Left = 16
          Top = 16
          Width = 10
          Height = 13
          Caption = 'Id'
        end
        object Label7: TLabel
          Left = 87
          Top = 16
          Width = 23
          Height = 13
          Caption = 'Data'
        end
        object Label8: TLabel
          Left = 183
          Top = 16
          Width = 23
          Height = 13
          Caption = 'Hora'
        end
        object Label9: TLabel
          Left = 254
          Top = 16
          Width = 33
          Height = 13
          Caption = 'Cliente'
        end
        object Label10: TLabel
          Left = 567
          Top = 16
          Width = 39
          Height = 13
          Caption = 'Contato'
        end
        object Label11: TLabel
          Left = 16
          Top = 64
          Width = 31
          Height = 13
          Caption = 'Anexo'
        end
        object btnAnexo: TSpeedButton
          Left = 564
          Top = 83
          Width = 23
          Height = 22
          OnClick = btnAnexoClick
        end
        object DBEdit6: TDBEdit
          Left = 16
          Top = 35
          Width = 65
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Sol_Id'
          DataSource = dsSolicitacao
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit7: TDBEdit
          Left = 87
          Top = 35
          Width = 90
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Sol_Data'
          DataSource = dsSolicitacao
          ReadOnly = True
          TabOrder = 1
        end
        object DBEdit8: TDBEdit
          Left = 183
          Top = 35
          Width = 65
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Sol_Hora'
          DataSource = dsSolicitacao
          ReadOnly = True
          TabOrder = 2
        end
        object DBEdit9: TDBEdit
          Left = 254
          Top = 35
          Width = 307
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Cli_Nome'
          DataSource = dsSolicitacao
          ReadOnly = True
          TabOrder = 3
        end
        object DBEdit10: TDBEdit
          Left = 567
          Top = 35
          Width = 202
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Sol_Contato'
          DataSource = dsSolicitacao
          ReadOnly = True
          TabOrder = 4
        end
        object edtAnexo: TDBEdit
          Left = 16
          Top = 83
          Width = 545
          Height = 21
          TabStop = False
          Color = clSilver
          DataField = 'Sol_Anexo'
          DataSource = dsSolicitacao
          ReadOnly = True
          TabOrder = 5
        end
      end
      object dbSolicitacao: TDBGrid
        Left = 0
        Top = 113
        Width = 771
        Height = 229
        Align = alClient
        DataSource = dsSolicitacao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbSolicitacaoDrawColumnCell
        OnDblClick = dbSolicitacaoDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'SOcor_Data'
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOcor_Hora'
            Title.Caption = 'Hora'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Tipo'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SOcor_Anexo'
            Title.Caption = 'Anexo'
            Width = 536
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 370
    Width = 779
    Height = 41
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 1
    object btnVoltar: TBitBtn
      Left = 683
      Top = 6
      Width = 90
      Height = 25
      Caption = '&Voltar'
      TabOrder = 0
      OnClick = btnVoltarClick
    end
  end
  object dsCad: TDataSource
    Left = 412
    Top = 136
  end
  object dsSolicitacao: TDataSource
    DataSet = DMSolicitacao.CDSSolicitacaoAnexo
    Left = 244
    Top = 128
  end
end
