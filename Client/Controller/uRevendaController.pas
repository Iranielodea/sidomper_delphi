unit uRevendaController;

interface

uses
  System.SysUtils, uDMRevenda, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms;

type
  TRevendaController = class
  private
    FModel: TDMRevenda;
    FOperacao: TOperacao;
    procedure Post;
    procedure SalvarEmail(AIdRevenda: Integer);
    function IdAtual: Integer;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer; AMensagem: Boolean=True);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure Pesquisar(AId, ACodigo: Integer);
    function CodigoAtual: Integer;
    procedure FiltrarEmail(AIdRevenda: integer);
    function MascaraCodigo(ACodigo: string): string;

    property Model: TDMRevenda read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TRevendaController }

uses uFuncoesSIDomper;

procedure TRevendaController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TRevendaController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroRev_Codigo.AsInteger;
end;

constructor TRevendaController.Create;
begin
  inherited Create;
  FModel := TDMRevenda.Create(nil);
end;

destructor TRevendaController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TRevendaController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CRevendaPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    FiltrarEmail(AId);

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TRevendaController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CRevendaPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TRevendaController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarRevenda(ACampo, ATexto, AAtivo, dm.IdUsuario, AContem);
//    Negocio.Filtrar(CRevendaPrograma, Campo, Texto, Ativo, Contem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TRevendaController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CRevendaPrograma, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TRevendaController.FiltrarEmail(AIdRevenda: integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    FModel.CDSEmail.Close;
    Negocio.FiltrarRevendaEmail(AIdRevenda);
    FModel.CDSEmail.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TRevendaController.IdAtual: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.RetornaIdAtual('Revenda');
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TRevendaController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CRevendaPrograma, AIdUsuario);
    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TRevendaController.LocalizarCodigo(ACodigo: integer; AMensagem: Boolean=True);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigoRevenda(ACodigo, dm.IdUsuario, AMensagem);
//    Negocio.LocalizarCodigo(CRevendaPrograma, Codigo);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TRevendaController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CRevendaPrograma, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TRevendaController.MascaraCodigo(ACodigo: string): string;
begin
  if StrToIntDef(ACodigo, 0) > 0 then
    Result := FormatFloat('0000', StrToFloat(ACodigo))
  else
    Result := '';
end;

procedure TRevendaController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CRevendaPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FiltrarEmail(0);

    FModel.CDSCadastro.Append;

    FModel.CDSCadastroRev_Codigo.AsInteger := ProximoCodigo();

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TRevendaController.Pesquisar(AId, ACodigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigo(ACodigo);
end;

procedure TRevendaController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TRevendaController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CRevendaPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

function TRevendaController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CRevendaPrograma).ToString);
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TRevendaController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  IdRevenda: Integer;
begin
  if FModel.CDSCadastroRev_Codigo.AsInteger <= 0 then
    raise Exception.Create('Informe o Código!');

  if Trim(FModel.CDSCadastroRev_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');


  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Post();
      FModel.CDSCadastro.ApplyUpdates(0);

      if FOperacao = opIncluir then
        IdRevenda := IdAtual()
      else
        IdRevenda := FModel.CDSCadastroRev_Id.AsInteger;

      SalvarEmail(IdRevenda);

      Negocio.Salvar(CRevendaPrograma, AIdUsuario);
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

procedure TRevendaController.SalvarEmail(AIdRevenda: Integer);
begin
  FModel.CDSEmail.DisableControls;
  try
    FModel.CDSEmail.First;
    while not FModel.CDSEmail.Eof do
    begin
      FModel.CDSEmail.Edit;
      FModel.CDSEmailRevEm_Revenda.AsInteger := AIdRevenda;
      FModel.CDSEmail.Post;
      FModel.CDSEmail.Next;
    end;

    if FModel.CDSEmail.ChangeCount > 0 then
      FModel.CDSEmail.ApplyUpdates(0);
    FModel.CDSEmail.First;
  finally
    FModel.CDSEmail.EnableControls;
  end;
end;

end.
