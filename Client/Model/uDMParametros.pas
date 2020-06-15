unit uDMParametros;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient,
  uRegras, uEnumerador, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppDesignLayer,
  ppParameter;

type
  TDMParametros = class(TDataModule)
    CDSConsulta: TClientDataSet;
    CDSCadastro: TClientDataSet;
    dbConsulta: TppDBPipeline;
    Rel: TppReport;
    DSConsulta: TDataSource;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    CDSConsultaPar_Id: TAutoIncField;
    CDSConsultaPar_Codigo: TIntegerField;
    CDSConsultaPar_programa: TIntegerField;
    CDSConsultaPar_Nome: TStringField;
    CDSCadastroPar_Id: TAutoIncField;
    CDSCadastroPar_Codigo: TIntegerField;
    CDSCadastroPar_programa: TIntegerField;
    CDSCadastroPar_Nome: TStringField;
    CDSCadastroPar_Valor: TStringField;
    CDSCadastroPar_Obs: TStringField;
    CDSParametrosTitulosChamados: TClientDataSet;
    CDSParametrosTitulosChamadosPar_Codigo: TIntegerField;
    CDSParametrosTitulosChamadosSta_Codigo: TIntegerField;
    CDSParametrosTitulosChamadosSta_Nome: TWideStringField;
    CDSConsultaPar_Valor: TStringField;
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
  DMParametros: TDMParametros;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRevenda }

procedure TDMParametros.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.Message);
end;

procedure TDMParametros.DataModuleCreate(Sender: TObject);
begin
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
  CDSParametrosTitulosChamados.RemoteServer := DM.DSPConexao;
end;

end.
