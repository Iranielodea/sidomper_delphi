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
    procedure ConexaoAfterDisconnect(Sender: TObject);
  private
//    FInstanceOwner: Boolean;
//    FServerMethods1Client: TServerMethods1Client;
//    function GetServerMethods1Client: TServerMethods1Client;

    { Private declarations }
    procedure Configurar;
    procedure CarregarIni;
   // function GetServerMethods1Client: TServerMethods1Client;
  public
    { Public declarations }
    procedure LimpaAtributos;
    procedure CriaAtributos;
    procedure Desconectar;
    procedure Conectar;
    procedure reConectar;
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

procedure TDM.Conectar;
begin
  try
    if Conexao.Connected then
      Conexao.Connected := False;
    Conexao.Connected := True;

  except
    On E: Exception do
    begin
      raise Exception.Create(E.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TDM.reConectar;
begin
  try

    if Conexao.Connected then
      Conexao.Connected := false;

    Conexao.Connected := True;

  except
    On E: Exception do
    begin
      raise Exception.Create(E.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TDM.ConexaoAfterDisconnect(Sender: TObject);
begin
  Desconectar;
//    FServerMethods1Client.Free;
end;

procedure TDM.ConexaoBeforeConnect(Sender: TObject);
begin
  CriaAtributos;
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

procedure TDM.CriaAtributos;
begin
  try

    Configurar();
    

  except
    On E: Exception do
    begin
      raise Exception.Create(E.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Conectar;
end;

procedure TDM.Desconectar;
begin
  Conexao.Connected := false;
end;

//function TDM.GetServerMethods1Client: TServerMethods1Client;
//begin
////  if FServerMethods1Client = nil then
////  begin
////    Conexao.Open;
////    FServerMethods1Client:= TServerMethods1Client.Create(Conexao.DBXConnection, FInstanceOwner);
////  end;
////  Result := FServerMethods1Client;
//end;

procedure TDM.LimpaAtributos;
begin
//    FreeAndNil(FServerMethods1Client);
end;

end.
