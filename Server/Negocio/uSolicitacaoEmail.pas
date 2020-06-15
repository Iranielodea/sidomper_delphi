unit uSolicitacaoEmail;

interface

uses
  uDM, System.SysUtils, Data.DB, FireDAC.Comp.Client, uContaEmail, System.Generics.Collections;

type
  TSolicitacaoEmail = class
  private
    FLista: TList<string>;
    FListaCliente: TList<string>;
    function RetornarEmailConta_Email(IdUsuario: integer): string;

    function RetornarEmailClientes(IdSolicitacao, IdUsuario: Integer): string;
    function RetornarEmailSupervisor(IdUsuario, IdStatus: Integer): string;
    function RetornarEmailConsultor(IdSolicitacao, IdUsuario, IdStatus: Integer): string;
    function RetornarEmailRevenda(IdSolicitacao, IdUsuario, IdStatus: Integer): string;

    procedure Adicionar(email: string);
    procedure AdicionarCliente(email: string);

  public
    function RetornaEmails(IdSolicitacao, IdUsuario, IdStatus: integer): string;
    function RetornaEmailCliente(IdSolicitacao, IdUsuario: integer): string;
    constructor create;
    destructor destroy; override;

  end;


implementation

uses
  uStatus, uDepartamento, uFuncoesServidor;

{ TSolicitacaoEmail }

procedure TSolicitacaoEmail.Adicionar(email: string);
begin
  if not TFuncoes.EmailExisteNaLista(email, FLista) then
    FLista.Add(email);
end;

procedure TSolicitacaoEmail.AdicionarCliente(email: string);
begin
  if not TFuncoes.EmailExisteNaLista(email, FListaCliente) then
    FListaCliente.Add(email);
end;

constructor TSolicitacaoEmail.create;
begin
  inherited create;
  FListaCliente := TList<string>.Create;
  FLista := TList<string>.Create;
end;

destructor TSolicitacaoEmail.destroy;
begin
  FreeAndNil(FLista);
  FreeAndNil(FListaCliente);
  inherited;
end;

function TSolicitacaoEmail.RetornaEmailCliente(IdSolicitacao,
  IdUsuario: integer): string;
begin
  RetornarEmailClientes(IdSolicitacao, IdUsuario);
  Result := TFuncoes.RetornaListaEmail(FListaCliente);
end;

function TSolicitacaoEmail.RetornaEmails(IdSolicitacao, IdUsuario, IdStatus: integer): string;
begin
  RetornarEmailSupervisor(IdUsuario, IdStatus);
  RetornarEmailConsultor(IdSolicitacao, IdUsuario, IdStatus);
  RetornarEmailRevenda(IdSolicitacao, IdUsuario, IdStatus);

  Result := TFuncoes.RetornaListaEmail(FLista);
end;

function TSolicitacaoEmail.RetornarEmailClientes(IdSolicitacao, IdUsuario: Integer): string;
var
  Qry: TFDQuery;
  sEmail: string;
  iContador: Integer;
  Status: TStatus;
  bNotificar: Boolean;
  idStatus: Integer;
begin
  sEmail := RetornarEmailConta_Email(IdUsuario);
  if Trim(sEmail) = '' then // se não tem conta email, exit
    Exit;


  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dm.Conexao;

    Qry.SQL.Add(' SELECT');
    Qry.SQL.Add(' 	Sta_Id');
    Qry.SQL.Add(' FROM Solicitacao');
    Qry.SQL.Add(' 	INNER JOIN Cliente_Email ON Sol_Cliente = CliEm_Cliente');
    Qry.SQL.Add(' 	INNER JOIN Status ON Sol_Status = Sta_Id');
    Qry.SQL.Add(' WHERE Sta_NotificarCliente = 1');
    Qry.SQL.Add(' AND Sol_Id = ' + IntToStr(IdSolicitacao));
    Qry.Open();

    if qry.FieldByName('Sta_Id').AsInteger = 0 then
      Exit;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT');
    Qry.SQL.Add(' 	CliEm_Email');
    Qry.SQL.Add(' FROM Solicitacao');
    Qry.SQL.Add(' 	INNER JOIN Cliente_Email ON Sol_Cliente = CliEm_Cliente');
    Qry.SQL.Add(' 	INNER JOIN Status ON Sol_Status = Sta_Id');
    Qry.SQL.Add(' WHERE Sta_NotificarCliente = 1');
    Qry.SQL.Add(' AND CliEm_Notificar = 1');
    Qry.SQL.Add(' AND Sol_Id = ' + IntToStr(IdSolicitacao));
    Qry.Open();

    iContador := 0;

    if not Qry.IsEmpty then
    begin
      while not Qry.Eof do
      begin
        AdicionarCliente(Qry.FieldByName('CliEm_Email').AsString);
        Inc(iContador);
        Qry.Next;
      end;
    end;

    // se não tem no cliente, buscar no usuário logado
    if iContador = 0 then
      AdicionarCliente(sEmail);

  finally
    FreeAndNil(Qry);
  end;
