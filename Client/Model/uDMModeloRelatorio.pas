unit uDMModeloRelatorio;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, ppParameter, ppDesignLayer, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport;

type
  TDMModeloRelatorio = class(TDMBase)
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
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    CDSConsultaModR_Id: TAutoIncField;
    CDSConsultaModR_Codigo: TIntegerField;
    CDSConsultaModR_Descricao: TStringField;
    CDSConsultaModR_Arquivo: TStringField;
    CDSCadastroModR_Id: TAutoIncField;
    CDSCadastroModR_Codigo: TIntegerField;
    CDSCadastroModR_Descricao: TStringField;
    CDSCadastroModR_Arquivo: TStringField;
    CDSCadastroModR_Revenda: TIntegerField;
    CDSCadastroRev_Codigo: TIntegerField;
    CDSCadastroRev_Nome: TWideStringField;
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMModeloRelatorio: TDMModeloRelatorio;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Vcl.RecError;

{$R *.dfm}

procedure TDMModeloRelatorio.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
//  raise Exception.Create(E.Message);
end;

procedure TDMModeloRelatorio.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao2;
  CDSConsulta.RemoteServer := DM.DSPConexao2;
end;

end.
