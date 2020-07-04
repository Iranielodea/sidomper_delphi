unit uSolicitacaoController;

interface

uses
  System.SysUtils, uDMSolicitacao, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  Data.DBXJSON , Data.DBXJSONReflect, uFiltroSolicitacao, System.Generics.Collections,
  uSolicitacaoTempoVO, uConverter, uDMRelSolicitacao, uTipoController, uTipoVO, uSolicitacaoViewModel,
  uPermissaoSolicitacaoVO, uSolicitacaoVO;

type TEnClassificacao = (claOcorrGeral=1, claOcorrTecnica=2, claOcorrRegra=3);

type
  TSolicitacaoController = class
  private
    FModel: TDMSolicitacao;
    FOperacao: TOperacao;
    procedure Post;

    procedure SalvarCronongrama(AIdSolicitacao: Integer);
    procedure SalvarOcorrenciaGeral(AIdSolicitacao: Integer);
    procedure SalvarOcorrenciaTecnica(AIdSolicitacao: Integer);
    procedure SalvarOcorrenciaRegra(AIdSolicitacao: Integer);

    procedure PreencheQuadros(ADataSet: TDataSet);
    procedure PreencherQuadrosJSON(ADAtaSet: TDataSet; AItem: TSolicitacaoViewModel);
    procedure ObservacaoPadrao;
    procedure TipoUmRegistro;
  public
    procedure FiltrarCodigo(ACodigo: Integer);
    function CodigoAtual: Integer;
    procedure Filtrar(APrograma: Integer; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarSolicitacao(AFiltro: TFiltroSolicitacao; ACampo, ATexto: string; AIdUsuario: Integer; AContem: Boolean = False);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(Id: Integer);
    function RetornaIdSolicitacao(AIdSolicitacao: Integer): Integer;

    procedure LocalizarCronograma(AIdSolicitacao: Integer);
    procedure LocalizarOcorrenciaGeral(AIdSolicitacao: Integer);
    procedure LocalizarOcorrenciaTecnica(AIdSolicitacao: Integer);
    procedure LocalizarOcorrenciaRegra(AIdSolicitacao: Integer);
    procedure LocalizarStatus(AIdSolicitacao: Integer);

    procedure CancelarOcorrenciaGeral;
    procedure CancelarOcorrenciaTecnica;
    procedure CancelarOcorrenciaRegra;
    procedure CancelarCronograma;

    procedure ExcluirOcorrenciaGeral;
    procedure ExcluirOcorrenciaTecnica;
    procedure ExcluirOcorrenciaRegra;
    procedure ExcluirCronograma;

    function RetornarEmails(AIdSolicitacao, AIdUsuario, AIdStatus: Integer): string;
    function RetornarEmailsCliente(AIdSolicitacao: Integer): string;

    function PermissoesSolicitacao(AIdUsuario: Integer): TPermissaoSolicitacaoVO;
    function PermissaoAbertura(AIdUsuario: Integer): Boolean;
    function PermissaoAnalise(AIdUsuario: Integer): Boolean;
    function PermissaoOcorrenciaGeral(AIdUsuario: Integer): Boolean;
    function PermissaoOcorrenciaTecnica(AIdUsuario: Integer): Boolean;
    function PermissaoOcorrenciaRegra(AIdUsuario: Integer): Boolean;
    function PermissaoStatus(AIdUsuario: Integer): Boolean;
    function PermissaoQuadro(AIdUsuario: Integer): Boolean;

    procedure ModoEdicaoInsercao;
    procedure ModoEdicaoInsercaoCronograma;
    procedure ModoEdicaoInsercaoOcorrencia;
    procedure ModoEdicaoInsercaoOcorrenciaRegra;
    procedure ModoEdicaoInsercaoOcorrenciaTecnica;

    procedure PostOcorrenciaGeral;
    procedure PostOcorrenciaTecnico;
    procedure PostOcorrenciaRegra;
    procedure PostCronograma;

    procedure AbrirQuadro1(AIdUsuario: integer);
    procedure AbrirQuadro2(AIdUsuario: integer);
    procedure AbrirQuadro3(AIdUsuario: integer);
    procedure AbrirQuadro4(AIdUsuario: integer);
    procedure AbrirQuadro5(AIdUsuario: integer);
    procedure AbrirQuadro6(AIdUsuario: integer);
    procedure AbrirQuadro7(AIdUsuario: integer);
    procedure AbrirQuadro8(AIdUsuario: integer);
    procedure AbrirQuadro9(AIdUsuario: integer);
    procedure AbrirQuadro10(AIdUsuario: integer);
    procedure AbrirQuadro11(AIdUsuario: integer);
    procedure AbrirQuadro12(AIdUsuario: integer);
    procedure AbrirQuadro(AIdUsuario: integer);
    function AbrirQuadroSolicitacaoJSON(AIdUsuario: integer): TObjectList<TSolicitacaoViewModel>;
    function SolicitacaoPorCategoria(AIdCategoria, AIdUsuario: Integer): TObjectList<TSolicitacaoVO>;

    procedure PreencherTodosQuadros(AIdUsuario: integer);
    procedure PreencherTodosQuadrosJSON(AIdUsuario: integer);

    procedure LimparQuadros(ADataSet: TDataSet);

    function StatusAbertura: string;
    function StatusOcorrencia: string;

    procedure SolicitacaoAnexos(AIdSolicitacao: integer);

    function PermissaoEditar(AId: Integer): Boolean;
    function RetornarCodigoStatusSolicitacao(AIdSolicitacao: integer): string;
    procedure UpdateHoraUsuarioAtual(AIdSolicitacao: Integer);
    procedure UpdateStatus(AIdSolicitacao, AIdStatus: Integer);
    procedure FecharTelaTempo();
    procedure ListarProblemaSolucao(AFiltro: TFiltroSolicitacao; ATexto: string; AIdUsuario: Integer);
//------------------------------------------------------------------------------
// Solicitacao Tempo
//------------------------------------------------------------------------------
    procedure Iniciar(ASolicitacaoTempo: TSolicitacaoTempoVO);
    procedure Finalizar(AIdUsuario: Integer; ASolicitacaoTempo: TSolicitacaoTempoVO;
      AValidarUsuario: Boolean=True);
    function RetornarListaStatusTempo: TList<string>;
    function SolicitacaoAtualAberta(AIdSolicitacao: Integer): Boolean;
    function SolicitacaoTempoLocalizarPorSolicitacao(AIdSolicitacao: Integer): TObjectList<TSolicitacaoTempoVO>;

    procedure SolicitacaoTempoExcluir(AId: Integer);
    function SolicitacaoTempoSalvar(ASolicitacaoTempo: TSolicitacaoTempoVO): Integer;
    function SolicitacaoTempoPermissao(AIdUsuario: Integer): Boolean;
    function SolicitacaoTempoObterPorId(AId: Integer): TSolicitacaoTempoVO;
    function SolicitacaoTempoRetornarAgrupadoStatus(AIdSolicitacao: Integer): TObjectList<TSolicitacaoTempoVO>;
    function SolicitacaoTempoFiltrarPorData(AData: string; AId: Integer): TObjectList<TSolicitacaoTempoVO>;
    function ConferenciaPorData(AData: string; AIdUsuario: Integer): TObjectList<TSolicitacaoTempoVO>;
//------------------------------------------------------------------------------
// relatorios
//------------------------------------------------------------------------------
    procedure Relatorios(AModelo, AIdUsuario: Integer; AFiltro: TFiltroSolicitacao;
      AMostrarTempo: Boolean);

    property Model: TDMSolicitacao read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TSolicitacaoController }

