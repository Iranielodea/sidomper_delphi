unit uClienteEspecificacao;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, Vcl.Dialogs, uCadastroInterface;

type
  TClienteEspecificacao = class(TInterfacedObject, ICadastroInterface)
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    function FiltrarCodigo(Codigo: integer): string;
    procedure LocalizarCodigo(var Qry: TFDQuery; IdCliente: integer);
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
  end;

implementation

{ TClienteEspecificacao }

uses uUsuario;

function TClienteEspecificacao.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TClienteEspecificacao.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Cliente_Especificacao WHERE CliEsp_Id = ' + IntToStr(Id));
end;

function TClienteEspecificacao.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean): string;
begin
  Result := '';
end;

function TClienteEspecificacao.FiltrarCodigo(Codigo: integer): string;
begin
  Result := '';
end;

procedure TClienteEspecificacao.LocalizarCodigo(var Qry: TFDQuery; IdCliente: integer);
begin
  Qry.Close;
  Qry.Params[0].AsInteger := IdCliente;
  Qry.Open();
end;

function TClienteEspecificacao.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TClienteEspecificacao.Novo(Programa, IdUsuario: Integer);
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

function TClienteEspecificacao.ProximoCodigo: Integer;
begin
  Result := 0;
end;

function TClienteEspecificacao.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Cliente_Especificacao'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TClienteEspecificacao.Relatorio(Programa, IdUsuario: Integer);
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

procedure TClienteEspecificacao.Salvar(Programa, IdUsuario: Integer);
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
