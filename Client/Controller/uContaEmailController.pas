unit uContaEmailController;

interface

uses
  System.SysUtils, uDMContaEmail, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  uUsuarioController, uEnviarEmail, uEmailBase, uFormProcesso;

type
  TContaEmailController = class
  private
    FModel: TDMContaEmail;
    FOperacao: TOperacao;
    FPorta: Integer;
    FHost: string;
    FUserName: string;
    FPassword: string;
    FMeuEmail: string;
    FAutenticar: Boolean;
    FAutenticarSSL: Boolean;
    FId: Integer;
    procedure Post;
    procedure PopularCampos();
  public
    procedure Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = False);
    procedure FiltrarCodigo(Codigo: Integer);
    procedure LocalizarId(Id: Integer);
    procedure LocalizarCodigo(Codigo: integer);
    procedure Novo(IdUsuario: Integer);
    procedure Editar(Id: Integer; Formulario: TForm);
    procedure Salvar(IdUsuario: Integer);
    procedure Excluir(IdUsuario, Id: Integer);
    procedure Cancelar();
    procedure Imprimir(IdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(Id, Codigo: Integer);
    function CodigoAtual: Integer;
    procedure EnviarEmail(AIdUsuario: Integer; ADestinario, ACopiaOculta,
      AAssunto, ATexto, AArquivo: string; AAviso: Boolean=True);

    property Model: TDMContaEmail read FModel write FModel;
    constructor Create(AIdUsuario: Integer=0);
    destructor Destroy; override;
  end;

implementation

{ TRevendaController }

uses uFuncoesSIDomper;

procedure TContaEmailController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TContaEmailController.CodigoAtual: Integer;
begin
  if FModel.CDSCadastroCtaEm_Id.AsInteger = 0 then
    Result := ProximoCodigo -1
  else
    Result := FModel.CDSCadastroCtaEm_Codigo.AsInteger;
end;

constructor TContaEmailController.Create(AIdUsuario: Integer = 0);
var
  Usuario: TUsuarioController;
begin
  inherited Create;
  FModel := TDMContaEmail.Create(nil);

  if AIdUsuario > 0 then
  begin
    Usuario := TUsuarioController.Create;
    try
      Usuario.LocalizarId(AIdUsuario);
      LocalizarId(Usuario.Model.CDSCadastroUsu_ContaEmail.AsInteger);
      PopularCampos();
    finally
      FreeAndNil(Usuario);
    end;
  end;
end;

destructor TContaEmailController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TContaEmailController.Editar(Id: Integer; Formulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if Id = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CContaEmailPrograma, dm.IdUsuario, Id);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(Formulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TContaEmailController.EnviarEmail(AIdUsuario: Integer; ADestinario,
  ACopiaOculta, AAssunto, ATexto, AArquivo: string; AAviso: Boolean);
var
  objEmail: TEmailBase;
  Usuario: TUsuarioController;
  FormularioProcesso: TfrmProcesso;
begin
  objEmail := TEmail.Create;
  Usuario := TUsuarioController.Create;
  FormularioProcesso := TfrmProcesso.Create(nil);
  try
    if AIdUsuario > 0 then
    begin
      Usuario.LocalizarId(AIdUsuario);
      LocalizarId(Usuario.Model.CDSCadastroUsu_ContaEmail.AsInteger);
      PopularCampos();
    end;

    if FId > 0 then
    begin
      objEmail.Porta          := FPorta;
      objEmail.Host           := FHost;
      objEmail.UserName       := FUserName;
      objEmail.Password       := FPassword;
      objEmail.MeuEmail       := FMeuEmail;
      objEmail.Destinatario   := ADestinario;
      objEmail.CopiaOculta    := ACopiaOculta;
      objEmail.Texto          := ATexto;
      objEmail.Assunto        := AAssunto;
      objEmail.ArquivoAnexo   := AArquivo;
      objEmail.Autenticar     := FAutenticar;
      objEmail.AutenticarSSL  := FAutenticarSSL;

      if AAviso = True then
        FormularioProcesso.Mensagem('Aguarde, enviando email...');

      objEmail.EnviarEmail();

    end;
  finally
    FreeAndNil(objEmail);
    FreeAndNil(Usuario);
    FreeAndNil(FormularioProcesso);
  end;
end;

procedure TContaEmailController.Excluir(IdUsuario, Id: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if Id = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CContaEmailPrograma, IdUsuario, Id);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TContaEmailController.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CContaEmailPrograma, Campo, Texto, Ativo, Contem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TContaEmailController.FiltrarCodigo(Codigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CContaEmailPrograma, Codigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TContaEmailController.Imprimir(IdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CContaEmailPrograma, IdUsuario);
    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TContaEmailController.LocalizarCodigo(Codigo: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CContaEmailPrograma, Codigo);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TContaEmailController.LocalizarId(Id: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CContaEmailPrograma, Id);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TContaEmailController.Novo(IdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CContaEmailPrograma, IdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

    FModel.CDSCadastroCtaEm_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TContaEmailController.Pesquisar(Id, Codigo: Integer);
begin
  if Id > 0 then
    LocalizarId(Id)
  else
    LocalizarCodigo(Codigo);
end;

procedure TContaEmailController.PopularCampos;
begin
  FId             := FModel.CDSCadastroCtaEm_Id.AsInteger;
  FPorta          := FModel.CDSCadastroCtaEm_Porta.AsInteger;
  FHost           := FModel.CDSCadastroCtaEm_SMTP.AsString;
  FUserName       := FModel.CDSCadastroCtaEm_Email.AsString;
  FPassword       := FModel.CDSCadastroCtaEm_Senha.AsString;
  FMeuEmail       := FModel.CDSCadastroCtaEm_Email.AsString;
  FAutenticar     := FModel.CDSCadastroCtaEm_Autenticar.AsBoolean;
  FAutenticarSSL  := FModel.CDSCadastroCtaEm_AutenticarSSL.AsBoolean;


//  FHost := 'smtp.office365.com';
//  FPorta := 587;
//  FMeuEmail := 'irani@domper.com.br';
//  FPassword := 'domper@123';
//  FUserName := FMeuEmail;

end;

procedure TContaEmailController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TContaEmailController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CContaEmailPrograma).ToString);
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TContaEmailController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CContaEmailPrograma).ToString);
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TContaEmailController.Salvar(IdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if FModel.CDSCadastroCtaEm_Codigo.AsInteger <= 0 then
    raise Exception.Create('Informe o C�digo!');

  if Trim(FModel.CDSCadastroCtaEm_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');

  if Trim(FModel.CDSCadastroCtaEm_Email.AsString) = '' then
    raise Exception.Create('Informe o Email!');

  if Trim(FModel.CDSCadastroCtaEm_Senha.AsString) = '' then
    raise Exception.Create('Informe a Senha!');

  if Trim(FModel.CDSCadastroCtaEm_SMTP.AsString) = '' then
    raise Exception.Create('Informe o SMTP!');

  if (FModel.CDSCadastroCtaEm_Porta.AsInteger) <= 0 then
    raise Exception.Create('Informe a Porta!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Post();
      FModel.CDSCadastro.ApplyUpdates(0);

      Negocio.Salvar(CContaEmailPrograma, IdUsuario);
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
