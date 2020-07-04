unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, uConfig, MidasLib;

type
  TDM = class(TDataModule)
    Conexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ConexaoBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarIni;
  public
    { Public declarations }
    procedure ExecutarSQL(InstrucaoSQL: string);

    procedure StartTransacao;
    procedure Commit;
    procedure Roolback;
    procedure AbrirConexao;
    procedure FecharConexao;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.AbrirConexao;
begin
  Exit;
  if Conexao.Connected = False then
    Conexao.Connected := True;
end;

procedure TDM.CarregarIni;
var
  Config: TConfig;
begin
  Config := TConfig.Create;
  try
    Config.Carregar();
    Conexao.Params.Values['DataBase']   := Config.DataBase;
    Conexao.Params.Values['Server']     := Config.Servidor;
    Conexao.Params.Values['User_Name']  := Config.User_Name;
    Conexao.Params.Values['Password']   := Config.Password;
  finally
    FreeAndNil(Config);
  end;
end;

procedure TDM.Commit;
begin
  if Conexao.InTransaction then
    Conexao.Commit;
end;

procedure TDM.ConexaoBeforeConnect(Sender: TObject);
begin
  CarregarIni();
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Conexao.Connected := False;
  CarregarIni();
  Conexao.Connected := True;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  Conexao.Close;
end;

procedure TDM.ExecutarSQL(InstrucaoSQL: string);
begin
  dm.Conexao.ExecSQL(InstrucaoSQL);
end;

procedure TDM.FecharConexao;
begin
  Exit;
  if Conexao.Connected then
    Conexao.Connected := False;
end;

procedure TDM.Roolback;
begin
  if Conexao.InTransaction then
    Conexao.Rollback;
end;

procedure TDM.StartTransacao;
begin
  if not Conexao.InTransaction then
    Conexao.StartTransaction;
end;

end.
