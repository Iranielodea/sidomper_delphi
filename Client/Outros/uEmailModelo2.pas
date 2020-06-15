unit uEmailModelo2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs
 , IdBaseComponent, IdComponent // Units Genéricas do Indy
 , IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL // Objeto SSL
 , IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient, IdSMTPBase, IdSMTP // Objeto SMTP
 , IdMessage // Objeto de Mensagem
 , IdAttachmentFile, Vcl.StdCtrls, uEmailBase, System.Generics.Collections;

type
  TEmail2 = class(TEmailBase)
  public
    function EnviarEmail: Boolean; override;
  end;


implementation

{ TEmail2 }

function TEmail2.EnviarEmail: Boolean;
var
 AuthSSL : TIdSSLIOHandlerSocketOpenSSL;
 IdSMTP    : TIdSMTP;
 IdMessage : TIdMessage;
 Lista: TList<string>;
 i: Integer;
 sNomeArquivoAnexo: string;
begin
  Result:= False;
  IdSMTP    := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);
  try
    IdSMTP.Host     := Host;
    IdSMTP.Port     := Porta;
    IdSMTP.AuthType := satDefault;
    IdSMTP.Username := UserName;
    IdSMTP.Password := Password;

    if AutenticarSSL then
    begin
      AuthSSL                   := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
      IdSMTP.IOHandler          := AuthSSL;
      if Porta = 465 then
        IdSMTP.UseTLS             := utUseImplicitTLS
      else
        IdSMTP.UseTLS             := utUseExplicitTLS;
      AuthSSL.SSLOptions.Method := sslvSSLv3;
      AuthSSL.SSLOptions.Mode   := sslmClient;
    end;

    if Autenticar then
      IdSMTP.AuthType := satDefault
    else
      IdSMTP.AuthType := satNone;

    try
      IdSMTP.Connect;

      case NivelPrioridade of
        0: IdMessage.Priority := mpLow;
        1: IdMessage.Priority := mpNormal;
        2: IdMessage.Priority := mpHigh;
      end;

      IdMessage.From.Address               := MeuEmail;
      IdMessage.Recipients.EMailAddresses  := Destinatario;
      IdMessage.Subject                    := Assunto;
      IdMessage.Body.Text                  := Texto;
      IdMessage.Encoding                   := meMIME;

      if Copia.Trim <> '' then
        IdMessage.CCList.EMailAddresses := Copia;

      if CopiaOculta.Trim <> '' then
        IdMessage.BccList.EMailAddresses := CopiaOculta;

    // auto resposta
      if ConfirmarLeitura then
        IdMessage.ReceiptRecipient.Text := IdMessage.From.Text;

      if ArquivoAnexo = '' then
        IdMessage.ContentType := 'text/html';

      IdMessage.CharSet := 'ISO-8859-1';


      // Anexo da mensagem (opcional)
      if ArquivoAnexo.Trim() <> '' then
      begin
        IdMessage.MessageParts.Clear; // Limpa os anexos da lista
        Lista := RetornarAnexos(ArquivoAnexo);

        for I := 0 to Lista.Count -1 do
        begin
          sNomeArquivoAnexo := Lista.Items[i];
          if not (FileExists(sNomeArquivoAnexo)) then
            raise Exception.Create('Arquivo Anexo não Encontrado para enviar!');

          TIdAttachmentFile.Create(IdMessage.MessageParts, sNomeArquivoAnexo);
        end;
        FreeAndNil(Lista);
      end;


      IdSMTP.Send(IdMessage);
      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        ShowMessage('Erro ao enviar E-Mail:'+#13#10+e.Message);
        Exit;
      end;
    end;
  finally
    IdSMTP.Disconnect;
    FreeAndNil(IdSMTP);
    FreeAndNil(IdMessage);
    if AuthSSL <> nil then
    FreeAndNil(AuthSSL);
  end;
  Result:= True;
end;

end.