uses uFuncoesSIDomper, uUsuarioController, uClienteController, uClienteModuloController,
  uSolicitacaoStatusVO, uParametrosController, uObsevacaoController;

procedure TSolicitacaoController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSConsulta.Close;
      Negocio.FiltrarCodigo(CSolicitacaoPrograma, ACodigo);
      FModel.CDSConsulta.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.FiltrarCodigo');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.CodigoAtual: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.RetornaIdAtual('Solicitacao');
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.ConferenciaPorData(AData: string;
  AIdUsuario: Integer): TObjectList<TSolicitacaoTempoVO>;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := TConverte.JSONToObject<TListaSolicitacaoTempo>(Negocio.ConferenciaFiltrarPorData(AData, AIdUsuario));
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.AbrirQuadro(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSQuadro.Close;
      Negocio.SolicitracaoQuadro(AIdUsuario);
      FModel.CDSQuadro.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro1(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro1.Close;
  //    Negocio.FiltrarSolicitacaoQuadro1(IdUsuario);
      FModel.CDSSolicitacaoQuadro1.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro1');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro10(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro10.Close;
      Negocio.FiltrarSolicitacaoQuadro10(AIdUsuario);
      FModel.CDSSolicitacaoQuadro10.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro10');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro11(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro11.Close;
      Negocio.FiltrarSolicitacaoQuadro11(AIdUsuario);
      FModel.CDSSolicitacaoQuadro11.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro11');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro12(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro12.Close;
      Negocio.FiltrarSolicitacaoQuadro12(AIdUsuario);
      FModel.CDSSolicitacaoQuadro12.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro12');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro2(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro2.Close;
      Negocio.FiltrarSolicitacaoQuadro2(AIdUsuario);
      FModel.CDSSolicitacaoQuadro2.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro2');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro3(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro3.Close;
      Negocio.FiltrarSolicitacaoQuadro3(AIdUsuario);
      FModel.CDSSolicitacaoQuadro3.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro3');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro4(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro4.Close;
      Negocio.FiltrarSolicitacaoQuadro4(AIdUsuario);
      FModel.CDSSolicitacaoQuadro4.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro4');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro5(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro5.Close;
      Negocio.FiltrarSolicitacaoQuadro5(AIdUsuario);
      FModel.CDSSolicitacaoQuadro5.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro5');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro6(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro6.Close;
      Negocio.FiltrarSolicitacaoQuadro6(AIdUsuario);
      FModel.CDSSolicitacaoQuadro6.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro6');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro7(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro7.Close;
      Negocio.FiltrarSolicitacaoQuadro7(AIdUsuario);
      FModel.CDSSolicitacaoQuadro7.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro7');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro8(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro8.Close;
      Negocio.FiltrarSolicitacaoQuadro8(AIdUsuario);
      FModel.CDSSolicitacaoQuadro8.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro8');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.AbrirQuadro9(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoQuadro9.Close;
      Negocio.FiltrarSolicitacaoQuadro9(AIdUsuario);
      FModel.CDSSolicitacaoQuadro9.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.AbrirQuadro9');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TSolicitacaoController.AbrirQuadroSolicitacaoJSON(
  AIdUsuario: integer): TObjectList<TSolicitacaoViewModel>;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := TConverte.JSONToObject<TListaSolicitacaoViewModel>(Negocio.SolicitacaoQuadroJSON(AIdUsuario));
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'AbrirQuadroSolicitacaoJSON');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;

  if FModel.CDSCronogramaConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSCronogramaConsulta.Cancel;
end;

procedure TSolicitacaoController.CancelarCronograma;
begin
  if FModel.CDSCronogramaConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSCronogramaConsulta.Cancel;
end;

procedure TSolicitacaoController.CancelarOcorrenciaGeral;
begin
  if FModel.CDSOcorrenciaGeralConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSOcorrenciaGeralConsulta.Cancel;
end;

procedure TSolicitacaoController.CancelarOcorrenciaRegra;
begin
  if FModel.CDSOcorrenciaRegraConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSOcorrenciaRegraConsulta.Cancel;
end;

procedure TSolicitacaoController.CancelarOcorrenciaTecnica;
begin
  if FModel.CDSOcorrenciaTecnicaConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSOcorrenciaTecnicaConsulta.Cancel;
end;

constructor TSolicitacaoController.Create;
begin
  inherited Create;
  try
    FModel := TDMSolicitacao.Create(nil);
  except
    On E: Exception do
    begin
      TFuncoes.Excessao(E, 'TSolicitacaoController.Create');
    end;
  end;
end;

destructor TSolicitacaoController.Destroy;
begin
  try
    FreeAndNil(FModel);
  except
    On E: Exception do
    begin
      TFuncoes.Excessao(E, 'TSolicitacaoController.Destroy');
    end;
  end;
  inherited;
end;

