unit uOrcamento;

interface

uses
  uCadastroInterface, Data.DB, FireDAC.Comp.Client, uUsuario, System.SysUtils,
  uDM, uParametros, uFiltroOrcamento, uEnumerador, uOrcamentoVO, uOrcamentoItemVO,
  uOrcamentoItemModuloVO, uOrcamentoOcorrenciaVO, System.Variants, System.Generics.Collections,
  uFormaPagtoItemVO, uFormaPagtoVO, uGenericDAO, uOrcamentoEmailVO,
  uClassValidacao, uFireDAC, uDepartamento, uDepartamentoEmailVO, uContaEmail,
  uContaEmailVO, uInscricaoEstadual, uContatoVO, uContato;

  const CConsulta: string =
  'SELECT ' +
    ' Orc_Data, '+
    ' Orc_Id, '+
    ' Orc_Numero, '+
    ' Orc_Situacao, '+
    ' Orc_RazaoSocial,'+
    ' Orc_EmailEnviado,' +
    ' Pros_Nome, '+
    ' Usu_Nome, '+
    ' Cli_Codigo, '+
    ' Cli_Nome '+
  'FROM Orcamento '+
    'LEFT JOIN Prospect ON Orc_Prospect = Pros_Id '+
    'LEFT JOIN Usuario ON Orc_Usuario = Usu_Id '+
    'LEFT JOIN Cliente ON Orc_Cliente = Cli_Id ' +
    'LEFT JOIN Cidade ON Orc_Cidade = Cid_Id ' +
    'LEFT JOIN Tipo ON Orc_Tipo = Tip_Id ';

type
  TOrcamento = class(TInterfacedObject, ICadastroInterface)
  private
    FOrcamentoItemVO: TOrcamentoItemVO;
    procedure SalvarOrcamentoItem(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO;
      var AspItem: TFDStoredProc; var AspModulo: TFDStoredProc);
    procedure SalvarItemModulo(AIdItem, AIdItemOld: Integer; AOrcamentoVO: TOrcamentoVO; var AspItemModulo: TFDStoredProc);
    procedure SalvarOrcamentoOcorrencia(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO;  var AspOcorrencia: TFDStoredProc);
    procedure SalvarOrcamentoVectos(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO;  var AspVencto: TFDStoredProc);
    procedure SalvarOrcamentoEmail(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO);
    procedure SalvarContatos(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO);

    procedure ExcluirOrcamentoItem(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO);
    procedure ExcluirOrcamentoItemModulo(AIdOrcamentoItem: Integer; AOrcamentoVO: TOrcamentoVO);
    procedure ExcluirOrcamentoOcorrencia(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO);
    procedure ExcluirOrcamentoVenctos(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO);
    procedure ExcluirOrcamentoEmail(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO);
    procedure ExcluirContatos(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO);

    procedure ValidarDocumento(AOrcamento: TOrcamentoVO);

    function ObterPorId(AId: Integer): TOrcamentoVO;
    procedure ItensOrcamento(AOrcamentoVO: TOrcamentoVO; AObj: TFireDAC);
    procedure EmailOrcamento(AOrcamentoVO: TOrcamentoVO; AObj: TFireDAC);
    procedure VenctosOrcamento(AOrcamentoVO: TOrcamentoVO; AObj: TFireDAC);
    procedure ContatosOrcamento(AOrcamentoVO: TOrcamentoVO);
  public
    procedure Novo(APrograma, AIdUsuario: Integer);
    function Editar(APrograma, AIdUsuario: Integer): Boolean;
    procedure Excluir(APrograma, AIdUsuario, AId: Integer);
    function Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = True): string; overload;
    function FiltrarCodigo(ACodigo: integer): string;
    function FiltarId(AId: Integer): string;
    function Filtrar(AFiltro: TFiltroOrcamento; ACampo, ATexto: string;
        AIdUsuario: Integer; AContem: Boolean = True): string; overload;
    function LocalizarId(var AQry: TFDQuery; AId: integer): Boolean;
    procedure LocalizarCodigo(var AQry: TFDQuery; ACodigo: integer);
    procedure Salvar(APrograma, AIdUsuario: Integer); overload;
    function Salvar(AOrcamentoVO: TOrcamentoVO;  var AspOrcamento: TFDStoredProc;
      var AspOrcamentoItem: TFDStoredProc; var AspOrcamentoOcorrencia: TFDStoredProc;
      var AspOrcamentoVencto: TFDStoredProc; var AspOrcamentoModulo: TFDStoredProc): Integer; overload;

    function Replicar(AIdOrcamentoBase: Integer;
      var AspOrcamento: TFDStoredProc;  var AspOrcamentoItem: TFDStoredProc;
      var AspOrcamentoVencto: TFDStoredProc; var AspOrcamentoModulo: TFDStoredProc;
      var AspOrcamentoOcorrencia: TFDStoredProc): Integer;

    function ProximoCodigo: Integer;
    function IncrementarNumero: Integer;
    function ProximoId: Integer;
    function CodigoAtual: Integer;
    function RetornarEmailSupervisor(AIdUsuario: Integer): string;
    function UsuarioIgualCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;

    procedure Relatorio(APrograma, AIdUsuario: Integer);
    procedure AtualizarSituacao(ACodigo, AId: Integer);
    procedure EmailEnviado(AIdOrcamento: Integer);

//------------------------------------------------------------------------------
// itens do orcamento
//------------------------------------------------------------------------------
    procedure LocalizarItemOrcamento(AIdOrcamento: Integer; var AQry: TFDQuery);
//------------------------------------------------------------------------------
// Modulos do orcamento
//------------------------------------------------------------------------------
    procedure LocalizarItemModuloOrcamento(AIdOrcamentoItem: Integer; var AQry: TFDQuery);
//------------------------------------------------------------------------------
// Ocorrencias do orcamento
//------------------------------------------------------------------------------
    procedure LocalizarOcorrenciaOrcamento(AIdOrcamento: Integer; var AQry: TFDQuery);
//------------------------------------------------------------------------------
// Vencimentos do orcamento
//------------------------------------------------------------------------------
    procedure LocalizarVenctoOrcamento(AIdOrcamento: Integer; var AQry: TFDQuery);
    procedure GerarParcelas(AIdFormaPagto: Integer; ATotalOrcamento: Currency;
      out AValorPrimeira, AValorOutras: Currency);
    procedure GerarParcelasDifUltima(AQtdeParcelas: Integer; ATotalOrcamento: Currency;
      out AValorUltima, AValorOutras: Currency);
//------------------------------------------------------------------------------
// Emails do orcamento
//------------------------------------------------------------------------------
    function ListarEmail(AIdOrcamento: Integer): TObjectList<TOrcamentoEmailVO>;
    function ListarEmailSeteDias(): TObjectList<TOrcamentoVO>;
    function BuscarRemetenteEmailSeteDias(): Integer;
