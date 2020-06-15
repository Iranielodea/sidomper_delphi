unit uDMBaseConh;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM;

type
  TDMBaseConh = class(TDMBase)
    CDSConsultaBas_Id: TAutoIncField;
    CDSConsultaBas_Data: TDateField;
    CDSConsultaBas_Nome: TStringField;
    CDSCadastroBas_Id: TAutoIncField;
    CDSCadastroBas_Data: TDateField;
    CDSCadastroBas_Nome: TStringField;
    CDSCadastroBas_Usuario: TIntegerField;
    CDSCadastroBas_Produto: TIntegerField;
    CDSCadastroBas_Modulo: TIntegerField;
    CDSCadastroBas_Tipo: TIntegerField;
    CDSCadastroBas_Status: TIntegerField;
    CDSCadastroBas_Descricao: TStringField;
    CDSCadastroBas_Anexo: TStringField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSCadastroProd_Codigo: TIntegerField;
    CDSCadastroProd_Nome: TWideStringField;
    CDSCadastroMod_Codigo: TIntegerField;
    CDSCadastroMod_Nome: TWideStringField;
    CDSCadastroTip_Codigo: TIntegerField;
    CDSCadastroTip_Nome: TWideStringField;
    CDSCadastroSta_Codigo: TIntegerField;
    CDSCadastroSta_Nome: TWideStringField;
    CDSConsultaTip_Nome: TWideStringField;
    CDSConsultaSta_Nome: TWideStringField;
    CDSConsultaUsu_Nome: TWideStringField;
    CDSCadastroUsu_Nome: TWideStringField;
    procedure CDSCadastroBas_DataSetText(Sender: TField; const Text: string);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet; E:
        EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBaseConh: TDMBaseConh;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesSIDomper;

{$R *.dfm}

procedure TDMBaseConh.CDSCadastroBas_DataSetText(Sender: TField; const Text:
    string);
begin
  inherited;
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMBaseConh.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroBas_Data.AsDateTime := Date;
end;

procedure TDMBaseConh.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
    E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TDMBaseConh.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao;
  CDSConsulta.RemoteServer := DM.DSPConexao;
end;

end.
