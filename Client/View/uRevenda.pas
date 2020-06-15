unit uRevenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMRevenda,
  uRevendaController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, uGrade;

type
  TfrmRevenda = class(TfrmBaseCadastro)
    PageControl1: TPageControl;
    tsPrincipal: TTabSheet;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    Ativo: TDBCheckBox;
    tsEmail: TTabSheet;
    Panel8: TPanel;
    dbEmail: TDBGrid;
    Label6: TLabel;
    edtEmail: TDBEdit;
    btnNovoEmail: TBitBtn;
    btnEditarEmail: TBitBtn;
    btnSalvarEmail: TBitBtn;
    btnExcluirEmail: TBitBtn;
    btnCancelarEmail: TBitBtn;
    dsEmail: TDataSource;
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
    procedure FormShow(Sender: TObject);
    procedure dbEmailDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCancelarEmailClick(Sender: TObject);
    procedure btnExcluirEmailClick(Sender: TObject);
    procedure btnSalvarEmailClick(Sender: TObject);
    procedure btnEditarEmailClick(Sender: TObject);
    procedure btnNovoEmailClick(Sender: TObject);
    procedure dsEmailStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PageControl1Change(Sender: TObject);
  private
    { Private declarations }
    FController: TRevendaController;
    procedure Localizar(Texto: string);
    procedure EntrarEdicao;

    function PodeEditarEmail(): Boolean;
    procedure EmailNovo;
    procedure EmailEditar;
    function EmailSalvar: Boolean;
    procedure EmailExcluir;
    function EmailCancelar: boolean;
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False);
  end;

var
  frmRevenda: TfrmRevenda;

implementation

{$R *.dfm}

uses uDM, uImagens, uPosicaoBotao;

procedure TfrmRevenda.btnCancelarEmailClick(Sender: TObject);
begin
  inherited;
  if dsEmail.DataSet.State in [dsInsert, dsEdit] then
    dsEmail.DataSet.Cancel;
end;

procedure TfrmRevenda.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  EntrarEdicao();
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmRevenda.btnEditarEmailClick(Sender: TObject);
begin
  inherited;
  if dsEmail.DataSet.RecordCount = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  dsEmail.DataSet.Edit;
  edtEmail.SetFocus;
end;

procedure TfrmRevenda.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmRevenda.btnExcluirEmailClick(Sender: TObject);
begin
  if FController.Model.CDSEmail.RecordCount = 0 then
    raise Exception.Create('Não há registro para Excluir!');

  inherited;
  if TFuncoes.Confirmar('Confirmar Exclusão?') then
  begin
    FController.Model.CDSEmail.Delete;
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
  end;
end;

procedure TfrmRevenda.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmRevenda.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmRevenda.btnImprimirClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text);
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmRevenda.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  EntrarEdicao();
  edtCodigo.SetFocus;
end;

procedure TfrmRevenda.btnNovoEmailClick(Sender: TObject);
begin
  inherited;
  FController.Model.CDSEmail.Last;
  edtEmail.SetFocus;
  FController.Model.CDSEmail.Append;
end;

procedure TfrmRevenda.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar(dm.IdUsuario);
  FController.FiltrarCodigo(FController.CodigoAtual());
  inherited;
end;

procedure TfrmRevenda.btnSalvarEmailClick(Sender: TObject);
begin
  inherited;
  if dsEmail.DataSet.State in [dsEdit, dsInsert] then
    dsEmail.DataSet.Post;
end;

constructor TfrmRevenda.create(APesquisar: Boolean);
begin
  inherited create(nil);
  FController := TRevendaController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  Localizar('ABCDE'); // para trazer vazio

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
end;