procedure TSolicitacaoController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Resultado := Negocio.Editar(CSolicitacaoPrograma, dm.IdUsuario, AId);
      FModel.CDSCadastro.Open;

      LocalizarCronograma(AId);
      LocalizarOcorrenciaGeral(AId);
      LocalizarOcorrenciaTecnica(AId);
      LocalizarOcorrenciaRegra(AId);
      LocalizarStatus(AId);

      TFuncoes.HabilitarCampo(AFormulario, Resultado);

      FOperacao := opEditar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.Editar');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.Excluir(CSolicitacaoPrograma, AIdUsuario, AId);
      FModel.CDSConsulta.Delete;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.Excluir');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.ExcluirCronograma;
begin
  if FModel.CDSCronogramaConsulta.IsEmpty then
    raise Exception.Create('N�o h� Registro para Excluir.');
  FModel.CDSCronogramaConsulta.Delete;
end;

procedure TSolicitacaoController.ExcluirOcorrenciaGeral;
begin
  if FModel.CDSOcorrenciaGeralConsulta.IsEmpty then
    raise Exception.Create('N�o h� Registro para Excluir.');
  FModel.CDSOcorrenciaGeralConsulta.Delete;
end;

procedure TSolicitacaoController.ExcluirOcorrenciaRegra;
begin
  if FModel.CDSOcorrenciaRegraConsulta.IsEmpty then
    raise Exception.Create('N�o h� Registro para Excluir.');
  FModel.CDSOcorrenciaRegraConsulta.Delete;
end;

procedure TSolicitacaoController.ExcluirOcorrenciaTecnica;
begin
  if FModel.CDSOcorrenciaTecnicaConsulta.IsEmpty then
    raise Exception.Create('N�o h� Registro para Excluir.');
  FModel.CDSOcorrenciaTecnicaConsulta.Delete;
end;

procedure TSolicitacaoController.FecharTelaTempo;
begin
  if TFuncoes.ProcessExists(PROCESSO_TEMPO) then
    TFuncoes.ProcessDelete(PROCESSO_TEMPO);
end;

procedure TSolicitacaoController.Filtrar(APrograma:Integer; ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSConsulta.Close;
      Negocio.Filtrar(APrograma, ACampo, ATexto,  AAtivo, AContem);
      FModel.CDSConsulta.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.Filtrar');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.FiltrarSolicitacao(AFiltro: TFiltroSolicitacao; ACampo, ATexto: string;
  AIdUsuario: Integer; AContem: Boolean);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSConsulta.Close;
      Negocio.FiltrarSolicitacao(oObjetoJSON, ACampo, ATexto, AIdUsuario, AContem);
      FModel.CDSConsulta.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.FiltrarSolicitacao');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.Finalizar(AIdUsuario: Integer;
  ASolicitacaoTempo: TSolicitacaoTempoVO; AValidarUsuario: Boolean);
var
  Negocio: TServerMethods1Client;
  objJson: TJSONValue;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    objJson := TConverte.ObjectToJSON(ASolicitacaoTempo);
    Negocio.SolicitacaoTempoFinalizar(AIdUsuario, objJson, AValidarUsuario);
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      Negocio.Relatorio(CSolicitacaoPrograma, AIdUsuario);
//    FModel.Rel.Print;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.Imprimir');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.Iniciar(
  ASolicitacaoTempo: TSolicitacaoTempoVO);
var
  Negocio: TServerMethods1Client;
  objJson: TJSONValue;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    objJson := TConverte.ObjectToJSON(ASolicitacaoTempo);
    Negocio.SolicitacaoTempoIniciar(dm.IdUsuario, objJson);
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.LimparQuadros(ADataSet: TDataSet);
begin
  ADataSet.DisableControls;
  try
    ADataSet.First;
    while not ADataSet.Eof do
      ADataSet.Delete;
  finally
    ADataSet.EnableControls;
  end;
end;

procedure TSolicitacaoController.ListarProblemaSolucao(
  AFiltro: TFiltroSolicitacao; ATexto: string; AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
//  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
// serializa o objeto
//  Marshal := TJSONMarshal.Create;
//  try
//    oObjetoJSON := Marshal.Marshal(AFiltro);
//  finally
//    FreeAndNil(Marshal);
//  end;

  oObjetoJSON := TConverte.ObjectToJSON(AFiltro);

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSListarProblemaSolucao.Close;
      Negocio.SolicitacaoListarProblemaSolucao(oObjetoJSON, ATexto, AIdUsuario);
      FModel.CDSListarProblemaSolucao.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.ListarProblemaSolucao');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.LocalizarCodigo(ACodigo: integer);
//var
//  Negocio: TServerMethods1Client;
begin
//  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
//  try
//    FModel.CDSCadastro.Close;
//    Negocio.LocalizarCodigo(CSolicitacaoPrograma, Codigo);
//    FModel.CDSCadastro.Open;
//  finally
//    FreeAndNil(Negocio);
//  end;
end;

procedure TSolicitacaoController.LocalizarCronograma(AIdSolicitacao: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCronogramaConsulta.Close;
      Negocio.LocalizarCronogramaIdSolicitacao(AIdSolicitacao);
      FModel.CDSCronogramaConsulta.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.LocalizarCronograma');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Negocio.LocalizarId(CSolicitacaoPrograma, AId);
      FModel.CDSCadastro.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.LocalizarId');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.LocalizarOcorrenciaGeral(
  AIdSolicitacao: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSOcorrenciaGeralConsulta.Close;
      Negocio.LocalizarOcorrenciaGeralIdSolicitacao(AIdSolicitacao);
      FModel.CDSOcorrenciaGeralConsulta.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.LocalizarOcorrenciaGeral');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.LocalizarOcorrenciaRegra(
  AIdSolicitacao: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSOcorrenciaRegraConsulta.Close;
      Negocio.LocalizarOcorrenciaRegraIdSolicitacao(AIdSolicitacao);
      FModel.CDSOcorrenciaRegraConsulta.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.LocalizarOcorrenciaRegraIdSolicitacao');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.LocalizarOcorrenciaTecnica(
  AIdSolicitacao: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSOcorrenciaTecnicaConsulta.Close;
      Negocio.LocalizarOcorrenciaTecnicaIdSolicitacao(AIdSolicitacao);
      FModel.CDSOcorrenciaTecnicaConsulta.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.LocalizarOcorrenciaTecnica');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.LocalizarStatus(AIdSolicitacao: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSStatusConsulta.Close;
      Negocio.LocalizarSolicitacaoStatus(AIdSolicitacao);
      FModel.CDSStatusConsulta.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.LocalizarStatus');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.ModoEdicaoInsercao;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSCadastro);
end;

procedure TSolicitacaoController.ModoEdicaoInsercaoCronograma;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSCronogramaConsulta);
end;

procedure TSolicitacaoController.ModoEdicaoInsercaoOcorrencia;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSOcorrenciaGeralConsulta);
end;

