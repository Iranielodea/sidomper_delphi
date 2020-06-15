object frmTelaEnviarEmail: TfrmTelaEnviarEmail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Envio de Emails'
  ClientHeight = 531
  ClientWidth = 761
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 761
    Height = 531
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Dados do Email'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 753
        Height = 502
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label5: TLabel
          Left = 8
          Top = 52
          Width = 29
          Height = 14
          Caption = 'Para'
        end
        object Label11: TLabel
          Left = 8
          Top = 79
          Width = 18
          Height = 14
          Caption = 'CC'
        end
        object Label12: TLabel
          Left = 8
          Top = 103
          Width = 26
          Height = 14
          Caption = 'BCC'
        end
        object Label6: TLabel
          Left = 8
          Top = 130
          Width = 51
          Height = 14
          Caption = 'Assunto'
        end
        object Label7: TLabel
          Left = 8
          Top = 311
          Width = 46
          Height = 14
          Caption = 'Anexos'
        end
        object Label8: TLabel
          Left = 8
          Top = 25
          Width = 66
          Height = 14
          Caption = 'Meu Nome'
        end
        object Label9: TLabel
          Left = 8
          Top = 189
          Width = 34
          Height = 14
          Caption = 'Texto'
        end
        object Label10: TLabel
          Left = 8
          Top = 163
          Width = 64
          Height = 14
          Caption = 'Prioridade'
        end
        object Label13: TLabel
          Left = 8
          Top = 436
          Width = 82
          Height = 14
          Caption = 'Modelo Email'
        end
        object edtPara: TEdit
          Left = 96
          Top = 49
          Width = 641
          Height = 22
          TabOrder = 1
          Text = 'iranielodea@hotmail.com'
        end
        object edtCopia: TEdit
          Left = 96
          Top = 76
          Width = 641
          Height = 22
          TabOrder = 2
        end
        object edtCopiaOculta: TEdit
          Left = 96
          Top = 100
          Width = 641
          Height = 22
          TabOrder = 3
        end
        object edtAssunto: TEdit
          Left = 96
          Top = 127
          Width = 641
          Height = 22
          TabOrder = 4
          Text = 'teste'
        end
        object edtNome: TEdit
          Left = 96
          Top = 22
          Width = 313
          Height = 22
          TabOrder = 0
          Text = 'Irani'
        end
        object mmTexto: TMemo
          Left = 96
          Top = 186
          Width = 641
          Height = 116
          Lines.Strings = (
            's'#243)
          ScrollBars = ssVertical
          TabOrder = 7
          OnEnter = mmTextoEnter
          OnExit = mmTextoExit
          OnKeyDown = FormKeyDown
        end
        object chkConfLeitura: TCheckBox
          Left = 280
          Top = 163
          Width = 225
          Height = 17
          Caption = 'Solicitar Confirma'#231#227'o de Leitura'
          TabOrder = 6
        end
        object cbbPrioridade: TComboBox
          Left = 96
          Top = 155
          Width = 169
          Height = 22
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 5
          Text = 'Baixa'
          Items.Strings = (
            'Baixa'
            'Normal'
            'Alta')
        end
        object btnAnexar: TBitBtn
          Left = 455
          Top = 380
          Width = 138
          Height = 25
          Caption = 'Anexar'
          TabOrder = 9
          OnClick = btnAnexarClick
        end
        object mmoAnexo: TMemo
          Left = 96
          Top = 308
          Width = 641
          Height = 66
          Color = clSilver
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 8
        end
        object Panel3: TPanel
          Left = 1
          Top = 460
          Width = 751
          Height = 41
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 14
          object btnEnviar: TBitBtn
            Left = 287
            Top = 8
            Width = 90
            Height = 25
            Caption = '&Enviar'
            TabOrder = 0
            OnClick = btnEnviarClick
          end
          object btnFechar: TBitBtn
            Left = 383
            Top = 8
            Width = 90
            Height = 25
            Caption = 'Fechar'
            TabOrder = 1
            OnClick = btnFecharClick
          end
        end
        object btnLimparAnexo: TBitBtn
          Left = 599
          Top = 380
          Width = 138
          Height = 25
          Caption = 'Limpar Anexos'
          TabOrder = 10
          OnClick = btnLimparAnexoClick
        end
        object cbbModelo: TComboBox
          Left = 96
          Top = 432
          Width = 145
          Height = 22
          Style = csDropDownList
          ItemIndex = 0
          TabOrder = 13
          Text = 'Modelo 1'
          Items.Strings = (
            'Modelo 1'
            'Modelo 2')
        end
        object chkAut: TCheckBox
          Left = 96
          Top = 388
          Width = 90
          Height = 17
          Caption = 'Autenticar'
          Checked = True
          State = cbChecked
          TabOrder = 11
        end
        object chkAutSSL: TCheckBox
          Left = 192
          Top = 388
          Width = 117
          Height = 17
          Caption = 'Autenticar SSL'
          Checked = True
          State = cbChecked
          TabOrder = 12
        end
      end
    end
    object tsConfig: TTabSheet
      Caption = 'Configura'#231#245'es'
      ImageIndex = 1
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 753
        Height = 502
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 10
          Width = 34
          Height = 14
          Caption = 'Porta'
        end
        object Label2: TLabel
          Left = 63
          Top = 10
          Width = 29
          Height = 14
          Caption = 'Host'
        end
        object Label3: TLabel
          Left = 8
          Top = 56
          Width = 34
          Height = 14
          Caption = 'Login'
        end
        object Label4: TLabel
          Left = 375
          Top = 56
          Width = 40
          Height = 14
          Caption = 'Senha'
        end
        object edtPorta: TEdit
          Left = 8
          Top = 30
          Width = 49
          Height = 22
          NumbersOnly = True
          TabOrder = 0
          Text = '587'
        end
        object edtLogin: TEdit
          Left = 8
          Top = 75
          Width = 361
          Height = 22
          TabOrder = 2
          Text = 'irani_elodea@yahoo.com.br'
        end
        object edtSenha: TEdit
          Left = 375
          Top = 75
          Width = 170
          Height = 22
          PasswordChar = '*'
          TabOrder = 3
        end
        object cbbHost: TComboBox
          Left = 63
          Top = 30
          Width = 482
          Height = 22
          TabOrder = 1
          Text = 'smtp.mail.yahoo.com'
          Items.Strings = (
            'smtp.mail.yahoo.com'
            'smtp.live.com'
            'smtp.gmail.com'
            'smtp.servidorproprio.inf.br')
        end
      end
    end
  end
  object OpenDialog: TOpenDialog
    FileName = '*.*'
    Left = 520
    Top = 248
  end
end
