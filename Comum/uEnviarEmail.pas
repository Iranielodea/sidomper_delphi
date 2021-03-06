unit uEnviarEmail;

interface

uses
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP, IdMessage,
  IdAttachmentFile, System.SysUtils, System.Generics.Collections, uEmailBase;

type
  TEmail = class(TEmailBase)
  private
  public
    function EnviarEmail: Boolean; override;
  end;

implementation

{ TEmail }

function TEmail.EnviarEmail: Boolean;
var
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  CaminhoAnexo: string;
  Lista: TList<string>;
  I: Integer;
  sNomeArquivoAnexo: string;
begin
{
  HOTMAIL:
    Porta: 587
    Host: smtp.live.com

  YAHOO:
    Porta: 587
    Host: smtp.mail.yahoo.com

  SERVIDOR PR�PRIO:
    Porta: 587
    Host: smtp.servidorproprio.inf.br

  GMAIL:
    Porta: 465
    Host: smtp.gmail.com

}

  Result := False;
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);


  Validacao;

  try
    // Configura��o do SSL
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configura��o do SMTP
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    if Porta = 465 then
      IdSMTP.UseTLS := utUseImplicitTLS
    else
      IdSMTP.UseTLS := utUseExplicitTLS;

//    IdSMTP.AuthType := satDefault;
    IdSMTP.Port := Porta; // 587;

    IdSMTP.Host := Host; //'smtp.mail.yahoo.com';
    IdSMTP.Username :=  UserName;
    IdSMTP.Password :=  Password;

    if Autenticar then
      IdSMTP.AuthType := satDefault
    else
      IdSMTP.AuthType := satNone;


    // Tentativa de conex�o e autentica��o no maximo 60 segundos
    try
      IdSMTP.Connect;
      if AutenticarSSL then
        IdSMTP.Authenticate;
    except
      on E: Exception do
      begin
        raise Exception.Create('Erro na conex�o e/ou autentica��o: ' + E.Message + sLineBreak + ClassName);
      end;
    end;

    case NivelPrioridade of
      0: IdMessage.Priority := mpLow;
      1: IdMessage.Priority := mpNormal;
      2: IdMessage.Priority := mpHigh;
    end;

    // Configura��o da mensagem
    IdMessage.From.Address := MeuEmail;                          // meu email
    IdMessage.From.Name := MeuNome;                              // meu nome
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;

    IdMessage.Recipients.EMailAddresses := Destinatario;         // destinatario
    if Copia.Trim <> '' then
      IdMessage.CCList.EMailAddresses := Copia;

    if CopiaOculta.Trim <> '' then
      IdMessage.BccList.EMailAddresses := CopiaOculta;

    IdMessage.Subject := Assunto; // assunto do email
    IdMessage.Body.Text := Texto; // corpo do email
    IdMessage.Encoding := meMIME;

    // auto resposta
    if ConfirmarLeitura then
      IdMessage.ReceiptRecipient.Text := IdMessage.From.Text;

    if ArquivoAnexo = '' then
      IdMessage.ContentType := 'text/html' // sem anexo quebrar textos com <br>
    else
      IdMessage.ContentType := 'multipart/mixed'; //com anexo quebrar textos com #13


    IdMessage.CharSet := 'ISO-8859-1';

    // Anexo da mensagem (opcional)
    if ArquivoAnexo.Trim() <> '' then
    begin
      Lista := RetornarAnexos(ArquivoAnexo);
      for I := 0 to Lista.Count -1 do
      begin
        sNomeArquivoAnexo := Lista.Items[i];
        if not (FileExists(sNomeArquivoAnexo)) then
          raise Exception.Create('Arquivo Anexo n�o Encontrado para enviar!');

        TIdAttachmentFile.Create(IdMessage.MessageParts, sNomeArquivoAnexo);
      end;
      FreeAndNil(Lista);
    end;

    // Envio da mensagem
    try
      IdSMTP.Send(IdMessage);
      Result := True;
//        MessageDlg('Mensagem enviada com sucesso.', mtInformation, [mbOK], 0);
    except
      On E:Exception do
        raise Exception.Create('Erro ao enviar a mensagem: ' + e.Message + sLineBreak + ClassName);
    end;
  finally
    // libera��o dos objetos da mem�ria
    if IdSMTP.Connected then
      IdSMTP.Disconnect();

    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;

end.
