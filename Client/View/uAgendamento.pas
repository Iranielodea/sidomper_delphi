unit uAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMAgendamento,
  uAgendamentoController, uAgendamentoVO, uGrade, Vcl.Mask, Vcl.DBCtrls,
  uFraUsuario, uFraTipo, uFraCliente, uFraStatus,  uFiltroVisita, uEmailBase, uContaEmailController, uFormProcesso,
  uEmailModelo2, uEnviarEmail, uPosicaoBotao;

type
  TfrmAgendamento = class(TfrmBaseCadastro)
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    edtData: TDBEdit;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    edtCodCliente: TDBEdit;
    dbedtAge_NomeCliente: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    edtCodTipo: TDBEdit;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    edtCodStatus: TDBEdit;
    DBEdit12: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBMemo1: TDBMemo;
    Label12: TLabel;
    btnStatus: TSpeedButton;
    btnTipo: TSpeedButton;
    btnCliente: TSpeedButton;
    tsUsuario: TTabSheet;
    Panel7: TPanel;
    tsCliente: TTabSheet;
    tsTipo: TTabSheet;
    tsStatus: TTabSheet;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    FraUsuario: TFraUsuario;
    FraCliente: TFraCliente;
    FraTipo: TFraTipo;
    FraStatus: TFraStatus;
    Label39: TLabel;
    Label40: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbDadosTitleClick(Column: TColumn);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btnTipoClick(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure edtCodStatusExit(Sender: TObject);
    procedure edtCodTipoExit(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure edtCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FraStatusbtnProcClick(Sender: TObject);
    procedure FraStatusedtCodigoEnter(Sender: TObject);
    procedure FraTipobtnProcClick(Sender: TObject);
    procedure FraTipoedtCodigoEnter(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FQuadro: Boolean;
    FController: TAgendamentoController;
    FDataQuadro: string;
    procedure Localizar(ATexto: string);
    procedure BuscarUsuario;
    procedure BuscarTipo(AId, ACodigo: Integer);
    procedure BuscarStatus(AId, ACodigo: Integer);
    procedure BuscarCliente(AId, ACodigo: Integer);
    procedure ModoEdicao;
    procedure BuscarObservacao;
    procedure Iniciar(APesquisar, AQuadro: Boolean);
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False; AQuadro: Boolean = False); overload;
    constructor create(AData: string; APesquisar: Boolean = False; AQuadro: Boolean = False); overload;
  end;

var
  frmAgendamento: TfrmAgendamento;

implementation

{$R *.dfm}

uses uFuncoesSIDomper, uUsuarioController, uDM, uStatusController, uEnumerador,
  uTipoController, uClienteController, uCliente, uTipo, uStatus, uImagens,
  uFiltroAgendamento, uEmailAgendamento, uObservacao, uObsevacaoController;

constructor TfrmAgendamento.create(APesquisar: Boolean = False; AQuadro: Boolean = False);
begin
  inherited create(nil);
  Iniciar(APesquisar, AQuadro);
//  FController := TAgendamentoController.Create;
//  dsPesquisa.DataSet := FController.Model.CDSConsulta;
//  dsCad.DataSet := FController.Model.CDSCadastro;
//
//  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
//  cbbCampos.ItemIndex := 3;
//  Localizar('ABCDE'); // para trazer vazio
//
//  if APesquisar then
//  begin
//    cbbSituacao.ItemIndex := 0;
//    Pesquisa := APesquisar;
//  end;
//  FraUsuario.Inicializar();
//  FraCliente.Inicializar();
//  FraTipo.Inicializar();
//  FraStatus.Inicializar();
//
//  FQuadro := AQuadro;
end;

procedure TfrmAgendamento.BuscarObservacao;
var
  obs: TObservacaoController;
begin
  if edtCodCliente.Enabled = False then
    Exit;

  TFuncoes.CriarFormularioModal(TfrmObservacao.create(true, prAgendamento));
  if dm.IdSelecionado > 0 then
  begin
    ModoEdicao;
    obs := TObservacaoController.Create;
    try
      obs.LocalizarId(dm.IdSelecionado);
      FController.Model.CDSCadastroAge_Descricao.AsString :=
      FController.Model.CDSCadastroAge_Descricao.AsString + ' ' + obs.Model.CDSCadastroObs_Descricao.AsString;
    finally
      FreeAndNil(obs);
    end;
  end;
end;

procedure TfrmAgendamento.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmAgendamento.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmAgendamento.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmAgendamento.DBMemo1KeyDown(Sender: TObject; var Key: Word;
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
    VK_F9:
    begin
      BuscarObservacao();
    end;
  end;
end;

procedure TfrmAgendamento.edtCodClienteExit(Sender: TObject);
begin
  inherited;
  if edtCodCliente.Modified then
    BuscarCliente(0, StrToIntDef(edtCodCliente.Text, 0));
end;

procedure TfrmAgendamento.edtCodClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
  begin
    if Sender = edtCodCliente then
      btnClienteClick(Self)
    else if Sender = edtCodTipo then
      btnTipoClick(Self);
//    else if Sender = edtCodStatus then
//      btnStatusClick(Self);
  end;
end;

procedure TfrmAgendamento.edtCodStatusExit(Sender: TObject);
begin
  inherited;
//  if edtCodStatus.Modified then
//    BuscarStatus(0, StrToIntDef(edtCodStatus.Text,0));
end;

procedure TfrmAgendamento.edtCodTipoExit(Sender: TObject);
begin
  inherited;
  if edtCodTipo.Modified then
    BuscarTipo(0, StrToIntDef(edtCodTipo.Text, 0));
end;

procedure TfrmAgendamento.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;


procedure TfrmAgendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(FController) then
    FreeAndNil(FController);
end;

procedure TfrmAgendamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if FQuadro then
  begin
    if Key = VK_ESCAPE then
      btnCancelarClick(Self);
  end;
end;

procedure TfrmAgendamento.FormShow(Sender: TObject);
var
  img: TfrmImagens;
  Botao: TPosicaoBotao;
begin
  inherited;
  img := TfrmImagens.Create(Self);
  try
    btnStatus.Glyph := img.btnProcurar.Glyph;
    btnTipo.Glyph := img.btnProcurar.Glyph;
    btnCliente.Glyph := img.btnProcurar.Glyph;
  finally
    FreeAndNil(img);
  end;

//------------------------------------------------------------------------------
// edicao
  Botao := TPosicaoBotao.Create(btnSalvar, 6, 6);
  try
    Botao.PosicaoBotao(btnCancelar);
  finally
    FreeAndNil(Botao);
  end;

//------------------------------------------------------------------------------
// Pesquisa
  Botao := TPosicaoBotao.Create(btnPrimeiro, 6, 6, True);
  try
    Botao.PosicaoBotaoNavegacao(btnAnterior);
    Botao.PosicaoBotaoNavegacao(btnProximo);
    Botao.PosicaoBotaoNavegacao(btnUltimo);
    Botao.PosicaoBotao(btnNovo);
    Botao.PosicaoBotao(btnEditar);
    Botao.PosicaoBotao(btnExcluir);
    Botao.PosicaoBotao(btnFiltrar);
    Botao.PosicaoBotao(btnSair);
  finally
    FreeAndNil(Botao);
  end;
//------------------------------------------------------------------------------
// filtro
  Botao := TPosicaoBotao.Create(btnFiltro, 6, 6);
  try
    Botao.PosicaoBotao(btnImprimir);
    Botao.PosicaoBotao(btnFecharFiltro);
  finally
    FreeAndNil(Botao);
  end;

  if FQuadro then
    btnNovoClick(Self);
end;

procedure TfrmAgendamento.FraStatusbtnProcClick(Sender: TObject);
begin
  inherited;
  FraStatus.TipoPrograma := prAgendamento;
  FraStatus.btnProcClick(Sender);
end;

procedure TfrmAgendamento.FraStatusedtCodigoEnter(Sender: TObject);
begin
  inherited;
  FraStatus.TipoPrograma := prAgendamento;
end;

procedure TfrmAgendamento.FraTipobtnProcClick(Sender: TObject);
begin
  inherited;
  FraTipo.TipoPrograma := prAgendamento;
  FraTipo.btnProcClick(Sender);
end;

procedure TfrmAgendamento.FraTipoedtCodigoEnter(Sender: TObject);
begin
  inherited;
  FraTipo.TipoPrograma := prAgendamento;
end;

procedure TfrmAgendamento.Iniciar(APesquisar, AQuadro: Boolean);
begin
  FController := TAgendamentoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  cbbCampos.ItemIndex := 3;
  Localizar('ABCDE'); // para trazer vazio

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
  FraUsuario.Inicializar();
  FraCliente.Inicializar();
  FraTipo.Inicializar();
  FraStatus.Inicializar();

  FQuadro := AQuadro;
end;

procedure TfrmAgendamento.Localizar(ATexto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
  Filtro: TFiltroAgendamento;
begin

  Filtro := TFiltroAgendamento.Create;
  try
    Filtro.DataInicial := edtDataInicial.Text;
    Filtro.DataFinal := edtDataFinal.Text;
    Filtro.IdTipo := FraTipo.RetornoSelecao();
    Filtro.IdStatus := FraStatus.RetornoSelecao();
    Filtro.IdUsuario := FraUsuario.RetornoSelecao();
    Filtro.IdCliente := FraCliente.RetornoSelecao();

    sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
    sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
    bContem := (cbbPesquisa.ItemIndex = 1);

    FController.Filtrar(Filtro, sCampo, ATexto, bContem);
    FController.Model.CDSConsulta.IndexFieldNames := sCampo;
  finally
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmAgendamento.ModoEdicao;
begin
  TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
end;

procedure TfrmAgendamento.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if FQuadro then
    Close;
end;

procedure TfrmAgendamento.btnClienteClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmCliente.create(FController.Model.CDSCadastroAge_Usuario.AsInteger ,true));
  if dm.IdSelecionado > 0 then
    BuscarCliente(dm.IdSelecionado, 0);
end;

procedure TfrmAgendamento.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  if edtData.Enabled then
    edtData.SetFocus;
end;

procedure TfrmAgendamento.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmAgendamento.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  edtDataInicial.SetFocus;
end;

procedure TfrmAgendamento.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmAgendamento.btnImprimirClick(Sender: TObject);
begin
  inherited;
  FController.Imprimir(dm.IdUsuario);
end;

procedure TfrmAgendamento.btnNovoClick(Sender: TObject);
var
  dData: TDate;
begin
  try
    dData := StrToDate(FDataQuadro);
  except
    dData := Date;
  end;

  FController.Novo(dm.IdUsuario);
  FController.Model.CDSCadastroAge_Data.AsDateTime := dData;
  inherited;
  BuscarUsuario();
  edtData.SetFocus;
end;

procedure TfrmAgendamento.btnSalvarClick(Sender: TObject);
var
  Id: Integer;
  bInclusao: boolean;
begin
  bInclusao := (FController.Model.CDSCadastro.State = dsInsert);
  Id := FController.Salvar(dm.IdUsuario);

  if bInclusao then
  begin
    if not (TFuncoes.ModoDesenvolvimento()) then
      FController.EnvioEmail(Id, FController.Model.CDSCadastroAge_Status.AsInteger);
  end;

  inherited;
  FController.FiltrarId(Id);

  if FQuadro then
  begin
    Close;
    ModalResult := mrOk;
  end;
end;

procedure TfrmAgendamento.btnStatusClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmStatus.create(prAgendamento, True));
  if dm.IdSelecionado > 0 then
    BuscarStatus(dm.IdSelecionado, 0);
end;

procedure TfrmAgendamento.btnTipoClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmTipo.create(prAgendamento, true));
  if dm.IdSelecionado > 0 then
    BuscarTipo(dm.IdSelecionado, 0);
end;

procedure TfrmAgendamento.BuscarCliente(AId, ACodigo: Integer);
var
  obj: TClienteController;
begin
  obj := TClienteController.Create;
  try
    try
      obj.APesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodCliente.SetFocus;
      end;
    end;
  finally
    ModoEdicao;
    FController.Model.CDSCadastroAge_Cliente.AsString := obj.Model.CDSCadastroCli_Id.AsString;
    FController.Model.CDSCadastroCli_Codigo.AsString := obj.Model.CDSCadastroCli_Codigo.AsString;
    FController.Model.CDSCadastroAge_NomeCliente.AsString := obj.Model.CDSCadastroCli_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodCliente.Modified := False;
end;

procedure TfrmAgendamento.BuscarStatus(AId, ACodigo: Integer);
var
  obj: TStatusController;
begin
  obj := TStatusController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prAgendamento);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodStatus.SetFocus;
      end;
    end;
  finally
    ModoEdicao;
    FController.Model.CDSCadastroAge_Status.AsString := obj.Model.CDSCadastroSta_Id.AsString;
    FController.Model.CDSCadastroSta_Codigo.AsString := obj.Model.CDSCadastroSta_Codigo.AsString;
    FController.Model.CDSCadastroSta_Nome.AsString := obj.Model.CDSCadastroSta_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodStatus.Modified := False;
