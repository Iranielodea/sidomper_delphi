unit uDMFeriado;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM;

type
  TDMFeriado = class(TDMBase)
    CDSCadastroFer_Id: TAutoIncField;
    CDSCadastroFer_Data: TDateField;
    CDSCadastroFer_Descricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMFeriado: TDMFeriado;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMFeriado.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(e.Message);
end;

procedure TDMFeriado.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao2;
  CDSConsulta.RemoteServer := DM.DSPConexao2;
end;

end.
