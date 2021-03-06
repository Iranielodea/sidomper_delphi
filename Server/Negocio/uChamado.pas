unit uChamado;

interface

uses
  uDM, System.SysUtils, FireDAC.Stan.Param, uFiltroChamado, uUsuario,
  Data.DB, System.Variants,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uChamadoStatusVO,
  uDMChamado, uChamadoVO, System.Generics.Collections, uChamadoStatus, uChamadoColaboradorVO,
  uFireDAC, System.DateUtils, uChamadoQuadroViewModel, uGenericDAO;

  const CConsulta: string =
  ' SELECT'
	+'  Cha_Id,'
	+'  Cha_Descricao,'
	+'  Cha_DataAbertura,'
	+'  Cha_HoraAbertura,'
	+'  Sta_Nome,'
  +'  Cli_Perfil,'
  +'  Cha_Status,'
	+'  Tip_Nome,'
  +'  Cli_Nome,'
  +'  Cli_Fantasia,'
  +'  CASE Cha_Nivel'
  +'    WHEN 1 THEN ''1-Baixo'''
  +'    WHEN 2 THEN ''2-Normal'''
  +'    WHEN 3 THEN ''3-Alto'''
  +'    WHEN 4 THEN ''4-Cr�tico'''
  +'  END AS Cha_Nivel,'
	+'  Usu_Nome'
  +' FROM Chamado'
  +' 	INNER JOIN Status  ON Cha_Status = Sta_Id'
  +' 	INNER JOIN Tipo    ON Cha_Tipo = Tip_Id'
  +'  INNER JOIN Cliente ON Cha_Cliente = Cli_Id'
  +' 	INNER JOIN Usuario ON Cha_UsuarioAbertura = Usu_Id'
  +'  LEFT JOIN Revenda ON Cli_Revenda = Rev_Id';

type
  TChamado = class(TInterfacedObject, ICadastroInterface)
  private
    function DataIngles(AData: string): string;
    function FiltrarRelatorios(AFiltro: TFiltroChamado; AIdUsuario: integer;
        ATipoUsuario: string; ATipo: TEnumChamadoAtividade): string;
    procedure SalvarOcorrencia(AIdChamado: Integer; AChamado: TChamadoVO;
      AspOcorrencia: TFDStoredProc);
    procedure SalvarOcorrenciaColaborador(AIdOcorrenciaNew, AIdOcorrenciaOld: Integer;
      AChamadoVO: TChamadoVO);
    procedure ExcluirOcorrencia(AIdChamado: Integer; AChamadoVO: TChamadoVO);
    procedure ExcluirOcorrenciaColaborador(AIdChamadoNew: Integer; AChamadoVO: TChamadoVO);
    function RetornarStatus(AIdChamado: Integer): Integer;
    function UsuarioIgualCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;
    procedure RelatorioModeloMeses_06(AFiltro: TFiltroChamado; AIdUsuario: integer;
      ATipo: TEnumChamadoAtividade; ARev_Codigo, ATip_Codigo: Integer);
    procedure RelatorioModeloMeses_07(AFiltro: TFiltroChamado; AIdUsuario: integer;
      ATipo: TEnumChamadoAtividade; AUsu_IdUsuario: Integer);
    function SqlString(AValor: string): string;
    function SqlInt(AValor: Integer): string;
    function SqlDouble(AValor: Double): string;
    function RetornarSQLQuadro(AIdUsuario, AIdRevenda, AParCodigo: Integer; ACampoQuadro: string; ATipo: TEnumChamadoAtividade): string;
  public
    procedure Novo(APrograma, AIdUsuario: Integer);
    procedure Excluir(APrograma, AIdUsuario, AId: Integer);
    function Editar(APrograma, AIdUsuario: Integer): Boolean;
    function Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = True): string;

    function FiltrarChamado(AFiltro: TFiltroChamado; ACampo, ATexto: string;
        AIdUsuario: Integer; AContem: Boolean = True; ATipo: TEnumChamadoAtividade = caChamado): string;

    function FiltrarId(AIdChamado: Integer): string;
    function FiltrarCodigo(ACodigo: integer): string;
    function LocalizarId(var AQry: TFDQuery; AId: integer): Boolean;
    procedure LocalizarCodigo(var AQry: TFDQuery; ACodigo: integer);
    procedure Salvar(APrograma, AIdUsuario: Integer); overload;
    function ProximoCodigo: Integer;
    procedure Relatorio(APrograma, AIdUsuario: Integer);
    function ProximoId: Integer;
    procedure LocalizarChamadoStatus(var AQry: TFDQuery; AIdChamado: Integer);
    procedure SalvarStatus(AIdUsuario: Integer; AChamado: TChamadoVO);
    function ListarProblemaSolucao(AFiltro: TFiltroChamado; ATexto: string; AIdUsuario: Integer; ATipo: TEnumChamadoAtividade): string;
    function RetornaSQLQuadro(AIdUsuario, AParametro: Integer): string;
    function Salvar(AChamadoVO: TChamadoVO; AspChamado: TFDStoredProc;
      AspChamadoOcorrencia: TFDStoredProc): Integer; overload;
    function ChamadoUsduarioIgualCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;
    function BuscarTotalHorasDoChamado(AIdChamado: Integer): Double;
    function RetornarChamadoQuadro(AIdUsuario, AIdRevenda: Integer): string;
    function RetornarAtividadeQuadro(AIdUsuario, AIdRevenda: Integer): string;
    function ListarQuadro(AQuery: TFDQuery): TObjectList<TChamadoQuadroViewModel>;
    function VerificarChamadoAberto(AIdUsuario: Integer): Boolean;
    function VerificarAtividadeAberto(AIdUsuario: Integer): Boolean;
    function VerificarSolicitacaoAberto(AIdUsuario: Integer): Boolean;
//------------------------------------------------------------------------------
// Ocorrencias
//------------------------------------------------------------------------------
    function OcorrenciaUsuarioIgualCadastro(AIdOcorrencia, AIdUsuario, ATipoOperacao: Integer): Boolean;
//------------------------------------------------------------------------------
// Relat�rios de chamados
//------------------------------------------------------------------------------
    function RelatorioModelo_01(AFiltro: TFiltroChamado; AIdUsuario: integer;
      ATipo: TEnumChamadoAtividade): string;
    function RelatorioModelo_02(AFiltro: TFiltroChamado; AIdUsuario: integer; Ordem:
        string; ATipo: TEnumChamadoAtividade): string;
    function RelatorioModelo_03(AFiltro: TFiltroChamado; AIdUsuario: integer; Ordem:
        string; ATipo: TEnumChamadoAtividade): string;
    function RelatorioModelo_04(AFiltro: TFiltroChamado; AIdUsuario: integer; Ordem:
        string; ATipo: TEnumChamadoAtividade): string;
    function RelatorioModelo_05(AFiltro: TFiltroChamado; AIdUsuario: integer; Ordem:
        string; ATipo: TEnumChamadoAtividade): string;
    procedure RelatorioModelo_06(AFiltro: TFiltroChamado; AIdUsuario: integer;
      ATipo: TEnumChamadoAtividade);
    procedure RelatorioModelo_07(AFiltro: TFiltroChamado; AIdUsuario: integer;
      ATipo: TEnumChamadoAtividade);
    function RelatorioModelo_08(AFiltro: TFiltroChamado; AIdUsuario: integer; Ordem:
        string; ATipo: TEnumChamadoAtividade): string;
    function RelatorioModelo_09(AFiltro: TFiltroChamado; AIdUsuario: integer; Ordem:
        string; ATipo: TEnumChamadoAtividade): string;
  end;

implementation

{ TRevenda }

uses uFuncoesServidor, uChamadoOcorrenciaVO;


procedure TChamado.LocalizarChamadoStatus(var AQry: TFDQuery; AIdChamado:
    Integer);
begin
  AQry.Close;
  AQry.Params[0].AsInteger := AIdChamado;
  AQry.Open();
end;

function TChamado.ListarProblemaSolucao(AFiltro: TFiltroChamado; ATexto: string;
AIdUsuario: Integer; ATipo: TEnumChamadoAtividade): string;
var
  sb: TStringBuilder;
  sTexto: string;
  Usuario: TUsuario;
