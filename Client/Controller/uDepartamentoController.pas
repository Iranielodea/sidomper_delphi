unit uDepartamentoController;

interface

uses
  System.SysUtils, uDMDepartamento, uRegras, uEnumerador, uDM, Data.DB,
    uDepartamentoAcesso, System.Generics.Collections, Vcl.Forms, uDepartamentoAcessoVO,
    uDepartamentoVO, uDepartamentoEmailVO, Data.DBXJSON, Data.DBXJSONReflect,
  uConverter;

type
  TDepartamentoController = class
  private
    FModel: TDMDepartamento;
    FOperacao: TOperacao;
    procedure CarregarListaAcessos;
    procedure Post;
    procedure LocalizarEmail(AIdDepartamento: Integer);
    procedure SalvarAcesso(ADepartamento: TDepartamentoVO);
    procedure SalvarEmail(ADepartamento: TDepartamentoVO); overload;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure LocalizarId(AId: Integer);
    procedure FiltrarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer);
    procedure LocalizarDepartamentoEmail(AIdDepartamento: integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    function SalvarDepartamento(AIdUsuario: Integer): Integer;
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure ListarItens(AIdDepartamento: integer);
    procedure Pesquisar(AId, ACodigo: Integer);
    function MostrarSolicitacao(ALerTodos: Boolean = False): Boolean;
    function MostrarChamados(ALerTodos: Boolean = False): Boolean;
    function MostrarAtividades(ALerTodos: Boolean = False): Boolean;
    function MostrarAgendamento(ALerTodos: Boolean = False): Boolean;
    function CodigoAtual: Integer;
    function IdAtual: Integer;
    function MostrarAnexos(): Boolean;
    function Duplicar(AId: Integer): Integer;
//    function PermitirAbertura(): Boolean;

    property Model: TDMDepartamento read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TDepartamentoController }

uses uFuncoesSIDomper;

procedure TDepartamentoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

procedure TDepartamentoController.CarregarListaAcessos;
var
  Lista: TObjectList<TDepartamentoAcesso>;
  obj: TDepartamentoAcessoNegocio;
  i: Integer;
  count: Integer;
begin
  obj := TDepartamentoAcessoNegocio.Create;
  Lista := TObjectList<TDepartamentoAcesso>.Create();

  Lista := obj.Listar;
  count := Lista.Count -1;

  for i := 0 to count do
  begin
    FModel.CDSItens.Append;
    FModel.CDSItensPrograma.AsString          := TDepartamentoAcesso(Lista.Items[i]).Tabela;
    FModel.CDSItensDepAc_Programa.AsInteger   := TDepartamentoAcesso(Lista.Items[i]).Programa;
    FModel.CDSItensDepAc_Acesso.AsBoolean     := TDepartamentoAcesso(Lista.Items[i]).Acesso;
    FModel.CDSItensDepAc_Incluir.AsBoolean    := TDepartamentoAcesso(Lista.Items[i]).Incluir;
    FModel.CDSItensDepAc_Editar.AsBoolean     := TDepartamentoAcesso(Lista.Items[i]).Editar;
    FModel.CDSItensDepAc_Excluir.AsBoolean    := TDepartamentoAcesso(Lista.Items[i]).Excluir;
    FModel.CDSItensDepAc_Relatorio.AsBoolean  := TDepartamentoAcesso(Lista.Items[i]).Relatorio;
    FModel.CDSItens.Post;
  end;
  FreeAndNil(Lista);
  FreeAndNil(obj);
end;

function TDepartamentoController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroDep_Codigo.AsInteger;
end;

constructor TDepartamentoController.Create;
begin
  inherited Create;
  FModel := TDMDepartamento.Create(nil);
end;

destructor TDepartamentoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

function TDepartamentoController.Duplicar(AId: Integer): Integer;
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há registro para duplicar!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToIntDef(Negocio.DepartamentoDuplicar(AId).ToString(), 0);
  finally
    FreeAndNil(Negocio)
  end;
end;

procedure TDepartamentoController.LocalizarEmail(AIdDepartamento: Integer);
begin
  FModel.CDSDepartamentoEmail.Close;
  FModel.CDSDepartamentoEmail.Params[0].AsInteger := AIdDepartamento;
  FModel.CDSDepartamentoEmail.Open;
end;

