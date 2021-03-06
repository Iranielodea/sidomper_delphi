unit uUsuarioController;

interface

uses
  System.SysUtils, uDMUsuario, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  uFiltroUsuario, Data.DBXJSON, Data.DBXJSONReflect, uUsuarioPermissaoController,
  System.Generics.Collections, Vcl.Dialogs, uUsuarioVO, System.Classes,
  uDMRelUsuario, uConverter;

type
  TUsuarioController = class
  private
    FModel: TDMUsuario;
    FOperacao: TOperacao;
    FUsuarioPermissao: TUsuarioPermissaoController;
    procedure Post;
    procedure ListarPermissao(AIdUsuario: integer);
    procedure SalvarPermissao(AIdUsuario: Integer; ARegra: TServerMethods1Client);
    procedure Validacao;
    function IdAtual: Integer;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False); overload;
    procedure Filtrar(AFiltro: TFiltroUsuario; ACampo, ATexto, AAtivo: string; AContem: Boolean = False); overload;
    procedure Filtrar(AFiltro: TFiltroUsuario; AIdUsuario: Integer; ACampo, ATexto, AAtivo: string; AContem: Boolean = False); overload;
    procedure FiltrarCodigo(ACodigo: Integer);
    function CodigoAtual: Integer;
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer; AMensagem: Boolean=True);
    procedure LocalizarNome(ANome: string);
    procedure UsuarioAcessoMenu(AIdUsuario: integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer);
    procedure AlterarSenha(AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    procedure RelatorioPermissao(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(AId, ACodigo: Integer);
    procedure LocalizarUsuario(AUserNome, APassword: string);
    function RetornarPermissaoUsuario: TList<string>;
    procedure ModoEdicaoInsercao;
    function LoginDesenvolvimento(): TUsuarioVO;
    function UsuarioADM(AIdUsuario: Integer): Boolean;
    function UsuarioADMLocal(AIdUsuario: Integer): Boolean;
    function DiasTrabalhados(ADataInicial, ADataFinal: string): TObjectList<TUsuarioVO>;
    function ExisteUsuario(): Boolean;
    procedure Exportar();
    function ObterPorId(AIdUsuario: Integer): Boolean;

    function PermissaoChamadoOcorrenciaDataHora(AIdUsuario, AId: Integer; out AMesmoUsuario: Boolean): Boolean; overload;
    function PermissaoChamadoOcorrenciaDataHora(AIdUsuario, AIdUsuarioLocal, AId: Integer; out AMesmoUsuario: Boolean): Boolean; overload;
    function PermissaoChamadoOcorrenciaAlterar(AIdUsuario, AId: Integer; out APerfil: Integer): Boolean;
    function PermissaoChamadoOcorrenciaExcluir(AIdUsuario, AId: Integer): Boolean;

    function PermissaoAtividadeOcorrenciaDataHora(AIdUsuario: Integer; AId: Integer; out AMesmoUsuario: Boolean): Boolean;
    function PermissaoAtividadeOcorrenciaAlterar(AIdUsuario: Integer; AId: Integer; out APerfil: integer): Boolean;
    function PermissaoAtividadeOcorrenciaExcluir(AIdUsuario: Integer; AId: Integer): Boolean;

    function PermissaoSolicitacaoOcorrenciaGeralAlterar(AIdUsuario, AId: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaGeralExcluir(AIdUsuario, AId: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnicaAlterar(AIdUsuario, AId: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnicaExcluir(AIdUsuario, AId: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaRegraAlterar(AIdUsuario, AId: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaRegraExcluir(AIdUsuario, AId: Integer): Boolean;


    function PermissaoOrcamentoAlteracaoSituacao(AIdUsuario: Integer): Boolean;
    function PermissaoOrcamentoUsuario(AIdUsuario: Integer): Boolean;

    procedure RelatorioRendimentos(ADataInicial, ADataFinal, ADias: string; AFiltro: TFiltroUsuario);
    function PermissaoConferenciaTempoGeral(AIdUsuario: Integer): Boolean;
    procedure HorarioAcessoSistema(AUserName, APassword: string; AIdUsuario: Integer);

    property Model: TDMUsuario read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TUsuarioController }

uses uFuncoesSIDomper;

procedure TUsuarioController.AlterarSenha(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Validacao();
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.StartTransacao();
      Post();
      Negocio.Salvar(CUsuarioPrograma, AIdUsuario);
      FModel.CDSCadastro.ApplyUpdates(0);
      Negocio.Commit();
      dm.Desconectar;
    except
      on E: Exception do
      begin
        Negocio.Roolback();
        DM.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;

  FOperacao := opNavegar;
end;

procedure TUsuarioController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

constructor TUsuarioController.Create;
begin
  inherited Create;
  FModel := TDMUsuario.Create(nil);
  FUsuarioPermissao := TUsuarioPermissaoController.Create;
end;

destructor TUsuarioController.Destroy;
begin
  FreeAndNil(FModel);
  FreeAndNil(FUsuarioPermissao);
  inherited;
end;

function TUsuarioController.DiasTrabalhados(ADataInicial,
  ADataFinal: string): TObjectList<TUsuarioVO>;
var
  Negocio: TServerModule2Client;
  Lista: TObjectList<TUsuarioVO>;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Lista := TConverte.JSONToObject<TListaUsuario>(Negocio.UsuarioDiasTrabalhados(ADataInicial, ADataFinal));
    Result := Lista;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.Validacao;
begin
  if FModel.CDSCadastroUsu_Codigo.AsInteger <= 0 then
    raise Exception.Create('Informe o C�digo!');
  if Trim(FModel.CDSCadastroUsu_Password.AsString) = '' then
    raise Exception.Create('Informe a Senha.');
  if Trim(FModel.CDSCadastroUsu_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome.');
  if Trim(FModel.CDSCadastroUsu_UserName.AsString) = '' then
    raise Exception.Create('Informe o Usu�rio.');
  if Trim(FModel.CDSCadastroUsu_Email.AsString) = '' then
    raise Exception.Create('Informe o Email.');
  if FModel.CDSCadastroUsu_Departamento.AsInteger = 0 then
    raise Exception.Create('Informe o Departamento.');
end;

procedure TUsuarioController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CUsuarioPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    ListarPermissao(AId);
//    FUsuarioPermissao.LocalizarUsuario(Id);

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.Excluir(CUsuarioPrograma, AIdUsuario, AId);
      FModel.CDSConsulta.Delete;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.ExisteUsuario: Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.ExisteUsuario();
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.Exportar();
var
  Negocio: TServerMethods1Client;
  oObjetoJSON : TJSONValue;
  model: TUsuarioVO;
  ListaUsuario: TObjectList<TUsuarioVO>;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    ListaUsuario := TConverte.JSONToObject<TListaUsuario>(Negocio.ExportarUsuario());

    for model in ListaUsuario do
    begin
      dm.cdsUsuario.Append;
      dm.cdsUsuarioId.AsInteger := model.Id;
      dm.cdsUsuarioCodigo.AsInteger := model.Codigo;
      dm.cdsUsuarioUserName.AsString := model.UserName;
      dm.cdsUsuarioNome.AsString := model.Nome;
      dm.cdsUsuarioPassword.AsString := model.Password;
      dm.cdsUsuarioEmail.AsString := model.Email;
      dm.cdsUsuarioAdm.AsBoolean := model.Adm;
      dm.cdsUsuarioNotificar.AsBoolean := model.Notificar;
      dm.cdsUsuario.Post;
    end;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(ListaUsuario);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroUsu_Codigo.AsInteger;
end;

procedure TUsuarioController.Filtrar(AFiltro: TFiltroUsuario; ACampo, ATexto,
  AAtivo: string; AContem: Boolean);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarUsuario(oObjetoJSON, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TUsuarioController.Filtrar(AFiltro: TFiltroUsuario; AIdUsuario: Integer;
ACampo, ATexto, AAtivo: string; AContem: Boolean);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarUsuarioRevenda(oObjetoJSON, AIdUsuario, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TUsuarioController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CUsuarioPrograma, ACodigo);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.HorarioAcessoSistema(AUserName, APassword: string;
  AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.UsuarioHorarioAcessoSistema(AUserName, APassword, AIdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CUsuarioPrograma, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TUsuarioController.IdAtual: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.RetornaIdAtual('Usuario');
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TUsuarioController.Imprimir(AIdUsuario: Integer);
//var
//  Negocio: TServerMethods1Client;
begin
//  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
//  try
//    Negocio.Relatorio(CUsuarioPrograma, AIdUsuario);
//    FModel.Rel.Print;
//  finally
//    FreeAndNil(Negocio);
//  end;

  FModel.Rel.Print;
end;

procedure TUsuarioController.ListarPermissao(AIdUsuario: integer);
begin
  FModel.CDSListarPermissaoListar.Close;
  FModel.CDSListarPermissaoListar.Params[0].AsInteger := AIdUsuario;
  FModel.CDSListarPermissaoListar.Open;
end;

procedure TUsuarioController.LocalizarCodigo(ACodigo: integer; AMensagem: Boolean=True);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigoUsuario(ACodigo, dm.IdUsuario, AMensagem);
//    Negocio.LocalizarCodigo(CUsuarioPrograma, Codigo);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CUsuarioPrograma, AId);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.LocalizarNome(ANome: string);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.UsuarioLocalizarNome(ANome);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.LocalizarUsuario(AUserNome, APassword: string);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarUsuario(AUserNome, APassword);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.LoginDesenvolvimento(): TUsuarioVO;
var
  sCaminho: string;
  sArquivo: string;
  FS: TStreamReader;
  Model: TUsuarioVO;
begin
  Model := TUsuarioVO.Create;

  if TFuncoes.ModoDesenvolvimento() then
  begin
    sCaminho := ExtractFilePath(Application.ExeName);
    sArquivo := sCaminho + 'DomperLogin.txt';

    if FileExists(sArquivo) then
    begin
      FS := TStreamReader.Create(sArquivo);
      try
        Model.UserName  := FS.ReadLine;
        Model.Password  := FS.ReadLine;

        if Model.UserName.Trim() <> ''  then
          Model.id := 1;
      finally
        FreeAndNil(FS);
      end;

  //    while not (FStream.EndOfStream) do
  //    begin
  //      sUsuario  := FStream.ReadLine;
  //      sSenha    := FStream.ReadLine;
  //    end;
  //    FreeAndNil(FStream);

    end;
  end;
  Result := Model;
end;

procedure TUsuarioController.ModoEdicaoInsercao;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSCadastro);
end;

procedure TUsuarioController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CUsuarioPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FUsuarioPermissao.LocalizarUsuario(0);

    FModel.CDSCadastro.Append;
    FModel.CDSCadastroUsu_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.ObterPorId(AIdUsuario: Integer): Boolean;
begin
  Result := dm.cdsUsuario.Locate('Usu_Id', AIdUsuario, []);
end;

function TUsuarioController.PermissaoAtividadeOcorrenciaAlterar(
  AIdUsuario: Integer; AId: Integer; out APerfil: integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
//    Result := Negocio.PermissaoAtividadeOcorrencia(AIdUsuario, 2, AId);
    Result := Negocio.PermissaoAtividadeOcorrenciaAlterar(AIdUsuario, APerfil, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoAtividadeOcorrenciaDataHora(
  AIdUsuario: Integer; AId: Integer; out AMesmoUsuario: Boolean): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoAtividadeOcorrenciaDataHora(AIdUsuario, AMesmoUsuario, AId);
    dm.Desconectar;
//    Result := Negocio.PermissaoAtividadeOcorrencia(AIdUsuario, 1, AId);
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoAtividadeOcorrenciaExcluir(
  AIdUsuario: Integer; AId: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoAtividadeOcorrenciaExcluir(AIdUsuario, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoChamadoOcorrenciaAlterar(
  AIdUsuario, AId: Integer; out APerfil: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoChamadoOcorrenciaAlterar(AIdUsuario, APerfil, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoChamadoOcorrenciaDataHora(AIdUsuario,
  AIdUsuarioLocal, AId: Integer; out AMesmoUsuario: Boolean): Boolean;
var
  UsuarioPermissaoController: TUsuarioPermissaoController;
begin
  UsuarioPermissaoController := TUsuarioPermissaoController.Create;
  try
    AMesmoUsuario := (AIdUsuario = AIdUsuarioLocal);
    Result := UsuarioPermissaoController.ObterPorSigla(AIdUsuario, 'Lib_Chamado_Ocorr_Alt_Data_Hora');
  finally
    FreeAndNil(UsuarioPermissaoController);
  end;
end;

function TUsuarioController.PermissaoChamadoOcorrenciaDataHora(
  AIdUsuario, AId: Integer; out AMesmoUsuario: Boolean): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoChamadoOcorrenciaDataHora(AIdUsuario, AMesmoUsuario, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoChamadoOcorrenciaExcluir(
  AIdUsuario, AId: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoChamadoOcorrenciaExcluir(AIdUsuario, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoConferenciaTempoGeral(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoConferenciaTempoGeral(AIdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoOrcamentoAlteracaoSituacao(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoOrcamentoAlteracaoSituacao(AIdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoOrcamentoUsuario(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoOrcamentoUsuario(AIdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoSolicitacaoOcorrenciaGeralAlterar(
  AIdUsuario, AId: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoSolicitacaoOcorrenciaGeralAlterar(AIdUsuario, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoSolicitacaoOcorrenciaGeralExcluir(
  AIdUsuario, AId: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoSolicitacaoOcorrenciaGeralExcluir(AIdUsuario, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoSolicitacaoOcorrenciaRegraAlterar(
  AIdUsuario, AId: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoSolicitacaoOcorrenciaRegraAlterar(AIdUsuario, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoSolicitacaoOcorrenciaRegraExcluir(
  AIdUsuario, AId: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoSolicitacaoOcorrenciaRegraExcluir(AIdUsuario, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoSolicitacaoOcorrenciaTecnicaAlterar(
  AIdUsuario, AId: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoSolicitacaoOcorrenciaTecnicaAlterar(AIdUsuario, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.PermissaoSolicitacaoOcorrenciaTecnicaExcluir(
  AIdUsuario, AId: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.PermissaoSolicitacaoOcorrenciaTecnicaExcluir(AIdUsuario, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.Pesquisar(AId, ACodigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(ACodigo);
end;

procedure TUsuarioController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TUsuarioController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CUsuarioPrograma).ToString);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CUsuarioPrograma).ToString);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.RelatorioPermissao(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CUsuarioPrograma, AIdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TUsuarioController.RelatorioRendimentos(ADataInicial,
  ADataFinal, ADias: string; AFiltro: TFiltroUsuario);
var
  Negocio: TServerModule2Client;
  Relatorio: TDMRelUsuario;
  oObjetoJSON : TJSONValue;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  Relatorio := TDMRelUsuario.create(nil);
  oObjetoJSON := TConverte.ObjectToJSON(AFiltro);
  try
    Relatorio.CDSRendimento.Close;
    Negocio.UsuarioRelRendimento(ADataInicial, ADataFinal, oObjetoJSON);
    Relatorio.CDSRendimento.Open;

    Relatorio.ListarRendimento(StrToIntDef(ADias, 0), ADataInicial, ADataFinal);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Relatorio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.RetornarPermissaoUsuario: TList<string>;
var
  Negocio: TServerMethods1Client;
  ListaJSon: TJSONArray;
  i: Integer;
  Lista: TList<string>;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    ListaJSon := Negocio.UsuarioRetornaListaPermissao();
    Lista := TList<string>.Create;

    for I := 0 to ListaJSon.Size -1 do
      Lista.Add(ListaJSon.Get(i).Value);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
  Result := Lista;
end;

procedure TUsuarioController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  IdUsuario: Integer;
begin
  Validacao();
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.StartTransacao();
      Post();
      Negocio.Salvar(CRevendaPrograma, AIdUsuario);
      FModel.CDSCadastro.ApplyUpdates(0);

      if FOperacao = opIncluir then
        IdUsuario := IdAtual()
      else
        IdUsuario := FModel.CDSCadastroUsu_Id.AsInteger;

      SalvarPermissao(IdUsuario, Negocio);

      Negocio.Commit();
      dm.Desconectar;
    except
      on E: Exception do
      begin
        Negocio.Roolback();
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;

  FOperacao := opNavegar;
end;

procedure TUsuarioController.SalvarPermissao(AIdUsuario: Integer; ARegra: TServerMethods1Client);
begin
  ARegra.ExcluirPermissaoUsuario(AIdUsuario);

  if not FModel.CDSListarPermissaoListar.IsEmpty then
  begin
    FModel.CDSListarPermissaoListar.DisableControls;
    try
      FModel.CDSListarPermissaoListar.First;
      while not FModel.CDSListarPermissaoListar.Eof do
      begin
        ARegra.UsuarioPermissaoSalvar(AIdUsuario, FModel.CDSListarPermissaoListarUsuP_Sigla.AsString);
        FModel.CDSListarPermissaoListar.Next;
      end;
      FModel.CDSListarPermissaoListar.First;
    finally
      FModel.CDSListarPermissaoListar.EnableControls;
    end;
  end;
end;

procedure TUsuarioController.UsuarioAcessoMenu(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSUsuarioAcessoMenu.Close;
    Negocio.UsuarioAcessoMenu(AIdUsuario);
    FModel.CDSUsuarioAcessoMenu.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.UsuarioADM(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.UsuarioUsuarioADM(AIdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

function TUsuarioController.UsuarioADMLocal(AIdUsuario: Integer): Boolean;
begin
  ObterPorId(AIdUsuario);
  Result := dm.cdsUsuarioAdm.AsBoolean;
end;

end.