begin
  sTexto := '''%' + ATexto + '%''';

  sb := TStringBuilder.Create;
  try
    sb.AppendLine(' SELECT ');
    sb.AppendLine('   ChOco_Chamado,');
    sb.AppendLine('   ChOco_Data,');
    sb.AppendLine('   ChOco_HoraInicio,');
    sb.AppendLine('   ChOco_HoraFim,');
    sb.AppendLine('   ChOco_DescricaoSolucao,');
    sb.AppendLine('   ChOco_DescricaoTecnica,');
    sb.AppendLine('   Usu_Nome');
    sb.AppendLine(' FROM Chamado_Ocorrencia');
    sb.AppendLine('   INNER JOIN Chamado ON ChOco_Chamado = Cha_Id');
    sb.AppendLine('   INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
    sb.AppendLine('   INNER JOIN Usuario ON ChOco_Usuario = Usu_Id	');
    sb.AppendLine(' WHERE ((ChOco_DescricaoTecnica LIKE ' + sTexto + ') OR (ChOco_DescricaoSolucao LIKE ' + sTexto + '))');

    if ATipo = caChamado then
      sb.AppendLine(' AND cha_TipoMovimento = 1')
    else
      sb.AppendLine(' AND cha_TipoMovimento = 2');

    if AFiltro.IdCliente <> '' then
      sb.AppendLine(' AND Cha_Cliente IN ' + AFiltro.IdCliente);

    Usuario := TUsuario.Create;
    try
      sb.AppendLine(Usuario.RetornaPermissaoUsuarioDepartamento(AIdUsuario));
    finally
      FreeAndNil(Usuario);
    end;

    sb.AppendLine(' ORDER BY ChOco_Data');

    Result := sb.ToString();
  finally
    FreeAndNil(sb);
  end;
end;

function TChamado.ListarQuadro(
  AQuery: TFDQuery): TObjectList<TChamadoQuadroViewModel>;
var
  viewModel: TChamadoQuadroViewModel;
  lista: TObjectList<TChamadoQuadroViewModel>;
begin

  lista := TObjectList<TChamadoQuadroViewModel>.Create();

  AQuery.First;
  while not AQuery.Eof do
  begin
    viewModel := TChamadoQuadroViewModel.Create;
    viewModel.Quadro                := AQuery.FieldByName('Quadro').AsString;
    viewModel.IdChamado             := AQuery.FieldByName('Cha_Id').AsInteger;
    viewModel.DataAbertura          := AQuery.FieldByName('Cha_DataAbertura').AsDateTime;
    viewModel.HoraAbertura          := AQuery.FieldByName('Cha_HoraAbertura').AsDateTime;
    viewModel.Nivel                 := AQuery.FieldByName('Nivel').AsInteger;
    viewModel.Cha_Nivel             := AQuery.FieldByName('cha_Nivel').AsString;
    viewModel.IdUsuarioAtendeAtual  := AQuery.FieldByName('Cha_UsuarioAtendeAtual').AsInteger;
    viewModel.UltimaData            := AQuery.FieldByName('UltimaData').AsDateTime;
    viewModel.HoraAtendeAtual       := AQuery.FieldByName('cha_HoraAtendeAtual').AsDateTime;
    viewModel.ParCodigo             := AQuery.FieldByName('Par_Codigo').AsInteger;
    viewModel.Cliente.Codigo        := AQuery.FieldByName('Cli_Codigo').AsInteger;
    viewModel.Status.Codigo         := AQuery.FieldByName('Sta_Codigo').AsInteger;
    viewModel.Tipo.Nome             := AQuery.FieldByName('Tip_Nome').AsString;
    viewModel.Usuario.Nome          := AQuery.FieldByName('Usu_Nome').AsString;
    viewModel.Cliente.RazaoSocial   := AQuery.FieldByName('Cli_Nome').AsString;
    viewModel.UltimaHora            := AQuery.FieldByName('UltimaHora').AsDateTime;
    viewModel.Cliente.Perfil        := AQuery.FieldByName('Cli_Perfil').AsString;

    lista.Add(viewModel);
    AQuery.Next;
  end;
  Result := lista;
end;

function TChamado.BuscarTotalHorasDoChamado(AIdChamado: Integer): Double;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT SUM(ChOco_TotalHoras) FROM Chamado_Ocorrencia WHERE ChOco_Chamado = ' + IntToStr(AIdChamado));
    Result := obj.Model.Fields[0].AsFloat;
  finally
    FreeAndNil(obj);
  end;
end;

function TChamado.ChamadoUsduarioIgualCadastro(AId, AIdUsuario,
  ATipoOperacao: Integer): Boolean;
var
  obj: TFireDAC;
begin
{
   ATipoOperacao = 2-Edicao 3-Exclusao
}

  Result := False;
  if (ATipoOperacao = 2) or (ATipoOperacao = 3) then
  begin
    obj := TFireDAC.create;
    try
      obj.Lista.Clear();
      obj.Lista.Add(' SELECT Cha_UsuarioAbertura FROM Chamado');
      obj.Lista.Add(' WHERE Cha_Id = ' + IntToStr(AId));
      obj.OpenSQL();

      Result := (obj.Model.FieldByName('Cha_UsuarioAbertura').AsInteger = AIdUsuario);
    finally
      FreeAndNil(obj);
    end;
  end;
end;

function TChamado.DataIngles(AData: string): string;
begin
  Result := TFuncoes.DataIngles(AData);
end;

function TChamado.Editar(APrograma, AIdUsuario: Integer): Boolean;
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    Result := usuario.PermissaoEditar(APrograma, AIdUsuario);
//    if Result then
//      Result := usuario.UsuarioADM(AIdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

procedure TChamado.Excluir(APrograma, AIdUsuario, AId: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(APrograma, AIdUsuario);
  finally
    FreeAndNil(usuario);
  end;
  DM.ExecutarSQL('DELETE FROM Chamado WHERE Cha_Id = ' + IntToStr(AId));
end;

procedure TChamado.ExcluirOcorrencia(AIdChamado: Integer;
  AChamadoVO: TChamadoVO);
var
  lQry: TFDQuery;
  Id: Integer;
  Item: TChamadoOcorrenciaVO;
  achou: Boolean;
begin
// se na lista de objetos n�o tiver registro e no banco de dados sim
// ent�o excluir do banco de dados o registro da lista de objectos

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT ChOco_Id FROM Chamado_Ocorrencia WHERE ChOco_Chamado = ' + IntToStr(AIdChamado);
    lQry.Open();

    while not lQry.Eof do
    begin
      id := lQry.Fields[0].AsInteger;
      achou := False;

      for Item in AChamadoVO.ListaChamadoOcorrencia do
      begin
        if Item.Id = id then
          achou := True;
      end;

      if achou = False then
        dm.ExecutarSQL('DELETE FROM Chamado_Ocorrencia WHERE ChOco_Id = ' + Id.ToString());

      lQry.Next;
    end;

  finally
    FreeAndNil(lQry);
  end;
end;

procedure TChamado.ExcluirOcorrenciaColaborador(AIdChamadoNew: Integer;
  AChamadoVO: TChamadoVO);
var
  lQry: TFDQuery;
  Id: Integer;
  Item: TChamadoColaboradorVO;
  achou: Boolean;
begin
// se na lista de objetos n�o tiver registro e no banco de dados sim
// ent�o excluir do banco de dados o registro da lista de objectos

  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT ChaOCol_Id FROM Chamado_Ocorr_Colaborador WHERE ChaOCol_ChamadoOcorrencia = ' + IntToStr(AIdChamadoNew);
    lQry.Open();

    while not lQry.Eof do
    begin
      id := lQry.Fields[0].AsInteger;
      achou := False;

      for Item in AChamadoVO.ListaChamadoColaborador do
      begin
        if Item.Id = id then
          achou := True;
      end;

      if achou = False then
        dm.ExecutarSQL('DELETE FROM Chamado_Ocorr_Colaborador WHERE ChaOCol_Id = ' + Id.ToString());

      lQry.Next;
    end;

  finally
    FreeAndNil(lQry);
  end;
end;

function TChamado.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + ATexto + '%''';
  if AContem then
    sTexto := '''%' + ATexto + '%''';

  sConsulta := CConsulta + ' WHERE ' + ACampo + ' LIKE ' + sTexto;
//  sConsulta := sConsulta + ' ORDER BY ' + ACampo;

  Result := sConsulta;
end;

function TChamado.FiltrarChamado(AFiltro: TFiltroChamado; ACampo, ATexto: string;
    AIdUsuario: Integer; AContem: Boolean = True; ATipo: TEnumChamadoAtividade = caChamado): string;
var
  sConsulta: string;
  sTexto: string;
  Usuario: TUsuario;
begin
  sTexto := '''' + ATexto + '%''';
  if AContem then
    sTexto := '''%' + ATexto + '%''';

  Usuario := TUsuario.Create;
  try
    if ATexto <> '' then
      sConsulta := CConsulta + ' WHERE ' + ACampo + ' LIKE ' + sTexto
    else
      sConsulta := CConsulta + ' WHERE Cha_Id > 0';

    if AFiltro.Id > 0 then
      sConsulta := sConsulta + ' AND Cha_Id = ' + AFiltro.Id.ToString;

    if ATipo = caChamado then
      sConsulta := sConsulta + ' AND Cha_TipoMovimento = 1'
    else
      sConsulta := sConsulta + ' AND Cha_TipoMovimento = 2';

    sConsulta := sConsulta +  Usuario.RetornaPermissaoUsuarioDepartamento(AIdUsuario);
  finally
    FreeAndNil(Usuario);
  end;

  if Trim(AFiltro.DataInicial) <> DataEmBranco then
    sConsulta := sConsulta + ' AND Cha_DataAbertura >= ' + DataIngles(AFiltro.DataInicial);

  if Trim(AFiltro.DataFinal) <> DataEmBranco then
    sConsulta := sConsulta + ' AND Cha_DataAbertura <= ' + DataIngles(AFiltro.DataFinal);

  if AFiltro.IdCliente <> '' then
    sConsulta := sConsulta + ' AND Cha_Cliente IN' + AFiltro.IdCliente;

  if AFiltro.IdTipo <> '' then
    sConsulta := sConsulta + ' AND Cha_Tipo IN' + AFiltro.IdTipo;

  if AFiltro.IdStatus <> '' then
    sConsulta := sConsulta + ' AND Cha_Status IN' + AFiltro.IdStatus;

  if AFiltro.Modulo.IdStr <> '' then
    sConsulta := sConsulta + ' AND Cha_Modulo IN' + AFiltro.Modulo.IdStr;

  if AFiltro.Revenda.IdStr <> '' then
    sConsulta := sConsulta + ' AND Rev_Id IN' + AFiltro.Revenda.IdStr;

  if AFiltro.IdUsuarioAbertura <> '' then
    sConsulta := sConsulta + ' AND Cha_UsuarioAbertura IN' + AFiltro.IdUsuarioAbertura;

  if AFiltro.Cliente.IdUsuario <> '' then
    sConsulta := sConsulta + ' AND Cli_Usuario IN ' +  AFiltro.Cliente.IdUsuario;

  if AFiltro.Cliente.Perfil.Trim() <> '' then
    sConsulta := sConsulta + ' AND Cli_Perfil = ' + QuotedStr(AFiltro.Cliente.Perfil);

  if AFiltro.Origem > 0 then
    sConsulta := sConsulta + ' AND Cha_Origem = ' +  AFiltro.Origem.ToString;
  Result := sConsulta;
end;

function TChamado.FiltrarCodigo(ACodigo: integer): string;
begin
  Result := CConsulta + ' WHERE Cha_Id = ' + ACodigo.ToString();
end;

function TChamado.FiltrarId(AIdChamado: Integer): string;
begin
  Result := CConsulta + ' WHERE Cha_Id = ' + AIdChamado.ToString();
end;

function TChamado.FiltrarRelatorios(AFiltro: TFiltroChamado; AIdUsuario: integer;
        ATipoUsuario: string; ATipo: TEnumChamadoAtividade): string;
var
  sConsulta: string;
  lChamado: TDMChamado;
  Usuario: TUsuario;
begin
{
  ATipoUsuario:
  CAB - Cabe�alho
  OCO - Ocorr�ncia
}
  sConsulta :=  ' WHERE Cha_TipoMovimento = ' + Integer(ATipo).ToString();

  Usuario := TUsuario.Create;
  try
    sConsulta := sConsulta +  Usuario.RetornaPermissaoUsuarioDepartamento(AIdUsuario);
  finally
    FreeAndNil(Usuario);
  end;

  if ATipoUsuario = 'CAB' then
  begin
    if Trim(AFiltro.DataInicial) <> DataEmBranco then
      sConsulta := sConsulta + ' AND Cha_DataAbertura >= ' + DataIngles(AFiltro.DataInicial);

    if Trim(AFiltro.DataFinal) <> DataEmBranco then
      sConsulta := sConsulta + ' AND Cha_DataAbertura <= ' + DataIngles(AFiltro.DataFinal);
  end
  else begin
    if Trim(AFiltro.DataInicial) <> DataEmBranco then
      sConsulta := sConsulta + ' AND ChOco_Data >= ' + DataIngles(AFiltro.DataInicial);

    if Trim(AFiltro.DataFinal) <> DataEmBranco then
      sConsulta := sConsulta + ' AND ChOco_Data <= ' + DataIngles(AFiltro.DataFinal);
  end;

  if AFiltro.IdCliente <> '' then
    sConsulta := sConsulta + ' AND Cha_Cliente IN' + AFiltro.IdCliente;

  if AFiltro.Modulo.IdStr <> '' then
    sConsulta := sConsulta + ' AND Cha_Modulo IN' + AFiltro.Modulo.IdStr;

  if AFiltro.IdTipo <> '' then
    sConsulta := sConsulta + ' AND Cha_Tipo IN' + AFiltro.IdTipo;

  if AFiltro.IdStatus <> '' then
    sConsulta := sConsulta + ' AND Cha_Status IN' + AFiltro.IdStatus;

  if AFiltro.Cliente.IdUsuario <> '' then
    sConsulta := sConsulta + ' AND Cli_Usuario IN' + AFiltro.Cliente.IdUsuario;

  if AFiltro.Cliente.Perfil.Trim() <> '' then
    sConsulta := sConsulta + ' AND Cli_Perfil = ' + QuotedStr(AFiltro.Cliente.Perfil);

  if AFiltro.IdUsuarioAbertura <> '' then
  begin
    if ATipoUsuario = 'CAB' then
      sConsulta := sConsulta + ' AND Cha_UsuarioAbertura IN' + AFiltro.IdUsuarioAbertura
    else if ATipoUsuario = 'OCO' then
      sConsulta := sConsulta + ' AND ChOco_Usuario IN' + AFiltro.IdUsuarioAbertura;
  end;

  if AFiltro.Revenda.IdStr <> '' then
    sConsulta := sConsulta + ' AND Rev_Id IN' + AFiltro.Revenda.IdStr;

  if AFiltro.Id > 0 then
    sConsulta := sConsulta + ' AND Cha_Id = ' + AFiltro.Id.ToString();

  if AFiltro.Origem > 0 then
    sConsulta := sConsulta + ' AND Cha_Origem = ' + AFiltro.Origem.ToString();

  Result := sConsulta;
end;

procedure TChamado.LocalizarCodigo(var AQry: TFDQuery; ACodigo: integer);
begin
  //
end;

function TChamado.LocalizarId(var AQry: TFDQuery; AId: integer): Boolean;
begin
  AQry.Close;
  AQry.Params[0].AsInteger := AId;
  AQry.Open();

  Result := (not AQry.IsEmpty);
end;

procedure TChamado.Novo(APrograma, AIdUsuario: Integer);
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

function TChamado.OcorrenciaUsuarioIgualCadastro(AIdOcorrencia,
  AIdUsuario, ATipoOperacao: Integer): Boolean;
var
  obj: TFireDAC;
begin
{
   ATipoOperacao = 2-Edicao 3-Exclusao
}

  Result := False;
  if (ATipoOperacao = 2) or (ATipoOperacao = 3) then
  begin
    obj := TFireDAC.create;
    try
      obj.Lista.Clear();
      obj.Lista.Add(' SELECT ChOco_Usuario FROM Chamado_Ocorrencia');
      obj.Lista.Add(' WHERE ChOco_Id = ' + IntToStr(AIdOcorrencia));
      obj.OpenSQL();

      Result := (obj.Model.FieldByName('ChOco_Usuario').AsInteger = AIdUsuario);
    finally
      FreeAndNil(obj);
    end;
  end;
end;

function TChamado.ProximoCodigo: Integer;
begin
  Result := 0;
end;

function TChamado.ProximoId: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(''Chamado'')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

procedure TChamado.Relatorio(APrograma, AIdUsuario: Integer);
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

procedure TChamado.RelatorioModeloMeses_06(AFiltro: TFiltroChamado;
  AIdUsuario: integer; ATipo: TEnumChamadoAtividade; ARev_Codigo,
  ATip_Codigo: Integer);
var
  obj: TFireDAC;
  objInsert: TFireDAC;
  sConsulta: string;
//  iContador: Integer;
  Qtde: array[1..12] of Integer;
  Horas: array[1..12] of Double;
  Mes: array[1..12] of Integer;
  Ano: array[1..12] of Integer;
  MesAno: array[1..12] of string;
  sb: TStringBuilder;
  sHoras: string;
  iMes: Word;
  iAno: Word;
  i: Word;
  sDataInicial: string;
  sDataFinal: string;
  sMesAnoFim: string;
  sMesAno2: string;
begin
  sDataInicial := AFiltro.DataInicial;
  sDataFinal := AFiltro.DataFinal;

  iMes := MonthOf(StrToDate(sDataInicial));
  iAno := YearOf(StrToDate(sDataInicial));

  sMesAnoFim := '01/' + IntToStr(MonthOf(StrToDate(sDataFinal))) + '/' + IntToStr(YearOf(StrToDate(sDataFinal)));

  for i := 1 to 12 do
  begin
    Qtde[i]   := 0;
    Horas[i]  := 0;
    Mes[i]    := 0;
    Ano[i]    := 0;
    MesAno[i] := '';
  end;


  AFiltro.DataInicial := DataEmBranco;
  AFiltro.DataFinal := DataEmBranco;

  sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'CAB', ATipo);

  AFiltro.DataInicial := sDataInicial;
  AFiltro.DataFinal := sDataFinal;

  objInsert := TFireDAC.create;
  obj := TFireDAC.create;
  sb := TStringBuilder.Create;

  try
    for I := 1 to 12 do
    begin

      if iMes > 12 then
      begin
        iMes := 1;
        Inc(iAno);
      end;

      sMesAno2 := '01/' + IntToStr(iMes) + '/' + IntToStr(iAno);

      if StrToDate(sMesAno2) > StrToDate(sMesAnoFim) then
      begin
        inc(iMes);
        Continue;
      end;

      obj.Lista.Clear;
      obj.Lista.Add(' SELECT ');
      obj.Lista.Add('   COUNT(DISTINCT Cha_Id) AS QTDE, ');
      obj.Lista.Add('   SUM(ChOco_TotalHoras) AS HORAS ');
      obj.Lista.Add(' FROM Chamado_Ocorrencia ');
      obj.Lista.Add(' INNER JOIN Chamado ON Cha_Id = ChOco_Chamado');
      obj.Lista.Add(' INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
      obj.Lista.Add(' INNER JOIN Status ON Cha_Status = Sta_Id');
      obj.Lista.Add(' INNER JOIN Tipo ON Cha_Tipo = Tip_Id');
      obj.Lista.Add(' INNER JOIN Usuario ON ChOco_Usuario = Usu_Id');
      obj.Lista.Add(' INNER JOIN Revenda ON Cli_Revenda = Rev_Id');
      obj.Lista.Add(sConsulta);
      obj.Lista.Add(' 	AND Rev_Codigo = ' + IntToStr(ARev_Codigo));
      obj.Lista.Add(' 	AND Tip_Codigo = ' + IntToStr(ATip_Codigo));
      obj.Lista.Add('   AND MONTH(Cha_DataAbertura) = ' + IntToStr(iMes));
      obj.Lista.Add('   AND YEAR(Cha_DataAbertura) = ' + IntToStr(iAno));

      obj.OpenSQL();

      Qtde[i] := obj.Model.FieldByName('QTDE').AsInteger;
      Mes[i]  := iMes;
      Ano[i]  := iAno;
      Horas[i] := obj.Model.FieldByName('HORAS').AsFloat;

      MesAno[i] := FormatFloat('00', iMes) + '/' + IntToStr(iAno);

      Inc(iMes);
    end;

    sHoras := SqlDouble(Horas[12]);
    sHoras := Copy(sHoras, 1, Length(sHoras) -1);
    if sHoras = '' then
      sHoras := '0';

    sb.Append('INSERT INTO Rel_Chamado_Temp(');
    sb.Append('RelCha_Usuario,');
    sb.Append('RelCha_Revenda,');
    sb.Append('RelCha_Tipo,');
    sb.Append('MES1,');
    sb.Append('MES2,');
    sb.Append('MES3,');
    sb.Append('MES4,');
    sb.Append('MES5,');
    sb.Append('MES6,');
    sb.Append('MES7,');
    sb.Append('MES8,');
    sb.Append('MES9,');
    sb.Append('MES10,');
    sb.Append('MES11,');
    sb.Append('MES12,');
    sb.Append('QTDE1,');
    sb.Append('QTDE2,');
    sb.Append('QTDE3,');
    sb.Append('QTDE4,');
    sb.Append('QTDE5,');
    sb.Append('QTDE6,');
    sb.Append('QTDE7,');
    sb.Append('QTDE8,');
    sb.Append('QTDE9,');
    sb.Append('QTDE10,');
    sb.Append('QTDE11,');
    sb.Append('QTDE12,');
    sb.Append('Horas1,');
    sb.Append('Horas2,');
    sb.Append('Horas3,');
    sb.Append('Horas4,');
    sb.Append('Horas5,');
    sb.Append('Horas6,');
    sb.Append('Horas7,');
    sb.Append('Horas8,');
    sb.Append('Horas9,');
    sb.Append('Horas10,');
    sb.Append('Horas11,');
    sb.Append('Horas12');
    sb.Append(') VALUES (');
    sb.Append(SqlInt(AIdUsuario));
    sb.Append(SqlInt(ARev_Codigo));
    sb.Append(SqlInt(ATip_Codigo));
    sb.Append(SqlString(MesAno[1]));
    sb.Append(SqlString(MesAno[2]));
    sb.Append(SqlString(MesAno[3]));
    sb.Append(SqlString(MesAno[4]));
    sb.Append(SqlString(MesAno[5]));
    sb.Append(SqlString(MesAno[6]));
    sb.Append(SqlString(MesAno[7]));
    sb.Append(SqlString(MesAno[8]));
    sb.Append(SqlString(MesAno[9]));
    sb.Append(SqlString(MesAno[10]));
    sb.Append(SqlString(MesAno[11]));
    sb.Append(SqlString(MesAno[12]));
    sb.Append(SqlInt(Qtde[1]));
    sb.Append(SqlInt(Qtde[2]));
    sb.Append(SqlInt(Qtde[3]));
    sb.Append(SqlInt(Qtde[4]));
    sb.Append(SqlInt(Qtde[5]));
    sb.Append(SqlInt(Qtde[6]));
    sb.Append(SqlInt(Qtde[7]));
    sb.Append(SqlInt(Qtde[8]));
    sb.Append(SqlInt(Qtde[9]));
    sb.Append(SqlInt(Qtde[10]));
    sb.Append(SqlInt(Qtde[11]));
    sb.Append(SqlInt(Qtde[12]));
    sb.Append(SqlDouble(Horas[1]));
    sb.Append(SqlDouble(Horas[2]));
    sb.Append(SqlDouble(Horas[3]));
    sb.Append(SqlDouble(Horas[4]));
    sb.Append(SqlDouble(Horas[5]));
    sb.Append(SqlDouble(Horas[6]));
    sb.Append(SqlDouble(Horas[7]));
    sb.Append(SqlDouble(Horas[8]));
    sb.Append(SqlDouble(Horas[9]));
    sb.Append(SqlDouble(Horas[10]));
    sb.Append(SqlDouble(Horas[11]));
    sb.Append(sHoras + ')');

    objInsert.ExecutarSQL(sb.ToString);

  finally
    FreeAndNil(obj);
    FreeAndNil(objInsert);
    FreeAndNil(sb);
  end;
end;

procedure TChamado.RelatorioModeloMeses_07(AFiltro: TFiltroChamado;
  AIdUsuario: integer; ATipo: TEnumChamadoAtividade; AUsu_IdUsuario: Integer);
var
  obj: TFireDAC;
  objInsert: TFireDAC;
  sConsulta: string;
  Qtde: array[1..12] of Integer;
  Horas: array[1..12] of Double;
  HorasDet: array[1..12] of Double;
  Mes: array[1..12] of Integer;
  Ano: array[1..12] of Integer;
  MesAno: array[1..12] of string;
  sb: TStringBuilder;
  sHoras: string;
  iMes: Word;
  iAno: Word;
  i: Word;
  sDataInicial: string;
  sDataFinal: string;
  sMesAnoFim: string;
  sMesAno2: string;
begin
  sDataInicial := AFiltro.DataInicial;
  sDataFinal := AFiltro.DataFinal;

  iMes := MonthOf(StrToDate(sDataInicial));
  iAno := YearOf(StrToDate(sDataInicial));

  sMesAnoFim := '01/' + IntToStr(MonthOf(StrToDate(sDataFinal))) + '/' + IntToStr(YearOf(StrToDate(sDataFinal)));

  for i := 1 to 12 do
  begin
    Qtde[i]   := 0;
    Horas[i]  := 0;
    HorasDet[i] := 0;
    Mes[i]    := 0;
    Ano[i]    := 0;
    MesAno[i] := '';
  end;


  AFiltro.DataInicial := DataEmBranco;
  AFiltro.DataFinal := DataEmBranco;

  sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'OCO', ATipo);

  AFiltro.DataInicial := sDataInicial;
  AFiltro.DataFinal := sDataFinal;

  objInsert := TFireDAC.create;
  obj := TFireDAC.create;
  sb := TStringBuilder.Create;

  try
    for I := 1 to 12 do
    begin

      if iMes > 12 then
      begin
        iMes := 1;
        Inc(iAno);
      end;

      sMesAno2 := '01/' + IntToStr(iMes) + '/' + IntToStr(iAno);

      if StrToDate(sMesAno2) > StrToDate(sMesAnoFim) then
      begin
        inc(iMes);
        Continue;
      end;

      obj.Lista.Clear;
      obj.Lista.Add(' SELECT');
      obj.Lista.Add(' ''1'' AS Item,');
      obj.Lista.Add(' 	Usu_Codigo,');
      obj.Lista.Add(' 	Usu_Nome,');
      obj.Lista.Add(' 	COUNT(DISTINCT Cha_Id) AS QtdeChamados,');
      obj.Lista.Add(' 	SUM(ChOco_TotalHoras) AS TotalHoras,');
      obj.Lista.Add(' 	0 AS TotalHorasDetalhes');
      obj.Lista.Add(' FROM Chamado_Ocorrencia');
      obj.Lista.Add(' 	INNER JOIN Chamado ON ChOco_Chamado = Cha_Id');
      obj.Lista.Add(' 	INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
      obj.Lista.Add(' 	INNER JOIN Usuario ON ChOco_Usuario  = Usu_Id');
      obj.Lista.Add(' 	INNER JOIN Status ON Cha_Status = Sta_Id');
      obj.Lista.Add(' 	INNER JOIN Tipo ON Cha_Tipo = Tip_Id');
      obj.Lista.Add(' 	INNER JOIN Revenda ON Cli_Revenda = Rev_Id');
      obj.Lista.Add(sConsulta);
      obj.Lista.Add(' 	AND ChOco_Usuario = ' + IntToStr(AUsu_IdUsuario));
      obj.Lista.Add('   AND MONTH(ChOco_Data) = ' + IntToStr(iMes));
      obj.Lista.Add('   AND YEAR(ChOco_Data) = ' + IntToStr(iAno));
      obj.Lista.Add('   GROUP BY');
      obj.Lista.Add('   	Usu_Codigo,');
      obj.Lista.Add('   	Usu_Nome');

      obj.Lista.Add(' UNION');
      obj.Lista.Add(' SELECT');
      obj.Lista.Add(' ''2'' AS Item,');
      obj.Lista.Add(' 	Usu_Codigo,');
      obj.Lista.Add(' 	Usu_Nome,');
      obj.Lista.Add(' 	0 AS QtdeChamados,');
      obj.Lista.Add(' 	0 AS TotalHoras,');
      obj.Lista.Add(' 	SUM(ChaOCol_TotalHoras) AS TotalHorasDetalhes');
      obj.Lista.Add(' FROM Chamado_Ocorr_Colaborador');
      obj.Lista.Add(' 	INNER JOIN Chamado_Ocorrencia ON ChaOCol_ChamadoOcorrencia = ChOco_Id');
      obj.Lista.Add(' 	INNER JOIN Chamado ON ChOco_Chamado = Cha_Id');
      obj.Lista.Add(' 	INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
      obj.Lista.Add(' 	INNER JOIN Usuario ON ChaOCol_Usuario  = Usu_Id');
      obj.Lista.Add(' 	INNER JOIN Status ON Cha_Status = Sta_Id');
      obj.Lista.Add(' 	INNER JOIN Tipo ON Cha_Tipo = Tip_Id');
      obj.Lista.Add(' 	INNER JOIN Revenda ON Cli_Revenda = Rev_Id');
      obj.Lista.Add(sConsulta);
      obj.Lista.Add(' 	AND ChaOCol_Usuario = ' + IntToStr(AUsu_IdUsuario));
      obj.Lista.Add('   AND MONTH(ChOco_Data) = ' + IntToStr(iMes));
      obj.Lista.Add('   AND YEAR(ChOco_Data) = ' + IntToStr(iAno));
      obj.Lista.Add('   GROUP BY');
      obj.Lista.Add('   	Usu_Codigo,');
      obj.Lista.Add('   	Usu_Nome');

      obj.OpenSQL();

      while not obj.Model.Eof do
      begin
        if obj.Model.FieldByName('Item').AsInteger = 1 then
        begin
          // insert
          Qtde[i] := obj.Model.FieldByName('QtdeChamados').AsInteger;
          Horas[i] := obj.Model.FieldByName('TotalHoras').AsFloat;
          HorasDet[i] := obj.Model.FieldByName('TotalHorasDetalhes').AsFloat;
        end
        else begin
          // update
          Qtde[i] := Qtde[i] + obj.Model.FieldByName('QtdeChamados').AsInteger;
          Horas[i] := Horas[i] + obj.Model.FieldByName('TotalHoras').AsFloat;
          HorasDet[i] := HorasDet[i] + obj.Model.FieldByName('TotalHorasDetalhes').AsFloat;
        end;
        obj.Model.Next;
      end;

      Mes[i]  := iMes;
      Ano[i]  := iAno;

      MesAno[i] := FormatFloat('00', iMes) + '/' + IntToStr(iAno);

      Inc(iMes);
    end;

    sHoras := SqlDouble(HorasDet[12]);
    sHoras := Copy(sHoras, 1, Length(sHoras) -1);

    if sHoras = '' then
      sHoras := '0';

    sb.Append('INSERT INTO Rel_Chamado_Temp(');
    sb.Append('RelCha_Usuario,');
    sb.Append('RelCha_Revenda,');
    sb.Append('RelCha_Tipo,');
    sb.Append('MES1,');
    sb.Append('MES2,');
    sb.Append('MES3,');
    sb.Append('MES4,');
    sb.Append('MES5,');
    sb.Append('MES6,');
    sb.Append('MES7,');
    sb.Append('MES8,');
    sb.Append('MES9,');
    sb.Append('MES10,');
    sb.Append('MES11,');
    sb.Append('MES12,');
    sb.Append('QTDE1,');
    sb.Append('QTDE2,');
    sb.Append('QTDE3,');
    sb.Append('QTDE4,');
    sb.Append('QTDE5,');
    sb.Append('QTDE6,');
    sb.Append('QTDE7,');
    sb.Append('QTDE8,');
    sb.Append('QTDE9,');
    sb.Append('QTDE10,');
    sb.Append('QTDE11,');
    sb.Append('QTDE12,');
    sb.Append('Horas1,');
    sb.Append('Horas2,');
    sb.Append('Horas3,');
    sb.Append('Horas4,');
    sb.Append('Horas5,');
    sb.Append('Horas6,');
    sb.Append('Horas7,');
    sb.Append('Horas8,');
    sb.Append('Horas9,');
    sb.Append('Horas10,');
    sb.Append('Horas11,');
    sb.Append('Horas12,');
    sb.Append('HorasB1,');
    sb.Append('HorasB2,');
    sb.Append('HorasB3,');
    sb.Append('HorasB4,');
    sb.Append('HorasB5,');
    sb.Append('HorasB6,');
    sb.Append('HorasB7,');
    sb.Append('HorasB8,');
    sb.Append('HorasB9,');
    sb.Append('HorasB10,');
    sb.Append('HorasB11,');
    sb.Append('HorasB12');
    sb.Append(') VALUES (');
    sb.Append(SqlInt(AUsu_IdUsuario));
    sb.Append(SqlInt(0));
    sb.Append(SqlInt(0));
    sb.Append(SqlString(MesAno[1]));
    sb.Append(SqlString(MesAno[2]));
    sb.Append(SqlString(MesAno[3]));
    sb.Append(SqlString(MesAno[4]));
    sb.Append(SqlString(MesAno[5]));
    sb.Append(SqlString(MesAno[6]));
    sb.Append(SqlString(MesAno[7]));
    sb.Append(SqlString(MesAno[8]));
    sb.Append(SqlString(MesAno[9]));
    sb.Append(SqlString(MesAno[10]));
    sb.Append(SqlString(MesAno[11]));
    sb.Append(SqlString(MesAno[12]));
    sb.Append(SqlInt(Qtde[1]));
    sb.Append(SqlInt(Qtde[2]));
    sb.Append(SqlInt(Qtde[3]));
    sb.Append(SqlInt(Qtde[4]));
    sb.Append(SqlInt(Qtde[5]));
    sb.Append(SqlInt(Qtde[6]));
    sb.Append(SqlInt(Qtde[7]));
    sb.Append(SqlInt(Qtde[8]));
    sb.Append(SqlInt(Qtde[9]));
    sb.Append(SqlInt(Qtde[10]));
    sb.Append(SqlInt(Qtde[11]));
    sb.Append(SqlInt(Qtde[12]));
    sb.Append(SqlDouble(Horas[1]));
    sb.Append(SqlDouble(Horas[2]));
    sb.Append(SqlDouble(Horas[3]));
    sb.Append(SqlDouble(Horas[4]));
    sb.Append(SqlDouble(Horas[5]));
    sb.Append(SqlDouble(Horas[6]));
    sb.Append(SqlDouble(Horas[7]));
    sb.Append(SqlDouble(Horas[8]));
    sb.Append(SqlDouble(Horas[9]));
    sb.Append(SqlDouble(Horas[10]));
    sb.Append(SqlDouble(Horas[11]));
    sb.Append(SqlDouble(Horas[12]));
    sb.Append(SqlDouble(HorasDet[1]));
    sb.Append(SqlDouble(HorasDet[2]));
    sb.Append(SqlDouble(HorasDet[3]));
    sb.Append(SqlDouble(HorasDet[4]));
    sb.Append(SqlDouble(HorasDet[5]));
    sb.Append(SqlDouble(HorasDet[6]));
    sb.Append(SqlDouble(HorasDet[7]));
    sb.Append(SqlDouble(HorasDet[8]));
    sb.Append(SqlDouble(HorasDet[9]));
    sb.Append(SqlDouble(HorasDet[10]));
    sb.Append(SqlDouble(HorasDet[11]));
    sb.Append(sHoras + ')');

    objInsert.ExecutarSQL(sb.ToString);

  finally
    FreeAndNil(obj);
    FreeAndNil(objInsert);
    FreeAndNil(sb);
  end;
end;

function TChamado.RelatorioModelo_01(AFiltro: TFiltroChamado; AIdUsuario:
    integer; ATipo: TEnumChamadoAtividade): string;
var
  sConsulta: string;
  lChamado: TDMChamado;
begin

  sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'CAB', ATipo);

  sConsulta := sConsulta + ' ORDER BY Cli_Nome, Cli_Codigo, Cha_DataAbertura';

  lChamado := TDMChamado.Create(nil);
  try
    Result := lChamado.QRelChamadoModelo01.SQL.Text + sConsulta;
  finally
    FreeAndNil(lChamado);
  end;
end;

function TChamado.RelatorioModelo_02(AFiltro: TFiltroChamado; AIdUsuario:
    integer; Ordem: string; ATipo: TEnumChamadoAtividade): string;
var
  sConsulta: string;
  lChamado: TDMChamado;
begin

  sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'CAB', ATipo);

  sConsulta := sConsulta + ' GROUP BY	Cli_Codigo,	Cli_Nome,	Rev_Codigo,	Rev_Nome';

  sConsulta := sConsulta + ' ORDER BY ' + Ordem;

  lChamado := TDMChamado.Create(nil);
  try
    Result := lChamado.QRelChamadoModelo02.SQL.Text + sConsulta;
  finally
    FreeAndNil(lChamado);
  end;
end;

function TChamado.RelatorioModelo_03(AFiltro: TFiltroChamado; AIdUsuario: integer;
  Ordem: string; ATipo: TEnumChamadoAtividade): string;
var
  sConsulta: string;
  sConsulta2: string;
  lChamado: TDMChamado;
begin
  sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'OCO', ATipo);
  sConsulta := sConsulta + ' GROUP BY	Usu_Codigo,	Usu_Nome';

  sConsulta2 := FiltrarRelatorios(AFiltro, AIdUsuario, 'OCO', ATipo);
  if AFiltro.IdUsuarioAbertura <> '' then
    sConsulta2 := ' AND ChaOCol_Usuario in ' + AFiltro.IdUsuarioAbertura;

  sConsulta2 := sConsulta2 + ' GROUP BY	Usu_Codigo,	Usu_Nome';

  lChamado := TDMChamado.Create(nil);
  try
    Result := lChamado.QRelChamadoModelo03.SQL.Text +
      sConsulta +
      lChamado.QRelChamadoModelo03A.SQL.Text +
      sConsulta2 + ' ORDER BY ' + Ordem;
