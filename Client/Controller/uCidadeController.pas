unit uCidadeController;

interface

uses
  System.SysUtils, uDMCidade, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms, uFuncoesSIDomper,
  Data.DBXJSON, Data.DBXJSONReflect, uConverter, uGenericProperty;

type
  TCidadeController = class
  private
    FModel: TDMCidade;
    FOperacao: TOperacao;
    procedure Post;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure FiltrarPrograma(AObservacaoPrograma: TEnumPrograma; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure LocalizarPadrao(APrograma: TEnumPrograma);
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

    property Model: TDMCidade read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TObservacaoController }

uses uObservacaoVO;

procedure TCidadeController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TCidadeController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroCid_Codigo.AsInteger;
end;

constructor TCidadeController.Create;
begin
  inherited Create;
  FModel := TDMCidade.Create(nil);
end;

destructor TCidadeController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TCidadeController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado :=  Negocio.Editar(CCidade, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TCidadeController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CCidade, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TCidadeController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CCidade, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
//    dm.Desconectar;
  end;
end;

procedure TCidadeController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CCidade, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TCidadeController.FiltrarPrograma(AObservacaoPrograma: TEnumPrograma;
  ACampo, ATexto, AAtivo: string; AContem: Boolean);
var
  Negocio: TServerModule2Client;
  iEnum: Integer;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iEnum := Integer(AObservacaoPrograma);

    FModel.CDSConsulta.Close;
    Negocio.FiltrarObservacaoPrograma(ACampo, ATexto, AAtivo, iEnum, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TCidadeController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CCidade, AIdUsuario);
    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TCidadeController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CCidade, ACodigo);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TCidadeController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CCidade, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TCidadeController.LocalizarPadrao(APrograma: TEnumPrograma);
var
  Negocio: TServerModule2Client;
  iEnum: Integer;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iEnum := Integer(APrograma);

    FModel.CDSCadastro.Close;
    Negocio.ObservacaoPadrao(iEnum);
    FModel.CDSCadastro.Open;

  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TCidadeController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CCidade, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

    FModel.CDSCadastroCid_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TCidadeController.Pesquisar(AId, Codigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(Codigo);
end;

procedure TCidadeController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TCidadeController.ProximoCodigo: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoCodigo(CCidade).ToString);
    Result := iCodigo;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TCidadeController.ProximoId: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoId(CCidade).ToString);
    Result := iCodigo;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TCidadeController.Salvar(AIdUsuario: Integer): Integer;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      if FModel.CDSCadastroCid_Codigo.AsInteger <= 0 then
        raise Exception.Create('Informe o Código!');

      if FModel.CDSCadastroCid_Nome.AsString = '' then
        raise Exception.Create('Informe o Nome!');

      Post;
      Negocio.Salvar(CCidade, AIdUsuario);
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
    dm.Desconectar;
  end;
end;

end.
