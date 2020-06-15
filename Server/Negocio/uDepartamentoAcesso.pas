unit uDepartamentoAcesso;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface;

  const CConsulta: string =
    'SELECT Rev_Id, Rev_Codigo, Rev_Nome FROM Departamento_Acesso ';

type
  TDepartamentoAcesso = class(TInterfacedObject, ICadastroInterface)
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
  end;

implementation

{ TDepartamentoAcesso }

uses uUsuario;

function TDepartamentoAcesso.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TDepartamentoAcesso.Excluir(Programa, IdUsuario, Id: Integer);
begin
  DM.ExecutarSQL('DELETE FROM Departamento_Acesso WHERE DepAc_Id = ' + IntToStr(Id));
end;

function TDepartamentoAcesso.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean): string;
begin
  Result := '';
end;

function TDepartamentoAcesso.FiltrarCodigo(Codigo: integer): string;
begin
  Result := '';
end;

procedure TDepartamentoAcesso.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Codigo;
  Qry.Open();
end;

function TDepartamentoAcesso.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
//  Qry.Close;
//  Qry.Params[0].AsInteger := Id;
//  Qry.Open();
//
//  Result := (not Qry.IsEmpty);
end;

procedure TDepartamentoAcesso.Novo(Programa, IdUsuario: Integer);
begin
//
end;

function TDepartamentoAcesso.ProximoCodigo: Integer;
begin
  Result := 0;
end;

function TDepartamentoAcesso.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Departamento_Acesso'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TDepartamentoAcesso.Relatorio(Programa, IdUsuario: Integer);
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

procedure TDepartamentoAcesso.Salvar(Programa, IdUsuario: Integer);
begin
//
end;

end.
