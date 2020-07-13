unit uFormaPagtoController;

interface

uses
  System.SysUtils, uDMFormaPagto, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms, uFuncoesSIDomper,
  Data.DBXJSON, Data.DBXJSONReflect, uFormaPagtoVO;

type
  TFormaPagtoController = class
  private
    FModel: TDMFormaPagto;
    FOperacao: TOperacao;
    procedure Post;
    procedure SalvarItens(Obj: TFormaPagtoVO);
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
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
    procedure ListarFormaPagto(AIdFormaPagto: Integer);

    property Model: TDMFormaPagto read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TObservacaoController }

uses uFormaPagtoItemVO;


procedure TFormaPagtoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TFormaPagtoController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroFpg_Codigo.AsInteger;
end;

constructor TFormaPagtoController.Create;
begin
  inherited Create;
  FModel := TDMFormaPagto.Create(nil);
end;

destructor TFormaPagtoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TFormaPagtoController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado :=  Negocio.Editar(CFormaPagto, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    FModel.CDSItens.Close;
    Negocio.FormaPagtoFiltroItem(AId);
    FModel.CDSItens.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFormaPagtoController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CFormaPagto, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFormaPagtoController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CFormaPagto, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFormaPagtoController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CFormaPagto, ACodigo);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFormaPagtoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CFormaPagto, AIdUsuario);
    FModel.Rel.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFormaPagtoController.ListarFormaPagto(AIdFormaPagto: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSItens.Close;
    Negocio.FormaPagtoFiltroItem(AIdFormaPagto);
    FModel.CDSItens.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFormaPagtoController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CFormaPagto, ACodigo);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFormaPagtoController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CFormaPagto, AId);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFormaPagtoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CFormaPagto, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

    FModel.CDSItens.Close;
    Negocio.FormaPagtoFiltroItem(0);
    FModel.CDSItens.Open;

    FModel.CDSCadastroFpg_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TFormaPagtoController.Pesquisar(AId, Codigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(Codigo);
end;

procedure TFormaPagtoController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TFormaPagtoController.ProximoCodigo: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoCodigo(CFormaPagto).ToString);
    Result := iCodigo;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TFormaPagtoController.ProximoId: Integer;
var
  Negocio: TServerModule2Client;
  iCodigo: Integer;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    iCodigo := StrToInt(Negocio.ProximoId(CFormaPagto).ToString);
    Result := iCodigo;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TFormaPagtoController.Salvar(AIdUsuario: Integer): Integer;
var
  Negocio: TServerModule2Client;
  ObjVO: TFormaPagtoVO;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
  ObjVO := TFormaPagtoVO.Create;
  Marshal := TJSONMarshal.Create;
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      ObjVO.Id := FModel.CDSCadastroFpg_Id.AsInteger;
      ObjVO.Codigo := FModel.CDSCadastroFpg_Codigo.AsInteger;
      ObjVO.Nome := FModel.CDSCadastroFpg_Nome.AsString;
      ObjVO.Ativo := FModel.CDSCadastroFpg_Ativo.AsBoolean;

      SalvarItens(ObjVO);

      oObjetoJSON := Marshal.Marshal(ObjVO);
      Result := StrToIntDef(Negocio.FormaPagtoSalvar(oObjetoJSON).ToString(),0);
      Post;
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
    FreeAndNil(Marshal);
    FreeAndNil(ObjVO);
  end;
end;

procedure TFormaPagtoController.SalvarItens(Obj: TFormaPagtoVO);
var
  ItemVO: TFormaPagtoItemVO;
begin
  FModel.CDSItens.DisableControls;
  FModel.CDSItens.First;
  try
    while not FModel.CDSItens.Eof do
    begin
      ItemVO := TFormaPagtoItemVO.Create;
      ItemVO.Id := FModel.CDSItensFpgIte_Id.AsInteger;
      ItemVO.IdFormaPagto := FModel.CDSItensFpgIte_FormaPagto.AsInteger;
      ItemVO.Dias := FModel.CDSItensFpgIte_Dias.AsInteger;
      ItemVO.Obs := FModel.CDSItensFpgIte_Obs.AsString;

      Obj.Itens.Add(ItemVO);
      FModel.CDSItens.Next;
    end;
  finally
    FModel.CDSItens.First;
    FModel.CDSItens.EnableControls;
  end;
end;

end.
