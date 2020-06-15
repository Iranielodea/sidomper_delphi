unit uObservacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMObservacao,
  uObsevacaoController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, uEnumerador,
  uImagens, uObservacaoEmail;

type
  TfrmObservacao = class(TfrmBaseCadastro)
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    Ativo: TDBCheckBox;
    edtObservacao: TDBRichEdit;
    btnFormatarTecnico: TBitBtn;
    DBRichEdit1: TDBRichEdit;
    Label6: TLabel;
    edtNome: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    DBMemo1: TDBMemo;
    btnEmail: TBitBtn;
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
    procedure edtObservacaoEnter(Sender: TObject);
    procedure edtObservacaoExit(Sender: TObject);
    procedure edtObservacaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFormatarTecnicoClick(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBRadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
  private
    { Private declarations }
    FController: TObservacaoController;
    FNumPrograma: TEnumPrograma;
    procedure Localizar(ATexto: string);
    procedure MostrarObservacaoEmail;
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False; ATipoProgama: TEnumPrograma = prTodos);
  end;

var
  frmObservacao: TfrmObservacao;

implementation

{$R *.dfm}

uses uGrade, uDM, uFormatarTexto;

procedure TfrmObservacao.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  MostrarObservacaoEmail();
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmObservacao.btnEmailClick(Sender: TObject);
var
  F: TfrmObservacaoEmail;
begin
  inherited;
  F := TfrmObservacaoEmail.Create(Self);
  F.ShowModal;
  F.Free;
end;

procedure TfrmObservacao.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmObservacao.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmObservacao.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmObservacao.btnFormatarTecnicoClick(Sender: TObject);
var
  form: TfrmFormatarTexto;
begin
  form := TfrmFormatarTexto.Create(edtObservacao);
  if form.ShowModal = mrOk then
  begin
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
//    EditorTecnico.PasteFromClipboard;
    FController.Model.CDSCadastroObs_Descricao.Clear;
    edtObservacao.PasteFromClipboard;
    edtObservacao.SetFocus;
  end;
  FreeAndNil(form);
end;

procedure TfrmObservacao.btnImprimirClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text);
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmObservacao.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  MostrarObservacaoEmail();
  edtCodigo.SetFocus;
end;

procedure TfrmObservacao.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar(dm.IdUsuario);
  FController.FiltrarCodigo(FController.CodigoAtual());
  inherited;
end;

constructor TfrmObservacao.create(APesquisar: Boolean; ATipoProgama: TEnumPrograma);
begin
  inherited create(nil);
  FController := TObservacaoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  FNumPrograma := ATipoProgama;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);

  if APesquisar = False then
    Localizar('ABCDE')
  else
    Localizar('');

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
end;

procedure TfrmObservacao.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmObservacao.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmObservacao.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmObservacao.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmObservacao.DBMemo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
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
end;

procedure TfrmObservacao.DBRadioGroup1Click(Sender: TObject);
begin
  inherited;
  MostrarObservacaoEmail();
end;

procedure TfrmObservacao.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmObservacao.edtObservacaoEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmObservacao.edtObservacaoExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmObservacao.edtObservacaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
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
end;

procedure TfrmObservacao.FormCreate(Sender: TObject);
var
  img: TfrmImagens;
begin
  inherited;
  img := TfrmImagens.Create(Self);
  try
    btnEmail.Glyph := img.btnEmail.Glyph;
  finally
    FreeAndNil(img);
  end;
end;

procedure TfrmObservacao.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmObservacao.Localizar(ATexto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
begin
  sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
  sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
  bContem := (cbbPesquisa.ItemIndex = 1);

  FController.Model.CDSConsulta.IndexFieldNames := dbDados.Columns[2].FieldName;

  if FNumPrograma = prTodos then
    FController.Filtrar(sCampo, ATexto, sSituacao, bContem)
  else
    FController.FiltrarPrograma(FNumPrograma, sCampo, ATexto, sSituacao, bContem);

end;

procedure TfrmObservacao.MostrarObservacaoEmail;
begin
  btnEmail.Visible := (DBRadioGroup1.ItemIndex = 8);
end;

end.
