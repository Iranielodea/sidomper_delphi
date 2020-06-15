unit uOrcamentoDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseDetalhes, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, uOrcamentoController,
  uDMOrcamento, Vcl.Grids, Vcl.DBGrids;

type
  TfrmOrcamentoDetalhe = class(TfrmBaseDetalhes)
    PageControl1: TPageControl;
    tsItens: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    edtCodProduto: TDBEdit;
    dsCad: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    btnProduto: TSpeedButton;
    tsModulo: TTabSheet;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    Label8: TLabel;
    edtModulo: TDBEdit;
    DBEdit9: TDBEdit;
    btnModulo: TSpeedButton;
    dsModulo: TDataSource;
    Label9: TLabel;
    DBMemo2: TDBMemo;
    dbModulo: TDBGrid;
    btnNovoModulo: TBitBtn;
    btnEditarModulo: TBitBtn;
    btnSalvarModulo: TBitBtn;
    btnExcluirModulo: TBitBtn;
    btnCancelarModulo: TBitBtn;
    Panel3: TPanel;
    btnSalvarItem: TBitBtn;
    btnCancelarItem: TBitBtn;
    btnNovoItem: TBitBtn;
    procedure btnSalvarClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure btnProdutoClick(Sender: TObject);
    procedure edtCodProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsModuloStateChange(Sender: TObject);
    procedure btnNovoModuloClick(Sender: TObject);
    procedure btnEditarModuloClick(Sender: TObject);
    procedure btnSalvarModuloClick(Sender: TObject);
    procedure btnExcluirModuloClick(Sender: TObject);
    procedure btnCancelarModuloClick(Sender: TObject);
    procedure dbModuloDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure PageControl1Change(Sender: TObject);
    procedure edtModuloExit(Sender: TObject);
    procedure btnModuloClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtModuloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvarItemClick(Sender: TObject);
    procedure btnCancelarItemClick(Sender: TObject);
    procedure btnNovoItemClick(Sender: TObject);
    procedure dbModuloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo2Exit(Sender: TObject);
    procedure DBMemo2Enter(Sender: TObject);
    procedure tsModuloShow(Sender: TObject);
  private
    { Private declarations }
    FIdOrcamento: Integer;
    FController: TOrcamentoController;
    FSalvou: Boolean;
    procedure BuscarProduto(AId, ACodigo: Integer);
    procedure BuscarModulo(AId, ACodigo: Integer);
    procedure TeclasAtalho(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure EditarTela();
  public
    { Public declarations }
    property Salvou: Boolean read FSalvou;
    constructor create(Controller: TOrcamentoController; AIdOrcamento, AIdItem: Integer;
      AEditar: Boolean);
  end;

var
  frmOrcamentoDetalhe: TfrmOrcamentoDetalhe;

implementation

{$R *.dfm}

uses uProdutoController, uFuncoesSIDomper, uProduto, uDM, uImagens, uGrade,
  uPosicaoBotao, uModuloController, uModulo;

procedure TfrmOrcamentoDetalhe.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dsCad.DataSet.Cancel;
end;

procedure TfrmOrcamentoDetalhe.btnCancelarItemClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrcamentoDetalhe.btnCancelarModuloClick(Sender: TObject);
begin
//  inherited;
  if dsModulo.State = dsBrowse then
    Close
  else
    dsModulo.DataSet.Cancel;
end;

procedure TfrmOrcamentoDetalhe.btnEditarModuloClick(Sender: TObject);
begin
  inherited;
  if dsModulo.DataSet.RecordCount = 0 then
    raise Exception.Create('Não há Registros para Editar!');

  dsModulo.DataSet.Edit;
  edtModulo.SetFocus;
end;

procedure TfrmOrcamentoDetalhe.btnExcluirModuloClick(Sender: TObject);
begin
  inherited;
  if TFuncoes.Confirmar('Excluir Item?') then
  begin
    FController.ExcluirOrcamentoItemModulo();
    FSalvou := True;
  end;
end;

procedure TfrmOrcamentoDetalhe.btnModuloClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmModulo.create(true));
  if dm.IdSelecionado > 0 then
    BuscarModulo(dm.IdSelecionado, 0);
