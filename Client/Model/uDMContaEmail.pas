unit uDMContaEmail;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uRegras, uDM, ppParameter, ppDesignLayer, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, uFuncoesSIDomper;

type
  TDMContaEmail = class(TDMBase)
    CDSConsultaCtaEm_Id: TAutoIncField;
    CDSConsultaCtaEm_Codigo: TIntegerField;
    CDSConsultaCtaEm_Ativo: TBooleanField;
    CDSConsultaCtaEm_Nome: TStringField;
    CDSCadastroCtaEm_Id: TAutoIncField;
    CDSCadastroCtaEm_Codigo: TIntegerField;
    CDSCadastroCtaEm_Nome: TStringField;
    CDSCadastroCtaEm_Email: TStringField;
    CDSCadastroCtaEm_Senha: TStringField;
    CDSCadastroCtaEm_SMTP: TStringField;
    CDSCadastroCtaEm_Porta: TIntegerField;
    CDSCadastroCtaEm_Ativo: TBooleanField;
    CDSCadastroCtaEm_Autenticar: TBooleanField;
    CDSCadastroCtaEm_AutenticarSSL: TBooleanField;
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
    CDSConsultaCAtivo: TStringField;
    CDSConsultaCtaEm_Email: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMContaEmail: TDMContaEmail;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMContaEmail.CDSCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not (TFuncoes.ValidaEMail(CDSCadastroCtaEm_Email.AsString)) then
    raise Exception.Create('Email Inválido.');
end;

procedure TDMContaEmail.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroCtaEm_Ativo.AsBoolean := True;
  CDSCadastroCtaEm_Autenticar.AsBoolean := True;
  CDSCadastroCtaEm_AutenticarSSL.AsBoolean := True;
end;

procedure TDMContaEmail.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TDMContaEmail.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if CDSConsulta.State = dsInternalCalc then
  begin
    if CDSConsultaCtaEm_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'Não';
  end;
end;

procedure TDMContaEmail.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
end;

end.
