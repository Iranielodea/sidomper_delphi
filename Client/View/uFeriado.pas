unit uFeriado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMFeriado,
  uFeriadoController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper;

type
  TfrmFeriado = class(TfrmBaseCadastro)
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    DBEdit1: TDBEdit;
    Label6: TLabel;
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
    FController: TFeriadoController;
    procedure Localizar(ATexto: string);
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False);
  end;

var
  frmFeriado: TfrmFeriado;

implementation

{$R *.dfm}

uses uGrade, uDM;

procedure TfrmFeriado.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmFeriado.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmFeriado.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmFeriado.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmFeriado.btnImprimirClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text);
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmFeriado.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmFeriado.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar(dm.IdUsuario);
  FController.FiltrarCodigo(FController.CodigoAtual());
  inherited;
end;

constructor TfrmFeriado.create(APesquisar: Boolean);
begin
  inherited create(nil);
  FController := TFeriadoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  cbbCampos.ItemIndex := 0;

  Localizar('ABCDE');

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
end;

procedure TfrmFeriado.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmFeriado.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmFeriado.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmFeriado.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmFeriado.Localizar(ATexto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
begin
  sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
  sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
  bContem := (cbbPesquisa.ItemIndex = 1);

  FController.Filtrar(sCampo, ATexto, sSituacao, bContem);
end;

end.
