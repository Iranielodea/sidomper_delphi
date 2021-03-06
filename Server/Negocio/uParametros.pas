unit uParametros;

interface
uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uFireDAC,
  uParametroVO, uGenericDAO, uExportarParametros, System.Generics.Collections;

  const CConsulta: string =
    'SELECT Par_Id, Par_Codigo, Par_Programa, Par_Nome, Par_Valor FROM Parametros ';

type
  TParametros = class(TInterfacedObject, ICadastroInterface)
  private

  public
    procedure Novo(Programa, IdUsuario: Integer);
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    function LocalizarParametro(Codigo, Programa: integer): string;
    procedure Salvar(Programa, IdUsuario: Integer); overload;
    procedure Salvar(AParametro: TParametroVO); overload;
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
    procedure AtualizarParametro(ACodigo, APrograma: Integer; AValor: string);

    function BuscarTempoImportacaoXML: Integer;
    function BuscarCaminhoImportacaoXML: string;
    function IncrementarSequencia(ACodigo: Integer): Integer;
    function ProximaSequencia(ACodigo: Integer): Integer;
    function StatusAberturaRecados: Integer;
    function StatusEncerramentoRecados: Integer;
    function AgendamentoCodigoCancelado(): string;
    function AgendamentoCodigoEncerrado(): string;
    function SolicitacaoStatusEncerramento(): Integer;
    function ListarParametros(): TObjectList<TParametroVO>;

    procedure BuscarTitulosQuadrosChamados(var Qry: TFDQuery);
    procedure AjustarIdsTabelas();
    procedure OrcamentoGravarDataUltimoEmail();
    function CaminhoAplicativoImportarLicencas(): string;
    function BuscarVersaoDesenvolvimento(): Integer;
    function CaminhoAnexos(): string;
    function RevendaPadrao(): string;
    procedure Exportar();
    procedure Importar();

    function VisitaTipoObrigatorio(ACodTipo: string): Boolean;
    function ValidarSIDomperCliente(ADataHora: string): Boolean;

  end;

implementation

{ TRevenda }

uses uUsuario;

function TParametros.AgendamentoCodigoCancelado: string;
begin
  Result := LocalizarParametro(34, 112);
end;

function TParametros.AgendamentoCodigoEncerrado: string;
begin
  Result := LocalizarParametro(36, 112);
end;

procedure TParametros.AjustarIdsTabelas;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    try
      lQry.Connection := DM.Conexao;
      lQry.SQL.Text := 'EXECUTE AjustarID';
      lQry.ExecSQL();
    except
      // nada
    end;
  finally
    FreeAndNil(lQry);
  end;
end;

function TParametros.VisitaTipoObrigatorio(ACodTipo: string): Boolean;
var
  sCodigo: string;
begin
  Result := False;
  sCodigo := LocalizarParametro(51,0);
  if StrToIntDef(sCodigo, 0) > 0 then
  begin
    if sCodigo = ACodTipo then
      Result := True;
  end;
end;

procedure TParametros.AtualizarParametro(ACodigo, APrograma: Integer;
  AValor: string);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add('UPDATE Parametros SET Par_Valor = ');
    obj.Lista.Add(AValor);
    obj.Lista.Add(' WHERE Par_Codigo = ' + IntToStr(ACodigo));
    if APrograma > 0 then
      obj.Lista.Add(' AND Par_Programa = ' + IntToStr(APrograma));
    obj.ExecutarSQL();
  finally
    FreeAndNil(obj);
  end;
end;

function TParametros.BuscarCaminhoImportacaoXML: string;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT PAR_VALOR FROM Parametros WHERE Par_Codigo = 1';
    lQry.Open();

    Result := lQry.Fields[0].AsString;
  finally
    FreeAndNil(lQry);
  end;
end;

function TParametros.BuscarTempoImportacaoXML: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT PAR_VALOR FROM Parametros WHERE Par_Codigo = 2';
    lQry.Open();

    Result := StrToIntDef(lQry.Fields[0].AsString,0);
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TParametros.BuscarTitulosQuadrosChamados(var Qry: TFDQuery);
begin
  Qry.Close;
  Qry.Open();