//      ShowMessage(Result);
  finally
    FreeAndNil(lChamado);
  end;
end;

function TChamado.RelatorioModelo_04(AFiltro: TFiltroChamado; AIdUsuario: integer;
  Ordem: string; ATipo: TEnumChamadoAtividade): string;
var
  sConsulta: string;
  lChamado: TDMChamado;
begin

  sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'CAB', ATipo);

  sConsulta := sConsulta + ' GROUP BY	Tip_Codigo,	Tip_Nome,	Rev_Codigo,	Rev_Nome';

  sConsulta := sConsulta + ' ORDER BY ' + Ordem;

  lChamado := TDMChamado.Create(nil);
  try
    Result := lChamado.QRelChamadoModelo04.SQL.Text + sConsulta;
  finally
    FreeAndNil(lChamado);
  end;
end;

function TChamado.RelatorioModelo_05(AFiltro: TFiltroChamado;
  AIdUsuario: integer; Ordem: string; ATipo: TEnumChamadoAtividade): string;
var
  sConsulta: string;
  lChamado: TDMChamado;
begin

  sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'CAB', ATipo);

  sConsulta := sConsulta + ' GROUP BY	Cha_DataAbertura';

  sConsulta := sConsulta + ' ORDER BY ' + Ordem;

  lChamado := TDMChamado.Create(nil);
  try
    Result := lChamado.QRelChamadoModelo05.SQL.Text + sConsulta;
  finally
    FreeAndNil(lChamado);
  end;
