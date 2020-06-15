unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect, uConfig, MidasLib;

type
  TDM = class(TDataModule)
    Conexao: TSQLConnection;
    DSPConexao: TDSProviderConnection;
    ConexaoMSS: TSQLConnection;
    DSPConexaoMSS: TDSProviderConnection;
    cdsItens: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarIni();
    procedure CarregarIniMSS();
  public
    { Public declarations }
    procedure AbrirConexao();
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.AbrirConexao;
begin
  try
    if Conexao.Connected = False then
      Conexao.Open;
  except
    On E: Exception do
    begin
      raise Exception.Create('Conex�o Firebird: ' + E.Message);
    end;
  end;

  try
    if ConexaoMSS.Connected = False then
      ConexaoMSS.Open;
  except
    On E: Exception do
    begin
      raise Exception.Create('Conex�o SQL SERVER: ' + E.Message);
    end;
  end;

//  if Conexao.Connected = False then
//    Conexao.Connected := True;
end;

procedure TDM.CarregarIni();
var
  Config: TConfig;
begin

  Config := TConfig.create(banFB);
  try
    Config.Carregar();
    Conexao.Params.Values['HostName'] := Config.HostName;
    Conexao.Params.Values['Port'] := Config.Porta.ToString;
  finally
    FreeAndNil(Config);
  end;
  // 186.202.139.88 ipi da localWeb
end;

procedure TDM.CarregarIniMSS;
var
  Config: TConfig;
begin
  Config := TConfig.create(banMSS);
  try
    Config.Carregar();
    ConexaoMSS.Params.Values['HostName'] := Config.HostName;
    ConexaoMSS.Params.Values['Port'] := Config.Porta.ToString;
  finally
    FreeAndNil(Config);
  end;
  // 186.202.139.88 ipi da localWeb
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  cdsItens.RemoteServer := DSPConexao;
  if Conexao.Connected then
    Conexao.Connected := False;

  if ConexaoMSS.Connected then
    ConexaoMSS.Connected := False;

  CarregarIni();
  CarregarIniMSS();

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if Conexao.Connected then
    Conexao.Connected := False;

  if ConexaoMSS.Connected then
    ConexaoMSS.Connected := False;
end;

end.