unit uAgendamentoEmail;

interface

uses
  uDM, System.SysUtils, Data.DB, FireDAC.Comp.Client, uContaEmail,
  System.Generics.Collections;

type
  TAgendamentoEmail = class
  private
    FLista: TList<string>;
    FListaCliente: TList<string>;
    function RetornarEmailConta_Email(IdUsuario: integer): string;

    procedure RetornarEmailClientes(AIdAgenda, AIdUsuario: Integer);
    procedure RetornarEmailSupervisor(AIdUsuario, AIdStatus: Integer);
    procedure RetornarEmailConsultor(AIdAgenda, AIdUsuario, AIdStatus: Integer);
    procedure RetornarEmailRevenda(AIdAgenda, AIdUsuario, AIdStatus: Integer);

    function EmailExiste(AEmail: string): Boolean;
    procedure Adicionar(AEmail: string);
    procedure AdicionarCliente(AEmail: string);
  public
    function RetornaEmails(AIdAgenda, AIdUsuario, AIdStatus: integer): string;
    function RetornaEmailCliente(AIdAgenda, AIdUsuario: integer): string;
    constructor create;
    destructor destroy; override;
  end;

implementation

{ TVisitaEmail }

uses uStatus, uDepartamento, uFuncoesServidor;

procedure TAgendamentoEmail.Adicionar(AEmail: string);
begin
  if not TFuncoes.EmailExisteNaLista(AEmail, FLista) then
    FLista.Add(AEmail);
end;

procedure TAgendamentoEmail.AdicionarCliente(AEmail: string);
begin
  if not TFuncoes.EmailExisteNaLista(AEmail, FListaCliente) then
    FListaCliente.Add(AEmail);
end;

constructor TAgendamentoEmail.create;
begin
  inherited create;
  FListaCliente := TList<string>.Create;
  FLista := TList<string>.Create;
end;

destructor TAgendamentoEmail.destroy;
begin
  FreeAndNil(FLista);
  FreeAndNil(FListaCliente);
  inherited;
end;

function TAgendamentoEmail.EmailExiste(AEmail: string): Boolean;
begin
  Result := TFuncoes.EmailExisteNaLista(AEmail, FLista);
end;

function TAgendamentoEmail.RetornaEmailCliente(AIdAgenda, AIdUsuario: integer): string;
begin
  RetornarEmailClientes(AIdAgenda, AIdUsuario);
  Result := TFuncoes.RetornaListaEmail(FListaCliente);
end;

function TAgendamentoEmail.RetornaEmails(AIdAgenda, AIdUsuario,
  AIdStatus: integer): string;
begin
  RetornarEmailSupervisor(AIdUsuario, AIdStatus);
  RetornarEmailConsultor(AIdAgenda, AIdUsuario, AIdStatus);
  RetornarEmailRevenda(AIdAgenda, AIdUsuario, AIdStatus);

  Result := TFuncoes.RetornaListaEmail(FLista);
end;

procedure TAgendamentoEmail.RetornarEmailClientes(AIdAgenda, AIdUsuario: Integer);
var
  Qry: TFDQuery;
  sEmail: string;
  iContador: Integer;
  Status: TStatus;
  bNotificar: Boolean;
  idStatus: Integer;