procedure TSolicitacaoController.ModoEdicaoInsercaoOcorrenciaRegra;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSOcorrenciaRegraConsulta);
end;

procedure TSolicitacaoController.ModoEdicaoInsercaoOcorrenciaTecnica;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSOcorrenciaTecnicaConsulta);
end;

procedure TSolicitacaoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  Usuario: TUsuarioController;
  Cliente: TClienteController;
  IdCliente: Integer;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Negocio.Novo(CSolicitacaoPrograma, AIdUsuario);
      FModel.CDSCadastro.Open;

      FModel.CDSCadastro.Append;

      LocalizarCronograma(0);
      LocalizarOcorrenciaGeral(0);
      LocalizarOcorrenciaTecnica(0);
      LocalizarOcorrenciaRegra(0);
      LocalizarStatus(0);
  //------------------------------------------------------------------------------
  // usuario logado
      Usuario := TUsuarioController.Create;

      try
        Usuario.LocalizarId(AIdUsuario);
        FModel.CDSCadastroSol_UsuarioAbertura.AsInteger := Usuario.Model.CDSCadastroUsu_Id.AsInteger;
        FModel.CDSCadastroUAb_Codigo.AsInteger := Usuario.Model.CDSCadastroUsu_Codigo.AsInteger;
        FModel.CDSCadastroUAb_Nome.AsString := Usuario.Model.CDSCadastroUsu_Nome.AsString;
        IdCliente := Usuario.Model.CDSCadastroUsu_Cliente.AsInteger;
      finally
        FreeAndNil(Usuario);
      end;
  //------------------------------------------------------------------------------
  // Cliente do usuario logado
      if IdCliente > 0 then
      begin
        Cliente := TClienteController.Create;
        try
          Cliente.LocalizarId(IdCliente);
          FModel.CDSCadastroSol_Cliente.AsInteger := IdCliente;
          FModel.CDSCadastroCli_Codigo.AsInteger := Cliente.Model.CDSCadastroCli_Codigo.AsInteger;
          FModel.CDSCadastroCli_Nome.AsString := Cliente.Model.CDSCadastroCli_Nome.AsString;
        finally
          FreeAndNil(Cliente);
        end;
      end;

      ObservacaoPadrao();
      TipoUmRegistro();

      FOperacao := opIncluir;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.Novo');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.ObservacaoPadrao;
var
  Obs: TObservacaoController;
begin
  Obs := TObservacaoController.Create;
  try
    Obs.LocalizarPadrao(prSolicitacao);
    FModel.CDSCadastroSol_Descricao.AsString := Obs.Model.CDSCadastroObs_Descricao.AsString;
  finally
    FreeAndNil(Obs);
  end;
end;

function TSolicitacaoController.PermissaoAbertura(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoSolicitacaoAbertura(AIdUsuario);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.PermissaoAbertura');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.PermissaoAnalise(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoSolicitacaoAnalise(AIdUsuario);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.PermissaoAnalise');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.PermissaoEditar(AId: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Resultado := Negocio.Editar(CSolicitacaoPrograma, dm.IdUsuario, AId);
      FModel.CDSCadastro.Open;

      Result := Resultado;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.PermissaoEditar');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TSolicitacaoController.PermissaoOcorrenciaGeral(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoSolicitacaoOcorrenciaGeral(AIdUsuario);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.PermissaoOcorrenciaGeral');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.PermissaoOcorrenciaRegra(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoSolicitacaoOcorrenciaRegra(AIdUsuario);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.PermissaoOcorrenciaRegra');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.PermissaoOcorrenciaTecnica(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoSolicitacaoOcorrenciaTecnica(AIdUsuario);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.PermissaoOcorrenciaTecnica');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.PermissaoQuadro(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoSolicitacaoQuadro(AIdUsuario);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.PermissaoQuadro');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.PermissaoStatus(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoSolicitacaoStatus(AIdUsuario);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.PermissaoStatus');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.PermissoesSolicitacao(
  AIdUsuario: Integer): TPermissaoSolicitacaoVO;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := TConverte.JSONToObject<TPermissaoSolicitacaoVO>(Negocio.PermissaoSolicitacoes(AIdUsuario));
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.Pesquisar(Id: Integer);
begin
  LocalizarId(Id);
  if FModel.CDSCadastroSol_Id.AsInteger = 0 then
    raise Exception.Create('Solicita��o n�o Encontrada.');
end;

procedure TSolicitacaoController.Post;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Post;
end;

procedure TSolicitacaoController.PostCronograma;
begin
  if FModel.CDSCronogramaConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSCronogramaConsulta.Post;
end;


procedure TSolicitacaoController.PostOcorrenciaGeral;
begin
  if FModel.CDSOcorrenciaGeralConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSOcorrenciaGeralConsulta.Post;
end;

procedure TSolicitacaoController.PostOcorrenciaRegra;
begin
  if FModel.CDSOcorrenciaRegraConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSOcorrenciaRegraConsulta.Post;
end;

procedure TSolicitacaoController.PostOcorrenciaTecnico;
begin
  if FModel.CDSOcorrenciaTecnicaConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSOcorrenciaTecnicaConsulta.Post;
end;

