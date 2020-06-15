unit uRevenda;

interface

uses uDM, System.SysUtils, FireDAC.Stan.Param,
  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface;

  const CConsulta: string =
    'SELECT Rev_Id, Rev_Codigo, Rev_Ativo, Rev_Nome FROM Revenda ';

type
  TRevenda = class(TInterfacedObject, ICadastroInterface)
  private
    function SqlUsuario(IdUsuario: Integer): string;
  public
    procedure Novo(Programa, IdUsuario: Integer);
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string; overload;
    function Filtrar(Campo, Texto, Ativo: string; IdUsuario: Integer; Contem: Boolean = True): string; overload;
    function FiltrarCodigo(Codigo: Integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer); overload;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo, IdUsuario: integer; AMensagem: Boolean = True); overload;
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
  end;

implementation

{ TRevenda }

uses uUsuario;

function TRevenda.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TRevenda.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Revenda WHERE Rev_Id = ' + IntToStr(Id));
end;

function TRevenda.Filtrar(Campo, Texto, Ativo: string;
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
      sConsulta := sConsulta + ' AND Rev_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Rev_Ativo = 0';
  end;
  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TRevenda.Filtrar(Campo, Texto, Ativo: string; IdUsuario: Integer;
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
      sConsulta := sConsulta + ' AND Rev_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Rev_Ativo = 0';
  end;
  sConsulta := sConsulta + SqlUsuario(IdUsuario);

  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TRevenda.FiltrarCodigo(Codigo: Integer): string;
begin
  Result := CConsulta + ' WHERE Rev_Codigo = ' + Codigo.ToString();
end;

procedure TRevenda.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Rev_Id, Rev_Ativo FROM Revenda WHERE Rev_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Rev_Ativo').AsBoolean = False then
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

procedure TRevenda.LocalizarCodigo(var Qry: TFDQuery; Codigo,
  IdUsuario: integer; AMensagem: Boolean = True);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Rev_Id, Rev_Ativo FROM Revenda WHERE Rev_Codigo = ' + IntToStr(Codigo)
      + SqlUsuario(IdUsuario);

    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
      begin
        if AMensagem then
          raise Exception.Create(CRegistroNaoEncontrado);
      end;

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Rev_Ativo').AsBoolean = False then
      begin
        LocalizarId(Qry, 0);
        if AMensagem then
          raise Exception.Create(CRegistroInativo);
      end;
    end
    else
      LocalizarId(Qry, 0);
  finally
    FreeAndNil(lQry);
  end;
end;

function TRevenda.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TRevenda.Novo(Programa, IdUsuario: Integer);
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

function TRevenda.ProximoCodigo: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT MAX(Rev_Codigo) FROM Revenda';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

function TRevenda.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Revenda'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TRevenda.Relatorio(Programa, IdUsuario: Integer);
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

procedure TRevenda.Salvar(Programa, IdUsuario: Integer);
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

function TRevenda.SqlUsuario(IdUsuario: Integer): string;
var
  InstrucaoSQL: string;
begin
  InstrucaoSQL := '';
  InstrucaoSQL := InstrucaoSQL + ' AND EXISTS(';
  InstrucaoSQL := InstrucaoSQL + ' 		SELECT 1 FROM Usuario';
  InstrucaoSQL := InstrucaoSQL + ' 		WHERE ((Rev_Id = Usu_Revenda) OR (Usu_Revenda IS NULL))';
  InstrucaoSQL := InstrucaoSQL + ' 	AND Usu_Id = ' + IntToStr(IdUsuario) +')';
  Result := InstrucaoSQL;
end;

end.
