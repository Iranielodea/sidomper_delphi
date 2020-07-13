unit uClienteModuloController;

interface

uses
  System.SysUtils, uDMClienteModulo, uRegras, uDM, Data.DB, uEnumerador;

type
  TClienteModuloController = class
  private
    FModel: TDMClienteModulo;
  public
    procedure LocalizarCodigo(ACodigo: integer);
    procedure LocalizarModuloProduto(AIdCliente, AIdModulo: Integer);
    procedure Excluir;
    procedure Cancelar;
    procedure Post;
    procedure Novo;
    property Model: TDMClienteModulo read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TClienteEmailController }

procedure TClienteModuloController.Cancelar;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Cancel;
end;

constructor TClienteModuloController.Create;
begin
  inherited Create;
  FModel := TDMClienteModulo.Create(nil);
end;

destructor TClienteModuloController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TClienteModuloController.Excluir;
begin
  if FModel.CDSConsulta.IsEmpty then
    raise Exception.Create('Não há Registro para Excluir.');

  FModel.CDSConsulta.Delete;
end;

procedure TClienteModuloController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.LocalizarCodigo(CClienteModuloPrograma, ACodigo);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);

  end;
end;


procedure TClienteModuloController.LocalizarModuloProduto(AIdCliente,
  AIdModulo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarClienteModuloProduto(AIdCliente, AIdModulo);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TClienteModuloController.Novo;
begin
  FModel.CDSConsulta.Append;
end;

procedure TClienteModuloController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

end.
