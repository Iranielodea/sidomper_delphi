//
// Created by the DataSnap proxy generator.
// 14/03/2019 09:38:56
//

unit uRegras;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FFBLicencasListarCommand: TDBXCommand;
    FFBLicencasListarItensCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    function FBLicencasListar(AUtilizada: Boolean): TJSONValue;
    function FBLicencasListarItens(AUtilizada: Boolean): TJSONValue;
  end;

implementation

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.FBLicencasListar(AUtilizada: Boolean): TJSONValue;
begin
  if FFBLicencasListarCommand = nil then
  begin
    FFBLicencasListarCommand := FDBXConnection.CreateCommand;
    FFBLicencasListarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFBLicencasListarCommand.Text := 'TServerMethods1.FBLicencasListar';
    FFBLicencasListarCommand.Prepare;
  end;
  FFBLicencasListarCommand.Parameters[0].Value.SetBoolean(AUtilizada);
  FFBLicencasListarCommand.ExecuteUpdate;
  Result := TJSONValue(FFBLicencasListarCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.FBLicencasListarItens(AUtilizada: Boolean): TJSONValue;
begin
  if FFBLicencasListarItensCommand = nil then
  begin
    FFBLicencasListarItensCommand := FDBXConnection.CreateCommand;
    FFBLicencasListarItensCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFBLicencasListarItensCommand.Text := 'TServerMethods1.FBLicencasListarItens';
    FFBLicencasListarItensCommand.Prepare;
  end;
  FFBLicencasListarItensCommand.Parameters[0].Value.SetBoolean(AUtilizada);
  FFBLicencasListarItensCommand.ExecuteUpdate;
  Result := TJSONValue(FFBLicencasListarItensCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FFBLicencasListarCommand.DisposeOf;
  FFBLicencasListarItensCommand.DisposeOf;
  inherited;
end;

end.