//------------------------------------------------------------------------------
// Relatorios
//------------------------------------------------------------------------------
    procedure RelatorioPorUsuarioTipo(var AQuery: TFDQuery; AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
    procedure RelatorioGraficoPorTipo(var AQuery: TFDQuery; AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
    procedure RelatorioGraficoPorSituacao(var AQuery: TFDQuery; AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
    procedure RelatorioGraficoPorUsuario(var AQuery: TFDQuery; AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
    procedure RelatorioPorMotivoNaoAprovado(var AQuery: TFDQuery; AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
    procedure RelatorioGraficoPorMotivoNaoAprovado(var AQuery: TFDQuery; AFiltro: TFiltroOrcamento; AIdUsuario: Integer);

    function Filtro(AFiltro: TFiltroOrcamento; AIdUsuario: Integer): string;
  end;

implementation

{ TOrcamento }

uses uFuncoesServidor, ServerMethodsUnit1, uOrcamentoVectoVO, uParcelas,
  uFormaPagto;

procedure TOrcamento.AtualizarSituacao(ACodigo, AId: Integer);
begin
  if ACodigo in [1,2,3,4] then
  begin
    DM.ExecutarSQL('UPDATE Orcamento SET Orc_DataSituacao = CAST(GETDATE() AS date), Orc_Situacao = ' + IntToStr(ACodigo) +
      ' WHERE Orc_Id = ' + IntToStr(AId));
  end
  else begin
    raise Exception.Create('C�digo da Situa��o Inv�lida!');
  end;
end;

function TOrcamento.BuscarRemetenteEmailSeteDias: Integer;
var
  Parametro: TParametros;
  iCodigo: Integer;
  obj: TFireDAC;
begin
  Parametro := TParametros.Create;
  obj := TFireDAC.create;
  try
    iCodigo := StrTointDef(Parametro.LocalizarParametro(40, 0),0);
    obj.Lista.Clear;
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('	 TOP(1)');
    obj.Lista.Add('	 Usu_Id');
    obj.Lista.Add(' FROM Conta_Email');
    obj.Lista.Add('	 INNER JOIN Usuario ON CtaEm_Id = Usu_ContaEmail');
    obj.Lista.Add(' WHERE CtaEm_Codigo = ' + IntToStr(iCodigo));
    obj.OpenSQL();

    Result := obj.Model.Fields[0].AsInteger;
  finally
    FreeAndNil(obj);
    FreeAndNil(Parametro);
  end;
end;

function TOrcamento.CodigoAtual: Integer;
var
  obj: TParametros;
begin
  obj := TParametros.Create;
  try
    Result := obj.ProximaSequencia(37);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TOrcamento.ContatosOrcamento(AOrcamentoVO: TOrcamentoVO);
var
  Contato: TContato;
  Lista: TObjectList<TContatoVO>;
  Item: TContatoVO;
  model: TContatoVO;
begin
  Contato := TContato.Create;
  try
    Lista := Contato.LocalizarPorOrcamento(AOrcamentoVO.Id);
    for Item in Lista do
    begin
      model := TContatoVO.Create;
      model.Id := Item.Id;
      model.IdCliente := Item.IdCliente;
      model.IdOrcamento := Item.IdOrcamento;
      model.Nome := item.Nome;
      model.Fone1 := item.Fone1;
      model.Fone2 := item.Fone2;
      model.Departamento := item.Departamento;
      model.Email := item.Email;
      AOrcamentoVO.ListaContato.Add(model);
    end;

  finally
    FreeAndNil(Contato);
    FreeAndNil(Lista);
  end;
end;

function TOrcamento.Editar(APrograma, AIdUsuario: Integer): Boolean;
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    Result := usuario.PermissaoEditar(APrograma, AIdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

procedure TOrcamento.EmailEnviado(AIdOrcamento: Integer);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.ExecutarSQL('UPDATE Orcamento SET Orc_EmailEnviado = 1 WHERE Orc_Id = ' + IntToStr(AIdOrcamento));
  finally
    FreeAndNil(obj);
  end;
end;

procedure TOrcamento.EmailOrcamento(AOrcamentoVO: TOrcamentoVO; AObj: TFireDAC);
var
  Email,
  EmailVO: TOrcamentoEmailVO;
begin
  EmailVO := TOrcamentoEmailVO.Create;
  try
    AObj.Lista.Clear;
    AObj.Lista.Add(TGenericDAO.Select<TOrcamentoEmailVO>(EmailVO, False));
    AObj.Lista.Add(' FROM Orcamento_Email');
    AObj.Lista.Add(' WHERE OrcEm_Orcamento = ' + IntToStr(AOrcamentoVO.Id));
    AObj.OpenSQL();

    while not AObj.Model.Eof do
    begin
      Email := TOrcamentoEmailVO.Create;
      Email.Id          := AObj.Model.FieldByName('OrcEm_Id').AsInteger;
      Email.IdOrcamento := AOrcamentoVO.Id;
      Email.Email       := AObj.Model.FieldByName('OrcEm_Email').AsString;
      AOrcamentoVO.OrcamentoEmail.Add(Email);
      AObj.Model.Next;
    end;
  finally
    FreeAndNil(EmailVO);
  end;
end;

procedure TOrcamento.Excluir(APrograma, AIdUsuario, AId: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(APrograma, AIdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Orcamento WHERE Orc_Id = ' + IntToStr(AId));
end;

procedure TOrcamento.ExcluirContatos(AIdOrcamento: Integer;
  AOrcamentoVO: TOrcamentoVO);
var
  lQry: TFDQuery;
  Id: Integer;
  Item: TContatoVO;
  achou: Boolean;
  obj: TFireDAC;
begin
// se na lista de objetos n�o tiver registro e no banco de dados sim
// ent�o excluir do banco de dados o registro da lista de objectos

  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT Cont_Id FROM Contato WHERE Cont_Orcamento = ' + IntToStr(AIdOrcamento));

    while not obj.Model.Eof do
    begin
      id := obj.Model.Fields[0].AsInteger;
      achou := False;

      for Item in AOrcamentoVO.ListaContato do
      begin
        if Item.Id = id then
          achou := True;
      end;

      if achou = False then
        dm.ExecutarSQL('DELETE FROM Contato WHERE Cont_Id = ' + Id.ToString());

      obj.Model.Next;
    end;

  finally
    FreeAndNil(obj);
  end;
end;

procedure TOrcamento.ExcluirOrcamentoEmail(AIdOrcamento: Integer;
  AOrcamentoVO: TOrcamentoVO);
var
  lQry: TFDQuery;
  Id: Integer;
  Item: TOrcamentoEmailVO;
  achou: Boolean;
begin
// se na lista de objetos n�o tiver registro e no banco de dados sim
// ent�o excluir do banco de dados o registro da lista de objectos

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT OrcEm_Id FROM Orcamento_Email WHERE OrcEm_Orcamento = ' + IntToStr(AIdOrcamento);
    lQry.Open();

    while not lQry.Eof do
    begin
      id := lQry.Fields[0].AsInteger;
      achou := False;

      for Item in AOrcamentoVO.OrcamentoEmail do
      begin
        if Item.Id = id then
          achou := True;
      end;

      if achou = False then
        dm.ExecutarSQL('DELETE FROM Orcamento_Email WHERE OrcEm_Id = ' + Id.ToString());

      lQry.Next;
    end;

  finally
    FreeAndNil(lQry);
  end;
end;

procedure TOrcamento.ExcluirOrcamentoItem(AIdOrcamento: Integer;
  AOrcamentoVO: TOrcamentoVO);
var
  lQry: TFDQuery;
  Id: Integer;
  Item: TOrcamentoItemVO;
  achou: Boolean;
begin
// se na lista de objetos n�o tiver registro e no banco de dados sim
// ent�o excluir do banco de dados o registro da lista de objectos

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT OrcIte_Id FROM Orcamento_Item WHERE OrcIte_Orcamento = ' + IntToStr(AIdOrcamento);
    lQry.Open();

    while not lQry.Eof do
    begin
      id := lQry.Fields[0].AsInteger;
      achou := False;

      for Item in AOrcamentoVO.OrcamentoItem do
      begin
        if Item.Id = id then
          achou := True;
      end;

      if achou = False then
        dm.ExecutarSQL('DELETE FROM Orcamento_Item WHERE OrcIte_Id = ' + Id.ToString());

      lQry.Next;
    end;

  finally
    FreeAndNil(lQry);
  end;
end;

procedure TOrcamento.ExcluirOrcamentoItemModulo(AIdOrcamentoItem: Integer;
  AOrcamentoVO: TOrcamentoVO);
var
  lQry: TFDQuery;
  Id: Integer;
  Item: TOrcamentoItemModuloVO;
  achou: Boolean;
begin
// se na lista de objetos n�o tiver registro e no banco de dados sim
// ent�o excluir do banco de dados o registro da lista de objectos

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT OrcIteMod_Id FROM Orcamento_Item_Modulo WHERE OrcIteMod_OrcamentoItem = ' + IntToStr(AIdOrcamentoItem);
    lQry.Open();

    while not lQry.Eof do
    begin
      id := lQry.Fields[0].AsInteger;
      achou := False;

      for Item in AOrcamentoVO.OrcamentoItemModulo do
      begin
        if Item.Id = id then
          achou := True;
      end;

      if achou = False then
        dm.ExecutarSQL('DELETE FROM Orcamento_Item_Modulo WHERE OrcIteMod_Id = ' + Id.ToString());

      lQry.Next;
    end;

  finally
    FreeAndNil(lQry);
  end;
end;

procedure TOrcamento.ExcluirOrcamentoOcorrencia(AIdOrcamento: Integer;
  AOrcamentoVO: TOrcamentoVO);
var
  lQry: TFDQuery;
  Id: Integer;
  Item: TOrcamentoOcorrenciaVO;
  achou: Boolean;
begin
// se na lista de objetos n�o tiver registro e no banco de dados sim
// ent�o excluir do banco de dados o registro da lista de objectos

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT OrcOco_Id FROM Orcamento_Ocorrencia WHERE OrcOco_Orcamento = ' + IntToStr(AIdOrcamento);
    lQry.Open();

    while not lQry.Eof do
    begin
      id := lQry.Fields[0].AsInteger;
      achou := False;

      for Item in AOrcamentoVO.OrcamentoOcorrencia do
      begin
        if Item.Id = id then
          achou := True;
      end;

      if achou = False then
        dm.ExecutarSQL('DELETE FROM Orcamento_Ocorrencia WHERE OrcOco_Id = ' + Id.ToString());

      lQry.Next;
    end;

  finally
    FreeAndNil(lQry);
  end;
end;

procedure TOrcamento.ExcluirOrcamentoVenctos(AIdOrcamento: Integer;
  AOrcamentoVO: TOrcamentoVO);
var
  lQry: TFDQuery;
  Id: Integer;
  Item: TOrcamentoVectoVO;
  achou: Boolean;
begin
// se na lista de objetos n�o tiver registro e no banco de dados sim
// ent�o excluir do banco de dados o registro da lista de objectos

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT OrcVect_Id FROM Orcamento_Vectos WHERE OrcVect_Orcamento = ' + IntToStr(AIdOrcamento);
    lQry.Open();

    while not lQry.Eof do
    begin
      id := lQry.Fields[0].AsInteger;
      achou := False;

      for Item in AOrcamentoVO.OrcamentoVecto do
      begin
        if Item.Id = id then
          achou := True;
      end;

      if achou = False then
        dm.ExecutarSQL('DELETE FROM Orcamento_Vectos WHERE OrcVect_Id = ' + Id.ToString());

      lQry.Next;
    end;

  finally
    FreeAndNil(lQry);
  end;
end;

function TOrcamento.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean): string;
begin
  // nao usado
  Result := '';
end;

function TOrcamento.FiltarId(AId: Integer): string;
begin
  Result := CConsulta + ' WHERE Orc_Id = ' + AId.ToString();
end;

function TOrcamento.Filtrar(AFiltro: TFiltroOrcamento; ACampo, ATexto: string;
  AIdUsuario: Integer; AContem: Boolean): string;
var
  sTexto: string;
  sConsulta: string;
  objUsuario: TUsuario;
begin

  objUsuario := TUsuario.Create;

  sTexto := '''' + ATexto + '%''';
  if AContem then
    sTexto := '''%' + ATexto + '%''';

  sConsulta := CConsulta + Filtro(AFiltro, AIdUsuario);
  sConsulta := sConsulta + ' AND ' + ACampo + ' LIKE ' + sTexto;

  if not objUsuario.PermissaoOrcamentoUsuario(AIdUsuario) then
    sConsulta := sConsulta + ' AND Orc_Usuario = ' + IntToStr(AIdUsuario);

  FreeAndNil(objUsuario);

  Result := sConsulta;
end;

function TOrcamento.FiltrarCodigo(ACodigo: integer): string;
begin
  Result := CConsulta + ' WHERE Orc_Numero = ' + ACodigo.ToString();
end;

function TOrcamento.Filtro(AFiltro: TFiltroOrcamento; AIdUsuario: Integer): string;
var
  InstrucaoSQL: string;
  Usuario: TUsuario;
  bPermissao: Boolean;
begin
  InstrucaoSQL := '	WHERE Orc_Id >= 0';

  Usuario := TUsuario.Create;
  try
    InstrucaoSQL := InstrucaoSQL +  Usuario.RetornaPermissaoUsuarioDepartamento(AIdUsuario);
    bPermissao := Usuario.PermissaoOrcamentoUsuario(AIdUsuario);
  finally
    FreeAndNil(Usuario);
  end;

  if AFiltro.DataInicial.Trim <> DataEmBranco then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_Data >= ' + TFuncoes.DataIngles(AFiltro.DataInicial);

  if AFiltro.DataFinal.Trim <> DataEmBranco then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_Data <= ' + TFuncoes.DataIngles(AFiltro.DataFinal);

  if AFiltro.DataSituacaoInicial.Trim <> DataEmBranco then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_DataSituacao >= ' + TFuncoes.DataIngles(AFiltro.DataSituacaoInicial);

  if AFiltro.DataSituacaoFinal.Trim <> DataEmBranco then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_DataSituacao <= ' + TFuncoes.DataIngles(AFiltro.DataSituacaoFinal);

  if AFiltro.Usuario.Id.Trim <> '' then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_Usuario in ' + AFiltro.Usuario.Id;

  if AFiltro.Cliente.Id.Trim <> '' then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_Cliente in ' + AFiltro.Cliente.Id;

  if AFiltro.IdTipo.Trim <> '' then
    InstrucaoSQL := InstrucaoSQL + ' AND Tip_Id in ' + AFiltro.IdTipo;

  if AFiltro.Situacao <> '' then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_Situacao in (' + AFiltro.Situacao + ')';

  if AFiltro.SubTipo > 0 then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_SubTipo = ' + AFiltro.SubTipo.ToString();

  if AFiltro.EmailEnviado = 'S' then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_EmailEnviado = 1';

  if AFiltro.EmailEnviado = 'N' then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_EmailEnviado = 0';

  if AFiltro.Numero > 0 then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_Numero = ' + AFiltro.Numero.ToString();

  if AFiltro.Cliente.IdCidade <> '' then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_Cidade in ' + AFiltro.Cliente.IdCidade;

  if not (bPermissao) then
    InstrucaoSQL := InstrucaoSQL + ' AND Orc_Usuario = ' + IntToStr(AIdUsuario);


  Result := InstrucaoSQL;

end;

procedure TOrcamento.GerarParcelas(AIdFormaPagto: Integer;
  ATotalOrcamento: Currency; out AValorPrimeira, AValorOutras: Currency);
var
  FormaVO: TFormaPagtoVO;
  Forma: TFormaPagto;
  Parcela: TParcelas;
begin
  Forma := TFormaPagto.Create;
  Parcela := TParcelas.Create;
  try
    FormaVO := Forma.LocalizarItens(AIdFormaPagto);
    Parcela.Calculo(FormaVO.Itens.Count, ATotalOrcamento);
    AValorPrimeira := Parcela.ValorPrimeira;
    AValorOutras   := Parcela.ValorOutras;
  finally
    FreeAndNil(Parcela);
    FreeAndNil(Forma);
    FreeAndNil(FormaVO);
  end;
end;

procedure TOrcamento.GerarParcelasDifUltima(AQtdeParcelas: Integer;
  ATotalOrcamento: Currency; out AValorUltima, AValorOutras: Currency);
var
  Parcela: TParcelas;
begin
  Parcela := TParcelas.Create;
  try
    Parcela.Calculo(AQtdeParcelas, ATotalOrcamento);
    AValorUltima := Parcela.ValorPrimeira;
    AValorOutras   := Parcela.ValorOutras;
  finally
    FreeAndNil(Parcela);
  end;
end;

function TOrcamento.IncrementarNumero: Integer;
var
  Parametro: TParametros;
begin
  Parametro := TParametros.Create;
  try
    Result := Parametro.IncrementarSequencia(37);
  finally
    FreeAndNil(Parametro);
  end;
end;

procedure TOrcamento.ItensOrcamento(AOrcamentoVO: TOrcamentoVO; AObj: TFireDAC);
var
  ItemVO,
  Item: TOrcamentoItemVO;
  ModuloVO,
  Modulo: TOrcamentoItemModuloVO;
  ObjModulo: TFireDAC;
begin
  ItemVO := TOrcamentoItemVO.Create;
  ModuloVO := TOrcamentoItemModuloVO.Create;
  objModulo := TFireDAC.create;
  try
    AObj.Lista.Clear;
    AObj.Lista.Add(TGenericDAO.Select<TOrcamentoItemVO>(ItemVO, False));
    AObj.Lista.Add(' FROM Orcamento_Item');
    AObj.Lista.Add(' WHERE OrcIte_Orcamento = ' + IntToStr(AOrcamentoVO.Id));
    AObj.OpenSQL();

    while not AObj.Model.Eof do
    begin
      Item := TOrcamentoItemVO.Create;
      Item.Id                 := AObj.Model.FieldByName('OrcIte_Id').AsInteger;
      Item.IdOrcamento        := AObj.Model.FieldByName('OrcIte_Orcamento').AsInteger;
      Item.IdProduto          := AObj.Model.FieldByName('OrcIte_Produto').AsInteger;
      Item.Descricao          := AObj.Model.FieldByName('OrcIte_Descricao').AsString;
      Item.ValorLicencaImpl   := AObj.Model.FieldByName('OrcIte_ValorLicencaImpl').AsCurrency;
      Item.ValorDescImpl      := AObj.Model.FieldByName('OrcIte_ValorDescImpl').AsCurrency;
      Item.ValorLicencaMensal := AObj.Model.FieldByName('OrcIte_ValorLicencaMensal').AsCurrency;
      Item.ValorDescMensal    := AObj.Model.FieldByName('OrcIte_ValorDescMensal').AsCurrency;
      Item.IdTipo             := AObj.Model.FieldByName('OrcIte_Tipo').AsInteger;
      Item.IdStatus           := AObj.Model.FieldByName('OrcIte_Status').AsInteger;

      AOrcamentoVO.OrcamentoItem.Add(Item);
//==============================================================================
// MODULOS
      objModulo.Lista.Clear;
      objModulo.Lista.Add(TGenericDAO.Select<TOrcamentoItemModuloVO>(ModuloVO, False));
      objModulo.Lista.Add(' FROM Orcamento_Item_Modulo');
      objModulo.Lista.Add(' WHERE OrcIteMod_OrcamentoItem = ' + IntToStr(Item.Id));
      objModulo.OpenSQL();
      while not objModulo.Model.Eof do
      begin
        Modulo := TOrcamentoItemModuloVO.Create;
        Modulo.Id               := objModulo.Model.FieldByName('OrcIteMod_Id').AsInteger;
        Modulo.IdOrcamentoItem  := Item.Id;
        Modulo.IdModulo         := objModulo.Model.FieldByName('OrcIteMod_Modulo').AsInteger;
        Modulo.Descricao        := objModulo.Model.FieldByName('OrcIteMod_Descricao').AsString;
        AOrcamentoVO.OrcamentoItemModulo.Add(Modulo);
        objModulo.Model.Next;
      end;
      AObj.Model.Next;
    end;
  finally
    FreeAndNil(ItemVO);
    FreeAndNil(ModuloVO);
    FreeAndNil(objModulo);
  end;
end;

function TOrcamento.ListarEmail(AIdOrcamento: Integer): TObjectList<TOrcamentoEmailVO>;
var
  lQry: TFDQuery;
  Lista: TObjectList<TOrcamentoEmailVO>;
  obj: TOrcamentoEmailVO;
begin
  lQry := TFDQuery.Create(Nil);
  Lista := TObjectList<TOrcamentoEmailVO>.Create();
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT OrcEm_Id, OrcEm_Orcamento, OrcEm_Email  FROM Orcamento_Email WHERE OrcEm_Orcamento = ' + IntToStr(AIdOrcamento);
    lQry.Open();

    while not lQry.Eof do
    begin
      obj := TOrcamentoEmailVO.Create;
      obj.Id := lQry.FieldByName('OrcEm_Id').AsInteger;
      obj.IdOrcamento := lQry.FieldByName('OrcEm_Orcamento').AsInteger;
      obj.Email := lQry.FieldByName('OrcEm_Email').AsString;
      Lista.Add(obj);

      lQry.Next;
    end;
    Result := Lista;

  finally
    FreeAndNil(lQry);
  end;
end;

function TOrcamento.ListarEmailSeteDias: TObjectList<TOrcamentoVO>;
var
  obj: TFireDAC;
  ObjDep: TFireDAC;
  Model: TOrcamentoVO;
  Lista: TObjectList<TOrcamentoVO>;
  DepEmailModel: TDepartamentoEmailVO;
begin
  ObjDep := TFireDAC.create;
  obj := TFireDAC.create;
  try
    obj.Lista.Clear;
    obj.Lista.Add('SELECT');
    obj.Lista.Add('   Orc_Numero,');
    obj.Lista.Add('   Orc_Data AS Data,');
    obj.Lista.Add('   Orc_RazaoSocial,');
    obj.Lista.Add('   Orc_Contato,');
    obj.Lista.Add('   Orc_Situacao,');
    obj.Lista.Add('   Orc_Usuario,');
    obj.Lista.Add('   Usu_Email,');
    obj.Lista.Add('   Usu_Nome,');
    obj.Lista.Add('   Usu_Departamento');
    obj.Lista.Add(' FROM Orcamento');
    obj.Lista.Add('   INNER JOIN Usuario ON Orc_Usuario = Usu_Id');
    obj.Lista.Add(' WHERE Orc_Situacao = 1');
    obj.Lista.Add(' AND (DATEDIFF(DAY, orc_Data, GETDATE()) >= 7)');
    obj.Lista.Add(' AND NOT EXISTS(');
    obj.Lista.Add('   SELECT 1 FROM Orcamento_Ocorrencia');
    obj.Lista.Add('   WHERE Orc_Id = OrcOco_Orcamento)');

    obj.Lista.Add(' UNION');

    obj.Lista.Add(' SELECT DISTINCT');
    obj.Lista.Add('   Orc_Numero,');
    obj.Lista.Add('   Orc_Data AS Data,');
    obj.Lista.Add('   Orc_RazaoSocial,');
    obj.Lista.Add('   Orc_Contato,');
    obj.Lista.Add('   Orc_Situacao,');
    obj.Lista.Add('   Orc_Usuario,');
    obj.Lista.Add('   Usu_Email,');
    obj.Lista.Add('   Usu_Nome,');
    obj.Lista.Add('   Usu_Departamento');
    obj.Lista.Add(' FROM Orcamento');
    obj.Lista.Add('   INNER JOIN Usuario ON Orc_Usuario = Usu_Id');
    obj.Lista.Add(' WHERE Orc_Situacao = 1');
    obj.Lista.Add(' AND EXISTS(');
    obj.Lista.Add('   SELECT 1 FROM Orcamento_Ocorrencia');
    obj.Lista.Add('     WHERE Orc_Id = OrcOco_Orcamento');
    obj.Lista.Add('     HAVING(DATEDIFF(DAY, MAX(OrcOco_Data), GETDATE()) >= 7))');

    obj.OpenSQL();

    Lista := TObjectList<TOrcamentoVO>.Create();
    while not obj.Model.Eof do
    begin
      Model := TOrcamentoVO.create;
      Model.Numero      := obj.Model.FieldByName('Orc_Numero').AsInteger;
      Model.Data        := obj.Model.FieldByName('Data').AsDateTime;
      Model.RazaoSocial := obj.Model.FieldByName('Orc_RazaoSocial').AsString;
      Model.Contato     := obj.Model.FieldByName('Orc_Contato').AsString;
      Model.Situacao    := obj.Model.FieldByName('Orc_Situacao').AsInteger;
      Model.Usuario.Nome:= obj.Model.FieldByName('Usu_Nome').AsString;
      Model.Usuario.Email := obj.Model.FieldByName('Usu_Email').AsString;
      Model.IdUsuario   := obj.Model.FieldByName('Orc_Usuario').AsInteger;
      Model.Usuario.Departamento.Id := obj.Model.FieldByName('Usu_Departamento').AsInteger;

      ObjDep.Lista.Clear;
      ObjDep.Lista.Add(' SELECT');
      ObjDep.Lista.Add('   DepEm_Email');
      ObjDep.Lista.Add(' FROM Departamento');
      ObjDep.Lista.Add('   INNER JOIN Departamento_Email ON Dep_Id = DepEm_Departamento');
      ObjDep.Lista.Add(' WHERE Dep_Id = ' + Model.Usuario.Departamento.Id.ToString());
      ObjDep.OpenSQL();

      while not ObjDep.Model.Eof do
      begin
        DepEmailModel := TDepartamentoEmailVO.Create;
        DepEmailModel.IdDepartamento := Model.Usuario.Departamento.Id;
        DepEmailModel.Email := ObjDep.Model.FieldByName('DepEm_Email').AsString;

        Model.Usuario.Departamento.DepartamentoEmail.Add(DepEmailModel);
        ObjDep.Model.Next;
      end;

      Lista.Add(Model);
      obj.Model.Next;
    end;
    Result := Lista;
  finally
    FreeAndNil(obj);
    FreeAndNil(ObjDep);
  end;
end;

procedure TOrcamento.LocalizarCodigo(var AQry: TFDQuery; ACodigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Orc_Id FROM Orcamento WHERE Orc_Numero = ' + IntToStr(ACodigo);
    lQry.Open();

    LocalizarId(AQry, lQry.Fields[0].AsInteger);
  finally
    FreeAndNil(lQry);
  end;
end;

function TOrcamento.LocalizarId(var AQry: TFDQuery; AId: integer): Boolean;
begin
  AQry.Close;
  AQry.Params[0].AsInteger := AId;
  AQry.Open();

  Result := (not AQry.IsEmpty);
end;

procedure TOrcamento.LocalizarItemModuloOrcamento(AIdOrcamentoItem: Integer;
  var AQry: TFDQuery);
begin
  AQry.Close;
  AQry.Params[0].AsInteger := AIdOrcamentoItem;
end;

procedure TOrcamento.LocalizarItemOrcamento(AIdOrcamento: Integer;
  var AQry: TFDQuery);
begin
  AQry.Close;
  AQry.Params[0].AsInteger := AIdOrcamento;
end;

procedure TOrcamento.LocalizarOcorrenciaOrcamento(AIdOrcamento: Integer;
  var AQry: TFDQuery);
begin
  AQry.Close;
  AQry.Params[0].AsInteger := AIdOrcamento;
end;

procedure TOrcamento.LocalizarVenctoOrcamento(AIdOrcamento: Integer;
  var AQry: TFDQuery);
begin
  AQry.Close;
  AQry.Params[0].AsInteger := AIdOrcamento;
end;

procedure TOrcamento.Novo(APrograma, AIdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoIncluir(APrograma, AIdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

function TOrcamento.ObterPorId(AId: Integer): TOrcamentoVO;
var
  Obj: TFireDAC;
  OrcamentoVO: TOrcamentoVO;
begin
  Obj := TFireDAC.Create;
  OrcamentoVO := TOrcamentoVO.Create;
  try
    try
      OrcamentoVO.Id := AId;

      Obj.OpenSQL(TGenericDAO.SelectFrom<TOrcamentoVO>(OrcamentoVO, OrcamentoVO.Id));

      OrcamentoVO.Id              := Obj.Model.FieldByName('Orc_Id').AsInteger;
      OrcamentoVO.Numero          := Obj.Model.FieldByName('Orc_Numero').AsInteger;
      OrcamentoVO.Data            := Obj.Model.FieldByName('Orc_Data').AsDateTime;
      OrcamentoVO.IdUsuario       := Obj.Model.FieldByName('Orc_Usuario').AsInteger;
      OrcamentoVO.Observacao      := Obj.Model.FieldByName('Orc_Observacao').AsString;
      OrcamentoVO.ObservacaoEmail := Obj.Model.FieldByName('Orc_ObservacaoEmail').AsString;
      OrcamentoVO.IdCliente       := Obj.Model.FieldByName('Orc_Cliente').AsInteger;
      OrcamentoVO.Situacao        := Obj.Model.FieldByName('Orc_Situacao').AsInteger;
      OrcamentoVO.IdFormaPagto    := Obj.Model.FieldByName('Orc_FormaPagto').AsInteger;
      OrcamentoVO.RazaoSocial     := Obj.Model.FieldByName('Orc_RazaoSocial').AsString;
      OrcamentoVO.Fantasia        := Obj.Model.FieldByName('Orc_Fantasia').AsString;
      OrcamentoVO.Endereco        := Obj.Model.FieldByName('Orc_Endereco').AsString;
      OrcamentoVO.Telefone        := Obj.Model.FieldByName('Orc_Telefone').AsString;
      OrcamentoVO.Contato         := Obj.Model.FieldByName('Orc_Contato').AsString;
      OrcamentoVO.CnpjCpf         := Obj.Model.FieldByName('Orc_Dcto').AsString;
      OrcamentoVO.IdTipo          := Obj.Model.FieldByName('Orc_Tipo').AsInteger;
      OrcamentoVO.SubTipo         := Obj.Model.FieldByName('Orc_SubTipo').AsInteger;
      OrcamentoVO.EmailEnviado    := Obj.Model.FieldByName('Orc_EmailEnviado').AsBoolean;
      OrcamentoVO.DataSituacao    := Obj.Model.FieldByName('Orc_DataSituacao').AsDateTime;
      OrcamentoVO.Logradouro      := Obj.Model.FieldByName('Orc_Logradouro').AsString;
      OrcamentoVO.Bairro          := Obj.Model.FieldByName('Orc_Bairro').AsString;
      OrcamentoVO.CEP             := Obj.Model.FieldByName('Orc_CEP').AsString;
      OrcamentoVO.IdCidade        := Obj.Model.FieldByName('Orc_Cidade').AsInteger;
      OrcamentoVO.Fone1           := Obj.Model.FieldByName('Orc_Fone1').AsString;
      OrcamentoVO.Fone2           := Obj.Model.FieldByName('Orc_Fone2').AsString;
      OrcamentoVO.Celular         := Obj.Model.FieldByName('Orc_Celular').AsString;
      OrcamentoVO.FoneOutro       := Obj.Model.FieldByName('Orc_FoneOutro').AsString;
      OrcamentoVO.ContatoFinanceiro        := Obj.Model.FieldByName('Orc_ContatoFinanceiro').AsString;
      OrcamentoVO.ContatoFinanceiroFone    := Obj.Model.FieldByName('Orc_ContatoFinanceiroFone').AsString;
      OrcamentoVO.ContatoCompraVenda       := Obj.Model.FieldByName('Orc_ContatoCompraVenda').AsString;
      OrcamentoVO.ContatoCompraVendaFone   := Obj.Model.FieldByName('Orc_ContatoCompraVendaFone').AsString;
      OrcamentoVO.IE                       := Obj.Model.FieldByName('Orc_IE').AsString;
      OrcamentoVO.RepresentanteLegal       := Obj.Model.FieldByName('Orc_RepreLegal').AsString;
      OrcamentoVO.RepresentanteLegalCPF    := Obj.Model.FieldByName('Orc_RepreLegalCPF').AsString;

      ItensOrcamento(OrcamentoVO, obj);

      EmailOrcamento(OrcamentoVO, Obj);

      VenctosOrcamento(OrcamentoVO, Obj);

      ContatosOrcamento(OrcamentoVO);

      result := OrcamentoVO;
    except
      Result := OrcamentoVO;
    end;

  finally
    FreeAndNil(Obj);
  end;
end;

function TOrcamento.ProximoCodigo: Integer;
var
  obj: TParametros;
begin
  obj := TParametros.Create;
  try
    Result := obj.IncrementarSequencia(37);
  finally
    FreeAndNil(obj);
  end;
end;

function TOrcamento.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Orcamento'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TOrcamento.Relatorio(APrograma, AIdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoRelatorio(APrograma, AIdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

procedure TOrcamento.RelatorioGraficoPorMotivoNaoAprovado(var AQuery: TFDQuery;
  AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
var
  sb: TStringBuilder;
begin

  AFiltro.Situacao := '3';

  sb := TStringBuilder.Create;
  try
    sb.Append(' SELECT');
    sb.Append(' 	Tip_Codigo,');
    sb.Append(' 	Tip_Nome,');
    sb.Append(' 	Count(Orc_id) AS Qtde');
    sb.Append(' FROM Orcamento');
    sb.Append(' 	INNER JOIN Orcamento_NaoAprovado ON Orc_Id = OrcNap_Orcamento');
    sb.Append(' 	INNER JOIN Tipo ON OrcNAp_Tipo = Tip_Id');
    sb.Append('   LEFT JOIN Cliente ON Orc_Cliente = Cli_Id');
    sb.Append(Filtro(AFiltro, AIdUsuario));
    sb.Append(' GROUP BY');
    sb.Append(' 	tip_Codigo,');
    sb.Append(' 	Tip_Nome');

    AQuery.SQL.Text := sb.ToString();
  finally
    FreeAndNil(sb);
  end;
end;

procedure TOrcamento.RelatorioGraficoPorSituacao(var AQuery: TFDQuery;
  AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  try
    sb.Append(' SELECT');
    sb.Append(' 	CASE Orc_Situacao');
    sb.Append(' 		WHEN  1 THEN ''Em Analise''');
    sb.Append(' 		WHEN  2 THEN ''Aprovado''');
    sb.Append(' 		WHEN  3 THEN ''N�o Aprovado''');
    sb.Append('		  WHEN  4 THEN ''Faturado''');
    sb.Append(' 	END AS Situacao,');
    sb.Append(' 	Count(Orc_id) AS Qtde');
    sb.Append(' FROM Orcamento');
    sb.Append(' LEFT JOIN Cliente ON Orc_Cliente = Cli_Id');
    sb.Append(' 	LEFT JOIN Tipo ON Orc_Tipo = Tip_Id');
    sb.Append(Filtro(AFiltro, AIdUsuario));
    sb.Append(' GROUP BY');
    sb.Append(' 	Orc_Situacao');

    AQuery.SQL.Text := sb.ToString;
  finally
    FreeAndNil(sb);
  end;
end;

procedure TOrcamento.RelatorioGraficoPorTipo(var AQuery: TFDQuery;
  AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  try
    sb.Append(' SELECT');
    sb.Append(' 	Tip_Codigo,');
    sb.Append(' 	Tip_Nome,');
    sb.Append(' 	Count(Orc_id) AS Qtde');
    sb.Append(' FROM Orcamento');
    sb.Append(' 	LEFT JOIN Tipo ON Orc_Tipo = Tip_Id');
    sb.Append('   LEFT JOIN Cliente ON Orc_Cliente = Cli_Id');
    sb.Append(Filtro(AFiltro, AIdUsuario));
    sb.Append(' GROUP BY');
    sb.Append(' 	tip_Codigo,');
    sb.Append(' 	Tip_Nome');

    AQuery.SQL.Text := sb.ToString;
  finally
    FreeAndNil(sb);
  end;
end;

procedure TOrcamento.RelatorioGraficoPorUsuario(var AQuery: TFDQuery;
  AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  try
    sb.Append(' SELECT');
    sb.Append('   Usu_Codigo,');
    sb.Append('   Usu_Nome,');
    sb.Append('   Count(Orc_id) AS Qtde');
    sb.Append(' FROM Orcamento');
    sb.Append(' 	LEFT JOIN Usuario ON Orc_Usuario = Usu_Id');
    sb.Append(' 	LEFT JOIN Tipo ON Orc_Tipo = Tip_Id');
    sb.Append('   LEFT JOIN Cliente ON Orc_Cliente = Cli_Id');
    sb.Append(Filtro(AFiltro, AIdUsuario));
    sb.Append(' GROUP BY');
    sb.Append(' 	Usu_Codigo,');
    sb.Append(' 	Usu_Nome');

    AQuery.SQL.Text := sb.ToString;
  finally
    FreeAndNil(sb);
  end;

end;

procedure TOrcamento.RelatorioPorMotivoNaoAprovado(var AQuery: TFDQuery;
  AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  try
    sb.Append(' SELECT');
    sb.Append(' 	Orc_Id,');
    sb.Append(' 	Orc_Data,');
    sb.Append(' 	Orc_Situacao,');
    sb.Append(' 	Orc_DataSituacao,');
    sb.Append(' 	Orc_RazaoSocial,');
    sb.Append(' 	Usu_Codigo,');
    sb.Append(' 	Usu_Nome,');
    sb.Append(' 	Tip_Codigo,');
    sb.Append(' 	Tip_Nome,');
    sb.Append(' 	OrcNAp_Descricao,');
    sb.Append(' 	SUM(OrcIte_ValorLicencaImpl) - SUM(OrcIte_ValorDescImpl) AS Total_Orc,');
    sb.Append(' 	SUM(OrcIte_ValorLicencaMensal) - SUM(OrcIte_ValorDescMensal) AS Total_Mensal');
    sb.Append(' FROM Orcamento');
    sb.Append(' 	INNER JOIN Orcamento_Item ON Orc_Id = OrcIte_Orcamento');
    sb.Append(' 	INNER JOIN Usuario ON Orc_Usuario = Usu_Id');
    sb.Append(' 	LEFT JOIN Orcamento_NaoAprovado ON Orc_Id = OrcNap_Orcamento');
    sb.Append(' 	INNER JOIN Tipo ON OrcNAp_Tipo = Tip_Id');
    sb.Append('   LEFT JOIN Cliente ON Orc_Cliente = Cli_Id');
    sb.Append(Filtro(AFiltro, AIdUsuario));
    sb.Append(' GROUP BY');
    sb.Append(' 	Orc_Id,');
    sb.Append(' 	Orc_Data,');
    sb.Append(' 	Orc_Situacao,');
    sb.Append(' 	Orc_DataSituacao,');
    sb.Append(' 	Orc_RazaoSocial,');
    sb.Append(' 	Usu_Codigo,');
    sb.Append(' 	Usu_Nome,');
    sb.Append(' 	Tip_Codigo,');
    sb.Append(' 	Tip_Nome,');
    sb.Append(' 	OrcNAp_Descricao');

    AQuery.SQL.Text := sb.ToString;
  finally
    FreeAndNil(sb);
  end;
end;

procedure TOrcamento.RelatorioPorUsuarioTipo(var AQuery: TFDQuery;
  AFiltro: TFiltroOrcamento; AIdUsuario: Integer);
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  try
    sb.Append(' SELECT');
    sb.Append('	  Orc_Id,');
    sb.Append('	  Orc_Data,');
    sb.Append('	  Orc_DataSituacao,');
    sb.Append('	  Orc_RazaoSocial,');
    sb.Append('	  CASE Orc_Situacao');
    sb.Append('		  WHEN 1 THEN ''Em Analise''');
    sb.Append('		  WHEN 2 THEN ''Aprovado''');
    sb.Append('		  WHEN 3 THEN ''N�o Aprovado''');
    sb.Append('		  WHEN 4 THEN ''Faturado''');
    sb.Append('	  END AS Situacao,');
    sb.Append('	  Tip_Codigo,');
    sb.Append('	  Tip_Nome,');
    sb.Append('	  Usu_Codigo,');
    sb.Append('	  Usu_Nome,');
    sb.Append('	  SUM(OrcIte_ValorLicencaImpl) - SUM(OrcIte_ValorDescImpl) AS Total_Orc,');
    sb.Append('	  SUM(OrcIte_ValorLicencaMensal) - SUM(OrcIte_ValorDescMensal) AS Total_Mensal');
    sb.Append(' FROM Orcamento');
    sb.Append('	  INNER JOIN Orcamento_Item ON Orc_Id = OrcIte_Orcamento');
    sb.Append('	  INNER JOIN Usuario ON Orc_Usuario = Usu_Id');
    sb.Append('	  LEFT JOIN Tipo ON Orc_Tipo = Tip_Id');
    sb.Append('   LEFT JOIN Cliente ON Orc_Cliente = Cli_Id');
    sb.Append(Filtro(AFiltro, AIdUsuario));
    sb.Append(' GROUP BY');
    sb.Append('	  Orc_Id,');
    sb.Append('	  Orc_Data,');
    sb.Append('	  Orc_RazaoSocial,');
    sb.Append('	  Orc_Tipo,');
    sb.Append('	  Orc_DataSituacao,');
    sb.Append('	  Orc_Situacao,');
    sb.Append('	  Tip_Codigo,');
    sb.Append('	  Tip_Nome,');
    sb.Append('	  Usu_Codigo,');
    sb.Append('	  Usu_Nome');

    AQuery.SQL.Text := sb.ToString;
  finally
    FreeAndNil(sb);
  end;
end;

function TOrcamento.Replicar(AIdOrcamentoBase: Integer; var AspOrcamento,
  AspOrcamentoItem, AspOrcamentoVencto, AspOrcamentoModulo,
  AspOrcamentoOcorrencia: TFDStoredProc): Integer;
var
  OrcamentoVO: TOrcamentoVO;
  Modulo: TOrcamentoItemModuloVO;
  Email: TOrcamentoEmailVO;
  Vencto: TOrcamentoVectoVO;
  Item: TOrcamentoItemVO;
  contato: TContatoVO;
  IdItem: Integer;
  IdModulo: Integer;
  cDias: Double;
begin
  try
    OrcamentoVO := ObterPorId(AIdOrcamentoBase);
//==============================================================================
// itens
    IdItem := -1;
    for Item in OrcamentoVO.OrcamentoItem do
    begin
      Item.Id := IdItem;

      IdModulo := -1;
      for Modulo in OrcamentoVO.OrcamentoItemModulo do
      begin
        Modulo.Id := IdModulo;
        Modulo.IdOrcamentoItem := Item.Id;
        Dec(IdModulo);
      end;

      Dec(IdItem);
    end;
//==============================================================================
// Contatos
    for contato in OrcamentoVO.ListaContato do
      contato.Id := 0;
//==============================================================================
    for Email in OrcamentoVO.OrcamentoEmail do
      Email.Id := 0;

    for Vencto in OrcamentoVO.OrcamentoVecto do
    begin
      Vencto.Id := 0;
      cDias := TFuncoes.CalcularDias(OrcamentoVO.Data, Vencto.Data);
      Vencto.Data := Date + cDias;
    end;

    OrcamentoVO.Id    := 0;
    OrcamentoVO.Data  := Date;
    OrcamentoVO.DataSituacao := Date;
//==============================================================================
// salvar
    Result := Salvar( OrcamentoVO,
                      AspOrcamento,
                      AspOrcamentoItem,
                      AspOrcamentoOcorrencia,
                      AspOrcamentoVencto,
                      AspOrcamentoModulo);
  finally
    FreeAndNil(OrcamentoVO);
  end;
end;

function TOrcamento.RetornarEmailSupervisor(AIdUsuario: Integer): string;
var
  sEmail: string;
  Email: string;
  obj: TDepartamento;
  ListaEmail: TList<string>;
begin
  Result := '';
  obj := TDepartamento.Create;
  try
    sEmail := '';
    ListaEmail := obj.RetornarEmail(AIdUsuario);
    for Email in ListaEmail do
      sEmail := sEmail + Email + ';';

    if sEmail <> '' then
      Result := Copy(sEmail, 1, length(sEmail)-1);

  finally
    FreeAndNil(ListaEmail);
    FreeAndNil(obj);
  end;
end;

function TOrcamento.Salvar(AOrcamentoVO: TOrcamentoVO;
  var AspOrcamento: TFDStoredProc; var AspOrcamentoItem: TFDStoredProc;
  var AspOrcamentoOcorrencia: TFDStoredProc; var AspOrcamentoVencto: TFDStoredProc;
  var AspOrcamentoModulo: TFDStoredProc): Integer;
var
  sIU: string;
  Transacao: TServerMethods1;
  Id: Integer;
  sIE: string;
begin
  sIU := 'I';
  if AOrcamentoVO.Id > 0 then
    sIU := 'U';


  if AOrcamentoVO.Data = 0 then
    raise Exception.Create('Informe a Data do Or�amento!');

  if AOrcamentoVO.IdUsuario = 0 then
    raise Exception.Create('Informe o Usu�rio do Or�amento!');

  if AOrcamentoVO.RazaoSocial.Trim() = '' then
    raise Exception.Create('Informe a Raz�o Social do Or�amento!');

  if AOrcamentoVO.IdTipo = 0 then
    raise Exception.Create('Informe o Tipo!');

  if AOrcamentoVO.IdFormaPagto = 0 then
    raise Exception.Create('Informe a Forma de Pagamento!');

  if AOrcamentoVO.SubTipo = 0 then
    raise Exception.Create('Informe o Tipo (Telefone Ativo, Passivo, Visita Cliente...)');

//  sIE := TFuncoes.SomenteNumeros(AOrcamentoVO.IE);
//  if sIE <> '' then
//  begin
//    if Trim(AOrcamentoVO.Cliente.CidadeVO.UF) = '' then
//      raise Exception.Create('Informe o Estado(UF) do Cliente!');
//
//    if not (TValidaIE.InscEstadual(sIE, AOrcamentoVO.Cliente.CidadeVO.UF)) then
//      raise Exception.Create('Inscri��o Estadual Inv�lida para o Estado de ' + AOrcamentoVO.Cliente.CidadeVO.UF);
//  end;

  ValidarDocumento(AOrcamentoVO);


  if AOrcamentoVO.Id = 0 then
  begin
    AOrcamentoVO.Numero := IncrementarNumero();
    AOrcamentoVO.Situacao := 1; // em analise
    AOrcamentoVO.EmailEnviado := False;
  end;

  dm.StartTransacao();
  try
//    id :=  TGenericDAO.Save<TOrcamentoVO>(AOrcamentoVO);

    AspOrcamento.Close;
    AspOrcamento.ParamByName('@IU').AsString          := sIU;
    AspOrcamento.ParamByName('@Id').AsInteger         := AOrcamentoVO.Id;
    AspOrcamento.ParamByName('@Numero').AsInteger     := AOrcamentoVO.Numero;
    AspOrcamento.ParamByName('@Data').AsDate          := AOrcamentoVO.Data;
    AspOrcamento.ParamByName('@IdUsuario').AsInteger  := AOrcamentoVO.IdUsuario;
    AspOrcamento.ParamByName('@Obs').AsMemo           := AOrcamentoVO.Observacao;
    AspOrcamento.ParamByName('@ObsEmail').AsMemo      := AOrcamentoVO.ObservacaoEmail;
    AspOrcamento.ParamByName('@Situacao').AsInteger   := AOrcamentoVO.Situacao;

    if AOrcamentoVO.IdFormaPagto > 0 then
      AspOrcamento.ParamByName('@IdFormaPagto').AsInteger   := AOrcamentoVO.IdFormaPagto
    else
      AspOrcamento.ParamByName('@IdFormaPagto').Value := Null;


    if AOrcamentoVO.IdProspect > 0 then
      AspOrcamento.ParamByName('@IdProspect').AsInteger := AOrcamentoVO.IdProspect
    else
      AspOrcamento.ParamByName('@IdProspect').Value := null;

    if AOrcamentoVO.IdCliente > 0 then
      AspOrcamento.ParamByName('@IdCliente').AsInteger  := AOrcamentoVO.IdCliente
    else
      AspOrcamento.ParamByName('@IdCliente').Value  := null;

    if AOrcamentoVO.IdTipo > 0 then
      AspOrcamento.ParamByName('@IdTipo').AsInteger  := AOrcamentoVO.IdTipo
    else
      AspOrcamento.ParamByName('@IdTipo').Value  := null;

    AspOrcamento.ParamByName('@RazaoSocial').AsString := AOrcamentoVO.RazaoSocial;
    AspOrcamento.ParamByName('@Fantasia').AsString    := AOrcamentoVO.Fantasia;
    AspOrcamento.ParamByName('@Endereco').AsString    := AOrcamentoVO.Endereco;
    AspOrcamento.ParamByName('@Telefone').AsString    := AOrcamentoVO.Telefone;
    AspOrcamento.ParamByName('@Contato').AsString     := AOrcamentoVO.Contato;
    AspOrcamento.ParamByName('@Dcto').AsString        := AOrcamentoVO.CnpjCpf;
    AspOrcamento.ParamByName('@SubTipo').AsInteger    := AOrcamentoVO.SubTipo;
    AspOrcamento.ParamByName('@EmailEnviado').AsBoolean := AOrcamentoVO.EmailEnviado;
    AspOrcamento.ParamByName('@DataSituacao').AsDate := AOrcamentoVO.DataSituacao;
    AspOrcamento.ParamByName('@Logradouro').AsString := AOrcamentoVO.Logradouro;
    AspOrcamento.ParamByName('@Bairro').AsString := AOrcamentoVO.Bairro;
    AspOrcamento.ParamByName('@CEP').AsString := AOrcamentoVO.CEP;

    if AOrcamentoVO.IdCidade > 0 then
      AspOrcamento.ParamByName('@IdCidade').AsInteger := AOrcamentoVO.IdCidade
    else
      AspOrcamento.ParamByName('@IdCidade').Value := Null;

    AspOrcamento.ParamByName('@Fone1').AsString := AOrcamentoVO.Fone1;
    AspOrcamento.ParamByName('@Fone2').AsString := AOrcamentoVO.Fone2;
    AspOrcamento.ParamByName('@Celular').AsString := AOrcamentoVO.Celular;
    AspOrcamento.ParamByName('@FoneOutro').AsString := AOrcamentoVO.FoneOutro;
    AspOrcamento.ParamByName('@ContatoFinanceiro').AsString := AOrcamentoVO.ContatoFinanceiro;
    AspOrcamento.ParamByName('@ContatoFinanceiroFone').AsString := AOrcamentoVO.ContatoFinanceiroFone;
    AspOrcamento.ParamByName('@ContatoCompraVenda').AsString := AOrcamentoVO.ContatoCompraVenda;
    AspOrcamento.ParamByName('@ContatoCompraVendaFone').AsString := AOrcamentoVO.ContatoCompraVendaFone;
    AspOrcamento.ParamByName('@IE').AsString := AOrcamentoVO.IE;
    AspOrcamento.ParamByName('@RepreLegal').AsString := AOrcamentoVO.RepresentanteLegal;
    AspOrcamento.ParamByName('@RepreLegalCPF').AsString := AOrcamentoVO.RepresentanteLegalCPF;
    AspOrcamento.ParamByName('@Enquadramento').AsString := AOrcamentoVO.Enquadramento;

    AspOrcamento.ExecProc();

    id := AspOrcamento.ParamByName('@RetornoId').AsInteger;

    SalvarOrcamentoOcorrencia(Id, AOrcamentoVO, AspOrcamentoOcorrencia);
    SalvarOrcamentoVectos(Id, AOrcamentoVO, AspOrcamentoVencto);
    SalvarOrcamentoItem(id, AOrcamentoVO, AspOrcamentoItem, AspOrcamentoModulo);
    SalvarOrcamentoEmail(id, AOrcamentoVO);
    SalvarContatos(id, AOrcamentoVO);

    dm.Commit();

    Result := id;
  except
    On E: Exception do
    begin
      dm.Roolback();
      raise Exception.Create(E.Message);
    end;
  end;

end;

procedure TOrcamento.SalvarContatos(AIdOrcamento: Integer;
  AOrcamentoVO: TOrcamentoVO);
var
  objContato: TContato;
  model: TContatoVO;
begin
  ExcluirContatos(AIdOrcamento, AOrcamentoVO);

  objContato := TContato.Create;
  try
    for model in AOrcamentoVO.ListaContato do
    begin
      model.IdOrcamento := AIdOrcamento;
      objContato.Salvar(model);
    end;
  finally
    FreeAndNil(objContato);
  end;
end;

procedure TOrcamento.SalvarItemModulo(AIdItem, AIdItemOld: Integer; AOrcamentoVO: TOrcamentoVO;
  var AspItemModulo: TFDStoredProc);
var
  sIU: string;
  Id: Integer;
  Item: TOrcamentoItemModuloVO;
  IdItemOrcamento: Integer;
begin
  ExcluirOrcamentoItemModulo(AIdItem, AOrcamentoVO);

  for Item in AOrcamentoVO.OrcamentoItemModulo do
  begin
    sIU := 'I';
    if Item.Id > 0 then
      sIU := 'U';

    if AIdItem = 0 then
      raise Exception.Create('Informe o Id do Item M�dulo do Or�amento!');

    if Item.IdModulo = 0 then
      raise Exception.Create('Informe o M�dulo no Or�amento!');

    if Item.IdOrcamentoItem = AIdItemOld then
    begin
      Item.IdOrcamentoItem := AIdItem;

      AspItemModulo.Close;
      AspItemModulo.ParamByName('@IU').AsString                   := sIU;
      AspItemModulo.ParamByName('@Id').AsInteger                  := Item.Id;
      AspItemModulo.ParamByName('@IdOrcamentoItem').AsInteger     := Item.IdOrcamentoItem;
      AspItemModulo.ParamByName('@IdModulo').AsInteger            := Item.IdModulo;
      AspItemModulo.ParamByName('@Descricao').AsString            := Item.Descricao;
      AspItemModulo.ExecProc();

      Id := AspItemModulo.ParamByName('@RetornoId').AsInteger;
    end;
  end;
end;

procedure TOrcamento.SalvarOrcamentoEmail(AIdOrcamento: Integer;
  AOrcamentoVO: TOrcamentoVO);
var
  Item: TOrcamentoEmailVO;
begin

  ExcluirOrcamentoEmail(AIdOrcamento, AOrcamentoVO);

  for Item in AOrcamentoVO.OrcamentoEmail do
  begin
    if Item.Id = 0 then
      Item.IdOrcamento := AIdOrcamento;

    TGenericDAO.Save<TOrcamentoEmailVO>(Item);
  end;
end;

procedure TOrcamento.SalvarOrcamentoItem(AIdOrcamento: Integer; AOrcamentoVO: TOrcamentoVO;
  var AspItem: TFDStoredProc; var AspModulo: TFDStoredProc);
var
  sIU: string;
  Item: TOrcamentoItemVO;
  Id: Integer;
//  ValorTotal: Currency;
begin

  if AOrcamentoVO.OrcamentoItem.Count = 0 then
    raise Exception.Create('Informe os Itens do Or�amento!');

  ExcluirOrcamentoItem(AIdOrcamento, AOrcamentoVO);

  for Item in AOrcamentoVO.OrcamentoItem do
  begin
//    ValorTotal := Item.ValorLicencaImpl +
//                  Item.ValorDescImpl;

    Item.IdOrcamento := AIdOrcamento;

//    if ValorTotal <= 0 then
//      raise Exception.Create('Informe o Valor do �tem!');

    if Item.IdOrcamento = 0 then
      raise Exception.Create('Informe o Id do Or�amento no Item?');

    if Item.IdProduto = 0 then
      raise Exception.Create('Informe o Produto no Or�amento!');

    if Item.ValorLicencaImpl < 0 then
      raise Exception.Create('Valor Inicial Negativo!');

    if Item.ValorDescImpl < 0 then
      raise Exception.Create('Valor Desconto Inicial Negativo!');

    if Item.ValorLicencaMensal < 0 then
      raise Exception.Create('Valor Mensal Negativo!');

    if Item.ValorDescMensal < 0 then
      raise Exception.Create('Valor Descconto Mensal Negativo!');

    if Item.ValorDescImpl > Item.ValorLicencaImpl then
      raise Exception.Create('Valor Desconto Inicial maior que Valor Inicial!');

    if Item.ValorDescMensal > Item.ValorLicencaMensal then
      raise Exception.Create('Valor Desconto Mensal maior que Valor Mensal!');

    sIU := 'I';
    if Item.Id > 0 then
      sIU := 'U';

    Item.IdOrcamento := AIdOrcamento;

    AspItem.Close;
    AspItem.ParamByName('@IU').AsString                   := sIU;
    AspItem.ParamByName('@Id').AsInteger                  := Item.Id;
    AspItem.ParamByName('@IdOrcamento').AsInteger         := Item.IdOrcamento;
    AspItem.ParamByName('@IdProduto').AsInteger           := Item.IdProduto;
    AspItem.ParamByName('@Descricao').AsString            := Item.Descricao;
    AspItem.ParamByName('@ValorLicencaImpl').AsCurrency   := Item.ValorLicencaImpl;
    AspItem.ParamByName('@ValorDescImpl').AsCurrency      := Item.ValorDescImpl;
    AspItem.ParamByName('@ValorLicencaMensal').AsCurrency := Item.ValorLicencaMensal;
    AspItem.ParamByName('@ValorDescMensal').AsCurrency    := Item.ValorDescMensal;
    if Item.IdTipo <= 0 then
      AspItem.ParamByName('@IdTipo').Value := Null
    else
      AspItem.ParamByName('@IdTipo').AsInteger              := Item.IdTipo;

    if Item.IdStatus <= 0 then
      AspItem.ParamByName('@IdStatus').Value := Null
    else
      AspItem.ParamByName('@IdStatus').AsInteger            := Item.IdStatus;

    AspItem.ExecProc();

    Id := AspItem.ParamByName('@RetornoId').AsInteger;

    SalvarItemModulo(Id, Item.Id, AOrcamentoVO, AspModulo);
  end;

end;

procedure TOrcamento.SalvarOrcamentoOcorrencia(AIdOrcamento: Integer;
AOrcamentoVO: TOrcamentoVO; var AspOcorrencia: TFDStoredProc);
var
  sIU: string;
  Id: Integer;
  Item: TOrcamentoOcorrenciaVO;
begin
  ExcluirOrcamentoOcorrencia(AIdOrcamento, AOrcamentoVO);

  for Item in AOrcamentoVO.OrcamentoOcorrencia do
  begin
    if Item.Data < AOrcamentoVO.Data then
      raise Exception.Create('Data da Ocorr�ncia Menor que Data do Or�amento!');

//    if Item.Data > Date then
//      raise Exception.Create('Data da Ocorr�ncia n�o pode ser maior que data de Hoje!');

    sIU := 'I';
    if Item.Id > 0 then
      sIU := 'U';

    Item.IdOrcamento := AIdOrcamento;

    AspOcorrencia.Close;
    AspOcorrencia.ParamByName('@IU').AsString                   := sIU;
    AspOcorrencia.ParamByName('@Id').AsInteger                  := Item.Id;
    AspOcorrencia.ParamByName('@IdOrcamento').AsInteger         := Item.IdOrcamento;
    AspOcorrencia.ParamByName('@Data').AsDate                   := Item.Data;
    AspOcorrencia.ParamByName('@IdUsuario').AsInteger           := Item.IdUsuario;
    AspOcorrencia.ParamByName('@Descricao').AsString            := Item.Descricao;
    AspOcorrencia.ExecProc();

//    Id := AspOcorrencia.ParamByName('@RetornoId').AsInteger;
  end;
end;

procedure TOrcamento.SalvarOrcamentoVectos(AIdOrcamento: Integer;
  AOrcamentoVO: TOrcamentoVO; var AspVencto: TFDStoredProc);
var
  sIU: string;
  Item: TOrcamentoVectoVO;
  TotalLiquido: Currency;
  TotalParcelas: Currency;
begin
  if AOrcamentoVO.OrcamentoVecto.Count = 0 then
    Exit;

  ExcluirOrcamentoVenctos(AIdOrcamento, AOrcamentoVO);

  TotalLiquido  := AOrcamentoVO.TotalLiquido;
  TotalParcelas := AOrcamentoVO.TotalParcelas;


  if TotalLiquido <> TotalParcelas then
    raise Exception.Create('Valor Total das Parcelas diferente do Valor do Or�amento! ');

  for Item in AOrcamentoVO.OrcamentoVecto do
  begin
    sIU := 'I';
    if Item.Id > 0 then
      sIU := 'U';

    if Item.Data < AOrcamentoVO.Data then
      raise Exception.Create('Data do Vencimento Menor que a Data do Or�amento!');

    Item.IdOrcamento := AIdOrcamento;

    AspVencto.Close;
    AspVencto.ParamByName('@IU').AsString                   := sIU;
    AspVencto.ParamByName('@Id').AsInteger                  := Item.Id;
    AspVencto.ParamByName('@IdOrcamento').AsInteger         := Item.IdOrcamento;
    AspVencto.ParamByName('@Parcela').AsInteger             := Item.Parcela;
    AspVencto.ParamByName('@Data').AsDate                   := Item.Data;
    AspVencto.ParamByName('@Valor').AsCurrency              := Item.Valor;
    AspVencto.ParamByName('@Descricao').AsString            := Item.Descricao;
    AspVencto.ExecProc();
  end;
end;

function TOrcamento.UsuarioIgualCadastro(AId, AIdUsuario,
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
      obj.OpenSQL('SELECT Orc_Usuario FROM Orcamento WHERE Orc_Id = ' + IntToStr(AId));
      Result  := (obj.Model.FieldByName('Orc_Usuario').AsInteger = AIdUsuario);
    finally
      FreeAndNil(obj);
    end;
  end;
end;

procedure TOrcamento.ValidarDocumento(AOrcamento: TOrcamentoVO);
var
  sDocumento: string;
  sCPF: string;
begin
  sDocumento := TFuncoes.SomenteNumeros(AOrcamento.CnpjCpf);
  if sDocumento.Length = 11 then
    TValidacao.ValidaCPF(sDocumento);

  if sDocumento.Length > 11 then
    TValidacao.ValidaCNPJ(sDocumento);

  sCPF := TFuncoes.SomenteNumeros(AOrcamento.RepresentanteLegalCPF);
  if sCPF.Length = 11 then
    TValidacao.ValidaCPF(sCPF);
end;

procedure TOrcamento.VenctosOrcamento(AOrcamentoVO: TOrcamentoVO;
  AObj: TFireDAC);
var
  VenctoVO,
  Vencto: TOrcamentoVectoVO;
begin
  VenctoVO := TOrcamentoVectoVO.Create;
  try
    AObj.Lista.Clear;
    AObj.Lista.Add(TGenericDAO.Select<TOrcamentoVectoVO>(VenctoVO, False));
    AObj.Lista.Add(' FROM Orcamento_Vectos');
    AObj.Lista.Add(' WHERE OrcVect_Orcamento = ' + IntToStr(AOrcamentoVO.Id));
    AObj.OpenSQL();

    while not AObj.Model.Eof do
    begin
      Vencto := TOrcamentoVectoVO.Create;
      Vencto.Id           := AObj.Model.FieldByName('OrcVect_Id').AsInteger;
      Vencto.IdOrcamento  := AOrcamentoVO.Id;
      Vencto.Parcela      := AObj.Model.FieldByName('OrcVect_Parcela').AsInteger;
      Vencto.Data         := AObj.Model.FieldByName('OrcVect_Data').AsDateTime;
      Vencto.Valor        := AObj.Model.FieldByName('OrcVect_Valor').AsCurrency;
      Vencto.Descricao    := AObj.Model.FieldByName('OrcVect_Descricao').AsString;

      AOrcamentoVO.OrcamentoVecto.Add(Vencto);
      AObj.Model.Next;
    end;
  finally
    FreeAndNil(VenctoVO);
  end;
end;

procedure TOrcamento.Salvar(APrograma, AIdUsuario: Integer);
begin
// nada
end;

end.