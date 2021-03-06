unit uAgendamentoController;

interface

uses
  System.SysUtils, uDMAgendamento, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  uFuncoesSIDomper, Data.DBXJSON , Data.DBXJSONReflect, uFiltroAgendamento,
  uObsevacaoController, uTipoController, uTipoVO, Vcl.Dialogs, System.Generics.Collections,
  uAgendamentoVO, uConverter;

type
  TAgendamentoController = class
  private
    FModel: TdmAgendamento;
    FOperacao: TOperacao;
    procedure ObservacaoPadrao;
    procedure TipoUmRegistro;
    procedure VerificarAgendamentoAberto();
  public
    procedure Filtrar(AFiltro: TFiltroAgendamento; ACampo, ATexto: string; AContem: Boolean = False);
    procedure FiltrarId(AId: Integer);
    procedure LocalizarId(AId: Integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    function Salvar(AIdUsuario: Integer): Integer;
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    procedure Quadro(ADataInicial, ADataFinal: TDate; AIdUsuario, AIdRevenda: integer);
    function QuadroJSON(ADataInicial, ADataFinal: TDate; AIdUsuario, AIdRevenda: integer): TObjectList<TAgendamentoVO>;

    function PermissaoQuadro(AIdUsuario: Integer): Boolean;
    procedure Reagendamento(AIdAgendamento: Integer;
      AData, AHora: TDateTime; ATexto: string);
    procedure Cancelamento(AIdAgendamento: Integer; AData, AHora:
      TDateTime; ATexto: string);
    procedure Encerrar(AIdAgendamento, AIdPrograma: Integer);
    procedure EncerrarWEB(AIdAgendamento: Integer);
    function RetornarEmails(AIdAgenda, AIdUsuario, AIdStatus: Integer): string;
    function RetornarEmailsCliente(AIdAgenda: Integer): string;
    procedure EnvioEmail(AIdAgenda, AIdStatus: Integer);
    function RetornaTipoPrograma(AIdAgenda: Integer): Integer;

    constructor Create();
    destructor Destroy; override;

    property Model: TdmAgendamento read FModel write FModel;
  end;

implementation

{ TAgendamentoController }

uses  uStatusController, uEmailBase, uEmailAgendamento,
  uContaEmail, uContaEmailController, uUsuarioController, uFormProcesso,
  uEmailModelo2, uEnviarEmail;

procedure TAgendamentoController.Cancelamento(
  AIdAgendamento: Integer; AData, AHora: TDateTime; ATexto: string);
var
  Negocio: TServerModule2Client;
begin
  if AIdAgendamento = 0 then
    raise Exception.Create('Informe o Id do Agendamento!');

  if AData = 0 then
    raise Exception.Create('Informe a Data!');

  if AHora = 0 then
    raise Exception.Create('Informe a Hora!');

  if Trim(ATexto) = '' then
    raise Exception.Create('Informe o Texto!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.AgendamentoCancelamento(dm.IdUsuario, AIdAgendamento, DateToStr(AData), TimeToStr(AHora), ATexto);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

constructor TAgendamentoController.Create;
begin
  FModel := TdmAgendamento.Create(nil);
end;

destructor TAgendamentoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TAgendamentoController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.AgendamentoEditar(CAgendamentoPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.Encerrar(AIdAgendamento, AIdPrograma: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AIdAgendamento = 0 then
    raise Exception.Create('Informe o Id do Agendamento!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.AgendamentoEncerramento(dm.IdUsuario, AIdAgendamento, AIdPrograma);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.EncerrarWEB(AIdAgendamento: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AIdAgendamento = 0 then
    raise Exception.Create('Informe o Id do Agendamento!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.AgendamentoEncerramentoWEB(dm.IdUsuario, AIdAgendamento);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.EnvioEmail(AIdAgenda, AIdStatus: Integer);
var
  objEmailAgenda: TEmailAgendamento;
  sEmail: string;
  sEmailCliente: string;
  objContaEmail: TContaEmailController;
begin
  sEmail := '';
  objContaEmail     := TContaEmailController.Create;
  objEmailAgenda    := TEmailAgendamento.Create;
  try
    sEmail := objEmailAgenda.RetornarListaEmail(AIdAgenda,
                                                 dm.IdUsuario,
                                                 AIdStatus);

    sEmailCliente := objEmailAgenda.RetornarListaEmailCliente(AIdAgenda);

    if sEmailCliente = '' then
      sEmailCliente := sEmail;

    if (sEmailCliente <> '') then
    begin
      objContaEmail.EnviarEmail(dm.IdUsuario,
                                sEmailCliente,
                                sEmail,
                                objEmailAgenda.RetornarAssunto(AIdAgenda),
                                objEmailAgenda.TextoEmail(AIdAgenda),
                                '');
    end;
  finally
    FreeAndNil(objContaEmail);
    FreeAndNil(objEmailAgenda);
  end;
end;

procedure TAgendamentoController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.AgendamentoExcluir(CAgendamentoPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.Filtrar(AFiltro: TFiltroAgendamento; ACampo,
ATexto: string; AContem: Boolean);
var
  Negocio: TServerModule2Client;
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
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.AgendamentoFiltrar(oObjetoJSON, ACampo, ATexto, dm.IdUsuario, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.FiltrarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.AgendamentoFiltarId(AId);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.Quadro(ADataInicial, ADataFinal: TDate;
  AIdUsuario, AIdRevenda: integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    FModel.CDSQuadro.Close;
    Negocio.AgendamentoQuadro(DateToStr(ADataInicial), DateToStr(ADataFinal), AIdUsuario, AIdRevenda);
    FModel.CDSQuadro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TAgendamentoController.QuadroJSON(ADataInicial, ADataFinal: TDate;
  AIdUsuario, AIdRevenda: integer): TObjectList<TAgendamentoVO>;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    try
      Result := TConverte.JSONToObject<TListaAgendamentoVO>(Negocio.AgendamentoQuadroJSON(DateToStr(ADataInicial), DateToStr(ADataFinal), AIdUsuario, AIdRevenda));
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.Reagendamento(AIdAgendamento: Integer; AData,
  AHora: TDateTime; ATexto: string);
var
  Negocio: TServerModule2Client;
begin
  if AIdAgendamento = 0 then
    raise Exception.Create('Informe o Id do Agendamento!');

  if AData = 0 then
    raise Exception.Create('Informe a Data!');

  if AHora = 0 then
    raise Exception.Create('Informe a Hora!');

  if Trim(ATexto) = '' then
    raise Exception.Create('Informe o Texto!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.AgendamentoReagendamento(DM.IdUsuario, AIdAgendamento, DateToStr(AData), TimeToStr(AHora), ATexto);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TAgendamentoController.RetornarEmails(AIdAgenda, AIdUsuario,
  AIdStatus: Integer): string;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.AgendamentoRetornarEmails(AIdAgenda, AIdUsuario, AIdStatus);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TAgendamentoController.RetornarEmailsCliente(
  AIdAgenda: Integer): string;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.AgendamentoRetornarCliente(AIdAgenda, dm.IdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TAgendamentoController.RetornaTipoPrograma(
  AIdAgenda: Integer): Integer;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Result := Negocio.AgendamentoTipoPrograma(AIdAgenda);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.AgendamentoRelatorio(CAgendamentoPrograma, AIdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.AgendamentoLocalizarId(CAgendamentoPrograma, AId);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TAgendamentoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
  StatusController: TStatusController;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.AgendamentoNovo(CAgendamentoPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

//==============================================================================
// status agendamento abertura
    FModel.CDSCadastroSta_Codigo.AsInteger := Negocio.AgendamentoLocalizarStatusAbertura();
    StatusController := TStatusController.Create;
    try
      StatusController.LocalizarCodigo(FModel.CDSCadastroSta_Codigo.AsInteger);
      FModel.CDSCadastroAge_Status.AsInteger := StatusController.Model.CDSCadastroSta_Id.AsInteger;
      FModel.CDSCadastroSta_Codigo.AsInteger := StatusController.Model.CDSCadastroSta_Codigo.AsInteger;
      FModel.CDSCadastroSta_Nome.AsString := StatusController.Model.CDSCadastroSta_Nome.AsString;
    finally
      FreeAndNil(StatusController);
    end;

    ObservacaoPadrao();

    TipoUmRegistro();

    FOperacao := opIncluir;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;

  VerificarAgendamentoAberto();
end;

procedure TAgendamentoController.ObservacaoPadrao;
var
  Obs: TObservacaoController;
begin
  Obs := TObservacaoController.Create;
  try
    Obs.LocalizarPadrao(prAgendamento);
    FModel.CDSCadastroAge_Descricao.AsString := Obs.Model.CDSCadastroObs_Descricao.AsString;
  finally
    FreeAndNil(Obs);
  end;
end;

function TAgendamentoController.PermissaoQuadro(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Result := Negocio.AgendamentoPermissaoQuadro(AIdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    dm.Desconectar;
  end;
end;

function TAgendamentoController.Salvar(AIdUsuario: Integer): Integer;
var
  Negocio: TServerModule2Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  Obj: TAgendamentoVO;
begin
  if FModel.CDSCadastroAge_Tipo.AsInteger = 0 then
    raise Exception.Create('Informe o Tipo!');

  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Post;

  Obj := TAgendamentoVO.Create;
  Obj.Id          := FModel.CDSCadastroAge_Id.AsInteger;
  Obj.Data        := FModel.CDSCadastroAge_Data.AsDateTime;
  Obj.Hora        := FModel.CDSCadastroAge_Hora.AsDateTime;
  Obj.IdUsuario   := FModel.CDSCadastroAge_Usuario.AsInteger;
  Obj.IdCliente   := FModel.CDSCadastroAge_Cliente.AsInteger;
  Obj.Contato     := FModel.CDSCadastroAge_Contato.AsString;
  Obj.Programa    := FModel.CDSCadastroAge_Programa.AsInteger;
  Obj.IdTipo      := FModel.CDSCadastroAge_Tipo.AsInteger;
  Obj.IdStatus    := FModel.CDSCadastroAge_Status.AsInteger;
  Obj.Descricao   := FModel.CDSCadastroAge_Descricao.AsString;
  Obj.Motivo      := FModel.CDSCadastroAge_Motivo.AsString;
  Obj.IdVisita    := FModel.CDSCadastroAge_Visita.AsInteger;
  Obj.IdAtividade := FModel.CDSCadastroAge_Atividade.AsInteger;
  Obj.NomeCliente := FModel.CDSCadastroAge_NomeCliente.AsString;

// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(obj);
  finally
    FreeAndNil(Marshal);
  end;

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.AgendamentoSalvar(CAgendamentoPrograma, AIdUsuario, oObjetoJSON);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Obj);
  end;
end;

procedure TAgendamentoController.TipoUmRegistro;
var
  obj: TTipoController;
  Model: TTipoVO;
begin
  obj := TTipoController.Create;
  try
    Model := obj.RetornoUmRegistro(prAgendamento);
    if Model.Id > 0 then
    begin
      FModel.CDSCadastroAge_Tipo.AsInteger := Model.Id;
      FModel.CDSCadastroTip_Codigo.AsInteger := Model.Codigo;
      FModel.CDSCadastroTip_Nome.AsString := Model.Nome;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Model);
  end;
end;

procedure TAgendamentoController.VerificarAgendamentoAberto;
var
  Negocio: TServerModule2Client;
  bResult: Boolean;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    bResult := Negocio.AgendamentoAberto(dm.IdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;

  if bResult then
    ShowMessage('H� Agendamentos em Aberto!');

end;

end.
