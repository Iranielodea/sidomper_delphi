unit uRamal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMRamal,
  uRamalController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper;

type
  TfrmRamal = class(TfrmBaseCadastro)
    Label5: TLabel;
    edtDepartamento: TDBEdit;
    dsItens: TDataSource;
    dbItens: TDBGrid;
    Label4: TLabel;
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
    procedure dbItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbItensEnter(Sender: TObject);
    procedure dbItensExit(Sender: TObject);
    procedure dsItensStateChange(Sender: TObject);
  private
    { Private declarations }
    FController: TRamalController;
    procedure Localizar(ATexto: string);
    procedure TeclasAtalho(Sender: TObject; var Key: Word; Shift: TShiftState);
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False);
  end;

var
  frmRamal: TfrmRamal;

implementation

{$R *.dfm}

uses uGrade, uDM, uFormatarTexto;

procedure TfrmRamal.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  dbItens.Enabled := edtDepartamento.Enabled;
  inherited;
  if edtDepartamento.Enabled then
    edtDepartamento.SetFocus;
end;

procedure TfrmRamal.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmRamal.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmRamal.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmRamal.btnImprimirClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text);
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmRamal.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  if dbItens.Enabled = False then
    dbItens.Enabled := True;

  inherited;
  edtDepartamento.SetFocus;
end;

procedure TfrmRamal.btnSalvarClick(Sender: TObject);
var
  Id: Integer;
begin
  Id := FController.Salvar(dm.IdUsuario);
  FController.FiltrarId(Id);
  inherited;
end;

constructor TfrmRamal.create(APesquisar: Boolean);
begin
  inherited create(nil);
  FController := TRamalController.Create;
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

procedure TfrmRamal.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtDepartamento.Enabled then
      edtDepartamento.SetFocus;
  end;
end;

procedure TfrmRamal.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmRamal.dbItensDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsItens.DataSet, dbItens, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmRamal.dbItensEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmRamal.dbItensExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmRamal.dbItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    if dbItens.SelectedIndex <= 1 then
      dbItens.SelectedIndex := dbItens.SelectedIndex + 1
    else begin
      dbItens.SelectedIndex := 1;
      dsItens.DataSet.Append;
    end;
  end;

  if Key = VK_INSERT then
    Key := 0;

  TeclasAtalho(Sender, Key, Shift);
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmRamal.dsItensStateChange(Sender: TObject);
begin
  inherited;
  if FController.Model.CDSItens.State in [dsEdit, dsInsert] then
  begin
    if btnSalvar.Enabled = False then
      FController.Model.CDSCadastro.Edit;
  end;
end;

procedure TfrmRamal.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmRamal.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmRamal.Localizar(ATexto: string);
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

procedure TfrmRamal.TeclasAtalho(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
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
  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
  begin
    if dsItens.DataSet.RecordCount > 0 then
    begin
      if TFuncoes.Confirmar('Confirmar Exclusão do Ítem?') then
      begin
        dsItens.DataSet.Delete;
        if not (dsCad.DataSet.State in [dsEdit, dsInsert]) then
          dsCad.DataSet.Edit;
      end;
    end;
  end;
end;

end.
