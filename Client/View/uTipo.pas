unit uTipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMTipo,
  uTipoController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, uEnumerador;

type
  TfrmTipo = class(TfrmBaseCadastro)
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    Ativo: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
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
  private
    { Private declarations }
    FEnumPrograma: TEnumPrograma;
    FController: TTipoController;
    procedure Iniciar(APesquisar: Boolean);
    procedure Localizar(ATexto: string);
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False); overload;
    constructor create(AenPrograma: TEnumPrograma; APesquisar: Boolean = False); overload;
  end;

var
  frmTipo: TfrmTipo;

implementation

{$R *.dfm}

uses uGrade, uDM;

procedure TfrmTipo.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmTipo.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmTipo.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmTipo.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmTipo.btnImprimirClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text);
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmTipo.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  edtCodigo.SetFocus;
end;

procedure TfrmTipo.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar(dm.IdUsuario);
  FController.FiltrarCodigo(FController.CodigoAtual());
  inherited;
end;

constructor TfrmTipo.create(AenPrograma: TEnumPrograma; APesquisar: Boolean);
begin
  inherited create(nil);
  FEnumPrograma := AenPrograma;
  Iniciar(APesquisar);
end;

constructor TfrmTipo.create(APesquisar: Boolean);
begin
  inherited create(nil);
  FEnumPrograma := prTodos;
  Iniciar(APesquisar);
end;

procedure TfrmTipo.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmTipo.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmTipo.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmTipo.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmTipo.Iniciar(APesquisar: Boolean);
begin
  FController := TTipoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
    Localizar(edtDescricao.Text);
  end
  else
    Localizar('ABCDE');
end;

procedure TfrmTipo.Localizar(ATexto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
begin
  sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
  sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
  bContem := (cbbPesquisa.ItemIndex = 1);

  if FEnumPrograma = prTodos then
    FController.Filtrar(sCampo, ATexto, sSituacao, bContem)
  else
    FController.FiltrarPrograma(FEnumPrograma, sCampo, ATexto, sSituacao, bContem);

end;

end.
