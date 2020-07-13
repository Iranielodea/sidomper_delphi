unit uProdutoController;

interface

uses
  System.SysUtils, uDMProduto, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms, uFuncoesSIDomper;

type
  TProdutoController = class
  private
    FModel: TDMProduto;
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

    property Model: TDMProduto read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TProdutoController }

procedure TProdutoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TProdutoController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroProd_Codigo.AsInteger;
end;

constructor TProdutoController.Create;
begin
  inherited Create;
  FModel := TDMProduto.Create(nil);
end;

destructor TProdutoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TProdutoController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado :=  Negocio.Editar(CProdutoPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProdutoController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CProdutoPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProdutoController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CProdutoPrograma, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProdutoController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CProdutoPrograma, ACodigo);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProdutoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CProdutoPrograma, AIdUsuario);
    FModel.Rel.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProdutoController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CProdutoPrograma, ACodigo);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProdutoController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CProdutoPrograma, AId);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProdutoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CProdutoPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

    FModel.CDSCadastroProd_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProdutoController.Pesquisar(AId, Codigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(Codigo);
end;

procedure TProdutoController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TProdutoController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
  iCodigo: Integer;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoCodigo(CProdutoPrograma).ToString);
    Result := iCodigo;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TProdutoController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
  iCodigo: Integer;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoId(CProdutoPrograma).ToString);
    Result := iCodigo;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProdutoController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  ConsultaSQL: string;
  id: Integer;
begin
  if FModel.CDSCadastroProd_Codigo.AsInteger <= 0 then
    raise Exception.Create('Informe o Código!');

  if Trim(FModel.CDSCadastroProd_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Post();
      Negocio.Salvar(CProdutoPrograma, AIdUsuario);
      FModel.CDSCadastro.ApplyUpdates(0);
      FOperacao := opNavegar;
      dm.Desconectar;
//      FModel.CDSCadastro.Refresh;
    except
      on E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

end.
