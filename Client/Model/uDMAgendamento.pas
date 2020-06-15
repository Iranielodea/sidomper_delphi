unit uDMAgendamento;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM;

type
  TdmAgendamento = class(TDMBase)
    CDSConsultaAge_Id: TAutoIncField;
    CDSConsultaAge_Data: TDateField;
    CDSConsultaAge_Hora: TTimeField;
    CDSConsultaTip_Nome: TWideStringField;
    CDSConsultaSta_Nome: TWideStringField;
    CDSCadastroAge_Id: TAutoIncField;
    CDSCadastroAge_Data: TDateField;
    CDSCadastroAge_Hora: TTimeField;
    CDSCadastroAge_Usuario: TIntegerField;
    CDSCadastroAge_Cliente: TIntegerField;
    CDSCadastroAge_Contato: TStringField;
    CDSCadastroAge_Programa: TIntegerField;
    CDSCadastroAge_Tipo: TIntegerField;
    CDSCadastroAge_Status: TIntegerField;
    CDSCadastroAge_Descricao: TStringField;
    CDSCadastroAge_Motivo: TStringField;
    CDSCadastroAge_Visita: TIntegerField;
    CDSCadastroAge_Atividade: TIntegerField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSCadastroUsu_Nome: TWideStringField;
    CDSCadastroCli_Codigo: TIntegerField;
    CDSCadastroTip_Codigo: TIntegerField;
    CDSCadastroTip_Nome: TWideStringField;
    CDSCadastroSta_Codigo: TIntegerField;
    CDSCadastroSta_Nome: TWideStringField;
    CDSQuadro: TClientDataSet;
    CDSQuadroAge_Id: TAutoIncField;
    CDSQuadroAge_Data: TDateField;
    CDSQuadroAge_Hora: TTimeField;
    CDSQuadroUsu_Nome: TWideStringField;
    CDSQuadroSta_Nome: TWideStringField;
    CDSQuadroAge_Cliente: TIntegerField;
    CDSConsultaUsu_Nome: TWideStringField;
    CDSConsultaAge_NomeCliente: TStringField;
    CDSCadastroAge_NomeCliente: TStringField;
    CDSQuadroAge_NomeCliente: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
    procedure CDSCadastroAge_DataSetText(Sender: TField; const Text: string);
    procedure CDSCadastroAge_HoraSetText(Sender: TField; const Text: string);
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
  dmAgendamento: TdmAgendamento;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesSIDomper;

{$R *.dfm}

procedure TdmAgendamento.CDSCadastroAge_DataSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TdmAgendamento.CDSCadastroAge_HoraSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  TFuncoes.ValidaHora(Sender, Text);
end;

procedure TdmAgendamento.CDSCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
//  if CDSCadastro.State = dsInsert then
//    CDSCadastroAge_Id.AsInteger := -1;
end;

procedure TdmAgendamento.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroAge_Programa.AsInteger := 2;
  CDSCadastroAge_Data.AsDateTime := Date;
  CDSCadastroAge_Hora.AsDateTime := Time;
end;

procedure TdmAgendamento.CDSCadastroReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TdmAgendamento.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao2;
  end;
end;

end.
