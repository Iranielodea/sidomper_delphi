unit uDMCidade;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, Vcl.RecError, ppParameter, ppDesignLayer,
  ppCtrls, ppBands, ppStrtch, ppRichTx, ppVar, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport;

type
  TDMCidade = class(TDMBase)
    CDSCadastroCid_Id: TAutoIncField;
    CDSCadastroCid_Codigo: TIntegerField;
    CDSCadastroCid_Nome: TStringField;
    CDSCadastroCid_UF: TStringField;
    CDSConsultaCid_Id: TAutoIncField;
    CDSConsultaCid_Codigo: TIntegerField;
    CDSConsultaCid_Nome: TStringField;
    CDSConsultaCid_UF: TStringField;
    CDSConsultaCid_Ativo: TBooleanField;
    CDSCadastroCid_Ativo: TBooleanField;
    Rel: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel5: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText3: TppDBText;
    ppDBRichText1: TppDBRichText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCidade: TDMCidade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMCidade.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroCid_Ativo.AsBoolean := True;
end;

procedure TDMCidade.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  Action := HandleReconcileError(DataSet, UpdateKind, E);
end;

procedure TDMCidade.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao2;
  CDSConsulta.RemoteServer := DM.DSPConexao2;
end;

end.
