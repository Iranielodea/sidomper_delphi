unit uDMRamal;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, ppParameter, ppDesignLayer, ppCtrls, ppBands,
  ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport;

type
  TdmRamal = class(TDMBase)
    CDSCadastroRam_Id: TAutoIncField;
    CDSCadastroRam_Departamento: TStringField;
    CDSConsultaRam_Id: TAutoIncField;
    CDSConsultaRam_Departamento: TStringField;
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
    CDSItens: TClientDataSet;
    CDSItensRamIt_Id: TAutoIncField;
    CDSItensRamIt_Nome: TStringField;
    CDSItensRamIt_Numero: TIntegerField;
    CDSItensRamIt_Ramal: TIntegerField;
    CDSImpressao: TClientDataSet;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel6: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    CDSImpressaoRam_Id: TAutoIncField;
    CDSImpressaoRam_Departamento: TStringField;
    CDSImpressaoRamIt_Numero: TIntegerField;
    CDSImpressaoRamIt_Nome: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSItensBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FIdItens: Integer;
  public
    { Public declarations }
  end;

var
  dmRamal: TdmRamal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmRamal.CDSItensBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CDSItens.State = dsInsert then
  begin
    CDSItensRamIt_Id.AsInteger := FIdItens;
    CDSItensRamIt_Ramal.AsInteger := -1;
    Dec(FIdItens);
  end;
end;

procedure TdmRamal.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao2;
  end;
  FIdItens := -1;
end;

end.
