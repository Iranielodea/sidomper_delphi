unit uDMMSS;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, FireDAC.Comp.UI, Data.DB,
  FireDAC.Comp.Client, uConfig, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDMMSS = class(TDataModule)
    Conexao: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    Qry: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarIni();
  public
    { Public declarations }
  end;

var
  DMMSS: TDMMSS;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMMSS }

procedure TDMMSS.CarregarIni;
var
  Config: TConfig;
begin
  Config := TConfig.Create(tpBanco.banMSS);
  try
    Config.Carregar();
    Conexao.Params.Values['HostName']   := Config.HostName;
    Conexao.Params.Values['Port']       := Config.Porta.ToString;
    Conexao.Params.Values['DataBase']   := Config.DataBase;
    Conexao.Params.Values['Server']     := Config.Servidor;
    Conexao.Params.Values['User_Name']  := Config.User_Name;
    Conexao.Params.Values['Password']   := Config.Password;
  finally
    FreeAndNil(Config);
  end;
end;

procedure TDMMSS.DataModuleCreate(Sender: TObject);
begin
  CarregarIni();
end;

end.
