unit ULicenca;

interface

uses
  System.SysUtils, System.Classes,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, ULicencaVO, uLicencaItensVO, System.Generics.Collections,
  uDM, uFireDAC, uGenericDAO;

  const CConsulta: string =
    'SELECT CLILICID, CLILICCNPJCPF,CLILICEMPRESA,CLILICQUANTESTACAO,CLILICQUANTUSUARIO,CLILICIPEXTERNO,CLILICDATAHRATUALIZACAO,CLILICBUILD,CLILICIPLOCAL FROM TCLIENTELICENCA';

  const CConsultaItens: string =
    'SELECT LICID, LICCNPJCPF,LICDATAHORALCTO,LICLICENCA,LICUTILIZADA,LICDATAHRUTILIZACAO, LICSITUACAO FROM TLICENCA';

type
  TLicenca = class
  private
    function LocalizarPorId(AId: Integer): TLicencaVO;
    function LocalizarPorCNPJ(ACNPJ: string): Integer;
    procedure Salvar(ALicenca: TLicencaVO);
    procedure BuscarBancoDados();
//--- ITENS---------------------------------------------------------------------
    function LocalizarItensPorId(AId: Integer): TLicencaItensVO;
    function LocalizarItensPorCNPJ(ACNPJ: string): Integer;
    procedure SalvarItem(ALicencaItem: TLicencaItensVO);
//--- FIREBIRD---------------------------------------------------------------------
  public
    function FBListarLicenca(AUtilizada: Boolean = False): TObjectList<TLicencaVO>;
    function FBListarLicencaItens(AUtilizada: Boolean = False): TObjectList<TLicencaItensVO>;

    procedure Importar();
    procedure ImportarItens();
    function ListarTodos: TObjectList<TLicencaVO>;
    function ListarTodosItens: TObjectList<TLicencaItensVO>;
  end;

implementation

{ TLicenca }

procedure TLicenca.BuscarBancoDados;
begin
  DM.Conexao.Open();
end;

function TLicenca.FBListarLicenca(AUtilizada: Boolean = False): TObjectList<TLicencaVO>;
var
  sb: TStringBuilder;
  Qry: TFDQuery;
  lista: TObjectList<TLicencaVO>;
  model: TLicencaVO;
begin
  BuscarBancoDados();

  lista := TObjectList<TLicencaVO>.Create();
  sb := TStringBuilder.Create;
  Qry := TFDQuery.create(nil);
  try
    try
      sb.AppendLine('select ');
      sb.AppendLine('clilicid,');
      sb.AppendLine('cliliccnpjcpf,');
      sb.AppendLine('clilicempresa,');
      sb.AppendLine('clilicquantestacao,');
      sb.AppendLine('clilicquantusuario,');
      sb.AppendLine('clilicipexterno,');
      sb.AppendLine('clilicdatahratualizacao,');
      sb.AppendLine('clilicbuild,');
      sb.AppendLine('cliliciplocal');
      sb.AppendLine(' from tclientelicenca CLI ');
      sb.AppendLine(' WHERE EXISTS(');
      sb.AppendLine(' SELECT 1 FROM TLICENCA LIC');
      sb.AppendLine('  WHERE CLI.CLILICCNPJCPF = LIC.LICCNPJCPF ');
      if AUtilizada = False then
      begin
        sb.AppendLine('  AND LIC.LICSITUACAO = 1');
        sb.AppendLine('  AND LIC.LICUTILIZADA = ''N'') ');
      end
      else begin
        sb.AppendLine('  AND LIC.LICSITUACAO in (1,2)');
        sb.AppendLine('  AND LIC.LICUTILIZADA = ''N'') ');
      end;

      Qry.Connection := DM.Conexao;
      Qry.SQL.Text := sb.ToString();
      Qry.Open();

      while not Qry.Eof do
      begin
        model := TLicencaVO.Create;
        model.Codigo := Qry.FieldByName('clilicid').AsInteger;
        model.CNPJCPF := Qry.FieldByName('cliliccnpjcpf').AsString;
        model.Empresa := Qry.FieldByName('clilicempresa').AsString;
        model.QtdeEstacao := Qry.FieldByName('clilicquantestacao').AsInteger;
        model.QtdeUsuario := Qry.FieldByName('clilicquantusuario').AsInteger;
        model.IPExterno := Qry.FieldByName('clilicipexterno').AsString;
        model.DataAtualizacao := Qry.FieldByName('clilicdatahratualizacao').AsDateTime;
        model.Build := Qry.FieldByName('clilicbuild').AsString;
        model.IPLocal := Qry.FieldByName('cliliciplocal').AsString;
        lista.Add(model);
        Qry.Next;
      end;
      Result := lista;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(sb);
    freeAndNil(Qry);
  end;
