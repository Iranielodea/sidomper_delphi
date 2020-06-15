unit uDMRecado;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, uFuncoesSIDomper;

type
  TDMRecado = class(TDMBase)
    CDSConsultaRec_Id: TAutoIncField;
    CDSConsultaNomeUsuarioLcto: TWideStringField;
    CDSConsultaRec_Data: TDateField;
    CDSConsultaRec_Hora: TTimeField;
    CDSConsultaRec_RazaoSocial: TStringField;
    CDSConsultaRec_Contato: TStringField;
    CDSConsultaRec_Telefone: TStringField;
    CDSConsultaNomeUsuarioDest: TWideStringField;
    CDSCadastroRec_Id: TAutoIncField;
    CDSCadastroRec_data: TDateField;
    CDSCadastroRec_Hora: TTimeField;
    CDSCadastroRec_UsuarioLcto: TIntegerField;
    CDSCadastroRec_Nivel: TIntegerField;
    CDSCadastroRec_Cliente: TIntegerField;
    CDSCadastroRec_RazaoSocial: TStringField;
    CDSCadastroRec_Fantasia: TStringField;
    CDSCadastroRec_Endereco: TStringField;
    CDSCadastroRec_Telefone: TStringField;
    CDSCadastroRec_Contato: TStringField;
    CDSCadastroRec_UsuarioDestino: TIntegerField;
    CDSCadastroRec_Tipo: TIntegerField;
    CDSCadastroRec_Status: TIntegerField;
    CDSCadastroRec_DescricaoInicial: TStringField;
    CDSCadastroRec_DataFinal: TDateField;
    CDSCadastroRec_HoraFinal: TTimeField;
    CDSCadastroRec_DescricaoFinal: TStringField;
    CDSCadastroNomeUsuarioLcto: TWideStringField;
    CDSCadastroNomeUsuarioDest: TWideStringField;
    CDSCadastroCli_Codigo: TIntegerField;
    CDSCadastroCli_Nome: TWideStringField;
    CDSCadastroTip_Codigo: TIntegerField;
    CDSCadastroTip_Nome: TWideStringField;
    CDSCadastroSta_Codigo: TIntegerField;
    CDSCadastroSta_Nome: TWideStringField;
    CDSCadastroUsu_CodigoLcto: TIntegerField;
    CDSCadastroUsu_CodigoDest: TIntegerField;
    CDSConsultaRec_Nivel: TIntegerField;
    CDSQuadro: TClientDataSet;
    CDSQuadroTipo: TStringField;
    CDSQuadroRec_Id: TIntegerField;
    CDSQuadroRec_Data: TDateField;
    CDSQuadroRec_Nivel: TIntegerField;
    CDSQuadroRec_RazaoSocial: TStringField;
    CDSQuadroRec_Telefone: TStringField;
    CDSQuadroUsuarioLcto: TWideStringField;
    CDSQuadroUsuarioDestino: TWideStringField;
    CDSLcto: TClientDataSet;
    CDSLctoRec_Id: TIntegerField;
    CDSLctoRec_Data: TDateField;
    CDSLctoRec_Nivel: TIntegerField;
    CDSLctoRec_RazaoSocial: TStringField;
    CDSLctoRec_Telefone: TStringField;
    CDSLctoUsuarioLcto: TStringField;
    CDSLctoUsuarioDestino: TStringField;
    CDSDestino: TClientDataSet;
    CDSDestinoRec_Id: TIntegerField;
    CDSDestinoRec_Data: TDateField;
    CDSDestinoRec_Nivel: TIntegerField;
    CDSDestinoRec_RazaoSocial: TStringField;
    CDSDestinoRec_Telefone: TStringField;
    CDSDestinoUsuarioLcto: TStringField;
    CDSDestinoUsuarioDestino: TStringField;
    CDSLctoCTempo: TStringField;
    CDSDestinoCTempo: TStringField;
    CDSQuadroRec_Hora: TTimeField;
    CDSLctoRec_Hora: TTimeField;
    CDSDestinoRec_Hora: TTimeField;
    CDSQuadroRec_UsuarioLcto: TIntegerField;
    CDSLctoRec_UsuarioLcto: TIntegerField;
    CDSQuadroRec_UsuarioDestino: TIntegerField;
    CDSLctoRec_UsuarioDestino: TIntegerField;
    CDSDestinoRec_UsuarioDestino: TIntegerField;
    CDSConsultaSta_Nome: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroRec_dataSetText(Sender: TField; const Text: string);
    procedure CDSCadastroRec_DataFinalSetText(Sender: TField;
      const Text: string);
    procedure CDSCadastroRec_HoraSetText(Sender: TField; const Text: string);
    procedure CDSCadastroRec_HoraFinalSetText(Sender: TField;
      const Text: string);
    procedure CDSLctoCalcFields(DataSet: TDataSet);
    procedure CDSDestinoCalcFields(DataSet: TDataSet);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function CalcularTempo(DataLcto, HoraLcto: TDateTime): string;
  end;

var
  DMRecado: TDMRecado;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDMRecado.CalcularTempo(DataLcto, HoraLcto: TDateTime): string;
begin
  try
    if Date = DataLcto then
      Result := FormatDateTime('hh:mm', Time - HoraLcto)
    else
      Result := FloatToStr(TFuncoes.DiferencaEntreDatas(DataLcto, Date));
  except
    Result := '00:00';
  end;
end;

procedure TDMRecado.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroRec_Nivel.AsInteger := 2;
end;

procedure TDMRecado.CDSCadastroRec_DataFinalSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMRecado.CDSCadastroRec_dataSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMRecado.CDSCadastroRec_HoraFinalSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  TFuncoes.ValidaHora(Sender, Text);
end;

procedure TDMRecado.CDSCadastroRec_HoraSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  TFuncoes.ValidaHora(Sender, Text);
end;

procedure TDMRecado.CDSDestinoCalcFields(DataSet: TDataSet);
begin
  inherited;
  CDSDestinoCTempo.AsString := CalcularTempo(CDSDestinoRec_Data.AsDateTime, CDSDestinoRec_Hora.AsDateTime);
end;

procedure TDMRecado.CDSLctoCalcFields(DataSet: TDataSet);
begin
  inherited;
  CDSLctoCTempo.AsString := CalcularTempo(CDSLctoRec_Data.AsDateTime, CDSLctoRec_Hora.AsDateTime);
end;

procedure TDMRecado.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao2;
  end;

  CDSLcto.CreateDataSet;
  CDSDestino.CreateDataSet;
end;

end.
