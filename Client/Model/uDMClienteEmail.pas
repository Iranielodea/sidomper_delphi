unit uDMClienteEmail;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, uFuncoesSIDomper;

type
  TDMClienteEmail = class(TDMBase)
    CDSCadastroCliEm_Id: TAutoIncField;
    CDSCadastroCliEm_Cliente: TIntegerField;
    CDSCadastroCliEm_Email: TWideStringField;
    CDSCadastroCliEm_Notificar: TBooleanField;
    CDSConsultaCNotificar: TBooleanField;
    CDSConsultaCliEm_Id: TAutoIncField;
    CDSConsultaCliEm_Cliente: TIntegerField;
    CDSConsultaCliEm_Email: TWideStringField;
    CDSConsultaCliEm_Notificar: TBooleanField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSConsultaNewRecord(DataSet: TDataSet);
    procedure CDSConsultaReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSConsultaBeforePost(DataSet: TDataSet);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FContadorId: Integer;
    FIdEmail: Integer;
  public
    { Public declarations }
  end;

var
  DMClienteEmail: TDMClienteEmail;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMClienteEmail.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroCliEm_Notificar.AsBoolean := True;
  CDSCadastroCliEm_Cliente.AsInteger := 1;
  CDSCadastroCliEm_Id.AsInteger := FContadorId;
  Inc(FContadorId);
end;

procedure TDMClienteEmail.CDSCadastroReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TDMClienteEmail.CDSConsultaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if Trim(CDSConsultaCliEm_Email.AsString) = '' then
    raise Exception.Create('Informe o Email.');

  if not TFuncoes.ValidaEMail(CDSConsultaCliEm_Email.AsString) then
    raise Exception.Create('Email Inválido!');

  if CDSConsulta.State = dsInsert then
  begin
    CDSConsultaCliEm_Id.AsInteger := FIdEmail;
    Dec(FIdEmail);
  end;

end;

procedure TDMClienteEmail.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if CDSConsulta.State = dsInternalCalc then
    CDSConsultacNotificar.AsBoolean := CDSConsultaCliEm_Notificar.AsBoolean;
end;

procedure TDMClienteEmail.CDSConsultaNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSConsultaCliEm_Notificar.AsBoolean := True;
  CDSConsultaCliEm_Cliente.AsInteger := 1;
//  CDSConsultaCliEm_Id.AsInteger := FContadorId;
//  dec(FContadorId);
end;

procedure TDMClienteEmail.CDSConsultaReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(e.Message);
end;

procedure TDMClienteEmail.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
  FContadorId := -1;
  FIdEmail := -1;
end;

end.
