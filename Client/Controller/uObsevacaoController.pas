unit uObsevacaoController;

interface

uses
  System.SysUtils, uDMObservacao, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms, uFuncoesSIDomper,
  Data.DBXJSON, Data.DBXJSONReflect, uConverter, uGenericProperty;

type
  TObservacaoController = class
  private
    FModel: TDMObservacao;
    FOperacao: TOperacao;
    procedure Post;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure FiltrarPrograma(AObservacaoPrograma: TEnumPrograma; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure LocalizarPadrao(APrograma: TEnumPrograma);
    procedure LocalizarEmailPadrao(APrograma: TEnumPrograma);
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

    property Model: TDMObservacao read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TObservacaoController }

uses uObservacaoVO;

procedure TObservacaoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TObservacaoController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroObs_Codigo.AsInteger;
end;

constructor TObservacaoController.Create;
begin
  inherited Create;
  FModel := TDMObservacao.Create(nil);
end;

destructor TObservacaoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TObservacaoController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado :=  Negocio.Editar(CObservacao, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CObservacao, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CObservacao, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CObservacao, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.FiltrarPrograma(AObservacaoPrograma: TEnumPrograma;
  ACampo, ATexto, AAtivo: string; AContem: Boolean);
var
  Negocio: TServerModule2Client;
  iEnum: Integer;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iEnum := Integer(AObservacaoPrograma);

    FModel.CDSConsulta.Close;
    Negocio.FiltrarObservacaoPrograma(ACampo, ATexto, AAtivo, iEnum, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CObservacao, AIdUsuario);
    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CObservacao, ACodigo);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.LocalizarEmailPadrao(APrograma: TEnumPrograma);
var
  Negocio: TServerModule2Client;
  iEnum: Integer;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iEnum := Integer(APrograma);

    FModel.CDSCadastro.Close;
    Negocio.ObservacaoEmailPadrao(iEnum);
    FModel.CDSCadastro.Open;

  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CObservacao, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.LocalizarPadrao(APrograma: TEnumPrograma);
var
  Negocio: TServerModule2Client;
  iEnum: Integer;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iEnum := Integer(APrograma);

    FModel.CDSCadastro.Close;
    Negocio.ObservacaoPadrao(iEnum);
    FModel.CDSCadastro.Open;

  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CObservacao, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

    FModel.CDSCadastroObs_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TObservacaoController.Pesquisar(AId, Codigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(Codigo);
end;

procedure TObservacaoController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TObservacaoController.ProximoCodigo: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoCodigo(CObservacao).ToString);
    Result := iCodigo;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TObservacaoController.ProximoId: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoId(CObservacao).ToString);
    Result := iCodigo;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TObservacaoController.Salvar(AIdUsuario: Integer): Integer;
var
  Negocio: TServerModule2Client;
  ObjVO: TObservacaoVO;
  oObjetoJSON : TJSONValue;
begin
  ObjVO := TObservacaoVO.Create;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      TGenericProperty.SetProperty<TObservacaoVO>(ObjVO, FModel.cdsCadastro);

      oObjetoJSON := TConverte.ObjectToJSON(ObjVO);

      Result := StrToIntDef(Negocio.ObservacaoSalvar(oObjetoJSON).ToString(),0);
      Post;
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
    FreeAndNil(ObjVO);
  end;
end;

end.
