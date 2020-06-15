unit uDMModulo;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, ppParameter, ppDesignLayer, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport;

type
  TDMModulo = class(TDMBase)
    CDSCadastroMod_Id: TAutoIncField;
    CDSCadastroMod_Ativo: TBooleanField;
    CDSCadastroMod_Codigo: TIntegerField;
    CDSCadastroMod_Nome: TWideStringField;
    CDSConsultaMod_Codigo: TIntegerField;
    CDSConsultaMod_Id: TAutoIncField;
    CDSConsultaMod_Nome: TWideStringField;
    Rel: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    CDSConsultaMod_Ativo: TBooleanField;
    CDSConsultaCAtivo: TStringField;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMModulo: TDMModulo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMModulo.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroMod_Ativo.AsBoolean := True;
end;

procedure TDMModulo.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TDMModulo.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if CDSConsulta.State = dsInternalCalc then
  begin
    if CDSConsultaMod_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'Não';
  end;
end;

procedure TDMModulo.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
end;

end.