end;

procedure TfrmAgendamento.BuscarTipo(AId, ACodigo: Integer);
var
  obj: TTipoController;
begin
  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prAgendamento);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodTipo.SetFocus;
      end;
    end;
  finally
    ModoEdicao;
    FController.Model.CDSCadastroAge_Tipo.AsString := obj.Model.CDSCadastroTip_Id.AsString;
    FController.Model.CDSCadastroTip_Codigo.AsString := obj.Model.CDSCadastroTip_Codigo.AsString;
    FController.Model.CDSCadastroTip_Nome.AsString := obj.Model.CDSCadastroTip_Nome.AsString;
    FreeAndNil(obj);
  end;
  edtCodTipo.Modified := False;
end;

procedure TfrmAgendamento.BuscarUsuario;
var
  usuario: TUsuarioController;
begin
  usuario := TUsuarioController.Create;
  try
    usuario.LocalizarId(dm.IdUsuario);

    FController.Model.CDSCadastroAge_Usuario.AsInteger := usuario.Model.CDSCadastroUsu_Id.AsInteger;
    FController.Model.CDSCadastroUsu_Codigo.AsInteger := usuario.Model.CDSCadastroUsu_Codigo.AsInteger;
    FController.Model.CDSCadastroUsu_Nome.AsString := usuario.Model.CDSCadastroUsu_Nome.AsString;
  finally
    FreeAndNil(usuario);
  end;
end;

constructor TfrmAgendamento.create(AData: string; APesquisar, AQuadro: Boolean);
begin
  inherited create(nil);
  Iniciar(APesquisar, AQuadro);
  FDataQuadro := AData;
end;

end.
