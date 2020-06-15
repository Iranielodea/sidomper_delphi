unit uDMObservacao;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, ppParameter, ppDesignLayer, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppStrtch, ppRichTx;

type
  TDMObservacao = class(TDMBase)
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
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    CDSConsultaObs_Ativo: TBooleanField;
    CDSConsultaObs_Codigo: TIntegerField;
    CDSConsultaObs_Descricao: TMemoField;
    CDSConsultaObs_Id: TAutoIncField;
    CDSConsultaCAtivo: TStringField;
    CDSCadastroObs_Ativo: TBooleanField;
    CDSCadastroObs_Codigo: TIntegerField;
    CDSCadastroObs_Descricao: TMemoField;
    CDSCadastroObs_Id: TAutoIncField;
    ppDBRichText1: TppDBRichText;
    CDSConsultaObs_Nome: TStringField;
    CDSConsultaObs_Programa: TIntegerField;
    CDSCadastroObs_Nome: TStringField;
    CDSCadastroObs_Padrao: TBooleanField;
    CDSCadastroObs_Programa: TIntegerField;
    CDSCadastroObs_ObsEmail: TStringField;
    CDSCadastroObs_EmailPadrao: TBooleanField;
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
  DMObservacao: TDMObservacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Vcl.RecError;

{$R *.dfm}

procedure TDMObservacao.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroObs_Ativo.AsBoolean := True;
  CDSCadastroObs_Padrao.AsBoolean := False;
  CDSCadastroObs_Programa.AsInteger := 1;
end;

procedure TDMObservacao.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
//  raise Exception.Create(E.Message);
end;

procedure TDMObservacao.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if CDSConsulta.State = dsInternalCalc then
  begin
    if CDSConsultaObs_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'Não';
  end;
end;

procedure TDMObservacao.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao2;
  CDSConsulta.RemoteServer := DM.DSPConexao2;
end;

end.
