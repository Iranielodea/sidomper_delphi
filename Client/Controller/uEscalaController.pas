unit uEscalaController;

interface

uses
  System.SysUtils, uDMEscala, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  uEscalaVO, Data.DBXJSON, uConverter, uDMRelEscala;

type
  TEscalaController = class
  private
    FModel: TDMEscala;
    FOperacao: TOperacao;
    procedure Post;
    function IdAtual: Integer;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False); overload;
    procedure Filtrar(AFiltro: TEscalaFiltro; ACampo,
      ATexto: string; AIdUsuario: Integer; AContem: Boolean); overload;
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer); overload;
    function Salvar(AEscalaVO: TEscalaVO; AIdUsuario: Integer): Integer; overload;
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(AId, ACodigo: Integer);
    function CodigoAtual: Integer;
    procedure ModoEdicaoInsercao;
    function Duplicar(AId: Integer): Integer;
    function UltimaData(): string;

    procedure Relatorio01(AFiltro: TEscalaFiltro; AModelo: Integer);

    property Model: TDMEscala read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TRevendaController }

uses uFuncoesSIDomper;

procedure TEscalaController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TEscalaController.CodigoAtual: Integer;
begin
  Result := 0;
end;

constructor TEscalaController.Create;
begin
  inherited Create;
  FModel := TDMEscala.Create(nil);
end;

destructor TEscalaController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

function TEscalaController.Duplicar(AId: Integer): Integer;
var
  AModel: TEscalaVO;
  iId: Integer;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro!');

  LocalizarId(AId);

  AModel := TEscalaVO.Create;
  try
    AModel.Data := UltimaData();
    AModel.HoraInicio := FModel.CDSCadastroEsc_HoraInicio.AsString;
    AModel.HoraFim := FModel.CDSCadastroEsc_HoraFim.AsString;
    AModel.IdUsuario := FModel.CDSCadastroEsc_Usuario.AsInteger;

    iId := Salvar(AModel, dm.IdUsuario);
    Result := IdAtual;

  finally
    FreeAndNil(AModel);
  end;
end;

procedure TEscalaController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CEscala, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TEscalaController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CEscala, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TEscalaController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CEscala, ACampo, ATexto, AAtivo, AContem);
//    Negocio.Filtrar(CRevendaPrograma, Campo, Texto, Ativo, Contem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TEscalaController.Filtrar(AFiltro: TEscalaFiltro; ACampo, ATexto: string;
  AIdUsuario: Integer; AContem: Boolean);
var
  Negocio: TServerModule2Client;
  oObjetoJSON : TJSONValue;
begin
  oObjetoJSON := TConverte.ObjectToJSON<TEscalaFiltro>(AFiltro);
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.EscalaFiltrar(oObjetoJSON, ACampo, ATexto, dm.IdUsuario, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;

end;

procedure TEscalaController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CEscala, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TEscalaController.IdAtual: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.RetornaIdAtual('Escala');
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TEscalaController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CEscala, AIdUsuario);
   // FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TEscalaController.LocalizarCodigo(ACodigo: integer);
begin
//
end;

procedure TEscalaController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CEscala, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TEscalaController.ModoEdicaoInsercao;
begin
  if not (FModel.CDSCadastro.State in [dsEdit, dsInsert]) then
    FModel.CDSCadastro.Edit;
end;

procedure TEscalaController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CEscala, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TEscalaController.Pesquisar(AId, ACodigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(ACodigo);
end;

procedure TEscalaController.Post;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Post;
end;

function TEscalaController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CRevendaPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

function TEscalaController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CRevendaPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TEscalaController.Relatorio01(AFiltro: TEscalaFiltro;
  AModelo: Integer);
var
  Negocio: TServerModule2Client;
  lDM: TDMRelEscala;
  oObjetoJSON : TJSONValue;
begin
  oObjetoJSON := TConverte.ObjectToJSON<TEscalaFiltro>(AFiltro);
  lDM := TDMRelEscala.Create(nil);
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    lDM.cdsRelatorio1.Close;
    Negocio.EscalaRelatorios(oObjetoJSON, AModelo);
    lDM.Impressao(AModelo, AFiltro.DataInicial, AFiltro.DataFinal);
  finally
    FreeAndNil(Negocio);
    FreeAndNil(lDM);
  end;
end;

function TEscalaController.Salvar(AEscalaVO: TEscalaVO; AIdUsuario: Integer): Integer;
var
  Negocio: TServerModule2Client;
  IdRevenda: Integer;
  oObjetoJSON : TJSONValue;
begin
//  if AEscalaVO.Data = 0 then
//    raise Exception.Create('Informe a Data!');
//
//  if AEscalaVO.IdUsuario = 0 then
//    raise Exception.Create('Informe o Usuário!');
//
//  if AEscalaVO.HoraInicio <= 0 then
//    raise Exception.Create('Informe a Hora Inicial!');
//
//  if AEscalaVO.HoraFim <= 0 then
//    raise Exception.Create('Informe a Hora Final!');
//
//  if AEscalaVO.HoraInicio > AEscalaVO.HoraFim then
//    raise Exception.Create('Hora inicial maior que Hora final!');

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Post();

      oObjetoJSON := TConverte.ObjectToJSON(AEscalaVO);

      Result :=  Negocio.EscalaSalvar(oObjetoJSON, AIdUsuario);


//      Negocio.Salvar(CEscala, AIdUsuario);

//      FModel.CDSCadastro.ApplyUpdates(0);

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
  end;
end;

function TEscalaController.UltimaData: string;
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.EscalaBuscarUltimaData();
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TEscalaController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
  IdRevenda: Integer;
begin
  if FModel.CDSCadastroEsc_Data.AsFloat = 0 then
    raise Exception.Create('Informe a Data!');

  if FModel.CDSCadastroEsc_Usuario.AsInteger = 0 then
    raise Exception.Create('Informe o Usuário!');

  if FModel.CDSCadastroEsc_HoraInicio.AsFloat <= 0 then
    raise Exception.Create('Informe a Hora Inicial!');

  if FModel.CDSCadastroEsc_HoraFim.AsFloat <= 0 then
    raise Exception.Create('Informe a Hora Final!');

  if FModel.CDSCadastroEsc_HoraInicio.AsDateTime > FModel.CDSCadastroEsc_HoraFim.AsDateTime then
    raise Exception.Create('Hora inicial maior que Hora final!');

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try

      Post();

      Negocio.Salvar(CEscala, AIdUsuario);

      FModel.CDSCadastro.ApplyUpdates(0);

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
  end;
end;

end.