procedure TSolicitacaoController.PreencheQuadros(ADataSet: TDataSet);
begin
  ADataSet.DisableControls;
  try
    ADataSet.Append;
    ADataSet.FieldByName('Sol_Id').AsInteger := FModel.cdsQuadroSol_Id.AsInteger;
    ADataSet.FieldByName('Sol_Titulo').AsString := FModel.cdsQuadroSol_Titulo.AsString;
    ADataSet.FieldByName('Cli_Nome').AsString := FModel.CDSQuadroCli_Nome.AsString;
    ADataSet.FieldByName('Usu_Nome').AsString := FModel.CDSQuadroUsu_Nome.AsString;
    ADataSet.FieldByName('Sol_UsuarioAtendeAtual').AsString := FModel.cdsQuadroSol_UsuarioAtendeAtual.AsString;
    ADataSet.FieldByName('Nivel').AsInteger := FModel.cdsQuadroNivel.AsInteger;
    ADataSet.FieldByName('Aberta').AsInteger := FModel.cdsQuadroAberta.AsInteger;
    ADataSet.FieldByName('Sol_StatusId').AsInteger := FModel.cdsQuadroSol_Status.AsInteger;
    ADataSet.Post;
  finally
    ADataSet.EnableControls;
  end;
end;

procedure TSolicitacaoController.PreencherQuadrosJSON(ADAtaSet: TDataSet;
  AItem: TSolicitacaoViewModel);
begin
  ADataSet.DisableControls;
  try
    ADataSet.Append;
    ADataSet.FieldByName('Sol_Id').AsInteger := AItem.Id;
    ADataSet.FieldByName('Sol_Titulo').AsString := AItem.Titulo;
    ADataSet.FieldByName('Cli_Nome').AsString := AItem.NomeCliente;
    ADataSet.FieldByName('Usu_Nome').AsString := AItem.UsuarioNome;
    ADataSet.FieldByName('Sol_UsuarioAtendeAtual').AsString := AItem.IdUsuarioAtendeAtual.ToString();
    ADataSet.FieldByName('Nivel').AsInteger := StrToIntDef(AItem.Nivel,0);
    ADataSet.FieldByName('Aberta').AsInteger := AItem.Aberta;
    ADataSet.FieldByName('Sol_StatusId').AsInteger := AItem.IdStatus;
    ADataSet.FieldByName('Cli_Perfil').AsString := AItem.Perfil;
    ADataSet.Post;
  finally
    ADataSet.EnableControls;
  end;
end;

procedure TSolicitacaoController.PreencherTodosQuadros(AIdUsuario: integer);
var
  iQuadro: Integer;
begin
  AbrirQuadro(AIdUsuario);
  FModel.CDSQuadro.DisableControls;
  try
    LimparQuadros(FModel.CDSQuadro1);
    LimparQuadros(FModel.CDSQuadro2);
    LimparQuadros(FModel.CDSQuadro3);
    LimparQuadros(FModel.CDSQuadro4);
    LimparQuadros(FModel.CDSQuadro5);
    LimparQuadros(FModel.CDSQuadro6);
    LimparQuadros(FModel.CDSQuadro7);
    LimparQuadros(FModel.CDSQuadro8);
    LimparQuadros(FModel.CDSQuadro9);
    LimparQuadros(FModel.CDSQuadro10);
    LimparQuadros(FModel.CDSQuadro11);
    LimparQuadros(FModel.CDSQuadro12);

    FModel.CDSQuadro.First;
    while not FModel.CDSQuadro.Eof do
    begin
      iQuadro := StrToInt(Copy(FModel.CDSQuadroQuadro.AsString, 2, 2));
      case iQuadro of
        1: PreencheQuadros(FModel.CDSQuadro1);
        2: PreencheQuadros(FModel.CDSQuadro2);
        3: PreencheQuadros(FModel.CDSQuadro3);
        4: PreencheQuadros(FModel.CDSQuadro4);
        5: PreencheQuadros(FModel.CDSQuadro5);
        6: PreencheQuadros(FModel.CDSQuadro6);
        7: PreencheQuadros(FModel.CDSQuadro7);
        8: PreencheQuadros(FModel.CDSQuadro8);
        9: PreencheQuadros(FModel.CDSQuadro9);
        10: PreencheQuadros(FModel.CDSQuadro10);
        11: PreencheQuadros(FModel.CDSQuadro11);
        12: PreencheQuadros(FModel.CDSQuadro12);
      end;
      FModel.CDSQuadro.Next;
    end;
    FModel.CDSQuadro.First;
  finally
    FModel.CDSQuadro.EnableControls;
  end;
end;

procedure TSolicitacaoController.PreencherTodosQuadrosJSON(AIdUsuario: integer);
var
  iQuadro: Integer;
  item: TSolicitacaoViewModel;
  Lista: TObjectList<TSolicitacaoViewModel>;
begin
  Lista := AbrirQuadroSolicitacaoJSON(AIdUsuario);
  try
    LimparQuadros(FModel.CDSQuadro1);
    LimparQuadros(FModel.CDSQuadro2);
    LimparQuadros(FModel.CDSQuadro3);
    LimparQuadros(FModel.CDSQuadro4);
    LimparQuadros(FModel.CDSQuadro5);
    LimparQuadros(FModel.CDSQuadro6);
    LimparQuadros(FModel.CDSQuadro7);
    LimparQuadros(FModel.CDSQuadro8);
    LimparQuadros(FModel.CDSQuadro9);
    LimparQuadros(FModel.CDSQuadro10);
    LimparQuadros(FModel.CDSQuadro11);
    LimparQuadros(FModel.CDSQuadro12);

    for item in Lista do
    begin
      iQuadro := StrToInt(Copy(item.Quadro, 2, 2));
      case iQuadro of
        1:  PreencherQuadrosJSON(FModel.CDSQuadro1, item);
        2:  PreencherQuadrosJSON(FModel.CDSQuadro2, item);
        3:  PreencherQuadrosJSON(FModel.CDSQuadro3, item);
        4:  PreencherQuadrosJSON(FModel.CDSQuadro4, item);
        5:  PreencherQuadrosJSON(FModel.CDSQuadro5, item);
        6:  PreencherQuadrosJSON(FModel.CDSQuadro6, item);
        7:  PreencherQuadrosJSON(FModel.CDSQuadro7, item);
        8:  PreencherQuadrosJSON(FModel.CDSQuadro8, item);
        9:  PreencherQuadrosJSON(FModel.CDSQuadro9, item);
        10: PreencherQuadrosJSON(FModel.CDSQuadro10, item);
        11: PreencherQuadrosJSON(FModel.CDSQuadro11, item);
        12: PreencherQuadrosJSON(FModel.CDSQuadro12, item);
      end;
    end;
  finally
    FreeAndNil(Lista);
  end;
