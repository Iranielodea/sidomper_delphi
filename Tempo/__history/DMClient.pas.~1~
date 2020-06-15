unit DMClient;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit1, Data.DBXDataSnap,
  IPPeerClient, Data.DBXCommon, Data.DB, Data.SqlExpr;

type
  TClientModule1 = class(TDataModule)
    Conexao: TSQLConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethods1Client: TServerMethods1Client;
    FServerModule2Client: TServerModule2Client;
    function GetServerMethods1Client: TServerMethods1Client;
    function GetServerModule2Client: TServerModule2Client;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods1Client: TServerMethods1Client read GetServerMethods1Client write FServerMethods1Client;
    property ServerModule2Client: TServerModule2Client read GetServerModule2Client write FServerModule2Client;

end;

var
  ClientModule1: TClientModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TClientModule1.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule1.Destroy;
begin
  FServerMethods1Client.Free;
  FServerModule2Client.Free;
  inherited;
end;

function TClientModule1.GetServerMethods1Client: TServerMethods1Client;
begin
  if FServerMethods1Client = nil then
  begin
    SQLConnection1.Open;
    FServerMethods1Client:= TServerMethods1Client.Create(SQLConnection1.DBXConnection, FInstanceOwner);
  end;
  Result := FServerMethods1Client;
end;
function TClientModule1.GetServerModule2Client: TServerModule2Client;
begin
  if FServerModule2Client = nil then
  begin
    SQLConnection1.Open;
    FServerModule2Client:= TServerModule2Client.Create(SQLConnection1.DBXConnection, FInstanceOwner);
  end;
  Result := FServerModule2Client;
end;

end.