end;

procedure TChamado.RelatorioModelo_06(AFiltro: TFiltroChamado;
  AIdUsuario: integer; ATipo: TEnumChamadoAtividade);
var
  sConsulta: string;
  sDados: string;
  lChamado: TDMChamado;
  obj: TFireDAC;
begin
  if AFiltro.DataInicial = DataEmBranco then
    raise Exception.Create('Informe a Data Inicial!');

  if AFiltro.DataFinal = DataEmBranco then
    raise Exception.Create('Informe a Data Final!');


  obj := TFireDAC.create;
  lChamado := TDMChamado.Create(nil);
  try
    try
      dm.StartTransacao();
      obj.ExecutarSQL('DELETE FROM Rel_Chamado_Temp');

      sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'CAB', ATipo);

      sConsulta := sConsulta + ' GROUP BY	Tip_Codigo,	Tip_Nome,	Rev_Codigo,	Rev_Nome';

      sConsulta := sConsulta + ' ORDER BY Rev_Nome, Tip_Nome';

      sDados := lChamado.QRelChamadoModelo04.SQL.Text;

      lChamado.QRelChamadoModelo04.SQL.Text := sDados + sConsulta;
      lChamado.QRelChamadoModelo04.Open();
      while not lChamado.QRelChamadoModelo04.Eof do
      begin
        RelatorioModeloMeses_06(AFiltro,
          AIdUsuario,
          ATipo,
          lChamado.QRelChamadoModelo04.FieldByName('Rev_Codigo').AsInteger,
          lChamado.QRelChamadoModelo04.FieldByName('Tip_Codigo').AsInteger);

        lChamado.QRelChamadoModelo04.Next;
      end;
      dm.Commit();
    except
      on E: Exception do
      begin
        dm.Roolback();
        raise Exception.Create(E.Message);
      end;
    end;

  finally
    FreeAndNil(lChamado);
    FreeAndNil(obj);
  end;
