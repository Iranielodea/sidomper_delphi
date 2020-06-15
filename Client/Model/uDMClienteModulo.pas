unit uDMClienteModulo;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM;

type
  TDMClienteModulo = class(TDMBase)
    CDSConsultaCliMod_Id: TAutoIncField;
    CDSConsultaCliMod_Cliente: TIntegerField;
    CDSConsultaCliMod_Modulo: TIntegerField;
    CDSConsultaCliMod_Produto: TIntegerField;
    CDSConsultaMod_Codigo: TIntegerField;
    CDSConsultaMod_Nome: TWideStringField;
    CDSConsultaProd_Codigo: TIntegerField;
    CDSConsultaProd_Nome: TWideStringField;
    CDSCadastroCliMod_Id: TAutoIncField;
    CDSCadastroCliMod_Cliente: TIntegerField;
    CDSCadastroCliMod_Modulo: TIntegerField;
    CDSCadastroCliMod_Produto: TIntegerField;
    CDSCadastroProd_Codigo: TIntegerField;
    CDSCadastroProd_Nome: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSConsultaNewRecord(DataSet: TDataSet);
    procedure CDSConsultaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSConsultaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FContadorId: Integer;
  public
    { Public declarations }
  end;

var
  DMClienteModulo: TDMClienteModulo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMClienteModulo.CDSCadastroReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TDMClienteModulo.CDSConsultaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CDSConsultaCliMod_Modulo.AsInteger = 0 then
    raise Exception.Create('Informe o Módulo.');
end;

procedure TDMClienteModulo.CDSConsultaNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSConsultaCliMod_Cliente.AsInteger := 1;
  CDSConsultaCliMod_Id.AsInteger := FContadorId;
  dec(FContadorId);
end;

procedure TDMClienteModulo.CDSConsultaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(e.Message);
end;

procedure TDMClienteModulo.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
  FContadorId := -1;
end;

end.
