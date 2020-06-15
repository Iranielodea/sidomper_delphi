unit uObservacao;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uObservacaoVO,
  uGenericDAO, uFireDAC;

  const CConsulta: string =
    'SELECT Obs_Id, Obs_Codigo, Obs_Descricao, Obs_Ativo, Obs_Nome, Obs_Programa FROM Observacao ';

  const CMENS_PADRAO: string = 'Já Existe uma Observação Padrão para este Programa!';
  const CMENS_EMAIL_PADRAO: string = 'Já Existe uma Observação de Email Padrão para este Programa!';
type
  TObservacao = class(TInterfacedObject, ICadastroInterface)
  private
    function RetornarNumerosDePadroes(APrograma, ATipo: Integer): Integer;
    procedure ValidaPadrao(AIdObservacao, APrograma, ATipo: Integer);
    procedure PersistePadrao(AObservacaoVO: TObservacaoVO);
    procedure PersisteEmailPadrao(AObservacaoVO: TObservacaoVO);
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarPrograma(Campo, Texto, Ativo: string; StatusPrograma: Integer; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: Integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarPadrao(var Qry: TFDQuery; APrograma: Integer);
    procedure LocalizarEmailPadrao(var Qry: TFDQuery; APrograma: Integer);
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer); overload;
    function Salvar(AObservacaoVO: TObservacaoVO; var AspObservacao: TFDStoredProc): Integer; overload;
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
  end;

implementation

{ TProduto }

uses uUsuario;

function TObservacao.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TObservacao.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
  obj: TFireDAC;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  obj := TFireDAC.create;
  try
    obj.ExecutarSQL('DELETE FROM Observacao WHERE Obs_Id = ' + IntToStr(Id));
  finally
    FreeAndNil(obj);
  end;
end;

function TObservacao.Filtrar(Campo, Texto, Ativo: string;
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
      sConsulta := sConsulta + ' AND Obs_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Obs_Ativo = 0';
  end;
//  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TObservacao.FiltrarCodigo(Codigo: Integer): string;
begin
  Result := CConsulta + ' WHERE Obs_Codigo = ' + Codigo.ToString();
end;

function TObservacao.FiltrarPrograma(Campo, Texto, Ativo: string;
  StatusPrograma: Integer; Contem: Boolean): string;
var
  sResult: string;
begin
  sResult := Filtrar(Campo, Texto, Ativo, Contem);

  if StatusPrograma > 0 then // Mostrar todos
    sResult := sResult + ' AND Obs_Programa = ' +  IntToStr(StatusPrograma);

  Result := sResult;

end;

procedure TObservacao.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT Obs_Id, Obs_Ativo FROM Observacao WHERE Obs_Codigo = ' + IntToStr(Codigo));

    if Codigo > 0 then
    begin
      if obj.Model.IsEmpty then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, obj.Model.FieldByName('Obs_Id').AsInteger);
      if obj.Model.FieldByName('Obs_Ativo').AsBoolean = False then
      begin
        LocalizarId(Qry, 0);
        raise Exception.Create(CRegistroInativo);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TObservacao.LocalizarEmailPadrao(var Qry: TFDQuery; APrograma: Integer);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add('SELECT Obs_Id FROM Observacao');
    obj.Lista.Add(' WHERE Obs_Programa = ' + APrograma.ToString());
    obj.Lista.Add(' AND Obs_EmailPadrao = 1');
    obj.Lista.Add(' AND Obs_Ativo = 1');
    obj.OpenSQL();

    LocalizarId(Qry, obj.Model.Fields[0].AsInteger);

  finally
    FreeAndNil(obj);
  end;
end;

function TObservacao.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TObservacao.LocalizarPadrao(var Qry: TFDQuery; APrograma: Integer);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add('SELECT Obs_Id FROM Observacao');
    obj.Lista.Add(' WHERE Obs_Programa = ' + APrograma.ToString());
    obj.Lista.Add(' AND Obs_Padrao = 1');
    obj.Lista.Add(' AND Obs_Ativo = 1');

    obj.OpenSQL();

    LocalizarId(Qry, obj.Model.Fields[0].AsInteger);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TObservacao.Novo(Programa, IdUsuario: Integer);
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

procedure TObservacao.PersisteEmailPadrao(AObservacaoVO: TObservacaoVO);
var
  iPadroes: Integer;
begin
  if AObservacaoVO.EmailPadrao then
  begin
    if AObservacaoVO.Id = 0 then
    begin
      iPadroes := RetornarNumerosDePadroes(AObservacaoVO.Programa, 2);
      if iPadroes > 0 then
        raise Exception.Create(CMENS_EMAIL_PADRAO);
    end
    else
      ValidaPadrao(AObservacaoVO.Id, AObservacaoVO.Programa, 2);
  end;
end;