end;

procedure TChamado.RelatorioModelo_07(AFiltro: TFiltroChamado;
  AIdUsuario: integer; ATipo: TEnumChamadoAtividade);
var
  sConsulta: string;
  sDados: string;
  lChamado: TDMChamado;
  obj: TFireDAC;
  obj2: TFireDAC;
begin
  if AFiltro.DataInicial = DataEmBranco then
    raise Exception.Create('Informe a Data Inicial!');

  if AFiltro.DataFinal = DataEmBranco then
    raise Exception.Create('Informe a Data Final!');


  obj := TFireDAC.create;
  obj2 := TFireDAC.create;
  lChamado := TDMChamado.Create(nil);
  try
    try
      dm.StartTransacao();
      obj.ExecutarSQL('DELETE FROM Rel_Chamado_Temp');

      sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'OCO', ATipo);

      sConsulta := sConsulta + ' GROUP BY	Usu_Codigo,	Usu_Nome';

      sConsulta := sConsulta + ' ORDER BY Usu_Nome';

      sDados := lChamado.QRelChamadoModelo03.SQL.Text;

      lChamado.QRelChamadoModelo03.SQL.Text := sDados + sConsulta;
      lChamado.QRelChamadoModelo03.Open();
      while not lChamado.QRelChamadoModelo03.Eof do
      begin
        obj2.OpenSQL('SELECT Usu_Id FROM Usuario WHERE Usu_Codigo = ' + IntToStr(lChamado.QRelChamadoModelo03.FieldByName('Usu_Codigo').AsInteger));

        RelatorioModeloMeses_07(AFiltro,
          AIdUsuario,
          ATipo,
          obj2.Model.FieldByName('Usu_Id').AsInteger);

        lChamado.QRelChamadoModelo03.Next;
      end;
      dm.Commit();
    except
      on E: Exception do
      begin
        dm.Roolback();
        raise Exception.Create(E.Message);
      end;
    end;

  finally
    FreeAndNil(lChamado);
    FreeAndNil(obj);
    FreeAndNil(obj2);
  end;
