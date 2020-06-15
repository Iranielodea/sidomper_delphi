unit uDMTipo;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient,
  uRegras, uEnumerador, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppDesignLayer,
  ppParameter, System.Variants, ppModule, raCodMod;

type
  TDMTipo = class(TDataModule)
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
    CDSConsultaTip_Codigo: TIntegerField;
    CDSConsultaTip_Id: TAutoIncField;
    CDSConsultaTip_Nome: TWideStringField;
    CDSConsultaTip_Programa: TIntegerField;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    CDSCadastroTip_Id: TAutoIncField;
    CDSCadastroTip_Ativo: TBooleanField;
    CDSCadastroTip_Codigo: TIntegerField;
    CDSCadastroTip_Nome: TWideStringField;
    CDSCadastroTip_Programa: TIntegerField;
    CDSConsultaTipoDescricao: TStringField;
    CDSConsultaTip_Ativo: TBooleanField;
    CDSConsultaCAtivo: TStringField;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    CDSCadastroTip_Conceito: TStringField;
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSConsultaTip_ProgramaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMTipo: TDMTipo;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRevenda }

procedure TDMTipo.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  CDSCadastroTip_Ativo.AsBoolean := True;
  CDSCadastroTip_Programa.AsInteger := 1;
end;

procedure TDMTipo.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.Message);
end;


procedure TDMTipo.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  if CDSConsulta.State = dsInternalCalc then
  begin
    if CDSConsultaTip_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'N�o';
  end;
end;

procedure TDMTipo.CDSConsultaTip_ProgramaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (Sender.Value = null) then
    Exit;

  case Sender.Value of
    1: Text := '1-Chamado';
    2: Text := '2-Visita';
    3: Text := '3-Solicita��o';
    4: Text := '4-Vers�o';
    5: Text := '5-Qualidade';
    6: Text := '6-Base de Conhecimento';
    7: Text := '7-Atividade';
    8: Text := '8-Agendamento';
    9: Text := '9-Or�amento';
    91: Text := '91-Or�.N�o Aprovado';
    10: Text := '10-Recado';
    11: Text := '11-Tabela de Pre�o';
  end;
end;

procedure TDMTipo.DataModuleCreate(Sender: TObject);
begin
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
end;

end.
