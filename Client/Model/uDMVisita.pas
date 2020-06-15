unit uDMVisita;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM;

type
  TDMVisita = class(TDMBase)
    CDSConsultaVis_Id: TAutoIncField;
    CDSConsultaVis_Dcto: TStringField;
    CDSConsultaVis_Data: TDateField;
    CDSConsultaCli_Codigo: TIntegerField;
    CDSConsultaCli_Nome: TWideStringField;
    CDSConsultaUsu_Codigo: TIntegerField;
    CDSCadastroVis_Id: TAutoIncField;
    CDSCadastroVis_Dcto: TStringField;
    CDSCadastroVis_Data: TDateField;
    CDSCadastroVis_HoraInicio: TTimeField;
    CDSCadastroVis_HoraFim: TTimeField;
    CDSCadastroVis_Cliente: TIntegerField;
    CDSCadastroVis_Usuario: TIntegerField;
    CDSCadastroVis_Contato: TStringField;
    CDSCadastroVis_Tipo: TIntegerField;
    CDSCadastroVis_Status: TIntegerField;
    CDSCadastroVis_Descricao: TStringField;
    CDSCadastroVis_Anexo: TStringField;
    CDSCadastroCli_Codigo: TIntegerField;
    CDSCadastroCli_Nome: TWideStringField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSCadastroTip_Codigo: TIntegerField;
    CDSCadastroTip_Nome: TWideStringField;
    CDSCadastroSta_Codigo: TIntegerField;
    CDSCadastroSta_Nome: TWideStringField;
    CDSCadastroVis_TotalHoras: TFloatField;
    CDSCadastroVis_FormaPagto: TStringField;
    CDSCadastroVis_Valor: TCurrencyField;
    CDSConsultaUsu_Nome: TWideStringField;
    CDSCadastroUsu_Nome: TWideStringField;
    CDSConsultaCli_Fantasia: TWideStringField;
    CDSConsultaVis_Status: TIntegerField;
    CDSCadastroVis_Versao: TStringField;
    CDSCadastroVis_Latitude: TStringField;
    CDSCadastroVis_Longitude: TStringField;
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet; E:
        EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure CDSCadastroVis_DataSetText(Sender: TField; const Text: string);
    procedure CDSCadastroVis_HoraFimSetText(Sender: TField; const Text: string);
    procedure CDSCadastroVis_HoraInicioSetText(Sender: TField; const Text: string);
    procedure CDSCadastroVis_ValorSetText(Sender: TField; const Text: string);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVisita: TDMVisita;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesSIDomper;

{$R *.dfm}

procedure TDMVisita.CDSCadastroBeforePost(DataSet: TDataSet);
var
  HoraInicial: Double;
  HoraFinal: Double;
  TotalHoras: Double;
begin
  inherited;
  CDSCadastroVis_HoraInicio.AsString := FormatDateTime('hh:mm', CDSCadastroVis_HoraInicio.AsDateTime);
  CDSCadastroVis_HoraFim.AsString := FormatDateTime('hh:mm', CDSCadastroVis_HoraFim.AsDateTime);

  HoraInicial := TFuncoes.HoraToDecimal(CDSCadastroVis_HoraInicio.AsString);
  HoraFinal := TFuncoes.HoraToDecimal(CDSCadastroVis_HoraFim.AsString);

  TotalHoras := HoraFinal - HoraInicial;

  CDSCadastroVis_TotalHoras.AsFloat := TotalHoras;
end;

procedure TDMVisita.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroVis_Data.AsDateTime := Date;
  CDSCadastroVis_Valor.AsCurrency := 0;
end;

procedure TDMVisita.CDSCadastroReconcileError(DataSet: TCustomClientDataSet; E:
    EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TDMVisita.CDSCadastroVis_DataSetText(Sender: TField; const Text:
    string);
begin
  inherited;
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMVisita.CDSCadastroVis_HoraFimSetText(Sender: TField; const Text:
    string);
begin
  TFuncoes.ValidaHora(Sender, Text);
  inherited;
end;

procedure TDMVisita.CDSCadastroVis_HoraInicioSetText(Sender: TField; const
    Text: string);
begin
  TFuncoes.ValidaHora(Sender, Text);
  inherited;
end;

procedure TDMVisita.CDSCadastroVis_ValorSetText(Sender: TField; const Text:
    string);
begin
  inherited;
  Sender.Value := StrToFloatDef(Text,0);
end;

procedure TDMVisita.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
end;

end.
