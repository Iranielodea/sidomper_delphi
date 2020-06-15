unit uDMUtilitario;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient;

type
  TDMUtilitario = class(TDataModule)
    CDSListarTabelas: TClientDataSet;
    CDSListarTabelasTabelas: TWideStringField;
    CDSListarCampos: TClientDataSet;
    CDSListarCamposCOLUNA: TWideStringField;
    CDSInstrucaoSQL: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMUtilitario: TDMUtilitario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMUtilitario.DataModuleCreate(Sender: TObject);
begin
  CDSListarTabelas.RemoteServer := DM.DSPConexao;
  CDSListarCampos.RemoteServer := DM.DSPConexao;
  CDSInstrucaoSQL.RemoteServer := DM.DSPConexao;
end;

end.
