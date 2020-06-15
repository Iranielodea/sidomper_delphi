unit uCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMCidade,
  uCidadeController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper;

type
  TfrmCidade = class(TfrmBaseCadastro)
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    Ativo: TDBCheckBox;
    Label6: TLabel;
    DBEdit1: TDBEdit;
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
    FIdCliente: Integer;
    FController: TCidadeController;
    procedure Localizar(ATexto: string; AIdCliente: Integer);
    procedure Iniciar(APesquisar: Boolean);
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False); overload;
    constructor create(AIdCliente: Integer; APesquisar: Boolean = False; AMostrarDados: Boolean = false); overload;
  end;

var
  frmCidade: TfrmCidade;

implementation

{$R *.dfm}

uses uGrade, uDM;

procedure TfrmCidade.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmCidade.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmCidade.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmCidade.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text, FIdCliente);
end;

procedure TfrmCidade.btnImprimirClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text, FIdCliente);
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmCidade.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  edtCodigo.SetFocus;
end;

procedure TfrmCidade.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar(dm.IdUsuario);
  FController.FiltrarCodigo(FController.CodigoAtual());
  inherited;
end;

constructor TfrmCidade.create(AIdCliente: Integer; APesquisar: Boolean; AMostrarDados: Boolean);
begin
  inherited create(nil);

  Iniciar(APesquisar);

  FIdCliente := AIdCliente;

  if AMostrarDados then
    Localizar('', AIdCliente)
  else
    Localizar('ABCDE', AIdCliente);

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;

end;

constructor TfrmCidade.create(APesquisar: Boolean);
begin
  inherited create(nil);

  Iniciar(APesquisar);
  Localizar('ABCDE', 0);

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
end;

procedure TfrmCidade.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmCidade.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmCidade.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text, FIdCliente);
end;

procedure TfrmCidade.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmCidade.Iniciar(APesquisar: Boolean);
begin
  FController := TCidadeController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;
  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  FIdCliente := 0;
end;

procedure TfrmCidade.Localizar(ATexto: string; AIdCliente: Integer);
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
