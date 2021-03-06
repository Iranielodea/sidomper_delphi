unit uStatusController;

interface

uses
  System.SysUtils, uDMStatus, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms, uFuncoesSIDomper,
  uStatusVO, System.Generics.Collections, uConverter;

type
  TStatusController = class
  private
    FModel: TDMStatus;
    FOperacao: TOperacao;
    procedure Post;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure FiltrarPrograma(AStatusPrograma: TEnumPrograma; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer); overload;
    procedure LocalizarCodigo(ACodigo: integer; AStatusPrograma: TEnumPrograma); overload;

    procedure Novo(AIdUsuario: Integer);
    procedure Editar(Id: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(AId, ACodigo: Integer); overload;
    procedure Pesquisar(AId, ACodigo: Integer; AStatusPrograma: TEnumPrograma); overload;
    function CodigoAtual: Integer;
    function LocalizarPorPrograma(ATipo: Integer): TObjectList<TStatusVO>;

    property Model: TDMStatus read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TStatusController }

procedure TStatusController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TStatusController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroSta_Codigo.AsInteger;
end;

constructor TStatusController.Create;
begin
  inherited Create;
  FModel := TDMStatus.Create(nil);
end;

destructor TStatusController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TStatusController.Editar(Id: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if Id = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CStatusPrograma, dm.IdUsuario, Id);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CStatusPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CStatusPrograma, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CStatusPrograma, ACodigo);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.FiltrarPrograma(AStatusPrograma: TEnumPrograma; ACampo,
  ATexto, AAtivo: string; AContem: Boolean);
var
  Negocio: TServerMethods1Client;
  iEnum: Integer;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    iEnum := Integer(AStatusPrograma);

    FModel.CDSConsulta.Close;
    Negocio.FiltrarStatusPrograma(ACampo, ATexto, AAtivo, iEnum, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CStatusPrograma, AIdUsuario);
    FModel.Rel.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CStatusPrograma, ACodigo);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.LocalizarCodigo(ACodigo: integer;
  AStatusPrograma: TEnumPrograma);
var
  Negocio: TServerMethods1Client;
  iEnum: Integer;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    iEnum := integer(AStatusPrograma);
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigoStatusPrograma(iEnum, ACodigo);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CStatusPrograma, AId);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TStatusController.LocalizarPorPrograma(
  ATipo: Integer): TObjectList<TStatusVO>;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := TConverte.JSONToObject<TListaStatus>(Negocio.Status_LocalizarPorPrograma(ATipo));
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CStatusPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;
    FModel.CDSCadastroSta_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.Pesquisar(AId, ACodigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(ACodigo);
end;

procedure TStatusController.Pesquisar(AId, ACodigo: Integer;
  AStatusPrograma: TEnumPrograma);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(ACodigo, AStatusPrograma);
end;

procedure TStatusController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TStatusController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CStatusPrograma).ToString);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TStatusController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CStatusPrograma).ToString);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TStatusController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if FModel.CDSCadastroSta_Codigo.AsInteger <= 0 then
    raise Exception.Create('Informe o C�digo!');

  if Trim(FModel.CDSCadastroSta_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Post();

      Negocio.Salvar(CStatusPrograma, AIdUsuario);
      FModel.CDSCadastro.ApplyUpdates(0);

      FOperacao := opNavegar;
      dm.Desconectar;
    except
      on E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

end.