end;

procedure TfrmOrcamentoDetalhe.btnNovoClick(Sender: TObject);
begin
  inherited;
  dsCad.DataSet.Append;
  edtCodProduto.SetFocus;
end;

procedure TfrmOrcamentoDetalhe.btnNovoItemClick(Sender: TObject);
begin
  dsCad.DataSet.Append;
  edtCodProduto.SetFocus;
end;

procedure TfrmOrcamentoDetalhe.btnNovoModuloClick(Sender: TObject);
begin
  inherited;
  if dsCad.DataSet.RecordCount = 0 then
    raise Exception.Create('Informe o Ítem antes do Módulo!');

  dsModulo.DataSet.Append;
  edtModulo.SetFocus;
end;

procedure TfrmOrcamentoDetalhe.btnProdutoClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmProduto.create(true));
  if dm.IdSelecionado > 0 then
    BuscarProduto(dm.IdSelecionado, 0);
end;

procedure TfrmOrcamentoDetalhe.btnSalvarClick(Sender: TObject);
begin
  if dsModulo.State in [dsEdit, dsInsert] then
    raise Exception.Create('Salve o Módulo!');

  inherited;

  if dsCad.State = dsInsert then
    FController.Model.CDSItensOrcIte_Orcamento.AsInteger := FIdOrcamento;

  dsCad.DataSet.Post;
  FSalvou := True;
end;

procedure TfrmOrcamentoDetalhe.btnSalvarItemClick(Sender: TObject);
begin
  if dsCad.State = dsInsert then
    FController.Model.CDSItensOrcIte_Orcamento.AsInteger := FIdOrcamento;

  dsCad.DataSet.Post;
  btnNovoItem.SetFocus;
  FSalvou := True;
end;

procedure TfrmOrcamentoDetalhe.btnSalvarModuloClick(Sender: TObject);
var
  IdOrcamentoItem: Integer;
begin
  if dsCad.State in [dsEdit, dsInsert] then
  begin
    raise Exception.Create('Salve o Ítem do Orçamento!');
  end;

//  inherited;

  IdOrcamentoItem := FController.Model.CDSItensOrcIte_Id.AsInteger;
  FController.Model.CDSItensModuloOrcIteMod_OrcamentoItem.AsInteger := IdOrcamentoItem;

  dsModulo.DataSet.Post;
  FController.Model.CDSItensModulo.Filter := 'OrcIteMod_OrcamentoItem = ' + IntToStr(IdOrcamentoItem);
  btnNovoModulo.SetFocus;
  FSalvou := True;
end;

procedure TfrmOrcamentoDetalhe.BuscarModulo(AId, ACodigo: Integer);
var
  ModuloController: TModuloController;
begin
  if not (dsModulo.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  ModuloController := TModuloController.Create;
  try
    try
      ModuloController.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtModulo.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSItensModulo);
    FController.Model.CDSItensModuloOrcIteMod_Modulo.AsString := ModuloController.Model.CDSCadastroMod_Id.AsString;
    FController.Model.CDSItensModuloMod_Codigo.AsString := ModuloController.Model.CDSCadastroMod_Codigo.AsString;
    FController.Model.CDSItensModuloMod_Nome.AsString := ModuloController.Model.CDSCadastroMod_Nome.AsString;

    FreeAndNil(ModuloController);
  end;
  edtModulo.Modified := False;
end;

procedure TfrmOrcamentoDetalhe.BuscarProduto(AId, ACodigo: Integer);
var
  ProdutoController: TProdutoController;
begin
  if not (dsCad.DataSet.State in [dsEdit, dsInsert]) then
    Exit;

  ProdutoController := TProdutoController.Create;
  try
    try
      ProdutoController.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodProduto.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSItens);
    FController.Model.CDSItensOrcIte_Produto.AsString := ProdutoController.Model.CDSCadastroProd_Id.AsString;
    FController.Model.CDSItensProd_Codigo.AsString := ProdutoController.Model.CDSCadastroProd_Codigo.AsString;
    FController.Model.CDSItensProd_Nome.AsString := ProdutoController.Model.CDSCadastroProd_Nome.AsString;

    FreeAndNil(ProdutoController);
  end;
  edtCodProduto.Modified := False;
