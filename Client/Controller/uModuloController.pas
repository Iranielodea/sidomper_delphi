unit uModuloController;

interface

uses
  System.SysUtils, uDMModulo, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms;

type
  TModuloController = class
  private
    FModel: TDMModulo;
    FOperacao: TOperacao;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCliente(AIdCliente: Integer; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer; AIdCliente: integer = 0);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(AId, ACodigo: Integer; AIdCliente: Integer = 0);
    function CodigoAtual: Integer;

    property Model: TDMModulo read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TModuloController }

uses uFuncoesSIDomper;

procedure TModuloController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TModuloController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroMod_Codigo.AsInteger;
end;

constructor TModuloController.Create;
begin
  FModel := TDMModulo.Create(nil);
end;

destructor TModuloController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TModuloController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CModuloPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModuloController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CModuloPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModuloController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CModuloPrograma, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModuloController.FiltrarCliente(AIdCliente: Integer; ACampo, ATexto,
  AAtivo: string; AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarModuloCliente(AIdCliente, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModuloController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CModuloPrograma, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModuloController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CModuloPrograma, AIdUsuario);
    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModuloController.LocalizarCodigo(ACodigo: Integer; AIdCliente: integer = 0);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    if AIdCliente = 0 then
      Negocio.LocalizarCodigo(CModuloPrograma, ACodigo)
    else
      Negocio.LocalizarModuloClienteCodigo(AIdCliente, ACodigo);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModuloController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CModuloPrograma, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModuloController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CModuloPrograma, AIdUsuario);
    LocalizarId(0);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

    FModel.CDSCadastroMod_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModuloController.Pesquisar(AId, ACodigo: Integer; AIdCliente: Integer = 0);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(ACodigo, AIdCliente);
end;

function TModuloController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CModuloPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

function TModuloController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CModuloPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TModuloController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if FModel.CDSCadastroMod_Codigo.AsInteger <= 0 then
    raise Exception.Create('Informe o Código!');

  if Trim(FModel.CDSCadastroMod_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
        FModel.CDSCadastro.Post;

      Negocio.Salvar(CModuloPrograma, AIdUsuario);
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
