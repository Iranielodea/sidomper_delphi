unit uDMFormaPagto;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, ppParameter, ppDesignLayer, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppStrtch, ppRichTx;

type
  TDMFormaPagto = class(TDMBase)
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
    CDSConsultaCAtivo: TStringField;
    CDSConsultaFpg_Id: TAutoIncField;
    CDSConsultaFpg_Ativo: TBooleanField;
    CDSConsultaFpg_Codigo: TIntegerField;
    CDSConsultaFpg_Nome: TStringField;
    CDSCadastroFpg_Ativo: TBooleanField;
    CDSCadastroFpg_Codigo: TIntegerField;
    CDSCadastroFpg_Id: TAutoIncField;
    CDSCadastroFpg_Nome: TStringField;
    ppDBText2: TppDBText;
    CDSItens: TClientDataSet;
    CDSItensFpgIte_Id: TAutoIncField;
    CDSItensFpgIte_Dias: TIntegerField;
    CDSItensFpgIte_Obs: TStringField;
    CDSItensFpgIte_FormaPagto: TIntegerField;
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure CDSItensBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FIdItem: Integer;
  public
    { Public declarations }
  end;

var
  DMFormaPagto: TDMFormaPagto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Vcl.RecError;

{$R *.dfm}

procedure TDMFormaPagto.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroFpg_Ativo.AsBoolean := True;
end;

procedure TDMFormaPagto.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
//  raise Exception.Create(E.Message);
end;

procedure TDMFormaPagto.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if CDSConsulta.State = dsInternalCalc then
  begin
    if CDSConsultaFpg_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'Não';
  end;
end;

procedure TDMFormaPagto.CDSItensBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CDSItens.State = dsInsert then
  begin
    CDSItensFpgIte_Id.AsInteger := FIdItem;
    CDSItensFpgIte_FormaPagto.AsInteger := 0;
    Dec(FIdItem);
  end;
end;

procedure TDMFormaPagto.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao2;
  CDSConsulta.RemoteServer := DM.DSPConexao2;
  FIdItem := -1;
end;

end.
