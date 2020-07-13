unit uCategoriaController;

interface

uses
  System.SysUtils, uDMCategoria, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms, uFuncoesSIDomper;

type
  TCategoriaController = class
  private
    FModel: TDMCategoria;
    FOperacao: TOperacao;
    procedure Post;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
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
    procedure Pesquisar(AId, Codigo: Integer);
    function CodigoAtual: Integer;

    property Model: TDMCategoria read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TProdutoController }

procedure TCategoriaController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TCategoriaController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroCat_Codigo.AsInteger;
end;

constructor TCategoriaController.Create;
begin
  inherited Create;
  FModel := TDMCategoria.Create(nil);
end;

destructor TCategoriaController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TCategoriaController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Resultado :=  Negocio.Editar(CCategoriaPrograma, dm.IdUsuario, AId);
      FModel.CDSCadastro.Open;
      TFuncoes.HabilitarCampo(AFormulario, Resultado);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TCategoriaController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.Excluir(CCategoriaPrograma, AIdUsuario, AId);
      FModel.CDSConsulta.Delete;
      dm.Desconectar;
    except
      on E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TCategoriaController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSConsulta.Close;
      Negocio.Filtrar(CCategoriaPrograma, ACampo, ATexto, AAtivo, AContem);
      FModel.CDSConsulta.Open;
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

procedure TCategoriaController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSConsulta.Close;
      Negocio.FiltrarCodigo(CCategoriaPrograma, ACodigo);
      FModel.CDSConsulta.Open;
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

procedure TCategoriaController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    try
      Negocio.Relatorio(CCategoriaPrograma, AIdUsuario);
      FModel.Rel.Print;
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

procedure TCategoriaController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Negocio.LocalizarCodigo(CCategoriaPrograma, ACodigo);
      FModel.CDSCadastro.Open;
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

procedure TCategoriaController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Negocio.LocalizarId(CCategoriaPrograma, AId);
      FModel.CDSCadastro.Open;
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

procedure TCategoriaController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Negocio.Novo(CCategoriaPrograma, AIdUsuario);
      FModel.CDSCadastro.Open;

      FModel.CDSCadastro.Append;

      FModel.CDSCadastroCat_Codigo.AsInteger := ProximoCodigo();

      FOperacao := opIncluir;
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

procedure TCategoriaController.Pesquisar(AId, Codigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(Codigo);
end;

procedure TCategoriaController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TCategoriaController.ProximoCodigo: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      iCodigo := StrToInt(Negocio.ProximoCodigo(CCategoriaPrograma).ToString);
      Result := iCodigo;
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

function TCategoriaController.ProximoId: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      iCodigo := StrToInt(Negocio.ProximoId(CCategoriaPrograma).ToString);
      Result := iCodigo;
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

procedure TCategoriaController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
  ConsultaSQL: string;
  id: Integer;
begin
  if FModel.CDSCadastroCat_Codigo.AsInteger <= 0 then
    raise Exception.Create('Informe o Código!');

  if Trim(FModel.CDSCadastroCat_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Post();
    Negocio.Salvar(CCategoriaPrograma, AIdUsuario);
    FModel.CDSCadastro.ApplyUpdates(0);
    FOperacao := opNavegar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

end.
