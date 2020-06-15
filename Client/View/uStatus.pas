unit uStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMStatus,
  uStatusController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, uEnumerador;

type
  TfrmStatus = class(TfrmBaseCadastro)
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    Ativo: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    GroupBox2: TGroupBox;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharEdicaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dbDadosTitleClick(Column: TColumn);
    procedure dbDadosCellClick(Column: TColumn);
  private
    { Private declarations }
    FController: TStatusController;
    FEnumPrograma: TEnumPrograma;
    procedure Iniciar(Pesquisar: Boolean);
    procedure Localizar(Texto: string);
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False); overload;
    constructor create(AenPrograma: TEnumPrograma; APesquisar: Boolean = False); overload;
  end;

var
  frmStatus: TfrmStatus;

implementation

{$R *.dfm}

uses uGrade, uDM;

procedure TfrmStatus.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmStatus.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmStatus.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmStatus.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmStatus.btnImprimirClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text);
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmStatus.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  edtCodigo.SetFocus;
end;

procedure TfrmStatus.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar(dm.IdUsuario);
  FController.FiltrarCodigo(FController.CodigoAtual());
  inherited;
end;

constructor TfrmStatus.create(AenPrograma: TEnumPrograma; APesquisar: Boolean);
begin
  inherited create(nil);
  FEnumPrograma := AenPrograma;
  Iniciar(APesquisar);
end;

constructor TfrmStatus.create(APesquisar: Boolean);
begin
  inherited create(nil);
  FEnumPrograma := prTodos;
  Iniciar(APesquisar);
end;

procedure TfrmStatus.dbDadosCellClick(Column: TColumn);
begin
  inherited;
//  TGrade.CheckBoxClicarCelula(Column, 'CNotificar_Cliente', 'Sta_NotificarCliente', FController.Model.CDSConsulta);
//  TGrade.CheckBoxClicarCelula(Column, 'CNotificar_Supervisor', 'Sta_NotificarSupervisor', FController.Model.CDSConsulta);
//  TGrade.CheckBoxClicarCelula(Column, 'CNotificar_Consultor', 'Sta_NotificarConsultor', FController.Model.CDSConsulta);
//  TGrade.CheckBoxClicarCelula(Column, 'CNotificar_Revenda', 'Sta_NotificarRevenda', FController.Model.CDSConsulta);
end;

procedure TfrmStatus.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmStatus.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmStatus.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmStatus.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmStatus.Iniciar(Pesquisar: Boolean);
begin
  FController := TStatusController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);


  if Pesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := Pesquisar;
    Localizar(edtDescricao.Text);
  end
  else
    Localizar('ABCDE');
end;

procedure TfrmStatus.Localizar(Texto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
begin
  sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
  sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
  bContem := (cbbPesquisa.ItemIndex = 1);

  if FEnumPrograma = prTodos then
    FController.FiltrarPrograma(prTodos, sCampo, Texto, sSituacao, bContem)
  else
    FController.FiltrarPrograma(FEnumPrograma, sCampo, Texto, sSituacao, bContem);

end;

end.