end;

constructor TfrmOrcamentoDetalhe.create(Controller: TOrcamentoController;
  AIdOrcamento, AIdItem: Integer; AEditar: Boolean);
begin
  inherited create(nil);
  FIdOrcamento := AIdOrcamento;

  FController := Controller;
  dsCad.DataSet := FController.Model.CDSItens;
  dsModulo.DataSet := FController.Model.CDSItensModulo;

  if AIdItem = 0 then
    FController.Model.CDSItens.Append
  else
    FController.Model.CDSItens.Locate('OrcIte_Id', AIdItem, []);

  FController.Model.CDSItensModulo.Filtered := True;
  FController.Model.CDSItensModulo.Filter := 'OrcIteMod_OrcamentoItem = ' + IntToStr(AIdItem);

  if AEditar = False then
    TFuncoes.HabilitarCampo(Self, False);

  EditarTela();

  FSalvou := False;
end;

procedure TfrmOrcamentoDetalhe.DBMemo2Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmOrcamentoDetalhe.DBMemo2Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmOrcamentoDetalhe.DBMemo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TeclasAtalho(Sender, Key, Shift);
end;

procedure TfrmOrcamentoDetalhe.dbModuloDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsModulo.DataSet, dbModulo, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmOrcamentoDetalhe.dbModuloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmOrcamentoDetalhe.dsCadStateChange(Sender: TObject);
begin
  inherited;
  btnSalvarItem.Enabled := (dsCad.State in [dsEdit, dsInsert]);
  btnNovoItem.Enabled := dsCad.State = dsBrowse;
end;

procedure TfrmOrcamentoDetalhe.dsModuloStateChange(Sender: TObject);
begin
  inherited;
  btnNovoModulo.Enabled := dsModulo.State = dsBrowse;
  btnEditarModulo.Enabled := btnNovoModulo.Enabled;
  btnSalvarModulo.Enabled := dsModulo.State in [dsEdit, dsInsert];
  btnExcluirModulo.Enabled := dsModulo.State = dsBrowse;
  btnCancelarModulo.Enabled := btnSalvarModulo.Enabled;
end;

procedure TfrmOrcamentoDetalhe.EditarTela;
begin
  if edtCodProduto.Enabled = False then
  begin
    btnNovoItem.Enabled := False;
    btnNovoModulo.Enabled := False;
    btnEditarModulo.Enabled := False;
    btnSalvarModulo.Enabled := False;
    btnExcluirModulo.Enabled := False;
    btnCancelarModulo.Enabled := False;
  end;
end;

procedure TfrmOrcamentoDetalhe.edtCodProdutoExit(Sender: TObject);
begin
  inherited;
  if edtCodProduto.Modified then
    BuscarProduto(0, StrToIntDef(edtCodProduto.Text, 0));
end;

procedure TfrmOrcamentoDetalhe.edtCodProdutoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    btnProdutoClick(Self);
end;

procedure TfrmOrcamentoDetalhe.edtModuloExit(Sender: TObject);
begin
  inherited;
  if edtModulo.Modified then
    BuscarModulo(0, StrToIntDef(edtModulo.Text, 0));
end;

procedure TfrmOrcamentoDetalhe.edtModuloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
  begin
    if btnProduto.Enabled then
      btnModuloClick(Self);
  end;
end;

procedure TfrmOrcamentoDetalhe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if dsCad.State in [dsEdit, dsInsert] then
    dscad.DataSet.Cancel;

  FController.Model.CDSItensModulo.Filtered := False;
end;

procedure TfrmOrcamentoDetalhe.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;

  TeclasAtalho(Sender, Key, Shift);
end;

procedure TfrmOrcamentoDetalhe.FormShow(Sender: TObject);
var
  img: TfrmImagens;
  iPosicao: Integer;
  Botao: TPosicaoBotao;
  BotaoItem: TPosicaoBotao;
