unit uProspect;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uFiltroCliente,
  uProspectVO, System.Variants, uFiltroProspect, uProspectEmailVO;

  const CConsulta: string =
    ' SELECT '+
    '  Pros_Id, '+
    '  Pros_Codigo,'+
    '  Pros_Nome,'+
    '  Pros_Fantasia,'+
    '  Pros_Docto,'+
    '  Pros_Telefone,'+
    '  Pros_Ativo,'+
    '  CASE Pros_Enquadramento'+
    '    WHEN ''00'' THEN ''00-Não Definido''' +
    '    WHEN ''01'' THEN ''01-Simples''' +
    '    WHEN ''02'' THEN ''02-Lucro Presumido'''+
    '    WHEN ''03'' THEN ''03-Lucro Real'''+
    '  END AS Pros_Enquadramento,'+
    '  Usu_Nome,'+
    '  Rev_Nome '+
    ' FROM Prospect'+
    '  LEFT JOIN Usuario ON Pros_Usuario = Usu_Id'+
    '  LEFT JOIN Revenda ON Pros_Revenda = Rev_Id';

type
  TProspect = class(TInterfacedObject, ICadastroInterface)
  private
    function RetornaPermissaoUsuarioDepartamento(AIdUsuario: Integer): string;
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string; overload;
    function FiltrarCodigo(Codigo: integer): string;
    function FiltrarUsuario(Filtro: TFiltroProspect; Campo, Texto, Ativo: string; IdUsuario: Integer; Contem: Boolean = True): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    procedure LocalizarCodigoProspect(var Qry: TFDQuery; Codigo, IdUsuario: integer);
    procedure Salvar(Programa, IdUsuario: Integer); overload;
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
    function Salvar(AIdUsuario: Integer; AProspectVO: TProspectVO;
      var AStoredProcedure: TFDStoredProc): Integer; overload;
//------------------------------------------------------------------------------
// Email
//------------------------------------------------------------------------------
    procedure NovoEmail(Programa, IdUsuario: Integer);
    function EditarEmail(Programa, IdUsuario: Integer): Boolean;
    procedure ExcluirEmail(APrograma, AIdUsuario, AId: Integer);
    procedure LocalizarCodigoEmail(var Qry: TFDQuery; Codigo: integer);
  end;

implementation

{ TProspect }

uses uUsuario, uFuncoesServidor, uClassValidacao;

function TProspect.Editar(Programa, IdUsuario: Integer): Boolean;
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

function TProspect.EditarEmail(Programa, IdUsuario: Integer): Boolean;
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

procedure TProspect.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Prospect WHERE Pros_Id = ' + IntToStr(Id));
end;

