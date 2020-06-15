unit uDMStatus;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient,
  uRegras, uEnumerador, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppDesignLayer,
  ppParameter, System.Variants, ppModule, raCodMod;

type
  TDMStatus = class(TDataModule)
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
    CDSConsultaSta_Codigo: TIntegerField;
    CDSConsultaSta_Id: TAutoIncField;
    CDSConsultaSta_Nome: TWideStringField;
    CDSConsultaSta_Programa: TIntegerField;
    CDSConsultaStatusDescricao: TStringField;
    CDSCadastroSta_Id: TAutoIncField;
    CDSCadastroSta_Ativo: TBooleanField;
    CDSCadastroSta_Codigo: TIntegerField;
    CDSCadastroSta_Nome: TWideStringField;
    CDSCadastroSta_Programa: TIntegerField;
    CDSConsultaSta_Ativo: TBooleanField;
    CDSConsultaCAtivo: TStringField;
    ppLabel6: TppLabel;
    ppDBText4: TppDBText;
    CDSConsultaCNotificar_Cliente: TBooleanField;
    CDSConsultaCNotificar_Supervisor: TBooleanField;
    CDSConsultaSta_NotificarCliente: TBooleanField;
    CDSConsultaSta_NotificarSupervisor: TBooleanField;
    CDSCadastroSta_NotificarCliente: TBooleanField;
    CDSCadastroSta_NotificarSupervisor: TBooleanField;
    CDSConsultaSta_NotificarConsultor: TBooleanField;
    CDSConsultaSta_NotificarRevenda: TBooleanField;
    CDSCadastroSta_NotificarConsultor: TBooleanField;
    CDSCadastroSta_NotificarRevenda: TBooleanField;
    CDSConsultaCNotificar_Consultor: TBooleanField;
    CDSConsultaCNotificar_Revenda: TBooleanField;
    CDSCadastroSta_Conceito: TStringField;
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSConsultaSta_ProgramaGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMStatus: TDMStatus;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMRevenda }

procedure TDMStatus.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  CDSCadastroSta_Ativo.AsBoolean := True;
  CDSCadastroSta_Programa.AsInteger := 1;
  CDSCadastroSta_NotificarCliente.AsBoolean := False;
  CDSCadastroSta_NotificarSupervisor.AsBoolean := False;
  CDSCadastroSta_NotificarConsultor.AsBoolean := False;
  CDSCadastroSta_NotificarRevenda.AsBoolean := False;
end;

procedure TDMStatus.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.Message);
end;


procedure TDMStatus.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  if CDSConsulta.State = dsInternalCalc then
  begin
    if CDSConsultaSta_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'Não';

//    CDSConsultaCNotificar_Cliente.AsBoolean     := CDSConsultaSta_NotificarCliente.AsBoolean;
//    CDSConsultaCNotificar_Supervisor.AsBoolean  := CDSConsultaSta_NotificarSupervisor.AsBoolean;
//    CDSConsultaCNotificar_Consultor.AsBoolean   := CDSConsultaSta_NotificarConsultor.AsBoolean;
//    CDSConsultaCNotificar_Revenda.AsBoolean     := CDSConsultaSta_NotificarRevenda.AsBoolean;
  end;
end;

procedure TDMStatus.CDSConsultaSta_ProgramaGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (Sender.Value = null) then
    Exit;

  case Sender.Value of
    1: Text := '1-Chamado';
    2: Text := '2-Visita';
    3: Text := '3-Solicitação';
    4: Text := '4-Versão';
    5: Text := '5-Qualidade';
    6: Text := '6-Base de Conhecimento';
    7: Text := '7-Atividade';
    8: Text := '8-Agendamento';
    10: Text := '10-Recado';
    11: Text := '11-Tabela de Preço';
  end;
end;

procedure TDMStatus.DataModuleCreate(Sender: TObject);
begin
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
end;

end.
