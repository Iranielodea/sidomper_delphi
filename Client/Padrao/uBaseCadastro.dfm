object frmBaseCadastro: TfrmBaseCadastro
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Base'
  ClientHeight = 366
  ClientWidth = 660
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object pgControl: TPageControl
    Left = 0
    Top = 0
    Width = 660
    Height = 366
    ActivePage = tsPesquisa
    Align = alClient
    TabOrder = 0
    object tsPesquisa: TTabSheet
      Caption = 'Pesquisa'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 652
        Height = 296
        Align = alClient
        BevelOuter = bvLowered
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 1
          Top = 1
          Width = 650
          Height = 56
          Align = alTop
          Color = clWhite
          ParentBackground = False
          ParentColor = False
          TabOrder = 0
          object Label1: TLabel
            Left = 15
            Top = 8
            Width = 42
            Height = 14
            Caption = 'Ordem'
          end
          object Label2: TLabel
            Left = 303
            Top = 8
            Width = 208
            Height = 14
            Caption = 'Digite o Texto e pressione ENTER'
          end
          object Label3: TLabel
            Left = 215
            Top = 9
            Width = 57
            Height = 14
            Caption = 'Pesquisa'
          end
          object cbbCampos: TComboBox
            Left = 15
            Top = 28
            Width = 194
            Height = 22
            Hint = '[CTRL + I] - Campo Anterior  [CTRL + O] - Pr'#243'ximo Campo'
            CustomHint = BalloonHint1
            Style = csDropDownList
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = cbbCamposClick
          end
          object edtDescricao: TEdit
            Left = 303
            Top = 28
            Width = 273
            Height = 22
            Hint = 'Digite e pressione [Enter]'
            CustomHint = BalloonHint1
            CharCase = ecUpperCase
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnKeyDown = edtDescricaoKeyDown
          end
          object cbbPesquisa: TComboBox
            Left = 215
            Top = 28
            Width = 82
            Height = 22
            Style = csDropDownList
            ItemIndex = 1
            TabOrder = 1
            Text = 'Cont'#234'm'
            Items.Strings = (
              'Iniciais'
              'Cont'#234'm')
          end
        end
        object dbDados: TDBGrid
          Left = 1
          Top = 57
          Width = 650
          Height = 238
          CustomHint = BalloonHint1
          Align = alClient
          Color = clActiveCaption
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          OnDrawColumnCell = dbDadosDrawColumnCell
          OnDblClick = dbDadosDblClick
          OnKeyDown = dbDadosKeyDown
          OnTitleClick = dbDadosTitleClick
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 296
        Width = 652
        Height = 41
        Align = alBottom
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object btnNovo: TBitBtn
          Left = 137
          Top = 6
          Width = 90
          Height = 25
          Hint = 'Insert'
          CustomHint = BalloonHint1
          Caption = '&Novo'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnNovoClick
        end
        object btnEditar: TBitBtn
          Left = 226
          Top = 6
          Width = 90
          Height = 25
          Hint = 'F2'
          CustomHint = BalloonHint1
          Caption = '&Editar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnEditarClick
        end
        object btnExcluir: TBitBtn
          Left = 315
          Top = 6
          Width = 90
          Height = 25
          Hint = 'CTRL + Del'
          CustomHint = BalloonHint1
          Caption = 'E&xcluir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnExcluirClick
        end
        object btnFiltrar: TBitBtn
          Left = 404
          Top = 6
          Width = 90
          Height = 25
          Hint = 'F3'
          CustomHint = BalloonHint1
          Caption = '&Filtrar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnFiltrarClick
        end
        object btnSair: TBitBtn
          Left = 493
          Top = 6
          Width = 90
          Height = 25
          Hint = 'Esc'
          CustomHint = BalloonHint1
          Caption = 'Sai&r'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnSairClick
        end
        object btnAnterior: TBitBtn
          Left = 40
          Top = 6
          Width = 33
          Height = 25
          Hint = 'Registro Anterior'
          CustomHint = BalloonHint1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TabStop = False
          OnClick = btnAnteriorClick
        end
        object btnProximo: TBitBtn
          Left = 72
          Top = 6
          Width = 33
          Height = 25
          Hint = 'Pr'#243'ximo Registro'
          CustomHint = BalloonHint1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TabStop = False
          OnClick = btnProximoClick
        end
        object btnPrimeiro: TBitBtn
          Left = 8
          Top = 6
          Width = 33
          Height = 25
          Hint = 'Primeiro Registro'
          CustomHint = BalloonHint1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          TabStop = False
          OnClick = btnPrimeiroClick
        end
        object btnUltimo: TBitBtn
          Left = 105
          Top = 6
          Width = 33
          Height = 25
          Hint = #218'ltimo Registro'
          CustomHint = BalloonHint1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          TabStop = False
          OnClick = btnUltimoClick
        end
      end
    end
    object tsEdicao: TTabSheet
      Caption = 'Edi'#231#227'o'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 652
        Height = 296
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 0
        Top = 296
        Width = 652
        Height = 41
        Align = alBottom
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object btnSalvar: TBitBtn
          Left = 8
          Top = 6
          Width = 90
          Height = 25
          Hint = 'F8'
          CustomHint = BalloonHint1
          Caption = '&Salvar'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnSalvarClick
        end
        object btnCancelar: TBitBtn
          Left = 97
          Top = 6
          Width = 90
          Height = 25
          Hint = 'Esc'
          CustomHint = BalloonHint1
          Caption = '&Cancelar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnCancelarClick
        end
      end
    end
    object tsFiltro: TTabSheet
      Caption = 'Filtro'
      ImageIndex = 2
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 652
        Height = 296
        Align = alClient
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object PageControl2: TPageControl
          Left = 1
          Top = 1
          Width = 650
          Height = 294
          ActivePage = tsGeral
          Align = alClient
          TabOrder = 0
          object tsGeral: TTabSheet
            Caption = 'Geral'
            object pnlGeral: TPanel
              Left = 0
              Top = 0
              Width = 642
              Height = 265
              Align = alClient
              BevelOuter = bvLowered
              TabOrder = 0
              object Situação: TLabel
                Left = 17
                Top = 16
                Width = 54
                Height = 14
                Caption = 'Situa'#231#227'o'
              end
              object cbbSituacao: TComboBox
                Left = 16
                Top = 35
                Width = 145
                Height = 22
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 0
                Text = 'Ativo'
                Items.Strings = (
                  'Ativo'
                  'Inativo'
                  'Todos')
              end
            end
          end
        end
      end
      object Panel6: TPanel
        Left = 0
        Top = 296
        Width = 652
        Height = 41
        Align = alBottom
        BevelOuter = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object btnFiltro: TBitBtn
          Left = 8
          Top = 6
          Width = 90
          Height = 25
          Hint = 'F4'
          CustomHint = BalloonHint1
          Caption = '&Filtrar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btnFiltroClick
        end
        object btnImprimir: TBitBtn
          Left = 97
          Top = 6
          Width = 90
          Height = 25
          Hint = 'F7'
          CustomHint = BalloonHint1
          Caption = '&Imprimir'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object btnFecharFiltro: TBitBtn
          Left = 187
          Top = 6
          Width = 90
          Height = 25
          Hint = 'Esc'
          CustomHint = BalloonHint1
          Caption = '&Voltar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnFecharFiltroClick
        end
      end
    end
  end
  object dsPesquisa: TDataSource
    Left = 476
    Top = 49
  end
  object dsCad: TDataSource
    OnStateChange = dsCadStateChange
    Left = 480
    Top = 88
  end
  object BalloonHint1: TBalloonHint
    HideAfter = 2000
    Left = 420
    Top = 145
  end
end
