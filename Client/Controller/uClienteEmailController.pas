unit uClienteEmailController;

interface

uses
  System.SysUtils, uDMClienteEmail, uRegras, uDM, Data.DB, uEnumerador,
  uFuncoesSIDomper;

type
  TClienteEmailController = class
  private
    FModel: TDMClienteEmail;
  public
    procedure LocalizarCodigo(ACodigo: integer);
    procedure Post;
    procedure Excluir;
    procedure Cancelar;
    procedure Novo;

    property Model: TDMClienteEmail read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TClienteEmailController }

procedure TClienteEmailController.Cancelar;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Cancel;
end;

constructor TClienteEmailController.Create;
begin
  inherited Create;
  FModel := TDMClienteEmail.Create(nil);
end;

destructor TClienteEmailController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TClienteEmailController.Excluir;
begin
  if FModel.CDSConsulta.IsEmpty then
    raise Exception.Create('Não há Registro para Excluir.');

  FModel.CDSConsulta.Delete;
end;

procedure TClienteEmailController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.LocalizarCodigo(CClienteEmailPrograma, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;


procedure TClienteEmailController.Novo;
begin
  FModel.CDSConsulta.Append;
end;

procedure TClienteEmailController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

end.