end;

function TLicenca.FBListarLicencaItens(AUtilizada: Boolean = False): TObjectList<TLicencaItensVO>;
var
  sb: TStringBuilder;
  FD: TFDQuery;
  lista: TObjectList<TLicencaItensVO>;
  model: TLicencaItensVO;
begin
  BuscarBancoDados();
  lista := TObjectList<TLicencaItensVO>.Create();
  sb := TStringBuilder.Create;
  FD := TFDQuery.create(nil);
  try
    try
      sb.AppendLine('select ');
      sb.AppendLine('licid,');
      sb.AppendLine('liccnpjcpf,');
      sb.AppendLine('licdatahoralcto,');
      sb.AppendLine('liclicenca,');
      sb.AppendLine('licutilizada,');
      sb.AppendLine('licdatahrutilizacao,');
      sb.AppendLine('licsituacao');
      sb.AppendLine(' from tlicenca lic');
      if AUtilizada = False then
        sb.AppendLine(' WHERE LICSITUACAO = 1 AND LICUTILIZADA = ''N''')
      else
        sb.AppendLine(' WHERE LICSITUACAO in (1,2)');

      FD.Connection := DM.Conexao;
      FD.SQL.Text := sb.ToString();
      FD.Open();
      while not FD.Eof do
      begin
        model := TLicencaItensVO.Create;
        model.Codigo := FD.FieldByName('licid').AsInteger;
        model.CNPJCPF := FD.FieldByName('liccnpjcpf').AsString;
        model.DataLcto := FD.FieldByName('licdatahoralcto').AsDateTime;
        model.Licenca := FD.FieldByName('liclicenca').AsString;
        model.LicencaUtilizada := FD.FieldByName('licutilizada').AsString;
        model.DataUtilizacao := FD.FieldByName('licdatahrutilizacao').AsDateTime;
        model.Situacao := FD.FieldByName('licsituacao').AsString;
        lista.Add(model);
        FD.Next;
      end;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
    Result := lista;
  finally
    FreeAndNil(sb);
    freeAndNil(FD);
  end;
end;

procedure TLicenca.Importar();
var
  lista: TObjectList<TLicencaVO>;
  model: TLicencaVO;
  i: Integer;
  id: Integer;
  count: Integer;
begin
  lista := FBListarLicenca();
  model := TLicencaVO.Create;
  count := lista.Count;
  try
    for i := 0 to count -1 do
    begin
      id := LocalizarPorCNPJ(lista[i].CNPJCPF);
      model.Id := id;
      model.CNPJCPF := lista[i].CNPJCPF;
      model.Empresa := lista[i].Empresa;
      model.QtdeEstacao := lista[i].QtdeEstacao;
      model.QtdeUsuario := lista[i].QtdeUsuario;
      model.IPExterno := lista[i].IPExterno;
      model.DataAtualizacao := lista[i].DataAtualizacao;
      model.Build := lista[i].Build;
      model.IPLocal := lista[i].IPLocal;
      model.Codigo := lista[i].Codigo;
      Salvar(model);
    end;
  finally
    FreeAndNil(lista);
    FreeAndNil(model);
  end;
