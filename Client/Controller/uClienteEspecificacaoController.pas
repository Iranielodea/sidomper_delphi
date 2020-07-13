unit uClienteEspecificacaoController;

interface

uses
  System.SysUtils, uDMClienteEspecificacao, uRegras, uDM, Data.DB, uEnumerador,
  Vcl.Forms, uFuncoesSIDomper;

type
  TClienteEspecificacaoController = class
  private
    FModel: TDMClienteEspecificacao;
    FOperacao: TOperacao;
    procedure Post;
  public
    procedure LocalizarCodigo(AIdCliente: integer);
    procedure Cancelar;
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdCliente, AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Imprimir(AIdUsuario: Integer);


    property Model: TDMClienteEspecificacao read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TClienteEmailController }

procedure TClienteEspecificacaoController.Cancelar;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Cancel;
end;

constructor TClienteEspecificacaoController.Create;
begin
  inherited Create;
  FModel := TDMClienteEspecificacao.Create(nil);
end;

destructor TClienteEspecificacaoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;


procedure TClienteEspecificacaoController.Editar(AId: Integer;
  AFormulario: TForm);
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
    Resultado := Negocio.Editar(CClienteEspPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
    DM.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TClienteEspecificacaoController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CClienteEspPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
    DM.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TClienteEspecificacaoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CClienteEspPrograma, AIdUsuario);
    FModel.Rel.Print;
    DM.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TClienteEspecificacaoController.LocalizarCodigo(AIdCliente: integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.LocalizarCodigo(CClienteEspPrograma, AIdCliente);
    FModel.CDSConsulta.Open;
    DM.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;


procedure TClienteEspecificacaoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CClienteEspPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;
    FOperacao := opIncluir;
    DM.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TClienteEspecificacaoController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

procedure TClienteEspecificacaoController.Salvar(AIdCliente, AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if FModel.CDSCadastroCliEsp_Usuario.AsInteger = 0 then
    raise Exception.Create('Informe o Usuário!');

  if Trim(FModel.CDSCadastroCliEsp_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');

  if Trim(FModel.CDSCadastroCliEsp_Descricao.AsString) = '' then
    raise Exception.Create('Informe a Descrição!');

  if Trim(FModel.CDSCadastroCliEsp_Anexo.AsString) <> '' then
  begin
    if not FileExists(FModel.CDSCadastroCliEsp_Anexo.AsString) then
      raise Exception.Create('Diretório não Encontrado.');
  end;

  if FOperacao = opIncluir then
    FModel.CDSCadastroCliEsp_Cliente.AsInteger := AIdCliente;

  Post();

  FModel.CDSCadastro.ApplyUpdates(0);

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Salvar(CClienteEspPrograma, AIdUsuario);
    DM.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;

  FOperacao := opNavegar;
end;

end.