//  Qry.SQL.Clear;
//  Qry.SQL.Add('SELECT');
//  Qry.SQL.Add('	Par_Codigo,');
//  Qry.SQL.Add('	Sta_Codigo,');
//  Qry.SQL.Add('	Sta_Nome');
//  Qry.SQL.Add('FROM Parametros');
//  Qry.SQL.Add('	INNER JOIN Status ON Par_Valor = Sta_Codigo');
//  Qry.SQL.Add('	WHERE Par_Codigo IN (3,4,5,6,7,8)');
//  Qry.SQL.Add('	AND Par_Programa = 1');
//  Qry.Open();
end;


function TParametros.BuscarVersaoDesenvolvimento: Integer;
begin
  Result := StrToIntDef(LocalizarParametro(48,0), 0);
end;

function TParametros.CaminhoAnexos: string;
begin
  Result := LocalizarParametro(49,0);
end;

function TParametros.CaminhoAplicativoImportarLicencas: string;
begin
  Result := LocalizarParametro(47,0);
end;

function TParametros.ValidarSIDomperCliente(ADataHora: string): Boolean;
var
  sResultado: string;
  DataBanco, DataParam: TDate;
  HoraBanco, HoraParam: TTime;
  bDataValida: Boolean;
begin
  Result := True;
  try
    sResultado := LocalizarParametro(53, 0);
    DataBanco := StrToDate(Copy(sResultado, 1, 10));
    bDataValida := True;
  except
    bDataValida := False;
  end;

  if bDataValida = False then
  begin
    AtualizarParametro(53, 0, QuotedStr(ADataHora));
    Exit;
  end;

  try

    DataBanco := StrToDate(Copy(sResultado, 1, 10));
    HoraBanco := StrToTime(Trim(Copy(sResultado, 11, 15)));
    DataParam := StrToDate(Copy(ADataHora, 1, 10));
    HoraParam := StrToTime(Trim(Copy(ADataHora, 11, 15)));

    if DataParam > DataBanco then
    begin
      // gravar no banco
      AtualizarParametro(53, 0, QuotedStr(ADataHora));
      Result := True;
    end;

    if DataParam = DataBanco then
    begin
      if HoraParam > HoraBanco then
      begin
        // grava banco
        AtualizarParametro(53, 0, QuotedStr(ADataHora));
        Result := True;
        Exit;
      end;

      if HoraParam = HoraBanco then
      begin
        Result := True;
        Exit;
      end;

      if HoraParam < HoraBanco then
      begin
        Result := False;
        Exit;
      end;
    end;

    if DataParam < DataBanco then
      Result := False;
  except
    Result := True;
  end;
end;

function TParametros.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TParametros.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Parametros WHERE Par_Id = ' + IntToStr(Id));
end;

procedure TParametros.Exportar();
var
  Arq: TExportarParametros;
begin
  Arq := TExportarParametros.Create();
  try
    Arq.Exportar();
  finally
    FreeAndNil(Arq);
  end;
end;

function TParametros.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;
  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TParametros.FiltrarCodigo(Codigo: integer): string;
begin
  Result := CConsulta + ' WHERE Par_Codigo = ' + Codigo.ToString();
end;

procedure TParametros.Importar;
var
  Arq: TExportarParametros;
  lista: TObjectList<TParametroVO>;
  Item: TParametroVO;
begin
  Arq := TExportarParametros.Create();
  try
    lista := Arq.Importar();

    for Item in lista do
      Salvar(Item);

  finally
    FreeAndNil(Arq);
    FreeAndNil(lista);
  end;
end;

function TParametros.IncrementarSequencia(ACodigo: Integer): Integer;
var
  lQry: TFDQuery;
  id: Integer;
  IdResult: Integer;
begin
  IdResult := ProximaSequencia(ACodigo);
  id := IdResult;
  Inc(id);

  dm.ExecutarSQL('UPDATE Parametros SET Par_Valor = ' + QuotedStr(IntToStr(id))
    + ' WHERE Par_Codigo = ' + IntToStr(ACodigo));

  Result := IdResult;
end;

function TParametros.ListarParametros: TObjectList<TParametroVO>;
var
  obj: TFireDAC;
  model: TParametroVO;
  lista: TObjectList<TParametroVO>;