end;

function TSolicitacaoController.ProximoCodigo: Integer;
//var
//  Negocio: TServerMethods1Client;
begin
//  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
//  try
//    Result := StrToInt(Negocio.ProximoCodigo(CRevendaPrograma).ToString);
//  finally
//    FreeAndNil(Negocio);
//  end;
end;

function TSolicitacaoController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := StrToInt(Negocio.ProximoId(CSolicitacaoPrograma).ToString);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.ProximoId');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.Relatorios(AModelo, AIdUsuario: Integer;
  AFiltro: TFiltroSolicitacao; AMostrarTempo: Boolean);
var
  Negocio: TServerMethods1Client;
  objJSON: TJSONValue;
  objRelatorio: TDMRelSolicitacao;
  Qtde: Integer;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  objRelatorio := TDMRelSolicitacao.Create(nil);
  Qtde := 0;
  try
    try
      objJSON := TConverte.ObjectToJSON(AFiltro);
      Negocio.SolicitacaoRelatorio(AModelo, AIdUsuario, objJSON, Qtde);
      case AModelo of
        1: objRelatorio.ImprimirRelatorio1(AFiltro.DataInicial, AFiltro.DataFinal, AMostrarTempo, Qtde);
        2: objRelatorio.ImprimirRelatorioPorTipo(AFiltro.DataInicial, AFiltro.DataFinal);
        3: objRelatorio.ImprimirRelatorioPorStatus(AFiltro.DataInicial, AFiltro.DataFinal);
      end;

    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.RetornaIdSolicitacao');
      end;
    end;
  finally
    FreeAndNil(objRelatorio);
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.RetornaIdSolicitacao(
  AIdSolicitacao: Integer): Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := StrToInt(Negocio.RetornaNumeroSolicitacao(AIdSolicitacao).ToString);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.RetornaIdSolicitacao');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.RetornarCodigoStatusSolicitacao(
  AIdSolicitacao: integer): string;
var
  Negocio: TServerMethods1Client;
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  sb.AppendLine(' SELECT');
  sb.AppendLine('   Sta_Codigo');
  sb.AppendLine('FROM Sol');
  sb.AppendLine('	  INNER JOIN Status ON Sol_Status = Sta_Id');
  sb.AppendLine(' WHERE Sol_Id = '  + IntToStr(AIdSolicitacao));

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.SelectSQL(sb.ToString);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.RetornarCodigoStatusSolicitacao');
      end;
    end;
  finally
    FreeAndNil(sb);
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.RetornarEmails(AIdSolicitacao, AIdUsuario,
  AIdStatus: Integer): string;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.RetornarSolicitacaoEmails(AIdSolicitacao, AIdUsuario, AIdStatus);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.RetornarEmails');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TSolicitacaoController.RetornarEmailsCliente(
  AIdSolicitacao: Integer): string;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.RetornarSolicitacaoEmailCliente(AIdSolicitacao, dm.IdUsuario);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.RetornarEmailsCliente');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TSolicitacaoController.RetornarListaStatusTempo: TList<string>;
var
  Negocio: TServerMethods1Client;
  ListaJSon: TJSONArray;
  i: Integer;
  Lista: TList<string>;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    ListaJSon := Negocio.SolicitacaoTempoListarStatus();
    Lista := TList<string>.Create;

    for I := 0 to ListaJSon.Size -1 do
      Lista.Add(ListaJSon.Get(i).Value);

  finally
    FreeAndNil(Negocio);
  end;
  Result := Lista;
end;

procedure TSolicitacaoController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  lOperacao: TOperacao;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  obj: TSolicitacaoStatusVO;
  IdSolicitacao: Integer;
begin
  if TFuncoes.DataEmBrancoNula(FModel.CDSCadastroSol_Data.AsString) then
    raise Exception.Create('Informe a Data da Abertura!');

  if FModel.CDSCadastroSol_Cliente.AsInteger = 0 then
    raise Exception.Create('Informe o Cliente!');

  if FModel.CDSCadastroSol_UsuarioAbertura.AsInteger = 0 then
    raise Exception.Create('Informe o Usu�rio para Abertura!');

  if Trim(FModel.CDSCadastroSol_Titulo.AsString) = '' then
    raise Exception.Create('Informe o T�tulo!');

  if Trim(FModel.CDSCadastroSol_Descricao.AsString) = '' then
    raise Exception.Create('Informe a Descri��o!');

  if FModel.CDSCadastroSol_Status.AsInteger = 0 then
    raise Exception.Create('Informe o Status!');

  if FModel.CDSCadastroSol_Hora.AsString = '' then
    raise Exception.Create('Informe a Hora da Abertura.');

  if not TFuncoes.DataEmBrancoNula(FModel.CDSCadastroSol_PrevisaoEntrega.AsString) then
  begin
    if FModel.CDSCadastroSol_PrevisaoEntrega.AsDateTime < FModel.CDSCadastroSol_Data.AsDateTime then
      raise Exception.Create('Previs�o de Entrega menor que Data de Abertura');
  end;


  if Trim(FModel.CDSCadastroSol_Anexo.asstring) <> '' then
  begin
    if not FileExists(FModel.CDSCadastroSol_Anexo.asstring) then
      raise Exception.Create('Arquivo do Anexo n�o Existe');
  end;

  lOperacao := FOperacao;

  try
    dm.Conectar;
    Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
    try
      Negocio.StartTransacao;

      FModel.CDSCadastroSol_Hora.AsString := FormatDateTime('hh:mm', FModel.CDSCadastroSol_Hora.AsDateTime);

      Post();

      if FModel.CDSCadastro.ChangeCount > 0 then
        FModel.CDSCadastro.ApplyUpdates(0);

      if FOperacao = opIncluir then
        IdSolicitacao := Negocio.RetornaIdAtual('Solicitacao')
      else
        IdSolicitacao := FModel.CDSCadastroSol_Id.AsInteger;

      obj := TSolicitacaoStatusVO.Create;
      obj.Id := 0;
      obj.IdSolicitacao := IdSolicitacao;
      obj.Data := Date;
      obj.IdStatus := FModel.CDSCadastroSol_Status.OldValue;
      obj.IdStatusNovo := FModel.CDSCadastroSol_Status.AsInteger;
      obj.DescricaoLiberacao := FModel.CDSCadastroSol_DescricaoLiberacao.AsString;

    // serializa o objeto
      Marshal := TJSONMarshal.Create;
      try
        oObjetoJSON := Marshal.Marshal(obj);
      finally
        FreeAndNil(Marshal);
        FreeAndNil(obj);
      end;

      Negocio.SalvarSolicitacao(CSolicitacaoPrograma, DM.IdUsuario, oObjetoJSON);

      SalvarCronongrama(IdSolicitacao);
      SalvarOcorrenciaGeral(IdSolicitacao);
      SalvarOcorrenciaTecnica(IdSolicitacao);
      SalvarOcorrenciaRegra(IdSolicitacao);

      Negocio.Commit;

      FOperacao := opNavegar;
    except
      ON E: Exception do
      begin
        FOperacao := lOperacao;
        Negocio.Roolback;
        TFuncoes.Excessao(E, 'TSolicitacaoController.Salvar');
      end;
    end;
  finally
    FreeAndNil(Negocio);
