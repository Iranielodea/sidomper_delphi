unit uContaEmail;

interface
uses uDM, System.SysUtils, FireDAC.Stan.Param, uContaEmailVO,

  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uFireDAC;

  const CConsulta: string =
    'SELECT CtaEm_Id, CtaEm_Codigo, CtaEm_Ativo, CtaEm_Nome, CtaEm_Email FROM Conta_Email ';

type
  TContaEmail = class(TInterfacedObject, ICadastroInterface)
  public
    procedure Novo(Programa, IdUsuario: Integer);
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: Integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean; overload;
    function LocalizarId(Id: integer): TContaEmailVO; overload;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer); overload;
    function LocalizarCodigo(ACodigo: Integer): TContaEmailVO; overload;
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
    function RetornarEmail(IdUsuario: Integer): string;
  end;

implementation

{ TRevenda }

uses uUsuario;

function TContaEmail.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TContaEmail.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Conta_Email WHERE CtaEm_Id = ' + IntToStr(Id));
end;

function TContaEmail.Filtrar(Campo, Texto, Ativo: string;
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
      sConsulta := sConsulta + ' AND CtaEm_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND CtaEm_Ativo = 0';
  end;
  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TContaEmail.FiltrarCodigo(Codigo: Integer): string;
begin
  Result := CConsulta + ' WHERE CtaEm_Codigo = ' + Codigo.ToString();
end;

procedure TContaEmail.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT CtaEm_Id, CtaEm_Ativo FROM Conta_Email WHERE CtaEm_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('CtaEm_Ativo').AsBoolean = False then
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

function TContaEmail.LocalizarCodigo(ACodigo: Integer): TContaEmailVO;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT CtaEm_Id FROM Conta_Email WHERE CtaEm_Codigo = ' + IntToStr(ACodigo));
    Result := LocalizarId(obj.Model.Fields[0].AsInteger);
  finally
    FreeAndNil(obj);
  end;
end;

function TContaEmail.LocalizarId(Id: integer): TContaEmailVO;
var
  Conta: TContaEmailVO;
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  Conta := TContaEmailVO.Create;
  try
    Qry.Connection := dm.Conexao;
    Qry.SQL.Add(' SELECT');
    Qry.SQL.Add(' CtaEm_id,CtaEm_Codigo, CtaEm_Nome, CtaEm_Email, CtaEm_Senha,');
    Qry.SQL.Add(' CtaEm_SMTP, CtaEm_Porta, CtaEm_Ativo, CtaEm_Autenticar, CtaEm_AutenticarSSL');
    Qry.SQL.Add(' FROM Conta_Email');
    Qry.SQL.Add(' WHERE CtaEm_Id = ' + IntToStr(Id));
    Qry.Open();

    Conta.Id := Qry.FieldByName('CtaEm_Id').AsInteger;
    Conta.Codigo := Qry.FieldByName('CtaEm_Codigo').AsInteger;
    Conta.Nome := Qry.FieldByName('CtaEm_Nome').AsString;
    Conta.Email := Qry.FieldByName('CtaEm_Email').AsString;
    Conta.Senha := Qry.FieldByName('CtaEm_Senha').AsString;
    Conta.SMTP := Qry.FieldByName('CtaEm_SMTP').AsString;
    Conta.Porta := Qry.FieldByName('CtaEm_Porta').AsInteger;
    Conta.Ativo := Qry.FieldByName('CtaEm_Ativo').AsBoolean;
    Conta.Autenticar := Qry.FieldByName('CtaEm_Autenticar').AsBoolean;
    Conta.AutenticarSSL := Qry.FieldByName('CtaEm_AutenticarSSL').AsBoolean;
    Qry.Close;

    Result := Conta;
  finally
    FreeAndNil(Qry);
  end;
end;

function TContaEmail.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TContaEmail.Novo(Programa, IdUsuario: Integer);
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

function TContaEmail.ProximoCodigo: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT MAX(CtaEm_Codigo) FROM Conta_Email';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

function TContaEmail.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Conta_Email'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TContaEmail.Relatorio(Programa, IdUsuario: Integer);
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

function TContaEmail.RetornarEmail(IdUsuario: Integer): string;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(nil);
  try
    Qry.Connection := dm.Conexao;
    Qry.SQL.Add(' SELECT');
    Qry.SQL.Add(' 	CtaEm_Email');
    Qry.SQL.Add(' FROM Usuario');
    Qry.SQL.Add(' 	INNER JOIN Conta_Email ON Usu_ContaEmail = CtaEm_Id');
    Qry.SQL.Add(' WHERE Usu_Id = ' + IntToStr(IdUsuario));
    Qry.Open();
    Result := Trim(Qry.FieldByName('CtaEm_Email').AsString);
    Qry.Close;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TContaEmail.Salvar(Programa, IdUsuario: Integer);
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
