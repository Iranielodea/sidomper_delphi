unit uEmailBase;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TEmailBase = class
  private
    FDestinatario: string;
    FCopiaOculta: string;
    FArquivoAnexo: string;
    FConfirmarLeitura: Boolean;
    FMeuNome: string;
    FCopia: string;
    FNivelPrioridade: Integer;
    FMeuEmail: string;
    FPassword: string;
    FHost: string;
    FPorta: Integer;
    FAssunto: string;
    FUserName: string;
    FTexto: string;
    FAutenticarSSL: Boolean;
    FAutenticar: Boolean;
    procedure SetArquivoAnexo(const Value: string);
    procedure SetAssunto(const Value: string);
    procedure SetConfirmarLeitura(const Value: Boolean);
    procedure SetCopia(const Value: string);
    procedure SetCopiaOculta(const Value: string);
    procedure SetDestinatario(const Value: string);
    procedure SetHost(const Value: string);
    procedure SetMeuEmail(const Value: string);
    procedure SetMeuNome(const Value: string);
    procedure SetNivelPrioridade(const Value: Integer);
    procedure SetPassword(const Value: string);
    procedure SetPorta(const Value: Integer);
    procedure SetTexto(const Value: string);
    procedure SetUserName(const Value: string);
    procedure SetAutenticar(const Value: Boolean);
    procedure SetAutenticarSSL(const Value: Boolean);
  protected
    procedure Validacao;
    function RetornarAnexos(TodosAnexos: string): TList<string>; virtual;
  public
    function EnviarEmail: Boolean; virtual; abstract;
    property Porta: Integer read FPorta write SetPorta;
    property Host: string read FHost write SetHost;
    property UserName: string read FUserName write SetUserName;
    property Password: string read FPassword write SetPassword;
    property MeuEmail: string read FMeuEmail write SetMeuEmail;
    property MeuNome: string read FMeuNome write SetMeuNome;
    property Destinatario: string read FDestinatario write SetDestinatario;
    property Copia: string read FCopia write SetCopia;
    property CopiaOculta: string read FCopiaOculta write SetCopiaOculta;
    property Assunto: string read FAssunto write SetAssunto;
    property Texto: string read FTexto write SetTexto;
    property ArquivoAnexo: string read FArquivoAnexo write SetArquivoAnexo;
    property ConfirmarLeitura: Boolean read FConfirmarLeitura write SetConfirmarLeitura;
    property NivelPrioridade: Integer read FNivelPrioridade write SetNivelPrioridade;
    property Autenticar: Boolean read FAutenticar write SetAutenticar;
    property AutenticarSSL: Boolean read FAutenticarSSL write SetAutenticarSSL;
  end;

implementation

{ TEmailBase }

function TEmailBase.RetornarAnexos(TodosAnexos: string): TList<string>;
var
  sResult: string;
  i: Integer;
  sChar: string;
  Lista: TList<string>;
  iTamanho: Integer;
begin
  Lista := TList<string>.Create;
  iTamanho := TodosAnexos.Length;

  for I := 1 to iTamanho do
  begin
    sChar := Copy(TodosAnexos, i, 1);
    if sChar =  ';' then
    begin
      Lista.Add(sResult);
      sResult := '';
      Continue;
    end;
    sResult := sResult + sChar;
  end;
  Lista.Add(sResult);

  Result := Lista;
end;

procedure TEmailBase.SetArquivoAnexo(const Value: string);
begin
  FArquivoAnexo := Value;
end;

procedure TEmailBase.SetAssunto(const Value: string);
begin
  FAssunto := Value;
end;

procedure TEmailBase.SetAutenticar(const Value: Boolean);
begin
  FAutenticar := Value;
end;

procedure TEmailBase.SetAutenticarSSL(const Value: Boolean);
begin
  FAutenticarSSL := Value;
end;

procedure TEmailBase.SetConfirmarLeitura(const Value: Boolean);
begin
  FConfirmarLeitura := Value;
end;

procedure TEmailBase.SetCopia(const Value: string);
begin
  FCopia := Value;
end;

procedure TEmailBase.SetCopiaOculta(const Value: string);
begin
  FCopiaOculta := Value;
end;

procedure TEmailBase.SetDestinatario(const Value: string);
begin
  FDestinatario := Value;
end;

procedure TEmailBase.SetHost(const Value: string);
begin
  FHost := Value;
end;

procedure TEmailBase.SetMeuEmail(const Value: string);
begin
  FMeuEmail := Value;
end;

procedure TEmailBase.SetMeuNome(const Value: string);
begin
  FMeuNome := Value;
end;

procedure TEmailBase.SetNivelPrioridade(const Value: Integer);
begin
  FNivelPrioridade := Value;
end;

procedure TEmailBase.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TEmailBase.SetPorta(const Value: Integer);
begin
  FPorta := Value;
end;

procedure TEmailBase.SetTexto(const Value: string);
begin
  FTexto := Value;
end;

procedure TEmailBase.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

procedure TEmailBase.Validacao;
begin
  if Trim(FDestinatario) = '' then
    raise Exception.Create('Informe o Destinatário!');

  if Trim(FUserName) = '' then
    raise Exception.Create('Informe o Usuário!');

  if Trim(FMeuEmail) = '' then
    FMeuNome := FUserName;

  if Trim(FPassword) = '' then
    raise Exception.Create('Informe a Senha!');

  if Trim(FHost) = '' then
    raise Exception.Create('Informe o Host!');

  if Trim(FAssunto) = '' then
    raise Exception.Create('Informe o Assunto!');

  if FPorta <= 0 then
    raise Exception.Create('Informe a Porta!');
end;

end.