end;

function TChamado.RelatorioModelo_08(AFiltro: TFiltroChamado;
  AIdUsuario: integer; Ordem: string; ATipo: TEnumChamadoAtividade): string;
var
  sConsulta: string;
  sConsulta2: string;
  lChamado: TDMChamado;
begin
  sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'OCO', ATipo);
  sConsulta := sConsulta + ' GROUP BY	Cli_Perfil';

  sConsulta2 := FiltrarRelatorios(AFiltro, AIdUsuario, 'OCO', ATipo);
  if AFiltro.IdUsuarioAbertura <> '' then
    sConsulta2 := ' AND ChaOCol_Usuario in ' + AFiltro.IdUsuarioAbertura;

  sConsulta2 := sConsulta2 + ' GROUP BY	Cli_Perfil';

  lChamado := TDMChamado.Create(nil);
  try
    Result := lChamado.QRelChamadoModelo08.SQL.Text +
      sConsulta +
      lChamado.QRelChamadoModelo08A.SQL.Text +
      sConsulta2 + ' ORDER BY ' + Ordem;
//      ShowMessage(Result);
  finally
    FreeAndNil(lChamado);
  end;
end;

function TChamado.RelatorioModelo_09(AFiltro: TFiltroChamado;
  AIdUsuario: integer; Ordem: string; ATipo: TEnumChamadoAtividade): string;
var
  sConsulta: string;
  sConsulta2: string;
  lChamado: TDMChamado;
begin
  sConsulta := FiltrarRelatorios(AFiltro, AIdUsuario, 'CAB', ATipo);
  sConsulta := sConsulta + ' GROUP BY	Cha_Origem';

  lChamado := TDMChamado.Create(nil);
  try
    Result := lChamado.QRelChamadoModelo09.SQL.Text +
      sConsulta + ' ORDER BY ' + Ordem;
  finally
    FreeAndNil(lChamado);
  end;
end;

function TChamado.RetornarAtividadeQuadro(AIdUsuario,
  AIdRevenda: Integer): string;
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 25, '''Q1'' AS Quadro,', caAtividade));
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 26, '''Q2'' AS Quadro,', caAtividade));
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 27, '''Q3'' AS Quadro,', caAtividade));
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 28, '''Q4'' AS Quadro,', caAtividade));
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 29, '''Q5'' AS Quadro,', caAtividade));
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 30, '''Q6'' AS Quadro,', caAtividade));
//  sb.Append(' ORDER BY 6 desc, 7 desc');
  Result := sb.ToString();
  FreeAndNil(sb);
end;

function TChamado.RetornarChamadoQuadro(AIdUsuario,
  AIdRevenda: Integer): string;
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 3, '''Q1'' AS Quadro,', caChamado));
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 4, '''Q2'' AS Quadro,', caChamado));
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 5, '''Q3'' AS Quadro,', caChamado));
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 6, '''Q4'' AS Quadro,', caChamado));
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 7, '''Q5'' AS Quadro,', caChamado));
  sb.Append(RetornarSQLQuadro(AIdUsuario, AIdRevenda, 8, '''Q6'' AS Quadro,', caChamado));
//  sb.Append(' ORDER BY 6 desc, 7 desc');
  Result := sb.ToString();
  FreeAndNil(sb);
end;

function TChamado.RetornarSQLQuadro(AIdUsuario, AIdRevenda, AParCodigo: Integer; ACampoQuadro: string; ATipo: TEnumChamadoAtividade): string;
var
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  sb.AppendLine(' SELECT');
  sb.Append(ACampoQuadro);
