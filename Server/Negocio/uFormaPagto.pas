unit uFormaPagto;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uFormaPagtoVO,
  System.Generics.Collections, uFormaPagtoItemVO;

  const CConsulta: string =
    'SELECT Fpg_Id, Fpg_Codigo, Fpg_Nome, Fpg_Ativo FROM FormaPagto ';
  const CConsultaItens: string =
    'SELECT FpgIte_Id, FpgIte_Dias, FpgIte_Obs, FpgIte_FormaPagto FROM FormaPagto_Item ';

type
  TFormaPagto = class(TInterfacedObject, ICadastroInterface)
  private
    procedure SalvarItens(AId: Integer; AFormaPagtoVO: TFormaPagtoVO);
    procedure ExcluirItens(AIdFormaPagto: Integer; AFormaPagtoVO: TFormaPagtoVO);
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: Integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer); overload;
    function Salvar(AFormaPagtoVO: TFormaPagtoVO): Integer; overload;
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;

    procedure FiltarItens(AIdFormPagto: Integer; var Qry: TFDQuery);
    function LocalizarItens(AIdFormaPagto: Integer): TFormaPagtoVO;
  end;

implementation

{ TProduto }

uses uUsuario;

function TFormaPagto.Editar(Programa, IdUsuario: Integer): Boolean;
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

procedure TFormaPagto.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM FormaPagto WHERE Fpg_Id = ' + IntToStr(Id));
end;

procedure TFormaPagto.ExcluirItens(AIdFormaPagto: Integer;
  AFormaPagtoVO: TFormaPagtoVO);
var
  lQry: TFDQuery;
  Id: Integer;
  Item: TFormaPagtoItemVO;
  achou: Boolean;
begin
// se na lista de objetos não tiver registro e no banco de dados sim
// então excluir do banco de dados o registro da lista de objectos

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT FpgIte_Id FROM FormaPagto_Item WHERE FpgIte_FormaPagto = ' + IntToStr(AIdFormaPagto);
    lQry.Open();

    while not lQry.Eof do
    begin
      id := lQry.Fields[0].AsInteger;
      achou := False;

      for Item in AFormaPagtoVO.Itens do
      begin
        if Item.Id = id then
          achou := True;
      end;

      if achou = False then
        dm.ExecutarSQL('DELETE FROM FormaPagto_Item WHERE FpgIte_Id = ' + Id.ToString());

      lQry.Next;
    end;

  finally
    FreeAndNil(lQry);
  end;
end;

procedure TFormaPagto.FiltarItens(AIdFormPagto: Integer; var Qry: TFDQuery);
begin
  Qry.Close;
  Qry.SQL.Text := CConsultaItens + ' WHERE FpgIte_FormaPagto = ' + IntToStr(AIdFormPagto);
end;

