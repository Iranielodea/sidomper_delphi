unit uDMEscala;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient,
  uRegras, uEnumerador, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppDesignLayer,
  ppParameter;

type
  TDMEscala = class(TDataModule)
    CDSConsulta: TClientDataSet;
    CDSCadastro: TClientDataSet;
    dbConsulta: TppDBPipeline;
    DSConsulta: TDataSource;
    CDSConsultaEsc_Id: TAutoIncField;
    CDSConsultaEsc_Data: TDateField;
    CDSConsultaEsc_Usuario: TIntegerField;
    CDSConsultaEsc_HoraInicio: TTimeField;
    CDSConsultaEsc_HoraFim: TTimeField;
    CDSConsultaUsu_Codigo: TIntegerField;
    CDSConsultaUsu_Nome: TWideStringField;
    CDSCadastroEsc_Id: TAutoIncField;
    CDSCadastroEsc_Data: TDateField;
    CDSCadastroEsc_Usuario: TIntegerField;
    CDSCadastroEsc_HoraInicio: TTimeField;
    CDSCadastroEsc_HoraFim: TTimeField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSCadastroUsu_Nome: TWideStringField;
    CDSConsultaCalc_DataExtenso: TStringField;
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FIdEmail: Integer;
  public
    { Public declarations }
  end;

var
  DMEscala: TDMEscala;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRevenda }

procedure TDMEscala.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  CDSCadastroEsc_Data.AsDateTime := Date;
end;

procedure TDMEscala.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.Message);
end;


procedure TDMEscala.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  if CDSConsulta.State = dsInternalCalc then
    CDSConsultaCalc_DataExtenso.AsString := FormatDateTime('dddd', CDSConsultaEsc_Data.AsDateTime);
end;

procedure TDMEscala.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao2;
  end;
end;

end.
