unit uClienteModulo;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param, uClienteModuloVO,

  Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Dialogs, uCadastroInterface, uClienteVO,
  uGenericDAO;

  const CConsulta: string =
    'SELECT CliMod_Id FROM Cliente_Modulo';

type
  TClienteModulo = class(TInterfacedObject, ICadastroInterface)
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; IdCliente: integer);
    procedure Salvar(Programa, IdUsuario: Integer); overload;
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
    function LocalizarModuloProduto(IdCliente, IdModulo: integer): Integer;
    procedure ListarDoCliente(ACliente: TClienteVO);
    procedure Salvar(AClienteModulo: TClienteModuloVO); overload;

  end;

implementation

{ TClienteModulo }

uses uUsuario;

function TClienteModulo.Editar(Programa, IdUsuario: Integer): Boolean;
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoEditar(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
  Result := True;
end;

procedure TClienteModulo.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM ClienteModulo WHERE CliMod_Id = ' + IntToStr(Id));
end;

function TClienteModulo.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean): string;
begin
  Result := '';
end;

function TClienteModulo.FiltrarCodigo(Codigo: integer): string;
begin
  Result := '';
end;

procedure TClienteModulo.ListarDoCliente(ACliente: TClienteVO);
var
  Qry: TFDQuery;
  Obj: TClienteModuloVO;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dm.Conexao;
    Qry.SQL.Add(' SELECT');
    Qry.SQL.Add('   CliMod_Id,');
    Qry.SQL.Add('   CliMod_Modulo,');
    Qry.SQL.Add('   CliMod_Cliente,');
    Qry.SQL.Add('   CliMod_Produto,');
    Qry.SQL.Add('   Prod_Codigo,');
    Qry.SQL.Add('   Prod_Nome,');
    Qry.SQL.Add('   Mod_Codigo,');
    Qry.SQL.Add('   Mod_Nome');
    Qry.SQL.Add(' FROM Cliente_Modulo');
    Qry.SQL.Add(' INNER JOIN Produto ON CliMod_Produto = Prod_Id');
    Qry.SQL.Add(' INNER JOIN Modulo ON CliMod_Modulo = Mod_Id');

    Qry.SQL.Add(' WHERE CliMod_Cliente = ' + ACliente.Id.ToString());
    Qry.Open();

    while not Qry.Eof do
    begin
      Obj := TClienteModuloVO.Create;
      Obj.Id              := Qry.FieldByName('CliMod_Id').AsInteger;
      Obj.Produto.Id      := Qry.FieldByName('CliMod_Produto').AsInteger;
      Obj.Modulo.Id       := Qry.FieldByName('CliMod_Modulo').AsInteger;
      Obj.IdCliente       := Qry.FieldByName('CliMod_Cliente').AsInteger;
      Obj.Produto.Codigo  := Qry.FieldByName('Prod_Codigo').AsInteger;
      Obj.Produto.Nome    := Qry.FieldByName('Prod_Nome').AsString;
      Obj.Modulo.Codigo   := Qry.FieldByName('Mod_Codigo').AsInteger;
      Obj.Modulo.Nome     := Qry.FieldByName('Mod_Nome').AsString;

      ACliente.ClienteModulo.Add(Obj);
      Qry.Next;
    end;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TClienteModulo.LocalizarCodigo(var Qry: TFDQuery; IdCliente: integer);
begin
  Qry.Close;
  Qry.Params[0].AsInteger := IdCliente;
  Qry.Open();
end;

function TClienteModulo.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

function TClienteModulo.LocalizarModuloProduto(IdCliente, IdModulo: integer):
  Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Add(' SELECT TOP 1');
	  lQry.SQL.Add('  CliMod_Id');
    lQry.SQL.Add(' FROM Cliente_Modulo');
	  lQry.SQL.Add('    INNER JOIN Produto ON CliMod_Produto = Prod_Id ');
    lQry.SQL.Add(' WHERE CliMod_Cliente = :IdCliente');
    lQry.SQL.Add('AND CliMod_Modulo = :IdModulo');

//    lQry.Prepared := True;
    lQry.ParamByName('IdCliente').AsInteger := IdCliente;
    lQry.ParamByName('IdModulo').AsInteger := IdModulo;

    lQry.Open();

    Result := lQry.Fields[0].AsInteger;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TClienteModulo.Novo(Programa, IdUsuario: Integer);
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

function TClienteModulo.ProximoCodigo: Integer;
begin
  Result := 0;
end;

function TClienteModulo.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Cliente_Modulo'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TClienteModulo.Relatorio(Programa, IdUsuario: Integer);
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

procedure TClienteModulo.Salvar(AClienteModulo: TClienteModuloVO);
begin
  if (AClienteModulo.IdModulo = 0) and (AClienteModulo.IdProduto = 0) then
    raise Exception.Create('Informe o Produto ou Módulo!');

  TGenericDAO.Save<TClienteModuloVO>(AClienteModulo);
end;

procedure TClienteModulo.Salvar(Programa, IdUsuario: Integer);
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