function TFormaPagto.Filtrar(Campo, Texto, Ativo: string;
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
      sConsulta := sConsulta + ' AND Fpg_Ativo = 1'
    else
      sConsulta := sConsulta + ' AND Fpg_Ativo = 0';
  end;
  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TFormaPagto.FiltrarCodigo(Codigo: Integer): string;
begin
  Result := CConsulta + ' WHERE Fpg_Codigo = ' + Codigo.ToString();
end;

procedure TFormaPagto.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Fpg_Id, Fpg_Ativo FROM FormaPagto WHERE Fpg_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Fpg_Ativo').AsBoolean = False then
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

function TFormaPagto.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

function TFormaPagto.LocalizarItens(
  AIdFormaPagto: Integer): TFormaPagtoVO;
var
  lQry: TFDQuery;
  Item: TFormaPagtoItemVO;
  Forma: TFormaPagtoVO;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Add(' SELECT');
    lQry.SQL.Add('	Fpg_Id,');
    lQry.SQL.Add('	Fpg_Codigo,');
    lQry.SQL.Add('	Fpg_Nome,');
    lQry.SQL.Add('	Fpg_Ativo,');
    lQry.SQL.Add('	FpgIte_Dias');
    lQry.SQL.Add(' FROM FormaPagto');
    lQry.SQL.Add('	INNER JOIN FormaPagto_Item ON Fpg_Id = FpgIte_FormaPagto');
    lQry.SQL.Add(' WHERE FpgIte_FormaPagto = ' + IntToStr(AIdFormaPagto));
    lQry.Open();

    if lQry.FieldByName('Fpg_Ativo').AsBoolean = False then
      raise Exception.Create('Forma de Pagamento Inatíva!');

    Forma := TFormaPagtoVO.create;
    Forma.Id      := lQry.FieldByName('Fpg_Id').AsInteger;
    Forma.Codigo  := lQry.FieldByName('Fpg_Codigo').AsInteger;
    Forma.Nome    := lQry.FieldByName('Fpg_Nome').AsString;

    while not lQry.Eof do
    begin
      Item := TFormaPagtoItemVO.Create;
      Item.Dias := lQry.FieldByName('FpgIte_Dias').AsInteger;
      Forma.Itens.Add(Item);
      lQry.Next;
    end;

    Result := Forma;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TFormaPagto.Novo(Programa, IdUsuario: Integer);
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

function TFormaPagto.ProximoCodigo: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT MAX(Fpg_Codigo) FROM FormaPagto';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

function TFormaPagto.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''FormaPagto'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TFormaPagto.Relatorio(Programa, IdUsuario: Integer);
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

function TFormaPagto.Salvar(AFormaPagtoVO: TFormaPagtoVO): Integer;
var
  sb: TStringBuilder;
  Ativo: Integer;
  Id: Integer;
begin
  if AFormaPagtoVO.Nome.Trim = '' then
    raise Exception.Create('Informe a Descrição da Observação!');

  if AFormaPagtoVO.Codigo <= 0 then
    raise Exception.Create('Informe o Código da Forma de Pagamento!');

  if AFormaPagtoVO.Itens.Count = 0 then
    raise Exception.Create('Informe os Itens da Forma de Pagamento!');

  Ativo := 0;
  if AFormaPagtoVO.Ativo then
    Ativo := 1;

  sb := TStringBuilder.Create;
  try
    dm.StartTransacao();
    try
      if AFormaPagtoVO.Id = 0 then
      begin
        sb.AppendLine(' INSERT INTO FormaPagto(');
        sb.AppendLine(' Fpg_Codigo, Fpg_Nome, Fpg_Ativo)');
        sb.AppendLine(' VALUES (');
        sb.AppendLine(AFormaPagtoVO.Codigo.ToString() + ',');
        sb.AppendLine(QuotedStr(AFormaPagtoVO.Nome) + ',');
        sb.AppendLine(AFormaPagtoVO.Ativo.ToString() + ');');
        sb.AppendLine(' SELECT SCOPE_IDENTITY();');
        Id := dm.Conexao.ExecSQLScalar(sb.ToString());
        SalvarItens(Id, AFormaPagtoVO);
        Result := Id;
      end
      else begin
        sb.Append(' UPDATE FormaPagto SET');
        sb.Append('   Fpg_Codigo = ' + AFormaPagtoVO.Codigo.ToString() + ',');
        sb.Append('   Fpg_Nome = ' + QuotedStr(AFormaPagtoVO.Nome) + ',');
        sb.Append('   Fpg_Ativo = ' + Ativo.ToString());
        sb.Append(' WHERE Fpg_Id = ' + AFormaPagtoVO.Id.ToString());
        dm.Conexao.ExecSQL(sb.ToString);
        Id := AFormaPagtoVO.Id;
        SalvarItens(Id, AFormaPagtoVO);
        Result := Id;
      end;
      DM.Commit();
    except
      On E: Exception do
      begin
        dm.Roolback();
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(sb);
  end;
end;

procedure TFormaPagto.SalvarItens(AId: Integer; AFormaPagtoVO: TFormaPagtoVO);
var
  Item: TFormaPagtoItemVO;
  sb: TStringBuilder;
begin

  ExcluirItens(AId, AFormaPagtoVO);

  sb := TStringBuilder.Create;
  try
    for Item in AFormaPagtoVO.Itens do
    begin
      sb.Clear;
      if Item.Id <= 0 then
      begin
        sb.AppendLine('INSERT INTO FormaPagto_Item(');
        sb.AppendLine('FpgIte_FormaPagto, FpgIte_Dias, FpgIte_Obs)');
        sb.AppendLine(' VALUES(');
        sb.AppendLine(IntToStr(AId) + ',');
        sb.AppendLine(IntToStr(Item.Dias) + ',');
        sb.AppendLine(QuotedStr(Item.Obs) + ')');
        dm.Conexao.ExecSQL(sb.ToString);
      end
      else begin
        sb.AppendLine('UPDATE FormaPagto_Item SET ');
        sb.AppendLine('  FpgIte_FormaPagto = ' + IntToStr(AId));
        sb.AppendLine(' ,FpgIte_Dias = ' + IntToStr(Item.Dias));
        sb.AppendLine(' ,FpgIte_Obs = ' + QuotedStr(Item.Obs));
        sb.AppendLine(' WHERE FpgIte_Id = ' + IntToStr(Item.Id));
        dm.Conexao.ExecSQL(sb.ToString);
      end;
    end;
  finally
    FreeAndNil(sb);
  end;
end;

procedure TFormaPagto.Salvar(Programa, IdUsuario: Integer);
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
