unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect,
  uConfig, Vcl.Controls, MidasLib, uRegras, Vcl.Dialogs, vcl.Forms;

type
  TDM = class(TDataModule)
    Conexao: TSQLConnection;
    DSPConexao: TDSProviderConnection;
    BalloonHint1: TBalloonHint;
    DSPConexao2: TDSProviderConnection;
    cdsUsuario: TClientDataSet;
    cdsUsuarioCodigo: TIntegerField;
    cdsUsuarioUserName: TStringField;
    cdsUsuarioNome: TStringField;
    cdsUsuarioPassword: TStringField;
    cdsUsuarioEmail: TStringField;
    cdsUsuarioAdm: TBooleanField;
    cdsUsuarioNotificar: TBooleanField;
    cdsUsuarioPermissao: TClientDataSet;
    cdsUsuarioPermissaoId: TIntegerField;
    cdsUsuarioPermissaoIdUsuario: TIntegerField;
    cdsUsuarioPermissaoSigla: TStringField;
    cdsUsuarioId: TIntegerField;
    cdsParametro: TClientDataSet;
    cdsParametroCodigo: TIntegerField;
    cdsParametroPrograma: TIntegerField;
    cdsParametroValor: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    FOperacaoConcluida: Boolean;
    FIdSelecionado: integer;
    FIdUsuario: Integer;
    FIdCadastro: Integer;
    FTema: string;
    procedure CarregarIni;
    procedure SetTema(const Value: string);
    function GetTema: string;
    procedure BuscarUsuario();
  public
    { Public declarations }
    procedure Conectar();
    procedure ConexaoBanco();
    procedure Desconectar;
    procedure ErroConexao(AErro: string);
    procedure StartTransacao;
    procedure Commit;
    procedure Roolback;

    property IdSelecionado: integer read FIdSelecionado write FIdSelecionado;
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property IdCadastro: Integer read FIdCadastro write FIdCadastro;
    property Tema: string read GetTema write SetTema;
  end;

var
  DM: TDM;

implementation

  uses uUsuarioController;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.BuscarUsuario;
var
  controller: TUsuarioController;
begin
  controller := TUsuarioController.Create;
  try
    controller.UsuarioADM(0);
  finally
    FreeAndNil(controller);
  end;
end;

procedure TDM.CarregarIni;
var
  Config: TConfig;
begin
  Config := TConfig.Create;
  try
    Config.Carregar();
    Conexao.Params.Values['HostName'] := Config.HostName;
    Conexao.Params.Values['Port'] := Config.Porta.ToString;
    Self.FTema := Config.EstiloTelas;
  finally
    FreeAndNil(Config);
  end;
end;

procedure TDM.Commit;
var
  Transacao: TServerMethods1Client;
begin
  Transacao := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Transacao.Commit;
  finally
    FreeAndNil(Transacao);
  end;
end;

procedure TDM.Conectar();
var
  bErro: Boolean;
begin
  bErro := False;
  try
    if FOperacaoConcluida = false then
      Conexao.Connected := False;

    if not Conexao.Connected then
      Conexao.Connected := True;

    FOperacaoConcluida := False;
    //BuscarUsuario();
  except
    On E: Exception do
    begin
      Conexao.Connected := False;

      try
        Conexao.Connected := True;
      except
        bErro := True;
      end;
      if bErro then
        raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TDM.ConexaoBeforeConnect(Sender: TObject);
begin
  CarregarIni();
end;

procedure TDM.ConexaoBanco;
var
  bErro: Boolean;
begin

  bErro := False;
  try
    if not Conexao.Connected then
      Conexao.Connected := True;

    BuscarUsuario();
  except
    On E: Exception do
    begin
      Conexao.Connected := False;

      try
        Conexao.Connected := True;
      except
        bErro := True;
      end;
      if bErro then
        raise Exception.Create(E.Message);
    end;
  end;

end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  try
    if not Conexao.Connected then
      Conexao.Connected := True;

    FOperacaoConcluida := True;
  except
    On E: Exception do
    begin
      ShowMessage(E.Message);
      Application.Terminate;
    end;
  end;

  cdsUsuario.CreateDataSet;
  cdsUsuarioPermissao.CreateDataSet;
  cdsParametro.CreateDataSet;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if dm.Conexao.Connected then
    dm.Conexao.Connected := False;
end;

procedure TDM.Desconectar;
begin
  FOperacaoConcluida := True;
//  if dm.Conexao.Connected then
//    dm.Conexao.Connected := False;
end;

procedure TDM.ErroConexao(AErro: string);
begin
  if Pos('connection', LowerCase(AErro)) > 0 then
  begin
    FOperacaoConcluida := False;
    AErro := AErro + sLineBreak + sLineBreak + 'Houve um Erro de Conexão. ' + sLineBreak + 'Tente Novamente!!!';
  end;
  raise Exception.Create(AErro);
end;

function TDM.GetTema: string;
begin
  if FTema.Trim() = '' then
    Result := 'Metropolis UI Dark'
  else
    Result :=  FTema;
end;

procedure TDM.Roolback;
var
  Transacao: TServerMethods1Client;
begin
  Transacao := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Transacao.Roolback;
  finally
    FreeAndNil(Transacao);
  end;
end;

procedure TDM.SetTema(const Value: string);
begin
  FTema := Value;
end;

procedure TDM.StartTransacao;
var
  Transacao: TServerMethods1Client;
begin
  Transacao := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Transacao.StartTransacao;
  finally
    FreeAndNil(Transacao);
  end;
end;

end.