//    FreeAndNil(oObjetoJSON);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.SalvarCronongrama(AIdSolicitacao: Integer);
begin
  if FModel.CDSCronogramaConsulta.Active then
  begin
    if FModel.CDSCronogramaConsulta.State in [dsEdit, dsInsert] then
    begin
      if (FModel.CDSCronogramaConsultaSCro_UsuarioOperacional.AsInteger = 0) then
        FModel.CDSCronogramaConsulta.Cancel;
    end;

    FModel.CDSCronogramaConsulta.First;
    while not FModel.CDSCronogramaConsulta.Eof do
    begin
      FModel.CDSCronogramaConsulta.Edit;
      if FModel.CDSCronogramaConsultaSCro_HoraInicio.AsString <> '' then
        FModel.CDSCronogramaConsultaSCro_HoraInicio.AsString := FormatDateTime('hh:mm', FModel.CDSCronogramaConsultaSCro_HoraInicio.AsDateTime);

      if FModel.CDSCronogramaConsultaSCro_HoraFim.AsString <> '' then
        FModel.CDSCronogramaConsultaSCro_HoraFim.AsString := FormatDateTime('hh:mm', FModel.CDSCronogramaConsultaSCro_HoraFim.AsDateTime);

      FModel.CDSCronogramaConsultaSCro_Solicitacao.AsInteger := AIdSolicitacao;
      FModel.CDSCronogramaConsulta.Post;
      FModel.CDSCronogramaConsulta.Next;
    end;
    FModel.CDSCronogramaConsulta.ApplyUpdates(0);
  end;
end;

procedure TSolicitacaoController.SalvarOcorrenciaGeral(AIdSolicitacao: Integer);
begin
  if FModel.CDSOcorrenciaGeralConsulta.Active then
  begin
    if FModel.CDSOcorrenciaGeralConsulta.State = dsInsert then
    begin
      if (FModel.CDSOcorrenciaGeralConsultaSOcor_UsuarioOperacional.AsInteger = 0) and (FModel.CDSOcorrenciaGeralConsultaSOcor_Tipo.AsInteger = 0) then
        FModel.CDSOcorrenciaGeralConsulta.Cancel;
    end;

    FModel.CDSOcorrenciaGeralConsulta.First;
    while not FModel.CDSOcorrenciaGeralConsulta.Eof do
    begin
      FModel.CDSOcorrenciaGeralConsulta.Edit;
      FModel.CDSOcorrenciaGeralConsultaSOcor_Classificacao.AsInteger := Integer(TEnClassificacao.claOcorrGeral);  //1;
      FModel.CDSOcorrenciaGeralConsultaSOcor_Hora.AsString := FormatDateTime('hh:mm', FModel.CDSOcorrenciaGeralConsultaSOcor_Hora.AsDateTime);
      FModel.CDSOcorrenciaGeralConsultaSOcor_Solicitacao.AsInteger := AIdSolicitacao;
      FModel.CDSOcorrenciaGeralConsulta.Post;
      FModel.CDSOcorrenciaGeralConsulta.Next;
    end;
    FModel.CDSOcorrenciaGeralConsulta.ApplyUpdates(0);
  end;
end;

procedure TSolicitacaoController.SalvarOcorrenciaRegra(AIdSolicitacao: Integer);
begin
  if FModel.CDSOcorrenciaRegraConsulta.State = dsInsert then
  begin
    if (FModel.CDSOcorrenciaRegraConsultaSOcor_Tipo.AsInteger = 0) and (FModel.CDSOcorrenciaRegraConsultaSOcor_UsuarioOperacional.AsInteger = 0) then
      FModel.CDSOcorrenciaRegraConsulta.Cancel;
  end;

  FModel.CDSOcorrenciaRegraConsulta.First;
  while not FModel.CDSOcorrenciaRegraConsulta.Eof do
  begin
    FModel.CDSOcorrenciaRegraConsulta.Edit;
    FModel.CDSOcorrenciaRegraConsultaSOcor_Classificacao.AsInteger := Integer(TEnClassificacao.claOcorrRegra); //3
    FModel.CDSOcorrenciaRegraConsultaSOcor_Solicitacao.AsInteger := AIdSolicitacao;
    FModel.CDSOcorrenciaRegraConsultaSOcor_Hora.AsString := FormatDateTime('hh:mm', FModel.CDSOcorrenciaRegraConsultaSOcor_Hora.AsDateTime);
    FModel.CDSOcorrenciaRegraConsulta.Post;
    FModel.CDSOcorrenciaRegraConsulta.Next;
  end;
  FModel.CDSOcorrenciaRegraConsulta.ApplyUpdates(0);

end;

procedure TSolicitacaoController.SalvarOcorrenciaTecnica(
  AIdSolicitacao: Integer);
