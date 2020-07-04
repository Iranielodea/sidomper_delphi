unit uModeloRelatorioController;

interface

uses
  System.SysUtils, uDMModeloRelatorio, uRegras, uEnumerador, uDM, Data.DB,
  Vcl.Forms, uFuncoesSIDomper, Data.DBXJSON, Data.DBXJSONReflect, uConverter;

type
  TModeloRelatorioController = class
  private
    FModel: TDMModeloRelatorio;
    FOperacao: TOperacao;
    procedure Post;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarUsuario(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    function Salvar(AIdUsuario: Integer): Integer;
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(AId, Codigo: Integer);
    function CodigoAtual: Integer;

    property Model: TDMModeloRelatorio read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TModeloRelatorioController }

uses uModeloRelatorioVO;

procedure TModeloRelatorioController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TModeloRelatorioController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroModR_Codigo.AsInteger;
end;

constructor TModeloRelatorioController.Create;
begin
  inherited Create;
  FModel := TDMModeloRelatorio.Create(nil);
end;

destructor TModeloRelatorioController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TModeloRelatorioController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado :=  Negocio.Editar(CModeloRelatorio, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TModeloRelatorioController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CModeloRelatorio, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TModeloRelatorioController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CModeloRelatorio, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModeloRelatorioController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CModeloRelatorio, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    DM.Desconectar;
    FreeAndNil(Negocio);
  end;
end;

procedure TModeloRelatorioController.FiltrarUsuario(ACampo, ATexto,
  AAtivo: string; AContem: Boolean);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.ModeloRelatoriosFiltrar(ACampo, ATexto, AAtivo, dm.IdUsuario, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TModeloRelatorioController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CModeloRelatorio, AIdUsuario);
    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TModeloRelatorioController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CModeloRelatorio, ACodigo);
    FModel.CDSCadastro.Open;
  finally
    DM.Desconectar;
    FreeAndNil(Negocio);
  end;
end;

procedure TModeloRelatorioController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CModeloRelatorio, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TModeloRelatorioController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CModeloRelatorio, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

    FModel.CDSCadastroModR_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TModeloRelatorioController.Pesquisar(AId, Codigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(Codigo);
end;

procedure TModeloRelatorioController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TModeloRelatorioController.ProximoCodigo: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoCodigo(CModeloRelatorio).ToString);
    Result := iCodigo;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

function TModeloRelatorioController.ProximoId: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoId(CModeloRelatorio).ToString);
    Result := iCodigo;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

function TModeloRelatorioController.Salvar(AIdUsuario: Integer): Integer;
var
  Negocio: TServerModule2Client;
  Model: TModeloRelatorioVO;
  oObjetoJSON : TJSONValue;
begin
  Model := TModeloRelatorioVO.Create;
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Model.Id := FModel.CDSCadastroModR_Id.AsInteger;
      Model.Codigo := FModel.CDSCadastroModR_Codigo.AsInteger;
      Model.Descricao := FModel.CDSCadastroModR_Descricao.AsString;
      Model.Arquivo := FModel.CDSCadastroModR_Arquivo.AsString;
      Model.IdRevenda := FModel.CDSCadastroModR_Revenda.AsInteger;

      oObjetoJSON := TConverte.ObjectToJSON<TModeloRelatorioVO>(Model);
      Result := StrToIntDef(Negocio.ModeloRelatorioSalvar(oObjetoJSON).ToString(),0);
      Post;
      FOperacao := opNavegar;
    except
      on E: Exception do
      begin
        TFuncoes.MensagemErroBanco(E.Message);
        Abort;
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Model);
    DM.Desconectar;
  end;
end;

end.