procedure TDepartamentoController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CDepartamentoPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    FModel.CDSItens.Close;
    Negocio.LocalizarCodigo(CDepartamentoAcessoPrograma, AId);
    FModel.CDSItens.Open;

    LocalizarEmail(AId);

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TDepartamentoController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CDepartamentoPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TDepartamentoController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CDepartamentoPrograma, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TDepartamentoController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CDepartamentoPrograma, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TDepartamentoController.FiltrarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.DepartamentoFiltrarId(AId);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TDepartamentoController.IdAtual: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.RetornaIdAtual('Departamento');
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TDepartamentoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CDepartamentoPrograma, AIdUsuario);
    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TDepartamentoController.ListarItens(AIdDepartamento: integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSItens.Close;
    Negocio.LocalizarCodigo(CDepartamentoAcessoPrograma, AIdDepartamento);
    FModel.CDSItens.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TDepartamentoController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CDepartamentoPrograma, ACodigo);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TDepartamentoController.LocalizarDepartamentoEmail(
  AIdDepartamento: integer);
begin
  FModel.CDSDepartamentoEmail.Close;
  FModel.CDSDepartamentoEmail.Params[0].AsInteger := AIdDepartamento;
  FModel.CDSDepartamentoEmail.Open;
end;

procedure TDepartamentoController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CDepartamentoPrograma, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TDepartamentoController.MostrarAgendamento(
  ALerTodos: Boolean): Boolean;
var
  flag: Boolean;
begin
  flag := True;
  if ALerTodos then
  begin
    FModel.CDSItens.DisableControls;
    FModel.CDSItens.First;
    while not FModel.CDSItens.Eof do
    begin
      if FModel.CDSItensDepAc_Programa.AsInteger = 112 then
      begin
        flag := FModel.CDSItensDepAc_Acesso.AsBoolean;
        Break;
      end;
      FModel.CDSItens.Next;
    end;
    FModel.CDSItens.First;
    FModel.CDSItens.EnableControls;
  end
  else begin
    if FModel.CDSItensDepAc_Programa.AsInteger = 112 then
      flag := FModel.CDSItensDepAc_Acesso.AsBoolean;
  end;
  Result := flag;
end;

function TDepartamentoController.MostrarAnexos: Boolean;
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.DepartamentoMostrarAnexos(dm.IdUsuario);
  finally
    FreeAndNil(Negocio);
  end;
end;

function TDepartamentoController.MostrarAtividades(ALerTodos: Boolean): Boolean;
var
  flag: Boolean;
begin
  flag := True;
  if ALerTodos then
  begin
    FModel.CDSItens.DisableControls;
    FModel.CDSItens.First;
    while not FModel.CDSItens.Eof do
    begin
      if FModel.CDSItensDepAc_Programa.AsInteger = 111 then
      begin
        flag := FModel.CDSItensDepAc_Acesso.AsBoolean;
        Break;
      end;
      FModel.CDSItens.Next;
    end;
    FModel.CDSItens.First;
    FModel.CDSItens.EnableControls;
  end
  else begin
    if FModel.CDSItensDepAc_Programa.AsInteger = 111 then
      flag := FModel.CDSItensDepAc_Acesso.AsBoolean;
  end;
  Result := flag;
end;

function TDepartamentoController.MostrarChamados(ALerTodos: Boolean): Boolean;
var
  flag: Boolean;
begin
  flag := True;
  if ALerTodos then
  begin
    FModel.CDSItens.DisableControls;
    FModel.CDSItens.First;
    while not FModel.CDSItens.Eof do
    begin
      if FModel.CDSItensDepAc_Programa.AsInteger = 1 then
      begin
        flag := FModel.CDSItensDepAc_Acesso.AsBoolean;
        Break;
      end;
      FModel.CDSItens.Next;
    end;
    FModel.CDSItens.First;
    FModel.CDSItens.EnableControls;
  end
  else begin
    if FModel.CDSItensDepAc_Programa.AsInteger = 1 then
      flag := FModel.CDSItensDepAc_Acesso.AsBoolean;
  end;
  Result := flag;
end;

function TDepartamentoController.MostrarSolicitacao(ALerTodos: Boolean): Boolean;
var
  flag: Boolean;
begin
  flag := True;
  if ALerTodos then
  begin
    FModel.CDSItens.DisableControls;
    FModel.CDSItens.First;
    while not FModel.CDSItens.Eof do
    begin
      if FModel.CDSItensDepAc_Programa.AsInteger = 3 then
      begin
        flag := FModel.CDSItensDepAc_Acesso.AsBoolean;
        Break;
      end;
      FModel.CDSItens.Next;
    end;
    FModel.CDSItens.First;
    FModel.CDSItens.EnableControls;
  end
  else begin
    if FModel.CDSItensDepAc_Programa.AsInteger = 3 then
      flag := FModel.CDSItensDepAc_Acesso.AsBoolean;
  end;
  Result := flag;
