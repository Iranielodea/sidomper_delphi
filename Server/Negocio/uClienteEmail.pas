unit uClienteEmail;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, Vcl.Dialogs, uCadastroInterface, uClienteVO, uClienteEmailVO,
  uGenericDAO, uFireDAC;

  const CConsulta: string =
    'SELECT CliEm_Id, CliEm_Email, Cli_Cliente, Cli_Notificar FROM ClienteEmail';

type
  TClienteEmail = class(TInterfacedObject, ICadastroInterface)
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer); overload;
    procedure Excluir(AId: Integer); overload;
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; IdCliente: integer);
    procedure Salvar(Programa, IdUsuario: Integer); overload;
    procedure Salvar(AClienteEmail: TClienteEmailVO); overload;
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;

    procedure ExcluirRegistrosCliente(IdCliente: Integer);
    procedure IncluirRegistro(IdCliente: Integer; Email: string);
    function LocalizarCliente(Codigo: integer): Integer;
    procedure ListarDoCliente(ACliente: TClienteVO);
  end;

implementation

{ TClienteEmail }

uses uUsuario;

function TClienteEmail.Editar(Programa, IdUsuario: Integer): Boolean;
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    Result := usuario.PermissaoEditar(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

procedure TClienteEmail.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Cliente_Email WHERE CliEm_Id = ' + IntToStr(Id));
end;

procedure TClienteEmail.Excluir(AId: Integer);
begin
  DM.ExecutarSQL('DELETE FROM Cliente_Email WHERE CliEm_Id = ' + IntToStr(AId));
end;

procedure TClienteEmail.ExcluirRegistrosCliente(IdCliente: Integer);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.ExecutarSQL('DELETE FROM Cliente_Email WHERE CliEm_Cliente = ' + IntToStr(IdCliente));
  finally
    FreeAndNil(obj);
  end;
end;

function TClienteEmail.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean): string;
begin
  Result := '';
end;

function TClienteEmail.FiltrarCodigo(Codigo: integer): string;
begin
  Result := '';
end;

procedure TClienteEmail.IncluirRegistro(IdCliente: Integer; Email: string);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Add('INSERT INTO Cliente_Email(CliEm_Cliente, CliEm_Email, CliEm_Notificar)');
    lQry.SQL.Add(' VALUES (');
    lQry.SQL.Add(' @IdCliente, @Email, @Notificar');

    lQry.Params.ParamByName('@IdCliente').AsInteger := IdCliente;
    lQry.Params.ParamByName('@Email').AsString := Email;
    lQry.Params.ParamByName('@Notificar').AsBoolean := True;

    lQry.ExecSQL();

  finally
    FreeAndNil(lQry);
  end;
end;

function TClienteEmail.LocalizarCliente(Codigo: integer): Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Cli_Id FROM Cliente WHERE Cli_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    Result := lQry.Fields[0].AsInteger;

  finally
    FreeAndNil(lQry);
  end;
end;

procedure TClienteEmail.LocalizarCodigo(var Qry: TFDQuery; IdCliente: integer);
begin
  Qry.Close;
  Qry.Params[0].AsInteger := IdCliente;
  Qry.Open();
end;

function TClienteEmail.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TClienteEmail.ListarDoCliente(ACliente: TClienteVO);
var
  Qry: TFDQuery;
  Email: TClienteEmailVO;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dm.Conexao;
    Qry.SQL.Add('SELECT CliEm_Id, CliEm_Cliente, CliEm_Email, CliEm_Notificar FROM Cliente_Email');
    Qry.SQL.Add(' WHERE CliEm_Cliente = ' + ACliente.Id.ToString());
    Qry.Open();

    while not Qry.Eof do
    begin
      Email := TClienteEmailVO.Create;
      Email.Id        := Qry.FieldByName('CliEm_Id').AsInteger;
      Email.IdCliente := Qry.FieldByName('CliEm_Cliente').AsInteger;
      Email.Email     := Qry.FieldByName('CliEm_Email').AsString;
      Email.Notificar := Qry.FieldByName('CliEm_Notificar').AsBoolean;
      ACliente.ClienteEmail.Add(Email);
      Qry.Next;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TClienteEmail.Novo(Programa, IdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoIncluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

function TClienteEmail.ProximoCodigo: Integer;
begin
  Result := 0;
end;

function TClienteEmail.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''ClienteEmail'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TClienteEmail.Relatorio(Programa, IdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoRelatorio(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

procedure TClienteEmail.Salvar(AClienteEmail: TClienteEmailVO);
begin
  if AClienteEmail.Email.Trim = '' then
    raise Exception.Create('Informe o Email!');

  TGenericDAO.Save<TClienteEmailVO>(AClienteEmail);
end;

procedure TClienteEmail.Salvar(Programa, IdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoEditar(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

end.
