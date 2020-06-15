unit uProduto;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface;

  const CConsulta: string =
    'SELECT Prod_Id, Prod_Codigo, Prod_Nome, Prod_Ativo FROM Produto ';

type
  TProduto = class(TInterfacedObject, ICadastroInterface)
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: Integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
  end;

implementation

{ TProduto }

uses uUsuario;

function TProduto.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TProduto.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Produto WHERE Prod_Id = ' + IntToStr(Id));
end;

function TProduto.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;
  if Ativo <> 'T' then
  begin
    if Ativo = 'A' then
      sConsulta := sConsulta + ' AND Prod_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Prod_Ativo = 0';
  end;
  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TProduto.FiltrarCodigo(Codigo: Integer): string;
begin
  Result := CConsulta + ' WHERE Prod_Codigo = ' + Codigo.ToString();
end;

procedure TProduto.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Prod_Id, Prod_Ativo FROM Produto WHERE Prod_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Prod_Ativo').AsBoolean = False then
      begin
        LocalizarId(Qry, 0);
        raise Exception.Create(CRegistroInativo);
      end;
    end
    else
      LocalizarId(Qry, 0);
  finally
    FreeAndNil(lQry);
  end;
end;

function TProduto.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TProduto.Novo(Programa, IdUsuario: Integer);
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

function TProduto.ProximoCodigo: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT MAX(Prod_Codigo) FROM Produto';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

function TProduto.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Produto'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TProduto.Relatorio(Programa, IdUsuario: Integer);
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

procedure TProduto.Salvar(Programa, IdUsuario: Integer);
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