begin
  if FModel.CDSOcorrenciaTecnicaConsulta.State = dsInsert then
  begin
    if (FModel.CDSOcorrenciaTecnicaConsultaSOcor_Tipo.AsInteger = 0) and (FModel.CDSOcorrenciaTecnicaConsultaSOcor_UsuarioOperacional.AsInteger = 0) then
      FModel.CDSOcorrenciaTecnicaConsulta.Cancel;
  end;

  FModel.CDSOcorrenciaTecnicaConsulta.First;
  while not FModel.CDSOcorrenciaTecnicaConsulta.Eof do
  begin
    FModel.CDSOcorrenciaTecnicaConsulta.Edit;
    FModel.CDSOcorrenciaTecnicaConsultaSOcor_Classificacao.AsInteger := Integer(TEnClassificacao.claOcorrTecnica); //2
    FModel.CDSOcorrenciaTecnicaConsultaSOcor_Solicitacao.AsInteger := AIdSolicitacao;
    FModel.CDSOcorrenciaTecnicaConsultaSOcor_Hora.AsString := FormatDateTime('hh:mm', FModel.CDSOcorrenciaTecnicaConsultaSOcor_Hora.AsDateTime);
    FModel.CDSOcorrenciaTecnicaConsulta.Post;
    FModel.CDSOcorrenciaTecnicaConsulta.Next;
  end;
  FModel.CDSOcorrenciaTecnicaConsulta.ApplyUpdates(0);

end;

procedure TSolicitacaoController.SolicitacaoAnexos(AIdSolicitacao: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSSolicitacaoAnexo.Close;
      Negocio.SolicitacaoAnexos(AIdSolicitacao);
      FModel.CDSSolicitacaoAnexo.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.SolicitacaoAnexos');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TSolicitacaoController.SolicitacaoAtualAberta(
  AIdSolicitacao: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.SolicitacaoTempoAtualAberta(AIdSolicitacao);
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.SolicitacaoPorCategoria(
  AIdCategoria, AIdUsuario: Integer): TObjectList<TSolicitacaoVO>;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := TConverte.JSONToObject<TListaSolicitacao>(Negocio.SolicitacaoPorCategoria(AIdCategoria, AIdUsuario));
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'SolicitacaoPorCategoria');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TSolicitacaoController.SolicitacaoTempoExcluir(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.SolicitacaoTempoExcluir(AId);
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.SolicitacaoTempoFiltrarPorData(
  AData: string; AId: Integer): TObjectList<TSolicitacaoTempoVO>;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := TConverte.JSONToObject<TListaSolicitacaoTempo>(Negocio.SolicitacaoTempoFiltrarPorData(AData, AId, dm.IdUsuario));
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.SolicitacaoTempoLocalizarPorSolicitacao(
  AIdSolicitacao: Integer): TObjectList<TSolicitacaoTempoVO>;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := TConverte.JSONToObject<TListaSolicitacaoTempo>(Negocio.SolicitacaoTempoLocalizarPorSolicitacao(AIdSolicitacao));
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.SolicitacaoTempoObterPorId(
  AId: Integer): TSolicitacaoTempoVO;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := TConverte.JSONToObject<TSolicitacaoTempoVO>(Negocio.SolicitacaoTempoLocalizarId(AId));
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.SolicitacaoTempoPermissao(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.SolicitacaoPermissaoSolicitacaoTempo(AIdUsuario);
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.SolicitacaoTempoRetornarAgrupadoStatus(
  AIdSolicitacao: Integer): TObjectList<TSolicitacaoTempoVO>;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := TConverte.JSONToObject<TListaSolicitacaoTempo>(Negocio.SolicitacaoTempoRetornarHorasAgrupadoPorStatus(AIdSolicitacao));
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.SolicitacaoTempoSalvar(
  ASolicitacaoTempo: TSolicitacaoTempoVO): Integer;
var
  Negocio: TServerMethods1Client;
  objJsonValue: TJSONValue;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    objJsonValue := TConverte.ObjectToJSON(ASolicitacaoTempo);
    Result := StrToIntDef(Negocio.SolicitacaoTempoSalvar(objJsonValue).ToString(),0);
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TSolicitacaoController.StatusAbertura: string;
var
  Parametro: TParametrosController;
begin
  Parametro := TParametrosController.Create;
  try
    try
      Result := Parametro.LocalizarParametro(18, 3);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.StatusAbertura');
      end;
    end;
  finally
    FreeAndNil(Parametro);
  end;
end;

function TSolicitacaoController.StatusOcorrencia: string;
var
  Parametro: TParametrosController;
begin
  Parametro := TParametrosController.Create;
  try
    try
      Result := Parametro.LocalizarParametro(19, 3);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.StatusOcorrencia');
      end;
    end;
  finally
    FreeAndNil(Parametro);
  end;
end;

procedure TSolicitacaoController.TipoUmRegistro;
var
  obj: TTipoController;
  Model: TTipoVO;
begin
  obj := TTipoController.Create;
  try
    Model := obj.RetornoUmRegistro(prSolicitacao);
    if Model.Id > 0 then
    begin
      FModel.CDSCadastroSol_Tipo.AsInteger := Model.Id;
      FModel.CDSCadastroTip_Codigo.AsInteger := Model.Codigo;
      FModel.CDSCadastroTip_Nome.AsString := Model.Nome;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Model);
  end;
end;

procedure TSolicitacaoController.UpdateHoraUsuarioAtual(
  AIdSolicitacao: Integer);
var
  Negocio: TServerMethods1Client;
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      sb.AppendLine(' UPDATE Solicitacao SET ');
      sb.AppendLine('   Sol_UsuarioAtendeAtual = ' + IntToStr(dm.IdUsuario));
      sb.AppendLine(' WHERE Sol_Id = ' + IntToStr(AIdSolicitacao));

      Negocio.ExecutarSQL(sb.ToString);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.UpdateHoraUsuarioAtual');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(sb);
    dm.Desconectar;
  end;
end;

procedure TSolicitacaoController.UpdateStatus(AIdSolicitacao, AIdStatus: Integer);
var
  Negocio: TServerMethods1Client;
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      sb.AppendLine(' UPDATE Solicitacao SET ');
      sb.AppendLine('   Sol_Status = ' + IntToStr(AIdStatus));
      sb.AppendLine('  ,Sol_UsuarioAtendeAtual = ' + IntToStr(dm.IdUsuario));
      sb.AppendLine(' WHERE Sol_Id = ' + IntToStr(AIdSolicitacao));

      Negocio.ExecutarSQL(sb.ToString);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TSolicitacaoController.UpdateStatus');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(sb);
    dm.Desconectar;
  end;
end;

end.
