unit uFormaPagto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMformaPagto,
  uFormaPagtoController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper;

type
  TfrmFormaPagto = class(TfrmBaseCadastro)
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    Ativo: TDBCheckBox;
    dbForma: TDBGrid;
    dsItens: TDataSource;
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
    procedure dbFormaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbFormaEnter(Sender: TObject);
    procedure dbFormaExit(Sender: TObject);
    procedure dbFormaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsItensStateChange(Sender: TObject);
  private
    { Private declarations }
    FController: TFormaPagtoController;
    procedure Localizar(ATexto: string);
    procedure Excluir(Sender: TObject; var Key: Word;  Shift: TShiftState);
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False);
  end;

var
  frmFormaPagto: TfrmFormaPagto;

implementation

{$R *.dfm}

uses uGrade, uDM;

procedure TfrmFormaPagto.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmFormaPagto.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmFormaPagto.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmFormaPagto.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmFormaPagto.btnImprimirClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text);
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmFormaPagto.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  edtCodigo.SetFocus;
end;

procedure TfrmFormaPagto.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar(dm.IdUsuario);
  FController.FiltrarCodigo(FController.CodigoAtual());
  inherited;
end;

constructor TfrmFormaPagto.create(APesquisar: Boolean);
begin
  inherited create(nil);
  FController := TFormaPagtoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  Localizar('ABCDE');

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
end;

procedure TfrmFormaPagto.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmFormaPagto.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmFormaPagto.dbFormaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsItens.DataSet, dbForma, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmFormaPagto.dbFormaEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmFormaPagto.dbFormaExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmFormaPagto.dbFormaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if dbForma.SelectedIndex < 1 then
      dbForma.SelectedIndex := dbForma.SelectedIndex + 1
    else begin
      dbForma.SelectedIndex := 0;
      dsItens.DataSet.Append;
    end;
  end;

  if Key = VK_INSERT then
    Key := 0;

  case key of
    VK_F8:
    begin
      if btnSalvar.Enabled then
      begin
        btnSalvar.SetFocus;
        btnSalvarClick(Self);
      end;
    end;
    VK_ESCAPE:
    begin
      if btnCancelar.Enabled then
      begin
        btnCancelar.SetFocus;
        btnCancelarClick(Self);
      end;
    end;
  end;

  Excluir(Sender, Key, Shift);
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);

end;

procedure TfrmFormaPagto.dsItensStateChange(Sender: TObject);
begin
  inherited;
  if dsItens.State in [dsEdit, dsInsert] then
    TFuncoes.ModoEdicaoInsercao(dsCad.DataSet);
end;

procedure TfrmFormaPagto.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmFormaPagto.Excluir(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if tsEdicao.Showing then
  begin
    if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    begin
      if FController.Model.CDSItens.IsEmpty then
        raise Exception.Create('Não há Registro!')
      else begin
        if TFuncoes.Confirmar('Confirmar Exclsão do Item?') then
        begin
          FController.Model.CDSItens.Delete;
          TFuncoes.ModoEdicaoInsercao(dsCad.DataSet);
        end;
      end;
    end;
  end;
end;

procedure TfrmFormaPagto.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmFormaPagto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  Excluir(Sender, Key, Shift);
end;

procedure TfrmFormaPagto.Localizar(ATexto: string);
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
