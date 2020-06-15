unit uVisitaEmail;

interface

uses
  uDM, System.SysUtils, Data.DB, FireDAC.Comp.Client, uContaEmail,
  System.Generics.Collections;

type
  TVisitaEmail = class
  private
    FLista: TList<string>;
    FListaCliente: TList<string>;
    function RetornarEmailConta_Email(IdUsuario: integer): string;

    procedure RetornarEmailClientes(IdVisita, IdUsuario: Integer);
    procedure RetornarEmailSupervisor(IdUsuario, IdStatus: Integer);
    procedure RetornarEmailConsultor(IdVisita, IdUsuario, IdStatus: Integer);
    procedure RetornarEmailRevenda(IdVisita, IdUsuario, IdStatus: Integer);

    function EmailExiste(email: string): Boolean;
    procedure Adicionar(email: string);
    procedure AdicionarCliente(email: string);
  public
    function RetornaEmails(IdVisita, IdUsuario, IdStatus: integer): string;
    function RetornaEmailCliente(IdVisita, IdUsuario: integer): string;
    constructor create;
    destructor destroy; override;
  end;

implementation

{ TVisitaEmail }

uses uStatus, uDepartamento, uFuncoesServidor;

procedure TVisitaEmail.Adicionar(email: string);
begin
  if not TFuncoes.EmailExisteNaLista(email, FLista) then
    FLista.Add(email);
end;

procedure TVisitaEmail.AdicionarCliente(email: string);
begin
  if not TFuncoes.EmailExisteNaLista(email, FListaCliente) then
    FListaCliente.Add(email);
end;

constructor TVisitaEmail.create;
begin
  inherited create;
  FListaCliente := TList<string>.Create;
  FLista := TList<string>.Create;
end;

destructor TVisitaEmail.destroy;
begin
  FreeAndNil(FLista);
  FreeAndNil(FListaCliente);
  inherited;
end;

function TVisitaEmail.EmailExiste(email: string): Boolean;
begin
  Result := TFuncoes.EmailExisteNaLista(email, FLista);
end;

function TVisitaEmail.RetornaEmailCliente(IdVisita, IdUsuario: integer): string;
begin
  RetornarEmailClientes(IdVisita, IdUsuario);
  Result := TFuncoes.RetornaListaEmail(FListaCliente);
end;

function TVisitaEmail.RetornaEmails(IdVisita, IdUsuario,
  IdStatus: integer): string;
begin
  RetornarEmailSupervisor(IdUsuario, IdStatus);
  RetornarEmailConsultor(IdVisita, IdUsuario, IdStatus);
  RetornarEmailRevenda(IdVisita, IdUsuario, IdStatus);

  Result := TFuncoes.RetornaListaEmail(FLista);
end;

procedure TVisitaEmail.RetornarEmailClientes(IdVisita, IdUsuario: Integer);
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
    Qry.SQL.Add(' FROM Visita');
    Qry.SQL.Add(' 	INNER JOIN Cliente_Email ON Vis_Cliente = CliEm_Cliente');
    Qry.SQL.Add(' 	INNER JOIN Status ON Vis_Status = Sta_Id');
    Qry.SQL.Add(' WHERE Sta_NotificarCliente = 1');
    Qry.SQL.Add(' AND Vis_Id = ' + IntToStr(IdVisita));
    Qry.Open();

    if qry.FieldByName('Sta_Id').AsInteger = 0 then
      Exit;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT');
    Qry.SQL.Add(' 	CliEm_Email');
    Qry.SQL.Add(' FROM Visita');
    Qry.SQL.Add(' 	INNER JOIN Cliente_Email ON Vis_Cliente = CliEm_Cliente');
    Qry.SQL.Add(' 	INNER JOIN Status ON Vis_Status = Sta_Id');
    Qry.SQL.Add(' WHERE Sta_NotificarCliente = 1');
    Qry.SQL.Add(' AND CliEm_Notificar = 1');
    Qry.SQL.Add(' AND Vis_Id = ' + IntToStr(IdVisita));
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

procedure TVisitaEmail.RetornarEmailConsultor(IdVisita, IdUsuario,
  IdStatus: Integer);
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
      Qry.SQL.Add(' SELECT');
      Qry.SQL.Add(' 	Usu_Email');
      Qry.SQL.Add(' FROM Visita');
      Qry.SQL.Add(' 	INNER JOIN Cliente ON Vis_Cliente = Cli_Id');
      Qry.SQL.Add(' 	INNER JOIN Usuario ON Cli_Usuario = Usu_Id');
      Qry.SQL.Add(' WHERE Vis_Id = ' + IntToStr(IdVisita));
      Qry.Open();

      if not Qry.IsEmpty then
        Adicionar(Qry.FieldByName('usu_Email').AsString);
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TVisitaEmail.RetornarEmailConta_Email(IdUsuario: integer): string;
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

procedure TVisitaEmail.RetornarEmailRevenda(IdVisita, IdUsuario,
  IdStatus: Integer);
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
      Qry.SQL.Add(' FROM Visita');
      Qry.SQL.Add(' 	INNER JOIN Cliente On Vis_Cliente = Cli_Id');
      Qry.SQL.Add(' 	INNER JOIN Revenda ON Cli_Revenda = Rev_Id');
      Qry.SQL.Add(' 	INNER JOIN Revenda_Email ON Rev_id = RevEm_Revenda');
      Qry.SQL.Add(' WHERE Vis_Id = ' + IntToStr(IdVisita));
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

procedure TVisitaEmail.RetornarEmailSupervisor(IdUsuario, IdStatus: Integer);
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
