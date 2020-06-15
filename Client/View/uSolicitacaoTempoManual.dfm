object frmSolicitacaoTempoManual: TfrmSolicitacaoTempoManual
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Tempo das Solicita'#231#245'es'
  ClientHeight = 355
  ClientWidth = 688
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
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 355
    ActivePage = tsPesquisa
    Align = alClient
    TabOrder = 0
    object tsPesquisa: TTabSheet
      Caption = 'Pesquisa'
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 680
        Height = 326
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Panel1: TPanel
          Left = 1
          Top = 284
          Width = 678
          Height = 41
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 0
          object btnExcluir: TBitBtn
            Left = 316
            Top = 6
            Width = 90
            Height = 25
            Caption = '&Excluir'
            TabOrder = 0
            OnClick = btnExcluirClick
          end
          object btnSair: TBitBtn
            Left = 407
            Top = 6
            Width = 90
            Height = 25
            Caption = '&Sair'
            TabOrder = 1
            OnClick = btnSairClick
          end
          object btnPrimeiro: TBitBtn
            Left = 8
            Top = 6
            Width = 33
            Height = 25
            Hint = 'Primeiro Registro'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            TabStop = False
            OnClick = btnPrimeiroClick
          end
          object btnAnterior: TBitBtn
            Left = 40
            Top = 6
            Width = 33
            Height = 25
            Hint = 'Registro Anterior'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            TabStop = False
            OnClick = btnAnteriorClick
          end
          object btnProximo: TBitBtn
            Left = 72
            Top = 6
            Width = 33
            Height = 25
            Hint = 'Pr'#243'ximo Registro'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            TabStop = False
            OnClick = btnProximoClick
          end
          object btnUltimo: TBitBtn
            Left = 105
            Top = 6
            Width = 33
            Height = 25
            Hint = #218'ltimo Registro'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 5
            TabStop = False
            OnClick = btnUltimoClick
          end
          object btnNovo: TBitBtn
            Left = 137
            Top = 6
            Width = 90
            Height = 25
            Hint = 'Insert'
            Caption = '&Novo'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            OnClick = btnNovoClick
          end
          object btnEditar: TBitBtn
            Left = 226
            Top = 6
            Width = 90
            Height = 25
            Hint = 'F2'
            Caption = '&Editar'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            OnClick = btnEditarClick
          end
        end
        object dbDados: TDBGrid
          Left = 1
          Top = 1
          Width = 678
          Height = 283
          Align = alClient
          DataSource = dsCad
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDrawColumnCell = dbDadosDrawColumnCell
          OnDblClick = dbDadosDblClick
          OnTitleClick = dbDadosTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'STemp_Id'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'STemp_Data'
              Title.Caption = 'Data'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STemp_HoraInicio'
              Title.Caption = 'Hora In'#237'cio'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STemp_HoraFim'
              Title.Caption = 'Hora Fim'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Usu_Nome'
              Title.Caption = 'Usu'#225'rio'
              Width = 375
              Visible = True
            end>
        end
      end
    end
    object tsEdicao: TTabSheet
      Caption = 'Edi'#231#227'o'
      ImageIndex = 1
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 680
        Height = 285
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 56
          Height = 14
          Caption = 'Usu'#225'rio*'
        end
        object Label2: TLabel
          Left = 16
          Top = 84
          Width = 38
          Height = 14
          Caption = 'Data*'
        end
        object Label3: TLabel
          Left = 127
          Top = 84
          Width = 78
          Height = 14
          Caption = 'Hora Inicial*'
        end
        object Label4: TLabel
          Left = 218
          Top = 84
          Width = 71
          Height = 14
          Caption = 'Hora Final*'
        end
        object btnUsuario: TSpeedButton
          Left = 513
          Top = 44
          Width = 23
          Height = 22
          OnClick = btnUsuarioClick
        end
        object Label5: TLabel
          Left = 16
          Top = 144
          Width = 49
          Height = 14
          Caption = 'Status*'
        end
        object btnStatus: TSpeedButton
          Left = 513
          Top = 164
          Width = 23
          Height = 22
          OnClick = btnStatusClick
        end
        object edtCodUsuario: TEdit
          Left = 16
          Top = 44
          Width = 64
          Height = 22
          Hint = '[F9] - Pesquisar'
          Alignment = taCenter
          NumbersOnly = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnExit = edtCodUsuarioExit
          OnKeyDown = edtCodUsuarioKeyDown
        end
        object edtNomeUsuario: TEdit
          Left = 86
          Top = 44
          Width = 421
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object edtData: TMaskEdit
          Left = 16
          Top = 104
          Width = 93
          Height = 22
          EditMask = '##/##/####'
          MaxLength = 10
          TabOrder = 2
          Text = '  /  /    '
        end
        object edtHoraInicial: TMaskEdit
          Left = 127
          Top = 104
          Width = 68
          Height = 22
          EditMask = '##:##'
          MaxLength = 5
          TabOrder = 3
          Text = '  :  '
        end
        object edtHoraFinal: TMaskEdit
          Left = 218
          Top = 104
          Width = 70
          Height = 22
          EditMask = '##:##'
          MaxLength = 5
          TabOrder = 4
          Text = '  :  '
        end
        object edtUsuario: TEdit
          Left = 561
          Top = 44
          Width = 33
          Height = 22
          TabOrder = 5
          Visible = False
        end
        object edtCodStatus: TEdit
          Left = 16
          Top = 164
          Width = 64
          Height = 22
          Hint = '[F9] - Pesquisar'
          Alignment = taCenter
          NumbersOnly = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnExit = edtCodStatusExit
          OnKeyDown = edtCodUsuarioKeyDown
        end
        object edtNomeStatus: TEdit
          Left = 86
          Top = 164
          Width = 421
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
        object edtStatus: TEdit
          Left = 561
          Top = 164
          Width = 33
          Height = 22
          TabOrder = 8
          Visible = False
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 285
        Width = 680
        Height = 41
        Align = alBottom
        BevelOuter = bvLowered
        TabOrder = 1
        object btnSalvar: TBitBtn
          Left = 8
          Top = 6
          Width = 90
          Height = 25
          Caption = '&Salvar'
          TabOrder = 0
          OnClick = btnSalvarClick
        end
        object btnCancelar: TBitBtn
          Left = 97
          Top = 6
          Width = 90
          Height = 25
          Hint = 'Esc'
          Caption = '&Cancelar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnCancelarClick
        end
      end
    end
  end
  object dsCad: TDataSource
    DataSet = DMSolicitacao.CDSTempo
    Left = 388
    Top = 121
  end
end
