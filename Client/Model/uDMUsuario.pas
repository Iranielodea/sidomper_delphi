unit uDMUsuario;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, uRegras, ppParameter, ppDesignLayer, ppCtrls,
  ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd, ppReport, uFuncoesSIDomper;

type
  TDMUsuario = class(TDMBase)
    CDSCadastroUsu_Id: TAutoIncField;
    CDSCadastroUsu_Adm: TBooleanField;
    CDSCadastroUsu_Ativo: TBooleanField;
    CDSCadastroUsu_Cliente: TIntegerField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSCadastroUsu_Departamento: TIntegerField;
    CDSCadastroUsu_Email: TWideStringField;
    CDSCadastroUsu_Nome: TWideStringField;
    CDSCadastroUsu_Notificar: TBooleanField;
    CDSCadastroUsu_OnLine: TBooleanField;
    CDSCadastroUsu_Password: TWideStringField;
    CDSCadastroUsu_Revenda: TIntegerField;
    CDSCadastroUsu_UserName: TWideStringField;
    CDSCadastroCli_Codigo: TIntegerField;
    CDSCadastroCli_Nome: TWideStringField;
    CDSCadastroDep_Codigo: TIntegerField;
    CDSCadastroDep_Nome: TWideStringField;
    Rel: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
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
    CDSConsultaUsu_id: TAutoIncField;
    CDSConsultaUsu_Codigo: TIntegerField;
    CDSConsultaUsu_Nome: TWideStringField;
    CDSCadastroRev_Codigo: TIntegerField;
    CDSCadastroRev_Nome: TWideStringField;
    CDSConsultaUsu_Ativo: TBooleanField;
    CDSConsultaCAtivo: TStringField;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    CDSUsuarioAcessoMenu: TClientDataSet;
    CDSUsuarioAcessoMenuDepAc_Acesso: TBooleanField;
    CDSUsuarioAcessoMenuDepAc_Programa: TIntegerField;
    CDSListarPermissaoListar: TClientDataSet;
    CDSListarPermissaoListarUsuP_Id: TAutoIncField;
    CDSListarPermissaoListarUsuP_Sigla: TStringField;
    CDSListarPermissaoListarUsuP_Usuario: TIntegerField;
    CDSCadastroUsu_ContaEmail: TIntegerField;
    CDSCadastroCtaEm_Codigo: TIntegerField;
    CDSCadastroCtaEm_Nome: TStringField;
    CDSConsultaUsu_Email: TWideStringField;
    CDSConsultaCtaEm_Codigo: TIntegerField;
    CDSCadastroUsu_Telefone: TStringField;
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSConsultaCalcFields(DataSet: TDataSet);
    procedure CDSListarPermissaoListarReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure CDSListarPermissaoListarNewRecord(DataSet: TDataSet);
    procedure CDSListarPermissaoListarBeforePost(DataSet: TDataSet);
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FIdPermissao: Integer;
  public
    { Public declarations }
  end;

var
  DMUsuario: TDMUsuario;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMUsuario.CDSCadastroBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not (TFuncoes.ValidaEMail(CDSCadastroUsu_Email.AsString)) then
    raise Exception.Create('Email Inválido.');

end;

procedure TDMUsuario.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;

  CDSCadastroUsu_Departamento.AsInteger := 1;
  CDSCadastroUsu_Adm.AsBoolean := False;
  CDSCadastroUsu_Notificar.AsBoolean := False;
  CDSCadastroUsu_Ativo.AsBoolean := True;
  CDSCadastroUsu_OnLine.AsBoolean := False;
end;

procedure TDMUsuario.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
//  Action := HandleReconcileError(DataSet, UpdateKind, E);
  raise Exception.Create(E.Message);
end;

procedure TDMUsuario.CDSConsultaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if CDSConsulta.State = dsInternalCalc then
  begin
    if CDSConsultaUsu_Ativo.AsBoolean then
      CDSConsultaCAtivo.AsString := 'Sim'
    else
      CDSConsultaCAtivo.AsString := 'Não';
  end;
end;

procedure TDMUsuario.CDSListarPermissaoListarBeforePost(DataSet: TDataSet);
begin
  inherited;
  CDSListarPermissaoListarUsuP_Id.AsInteger := FIdPermissao;
  Dec(FIdPermissao);
end;

procedure TDMUsuario.CDSListarPermissaoListarNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSListarPermissaoListarUsuP_Usuario.AsInteger := -1;
end;

procedure TDMUsuario.CDSListarPermissaoListarReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  inherited;
//  Action := raCancel;
//  raise Exception.Create(E.Message);
end;

procedure TDMUsuario.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao;
  end;

  FIdPermissao := -1;
end;

end.