end;

procedure TDepartamentoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CDepartamentoPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSItens.Close;
    Negocio.LocalizarCodigo(CDepartamentoAcessoPrograma, 0);
    FModel.CDSItens.Open;

    LocalizarEmail(0);

    CarregarListaAcessos;
    FModel.CDSItens.First;

    FModel.CDSCadastro.Append;

    FModel.CDSCadastroDep_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TDepartamentoController.Pesquisar(AId, ACodigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(ACodigo);
end;

procedure TDepartamentoController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TDepartamentoController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CDepartamentoPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

function TDepartamentoController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
  sResult: string;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CDepartamentoPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TDepartamentoController.SalvarAcesso(
  ADepartamento: TDepartamentoVO);
var
  AcessoVO: TDepartamentoAcessoVO;
  bMostrarSolicitacao: Boolean;
  bMostrarChamado: Boolean;
  bMostrarAtividade: Boolean;
  iDecrementa: Integer;
begin
  bMostrarSolicitacao := False;
  bMostrarChamado := False;
  bMostrarAtividade := False;
  iDecrementa := -1;
  FModel.CDSItens.DisableControls;
  try
    FModel.CDSItens.First;
    while not FModel.CDSItens.Eof do
    begin
      AcessoVO := TDepartamentoAcessoVO.Create;
      if ADepartamento.Id = 0 then
      begin
        AcessoVO.Id := iDecrementa;
        Dec(iDecrementa);
      end
      else
        AcessoVO.Id             := FModel.CDSItensDepAc_Id.AsInteger;
      AcessoVO.IdDepartamento := FModel.CDSItensDepAc_Departamento.AsInteger;
      AcessoVO.Programa       := FModel.CDSItensDepAc_Programa.AsInteger;
      AcessoVO.Acesso         := FModel.CDSItensDepAc_Acesso.AsBoolean;
      AcessoVO.Incluir        := FModel.CDSItensDepAc_Incluir.AsBoolean;
      AcessoVO.Editar         := FModel.CDSItensDepAc_Editar.AsBoolean;
      AcessoVO.Excluir        := FModel.CDSItensDepAc_Excluir.AsBoolean;
      AcessoVO.Relatorio      := FModel.CDSItensDepAc_Relatorio.AsBoolean;

      case AcessoVO.Programa of
        1:   bMostrarChamado      := AcessoVO.Acesso;
        3:   bMostrarSolicitacao  := AcessoVO.Acesso;
        111: bMostrarAtividade    := AcessoVO.Acesso;
      end;
      ADepartamento.DepartamentoAcesso.Add(AcessoVO);

      FModel.CDSItens.Next;
    end;
    FModel.CDSItens.First;
  finally
    FModel.CDSItens.EnableControls;
  end;

  if bMostrarSolicitacao = False then
  begin
    FModel.CDSCadastroDep_SolicitaAbertura.AsBoolean := False;
    FModel.CDSCadastroDep_SolicitaAnalise.AsBoolean := False;
    FModel.CDSCadastroDep_SolicitaOcorGeral.AsBoolean := False;
    FModel.CDSCadastroDep_SolicitaOcorTecnica.AsBoolean := False;
    FModel.CDSCadastroDep_SolicitaOcorRegra.AsBoolean := False;
    FModel.CDSCadastroDep_SolicitaQuadro.AsBoolean := False;
    FModel.CDSCadastroDep_SolicitaStatus.AsBoolean := False;
  end;

  if bMostrarChamado = False then
  begin
    FModel.CDSCadastroDep_ChamadoAbertura.AsBoolean := False;
    FModel.CDSCadastroDep_ChamadoStatus.AsBoolean := False;
    FModel.CDSCadastroDep_ChamadoOcor.AsBoolean := False;
    FModel.CDSCadastroDep_ChamadoQuadro.AsBoolean := False;
  end;

  if bMostrarAtividade = False then
  begin
    FModel.CDSCadastroDep_AtividadeAbertura.AsBoolean := False;
    FModel.CDSCadastroDep_AtividadeStatus.AsBoolean := False;
    FModel.CDSCadastroDep_AtividadeOcor.AsBoolean := False;
    FModel.CDSCadastroDep_AtividadeQuadro.AsBoolean := False;
  end;
end;

function TDepartamentoController.SalvarDepartamento(
  AIdUsuario: Integer): Integer;
var
  Negocio: TServerMethods1Client;
  ObjVO: TDepartamentoVO;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
  Marshal := TJSONMarshal.Create;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      ObjVO := TDepartamentoVO.Create;
      ObjVO.Id := FModel.CDSCadastroDep_Id.AsInteger;
      ObjVO.Codigo := FModel.CDSCadastroDep_Codigo.AsInteger;
      ObjVO.Nome := FModel.CDSCadastroDep_Nome.AsString;
      ObjVO.Ativo := FModel.CDSCadastroDep_Ativo.AsBoolean;
      ObjVO.SolicitacaoAbertura := FModel.CDSCadastroDep_SolicitaAbertura.AsBoolean;
      ObjVO.SolicitacaoAnalise := FModel.CDSCadastroDep_SolicitaAnalise.AsBoolean;
      ObjVO.SolicitacaoOcorrenciaGeral := FModel.CDSCadastroDep_SolicitaOcorGeral.AsBoolean;
      ObjVO.SolicitacaoOcorrenciaTecnica := FModel.CDSCadastroDep_SolicitaOcorTecnica.AsBoolean;
      ObjVO.SolicitacaoStatus := FModel.CDSCadastroDep_SolicitaStatus.AsBoolean;
      ObjVO.SolicitacaoQuadro := FModel.CDSCadastroDep_SolicitaQuadro.AsBoolean;
      ObjVO.ChamadoAbertura := FModel.CDSCadastroDep_ChamadoAbertura.AsBoolean;
      ObjVO.ChamadoStatus := FModel.CDSCadastroDep_ChamadoStatus.AsBoolean;
      ObjVO.ChamadoQuadro := FModel.CDSCadastroDep_ChamadoQuadro.AsBoolean;
      ObjVO.ChamadoOcorrencia := FModel.CDSCadastroDep_ChamadoOcor.AsBoolean;
      ObjVO.AtividadeAbertura := FModel.CDSCadastroDep_AtividadeAbertura.AsBoolean;
      ObjVO.AtividadeStatus := FModel.CDSCadastroDep_AtividadeStatus.AsBoolean;
      ObjVO.AtividadeQuadro := FModel.CDSCadastroDep_AtividadeQuadro.AsBoolean;
      ObjVO.AtividadeOcorrencia := FModel.CDSCadastroDep_AtividadeOcor.AsBoolean;
      ObjVO.AgendamentoQuadro := FModel.CDSCadastroDep_AgendamentoQuadro.AsBoolean;
      ObjVO.MostrarAnexos := FModel.CDSCadastroDep_MostrarAnexos.AsBoolean;
      ObjVO.SolicitacaoOcorrenciaRegra := FModel.CDSCadastroDep_SolicitaOcorRegra.AsBoolean;
      ObjVO.HoraInicial := FModel.CDSCadastroDep_HoraAtendeInicial.AsDateTime;
      ObjVO.HoraFinal := FModel.CDSCadastroDep_HoraAtendeFinal.AsDateTime;

      SalvarAcesso(ObjVO);
      SalvarEmail(ObjVO);

      oObjetoJSON := Marshal.Marshal(ObjVO);
      Result := StrToIntDef(Negocio.DepartamentoSalvar(oObjetoJSON).ToString(),0);
      FOperacao := opNavegar;
    except
      ON E: Exception do
      begin
        TFuncoes.MensagemErroBanco(E.Message);
        Abort;
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Marshal);
    FreeAndNil(ObjVO);
  end;
end;

procedure TDepartamentoController.SalvarEmail(ADepartamento: TDepartamentoVO);
var
  Email: TDepartamentoEmailVO;
begin
  FModel.CDSDepartamentoEmail.DisableControls;
  try
    FModel.CDSDepartamentoEmail.First;
    while not FModel.CDSDepartamentoEmail.Eof do
    begin
      Email := TDepartamentoEmailVO.Create;
      Email.Id              := FModel.CDSDepartamentoEmailDepEm_Id.AsInteger;
      Email.IdDepartamento  := FModel.CDSCadastroDep_Id.AsInteger; // CDSDepartamentoEmailDepEm_Departamento.AsInteger;
      Email.Email           := FModel.CDSDepartamentoEmailDepEm_Email.AsString;

      ADepartamento.DepartamentoEmail.Add(Email);
      FModel.CDSDepartamentoEmail.Next;
    end;
    FModel.CDSDepartamentoEmail.First;
  finally
    FModel.CDSDepartamentoEmail.EnableControls;
  end;
end;

end.
