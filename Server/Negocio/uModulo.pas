unit uModulo;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface;

  const CConsulta: string =
    'SELECT Mod_Id, Mod_Codigo, Mod_Nome, Mod_Ativo FROM Modulo ';

type
  TModulo = class(TInterfacedObject, ICadastroInterface)
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarCliente(IdCliente: Integer; Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: Integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    procedure LocalizarClienteCodigo(var Qry: TFDQuery; IdCliente, Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
  end;

implementation

{ TModulo }

uses uUsuario;

function TModulo.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TModulo.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Modulo WHERE Mod_Id = ' + IntToStr(Id));
end;

function TModulo.Filtrar(Campo, Texto, Ativo: string;
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
      sConsulta := sConsulta + ' AND Mod_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Mod_Ativo = 0';
  end;
  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TModulo.FiltrarCliente(IdCliente: Integer; Campo, Texto, Ativo: string;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' INNER JOIN Cliente_Modulo ON CliMod_Modulo = Mod_Id';
  sConsulta := sConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;
  sConsulta := sConsulta + ' AND CliMod_Cliente = ' + IntToStr(IdCliente);

  if Ativo <> 'T' then
  begin
    if Ativo = 'A' then
      sConsulta := sConsulta + ' AND Mod_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Mod_Ativo = 0';
  end;
  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TModulo.FiltrarCodigo(Codigo: Integer): string;
begin
  Result := CConsulta + ' WHERE Mod_Codigo = ' + Codigo.ToString();
end;

procedure TModulo.LocalizarClienteCodigo(var Qry: TFDQuery; IdCliente,
  Codigo: integer);
var
  lQry: TFDQuery;
  InstrucaoSQL: string;
begin
  InstrucaoSQL := 'SELECT Mod_Id, Mod_Ativo FROM Modulo ';
  InstrucaoSQL := InstrucaoSQL + ' INNER JOIN Cliente_Modulo ON CliMod_Modulo = Mod_Id';
  InstrucaoSQL := InstrucaoSQL + ' WHERE CliMod_Cliente = ' + IntToStr(IdCliente);
  InstrucaoSQL := InstrucaoSQL + ' AND Mod_Codigo = ' + IntToStr(Codigo);

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := InstrucaoSQL;

    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Mod_Ativo').AsBoolean = False then
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

procedure TModulo.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Mod_Id, Mod_Ativo FROM Modulo WHERE Mod_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Mod_Ativo').AsBoolean = False then
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

function TModulo.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TModulo.Novo(Programa, IdUsuario: Integer);
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

function TModulo.ProximoCodigo: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT MAX(Mod_Codigo) FROM Modulo';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

function TModulo.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Modulo'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TModulo.Relatorio(Programa, IdUsuario: Integer);
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

procedure TModulo.Salvar(Programa, IdUsuario: Integer);
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