procedure TfrmRevenda.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmRevenda.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmRevenda.dbEmailDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsEmail.DataSet, dbEmail, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmRevenda.dsEmailStateChange(Sender: TObject);
begin
  inherited;
  if dsEmail.State in [dsEdit, dsInsert] then
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);

  btnSalvarEmail.Enabled := (dsEmail.DataSet.State in [dsEdit, dsInsert]);
  btnCancelarEmail.Enabled := (dsEmail.DataSet.State in [dsEdit, dsInsert]);
  btnEditarEmail.Enabled := (dsEmail.DataSet.State in [dsBrowse]);
  btnExcluirEmail.Enabled := (dsEmail.DataSet.State in [dsBrowse]);
  btnNovoEmail.Enabled := (dsEmail.DataSet.State in [dsBrowse]);

  btnSalvar.Enabled := ((btnSalvarEmail.Enabled = False) and (FController.Model.CDSCadastro.State in [dsEdit, dsInsert]));
  dbEmail.Enabled := (dsEmail.DataSet.State in [dsBrowse]);
end;

procedure TfrmRevenda.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

function TfrmRevenda.EmailCancelar: Boolean;
begin
  Result := False;
  if PodeEditarEmail() then
  begin
    if btnCancelarEmail.Enabled then
    begin
      btnCancelarEmailClick(Self);
      Result := True;
    end;
  end;
end;

procedure TfrmRevenda.EmailEditar;
begin
  if PodeEditarEmail() then
  begin
    if btnEditarEmail.Enabled then
      btnEditarEmailClick(Self);
  end;
end;

procedure TfrmRevenda.EmailExcluir;
begin
  if PodeEditarEmail() then
  begin
    if btnExcluirEmail.Enabled then
      btnExcluirEmailClick(Self);
  end;
end;

procedure TfrmRevenda.EmailNovo;
begin
  if PodeEditarEmail() then
  begin
    if btnNovoEmail.Enabled then
      btnNovoEmailClick(Self);
  end;
end;

function TfrmRevenda.EmailSalvar: Boolean;
begin
  Result := False;
  if PodeEditarEmail() then
  begin
    if btnSalvarEmail.Enabled then
    begin
      btnSalvarEmailClick(Self);
      Result := True;
    end;
  end;
end;

procedure TfrmRevenda.EntrarEdicao;
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TfrmRevenda.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmRevenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if EmailCancelar() then
      Exit;
  end;

  if Key = VK_F8 then
  begin
    if EmailSalvar() then
      Exit;
  end;

  inherited;

  case Key of
    VK_INSERT: EmailNovo();
    VK_F2: EmailEditar();
  end;

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    EmailExcluir();
end;

procedure TfrmRevenda.FormShow(Sender: TObject);
var
  Img: TfrmImagens;
  Botao: TPosicaoBotao;
  iPosicao: Integer;
begin
  inherited;

  Img := TfrmImagens.Create(Self);
  try
    btnNovoEmail.Glyph := Img.btnNovoItem.Glyph;
    btnEditarEmail.Glyph := Img.btnEditar.Glyph;
    btnExcluirEmail.Glyph := Img.btnExcluirItem.Glyph;
    btnCancelarEmail.Glyph := Img.btnCancelarItem.Glyph;
    btnSalvarEmail.Glyph := Img.btnSalvar.Glyph;
  finally
    FreeAndNil(Img);
  end;

  iPosicao := 168;
  Botao := TPosicaoBotao.Create(btnNovoEmail, iPosicao, 240);
  try
    Botao.PosicaoBotao(btnEditarEmail);
    Botao.PosicaoBotao(btnSalvarEmail);
    Botao.PosicaoBotao(btnExcluirEmail);
    Botao.PosicaoBotao(btnCancelarEmail);
  finally
    FreeAndNil(Botao);
  end;
end;

procedure TfrmRevenda.Localizar(Texto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
begin
  sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
  sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
  bContem := (cbbPesquisa.ItemIndex = 1);

  FController.Filtrar(sCampo, Texto, sSituacao, bContem);
end;

procedure TfrmRevenda.PageControl1Change(Sender: TObject);
begin
  inherited;
  TFuncoes.ControleGuias(PageControl1,
                         tsEmail,
                         btnSalvarEmail,
                         'o Email!');
end;

function TfrmRevenda.PodeEditarEmail: Boolean;
begin
  Result := False;
  if (tsEdicao.Showing) and (tsEmail.Showing) then
    Result := True;
end;

end.