begin
  inherited;

  PageControl1.ActivePageIndex := 0;

  img := TfrmImagens.Create(Self);
  try
    btnProduto.Glyph := img.btnProcurar.Glyph;
    btnNovo.Glyph := img.btnNovoItem.Glyph;
    btnModulo.Glyph := img.btnProcurar.Glyph;

    btnNovoModulo.Glyph := img.btnNovoItem.Glyph;
    btnEditarModulo.Glyph := img.btnEditar.Glyph;
    btnSalvarModulo.Glyph := img.btnSalvar.Glyph;
    btnExcluirModulo.Glyph := img.btnExcluirItem.Glyph;
    btnCancelarModulo.Glyph := img.btnCancelarItem.Glyph;

    btnSalvarItem.Glyph := img.btnSalvar.Glyph;
    btnCancelarItem.Glyph := img.btnCancelar.Glyph;
    btnNovoItem.Glyph := img.btnNovoItem.Glyph;

  finally
    FreeAndNil(img);
  end;

  iPosicao := 183;
  Botao := TPosicaoBotao.Create(btnNovoModulo, iPosicao, 488);
  try
    Botao.PosicaoBotao(btnEditarModulo);
    Botao.PosicaoBotao(btnExcluirModulo);
    Botao.PosicaoBotao(btnSalvarModulo);
    Botao.PosicaoBotao(btnCancelarModulo);
  finally
    FreeAndNil(Botao);
  end;

  iPosicao := 8;
  BotaoItem := TPosicaoBotao.Create(btnNovoItem, iPosicao, 15);
  try
    BotaoItem.PosicaoBotao(btnSalvarItem);
    BotaoItem.PosicaoBotao(btnCancelarItem);
  finally
    FreeAndNil(BotaoItem);
  end;

  if edtCodProduto.Enabled then
    edtCodProduto.SetFocus;
end;

procedure TfrmOrcamentoDetalhe.PageControl1Change(Sender: TObject);
begin
  inherited;
  if dsModulo.State in [dsEdit, dsInsert] then
  begin
    TFuncoes.ControleGuias(PageControl1,
                           tsModulo,
                           btnSalvarModulo,
                           'o Módulo!');
  end;

  if dsCad.State in [dsEdit, dsInsert] then
  begin
    TFuncoes.ControleGuias(PageControl1,
                           tsItens,
                           btnSalvarItem,
                           'o Ítem!');
  end;

end;

procedure TfrmOrcamentoDetalhe.TeclasAtalho(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if tsItens.Showing then
  begin
    case key of
      VK_INSERT:
      begin
        if btnNovoItem.Enabled then
          btnNovoItemClick(Self);
      end;
      VK_F8:
      begin
        if btnSalvarItem.Enabled then
          btnSalvarItemClick(Self);
      end;
      VK_ESCAPE:
      begin
        if btnCancelarItem.Enabled then
          btnCancelarItemClick(Self);
      end;
    end;
  end;

  if tsModulo.Showing then
  begin
    case key of
      VK_INSERT:
      begin
        if btnNovoModulo.Enabled then
          btnNovoModuloClick(Self);
      end;
      VK_F2:
      begin
        if btnEditarModulo.Enabled then
          btnEditarModuloClick(Self);
      end;
      VK_F8:
      begin
        if btnSalvarModulo.Enabled then
          btnSalvarModuloClick(Self);
      end;
      VK_ESCAPE:
      begin
        btnCancelarModuloClick(Self);
      end;
    end;

    if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    begin
      if btnExcluirModulo.Enabled then
        btnExcluirModuloClick(Self);
    end;

  end;
end;

procedure TfrmOrcamentoDetalhe.tsModuloShow(Sender: TObject);
begin
  inherited;
  try
    FController.Model.CDSItensModulo.Filter := 'OrcIteMod_OrcamentoItem = ' + IntToStr(FController.Model.CDSItensOrcIte_Id.AsInteger);
  except
    // nada
  end;
end;

end.