begin
  sEmail := RetornarEmailConta_Email(AIdUsuario);
  if Trim(sEmail) = '' then // se não tem conta email, exit
    Exit;


  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dm.Conexao;

    Qry.SQL.Add(' SELECT');
    Qry.SQL.Add(' 	Sta_Id');
    Qry.SQL.Add(' FROM Agendamento');
    Qry.SQL.Add(' 	INNER JOIN Cliente_Email ON Age_Cliente = CliEm_Cliente');
    Qry.SQL.Add(' 	INNER JOIN Status ON Age_Status = Sta_Id');
    Qry.SQL.Add(' WHERE Sta_NotificarCliente = 1');
    Qry.SQL.Add(' AND Age_Id = ' + IntToStr(AIdAgenda));
    Qry.Open();

    if qry.FieldByName('Sta_Id').AsInteger = 0 then
      Exit;

    Qry.Close;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT');
    Qry.SQL.Add(' 	CliEm_Email');
    Qry.SQL.Add(' FROM Agendamento');
    Qry.SQL.Add(' 	INNER JOIN Cliente_Email ON Age_Cliente = CliEm_Cliente');
    Qry.SQL.Add(' 	INNER JOIN Status ON Age_Status = Sta_Id');
    Qry.SQL.Add(' WHERE Sta_NotificarCliente = 1');
    Qry.SQL.Add(' AND CliEm_Notificar = 1');
    Qry.SQL.Add(' AND Age_Id = ' + IntToStr(AIdAgenda));
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

procedure TAgendamentoEmail.RetornarEmailConsultor(AIdAgenda, AIdUsuario,
  AIdStatus: Integer);
var
  Qry: TFDQuery;
  sEmail: string;
  objStatus: TStatus;
  TemRegistro: Boolean;
begin

  sEmail := RetornarEmailConta_Email(AIdUsuario);
  if Trim(sEmail) = '' then
    Exit;

  objStatus := TStatus.Create;
  try
    TemRegistro := objStatus.NotificarConsultor(AIdStatus);
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
      Qry.SQL.Add(' FROM Agendamento');
      Qry.SQL.Add(' 	INNER JOIN Cliente ON Age_Cliente = Cli_Id');
      Qry.SQL.Add(' 	INNER JOIN Usuario ON Cli_Usuario = Usu_Id');
      Qry.SQL.Add(' WHERE Age_Id = ' + IntToStr(AIdAgenda));
      Qry.Open();

      if not Qry.IsEmpty then
        Adicionar(Qry.FieldByName('usu_Email').AsString);
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

function TAgendamentoEmail.RetornarEmailConta_Email(IdUsuario: integer): string;
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

procedure TAgendamentoEmail.RetornarEmailRevenda(AIdAgenda, AIdUsuario,
  AIdStatus: Integer);
var
  Qry: TFDQuery;
  sEmail: string;
  objStatus: TStatus;
  TemRegistro: Boolean;
begin
  sEmail := RetornarEmailConta_Email(AIdUsuario);
  if Trim(sEmail) = '' then
    Exit;

  objStatus := TStatus.Create;
  try
    TemRegistro := objStatus.NotificarRevenda(AIdStatus);
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
      Qry.SQL.Add(' FROM Agendamento');
      Qry.SQL.Add(' 	INNER JOIN Cliente On Age_Cliente = Cli_Id');
      Qry.SQL.Add(' 	INNER JOIN Revenda ON Cli_Revenda = Rev_Id');
      Qry.SQL.Add(' 	INNER JOIN Revenda_Email ON Rev_id = RevEm_Revenda');
      Qry.SQL.Add(' WHERE Age_Id = ' + IntToStr(AIdAgenda));
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

procedure TAgendamentoEmail.RetornarEmailSupervisor(AIdUsuario, AIdStatus: Integer);
var
  sEmail: string;
  objStatus: TStatus;
  TemRegistro: Boolean;
  objDepartamento: TDepartamento;
  ListaEmail: TList<string>;
begin
  sEmail := RetornarEmailConta_Email(AIdUsuario);
  if Trim(sEmail) = '' then  // se não tem conta email, nao faz nada
    Exit;

  objStatus := TStatus.Create;
  try
    TemRegistro := objStatus.NotificarSupervisor(AIdStatus);
  finally
    FreeAndNil(objStatus);
  end;

  if TemRegistro then
  begin
    objDepartamento := TDepartamento.Create;
    try
      ListaEmail := objDepartamento.RetornarEmail(AIdUsuario);

      for sEmail in ListaEmail do
        Adicionar(sEmail);

    finally
      FreeAndNil(objDepartamento);
      FreeAndNil(ListaEmail);
    end;
  end;
end;

end.
