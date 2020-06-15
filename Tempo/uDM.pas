unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXDataSnap, IPPeerClient,
  Data.DBXCommon, Data.DB, Data.SqlExpr, Datasnap.DBClient, Datasnap.DSConnect,
  Vcl.Forms, Vcl.Dialogs, uConfig;

type
  TDM = class(TDataModule)
    Conexao: TSQLConnection;
    DSPConexao: TDSProviderConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    procedure Configurar;
    procedure CarregarIni;
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.CarregarIni;
var
  Config: TConfig;
begin
  Config := TConfig.Create;
  try
    Config.Carregar();
    Conexao.Params.Values['HostName'] := Config.HostName;
    Conexao.Params.Values['Port'] := Config.Porta.ToString;
  finally
    FreeAndNil(Config);
  end;
end;

procedure TDM.ConexaoBeforeConnect(Sender: TObject);
begin
//  Configurar();
end;

procedure TDM.Configurar;
//var
//  Config: TConfig;
begin
  CarregarIni();
//    Conexao.Params.Values['HostName'] := '177.66.30.167';
    //Conexao.Params.Values['HostName'] := '192.168.0.2';
//    Conexao.Params.Values['HostName'] := 'PROG223';
//    Conexao.Params.Values['Port'] := '211';

//  if UpperCase(FHostName) = 'DOMPER' then
//      FHostName := '177.66.30.167';

//  Config := Config.create;
//  try
//    Config.Carregar();
//    Conexao.Params.Values['HostName'] := Config.HostName;
//    Conexao.Params.Values['Port'] := Config.Porta.ToString;
//  finally
//    FreeAndNil(Config);
//  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  try
    Configurar();
    if not Conexao.Connected then
      Conexao.Connected := True;

  except
    On E: Exception do
    begin
      raise Exception.Create(E.Message);
      Application.Terminate;
    end;
  end;

end;

end.
