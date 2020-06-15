unit uEscala;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMEscala,
  uEscalaController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, uUsuarioController,
  uUsuario, uImagens, uEscalaVO, uFraUsuario, Vcl.Menus;

type
  TfrmEscala = class(TfrmBaseCadastro)
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    Label6: TLabel;
    dbedtProd_Nome: TDBEdit;
    Label7: TLabel;
    edtCodUsuario: TDBEdit;
    DBEdit1: TDBEdit;
    btnUsuario: TSpeedButton;
    Label39: TLabel;
    Label40: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    tsUsuario: TTabSheet;
    Panel7: TPanel;
    FraUsuario: TFraUsuario;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    cbbModelo: TComboBox;
    PopupMenu1: TPopupMenu;
    Duplicar1: TMenuItem;
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
    procedure btnUsuarioClick(Sender: TObject);
    procedure edtCodUsuarioExit(Sender: TObject);
    procedure edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure Duplicar1Click(Sender: TObject);
  private
    { Private declarations }
    FController: TEscalaController;
    procedure Localizar(ATexto: string);
    procedure BuscarUsuario(AId, ACodigo: Integer);
    procedure Filtrar(AFiltro: TEscalaFiltro);
    procedure Impressao;
    procedure DuplicarEscala;
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False);
  end;

var
  frmEscala: TfrmEscala;

implementation

{$R *.dfm}

uses uGrade, uDM;

procedure TfrmEscala.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmEscala.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmEscala.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmEscala.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmEscala.btnImprimirClick(Sender: TObject);
begin
//  Localizar(edtDescricao.Text);
  FController.Imprimir(dm.IdUsuario);

  Impressao();
  inherited;
end;

procedure TfrmEscala.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  edtCodigo.SetFocus;
end;

procedure TfrmEscala.btnSalvarClick(Sender: TObject);
var
  obj: TEscalaVO;
  id: Integer;
begin
  obj := TEscalaVO.Create;
  try
    obj.Id := FController.Model.CDSCadastroEsc_Id.AsInteger;
    obj.Data := FController.Model.CDSCadastroEsc_Data.AsString;
    obj.HoraInicio := FController.Model.CDSCadastroEsc_HoraInicio.AsString;
    obj.HoraFim := FController.Model.CDSCadastroEsc_HoraFim.AsString;
    obj.IdUsuario := FController.Model.CDSCadastroEsc_Usuario.AsInteger;

    id := FController.Salvar(obj, dm.IdUsuario);
  //  FController.FiltrarCodigo(FController.CodigoAtual());
    FController.FiltrarCodigo(id);
  finally
    FreeAndNil(obj);
  end;
  inherited;
end;

procedure TfrmEscala.btnUsuarioClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmUsuario.create(true));
  if dm.IdSelecionado > 0 then
    BuscarUsuario(dm.IdSelecionado, 0);
end;

procedure TfrmEscala.BuscarUsuario(AId, ACodigo: Integer);
var
  obj: TUsuarioController;
begin
  obj := TUsuarioController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
      FController.ModoEdicaoInsercao();
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodUsuario.SetFocus;
      end;
    end;
  finally
    if dsCad.DataSet.State in [dsEdit, dsInsert] then
    begin
      FController.Model.CDSCadastroEsc_Usuario.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
      FController.Model.CDSCadastroUsu_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
      FController.Model.CDSCadastroUsu_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;
    end;

    FreeAndNil(obj);
  end;
  edtCodUsuario.Modified := False;

end;

constructor TfrmEscala.create(APesquisar: Boolean);
begin
  inherited create(nil);
  FController := TEscalaController.Create;
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

procedure TfrmEscala.DuplicarEscala;
var
  Id: Integer;
begin
  if TFuncoes.Confirmar('Confirmar Duplica��o?') then
  begin
    Id := FController.Duplicar(FController.Model.CDSConsultaEsc_Id.AsInteger);
    FController.FiltrarCodigo(id);
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmEscala.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmEscala.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmEscala.Duplicar1Click(Sender: TObject);
begin
  inherited;
  DuplicarEscala();
end;

procedure TfrmEscala.edtCodUsuarioExit(Sender: TObject);
begin
  inherited;
  if edtCodUsuario.Modified then
    BuscarUsuario(0, StrToIntDef(edtCodUsuario.Text, 0));

end;

procedure TfrmEscala.edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    btnUsuarioClick(self);

end;

procedure TfrmEscala.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmEscala.Filtrar(AFiltro: TEscalaFiltro);
begin
  AFiltro.IdUsuario := FraUsuario.RetornoSelecao();
  AFiltro.DataInicial := edtDataInicial.Text;
  AFiltro.DataFinal := edtDataFinal.Text;
end;

procedure TfrmEscala.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmEscala.FormShow(Sender: TObject);
var
  Img: TfrmImagens;
begin
  inherited;
  Img := TfrmImagens.Create(Self);
  try
    btnUsuario.Glyph := Img.btnProcurar.Glyph;
  finally
    FreeAndNil(img);
  end;
  FraUsuario.Inicializar();
end;

procedure TfrmEscala.Impressao;
var
  Filtro: TEscalaFiltro;
begin
  Filtro := TEscalaFiltro.Create;
  Filtrar(Filtro);
  try
    FController.Relatorio01(Filtro, 1);
  finally
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmEscala.Localizar(ATexto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
  Filtro: TEscalaFiltro;
begin
  sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
  sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
  bContem := (cbbPesquisa.ItemIndex = 1);

  Filtro := TEscalaFiltro.Create;

  Filtrar(Filtro);

  FController.Filtrar(Filtro, sCampo, ATexto, dm.IdUsuario, bContem);

  FreeAndNil(Filtro);
end;

end.