end;

procedure TLicenca.ImportarItens;
var
  lista: TObjectList<TLicencaItensVO>;
  model: TLicencaItensVO;
  i: Integer;
  id: Integer;
  count: Integer;
begin
  lista := FBListarLicencaItens();
  model := TLicencaItensVO.Create;
  count := lista.Count;
  try
    for i := 0 to count -1 do
    begin
      id := LocalizarItensPorCNPJ(lista[i].CNPJCPF);
      model.Id := id;
      model.CNPJCPF := lista[i].CNPJCPF;
      model.Codigo := lista[i].Codigo;
      model.CNPJCPF := lista[i].CNPJCPF;
      model.DataLcto := lista[i].DataLcto;
      model.Licenca := lista[i].Licenca;
      model.DataUtilizacao := lista[i].DataUtilizacao;
      model.Situacao := lista[i].Situacao;
      model.LicencaUtilizada := lista[i].LicencaUtilizada;
      model.Codigo := lista[i].Codigo;
      SalvarItem(model);
    end;
  finally
    FreeAndNil(lista);
    FreeAndNil(model);
  end;
end;

function TLicenca.ListarTodos: TObjectList<TLicencaVO>;
var
  obj: TFireDAC;
  lista: TObjectList<TLicencaVO>;
  model: TLicencaVO;
begin
  lista := TObjectList<TLicencaVO>.Create();
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT * FROM TCLIENTELICENCA'); // CConsulta
    while not obj.Model.Eof do
    begin
      model := TLicencaVO.Create;
      model.Id := obj.Model.FieldByName('CLILICID').AsInteger;
      model.Codigo := obj.Model.FieldByName('CLILICID').AsInteger;
      model.CNPJCPF := obj.Model.FieldByName('CLILICCNPJCPF').AsString;
      model.Empresa := obj.Model.FieldByName('CLILICEMPRESA').AsString;
      model.QtdeEstacao := obj.Model.FieldByName('CLILICQUANTESTACAO').AsInteger;
      model.QtdeUsuario := obj.Model.FieldByName('CLILICQUANTUSUARIO').AsInteger;
      model.IPExterno := obj.Model.FieldByName('CLILICIPEXTERNO').AsString;
      model.DataAtualizacao := obj.Model.FieldByName('CLILICDATAHRATUALIZACAO').AsDateTime;
      model.Build := obj.Model.FieldByName('CLILICBUILD').AsString;
      model.IPLocal := obj.Model.FieldByName('CLILICIPLOCAL').AsString;
      lista.Add(model);
      obj.Model.Next;
    end;
  finally
    FreeAndNil(obj);
  end;
  Result := lista;
end;

function TLicenca.ListarTodosItens: TObjectList<TLicencaItensVO>;
var
  obj: TFireDAC;
  lista: TObjectList<TLicencaItensVO>;
  model: TLicencaItensVO;
begin
  lista := TObjectList<TLicencaItensVO>.Create();
  obj := TFireDAC.create;
  try
    obj.OpenSQL(CConsultaItens);
    while not obj.Model.Eof do
    begin
      model := TLicencaItensVO.Create;
      model.Id := obj.Model.FieldByName('LICID').AsInteger;
      model.Codigo := obj.Model.FieldByName('LICID').AsInteger;
      model.CNPJCPF := obj.Model.FieldByName('LICCNPJCPF').AsString;
      model.DataLcto := obj.Model.FieldByName('LICDATAHORALCTO').AsDateTime;
      model.Licenca := obj.Model.FieldByName('LICLICENCA').AsString;
      model.LicencaUtilizada := obj.Model.FieldByName('LICUTILIZADA').AsString;
      model.DataUtilizacao := obj.Model.FieldByName('LICDATAHRUTILIZACAO').AsDateTime;
      model.Situacao := obj.Model.FieldByName('LICSITUACAO').AsString;
      lista.Add(model);
      obj.Model.Next;
    end;
  finally
    FreeAndNil(obj);
  end;
  Result := lista;