procedure TProspect.ExcluirEmail(APrograma, AIdUsuario, AId: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(APrograma, AIdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Prospect_Email WHERE ProsEm_Id = ' + IntToStr(AId));
end;

function TProspect.Filtrar(Campo, Texto, Ativo: string; Contem: Boolean): string;
begin
  Result := '';
end;

function TProspect.FiltrarCodigo(Codigo: integer): string;
begin
  Result := CConsulta + ' WHERE Pros_Codigo = ' + Codigo.ToString();
end;

function TProspect.FiltrarUsuario(Filtro: TFiltroProspect; Campo, Texto, Ativo: string; IdUsuario: Integer;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
  Usuario: TUsuario;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  Usuario := TUsuario.Create;
  try
    sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;

    if Ativo <> 'T' then
    begin
      if Ativo = 'A' then
        sConsulta := sConsulta + ' AND Pros_Ativo = 1'
      else
        sConsulta := sConsulta + ' AND Pros_Ativo = 0';
    end;

    sConsulta := sConsulta + RetornaPermissaoUsuarioDepartamento(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;

  if Filtro.IdUsuario <> '' then
    sConsulta := sConsulta + ' AND Pros_Usuario IN' + Filtro.IdUsuario;

  if Filtro.IdRevenda <> '' then
    sConsulta := sConsulta + ' AND Pros_Revenda IN' + Filtro.IdRevenda;

  if Filtro.Id <> '' then
    sConsulta := sConsulta + ' AND Pros_Id IN ' + Filtro.Id;

  if Filtro.Enquadramento <> '' then
    sConsulta := sConsulta + ' AND Pros_Enquadramento IN ' + Filtro.Enquadramento;

//  if Filtro.IdModulo <> '' then
//  begin
//    sConsulta := sConsulta + ' AND EXISTIS(SELECT 1 FROM Cliente_Modulo' +
//                             ' WHERE Cli_Id = CliMod_Cliente' +
//                             ' AND CliMod_Modulo IN ' + Filtro.IdModulo + ')';
//  end;

//  if Filtro.IdProduto <> '' then
//  begin
//    sConsulta := sConsulta + ' AND EXISTIS(SELECT 1 FROM Cliente_Modulo' +
//                             ' WHERE Cli_Id = CliMod_Cliente' +
//                             ' AND CliMod_Produto IN ' + Filtro.IdProduto + ')';
//  end;

//  ShowMessage(sConsulta);
  Result := sConsulta;
end;

procedure TProspect.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Pros_Id, Pros_Ativo FROM Prospect WHERE Pros_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Pros_Ativo').AsBoolean = False then
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

procedure TProspect.LocalizarCodigoEmail(var Qry: TFDQuery; Codigo: integer);
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Codigo;
end;

procedure TProspect.LocalizarCodigoProspect(var Qry: TFDQuery; Codigo,
  IdUsuario: integer);
var
  lQry: TFDQuery;
  sConsulta: string;
begin
  sConsulta := 'SELECT Pros_Id, Pros_Ativo FROM Prospect WHERE Pros_Codigo = ' + IntToStr(Codigo);
  sConsulta := sConsulta + RetornaPermissaoUsuarioDepartamento(IdUsuario);
//  sConsulta := sConsulta + ' AND EXISTS(';
//	sConsulta := sConsulta + ' 	  SELECT 1 FROM Usuario WHERE ((Pros_Revenda = Usu_Revenda) OR (Usu_Revenda IS NULL))';
//	sConsulta := sConsulta + ' 	  AND Usu_Id = ' + IntToStr(IdUsuario);
//	sConsulta := sConsulta + ' )';

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := sConsulta;
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Pros_Ativo').AsBoolean = False then
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

function TProspect.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TProspect.Novo(Programa, IdUsuario: Integer);
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

procedure TProspect.NovoEmail(Programa, IdUsuario: Integer);
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

function TProspect.ProximoCodigo: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT MAX(Pros_Codigo) FROM Prospect';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

function TProspect.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Prospect'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TProspect.Relatorio(Programa, IdUsuario: Integer);
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

function TProspect.RetornaPermissaoUsuarioDepartamento(
  AIdUsuario: Integer): string;
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  try
    sb.AppendLine(' AND EXISTS(');
    sb.AppendLine(' 	SELECT 1 FROM Usuario WHERE ((Pros_Revenda = Usu_Revenda) OR (Usu_Revenda IS NULL))');
    sb.AppendLine(' 	AND Usu_Id = ' + IntToStr(AIdUsuario) + ')');

//    sb.AppendLine(' AND EXISTS(');
//    sb.AppendLine(' 	SELECT 1 FROM Usuario WHERE ((Pros_Id = Usu_Cliente) OR (Usu_Cliente IS NULL))');
//    sb.AppendLine(' 	AND Usu_Id = ' + IntToStr(AIdUsuario) + ')');
    Result := sb.ToString();
  finally
    FreeAndNil(sb);
  end;
end;

function TProspect.Salvar(AIdUsuario: Integer; AProspectVO: TProspectVO;
  var AStoredProcedure: TFDStoredProc): Integer;
var
  sIU: string;
  sTexto: string;
begin
  if AProspectVO.Nome.Trim = '' then
    raise Exception.Create('Informe o Nome!');

  if AProspectVO.Docto.Length < 11 then
    raise Exception.Create('Informe o CNPJ/CPF!');

  if AProspectVO.IdUsuario = 0 then
    raise Exception.Create('Informe o Usuário!');

  if AProspectVO.IdRevenda = 0 then
    raise Exception.Create('Informe a Revenda!');

  sTexto := TFuncoes.SomenteNumeros(AProspectVO.Docto);

  if sTexto <> '' then
  begin
    if Length(sTexto) > 11 then
      TValidacao.ValidaCNPJ(sTexto)
    else
      TValidacao.ValidaCPF(sTexto);
  end;


  sIU := 'U';
  if AProspectVO.Id = 0 then
    sIU := 'I';

  AStoredProcedure.Close;
  AStoredProcedure.ParamByName('@IU').AsString          := sIU;
  AStoredProcedure.ParamByName('@Id').AsInteger         := AProspectVO.Id;
  AStoredProcedure.ParamByName('@Codigo').AsInteger     := AProspectVO.Codigo;
  AStoredProcedure.ParamByName('@Nome').AsString        := AProspectVO.Nome;
  AStoredProcedure.ParamByName('@Fantasia').AsString    := AProspectVO.Fantasia;
  AStoredProcedure.ParamByName('@Docto').AsString       := AProspectVO.Docto;
  AStoredProcedure.ParamByName('@Enquadramento').AsString := AProspectVO.Enquadramento;
  AStoredProcedure.ParamByName('@Endereco').AsString    := AProspectVO.Endereco;
  AStoredProcedure.ParamByName('@Telefone').AsString    := AProspectVO.Telefone;
  AStoredProcedure.ParamByName('@Contato').AsString     := AProspectVO.Contato;
  AStoredProcedure.ParamByName('@IdUsuario').AsInteger  := AProspectVO.IdUsuario;
  AStoredProcedure.ParamByName('@IdRevenda').AsInteger  := AProspectVO.IdRevenda;
  AStoredProcedure.ParamByName('@Ativo').AsBoolean      := AProspectVO.Ativo;

  if AProspectVO.Id > 0 then
    AStoredProcedure.ParamByName('@Id').AsInteger := AProspectVO.Id
  else
    AStoredProcedure.ParamByName('@Id').Value := null;

  if AProspectVO.Id > 0 then
    AStoredProcedure.ParamByName('@Id').AsInteger := AProspectVO.Id
  else
    AStoredProcedure.ParamByName('@Id').Value := null;

  AStoredProcedure.ExecProc;

  Result := AStoredProcedure.ParamByName('@RetornoId').AsInteger;

  AStoredProcedure.Close;
end;

procedure TProspect.Salvar(Programa, IdUsuario: Integer);
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
