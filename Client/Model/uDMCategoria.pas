unit uDMCategoria;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, ppProd, ppClass, ppReport, ppParameter,
  ppDesignLayer, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache;

type
  TDMCategoria = class(TDMBase)
    CDSConsultaCat_Id: TAutoIncField;
    CDSConsultaCat_Codigo: TIntegerField;
    CDSConsultaCat_Nome: TStringField;
    CDSCadastroCat_Id: TAutoIncField;
    CDSCadastroCat_Codigo: TIntegerField;
    CDSCadastroCat_Nome: TStringField;
    CDSCadastroCat_Ativo: TBooleanField;
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
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    CDSConsultaCat_Ativo: TBooleanField;
    CDSConsultaCAtivo: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMCategoria: TDMCategoria;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMCategoria.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroCat_Ativo.AsBoolean := True;
end;

procedure TDMCategoria.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if CDSConsulta.State = dsInternalCalc then
  begin
    if CDSConsultaCat_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'N�o';
  end;

end;

procedure TDMCategoria.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao2;
  CDSConsulta.RemoteServer := DM.DSPConexao2;
end;

end.
