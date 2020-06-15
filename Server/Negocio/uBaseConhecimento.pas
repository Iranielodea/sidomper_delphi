unit uBaseConhecimento;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uUsuario,
  uFiltroBaseConhecimento, uFireDAC;

  const CConsulta: string =
    'SELECT'
  + '	  Bas_Id,'
  + '	  Bas_Data,'
  + '	  Bas_Nome,'
  + '	  Tip_Nome,'
  + '	  Sta_Nome,'
  + '   Usu_Nome'
  + ' FROM Base'
	+'  INNER JOIN Usuario ON Bas_Usuario = Usu_Id'
	+'  INNER JOIN Tipo ON Bas_Tipo = Tip_Id'
	+'  INNER JOIN Status ON Bas_Status = Sta_Id';

type
  TBaseConhecimento = class(TInterfacedObject, ICadastroInterface)
  private
    function DataIngles(Data: string): string;
  public
    procedure Novo(Programa, IdUsuario: Integer);
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarUsuario(Filtro: TFiltroBaseConhecimento; Campo, Texto: string;
        IdUsuario: Integer; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
    function UsuarioIgualCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;
  end;

implementation

{ TSolicitacao }


function TBaseConhecimento.DataIngles(Data: string): string;
begin
  try
    Result := QuotedStr(FormatDateTime('YYYY-MM-DD', StrToDate(Data)));
  except
    raise Exception.Create('Data Inválida.');
  end;
end;

function TBaseConhecimento.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TBaseConhecimento.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
  DM.ExecutarSQL('DELETE FROM Base WHERE Bas_Id = ' + IntToStr(Id));
end;

function TBaseConhecimento.Filtrar(Campo, Texto, Ativo: string; Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;
//  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TBaseConhecimento.FiltrarCodigo(Codigo: integer): string;
begin
  Result := CConsulta + ' WHERE Bas_Id = ' + Codigo.ToString();
end;

function TBaseConhecimento.FiltrarUsuario(Filtro: TFiltroBaseConhecimento;
    Campo, Texto: string; IdUsuario: Integer; Contem: Boolean = True): string;
var
  sConsulta: string;
  sTexto: string;
  ObjUsuario: TUsuario;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;

//  ObjUsuario := TUsuario.Create;
//  try
//    sConsulta := sConsulta +  ObjUsuario.RetornaPermissaoUsuarioDepartamento(IdUsuario);
//  finally
//    FreeAndNil(ObjUsuario);
//  end;

  if Trim(Filtro.DataInicial) <> DataEmBranco then
    sConsulta := sConsulta + ' AND Bas_Data >= ' + DataIngles(Filtro.DataInicial);

  if Trim(Filtro.DataFinal) <> DataEmBranco then
    sConsulta := sConsulta + ' AND Bas_Data <= ' + DataIngles(Filtro.DataFinal);

  if Filtro.IdTipo <> '' then
    sConsulta := sConsulta + ' AND Bas_Tipo IN' + Filtro.IdTipo;

  if Filtro.IdStatus <> '' then
    sConsulta := sConsulta + ' AND Bas_Status IN' + Filtro.IdStatus;

  if Filtro.IdUsuario <> '' then
    sConsulta := sConsulta + ' AND Bas_Usuario IN' + Filtro.IdUsuario;

  if Filtro.IdProduto <> '' then
    sConsulta := sConsulta + ' AND Bas_Produto IN' + Filtro.IdProduto;

  if Filtro.IdModulo <> '' then
    sConsulta := sConsulta + ' AND Bas_Modulo IN' + Filtro.IdModulo;

  Result := sConsulta;
end;

procedure TBaseConhecimento.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
begin
//
end;

function TBaseConhecimento.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TBaseConhecimento.Novo(Programa, IdUsuario: Integer);
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

function TBaseConhecimento.ProximoCodigo: Integer;
begin
  Result := 0;
end;

function TBaseConhecimento.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Base'')';
//    lQry.SQL.Text := 'SELECT SCOPE_IDENTITY()';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TBaseConhecimento.Relatorio(Programa, IdUsuario: Integer);
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

procedure TBaseConhecimento.Salvar(Programa, IdUsuario: Integer);
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

function TBaseConhecimento.UsuarioIgualCadastro(AId, AIdUsuario,
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
      obj.OpenSQL('SELECT Bas_Usuario FROM Base WHERE Bas_Id = ' + IntToStr(AId));
      Result  := (obj.Model.FieldByName('Bas_Usuario').AsInteger = AIdUsuario);
    finally
      FreeAndNil(obj);
    end;
  end;
end;

end.
