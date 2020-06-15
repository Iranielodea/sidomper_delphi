unit uProspectController;

interface

uses
  System.SysUtils, uRegras, uEnumerador, uDM, Data.DB,
    Vcl.Forms, uFiltroCliente, uDMProspect,
    Data.DBXJSON , Data.DBXJSONReflect, System.Generics.Collections,
    uFiltroProspect;

type
  TProspectController = class
  private
    FModel: TDMProspect;
    FOperacao: TOperacao;
//    procedure SalvarEmail(AIdProspect: integer);
    procedure Post;
  public
    procedure Filtrar(AFiltro: TFiltroProspect; ACampo, ATexto, AAtivo: string; AIdUsuario: Integer; AContem: Boolean = False);
    procedure LocalizarId(AId: Integer);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure LocalizarCodigo(ACodigo: integer);
    procedure LocalizarCodigoProspect(ACodigo, AIdUsuario: Integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdProspect: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure APesquisar(AId, ACodigo: Integer);

    procedure NovoEmail(AIdUsuario: Integer);
    procedure EditarEmail(AId: Integer);
    procedure ExcluirEmail(AIdUsuario, AId: Integer);
    procedure SalvarEmail(AIdProspect: Integer); overload;
    procedure SalvarEmail(); overload;
    procedure LocalizarEmailCodigo(AIdProspect: Integer);

    property Model: TDMProspect read FModel write FModel;

    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TClienteController }

uses uFuncoesSIDomper, uParametrosController, uProspectVO;

procedure TProspectController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

constructor TProspectController.Create;
begin
  inherited Create;
  FModel := TDMProspect.Create(nil);
end;

destructor TProspectController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TProspectController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CProspectPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    LocalizarEmailCodigo(AId);

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.EditarEmail(AId: Integer);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');
  FModel.CDSEmail.Edit;
end;

procedure TProspectController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CProspectPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.ExcluirEmail(AIdUsuario, AId: Integer);
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  FModel.CDSEmail.Delete;
end;

procedure TProspectController.Filtrar(AFiltro: TFiltroProspect; ACampo, ATexto, AAtivo: string; AIdUsuario: Integer;
  AContem: Boolean);
var
  Negocio: TServerModule2Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarProspect(oObjetoJSON, CProspectPrograma, AIdUsuario, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CProspectPrograma, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CProspectPrograma, AIdUsuario);
//    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CProspectPrograma, ACodigo);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.LocalizarCodigoProspect(ACodigo, AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigoProspect(ACodigo, AIdUsuario);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.LocalizarEmailCodigo(AIdProspect: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSEmail.Close;
    Negocio.EmailLocalizarCodigo(AIdProspect);
    FModel.CDSEmail.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CProspectPrograma, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CProspectPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;
    FModel.CDSCadastro.Append;

    FModel.CDSCadastroPros_Codigo.AsInteger := ProximoCodigo();

    LocalizarEmailCodigo(0);

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.NovoEmail(AIdUsuario: Integer);
//var
//  Negocio: TServerModule2Client;
begin
//  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
//  try
//    Negocio.EmailProspectNovo(CProspectPrograma, dm.IdUsuario);
//    FModel.CDSEmail.Append;
//  finally
//    FreeAndNil(Negocio);
//  end;
  FModel.CDSEmail.Append;
end;

procedure TProspectController.APesquisar(AId, ACodigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigoProspect(ACodigo, dm.IdUsuario);
end;

procedure TProspectController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TProspectController.ProximoCodigo: Integer;
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CProspectPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

function TProspectController.ProximoId: Integer;
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CProspectPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.Salvar(AIdProspect: Integer);
var
  Negocio: TServerModule2Client;
  Transacao: TServerMethods1Client;
  Id: Integer;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  Obj: TProspectVO;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Post;

  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  Transacao := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  Obj := TProspectVO.Create;
  try
    try
      Transacao.StartTransacao;

      obj.Id := FModel.CDSCadastroPros_Id.AsInteger;
      Obj.Nome := FModel.CDSCadastroPros_Nome.AsString;
      Obj.Fantasia := FModel.CDSCadastroPros_Fantasia.AsString;
      Obj.Docto := FModel.CDSCadastroPros_Docto.AsString;
      Obj.Enquadramento := FModel.CDSCadastroPros_Enquadramento.AsString;
      obj.Endereco := FModel.CDSCadastroPros_Endereco.AsString;
      obj.Telefone := FModel.CDSCadastroPros_Telefone.AsString;
      Obj.Contato := FModel.CDSCadastroPros_Contato.AsString;
      obj.IdUsuario := FModel.CDSCadastroPros_Usuario.AsInteger;
      Obj.IdRevenda := FModel.CDSCadastroPros_Revenda.AsInteger;
      Obj.Ativo := FModel.CDSCadastroPros_Ativo.AsBoolean;
      Obj.Codigo := FModel.CDSCadastroPros_Codigo.AsInteger;

      Marshal := TJSONMarshal.Create;
      try
        oObjetoJSON := Marshal.Marshal(obj);
      finally
        FreeAndNil(Marshal);
      end;

      Id := Negocio.SalvarProspect(dm.IdUsuario, oObjetoJSON);
      SalvarEmail(Id);

      Transacao.Commit;
      FOperacao := opNavegar;
    except
      ON E: Exception do
      begin
        Transacao.Roolback;
        raise Exception.Create(TFuncoes.MensagemBanco(E.Message));
      end;
    end;
  finally
    FreeAndNil(Transacao);
    FreeAndNil(Negocio);
  end;
end;

procedure TProspectController.SalvarEmail;
begin
  if FModel.CDSEmail.State in [dsEdit, dsInsert] then
    FModel.CDSEmail.Post;
end;

procedure TProspectController.SalvarEmail(AIdProspect: Integer);
begin
  if FModel.CDSEmail.State = dsInsert then
    FModel.CDSEmail.Cancel;

  FModel.CDSEmail.DisableControls;
  try
    FModel.CDSEmail.First;
    while not FModel.CDSEmail.Eof do
    begin
      FModel.CDSEmail.Edit;
      FModel.CDSEmailProsEm_Prospect.AsInteger := AIdProspect;
      FModel.CDSEmail.Post;
      FModel.CDSEmail.Next;
    end;
    FModel.CDSEmail.ApplyUpdates(0);
  finally
    FModel.CDSEmail.EnableControls;
  end;
end;

end.
