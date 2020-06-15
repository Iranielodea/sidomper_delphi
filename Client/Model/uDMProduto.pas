unit uDMProduto;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, ppParameter, ppDesignLayer, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport;

type
  TDMProduto = class(TDMBase)
    CDSConsultaProd_Codigo: TIntegerField;
    CDSConsultaProd_Id: TAutoIncField;
    CDSConsultaProd_Nome: TWideStringField;
    CDSCadastroProd_Id: TAutoIncField;
    CDSCadastroProd_Ativo: TBooleanField;
    CDSCadastroProd_Codigo: TIntegerField;
    CDSCadastroProd_Nome: TWideStringField;
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
    CDSConsultaProd_Ativo: TBooleanField;
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
  DMProduto: TDMProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Vcl.RecError;

{$R *.dfm}

procedure TDMProduto.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroProd_Ativo.AsBoolean := True;
end;

procedure TDMProduto.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
//  raise Exception.Create(E.Message);
end;

procedure TDMProduto.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if CDSConsulta.State = dsInternalCalc then
  begin
    if CDSConsultaProd_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'Não';
  end;
end;

procedure TDMProduto.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
end;

end.