end;

function TLicenca.LocalizarItensPorCNPJ(ACNPJ: string): Integer;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL(CConsultaItens + ' WHERE LicIte_CNPJCPF = ' + QuotedStr(ACNPJ));

    Result := obj.Model.FieldByName('LicIte_Id').AsInteger;
  finally
    FreeAndNil(obj);
  end;
end;

function TLicenca.LocalizarItensPorId(AId: Integer): TLicencaItensVO;
var
  obj: TFireDAC;
  model: TLicencaItensVO;
begin
  model := TLicencaItensVO.Create;
  obj := TFireDAC.create;
  try
    obj.OpenSQL(CConsulta + ' WHERE LicIte_Id = ' + IntToStr(AId));

    model.Id := obj.Model.FieldByName('LicIte_Id').AsInteger;
    model.Codigo := obj.Model.FieldByName('LicIte_Codigo').AsInteger;
    model.CNPJCPF := obj.Model.FieldByName('LicIte_CNPJCPF').AsString;
    model.DataLcto := obj.Model.FieldByName('LicIte_DataLcto').AsDateTime;
    model.Licenca := obj.Model.FieldByName('LicIte_Licenca').AsString;
    model.DataUtilizacao := obj.Model.FieldByName('LicIte_DataUtilizacao').AsDateTime;
    model.Situacao := obj.Model.FieldByName('LicIte_Situacao').AsString;
    model.LicencaUtilizada := obj.Model.FieldByName('LicIte_Utilizada').AsString;
  finally
    FreeAndNil(obj);
  end;
  Result := model;
end;

function TLicenca.LocalizarPorCNPJ(ACNPJ: string): Integer;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL(CConsulta + ' WHERE Lic_CNPJCPF = ' + QuotedStr(ACNPJ));

    Result := obj.Model.FieldByName('Lic_Id').AsInteger;
  finally
    FreeAndNil(obj);
  end;
end;

function TLicenca.LocalizarPorId(AId: Integer): TLicencaVO;
var
  obj: TFireDAC;
  model: TLicencaVO;
begin
  model := TLicencaVO.Create();
  obj := TFireDAC.create;
  try
    obj.OpenSQL(CConsulta + ' WHERE Lic_Id = ' + IntToStr(AId));

    model.Id := obj.Model.FieldByName('Lic_Id').AsInteger;
    model.Codigo := obj.Model.FieldByName('Lic_Codigo').AsInteger;
    model.CNPJCPF := obj.Model.FieldByName('Lic_CNPJCPF').AsString;
    model.Empresa := obj.Model.FieldByName('Lic_Empresa').AsString;
    model.QtdeEstacao := obj.Model.FieldByName('Lic_QtdeEstacao').AsInteger;
    model.QtdeUsuario := obj.Model.FieldByName('Lic_QtdeUsuario').AsInteger;
    model.IPExterno := obj.Model.FieldByName('Lic_IPExterno').AsString;
    model.DataAtualizacao := obj.Model.FieldByName('Lic_DataAtualizacao').AsDateTime;
    model.Build := obj.Model.FieldByName('Lic_Build').AsString;
    model.IPLocal := obj.Model.FieldByName('Lic_IPLocal').AsString;
  finally
    FreeAndNil(obj);
  end;
  Result := model;
end;

procedure TLicenca.Salvar(ALicenca: TLicencaVO);
begin
  TGenericDAO.Save<TLicencaVO>(ALicenca);
end;

procedure TLicenca.SalvarItem(ALicencaItem: TLicencaItensVO);
begin
  TGenericDAO.Save<TLicencaItensVO>(ALicencaItem);
end;

end.
