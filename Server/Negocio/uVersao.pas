unit uVersao;

interface
uses uDM, System.SysUtils, FireDAC.Stan.Param, uFiltroVersao, uUsuario,

  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uFireDAC, uParametros;

  const CConsulta: string =
  ' SELECT'
	+'  Ver_DataInicio,'
	+'  Ver_DataLiberacao,'
	+'  Ver_Descricao,'
	+'  Ver_Id,'
  +'  Ver_Versao,'
	+'  Sta_Nome,'
	+'  Tip_Nome,'
	+'  Usu_Nome,'
  +'  Usu_Nome'
  +'  Usu_Nome'
  +' FROM Versao'
  +' 	INNER JOIN Status ON Ver_Status = Sta_Id'
  +' 	INNER JOIN Tipo ON Ver_Tipo = Tip_Id'
  +' 	INNER JOIN Usuario ON Ver_Usuario = Usu_Id';

type
  TVersao = class(TInterfacedObject, ICadastroInterface)
  private
    function DataIngles(Data: string): string;
  public
    procedure Novo(Programa, IdUsuario: Integer);
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarVersao(Filtro: TFiltroVersao; Campo, Texto: string;
        Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
    function LocalizarVersao(AVersao: string): Integer;
    function UsuarioIgualCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;

    function RetornarQtdeVersao(AIdVersao: integer): Integer;
    function BuscarVersaoDesenvolvimento(): Integer;
  end;

implementation

{ TRevenda }


function TVersao.BuscarVersaoDesenvolvimento: Integer;
var
  parametros: TParametros;
begin
  parametros := TParametros.Create;
  try
    Result := parametros.BuscarVersaoDesenvolvimento();
  finally
    FreeAndNil(parametros);
  end;
end;

function TVersao.DataIngles(Data: string): string;
begin
  try
    Result := QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Data)));
  except
    raise Exception.Create('Data Inv�lida.');
  end;
end;

function TVersao.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TVersao.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Versao WHERE Ver_Id = ' + IntToStr(Id));
end;

function TVersao.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;

  Result := sConsulta;
end;

function TVersao.FiltrarCodigo(Codigo: integer): string;
begin
  Result := CConsulta + ' WHERE Ver_Id = ' + Codigo.ToString();
end;

function TVersao.FiltrarVersao(Filtro: TFiltroVersao; Campo, Texto: string;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;

  if Trim(Filtro.DataInicial) <> DataEmBranco then
    sConsulta := sConsulta + ' AND Ver_DataInicio >= ' + DataIngles(Filtro.DataInicial);

  if Trim(Filtro.DataFinal) <> DataEmBranco then
    sConsulta := sConsulta + ' AND Ver_DataInicio <= ' + DataIngles(Filtro.DataFinal);

  if Trim(Filtro.DataLiberacaoInicial) <> DataEmBranco then
    sConsulta := sConsulta + ' AND Ver_DataLiberacao >= ' + DataIngles(Filtro.DataLiberacaoInicial);

  if Trim(Filtro.DataLiberacaoFinal) <> DataEmBranco then
    sConsulta := sConsulta + ' AND Ver_DataLiberacao <= ' + DataIngles(Filtro.DataLiberacaoFinal);

  if Filtro.IdTipo <> '' then
    sConsulta := sConsulta + ' AND Ver_Tipo IN' + Filtro.IdTipo;

  if Filtro.IdStatus <> '' then
    sConsulta := sConsulta + ' AND Ver_Status IN' + Filtro.IdStatus;

  if Filtro.IdUsuario <> '' then
    sConsulta := sConsulta + ' AND Ver_Usuario IN' + Filtro.IdUsuario;

  Result := sConsulta;
end;

procedure TVersao.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
begin
  //
end;

function TVersao.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

function TVersao.LocalizarVersao(AVersao: string): Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Ver_Id FROM Versao WHERE Ver_Versao = ' + QuotedStr(AVersao);
    lQry.Open();

    if lQry.Fields[0].IsNull then
      raise Exception.Create('Registro n�o Encontrado!');

    Result := lQry.Fields[0].AsInteger;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TVersao.Novo(Programa, IdUsuario: Integer);
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

function TVersao.ProximoCodigo: Integer;
begin
  Result := 0;
end;

function TVersao.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Versao'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TVersao.Relatorio(Programa, IdUsuario: Integer);
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

function TVersao.RetornarQtdeVersao(AIdVersao: integer): Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Add(' SELECT');
    lQry.SQL.Add('	COUNT(Sol_Id)');
    lQry.SQL.Add(' FROM Versao');
    lQry.SQL.Add('	INNER JOIN Solicitacao On Ver_Id = Sol_VersaoId');
    lQry.SQL.Add(' WHERE Ver_Id = ' + IntToStr(AIdVersao));
    lQry.Open();

    Result := lQry.Fields[0].AsInteger;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TVersao.Salvar(Programa, IdUsuario: Integer);
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

function TVersao.UsuarioIgualCadastro(AId, AIdUsuario,
  ATipoOperacao: Integer): Boolean;
var
  obj: TFireDAC;
begin
{
   ATipoOperacao = 2-Edicao 3-Exclusao
}
  Result := True;
  if (ATipoOperacao = 2) or (ATipoOperacao = 3) then
  begin
    obj := TFireDAC.create;
    try
      obj.OpenSQL('SELECT Ver_Usuario FROM VERSAO WHERE Ver_Id = ' + IntToStr(AId));
      Result  := (obj.Model.FieldByName('Ver_Usuario').AsInteger = AIdUsuario);
    finally
      FreeAndNil(obj);
    end;
  end;
end;

end.
