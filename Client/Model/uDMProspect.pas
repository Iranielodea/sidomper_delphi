unit uDMProspect;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM, System.Variants;

type
  TDMProspect = class(TDMBase)
    CDSCadastroPros_Id: TAutoIncField;
    CDSCadastroPros_Ativo: TBooleanField;
    CDSCadastroPros_Contato: TStringField;
    CDSCadastroPros_Docto: TStringField;
    CDSCadastroPros_Endereco: TStringField;
    CDSCadastroPros_Enquadramento: TStringField;
    CDSCadastroPros_Fantasia: TStringField;
    CDSCadastroPros_Nome: TStringField;
    CDSCadastroPros_Revenda: TIntegerField;
    CDSCadastroPros_Telefone: TStringField;
    CDSCadastroPros_Usuario: TIntegerField;
    CDSCadastroRev_Codigo: TIntegerField;
    CDSCadastroRev_Nome: TWideStringField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSCadastroUsu_Nome: TWideStringField;
    CDSCadastroPros_Codigo: TIntegerField;
    CDSConsultaPros_Id: TAutoIncField;
    CDSConsultaPros_Codigo: TIntegerField;
    CDSConsultaPros_Nome: TStringField;
    CDSConsultaPros_Fantasia: TStringField;
    CDSConsultaPros_Docto: TStringField;
    CDSConsultaPros_Telefone: TStringField;
    CDSConsultaPros_Ativo: TBooleanField;
    CDSConsultaPros_Enquadramento: TStringField;
    CDSConsultaUsu_Nome: TWideStringField;
    CDSConsultaRev_Nome: TWideStringField;
    CDSEmail: TClientDataSet;
    CDSEmailProsEm_Id: TAutoIncField;
    CDSEmailProsEm_Prospect: TIntegerField;
    CDSEmailProsEm_Email: TStringField;
    CDSEmailProsEm_Descricao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroPros_DoctoSetText(Sender: TField; const Text: string);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSEmailBeforePost(DataSet: TDataSet);
    procedure CDSEmailReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSEmailNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    FIdEmail: Integer;
  public
    { Public declarations }
  end;

var
  DMProspect: TDMProspect;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uEnumerador, uFuncoesSIDomper, uClassValidacao;

{$R *.dfm}

procedure TDMProspect.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  inherited;
  CDSCadastroPros_Ativo.AsBoolean := True;
  CDSCadastroPros_Enquadramento.AsString := '01';
end;

procedure TDMProspect.CDSCadastroPros_DoctoSetText(Sender: TField;
  const Text: string);
var
  sTexto: string;
begin
  inherited;
  if Text <> '' then
  begin
    sTexto := TFuncoes.SomenteNumeros(Text);

    if Length(sTexto) > 11 then
      TValidacao.ValidaCNPJ(sTexto)
    else
      TValidacao.ValidaCPF(sTexto);
  end;
  Sender.Value := Text;
end;

procedure TDMProspect.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TDMProspect.CDSEmailBeforePost(DataSet: TDataSet);
begin
  inherited;
  if Trim(CDSEmailProsEm_Descricao.AsString) = '' then
    raise Exception.Create('Informe a Descrição!');

  if Trim(CDSEmailProsEm_Email.AsString) = '' then
    raise Exception.Create('Informe o Email!');

end;

procedure TDMProspect.CDSEmailNewRecord(DataSet: TDataSet);
begin
  inherited;
  Dec(FIdEmail);
  CDSEmailProsEm_Id.AsInteger := FIdEmail;
  CDSEmailProsEm_Prospect.AsInteger := 0;
end;

procedure TDMProspect.CDSEmailReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  raise Exception.Create(E.Message);
end;

procedure TDMProspect.DataModuleCreate(Sender: TObject);
begin
  inherited;
  CDSCadastro.RemoteServer := DM.DSPConexao2;
  CDSConsulta.RemoteServer := DM.DSPConexao2;
  CDSEmail.RemoteServer := DM.DSPConexao2;

  CDSCadastroPros_Codigo.DisplayFormat := CDisplayFormatCliente;
  CDSConsultaPros_Codigo.DisplayFormat := CDisplayFormatCliente;

  FIdEmail := 0;

end;

end.