procedure TObservacao.PersistePadrao(AObservacaoVO: TObservacaoVO);
var
  iPadroes: Integer;
begin
  if AObservacaoVO.Padrao then
  begin
    if AObservacaoVO.Id = 0 then
    begin
      iPadroes := RetornarNumerosDePadroes(AObservacaoVO.Programa, 1);
      if iPadroes > 0 then
        raise Exception.Create(CMENS_PADRAO);
    end
    else
      ValidaPadrao(AObservacaoVO.Id, AObservacaoVO.Programa, 1);
  end;
end;

function TObservacao.ProximoCodigo: Integer;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT MAX(Obs_Codigo) FROM Observacao');
    Result := obj.Model.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(obj);
  end;
end;

function TObservacao.ProximoId: Integer;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT IDENT_CURRENT(''Observacao'')');
    Result := obj.Model.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TObservacao.Relatorio(Programa, IdUsuario: Integer);
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

function TObservacao.RetornarNumerosDePadroes(APrograma, ATipo: Integer): Integer;
var
  obj: TFireDAC;
begin
{
  Parametro ATipo:
  1 - Obs_Padrao
  2 _ Obs_EmailPadrao
}
  obj := TFireDAC.create;
  try
    obj.Lista.Add('SELECT COUNT(Obs_Codigo) FROM Observacao ');
    obj.Lista.Add(' WHERE Obs_Programa = ' + IntToStr(APrograma));

    if ATipo = 1 then
      obj.Lista.Add(' AND Obs_Padrao = 1')
    else
      obj.Lista.Add(' AND Obs_EmailPadrao = 1');

    obj.OpenSQL();

    Result := obj.Model.Fields[0].AsInteger;

  finally
    FreeAndNil(obj);
  end;
end;

function TObservacao.Salvar(AObservacaoVO: TObservacaoVO; var AspObservacao: TFDStoredProc): Integer;
begin
  if AObservacaoVO.Nome.Trim = '' then
    raise Exception.Create('Informe o Nome da Observação!');

  if AObservacaoVO.Descricao.Trim = '' then
    raise Exception.Create('Informe a Descrição da Observação!');

  PersistePadrao(AObservacaoVO);
  PersisteEmailPadrao(AObservacaoVO);

  Result := TGenericDAO.Save<TObservacaoVO>(AObservacaoVO);

{TODO: Excluir procedimento do banco}
//  sIU := 'U';
//  if AObservacaoVO.Id = 0 then
//    sIU := 'I';
//  try
//    AspObservacao.Close;
//    AspObservacao.ParamByName('@IU').AsString          := sIU;
//    AspObservacao.ParamByName('@Id').AsInteger         := AObservacaoVO.Id;
//    AspObservacao.ParamByName('@Codigo').AsInteger     := AObservacaoVO.Codigo;
//    AspObservacao.ParamByName('@Descricao').AsMemo     := AObservacaoVO.Descricao;
//    AspObservacao.ParamByName('@Ativo').AsBoolean      := AObservacaoVO.Ativo;
//    AspObservacao.ParamByName('@Nome').AsString        := AObservacaoVO.Nome;
//    AspObservacao.ParamByName('@Padrao').AsBoolean     := AObservacaoVO.Padrao;
//    AspObservacao.ParamByName('@Programa').AsInteger   := AObservacaoVO.Programa;
//    AspObservacao.ExecProc();
//
//    Result := AspObservacao.ParamByName('@RetornoId').AsInteger;
//  except
//    On E: Exception do
//    begin
//      dm.Roolback();
//      raise Exception.Create(E.Message);
//    end;
//  end;
end;

procedure TObservacao.ValidaPadrao(AIdObservacao, APrograma, ATipo: Integer);
var
  iId: Integer;
  obj: TFireDAC;
begin
{
  Parametro ATipo:
  1 - Obs_Padrao
  2 _ Obs_EmailPadrao
}

   obj := TFireDAC.create;
  try
    obj.Lista.Add('SELECT Obs_Id FROM Observacao ');
    obj.Lista.Add(' WHERE Obs_Programa = ' + IntToStr(APrograma));

    if ATipo = 1 then
      obj.Lista.Add(' AND Obs_Padrao = 1')
    else
      obj.Lista.Add(' AND Obs_EmailPadrao = 1');
    obj.Lista.Add(' AND Obs_Id <> ' + IntToStr(AIdObservacao));

    obj.OpenSQL();

    iId := obj.Model.Fields[0].AsInteger;

  finally
    FreeAndNil(obj);
  end;

  if (iId > 0) and (ATipo = 1) then
    raise Exception.Create(CMENS_PADRAO);

  if (iId > 0) and (ATipo = 2) then
    raise Exception.Create(CMENS_EMAIL_PADRAO);

end;

procedure TObservacao.Salvar(Programa, IdUsuario: Integer);
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