begin
  obj := TFireDAC.create;
  lista := TObjectList<TParametroVO>.Create();
  try
    obj.OpenSQL('SELECT * FROM Parametros');
    while not obj.Model.Eof do
    begin
      model := TParametroVO.Create;

      model.Id := obj.Model.FieldByName('Par_Id').AsInteger;
      model.Codigo := obj.Model.FieldByName('Par_Codigo').AsInteger;
      model.Programa := obj.Model.FieldByName('Par_Programa').AsInteger;
      model.Nome := obj.Model.FieldByName('Par_Nome').AsString;
      model.Valor := obj.Model.FieldByName('Par_Valor').AsString;
      model.Obs := obj.Model.FieldByName('Par_Obs').AsString;
      obj.Model.Next;
      lista.Add(model);
    end;
    Result := lista;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TParametros.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Par_Id FROM Parametros WHERE Par_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
    end
    else
      LocalizarId(Qry, 0);
  finally
    FreeAndNil(lQry);
  end;
end;

function TParametros.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

function TParametros.LocalizarParametro(Codigo, Programa: integer): string;
var
  Obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    Obj.Lista.Add('SELECT Par_Valor FROM Parametros WHERE Par_Codigo = ' + IntToStr(Codigo));
    if Programa > 0 then
      obj.Lista.Add(' AND Par_Programa = ' + IntToStr(Programa));
    Obj.OpenSQL();

    Result := Obj.Model.Fields[0].AsString;
  finally
    FreeAndNil(Obj);
  end;
end;

procedure TParametros.Novo(Programa, IdUsuario: Integer);
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

procedure TParametros.OrcamentoGravarDataUltimoEmail;
var
  obj: TFireDAC;
  sData: string;
begin
  obj := TFireDAC.create;
  try
    sData := FormatDateTime('dd/mm/yyyy', Now);
    obj.ExecutarSQL('UPDATE FROM Parametros SET Par_Valor = ' + QuotedStr(sData) + ' WHERE Par_Codigo = 38');
  finally
    FreeAndNil(obj);
  end;
end;

function TParametros.ProximaSequencia(ACodigo: Integer): Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Par_Valor FROM Parametros WHERE Par_Codigo = ' + IntToStr(ACodigo);
    lQry.Open();

    Result := lQry.Fields[0].AsInteger;
  finally
    FreeAndNil(lQry);
  end;
end;

function TParametros.ProximoCodigo: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT MAX(Par_Codigo) FROM Parametros';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

function TParametros.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Parametros'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TParametros.Relatorio(Programa, IdUsuario: Integer);
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

function TParametros.RevendaPadrao: string;
var
  iCodigo: Integer;
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    iCodigo := StrToIntDef(LocalizarParametro(50,0),0);
    if iCodigo > 0 then
    begin
      obj.Lista.Add(' SELECT');
      obj.Lista.Add('   Rev_Id');
      obj.Lista.Add(' FROM Revenda');
      obj.Lista.Add('   WHERE Rev_Codigo = ' + IntToStr(iCodigo));
      obj.OpenSQL();

      Result := obj.Model.Fields[0].AsString;
    end
    else
      Result := '0';
  finally
    FreeAndNil(obj);
  end;
end;

procedure TParametros.Salvar(Programa, IdUsuario: Integer);
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

procedure TParametros.Salvar(AParametro: TParametroVO);
begin
  TGenericDAO.Save<TParametroVO>(AParametro);
end;

function TParametros.SolicitacaoStatusEncerramento: Integer;
var
  sResult: string;
begin
  sResult := LocalizarParametro(46, 3);
  Result := StrToIntDef(sResult, 0);
end;

function TParametros.StatusAberturaRecados: Integer;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('   Sta_Id');
    obj.Lista.Add(' FROM Parametros');
    obj.Lista.Add('	  INNER JOIN Status ON Par_Valor = Sta_Codigo');
    obj.Lista.Add('   WHERE Par_Codigo = 43');
    obj.OpenSQL();

    Result := obj.Model.Fields[0].AsInteger;
  finally
    FreeAndNil(obj);
  end;
end;

function TParametros.StatusEncerramentoRecados: Integer;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('   Sta_Id');
    obj.Lista.Add(' FROM Parametros');
    obj.Lista.Add('	  INNER JOIN Status ON Par_Valor = Sta_Codigo');
    obj.Lista.Add('   WHERE Par_Codigo = 44');
    obj.OpenSQL();

    Result := obj.Model.Fields[0].AsInteger;
  finally
    FreeAndNil(obj);
  end;
end;

end.
