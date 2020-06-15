unit uDMRevenda;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient,
  uRegras, uEnumerador, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppDesignLayer,
  ppParameter, uFuncoesSIDomper;

type
  TDMRevenda = class(TDataModule)
    CDSConsulta: TClientDataSet;
    CDSConsultaRev_Codigo: TIntegerField;
    CDSConsultaRev_Id: TAutoIncField;
    CDSConsultaRev_Nome: TWideStringField;
    CDSCadastro: TClientDataSet;
    CDSCadastroRev_Id: TAutoIncField;
    CDSCadastroRev_Ativo: TBooleanField;
    CDSCadastroRev_Codigo: TIntegerField;
    CDSCadastroRev_Nome: TWideStringField;
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
    CDSConsultaRev_Ativo: TBooleanField;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    CDSConsultaCAtivo: TStringField;
    CDSEmail: TClientDataSet;
    CDSEmailRevEm_Id: TAutoIncField;
    CDSEmailRevEm_Revenda: TIntegerField;
    CDSEmailRevEm_Email: TStringField;
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure CDSEmailBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FIdEmail: Integer;
  public
    { Public declarations }
  end;

var
  DMRevenda: TDMRevenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRevenda }

procedure TDMRevenda.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  CDSCadastroRev_Ativo.AsBoolean := True;
end;

procedure TDMRevenda.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.Message);
end;


procedure TDMRevenda.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  if CDSConsulta.State = dsInternalCalc then
  begin
    if CDSConsultaRev_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'Não';
  end;
end;

procedure TDMRevenda.CDSEmailBeforePost(DataSet: TDataSet);
begin
  if Trim(CDSEmailRevEm_Email.AsString) = '' then
    raise Exception.Create('Informe o Email!');

  if not (TFuncoes.ValidaEMail(CDSEmailRevEm_Email.AsString)) then
    raise Exception.Create('Email Inválido!');

  if CDSEmail.State = dsInsert then
  begin
    CDSEmailRevEm_Id.AsInteger := FIdEmail;
    CDSEmailRevEm_Revenda.AsInteger := 1;
    Dec(FIdEmail);
  end;

end;

procedure TDMRevenda.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao;
  end;
  FIdEmail := -1;
end;

end.
