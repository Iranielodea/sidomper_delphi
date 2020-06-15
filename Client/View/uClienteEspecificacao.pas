unit uClienteEspecificacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMClienteEspecificacao,
  uClienteEspecificacaoController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, Vcl.OleCtnrs;

type
  TfrmClienteEspecificacao = class(TfrmBaseCadastro)
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    Label7: TLabel;
    edtCliente: TEdit;
    edtNomeCliente: TEdit;
    Label8: TLabel;
    edtUsuario: TDBEdit;
    DBEdit2: TDBEdit;
    DBMemo2: TDBMemo;
    Label9: TLabel;
    edtNomeArquivo: TDBEdit;
    Label15: TLabel;
    dlgAbrirArquivo: TOpenDialog;
    dlgSalvarArquivo: TSaveDialog;
    btnUsuario: TSpeedButton;
    btnAnexar: TSpeedButton;
    btnVisualizar: TSpeedButton;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbDadosDblClick(Sender: TObject);
    procedure dbDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharEdicaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure edtUsuarioExit(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo2Enter(Sender: TObject);
    procedure DBMemo2Exit(Sender: TObject);
    procedure DBMemo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAnexarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
    { Private declarations }
    FController: TClienteEspecificacaoController;
    FIdCliente: Integer;
    procedure Localizar();
    procedure BuscarUsuario(AId, ACodigo: Integer);
  public
    { Public declarations }
    constructor create(AIdCliente: Integer; APesquisar: Boolean = False);
  end;

var
  frmClienteEspecificacao: TfrmClienteEspecificacao;

implementation

{$R *.dfm}

uses uGrade, uDM, uClienteController, uUsuario, uUsuarioController, uImagens,
  uEnumerador;

procedure TfrmClienteEspecificacao.btnAnexarClick(Sender: TObject);
begin
  inherited;
  if dlgAbrirArquivo.Execute then
  begin
    if Trim(dlgAbrirArquivo.FileName) = '' then
      raise Exception.Create('Informe o Nome do Arquivo.');

    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
    FController.Model.CDSCadastroCliEsp_Anexo.AsString := dlgAbrirArquivo.FileName;

//    TBlobField(FController.Model.CDSCadastroCliEsp_Anexo).LoadFromFile(dlgAbrirArquivo.FileName);
  end;
end;

procedure TfrmClienteEspecificacao.btnCancelarClick(Sender: TObject);
begin
  inherited;
  dbDados.SetFocus;
end;

procedure TfrmClienteEspecificacao.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmClienteEspecificacao.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmClienteEspecificacao.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmClienteEspecificacao.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar();
end;

procedure TfrmClienteEspecificacao.btnImprimirClick(Sender: TObject);
begin
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmClienteEspecificacao.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmClienteEspecificacao.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar(FIdCliente, dm.IdUsuario);
  Localizar();
  inherited;
  dbDados.SetFocus;
end;

procedure TfrmClienteEspecificacao.btnUsuarioClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmUsuario.create(true));
  if dm.IdSelecionado > 0 then
    BuscarUsuario(dm.IdSelecionado, 0);

end;

procedure TfrmClienteEspecificacao.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  TFuncoes.VisualizarArquivo(edtNomeArquivo.Text);
end;

procedure TfrmClienteEspecificacao.BuscarUsuario(AId, ACodigo: Integer);
var
  UsuarioController: TUsuarioController;
begin
  UsuarioController := TUsuarioController.Create;
  try
    try
      UsuarioController.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtUsuario.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
    FController.Model.CDSCadastroCliEsp_Usuario.AsString := UsuarioController.Model.CDSCadastroUsu_Id.AsString;
    FController.Model.CDSCadastroUsu_Codigo.AsString := UsuarioController.Model.CDSCadastroUsu_Codigo.AsString;
    FController.Model.CDSCadastroUsu_Nome.AsString := UsuarioController.Model.CDSCadastroUsu_Nome.AsString;

    FreeAndNil(UsuarioController);
  end;
  edtUsuario.Modified := False;
end;

constructor TfrmClienteEspecificacao.create(AIdCliente: Integer; APesquisar: Boolean);
var
  Cliente: TClienteController;
begin
  inherited create(nil);

  FIdCliente := AIdCliente;

  Cliente := TClienteController.Create;
  try
    Cliente.LocalizarId(AIdCliente);
    edtCliente.Text := Cliente.Model.CodigoDisplayFormat;
    edtNomeCliente.Text := Cliente.Model.CDSCadastroCli_Nome.AsString;
  finally
    FreeAndNil(Cliente);
  end;

  FController := TClienteEspecificacaoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  Localizar();

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
end;

procedure TfrmClienteEspecificacao.dbDadosDblClick(Sender: TObject);
begin
  if Pesquisa then
  begin
    dm.IdSelecionado := dbDados.Columns[0].Field.AsInteger;
    Close;
  end
  else
    inherited;
end;

procedure TfrmClienteEspecificacao.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if Pesquisa then
      Self.KeyPreview := False
    else begin
      if edtCodigo.Enabled then
        edtCodigo.SetFocus;
    end;
  end;
end;

procedure TfrmClienteEspecificacao.DBMemo2Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmClienteEspecificacao.DBMemo2Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmClienteEspecificacao.DBMemo2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
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
    VK_ESCAPE: btnCancelarClick(Self);
  end;
end;

procedure TfrmClienteEspecificacao.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar();
end;

procedure TfrmClienteEspecificacao.edtUsuarioExit(Sender: TObject);
begin
  inherited;
  if edtUsuario.Modified then
    BuscarUsuario(0, StrToIntDef(edtUsuario.Text, 0));
end;

procedure TfrmClienteEspecificacao.edtUsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    btnUsuarioClick(Self);
end;

procedure TfrmClienteEspecificacao.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmClienteEspecificacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then
    dbDados.SetFocus;
end;

procedure TfrmClienteEspecificacao.FormShow(Sender: TObject);
var
  Img: TfrmImagens;
begin
  pgControl.ActivePageIndex := 0;
//  OleContainer1.SendToBack;
//  inherited;
  tsPesquisa.TabVisible := True;
  tsEdicao.TabVisible := False;
  tsFiltro.TabVisible := False;

  Img := TfrmImagens.Create(Self);
  try
    btnAnexar.Glyph := Img.btnAnexar.Glyph;
    btnVisualizar.Glyph := Img.btnExportar.Glyph;
    btnUsuario.Glyph := Img.btnProcurar.Glyph;
  finally
    FreeAndNil(img);
  end;
  dbDados.SetFocus;
end;

procedure TfrmClienteEspecificacao.Localizar();
begin
  FController.LocalizarCodigo(FIdCliente);
end;

end.
