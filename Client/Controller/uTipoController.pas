unit uTipoController;

interface

uses
  System.SysUtils, uDMTipo, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  uTipoVO, uConverter;

type
  TTipoController = class
  private
    FModel: TDMTipo;
    FOperacao: TOperacao;
    procedure Post;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure FiltrarPrograma(ATipoPrograma: TEnumPrograma; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer); overload;
    procedure LocalizarCodigo(ACodigo: integer; ATipoPrograma: TEnumPrograma); overload;
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(AId, ACodigo: Integer); overload;
    procedure Pesquisar(AId, ACodigo: Integer; ATipoPrograma: TEnumPrograma); overload;
    function CodigoAtual: Integer;
    function RetornoUmRegistro(APrograma: TEnumPrograma): TTipoVO;

    property Model: TDMTipo read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TTipoController }

uses uFuncoesSIDomper;

procedure TTipoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TTipoController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroTip_Codigo.AsInteger;
end;

constructor TTipoController.Create;
begin
  inherited Create;
  FModel := TDMTipo.Create(nil);
end;

destructor TTipoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TTipoController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CTipoPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CTipoPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CTipoPrograma, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CTipoPrograma, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.FiltrarPrograma(ATipoPrograma: TEnumPrograma; ACampo,
  ATexto, AAtivo: string; AContem: Boolean);
var
  Negocio: TServerMethods1Client;
  iEnum: Integer;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    iEnum := Integer(ATipoPrograma);

    FModel.CDSConsulta.Close;
    Negocio.FiltrarTipoPrograma(ACampo, ATexto, AAtivo, iEnum, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CTipoPrograma, AIdUsuario);
    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CTipoPrograma, ACodigo);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.LocalizarCodigo(ACodigo: integer;
  ATipoPrograma: TEnumPrograma);
var
  Negocio: TServerMethods1Client;
  iEnum: Integer;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    iEnum := integer(ATipoPrograma);
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigoTipoPrograma(iEnum, ACodigo);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CTipoPrograma, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CTipoPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;
    FModel.CDSCadastroTip_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.Pesquisar(AId, ACodigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(ACodigo);
end;

procedure TTipoController.Pesquisar(AId, ACodigo: Integer;
  ATipoPrograma: TEnumPrograma);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(ACodigo, ATipoPrograma);
end;

procedure TTipoController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TTipoController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CTipoPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

function TTipoController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CTipoPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

function TTipoController.RetornoUmRegistro(APrograma: TEnumPrograma): TTipoVO;
var
  Negocio: TServerMethods1Client;
  iPrograma: Integer;
  Model: TTipoVO;
begin
  iPrograma := Integer(APrograma);
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Model := TConverte.JSONToObject<TTipoVO>(Negocio.TipoRetornoUmRegistro(iPrograma));
    Result := Model;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTipoController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if FModel.CDSCadastroTip_Codigo.AsInteger <= 0 then
    raise Exception.Create('Informe o Código!');

  if Trim(FModel.CDSCadastroTip_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Post();

      Negocio.Salvar(CTipoPrograma, AIdUsuario);
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
