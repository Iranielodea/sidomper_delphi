unit uDMClienteEspecificacao;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, ppStrtch, ppMemo, ppParameter, ppDesignLayer,
  ppCtrls, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport,
  ppRichTx;

type
  TDMClienteEspecificacao = class(TDMBase)
    CDSConsultaCliEsp_Id: TIntegerField;
    CDSConsultaCliEsp_Data: TDateField;
    CDSConsultaCliEsp_Item: TIntegerField;
    CDSConsultaC_Item: TAggregateField;
    CDSCadastroCliEsp_Id: TAutoIncField;
    CDSCadastroCliEsp_Cliente: TIntegerField;
    CDSCadastroCliEsp_Data: TDateField;
    CDSCadastroCliEsp_Descricao: TWideStringField;
    CDSCadastroCliEsp_Item: TIntegerField;
    CDSCadastroCliEsp_Usuario: TIntegerField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSCadastroCliEsp_Anexo: TStringField;
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
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppParameterList1: TppParameterList;
    ppDBRichText1: TppDBRichText;
    CDSConsultaCli_Codigo: TIntegerField;
    CDSConsultaCli_Nome: TWideStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel6: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    CDSCadastroUsu_Nome: TWideStringField;
    CDSCadastroCliEsp_Nome: TStringField;
    CDSConsultaCliEsp_Nome: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSConsultaCliEsp_DataSetText(Sender: TField; const Text: string);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FContadorId: Integer;
    FItemDisplayFormat: string;
    function GetItemDisplayFormat: string;
  public
    { Public declarations }
    property ItemDisplayFormat: string read GetItemDisplayFormat write FItemDisplayFormat;
  end;

var
  DMClienteEspecificacao: TDMClienteEspecificacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesSIDomper, uEnumerador;

{$R *.dfm}

procedure TDMClienteEspecificacao.CDSCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
//  if CDSCadastro.State = dsInsert then
//    dec(FContadorId);

  if Trim(CDSCadastroCliEsp_Descricao.AsString) = '' then
    raise Exception.Create('Informe a Descrição.');

  try
    StrToDate(CDSCadastroCliEsp_Data.AsString);
  except
    raise Exception.Create('Data Inválida.');
  end;

end;

procedure TDMClienteEspecificacao.CDSCadastroNewRecord(DataSet: TDataSet);
var
  iContador: Integer;
begin
  inherited;

  try
    iContador := CDSConsultaC_Item.Value + 1;
  except
    iContador := 1;
  end;

  CDSCadastroCliEsp_Item.AsInteger := iContador;
  CDSCadastroCliEsp_Data.AsDateTime := Date;
end;

procedure TDMClienteEspecificacao.CDSCadastroReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TDMClienteEspecificacao.CDSConsultaCliEsp_DataSetText(Sender: TField;
  const Text: string);
begin
  inherited;
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMClienteEspecificacao.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
end;

function TDMClienteEspecificacao.GetItemDisplayFormat: string;
begin
  Result := FormatFloat(CDisplayFormatCodigo, StrTofloatDef(FItemDisplayFormat, 0));
end;

end.
