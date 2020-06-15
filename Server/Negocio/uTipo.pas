unit uTipo;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uTipoVO,
  uFireDAC, uGenericDAO, uExportarTipos, System.Generics.Collections;

  const CConsulta: string =
    ' SELECT'
    +'	Tip_Codigo,'
    +'	Tip_Id,'
    +'	Tip_Nome,'
    +'  Tip_Ativo,'
    +'	Tip_Programa,'
    +'	CASE Tip_Programa'
    +'		WHEN 1 THEN ''1-Chamado'''
    +'		WHEN 2 THEN ''2-Visita'''
    +'		WHEN 3 THEN ''3-Solicitação'''
    +'		WHEN 4 THEN ''4-Versão'''
    +'		WHEN 5 THEN ''5-Qualidade'''
    +'		WHEN 6 THEN ''6-Base de Conhecimento'''
    +'		WHEN 7 THEN ''7-Atividade'''
    +'		WHEN 8 THEN ''8-Agendamento'''
    +'		WHEN 9 THEN ''9-Orçamento'''
    +'		WHEN 11 THEN ''11-Tabela de Preços'''
    +'	END	AS TipoDescricao'
    +' FROM Tipo';

type
  TTipo = class(TInterfacedObject, ICadastroInterface)
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarPrograma(Campo, Texto, Ativo: string; TipoPrograma: Integer; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: Integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    function LocalizarPorId(AId: Integer): TTipoVO;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer); overload;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo, TipoPrograma: integer); overload;
    procedure Salvar(Programa, IdUsuario: Integer); overload;
    function Salvar(ATipo: TTipoVO): Integer; overload;
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
    function RetornoUmRegistro(APrograma: Integer): TTipoVO;
    procedure Exportar();
    procedure Importar();
  end;

implementation

{ TTipo }

uses uUsuario;

function TTipo.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TTipo.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Tipo WHERE Tip_Id = ' + IntToStr(Id));
end;

procedure TTipo.Exportar;
var
  obj: TExportarTipo;
begin
  obj := TExportarTipo.Create;
  try
    obj.Exportar();
  finally
    FreeAndNil(obj);
  end;
end;

function TTipo.Filtrar(Campo, Texto, Ativo: string;
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
      sConsulta := sConsulta + ' AND Tip_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Tip_Ativo = 0';
  end;
//  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TTipo.FiltrarCodigo(Codigo: Integer): string;
begin
  Result := CConsulta + ' WHERE Tip_Codigo = ' + Codigo.ToString();
end;

function TTipo.FiltrarPrograma(Campo, Texto, Ativo: string;
  TipoPrograma: Integer; Contem: Boolean): string;
var
  sResult: string;
begin
  sResult := Filtrar(Campo, Texto, Ativo, Contem);

  if TipoPrograma > 0 then // Mostrar todos
    sResult := sResult + ' AND Tip_Programa = ' +  IntToStr(TipoPrograma);

  sResult := sResult + ' ORDER BY ' + Campo;
  Result := sResult;
end;

procedure TTipo.Importar;
var
  Arq: TExportarTipo;
  lista: TObjectList<TTipoVO>;
  Item: TTipoVO;
begin
  Arq := TExportarTipo.Create();
  try
    lista := Arq.Importar();

    for Item in lista do
      Salvar(Item);

  finally
    FreeAndNil(Arq);
    FreeAndNil(lista);
  end;
end;

procedure TTipo.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Tip_Id, Tip_Ativo FROM Tipo WHERE Tip_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Tip_Ativo').AsBoolean = False then
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

procedure TTipo.LocalizarCodigo(var Qry: TFDQuery; Codigo,
  TipoPrograma: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Add('SELECT Tip_Id, Tip_Ativo FROM Tipo WHERE Tip_Codigo = ' + IntToStr(Codigo));
    if TipoPrograma > 0 then
      lQry.SQL.Add(' AND Tip_Programa = ' + IntToStr(TipoPrograma));

    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Tip_Ativo').AsBoolean = False then
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

function TTipo.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

function TTipo.LocalizarPorId(AId: Integer): TTipoVO;
var
  obj: TFireDAC;
  Model: TTipoVO;
begin
  obj := TFireDAC.create;
  Model := TTipoVO.Create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add(' Tip_Id, Tip_Codigo, Tip_Nome');
    obj.Lista.Add(' FROM Tipo');
    obj.Lista.Add(' WHERE Tip_Id = ' + IntToStr(AId));
    obj.Lista.Add(' AND Tip_Ativo = 1');

    obj.OpenSQL();

    Model.Id := obj.Model.FieldByName('Tip_Id').AsInteger;
    Model.Codigo := obj.Model.FieldByName('Tip_Codigo').AsInteger;
    Model.Nome := obj.Model.FieldByName('Tip_Nome').AsString;
    Result := Model;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TTipo.Novo(Programa, IdUsuario: Integer);
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

function TTipo.ProximoCodigo: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT MAX(Tip_Codigo) FROM Tipo';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

function TTipo.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Tipo'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TTipo.Relatorio(Programa, IdUsuario: Integer);
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

function TTipo.RetornoUmRegistro(APrograma: Integer): TTipoVO;
var
  Model: TTipoVO;
  obj: TFireDAC;
begin
  Model := TTipoVO.Create;
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add(' Tip_Id, Tip_Codigo, Tip_Nome');
    obj.Lista.Add(' FROM Tipo');
    obj.Lista.Add(' WHERE Tip_Programa = ' + IntToStr(APrograma));
    obj.Lista.Add(' AND Tip_Ativo = 1');

    obj.OpenSQL();

    if obj.Model.RecordCount > 1 then
      Model.Id := 0
    else
      Model.Id := obj.Model.FieldByName('Tip_Id').AsInteger;

    Model.Codigo := obj.Model.FieldByName('Tip_Codigo').AsInteger;
    Model.Nome := obj.Model.FieldByName('Tip_Nome').AsString;

    Result := Model;
  finally
    FreeAndNil(obj);
  end;
end;

function TTipo.Salvar(ATipo: TTipoVO): Integer;
begin
  if ATipo.Codigo = 0 then
    raise Exception.Create('Informe o código!');

  if ATipo.Nome.Trim = '' then
    raise Exception.Create('Informe o Nome!');

  Result := TGenericDAO.Save<TTipoVO>(ATipo);

end;

procedure TTipo.Salvar(Programa, IdUsuario: Integer);
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
