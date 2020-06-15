unit uDMVersao;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient,
  uRegras, uEnumerador, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppDesignLayer,
  ppParameter;

type
  TDMVersao = class(TDataModule)
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
    CDSConsultaVer_DataInicio: TDateField;
    CDSConsultaVer_DataLiberacao: TDateField;
    CDSConsultaVer_Descricao: TStringField;
    CDSConsultaVer_Id: TAutoIncField;
    CDSConsultaSta_Nome: TWideStringField;
    CDSConsultaTip_Nome: TWideStringField;
    CDSCadastroVer_Id: TAutoIncField;
    CDSCadastroVer_DataInicio: TDateField;
    CDSCadastroVer_DataLiberacao: TDateField;
    CDSCadastroVer_Descricao: TStringField;
    CDSCadastroVer_Status: TIntegerField;
    CDSCadastroVer_Tipo: TIntegerField;
    CDSCadastroVer_Usuario: TIntegerField;
    CDSCadastroSta_Codigo: TIntegerField;
    CDSCadastroSta_Nome: TWideStringField;
    CDSCadastroTip_Codigo: TIntegerField;
    CDSCadastroTip_Nome: TWideStringField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSConsultaUsu_Nome: TWideStringField;
    CDSCadastroUsu_Nome: TWideStringField;
    CDSCadastroVer_Versao: TStringField;
    CDSConsultaVer_Versao: TStringField;
    CDSCadastroVer_Produto: TIntegerField;
    CDSCadastroProd_Codigo: TIntegerField;
    CDSCadastroProd_Nome: TWideStringField;
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSCadastroVer_DataInicioSetText(Sender: TField; const Text: string);
    procedure CDSCadastroVer_DataLiberacaoSetText(Sender: TField; const Text:
        string);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVersao: TDMVersao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesSIDomper;

{$R *.dfm}

{ TDMRevenda }

procedure TDMVersao.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.Message);
end;

procedure TDMVersao.CDSCadastroVer_DataInicioSetText(Sender: TField; const
    Text: string);
begin
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMVersao.CDSCadastroVer_DataLiberacaoSetText(Sender: TField; const
    Text: string);
begin
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMVersao.DataModuleCreate(Sender: TObject);
begin
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
end;

end.