//  sb.AppendLine(' ''Q1'' AS Quadro,');
  sb.AppendLine('	Cha_Id,');
  sb.AppendLine('	Cha_DataAbertura,');
  sb.AppendLine('	Cha_HoraAbertura,');
  sb.AppendLine('	Cli_Nome,');
  sb.AppendLine('	Cli_Perfil,');
  sb.AppendLine('	CASE cha_Nivel');
  sb.AppendLine('		WHEN 1 THEN ''1-Baixo''');
  sb.AppendLine('		WHEN 2 THEN ''2-Normal''');
  sb.AppendLine('		WHEN 3 THEN ''3-Alto''');
  sb.AppendLine('		WHEN 4 THEN ''4-Cr�tico''');
  sb.AppendLine('	END AS Cha_Nivel,');
  sb.AppendLine('  Cha_Nivel as Nivel,');
  sb.AppendLine('  Cha_UsuarioAtendeAtual,');
  sb.AppendLine('  Sta_Codigo,');
  sb.AppendLine('  Cli_Codigo,');
  sb.AppendLine('	Tip_Nome,');
  sb.AppendLine('  UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_Id),');
  sb.AppendLine('	cha_HoraAtendeAtual,');
  sb.AppendLine('  (');
  sb.AppendLine('	   SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS CHAO');
  sb.AppendLine('		WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id');
  sb.AppendLine(' 	) AS UltimaData,');
  sb.AppendLine('  Par_Codigo,');
  sb.AppendLine('	Usu_Nome');
  sb.AppendLine('FROM Chamado');
  sb.AppendLine('	INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
  sb.AppendLine('	INNER JOIN Tipo ON Cha_Tipo = Tip_Id');
  sb.AppendLine('	INNER JOIN Status ON Cha_Status = Sta_Id');
//  sb.AppendLine('	INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)');
  sb.AppendLine('	LEFT JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)');
  sb.AppendLine('  LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id');
//  sb.AppendLine('WHERE par_Codigo = 3');
  sb.AppendLine('WHERE par_Codigo = ' + IntToStr(AParCodigo));
  sb.AppendLine('AND EXISTS(');
  sb.AppendLine('	SELECT 1 FROM Usuario WHERE ((Cli_Revenda = Usu_Revenda) OR (Usu_Revenda IS NULL))');
  sb.AppendLine('	AND Usu_Id = ' + IntToStr(AIdUsuario) + ')');
  sb.AppendLine('AND EXISTS(');
  sb.AppendLine('	SELECT 1 FROM Usuario WHERE ((Cli_Id = Usu_Cliente) OR (Usu_Cliente IS NULL))');
  sb.AppendLine('	AND Usu_Id = ' + IntToStr(AIdUsuario) + ')');

  if AIdRevenda > 0 then
    sb.AppendLine('AND (Cli_Revenda = ' + IntToStr(AIdRevenda) + ')');

  sb.AppendLine(' --=============================================================================');

  if ATipo = caChamado then
  begin
    if AParCodigo < 8 then
      sb.AppendLine(' UNION ');
  end
  else begin
    if AParCodigo < 30 then
      sb.AppendLine(' UNION ');
  end;

  Result := sb.ToString();

  FreeAndNil(sb);
end;

function TChamado.RetornarStatus(AIdChamado: Integer): Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Cha_Status FROM Chamado WHERE Cha_Id = ' + IntToStr(AIdChamado);
    lQry.Open();
    Result := lQry.Fields[0].AsInteger;
  finally
    FreeAndNil(lQry);
  end;
end;

function TChamado.RetornaSQLQuadro(AIdUsuario, AParametro: Integer): string;
var
  sb: TStringBuilder;
  sConsulta: string;
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    sConsulta := Usuario.RetornaPermissaoUsuarioDepartamento(AIdUsuario);
  finally
    FreeAndNil(Usuario);
  end;

  sb := TStringBuilder.Create;
  try
    sb.AppendLine(' SELECT');
    sb.AppendLine(' 	Cha_Id,');
    sb.AppendLine(' 	Cha_DataAbertura,');
    sb.AppendLine(' 	Cha_HoraAbertura,');
    sb.AppendLine(' 	Cli_Nome,');
    sb.AppendLine(' 	Cli_Perfil,');
    sb.AppendLine(' 	CASE cha_Nivel');
    sb.AppendLine(' 		WHEN 1 THEN ''1-Baixo''');
    sb.AppendLine(' 		WHEN 2 THEN ''2-Normal''');
    sb.AppendLine(' 		WHEN 3 THEN ''3-Alto''');
    sb.AppendLine(' 		WHEN 4 THEN ''4-Cr�tico''');
    sb.AppendLine(' 	END AS Cha_Nivel,');
    sb.AppendLine(' 	Cha_Nivel AS Nivel,');
    sb.AppendLine(' 	Sta_Codigo,');
    sb.AppendLine(' 	Cli_Codigo,');
    sb.AppendLine(' 	Cha_UsuarioAtendeAtual,');
    sb.AppendLine(' 	Tip_Nome,');
    sb.AppendLine('   Usu_Nome,');
    sb.AppendLine('   cha_HoraAtendeAtual,');
    sb.AppendLine('   (');
    sb.AppendLine('     SELECT MAX(CHAO.ChOco_Data) FROM dbo.Chamado_Ocorrencia AS CHAO');
    sb.AppendLine('   	  WHERE CHAO.ChOco_Chamado = dbo.Chamado.Cha_Id');
    sb.AppendLine('   ) AS UltimaData,');
    sb.AppendLine('   Par_Codigo,');
//    sb.AppendLine('   HoraFinal = dbo.Func_Chamado_BuscarUltimaOcorrencia (Cha_Id),');
    sb.AppendLine('   UltimaHora = dbo.Func_Chamado_BuscarUltimaHoraOcorrencia (Cha_Id)');
    sb.AppendLine(' FROM Chamado');
    sb.AppendLine(' 	INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
    sb.AppendLine(' 	INNER JOIN Tipo ON Cha_Tipo = Tip_Id');
    sb.AppendLine(' 	INNER JOIN Status ON Cha_Status = Sta_Id');
    sb.AppendLine(' 	INNER JOIN Parametros ON Sta_Codigo = COALESCE(Par_Valor, 0)');
    sb.AppendLine('   LEFT JOIN Usuario ON Cha_UsuarioAtendeAtual = Usu_Id');

    sb.AppendLine(' WHERE Par_Codigo = ' + IntToStr(AParametro));
//    sb.AppendLine(' AND Par_Programa = 1');
    sb.AppendLine( sConsulta);
    sb.AppendLine(' ORDER BY Cha_DataAbertura DESC, UltimaHora DESC');

    Result := sb.ToString();
  finally
    FreeAndNil(sb);
  end;
end;

function TChamado.Salvar(AChamadoVO: TChamadoVO;
  AspChamado: TFDStoredProc; AspChamadoOcorrencia: TFDStoredProc): Integer;
var
  sIU: string;
  Id: Integer;
  sHora: string;
begin
  sIU := 'I';
  if AChamadoVO.Id > 0 then
    sIU := 'U';

  if AChamadoVO.DataAbertura = 0 then
    raise Exception.Create('Informe a Data da Abertura do Chamado!');

  if AChamadoVO.HoraAbertura = 0 then
    raise Exception.Create('Informe a Hora da Abertura do Chamado!');

  if AChamadoVO.IdCliente = 0 then
    raise Exception.Create('Informe o Cliente do Chamado!');

  if AChamadoVO.IdUsuarioAbertura = 0 then
    raise Exception.Create('Informe o Usu�rio de Abertura do Chamado!');

  if AChamadoVO.IdTipo = 0 then
    raise Exception.Create('Informe o Tipo do Chamado!');

  if AChamadoVO.IdStatus = 0 then
    raise Exception.Create('Informe o Status do Chamado!');

  if AChamadoVO.Descricao.Trim = '' then
    raise Exception.Create('Informe a Descri��o do Chamado!');

  dm.StartTransacao;
  try
    sHora := FormatDateTime('hh:mm', AChamadoVO.HoraAbertura);
    AChamadoVO.ChamadoStatusVO.IdStatus := RetornarStatus(AChamadoVO.Id);

    Id := TGenericDAO.Save<TChamadoVO>(AChamadoVO);

    SalvarOcorrencia(Id, AChamadoVO, AspChamadoOcorrencia);

    AChamadoVO.ChamadoStatusVO.IdChamado := Id;
    SalvarStatus(AChamadoVO.IdUsuarioAbertura, AChamadoVO);

    dm.Commit();
    Result := id;

// NAO SER� MAI UTILIZADO AS LINHAS ABAIXO PARA SALVAR O CHAMADO
//    AspChamado.Close;
//    AspChamado.ParamByName('@IU').AsString := sIU;
//    AspChamado.ParamByName('@Id').AsInteger := AChamadoVO.Id;
//    AspChamado.ParamByName('@DataAbertura').AsDate := AChamadoVO.DataAbertura;
//    AspChamado.ParamByName('@HoraAbertura').AsTime := StrToTime(sHora); // AChamadoVO.HoraAbertura;
//    AspChamado.ParamByName('@IdCliente').AsInteger := AChamadoVO.IdCliente;
//    AspChamado.ParamByName('@IdUsuarioAbertura').AsInteger := AChamadoVO.IdUsuarioAbertura;
//    AspChamado.ParamByName('@Contato').AsString := AChamadoVO.Contato;
//    AspChamado.ParamByName('@Nivel').AsInteger  := AChamadoVO.Nivel;
//    AspChamado.ParamByName('@IdTipo').AsInteger := AChamadoVO.IdTipo;
//    AspChamado.ParamByName('@IdStatus').AsInteger := AChamadoVO.IdStatus;
//    AspChamado.ParamByName('@Descricao').AsString := AChamadoVO.Descricao;
//
//    if AChamadoVO.IdModulo = 0 then
//      AspChamado.ParamByName('@IdModulo').Value := null
//    else
//      AspChamado.ParamByName('@IdModulo').AsInteger := AChamadoVO.IdModulo;
//
//    if AChamadoVO.IdProduto = 0 then
//      AspChamado.ParamByName('@IdProduto').Value := null
//    else
//      AspChamado.ParamByName('@IdProduto').AsInteger := AChamadoVO.IdProduto;
//
//    if AChamadoVO.IdUsuarioAtendeAtual = 0 then
//      AspChamado.ParamByName('@IdUsuarioAtendeAtual').Value := null
//    else
//      AspChamado.ParamByName('@IdUsuarioAtendeAtual').AsInteger := AChamadoVO.IdUsuarioAtendeAtual;
//
//    if AChamadoVO.HoraAtendeAtual = 0 then
//      AspChamado.ParamByName('@HoraAtendeAtual').Value := null
//    else begin
//      sHora := FormatDateTime('hh:mm', AChamadoVO.HoraAtendeAtual);
//      AspChamado.ParamByName('@HoraAtendeAtual').AsTime := StrToTime(sHora); //AChamadoVO.HoraAtendeAtual
//    end;
//
//    AspChamado.ParamByName('@TipoMovimento').AsInteger := AChamadoVO.TipoMovimento;
//    AspChamado.ExecProc();
//
//    id := AspChamado.ParamByName('@RetornoId').AsInteger;
//
//    SalvarOcorrencia(Id, AChamadoVO, AspChamadoOcorrencia);
//
//    AChamadoVO.ChamadoStatusVO.IdChamado := Id;
//    SalvarStatus(AChamadoVO.IdUsuarioAbertura, AChamadoVO);
//
//    dm.Commit();
//    Result := id;
  except
    On E: Exception do
    begin
      dm.Roolback();
      raise Exception.Create(E.Message);
    end;
  end;

end;

procedure TChamado.SalvarOcorrencia(AIdChamado: Integer; AChamado: TChamadoVO;
  AspOcorrencia: TFDStoredProc);
var
  Item: TChamadoOcorrenciaVO;
  sIU: string;
  Id: Integer;
begin

  ExcluirOcorrencia(AIdChamado, AChamado);

  for Item in AChamado.ListaChamadoOcorrencia do
  begin
    sIU := 'I';
    if Item.Id > 0 then
      sIU := 'U';

    if Item.IdChamado = 0 then
      raise Exception.Create('Informe o Id do Chamado na Ocorr�ncia!');

    if Item.Data = 0 then
      raise Exception.Create('Informe a Data da Ocorr�ncia!');

    if Item.HoraInicio = 0 then
      raise Exception.Create('Informe a Hora Inicial da Ocorr�ncia!');

    if Item.HoraFim = 0 then
      raise Exception.Create('Informe a Hora Final da Ocorr�ncia!');

    if Item.IdUsuario = 0 then
      raise Exception.Create('Informe o usu�rio da Ocorr�ncia!');


    Item.IdChamado := AIdChamado;
    AspOcorrencia.ParamByName('@IU').AsString := sIU;
    AspOcorrencia.ParamByName('@Id').AsInteger := Item.Id;
    AspOcorrencia.ParamByName('@IdChamado').AsInteger := Item.IdChamado;
    AspOcorrencia.ParamByName('@Docto').AsString := Item.Docto;
    AspOcorrencia.ParamByName('@Data').AsDate := Item.Data;
    AspOcorrencia.ParamByName('@HoraInicio').AsTime := Item.HoraInicio;
    AspOcorrencia.ParamByName('@HoraFim').AsTime := Item.HoraFim;
    AspOcorrencia.ParamByName('@IdUsuario').AsInteger := Item.IdUsuario;
    if Item.IdUsuarioColab1 = 0 then
      AspOcorrencia.ParamByName('@IdUsuarioColab1').Value := null
    else
      AspOcorrencia.ParamByName('@IdUsuarioColab1').AsInteger := Item.IdUsuarioColab1;

    if Item.IdUsuarioColab2 = 0 then
      AspOcorrencia.ParamByName('@IdUsuarioColab2').Value := null
    else
      AspOcorrencia.ParamByName('@IdUsuarioColab2').AsInteger := Item.IdUsuarioColab2;

    if Item.IdUsuarioColab3 = 0 then
      AspOcorrencia.ParamByName('@IdUsuarioColab3').Value := null
    else
      AspOcorrencia.ParamByName('@IdUsuarioColab3').AsInteger := Item.IdUsuarioColab3;

    AspOcorrencia.ParamByName('@DescricaoTecnica').AsString := Item.DescricaoTecnica;
    AspOcorrencia.ParamByName('@DescricaoSolucao').AsString := Item.DescricaoSolucao;
    AspOcorrencia.ParamByName('@Anexo').AsString := Item.Anexo;
    AspOcorrencia.ParamByName('@TotalHoras').AsFloat := Item.TotalHoras;
    AspOcorrencia.ParamByName('@Versao').AsString := Item.Versao;
    AspOcorrencia.ExecProc();

    id := AspOcorrencia.ParamByName('@RetornoId').AsInteger;

    SalvarOcorrenciaColaborador(id, Item.Id, AChamado);
  end;
end;

procedure TChamado.SalvarOcorrenciaColaborador(AIdOcorrenciaNew,
  AIdOcorrenciaOld: Integer; AChamadoVO: TChamadoVO);
var
  Item: TChamadoColaboradorVO;
  sHoraIni: string;
  sHoraFim: string;
  HoraInicial: Double;
  HoraFinal: Double;
  TotalHoras: Double;
  sTotalHoras: string;
  sb: TStringBuilder;
  lQuery: TFDQuery;
begin

  ExcluirOcorrenciaColaborador(AIdOcorrenciaNew, AChamadoVO);

  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := dm.Conexao;
    for Item in AChamadoVO.ListaChamadoColaborador do
    begin
      if AIdOcorrenciaNew = 0 then
        raise Exception.Create('Informe o Id do Item da Ocorr�ncia do Chamado!');

      if Item.IdUsuario = 0 then
        raise Exception.Create('Informe o Usu�rio no Chamado Colaborador!');

      if Item.IdOcorrencia = AIdOcorrenciaOld then
      begin
        if Item.HoraInicial = 0 then
          raise Exception.Create('Informe a Hora Inicial do Colaborador!');
        if Item.HoraFim = 0 then
          raise Exception.Create('Informe a Hora Final do Colaborador!');

        if Item.HoraInicial > Item.HoraFim then
          raise Exception.Create('Hora Inicial maior que Hora Final!');

        Item.IdOcorrencia := AIdOcorrenciaNew;
        sHoraIni := FormatDateTime('hh:mm', Item.HoraInicial);
        sHoraFim := FormatDateTime('hh:mm', Item.HoraFim);

        HoraInicial := TFuncoes.HoraToDecimal(sHoraIni);
        HoraFinal   := TFuncoes.HoraToDecimal(sHoraFim);
        TotalHoras  := HoraFinal - HoraInicial;
        sTotalHoras := TFuncoes.ValorAmericano(FloatToStr(TotalHoras));

        if Item.Id <= 0 then
        begin
          lQuery.SQL.Clear;
          lQuery.SQL.Add(' INSERT INTO Chamado_Ocorr_Colaborador(');
          lQuery.SQL.Add('   ChaOCol_ChamadoOcorrencia, ');
          lQuery.SQL.Add('   ChaOCol_Usuario,');
          lQuery.SQL.Add('   ChaOcol_HoraInicio,');
          lQuery.SQL.Add('   ChaOCol_HoraFim,');
          lQuery.SQL.Add('   ChaOcol_TotalHoras)');
          lQuery.SQL.Add(' VALUES(');
          lQuery.SQL.Add('  :IdOcorrencia,');
          lQuery.SQL.Add('  :IdUsuario,');
          lQuery.SQL.Add(' CAST(:HoraInicial AS time),');
          lQuery.SQL.Add(' CAST(:HoraFim AS time),');
          lQuery.SQL.Add(' :TotalHoras)');
        end
        else begin
          lQuery.SQL.Clear;
          lQuery.SQL.Add(' UPDATE Chamado_Ocorr_Colaborador SET');
          lQuery.SQL.Add('   ChaOCol_ChamadoOcorrencia = :IdOcorrencia,');
          lQuery.SQL.Add('   ChaOCol_Usuario = :IdUsuario,');
          lQuery.SQL.Add('   ChaOcol_HoraInicio = CAST(:HoraInicial AS time),');
          lQuery.SQL.Add('   ChaOCol_HoraFim = CAST(:HoraFim AS time),');
          lQuery.SQL.Add('   ChaOcol_TotalHoras = :TotalHoras');
          lQuery.SQL.Add(' WHERE ChaOcol_Id = ' + IntToStr(Item.Id));
        end;
//        lQuery.Prepared := True;
        lQuery.ParamByName('IdOcorrencia').AsInteger := Item.IdOcorrencia;
        lQuery.ParamByName('IdUsuario').AsInteger := Item.IdUsuario;
        lQuery.ParamByName('HoraInicial').AsTime := StrToTime(sHoraIni); // Item.HoraInicial;
        lQuery.ParamByName('HoraFim').AsTime := StrToTime(sHoraFim); // Item.HoraFim;
        lQuery.ParamByName('TotalHoras').AsFloat := TotalHoras; // Item.TotalHoras;
        lQuery.ExecSQL();
      end;
    end;
  finally
    FreeAndNil(lQuery);
  end;
end;

procedure TChamado.SalvarStatus(AIdUsuario: Integer; AChamado: TChamadoVO);
var
  lQry: TFDQuery;
begin
  // se tiver usuario, ser� usado a trigger da tabela Chamado
  // n�o ser� feito por aqui

  // NAO MAIS USADO

  EXIT;

  if AChamado.Id = 0 then
    Exit;

  if AChamado.IdUsuarioAtendeAtual > 0 then
    Exit;

  if AChamado.IdStatus > 0 then
  begin
    lQry := TFDQuery.Create(Nil);
    try
      lQry.Connection := DM.Conexao;

      lQry.SQL.Text := 'SELECT Cha_Status FROM Chamado WHERE Cha_Id = ' + IntToStr(AChamado.Id);
      lQry.Open();

      if AChamado.IdStatus <> AChamado.ChamadoStatusVO.IdStatus then // lQry.Fields[0].AsInteger then
      begin
        AChamado.ChamadoStatusVO.Hora := Time;
        AChamado.ChamadoStatusVO.Data := Date;
//        ShowMessage(ChamadoStatus.IdChamado.ToString() + ' - ' + lQry.Fields[0].AsString);
        lQry.SQL.Clear;
        lQry.SQL.Add('INSERT INTO Chamado_Status(');
        lQry.SQL.Add(' ChSta_Chamado,');
        lQry.SQL.Add(' ChSta_Data,');
        lQry.SQL.Add(' ChSta_Hora,');
        lQry.SQL.Add(' ChSta_Usuario,');
        lQry.SQL.Add(' ChSta_Status)');
        lQry.SQL.Add(' VALUES(');
        lQry.SQL.Add(' :Chamado,');
        lQry.SQL.Add(' :Data,');
        lQry.SQL.Add(' :Hora,');
        lQry.SQL.Add(' :Usuario,');
        lQry.SQL.Add(' :Status)');

        lQry.Params.ParamByName('Chamado').AsInteger := AChamado.ChamadoStatusVO.IdChamado;
        lQry.Params.ParamByName('Data').AsDateTime := AChamado.ChamadoStatusVO.Data;
        lQry.Params.ParamByName('Hora').AsDateTime := AChamado.ChamadoStatusVO.Hora;
        lQry.Params.ParamByName('Usuario').AsInteger := AChamado.IdUsuarioAbertura; // AIdUsuario;
        lQry.Params.ParamByName('Status').AsInteger := AChamado.ChamadoStatusVO.IdStatus;

        lQry.ExecSQL();
      end;
    finally
      FreeAndNil(lQry);
    end;
  end;
end;

function TChamado.SqlDouble(AValor: Double): string;
var
  sValor: string;
begin
  sValor := FloatToStr(AValor);
  sValor := TFuncoes.TrocaCaracter(sValor, '.', '');
  sValor := TFuncoes.TrocaCaracter(sValor, ',', '.');
  Result := sValor + ',';
end;

function TChamado.SqlInt(AValor: Integer): string;
var
  sValor: string;
begin
  sValor := IntToStr(AValor);
  sValor := TFuncoes.TrocaCaracter(sValor, '.', '');
  sValor := TFuncoes.TrocaCaracter(sValor, ',', '.');
  Result := sValor + ',';
end;

function TChamado.SqlString(AValor: string): string;
begin
  Result := QuotedStr(AValor) + ',';
end;

function TChamado.UsuarioIgualCadastro(AId, AIdUsuario,
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
      obj.OpenSQL('SELECT Cha_UsuarioAbertura FROM Chamado WHERE Cha_Id = ' + IntToStr(AId));
      Result  := (obj.Model.FieldByName('Cha_UsuarioAbertura').AsInteger = AIdUsuario);
    finally
      FreeAndNil(obj);
    end;
  end;
end;

function TChamado.VerificarAtividadeAberto(AIdUsuario: Integer): Boolean;
var
  obj: TFireDAC;
  sb: TStringBuilder;
  bResult: Boolean;
begin
  obj := TFireDAC.create;
  sb := TStringBuilder.Create;
  try
      sb.AppendLine('SELECT COUNT(Cha_Id) FROM CHAMADO');
      sb.AppendLine(' WHERE Cha_Status = 28');
      sb.AppendLine(' AND Cha_TipoMovimento = 2');
      sb.AppendLine(' AND cha_UsuarioAtendeAtual = ' + IntToStr(AIdUsuario));

    obj.OpenSQL(sb.ToString());
    bResult := (obj.Model.Fields[0].AsInteger > 0);
    Result := bResult;
  finally
    FreeAndNil(obj);
    FreeAndNil(sb);
  end;
end;

function TChamado.VerificarChamadoAberto(AIdUsuario: Integer): Boolean;
var
  obj: TFireDAC;
  sb: TStringBuilder;
begin
  obj := TFireDAC.create;
  sb := TStringBuilder.Create;
  try
      sb.AppendLine('SELECT COUNT(Cha_Id) FROM CHAMADO');
      sb.AppendLine(' WHERE Cha_Status = 2');
      sb.AppendLine(' AND Cha_TipoMovimento = 1');
      sb.AppendLine(' AND cha_UsuarioAtendeAtual = ' + IntToStr(AIdUsuario));

    obj.OpenSQL(sb.ToString());
    Result := (obj.Model.Fields[0].AsInteger > 0);
  finally
    FreeAndNil(obj);
    FreeAndNil(sb);
  end;
end;

function TChamado.VerificarSolicitacaoAberto(AIdUsuario: Integer): Boolean;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT TOP(1)');
    obj.Lista.Add('   STemp_Solicitacao');
    obj.Lista.Add(' FROM Solicitacao_Tempo');
    obj.Lista.Add('   INNER JOIN Solicitacao_Ocorrencia ON STemp_Solicitacao = SOcor_Solicitacao');
    obj.Lista.Add('   INNER JOIN Solicitacao ON SOcor_Solicitacao = Sol_Id');
    obj.Lista.Add(' WHERE STemp_UsuarioOperacional = ' + IntToStr(AIdUsuario));
    obj.Lista.Add(' AND Sol_Status IN (14,16,18)');
    obj.Lista.Add(' AND STemp_HoraFim IS NULL');
    obj.OpenSQL();

    Result := (obj.Model.Fields[0].AsInteger > 0);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TChamado.Salvar(APrograma, AIdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoEditar(APrograma, AIdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

end.