end;

function TSolicitacaoEmail.RetornarEmailConsultor(
  IdSolicitacao, IdUsuario, IdStatus: Integer): string;
var
  Qry: TFDQuery;
  sEmail: string;
  objStatus: TStatus;
  TemRegistro: Boolean;
begin

  sEmail := RetornarEmailConta_Email(IdUsuario);
  if Trim(sEmail) = '' then
    Exit;

  objStatus := TStatus.Create;
  try
    TemRegistro := objStatus.NotificarConsultor(IdStatus);
  finally
    FreeAndNil(objStatus);
  end;

  Qry := TFDQuery.Create(nil);
  try
    if TemRegistro then
    begin
      Qry.Connection := DM.Conexao;
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(' SELECT');
      Qry.SQL.Add(' 	Usu_Email');
      Qry.SQL.Add(' FROM Solicitacao');
      Qry.SQL.Add(' 	INNER JOIN Cliente ON Sol_Cliente = Cli_Id');
      Qry.SQL.Add(' 	INNER JOIN Usuario ON Cli_Usuario = Usu_Id');
      Qry.SQL.Add(' WHERE Sol_Id = ' + IntToStr(IdSolicitacao));
      Qry.Open();

      if not Qry.IsEmpty then
        Adicionar(Qry.FieldByName('usu_Email').AsString);
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TSolicitacaoEmail.RetornarEmailConta_Email(IdUsuario: integer): string;
var
  ContaEmail: TContaEmail;
begin
  ContaEmail := TContaEmail.Create;
  try
    Result := ContaEmail.RetornarEmail(IdUsuario);
  finally
    FreeAndNil(ContaEmail);
  end;
end;

function TSolicitacaoEmail.RetornarEmailRevenda(IdSolicitacao, IdUsuario, IdStatus:
  Integer): string;
var
  Qry: TFDQuery;
  sEmail: string;
  objStatus: TStatus;
  TemRegistro: Boolean;
begin
  sEmail := RetornarEmailConta_Email(IdUsuario);
  if Trim(sEmail) = '' then
    Exit;

  objStatus := TStatus.Create;
  try
    TemRegistro := objStatus.NotificarRevenda(IdStatus);
  finally
    FreeAndNil(objStatus);
  end;

  Qry := TFDQuery.Create(nil);
  try
    if TemRegistro then
    begin
      Qry.Connection := dm.Conexao;
      Qry.Close;
      Qry.SQL.Clear;
      Qry.SQL.Add(' SELECT');
      Qry.SQL.Add(' 	RevEm_Email');
      Qry.SQL.Add(' FROM Solicitacao');
      Qry.SQL.Add(' 	INNER JOIN Cliente On Sol_Cliente = Cli_Id');
      Qry.SQL.Add(' 	INNER JOIN Revenda ON Cli_Revenda = Rev_Id');
      Qry.SQL.Add(' 	INNER JOIN Revenda_Email ON Rev_id = RevEm_Revenda');
      Qry.SQL.Add(' WHERE Sol_Id = ' + IntToStr(IdSolicitacao));
      Qry.Open();

      while not Qry.Eof do
      begin
        Adicionar(Qry.Fields[0].AsString);
        Qry.Next;
      end;

    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TSolicitacaoEmail.RetornarEmailSupervisor(IdUsuario, IdStatus: Integer): string;
var
  sEmail: string;
  objStatus: TStatus;
  TemRegistro: Boolean;
  objDepartamento: TDepartamento;
  ListaEmail: TList<string>;
begin
  sEmail := RetornarEmailConta_Email(IdUsuario);
  if Trim(sEmail) = '' then  // se não tem conta email, nao faz nada
    Exit;

  objStatus := TStatus.Create;
  try
    TemRegistro := objStatus.NotificarSupervisor(IdStatus);
  finally
    FreeAndNil(objStatus);
  end;

  if TemRegistro then
  begin
    objDepartamento := TDepartamento.Create;
    try
      ListaEmail := objDepartamento.RetornarEmail(IdUsuario);
      for sEmail in ListaEmail do
        Adicionar(sEmail);
    finally
      FreeAndNil(objDepartamento);
      FreeAndNil(ListaEmail);
    end;
  end;
end;

end.
