unit uChamado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMChamado,
  uChamadoController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, Vcl.OleCtnrs, uFraCliente,
  uFraUsuario, uFraTipo, uFraStatus, uEnumerador, uFraRevenda, uClienteController,
  uUsuarioController, uEmailChamado, Vcl.Menus, uFraModulo, uFraAnalista, uFiltroChamado,
  uFraColaborador, uAgendamentoController, uPermissaoChamadoVO;

type
  TfrmChamado = class(TfrmBaseCadastro)
    PageControl1: TPageControl;
    tsPrincipal: TTabSheet;
    pnlAbertura: TPanel;
    edtCodigo: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    edtNome: TDBEdit;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    edtCodCliente: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    btnCliente: TSpeedButton;
    edtCodUsuario: TDBEdit;
    Label10: TLabel;
    DBEdit7: TDBEdit;
    edtCodTipo: TDBEdit;
    Label12: TLabel;
    DBEdit10: TDBEdit;
    btnTipo: TSpeedButton;
    edtCodStatus: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBMemo1: TDBMemo;
    dlgAbrirArquivo: TOpenDialog;
    tsFiltroCliente: TTabSheet;
    Panel8: TPanel;
    FraCliente: TFraCliente;
    tsFiltroUsuario: TTabSheet;
    Panel9: TPanel;
    FraUsuario: TFraUsuario;
    tsFiltroTipo: TTabSheet;
    tsFiltroStatus: TTabSheet;
    Panel10: TPanel;
    Panel11: TPanel;
    FraTipo: TFraTipo;
    FraStatus: TFraStatus;
    Label39: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    Label40: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    tsChamadoOcorrencia: TTabSheet;
    Panel12: TPanel;
    dbOcorrencia: TDBGrid;
    Label5: TLabel;
    edtDocumento: TDBEdit;
    dsOcorrencia: TDataSource;
    edtData: TDBEdit;
    Label8: TLabel;
    edtHoraInicial: TDBEdit;
    Label11: TLabel;
    edtHoraFinal: TDBEdit;
    Label15: TLabel;
    edtUsuario: TDBEdit;
    Label16: TLabel;
    DBEdit9: TDBEdit;
    Label20: TLabel;
    mmoTecnica: TDBMemo;
    Label21: TLabel;
    mmoSolucao: TDBMemo;
    Label22: TLabel;
    edtNomeArquivo: TDBEdit;
    btnAnexar: TSpeedButton;
    btnVisualizar: TSpeedButton;
    btnNovoOcorrencia: TBitBtn;
    btnExcluirOcorrencia: TBitBtn;
    btnCancelarOcorrencia: TBitBtn;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    dlgSalvarArquivo: TSaveDialog;
    tsStatus: TTabSheet;
    Panel13: TPanel;
    dsStatus: TDataSource;
    dbStatus: TDBGrid;
    btnSalvarOcorrencia: TBitBtn;
    GroupBox2: TGroupBox;
    Label23: TLabel;
    cbbModelo: TComboBox;
    tsRevenda: TTabSheet;
    Panel14: TPanel;
    FraRevenda: TFraRevenda;
    lblMensagem: TLabel;
    cbbOrdemRelatorio: TComboBox;
    lblOrdemRelatorio: TLabel;
    Label25: TLabel;
    btnModulo: TSpeedButton;
    edtCodModulo: TDBEdit;
    DBEdit8: TDBEdit;
    edtCodProduto: TDBEdit;
    DBEdit11: TDBEdit;
    Label26: TLabel;
    btnEspecificacao: TBitBtn;
    btnModulo2: TBitBtn;
    btnConsultaDescricao: TBitBtn;
    btnListarProblemas: TBitBtn;
    btnEditarOcorr: TBitBtn;
    btnDetalhes: TBitBtn;
    btnDetalhes2: TBitBtn;
    Label30: TLabel;
    DBEdit1: TDBEdit;
    Label31: TLabel;
    edtVersao: TDBEdit;
    Label33: TLabel;
    mmoCliente: TMemo;
    btnBuscarCliente: TBitBtn;
    mmoCliente2: TMemo;
    Label27: TLabel;
    pmConsulta: TPopupMenu;
    EnviarEmail1: TMenuItem;
    tsFiltroModulo: TTabSheet;
    Panel7: TPanel;
    FraModulo: TFraModulo;
    btnColaborar: TBitBtn;
    btnListarAnexo: TBitBtn;
    btnListarAnexo2: TBitBtn;
    tsConsultor: TTabSheet;
    Panel15: TPanel;
    FraConsultor: TFraAnalista;
    edtIdFiltro: TEdit;
    lbl1: TLabel;
    Label19: TLabel;
    edtPerfil: TEdit;
    procedure btnAnexarClick(Sender: TObject);
    procedure btnCancelarOcorrenciaClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnExcluirOcorrenciaClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharEdicaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnNovoOcorrenciaClick(Sender: TObject);
    procedure btnSalvarOcorrenciaClick(Sender: TObject);
    procedure btnTipoClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure cbbCamposChange(Sender: TObject);
    procedure cbbModeloClick(Sender: TObject);
    procedure edtNomeArquivoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbOcorrenciaDrawColumnCell(Sender: TObject; const Rect: TRect;
        DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbOcorrenciaKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure dbStatusDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol:
        Integer; Column: TColumn; State: TGridDrawState);
    procedure dbStatusKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dsOcorrenciaStateChange(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure edtCodClienteKeyDown(Sender: TObject; var Key: Word; Shift:
        TShiftState);
    procedure edtCodTipoExit(Sender: TObject);
    procedure edtCodUsuarioExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure mmoSolucaoEnter(Sender: TObject);
    procedure mmoSolucaoExit(Sender: TObject);
    procedure mmoSolucaoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mmoTecnicaEnter(Sender: TObject);
    procedure mmoTecnicaExit(Sender: TObject);
    procedure mmoTecnicaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tsFiltroShow(Sender: TObject);
    procedure tsGeralShow(Sender: TObject);
    procedure dbDadosTitleClick(Column: TColumn);
    procedure btnModuloClick(Sender: TObject);
    procedure edtCodModuloExit(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEspecificacaoClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure btnModulo2Click(Sender: TObject);
    procedure btnConsultaDescricaoClick(Sender: TObject);
    procedure btnListarProblemasClick(Sender: TObject);
    procedure edtDataDblClick(Sender: TObject);
    procedure btnEditarOcorrClick(Sender: TObject);
    procedure btnDetalhesClick(Sender: TObject);
    procedure btnDetalhes2Click(Sender: TObject);
    procedure btnBuscarClienteClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure EnviarEmail1Click(Sender: TObject);
    procedure dbDadosDblClick(Sender: TObject);
    procedure btnColaborarClick(Sender: TObject);
    procedure btnListarAnexoClick(Sender: TObject);
    procedure btnListarAnexo2Click(Sender: TObject);
    procedure FraTipobtnProcClick(Sender: TObject);
    procedure FraStatusbtnProcClick(Sender: TObject);
    procedure FraStatusedtCodigoEnter(Sender: TObject);
    procedure FraTipoedtCodigoEnter(Sender: TObject);

    procedure EditarDBEdit(var AdbEdit: TDBEdit; AEditar: Boolean);
    procedure EditarMemo(var AMemo: TDBMemo; AEditar: Boolean);
    procedure edtIdFiltroExit(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FController: TChamadoController;
    FQuadro: Boolean;
    FOcorrencia: Boolean;
    FTipoMovimento: TEnumChamadoAtividade;
    FEncerrarAgendamento: Boolean;
    FIdClienteAgendamento: Integer;
    FIdAgendamento: Integer;
    FEditar: Boolean;
    FCaminhoAnexo: string;
    procedure Localizar(ATexto: string);

    procedure BuscarCliente(AId, ACodigo: Integer);
    procedure BuscarUsuario(AId, ACodigo: Integer);
    procedure BuscarTipo(AId, ACodigo: Integer);
//    procedure BuscarStatus(Id, Codigo: Integer);
    procedure BuscarModulo(AId, ACodigo: Integer);
    procedure BuscarObservacao(ATipo: Integer);

    procedure NovaOcorrencia;
    procedure ExcluirOcorrencia;
    function CancelarOcorrencia: Boolean;
    function SalvarOcorrencia: Boolean;
    procedure TeclasAtalho(var Key: Word; var Shift: TShiftState);
    procedure NovoOcorrencia;

    procedure RelatoriosChamados;
    procedure RelatoriosAtividades;
    procedure RelatorioModelo_01;
    procedure RelatorioModelo_02;
    procedure RelatorioModelo_03;
    procedure RelatorioModelo_04;
    procedure RelatorioModelo_05;
    procedure RelatorioModelo_06;
    procedure RelatorioModelo_07;
    procedure RelatorioModelo_08;
    procedure RelatorioFiltro(AFiltro: TFiltroChamado);

    procedure OrdemRelatorioModelo02;
    procedure OrdemRelatorioModelo03;
    procedure OrdemRelatorioModelo04;
    procedure OrdemRelatorioModelo05;
    procedure OrdemRelatorioModelo08;

    function EntrarTelaStatus: Boolean;

    procedure EntrarChamadoQuadro;
    function SalvarChamadoQuadro: Boolean;

//    procedure EntrarChamadoOcorrencia;
    procedure Iniciar(APesquisar: boolean; ATipo: TEnumChamadoAtividade);
    procedure DadosChamado;
    procedure DadosAtividade;

    procedure NovoChamadoQuadro;
    function SalvarChamadoOcorrencia: Boolean;

    procedure EditarOcorrencia;

    procedure ListarProblemas(ASelecionar: Boolean);
    procedure AbrirTelaSenhaData;
    procedure UsuarioAdministrador;
    function AutorizacaoParaAlterarOcorrencia: Boolean;
    function AutorizacaoParaExcluirOcorrencia: Boolean;
    function TelaSenhaDataHora(ASigla: string; out AMesmoUsuario: Boolean; out AUsuarioADM: boolean): Boolean;

    procedure LimparEdits;

    procedure DadosCliente;
    procedure DadosClienteII(AObjCliente: TClienteController);
    procedure EnvioEmail(AIdChamado, AIdStatus: Integer);
    procedure ControleBotaoSalvar;
    procedure HabilitarBotoesOcorrencia;
    procedure HabilitarOcorrencia(AHabilitar: Boolean; APerfil: Integer=1);
    procedure ListarAnexos(AIdChamado: Integer);
    procedure ChamarModulo;
    procedure BuscarClienteAgendamento;
    procedure PermissaoAlterarDataHora(APermissao: Boolean);
    procedure PermissaoEdicaoOcorrencia;
    procedure BuscarTextoAgendamento;
    procedure CaminhoAnexo;
    procedure MostrarAnexo();
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False; AQuadro: Boolean = False;
      ATipo: TEnumChamadoAtividade = caChamado; AEncerrarAgenda: Boolean = False;
      AIdCliente: Integer=0; AIdAgenda: Integer=0); overload;
    constructor create(AIdChamado: Integer; AQuadro: Boolean = False;
      AOcorrencia: Boolean = False; ATipo: TEnumChamadoAtividade = caChamado; AEditar: Boolean=False); overload;
  end;

var
  frmChamado: TfrmChamado;

implementation

{$R *.dfm}

uses uGrade, uDM, uImagens, uUsuario, uCliente,
  uTipo, uTipoController, uStatusController, uStatus,
  uFiltroVisita, uPosicaoBotao, uStatusTroca,
  uClienteModuloController, uModuloController, uModulo, uParametrosController,
  uClienteEspecificacao, uChamadoModulos, uListaProblemaChamado, uUsuarioSenha,
  uChamadoDetalhes, uClienteEmailController, uEmailBase,
  uEnviarEmail, uContaEmailController, uFormProcesso, uChamadoColaborador,
  uListaAnexos, uChamadoDetalhes2, uObservacao, uObsevacaoController, uDepartamentoController;

procedure TfrmChamado.btnEditarClick(Sender: TObject);
var
  flag: Boolean;
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self, FTipoMovimento);
  PageControl1.ActivePageIndex := 0;

  HabilitarBotoesOcorrencia();

  HabilitarOcorrencia(False, 0);

  PermissaoEdicaoOcorrencia;

  UsuarioAdministrador();
  LimparEdits();
  inherited;

  DadosCliente();
  if edtNome.Enabled then
    edtNome.SetFocus;
end;

procedure TfrmChamado.btnEditarOcorrClick(Sender: TObject);
begin
  inherited;
  if dsOcorrencia.DataSet.RecordCount = 0 then
    raise Exception.Create('Não há registro para Editar!');

  if AutorizacaoParaAlterarOcorrencia() then
  begin
    dsOcorrencia.DataSet.Edit;
    edtDocumento.SetFocus;
  end;
end;

procedure TfrmChamado.btnEspecificacaoClick(Sender: TObject);
begin
  inherited;
  if FController.Model.CDSCadastroCha_Cliente.AsInteger = 0 then
  begin
    if tsPrincipal.Showing then
      edtCodCliente.SetFocus;

    raise Exception.Create('Informe o Cliente para informar as especifiações.');
  end;

  TFuncoes.CriarFormularioModal(TfrmClienteEspecificacao.create(FController.Model.CDSCadastroCha_Cliente.AsInteger));
end;

procedure TfrmChamado.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger, FTipoMovimento);
    inherited;
  end;
end;

procedure TfrmChamado.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmChamado.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  edtDataInicial.SetFocus;
end;

procedure TfrmChamado.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmChamado.btnImprimirClick(Sender: TObject);
begin
  FController.Imprimir(dm.IdUsuario);

  case FTipoMovimento of
    caChamado: RelatoriosChamados();
    caAtividade: RelatoriosAtividades();
  end;
  //inherited;
end;

procedure TfrmChamado.btnListarAnexo2Click(Sender: TObject);
begin
  inherited;
  ListarAnexos(FController.Model.CDSCadastroCha_Id.AsInteger);
end;

procedure TfrmChamado.btnListarAnexoClick(Sender: TObject);
begin
  ListarAnexos(FController.Model.CDSConsultaCha_Id.AsInteger);
end;

procedure TfrmChamado.btnListarProblemasClick(Sender: TObject);
begin
  inherited;
  ListarProblemas(True);
end;

procedure TfrmChamado.btnModulo2Click(Sender: TObject);
var
  Formulario: TfrmChamadoModulos;
begin
  if FController.Model.CDSCadastroCha_Cliente.AsInteger = 0 then
  begin
    if tsPrincipal.Showing then
      edtCodCliente.SetFocus;

    raise Exception.Create('Informe o Cliente para Visualizar os Módulos.');
  end;

  Formulario := TfrmChamadoModulos.Create(FController.Model.CDSCadastroCha_Cliente.AsInteger);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmChamado.btnModuloClick(Sender: TObject);
begin
  inherited;
  ChamarModulo();
//  TFuncoes.CriarFormularioModal(TfrmModulo.create(FController.Model.CDSCadastroCha_Cliente.AsInteger, true));
//  if dm.IdSelecionado > 0 then
//    BuscarModulo(dm.IdSelecionado, 0);
end;

procedure TfrmChamado.btnNovoClick(Sender: TObject);
begin
  dm.ConexaoBanco;
  FController.Novo(dm.IdUsuario, FTipoMovimento);
  PageControl1.ActivePageIndex := 0;
  UsuarioAdministrador();
  LimparEdits();
  inherited;

  NovoChamadoQuadro();
  TFuncoes.HabilitarCampo(Self, True);
  HabilitarBotoesOcorrencia();
  BuscarClienteAgendamento();
  BuscarTextoAgendamento();

  edtNome.SetFocus;
end;

procedure TfrmChamado.btnSalvarClick(Sender: TObject);
var
  bInclusao: Boolean;
  Id: Integer;
begin
  if FController.Model.CDSCadastro.State = dsBrowse then
    Exit;

  if dsOcorrencia.State in [dsEdit, dsInsert] then
    raise Exception.Create('Ocorrência está em Modo de Edição, Salve ou Cancele!');

  bInclusao := (FController.Model.CDSCadastro.State = dsInsert);

  Id := FController.Salvar(dm.IdUsuario, FTipoMovimento);

  if bInclusao then
  begin
    if (FOcorrencia = False) then
    begin
      if not TFuncoes.ModoDesenvolvimento() then
        EnvioEmail(FController.Model.CDSCadastroCha_Id.AsInteger, FController.Model.CDSCadastroCha_Status.AsInteger);
    end;
  end;

  if not SalvarChamadoQuadro() then
  begin
    FController.FiltrarIdChamado(Id);
//    if bInclusao then
//      FController.FiltrarCodigo(FController.CodigoAtual())
//    else
//      FController.FiltrarCodigo(FController.Model.CDSCadastroCha_Id.AsInteger);
    inherited;
  end;

  if FEncerrarAgendamento then
    dm.IdCadastro := id;
end;

procedure TfrmChamado.BuscarCliente(AId, ACodigo: Integer);
var
  obj: TClienteController;
begin
  if edtCodUsuario.Text = '' then
  begin
    FController.Model.CDSCadastroCha_Cliente.Clear;
    FController.Model.CDSCadastroCli_Codigo.Clear;
    FController.Model.CDSCadastroCli_Nome.Clear;

    raise Exception.Create('Informe o Usuário.');
  end;

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
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroCha_Cliente.AsString := obj.Model.CDSCadastroCli_Id.AsString;
    FController.Model.CDSCadastroCli_Codigo.AsString := obj.Model.CDSCadastroCli_Codigo.AsString;
    FController.Model.CDSCadastroCli_Nome.AsString := obj.Model.CDSCadastroCli_Nome.AsString;

    DadosClienteII(obj);

    if (edtCodCliente.Text = '') or ((FController.Model.CDSCadastroCha_Modulo.OldValue) <> FController.Model.CDSCadastroCha_Modulo.NewValue ) then
    begin
      FController.Model.CDSCadastroCha_Modulo.Clear;
      FController.Model.CDSCadastroMod_Codigo.Clear;
      FController.Model.CDSCadastroMod_Nome.Clear;

      FController.Model.CDSCadastroCha_Produto.Clear;
      FController.Model.CDSCadastroProd_Codigo.Clear;
      FController.Model.CDSCadastroProd_Nome.Clear;
    end;

    FreeAndNil(obj);
  end;
  edtCodCliente.Modified := False;

  if edtCodCliente.Text <> '' then
  begin
    if edtCodModulo.Text = '' then
      ChamarModulo();
  end;
end;

procedure TfrmChamado.BuscarClienteAgendamento;
begin
  if FQuadro then
  begin
    if FIdClienteAgendamento > 0 then
      BuscarCliente(FIdClienteAgendamento, 0);
  end;
end;

procedure TfrmChamado.BuscarModulo(AId, ACodigo: Integer);
var
  obj: TModuloController;
  ClienteModulo: TClienteModuloController;
begin

  if Trim(edtCodCliente.Text) = '' then
  begin
    edtCodCliente.SetFocus;
    raise Exception.Create('Informe o Cliente!');
  end;

  obj := TModuloController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, FController.Model.CDSCadastroCha_Cliente.AsInteger);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodModulo.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroCha_Modulo.AsString := obj.Model.CDSCadastroMod_Id.AsString;
    FController.Model.CDSCadastroMod_Codigo.AsString := obj.Model.CDSCadastroMod_Codigo.AsString;
    FController.Model.CDSCadastroMod_Nome.AsString := obj.Model.CDSCadastroMod_Nome.AsString;

    FreeAndNil(obj);
  end;

  // buscar produto
  if StrToIntDef(edtCodModulo.Text, 0) > 0 then
  begin
    ClienteModulo := TClienteModuloController.Create;
    try
      ClienteModulo.LocalizarModuloProduto(FController.Model.CDSCadastroCha_Cliente.AsInteger,
        FController.Model.CDSCadastroCha_Modulo.AsInteger);

      FController.Model.CDSCadastroCha_Produto.AsString := ClienteModulo.Model.CDSCadastroCliMod_Produto.AsString;
      FController.Model.CDSCadastroProd_Codigo.AsString := ClienteModulo.Model.CDSCadastroProd_Codigo.AsString;
      FController.Model.CDSCadastroProd_Nome.AsString := ClienteModulo.Model.CDSCadastroProd_Nome.AsString;
    finally
      FreeAndNil(ClienteModulo);
    end;
  end
  else begin
    FController.Model.CDSCadastroCha_Produto.Clear;
    FController.Model.CDSCadastroProd_Codigo.Clear;
    FController.Model.CDSCadastroProd_Nome.Clear;
  end;

  edtCodModulo.Modified := False;
  edtCodProduto.Modified := False;
end;

procedure TfrmChamado.BuscarObservacao(ATipo: Integer);
var
  obs: TObservacaoController;
begin
//------------------------------------------------------------------------------
// ATipo =  1-Descrição Abertura
//          2-Descrição Técnica
//          3-Descrição Solução

  if (ATipo = 1) and (DBMemo1.Enabled = False) then
    Exit;

  if (ATipo = 2) and (mmoTecnica.Enabled = False) then
    Exit;

  if (ATipo = 3) and (mmoSolucao.Enabled = False) then
    Exit;


  if FTipoMovimento = caChamado then
    TFuncoes.CriarFormularioModal(TfrmObservacao.create(true, prChamado))
  else
    TFuncoes.CriarFormularioModal(TfrmObservacao.create(true, prAtividade));

  if dm.IdSelecionado > 0 then
  begin
    FController.ModoEdicaoInsercao;
    obs := TObservacaoController.Create;
    try
      obs.LocalizarId(dm.IdSelecionado);
      if ATipo = 1 then
      begin
        FController.Model.CDSCadastroCha_Descricao.AsString :=
        FController.Model.CDSCadastroCha_Descricao.AsString + ' ' + obs.Model.CDSCadastroObs_Descricao.AsString;
      end
      else if ATipo = 2 then
      begin
        FController.ModoEdicaoInsercaoOcorrencia;
        FController.Model.CDSChamadoOcorrenciaConsChOco_DescricaoTecnica.AsString :=
        FController.Model.CDSChamadoOcorrenciaConsChOco_DescricaoTecnica.AsString + ' ' + obs.Model.CDSCadastroObs_Descricao.AsString;
      end
      else begin
        FController.ModoEdicaoInsercaoOcorrencia;
        FController.Model.CDSChamadoOcorrenciaConsChOco_DescricaoSolucao.AsString :=
        FController.Model.CDSChamadoOcorrenciaConsChOco_DescricaoSolucao.AsString + ' ' + obs.Model.CDSCadastroObs_Descricao.AsString;
      end;
    finally
      FreeAndNil(obs);
    end;
  end;
end;


//procedure TfrmChamado.BuscarStatus(Id, Codigo: Integer);
//var
//  obj: TStatusController;
//begin
//  obj := TStatusController.Create;
//  try
//    try
//      obj.Pesquisar(Id, Codigo, prChamado);
//    except
//      On E: Exception do
//      begin
//        ShowMessage(E.Message);
//        edtCodStatus.SetFocus;
//      end;
//    end;
//  finally
//    FController.ModoEdicaoInsercao();
//    FController.Model.CDSCadastroCha_Status.AsString := obj.Model.CDSCadastroSta_Id.AsString;
//    FController.Model.CDSCadastroSta_Codigo.AsString := obj.Model.CDSCadastroSta_Codigo.AsString;
//    FController.Model.CDSCadastroSta_Nome.AsString := obj.Model.CDSCadastroSta_Nome.AsString;
//
//    FreeAndNil(obj);
//  end;
//  edtCodStatus.Modified := False;
//end;

procedure TfrmChamado.BuscarTextoAgendamento;
var
  obj: TAgendamentoController;
begin
  if FIdAgendamento > 0 then
  begin
    obj := TAgendamentoController.Create;
    try
      obj.LocalizarId(FIdAgendamento);
      FController.Model.CDSCadastroCha_Descricao.AsString := obj.Model.CDSCadastroAge_Descricao.AsString;
      FController.Model.CDSCadastroCha_DataAbertura.AsDateTime := obj.Model.CDSCadastroAge_Data.AsDateTime;
    finally
      FreeAndNil(obj);
    end;
  end;
end;

procedure TfrmChamado.BuscarTipo(AId, ACodigo: Integer);
var
  obj: TTipoController;
  prTipo: TEnumPrograma;
begin
  case FTipoMovimento of
    caChamado  : prTipo := prChamado;
    caAtividade: prTipo := prAtividade;
  end;

  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prTipo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodTipo.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroCha_Tipo.AsString := obj.Model.CDSCadastroTip_Id.AsString;
    FController.Model.CDSCadastroTip_Codigo.AsString := obj.Model.CDSCadastroTip_Codigo.AsString;
    FController.Model.CDSCadastroTip_Nome.AsString := obj.Model.CDSCadastroTip_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodTipo.Modified := False;
end;

procedure TfrmChamado.BuscarUsuario(AId, ACodigo: Integer);
var
  obj: TUsuarioController;
begin
  obj := TUsuarioController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroCha_UsuarioAbertura.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
    FController.Model.CDSCadastroUsu_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
    FController.Model.CDSCadastroUsu_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;

    FController.Model.CDSCadastroCha_Cliente.Clear;
    FController.Model.CDSCadastroCli_Codigo.Clear;
    FController.Model.CDSCadastroCli_Nome.Clear;

    FreeAndNil(obj);
  end;
  edtCodUsuario.Modified := False;
  edtCodCliente.Modified := False;
end;

procedure TfrmChamado.CaminhoAnexo;
var
  parametros: TParametrosController;
begin
  parametros := TParametrosController.Create;
  try
    FCaminhoAnexo := parametros.CaminhoAnexos();
  finally
    FreeAndNil(parametros);
  end;
end;

function TfrmChamado.CancelarOcorrencia: Boolean;
begin
  Result := False;
  if (tsEdicao.Showing) and (tsChamadoOcorrencia.Showing) then
  begin
    if dsOcorrencia.State in [dsEdit, dsInsert] then
    begin
      if btnCancelarOcorrencia.Enabled then
      begin
        btnCancelarOcorrenciaClick(Self);
        Result := True;
      end;
    end;
  end;

end;

constructor TfrmChamado.create(APesquisar, AQuadro: Boolean; ATipo:
  TEnumChamadoAtividade; AEncerrarAgenda: Boolean; AIdCliente: Integer;
  AIdAgenda: Integer);
begin
  inherited create(nil);
  Iniciar(APesquisar, ATipo);
  FQuadro := AQuadro;
  FEncerrarAgendamento := AEncerrarAgenda;
  FIdClienteAgendamento := AIdCliente;
  FIdAgendamento := AIdAgenda;
end;

procedure TfrmChamado.AbrirTelaSenhaData;
var
  PodeAlterar: Boolean;
  Usuario: TUsuarioController;
  Id: Integer;
  bMesmoUsuario: Boolean;
  bUsuarioADM: Boolean;
begin
  inherited;
  if (btnNovoOcorrencia.Enabled = False) and
     (btnEditarOcorr.Enabled = False) and
     (btnSalvarOcorrencia.Enabled = False) and
     (btnExcluirOcorrencia.Enabled = False) and
     (btnCancelarOcorrencia.Enabled = False)  then
      Exit;


  PodeAlterar := False;
  bMesmoUsuario := False;

  EditarDBEdit(edtDocumento, False);
  EditarDBEdit(edtVersao, False);
  EditarMemo(mmoSolucao, False);
  EditarMemo(mmoTecnica, False);
  btnColaborar.Enabled := False;

  Usuario := TUsuarioController.Create;
  try
    Id := FController.Model.CDSChamadoOcorrenciaConsChOco_Id.AsInteger;
    bUsuarioADM := Usuario.UsuarioADM(dm.IdUsuario);
//    bUsuarioADM := Usuario.UsuarioADMLocal(dm.IdUsuario);

    if bUsuarioADM then
      PodeAlterar := True
    else begin
      if FTipoMovimento = caChamado then
      begin
        if Usuario.PermissaoChamadoOcorrenciaDataHora(dm.IdUsuario, Id, bMesmoUsuario) = False then
//        if Usuario.PermissaoChamadoOcorrenciaDataHora(dm.IdUsuario, FController.Model.CDSChamadoOcorrenciaConsChOco_Usuario.AsInteger,  Id, bMesmoUsuario) = False then
          PodeAlterar := TelaSenhaDataHora('Lib_Chamado_Ocorr_Alt_Data_Hora', bMesmoUsuario, bUsuarioADM)
        else begin
          PodeAlterar := True;
        end;
      end
      else begin
        if Usuario.PermissaoAtividadeOcorrenciaDataHora(dm.IdUsuario, Id, bMesmoUsuario) = False then
          PodeAlterar := TelaSenhaDataHora('Lib_Atividade_Ocorr_Alt_Data_Hora', bMesmoUsuario, bUsuarioADM)
        else begin
          PodeAlterar := True;
        end;
      end;
    end;
  finally
    FreeAndNil(Usuario);
  end;

  if PodeAlterar then
  begin
    FController.ModoEdicaoInsercaoOcorrencia;
    EditarDBEdit(edtData, True);
    EditarDBEdit(edtHoraInicial, True);
    EditarDBEdit(edtHoraFinal, True);

    if bMesmoUsuario then
      bUsuarioADM := True;

    if (bUsuarioADM) then
    begin
      EditarDBEdit(edtDocumento, True);
      EditarDBEdit(edtVersao, True);
      EditarMemo(mmoSolucao, True);
      EditarMemo(mmoTecnica, true);
      btnColaborar.Enabled := True;

      edtDocumento.Enabled := True;
      edtVersao.Enabled := True;
      mmoSolucao.Enabled :=  True;
      mmoTecnica.Enabled :=  True;

    end;
    btnNovoOcorrencia.Enabled := False;
    btnEditarOcorr.Enabled := False;
    btnSalvarOcorrencia.Enabled := True;
    btnExcluirOcorrencia.Enabled := False;
    btnCancelarOcorrencia.Enabled := True;
  end;
end;

procedure TfrmChamado.btnAnexarClick(Sender: TObject);
begin
  inherited;
  if FController.OcorrenciaEstadoEdicaoInsercao = False then
    Exit;

  dlgAbrirArquivo.InitialDir := FCaminhoAnexo;
  if dlgAbrirArquivo.Execute then
  begin
    if Trim(dlgAbrirArquivo.FileName) = '' then
      raise Exception.Create('Informe o Nome do Arquivo.');

    FController.ModoEdicaoInsercaoOcorrencia;
    FController.Model.CDSChamadoOcorrenciaConsChOco_Anexo.AsString := dlgAbrirArquivo.FileName;
  end;
end;

procedure TfrmChamado.btnBuscarClienteClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmCliente)) then
    TFuncoes.CriarFormulario(TfrmCliente.create(DM.IdUsuario));
end;

procedure TfrmChamado.btnCancelarClick(Sender: TObject);
begin
  if FQuadro then
    Close
  else
    inherited;
end;

procedure TfrmChamado.btnCancelarOcorrenciaClick(Sender: TObject);
begin
  inherited;
  FController.CancelarOcorrencia;
end;

procedure TfrmChamado.btnClienteClick(Sender: TObject);
begin
  inherited;
  if edtCodUsuario.Text = '' then
    raise Exception.Create('Informe o Consultor.');

  TFuncoes.CriarFormularioModal(TfrmCliente.create(FController.Model.CDSCadastroCha_UsuarioAbertura.AsInteger ,true));
  if dm.IdSelecionado > 0 then
    BuscarCliente(dm.IdSelecionado, 0);
end;

procedure TfrmChamado.btnColaborarClick(Sender: TObject);
var
  Formulario: TfrmChamadoColaborador;
begin
  try
    Formulario := TfrmChamadoColaborador.create(FController.Model.CDSChamadoOcorrenciaConsChOco_Id.AsInteger, FController, FController.ListaColaboradores);
    if Formulario.ShowModal = mrOk then
      TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmChamado.btnConsultaDescricaoClick(Sender: TObject);
begin
  inherited;
  ListarProblemas(False);
end;

procedure TfrmChamado.btnDetalhes2Click(Sender: TObject);
var
  Formulario: TfrmChamadoDetalhes2;
begin
  if FController.Model.CDSConsulta.RecordCount = 0 then
    raise Exception.Create('Não há Registros para Visualizar!');

  Formulario := TfrmChamadoDetalhes2.create(FController.Model.CDSConsultaCha_Id.AsInteger, FTipoMovimento);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmChamado.btnDetalhesClick(Sender: TObject);
var
  Formulario: TfrmChamadoDetalhes2;
begin
  Formulario := TfrmChamadoDetalhes2.create(FController.Model.CDSCadastroCha_Id.AsInteger, FTipoMovimento);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmChamado.btnExcluirOcorrenciaClick(Sender: TObject);
begin
  inherited;
  if dsOcorrencia.DataSet.RecordCount = 0 then
    raise Exception.Create('Não há registro para Editar!');

  if AutorizacaoParaExcluirOcorrencia() then
  begin
    if TFuncoes.Confirmar('Excluir Registro?') then
    begin
      FController.ExcluirOcorrencia();
      FController.ModoEdicaoInsercao();
    end;
  end;
end;

procedure TfrmChamado.btnNovoOcorrenciaClick(Sender: TObject);
var
  Cliente: TClienteController;
begin
  inherited;
  HabilitarOcorrencia(True, 0);

  NovoOcorrencia();

//  NovaOcorrencia;
  FController.Model.CDSChamadoOcorrenciaCons.Last;

  if edtDocumento.Enabled then
    edtDocumento.SetFocus;

  FController.Model.CDSChamadoOcorrenciaCons.Append;
//  if FTipoMovimento = caAtividade then
//    FController.Model.CDSChamadoOcorrenciaConsChOco_HoraInicio.AsDateTime := Time;

  FController.NovoOcorrencia;

//------------------------------------------------------------------------------
  Cliente := TClienteController.Create;
  try
    Cliente.LocalizarId(FController.Model.CDSCadastroCha_Cliente.AsInteger);
    DadosClienteII(Cliente);
    FController.Model.CDSChamadoOcorrenciaConsChOco_Versao.AsString := Cliente.Model.CDSCadastroCli_Versao.AsString;
  finally
    FreeAndNil(Cliente);
  end;

end;

procedure TfrmChamado.btnSalvarOcorrenciaClick(Sender: TObject);
begin
  if SalvarOcorrencia then
    inherited;
end;

procedure TfrmChamado.btnTipoClick(Sender: TObject);
var
  prTipo: TEnumPrograma;
begin
  inherited;
  case FTipoMovimento of
    caChamado  : prTipo := prChamado;
    caAtividade: prTipo := prAtividade;
  end;

  TFuncoes.CriarFormularioModal(TfrmTipo.create(prTipo, true));
  if dm.IdSelecionado > 0 then
    BuscarTipo(dm.IdSelecionado, 0);
end;

procedure TfrmChamado.btnVisualizarClick(Sender: TObject);
begin
  inherited;
  TFuncoes.VisualizarArquivo(edtNomeArquivo.Text);
end;

procedure TfrmChamado.cbbCamposChange(Sender: TObject);
begin
  inherited;
  lblMensagem.Visible := TFuncoes.MostrarDescricaoPesquisaData(cbbCampos.Text);
end;

procedure TfrmChamado.cbbModeloClick(Sender: TObject);
var
  iOpcao: integer;
  bVisivel: Boolean;
begin
  inherited;
  if cbbModelo.ItemIndex > 0 then
  begin
    iOpcao := StrToIntDef(Copy(cbbModelo.Text, 1,2),0);
    bVisivel := True;

    if (iOpcao = 6) or (iOpcao = 7) then
      bVisivel := False;

    lblOrdemRelatorio.Visible := bVisivel;
    cbbOrdemRelatorio.Visible := bVisivel;

    case iOpcao of
      2: OrdemRelatorioModelo02;
      3: OrdemRelatorioModelo03;
      4: OrdemRelatorioModelo04;
      5: OrdemRelatorioModelo05;
      8: OrdemRelatorioModelo08;
    end;
  end
  else begin
    lblOrdemRelatorio.Visible := False;
    cbbOrdemRelatorio.Visible := False;
  end;
end;

procedure TfrmChamado.ChamarModulo;
begin
  TFuncoes.CriarFormularioModal(TfrmModulo.create(FController.Model.CDSCadastroCha_Cliente.AsInteger, true, True));
  if dm.IdSelecionado > 0 then
    BuscarModulo(dm.IdSelecionado, 0);
end;

procedure TfrmChamado.ControleBotaoSalvar;
begin
  btnSalvar.Enabled := (btnSalvarOcorrencia.Enabled = False) and (FController.Model.CDSCadastro.State in [dsEdit, dsInsert]);
end;

constructor TfrmChamado.create(AIdChamado: Integer; AQuadro, AOcorrencia: Boolean; ATipo: TEnumChamadoAtividade;
  AEditar: Boolean);
begin
  inherited create(nil);
  Iniciar(Pesquisa, ATipo);
  FController.FiltrarIdChamado(AIdChamado);
  FQuadro := AQuadro;
  FOcorrencia := True;
  FEditar := AEditar;
end;

procedure TfrmChamado.HabilitarBotoesOcorrencia;
var
  bPermissao: Boolean;
begin
  bPermissao := edtCodCliente.Enabled;
  btnNovoOcorrencia.Enabled := bPermissao;
  btnEditarOcorr.Enabled := bPermissao;
  btnSalvarOcorrencia.Enabled := bPermissao;
  btnExcluirOcorrencia.Enabled := bPermissao;
  btnCancelarOcorrencia.Enabled := bPermissao;
end;

procedure TfrmChamado.HabilitarOcorrencia(AHabilitar: Boolean; APerfil: Integer);
var
  Perfil: Boolean;
begin
  Perfil := (APerfil = 1);
  edtDocumento.ReadOnly := not AHabilitar;

  edtData.Enabled := true;
  edtData.ReadOnly :=  not Perfil;
  edtHoraInicial.Enabled := true;
  edtHoraInicial.ReadOnly := not Perfil;
  edtHoraFinal.Enabled := true;
  edtHoraFinal.ReadOnly := not Perfil;

  edtVersao.ReadOnly := not AHabilitar;
  mmoTecnica.ReadOnly := not AHabilitar;
  mmoSolucao.ReadOnly := not AHabilitar;
  edtNomeArquivo.Enabled := AHabilitar;
  edtNomeArquivo.ReadOnly := not AHabilitar;
  btnAnexar.Enabled := AHabilitar;
  btnVisualizar.Enabled := AHabilitar;
end;

procedure TfrmChamado.DadosAtividade;
begin
  Self.Caption := 'Atividades';
  cbbModelo.Clear;
  cbbModelo.Items.Add('01 - Atividade por Cliente');
  cbbModelo.Items.Add('02 - Resumo de Horas por Cliente');
  cbbModelo.Items.Add('03 - Resumo de Ocorrências por Usuário');
  cbbModelo.Items.Add('04 - Resumo de Horas por Tipo');
//  cbbModelo.Items.Add('05 - Estatísticas');
  cbbModelo.Items.Add('06 - Resumo de Horas por Tipo Mês');
  cbbModelo.Items.Add('07 - Resumo de Ocorrências por Usuário Mês');
  cbbModelo.ItemIndex := 0;
end;

procedure TfrmChamado.DadosChamado;
begin
  Self.Caption := 'Chamados';
  cbbModelo.Clear;
  cbbModelo.Items.Add('01 - Chamado por Cliente');
  cbbModelo.Items.Add('02 - Resumo de Horas por Cliente');
  cbbModelo.Items.Add('03 - Resumo de Ocorrências por Usuário');
  cbbModelo.Items.Add('04 - Resumo de Horas por Tipo');
  cbbModelo.Items.Add('05 - Estatísticas');
  cbbModelo.Items.Add('06 - Resumo de Horas por Tipo Mês');
  cbbModelo.Items.Add('07 - Resumo de Ocorrências por Usuário Mês');
  cbbModelo.Items.Add('08 - Resumo de Ocorrências por Perfil de Cliente');
  cbbModelo.ItemIndex := 0;
end;

procedure TfrmChamado.DadosCliente;
var
  obj: TClienteController;
begin
  obj := TClienteController.Create;
  try
    obj.LocalizarId(FController.Model.CDSCadastroCha_Cliente.AsInteger);
    DadosClienteII(obj);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TfrmChamado.DadosClienteII(AObjCliente: TClienteController);
begin
  LimparEdits();

  mmoCliente.Clear;
  mmoCliente.Lines.Add('Id..........: ' + FormatFloat('000000',FController.Model.CDSCadastroCha_Id.AsFloat));
  mmoCliente.Lines.Add('Razão Social: ' + AObjCliente.Model.CDSCadastroCli_Nome.AsString);
  mmoCliente.Lines.Add('Fantasia....: ' + AObjCliente.Model.CDSCadastroCli_Fantasia.AsString);

  if AObjCliente.Model.CDSCadastroRev_Codigo.AsInteger > 0 then
    mmoCliente.Lines.Add('Revenda.....: ' + AObjCliente.Model.CDSCadastroRev_Nome.AsString);

  if AObjCliente.Model.CDSCadastroUsu_Codigo.AsInteger > 0 then
    mmoCliente.Lines.Add('Consultor...: ' + AObjCliente.Model.CDSCadastroUsu_Nome.AsString);

  mmoCliente.Lines.Add('Fone1.......: ' + AObjCliente.Model.CDSCadastroCli_Fone1.AsString);
  mmoCliente.Lines.Add('Fone2.......: ' + AObjCliente.Model.CDSCadastroCli_Fone2.AsString);
  mmoCliente.Lines.Add('Celular.....: ' + AObjCliente.Model.CDSCadastroCli_Celular.AsString);
  mmoCliente.Lines.Add('Outro Fone..: ' + AObjCliente.Model.CDSCadastroCli_FoneOutro.AsString);
  mmoCliente.Lines.Add('Contato Financeiro....: ' + AObjCliente.Model.CDSCadastroCli_ContatoFinanceiro.AsString);
  mmoCliente.Lines.Add('Contato Compra/Venda..: ' + AObjCliente.Model.CDSCadastroCli_ContatoCompraVenda.AsString);

  mmoCliente2.Text := mmoCliente.Text;

end;

function TfrmChamado.AutorizacaoParaAlterarOcorrencia: Boolean;
var
  Formulario: TfrmUsuarioSenha;
  Usuario: TUsuarioController;
  Id: Integer;
  bResult: Boolean;
  Perfil: Integer;
  sSigla: string;
  iIdUsuario: Integer;
  bUsuarioADM: Boolean;
begin
  iIdUsuario := 0;
  Id := FController.Model.CDSChamadoOcorrenciaConsChOco_Id.AsInteger;
  bResult := False;
  Usuario := TUsuarioController.Create;
  try
    Perfil := 0;
    bUsuarioADM := Usuario.UsuarioADM(DM.IdUsuario);
    if bUsuarioADM then
      bResult := True;

    if bResult = false then
    begin
      if FTipoMovimento = caChamado then
        bResult := Usuario.PermissaoChamadoOcorrenciaAlterar(dm.IdUsuario, Id, Perfil)
      else
        bResult := Usuario.PermissaoAtividadeOcorrenciaAlterar(dm.IdUsuario, Id, Perfil);



      if (FController.Model.CDSChamadoOcorrenciaConsChOco_Usuario.AsInteger = dm.IdUsuario) then
        bResult := True;

      if bResult = False then
        raise Exception.Create('Somente o mesmo usuário que lançou ou Administrador poderá Editar!');
    end;

    HabilitarOcorrencia(bResult, 0);

    if bUsuarioADM then
    begin
      EditarDBEdit(edtData, True);
      EditarDBEdit(edtHoraInicial, True);
      EditarDBEdit(edtHoraFinal, True);
    end
    else begin
      if bResult then
        NovoOcorrencia();
    end;

    Result := bResult;

  finally
    FreeAndNil(Usuario);
  end;
end;

function TfrmChamado.AutorizacaoParaExcluirOcorrencia: Boolean;
var
  Usuario: TUsuarioController;
  Id: Integer;
  bPermissao: Boolean;
begin
  Result := True;

  Id := FController.Model.CDSChamadoOcorrenciaConsChOco_Id.AsInteger;
  Usuario := TUsuarioController.Create;
  try
    if FTipoMovimento = caChamado then
      bPermissao := Usuario.PermissaoChamadoOcorrenciaExcluir(dm.IdUsuario, Id)
    else
      bPermissao := Usuario.PermissaoAtividadeOcorrenciaExcluir(dm.IdUsuario, Id);

    if bPermissao = False then
      raise Exception.Create('Somente o mesmo usuário que lançou ou Administrador poderá Excluir!');

  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TfrmChamado.dbDadosDblClick(Sender: TObject);
begin
  try
    inherited;
  except
    On E: Exception do
    begin
      raise Exception.Create(E.Message);
    // nada
    end;
  end;
end;

procedure TfrmChamado.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    try
      dbDadosDblClick(Self);
      if edtCodigo.Enabled then
        edtCodigo.SetFocus;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      // nada
      end;
    end;
  end;
end;

procedure TfrmChamado.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmChamado.edtNomeArquivoKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    SalvarOcorrencia;
  end;
end;

procedure TfrmChamado.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmChamado.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmChamado.DBMemo1KeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  if Key = VK_F8 then
  begin
    if btnSalvar.Enabled then
    begin
      btnSalvar.SetFocus;
      btnSalvarClick(Self);
    end;
  end;

  if Key = VK_F9 then
    BuscarObservacao(1);

  if Key = VK_ESCAPE then
    btnCancelarClick(Self);
end;

procedure TfrmChamado.dbOcorrenciaDrawColumnCell(Sender: TObject; const Rect:
    TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsOcorrencia.DataSet, dbOcorrencia, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmChamado.dbOcorrenciaKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmChamado.dbStatusDrawColumnCell(Sender: TObject; const Rect:
    TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsStatus.DataSet, dbStatus, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmChamado.dbStatusKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmChamado.dsCadStateChange(Sender: TObject);
begin
  inherited;
  btnConsultaDescricao.Enabled := dsCad.DataSet.State in [dsEdit, dsBrowse];
end;

procedure TfrmChamado.dsOcorrenciaStateChange(Sender: TObject);
begin
  inherited;
   dbOcorrencia.Enabled := (dsOcorrencia.DataSet.State = dsBrowse);
  if edtDocumento.Enabled then
  begin
    btnCancelarOcorrencia.Enabled := dsOcorrencia.DataSet.State in [dsEdit, dsInsert];
    btnSalvarOcorrencia.Enabled := dsOcorrencia.DataSet.State in [dsEdit, dsInsert];
    btnExcluirOcorrencia.Enabled := dsOcorrencia.DataSet.State in [dsBrowse];
    btnEditarOcorr.Enabled := dsOcorrencia.DataSet.State in [dsBrowse];
    btnNovoOcorrencia.Enabled := dsOcorrencia.DataSet.State in [dsBrowse];
    btnAnexar.Enabled := dsOcorrencia.DataSet.State in [dsEdit, dsInsert];
    btnColaborar.Enabled := dsOcorrencia.DataSet.State in [dsEdit, dsInsert];

    if FQuadro = False then
    begin
      if FController.Model.CDSChamadoOcorrenciaConsChOco_Id.AsInteger <= 0 then
//        btnColaborar.Enabled := False;
    end;


    if dsOcorrencia.State in [dsEdit, dsInsert] then
      FController.ModoEdicaoInsercao;

    ControleBotaoSalvar();
  end;
end;

procedure TfrmChamado.EditarDBEdit(var AdbEdit: TDBEdit; AEditar: Boolean);
begin
  if AEditar then
  begin
    AdbEdit.ReadOnly  := False;
    AdbEdit.Color     := clWhite;
    AdbEdit.TabStop   := True;
  end
  else begin
    AdbEdit.ReadOnly  := True;
    AdbEdit.Color     := clBtnFace;
    AdbEdit.TabStop   := False;
  end;
end;

procedure TfrmChamado.EditarMemo(var AMemo: TDBMemo; AEditar: Boolean);
begin
  if AEditar then
  begin
    AMemo.ReadOnly  := False;
    AMemo.Color     := clWhite;
    AMemo.TabStop   := True;
  end
  else begin
    AMemo.ReadOnly  := True;
    AMemo.Color     := clBtnFace;
    AMemo.TabStop   := False;
  end;
end;

procedure TfrmChamado.EditarOcorrencia;
begin
  if (tsEdicao.Showing) and (tsChamadoOcorrencia.Showing) then
  begin
    if btnEditarOcorr.Enabled then
      btnEditarOcorrClick(Self);
  end;
end;

procedure TfrmChamado.edtCodClienteExit(Sender: TObject);
begin
  inherited;
  if edtCodCliente.Modified then
    BuscarCliente(0, StrToIntDef(edtCodCliente.Text, 0));
end;

procedure TfrmChamado.edtCodClienteKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
  begin
    if Sender = edtCodCliente then
      btnClienteClick(Self)
    else if Sender = edtCodTipo then
      btnTipoClick(Self)
    else if Sender = edtCodModulo then
      btnModuloClick(Self);
  end;
end;

procedure TfrmChamado.edtCodModuloExit(Sender: TObject);
begin
  inherited;
  if edtCodModulo.Modified then
    BuscarModulo(0, StrToIntDef(edtCodModulo.Text, 0));
end;

procedure TfrmChamado.edtCodTipoExit(Sender: TObject);
begin
  inherited;
  if edtCodTipo.Modified then
    BuscarTipo(0, StrToIntDef(edtCodTipo.Text, 0));
end;

procedure TfrmChamado.edtCodUsuarioExit(Sender: TObject);
begin
  inherited;
  if edtCodUsuario.Modified then
    BuscarUsuario(0, StrToIntDef(edtCodUsuario.Text, 0));
end;

procedure TfrmChamado.edtDataDblClick(Sender: TObject);
begin
  inherited;
  AbrirTelaSenhaData();
end;

procedure TfrmChamado.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
  begin
    Localizar(edtDescricao.Text);
  end;
end;

procedure TfrmChamado.edtIdFiltroExit(Sender: TObject);
begin
  inherited;
  if edtIdFiltro.Modified then
  begin
    edtIdFiltro.Text := FormatFloat('000000', StrToFloatDef(edtIdFiltro.Text, 0));
    edtIdFiltro.Modified := False;
  end;
end;

//procedure TfrmChamado.EntrarChamadoOcorrencia;
//begin
//  if FOcorrencia then
//    btnNovoOcorrenciaClick(Self);
//end;

procedure TfrmChamado.EntrarChamadoQuadro;
begin
  // se usar quadro, ja abre no modo inclusao
  if (FQuadro) and (FOcorrencia = False) then
  begin
    tsChamadoOcorrencia.TabVisible := False;
    btnNovoClick(Self);
  end;

  // se usar quadro e ocorrencia, abrir ocorrencia em inclusao.
  if (FQuadro) and (FOcorrencia) then
  begin
    btnEditarClick(Self);
    tsPrincipal.TabVisible := False;

    if btnNovoOcorrencia.Enabled then
      btnNovoOcorrenciaClick(Self);
  end;

end;

function TfrmChamado.EntrarTelaStatus: Boolean;
var
  form: TfrmStatusTroca;
  bOk: Boolean;
  prTipo: TEnumPrograma;
begin
  case FTipoMovimento of
    caChamado: prTipo   := prChamado;
    caAtividade: prTipo := prAtividade;
  end;

  bOk := False;
  form := TfrmStatusTroca.Create(prTipo, FController.Model.CDSCadastroCha_Tipo.AsInteger);
  try
    if form.ShowModal = mrOk then
    begin
      FController.ModoEdicaoInsercao();
      FController.Model.CDSCadastroCha_Status.AsString := form.edtIdStatus.Text;
      FController.Model.CDSCadastroSta_Codigo.AsString := form.edtCodStatus.Text;
      FController.Model.CDSCadastroSta_Nome.AsString := form.edtNome.Text;

      if StrToIntDef(form.edtIdTipo.Text, 0) > 0 then
      begin
        FController.Model.CDSCadastroCha_Tipo.AsString := form.edtIdTipo.Text;
        FController.Model.CDSCadastroTip_Codigo.AsString := form.edtCodTipo.Text;
        FController.Model.CDSCadastroTip_Nome.AsString := form.edtNomeTipo.Text;
      end;

      bOk := True;
    end;
  finally
    FreeAndNil(form);
  end;
  Result := bOk;
end;

procedure TfrmChamado.EnviarEmail1Click(Sender: TObject);
begin
  inherited;
  if TFuncoes.Confirmar('Confirmar o envio de email?') then
  begin
    EnvioEmail(FController.Model.CDSConsultaCha_Id.AsInteger,
               FController.Model.CDSConsultaCha_Status.AsInteger);
  end;
end;

procedure TfrmChamado.EnvioEmail(AIdChamado, AIdStatus: Integer);
var
  objEmailChamado: TEmailChamado;
  sEmail: string;
  sEmailCliente: string;
  objContaEmail: TContaEmailController;
  sTexto: string;
  sAssunto: string;
begin
  objContaEmail := TContaEmailController.Create;
  objEmailChamado := TEmailChamado.Create;
  try
    sEmail := objEmailChamado.RetornarListaEmail(AIdChamado,
                                                 dm.IdUsuario,
                                                 AIdStatus);

    sEmailCliente := objEmailChamado.RetornarListaEmailCliente(AIdChamado);

    if sEmailCliente = '' then
      sEmailCliente := sEmail;

    if (sEmailCliente <> '') then
    begin
      if FTipoMovimento = caChamado then
      begin
        sTexto   := objEmailChamado.TextoEmailChamado(AIdChamado);
        sAssunto := objEmailChamado.RetornarAssunto(AIdChamado);
      end
      else begin
        sTexto   := objEmailChamado.TextoEmailAtividade(AIdChamado);
        sAssunto := objEmailChamado.RetornarAssuntoAtividade(AIdChamado);
      end;

      objContaEmail.EnviarEmail(DM.IdUsuario,
                                sEmailCliente,
                                sEmail,
                                sAssunto,
                                sTexto,
                                '');
    end;
  finally
    FreeAndNil(objContaEmail);
    FreeAndNil(objEmailChamado);
  end;
end;

procedure TfrmChamado.ExcluirOcorrencia;
begin
  if (tsEdicao.Showing) and (tsChamadoOcorrencia.Showing) then
  begin
    if btnExcluirOcorrencia.Enabled then
      btnExcluirOcorrenciaClick(Self);
  end;
end;

procedure TfrmChamado.FormDestroy(Sender: TObject);
begin
  inherited;
  if Assigned(FController) then
    FreeAndNil(FController);
end;

procedure TfrmChamado.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if CancelarOcorrencia then
      Exit;
  end;

  if Key = VK_F8 then
  begin
    if SalvarChamadoOcorrencia() then
      Exit;
  end;

  inherited;
  TeclasAtalho(Key, Shift);
end;

procedure TfrmChamado.FormShow(Sender: TObject);
var
  Img: TfrmImagens;
  Botao: TPosicaoBotao;
  iPosicao: Integer;
  PermissaoChamado: TPermissaoChamadoAtividade;
begin
  inherited;
  Img := TfrmImagens.Create(Self);
  try
    btnCliente.Glyph := Img.btnProcurar.Glyph;
    btnTipo.Glyph := Img.btnProcurar.Glyph;
    btnModulo.Glyph := Img.btnProcurar.Glyph;
    btnAnexar.Glyph := Img.btnAnexar.Glyph;
    btnVisualizar.Glyph := Img.btnExportar.Glyph;

    btnNovoOcorrencia.Glyph := Img.btnNovoItem.Glyph;
    btnEditarOcorr.Glyph := img.btnEditar.Glyph;
    btnExcluirOcorrencia.Glyph := Img.btnExcluirItem.Glyph;
    btnCancelarOcorrencia.Glyph := Img.btnCancelarItem.Glyph;
    btnSalvarOcorrencia.Glyph := Img.btnSalvar.Glyph;
    btnEspecificacao.Glyph := Img.btnEspecificacao.Glyph;
    btnModulo2.Glyph := Img.btnNovo.Glyph;
    btnConsultaDescricao.Glyph := Img.btnSolucao.Glyph;
    btnListarProblemas.Glyph := Img.btnSolucao.Glyph;
    btnDetalhes.Glyph := Img.btnDetalhe.Glyph;
    btnDetalhes2.Glyph := Img.btnDetalhe.Glyph;
    btnColaborar.Glyph := Img.btnColaborador.Glyph;
    btnListarAnexo.Glyph := Img.btnExportar.Glyph;
    btnListarAnexo2.Glyph := Img.btnExportar.Glyph;

    btnBuscarCliente.Glyph := Img.btnFiltro.Glyph;
  finally
    FreeAndNil(Img);
  end;

  Edit1.SendToBack;

  if FTipoMovimento = caChamado then
  begin
    PermissaoChamado := FController.PermissoesChamado(DM.IdUsuario);
    try
      tsPrincipal.TabVisible := PermissaoChamado.Abertura;
      tsChamadoOcorrencia.TabVisible := PermissaoChamado.Ocorrencia;
      tsStatus.TabVisible := PermissaoChamado.Status;
      pnlAbertura.Visible := tsPrincipal.TabVisible;
    finally
      FreeAndNil(PermissaoChamado);
    end;
  end
  else begin
    PermissaoChamado := FController.PermissoesAtividade(DM.IdUsuario);
    try
      tsPrincipal.TabVisible := PermissaoChamado.Abertura;
      tsChamadoOcorrencia.TabVisible := PermissaoChamado.Ocorrencia;
      tsStatus.TabVisible := PermissaoChamado.Status;
      pnlAbertura.Visible := tsPrincipal.TabVisible;
    finally
      FreeAndNil(PermissaoChamado);
    end;

    btnConsultaDescricao.Visible := False;
    btnListarProblemas.Visible := False;
  end;

  iPosicao := 528;
  Botao := TPosicaoBotao.Create(btnNovoOcorrencia, iPosicao, 544);
  try
    Botao.PosicaoBotao(btnEditarOcorr);
    Botao.PosicaoBotao(btnSalvarOcorrencia);
    Botao.PosicaoBotao(btnExcluirOcorrencia);
    Botao.PosicaoBotao(btnCancelarOcorrencia);
  finally
    FreeAndNil(Botao);
  end;
//------------------------------------------------------------------------------
// Pesquisa
//  iPosicao := 139;
  iPosicao := 6;

  Botao := TPosicaoBotao.Create(btnPrimeiro, iPosicao, 6, True);
  try
    Botao.PosicaoBotaoNavegacao(btnAnterior);
    Botao.PosicaoBotaoNavegacao(btnProximo);
    Botao.PosicaoBotaoNavegacao(btnUltimo);
    Botao.PosicaoBotao(btnNovo);
    Botao.PosicaoBotao(btnEditar);
    Botao.PosicaoBotao(btnExcluir);
    Botao.PosicaoBotao(btnFiltrar);
    Botao.PosicaoBotao(btnListarProblemas);
    Botao.PosicaoBotao(btnDetalhes2);
    Botao.PosicaoBotao(btnListarAnexo);
    Botao.PosicaoBotao(btnSair);
  finally
    FreeAndNil(Botao);
  end;

//------------------------------------------------------------------------------
// editar
  iPosicao := 6;
  Botao := TPosicaoBotao.Create(btnSalvar, iPosicao, 6);
  try
    Botao.PosicaoBotao(btnCancelar);
    Botao.PosicaoBotao(btnEspecificacao);
    Botao.PosicaoBotao(btnModulo2);
    Botao.PosicaoBotao(btnConsultaDescricao);
    Botao.PosicaoBotao(btnDetalhes);
    Botao.PosicaoBotao(btnBuscarCliente);
    Botao.PosicaoBotao(btnListarAnexo2);
  finally
    FreeAndNil(Botao);
  end;

//------------------------------------------------------------------------------
// filtro
  iPosicao := 6;
  Botao := TPosicaoBotao.Create(btnFiltro, iPosicao, 6);
  try
    Botao.PosicaoBotao(btnImprimir);
    Botao.PosicaoBotao(btnFecharFiltro);
  finally
    FreeAndNil(Botao);
  end;

  EntrarChamadoQuadro;

  if FQuadro = False then
    HabilitarBotoesOcorrencia();

  if FEditar then
    btnEditarClick(Self);

  CaminhoAnexo();
  MostrarAnexo();

end;

procedure TfrmChamado.FraStatusbtnProcClick(Sender: TObject);
begin
  inherited;
  if FTipoMovimento = caChamado then
    FraStatus.TipoPrograma := prChamado
  else
    FraStatus.TipoPrograma := prAtividade;
  FraStatus.btnProcClick(Sender);
end;

procedure TfrmChamado.FraStatusedtCodigoEnter(Sender: TObject);
begin
  inherited;
  if FTipoMovimento = caChamado then
    FraStatus.TipoPrograma := prChamado
  else
    FraStatus.TipoPrograma := prAtividade;
end;

procedure TfrmChamado.FraTipobtnProcClick(Sender: TObject);
begin
  inherited;
  if FTipoMovimento = caChamado then
    FraTipo.TipoPrograma := prChamado
  else
    FraTipo.TipoPrograma := prAtividade;

  FraTipo.btnProcClick(Sender);
end;

procedure TfrmChamado.FraTipoedtCodigoEnter(Sender: TObject);
begin
  inherited;
  if FTipoMovimento = caChamado then
    FraTipo.TipoPrograma := prChamado
  else
    FraTipo.TipoPrograma := prAtividade;
end;

procedure TfrmChamado.Iniciar(APesquisar: boolean; ATipo: TEnumChamadoAtividade);
begin
  FController := TChamadoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;
  dsStatus.DataSet := FController.Model.CDSChamadoStatus;
  dsOcorrencia.DataSet := FController.Model.CDSChamadoOcorrenciaCons;
  FTipoMovimento := ATipo;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  cbbCampos.ItemIndex := 4;
  Localizar('ABCDE'); // para trazer vazio

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
  FraCliente.Inicializar();
  FraUsuario.Inicializar();
  FraTipo.Inicializar();
  FraStatus.Inicializar();
  FraRevenda.Inicializar();
  FraModulo.Inicializar();
  FraConsultor.Inicializar();

  FOcorrencia := False;
//  FTipoMovimento := ATipo;
  FEncerrarAgendamento := False;
  FIdAgendamento := 0;

  case ATipo of
    caChamado: DadosChamado();
    caAtividade: DadosAtividade();
  end;

  FEditar := False;
end;

procedure TfrmChamado.LimparEdits;
begin
  mmoCliente.Clear;
  mmoCliente2.Clear;
end;

procedure TfrmChamado.ListarAnexos(AIdChamado: Integer);
var
  Formulario: TfrmListaAnexos;
  lTipo: TEnumTipoPrograma;
begin
  if AIdChamado = 0 then
    raise Exception.Create('Não há Registros!');

  if FTipoMovimento = caChamado then
    lTipo := tpChamado
  else
    lTipo := tpAtividade;

  Formulario := TfrmListaAnexos.create(FController.Model.CDSConsultaCha_Id.AsInteger, lTipo);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmChamado.ListarProblemas(ASelecionar: Boolean);
var
  Formulario: TfrmListaProblemaChamado;
begin
  Formulario := TfrmListaProblemaChamado.Create(ASelecionar, FTipoMovimento);
  try
    if Formulario.ShowModal = mrOk then
    begin
      if ASelecionar then
        FController.FiltrarIdChamado(Formulario.IdChamado);
    end;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmChamado.Localizar(ATexto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
  Filtro: TFiltroChamado;
begin

  Filtro := TFiltroChamado.Create;
  try
    RelatorioFiltro(Filtro);

    sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
    sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
    bContem := (cbbPesquisa.ItemIndex = 1);
//    cbbCampos.ItemIndex := 3;

    if FTipoMovimento = caChamado then
      FController.FiltrarChamado(Filtro, sCampo, ATexto, dm.IdUsuario, bContem)
    else
      FController.FiltrarAtividade(Filtro, sCampo, ATexto, dm.IdUsuario, bContem);

    FController.Model.CDSConsulta.IndexFieldNames := sCampo;
  finally
    FreeAndNil(Filtro);
  end;

end;

procedure TfrmChamado.mmoSolucaoEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmChamado.mmoSolucaoExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmChamado.mmoSolucaoKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  TeclasAtalho(Key, Shift);
  if Key = VK_F9 then
    BuscarObservacao(3);
end;

procedure TfrmChamado.mmoTecnicaEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmChamado.mmoTecnicaExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmChamado.mmoTecnicaKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  inherited;
  TeclasAtalho(Key, Shift);
  if Key = VK_F9 then
    BuscarObservacao(2);
end;

procedure TfrmChamado.MostrarAnexo;
var
  Departamento: TDepartamentoController;
  bResultado: Boolean;
begin
  Departamento := TDepartamentoController.Create;
  try
    bResultado := Departamento.MostrarAnexos();
    Label22.Visible := bResultado;
    edtNomeArquivo.Visible := bResultado;
    btnAnexar.Visible := bResultado;
    btnVisualizar.Visible := bResultado;
    btnListarAnexo.Visible := bResultado;
    btnListarAnexo2.Visible := bResultado;
  finally
    FreeAndNil(Departamento);
  end;
end;

procedure TfrmChamado.NovaOcorrencia;
begin
  if (tsEdicao.Showing) and (tsChamadoOcorrencia.Showing)then
  begin
    if btnNovoOcorrencia.Enabled then
      btnNovoOcorrenciaClick(Self);
  end;
end;

procedure TfrmChamado.NovoChamadoQuadro;
var
  Status: TStatusController;
  sCodigo: string;
  ParametroController: TParametrosController;
begin
  Status := TStatusController.Create;
  try
    if FEncerrarAgendamento then
    begin
      ParametroController := TParametrosController.Create;
      try
//        sCodigo := ParametroController.BuscarFechamentoAgendamento();
        sCodigo := ParametroController.StatusAberturaAtividade();
      finally
        FreeAndNil(ParametroController);
      end;
    end
    else begin
      if FTipoMovimento = caChamado then
        sCodigo := FController.StatusAbertura()
      else
        sCodigo := FController.StatusAberturaAtividade();
    end;

    try
      Status.LocalizarCodigo(StrToIntDef(sCodigo, 0));

      if Status.Model.CDSCadastroSta_Id.AsInteger = 0 then
        raise Exception.Create('Informe o Status para abertura nos Parâmetros do Sistema!');

      FController.Model.CDSCadastroCha_Status.AsString := Status.Model.CDSCadastroSta_Id.AsString;
      FController.Model.CDSCadastroSta_Codigo.AsString := Status.Model.CDSCadastroSta_Codigo.AsString;
      FController.Model.CDSCadastroSta_Nome.AsString := Status.Model.CDSCadastroSta_Nome.AsString;
    except
      ON E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    FreeAndNil(Status);
  end;
end;

procedure TfrmChamado.NovoOcorrencia;
begin
  edtDocumento.ReadOnly := False;
  edtDocumento.Enabled := True;

  edtData.TabStop := False;
  edtHoraInicial.TabStop := False;
  edtHoraFinal.TabStop := False;

  edtVersao.ReadOnly := False;
  edtVersao.Enabled := True;

  mmoTecnica.ReadOnly := False;
  mmoTecnica.Enabled := True;

  mmoSolucao.ReadOnly := False;
  mmoSolucao.Enabled := True;

  edtNomeArquivo.ReadOnly := False;
  edtNomeArquivo.Enabled := True;

  btnAnexar.Enabled := True;
  btnVisualizar.Enabled := True;
end;

procedure TfrmChamado.OrdemRelatorioModelo02;
var
  sOpcao: string;
begin
// 02 - Resumo de Horas por Cliente
  if cbbModelo.ItemIndex = 1 then
  begin
    if FTipoMovimento = caChamado then
      sOpcao := 'Por Quantidade de Chamados'
    else
      sOpcao := 'Por Quantidade de Atividades';

    cbbOrdemRelatorio.Clear;
    cbbOrdemRelatorio.Items.Add('Por Cliente');
    cbbOrdemRelatorio.Items.Add(sOpcao);
    cbbOrdemRelatorio.Items.Add('Por Horas Utilizadas');
    cbbOrdemRelatorio.ItemIndex := 2;
  end;
end;

procedure TfrmChamado.OrdemRelatorioModelo03;
begin
// 03 - Resumo de Ocorrências por Usuário
  if cbbModelo.ItemIndex = 2 then
  begin
    cbbOrdemRelatorio.Clear;
    cbbOrdemRelatorio.Items.Add('Por Usuário');
    cbbOrdemRelatorio.Items.Add('Por Quantidade de Ocorrências');
    cbbOrdemRelatorio.Items.Add('Por Horas Utilizadas');
    cbbOrdemRelatorio.ItemIndex := 2;
  end;
end;

procedure TfrmChamado.OrdemRelatorioModelo04;
var
  sOpcao: string;
begin
// 04 - Resumo de Horas por Tipo
  if cbbModelo.ItemIndex = 3 then
  begin
    sOpcao := 'Por Quantidade de Chamados';
    if FTipoMovimento = caAtividade then
      sOpcao := 'Por Quantidade de Atividades';

    cbbOrdemRelatorio.Clear;
    cbbOrdemRelatorio.Items.Add('Por Tipo');
    cbbOrdemRelatorio.Items.Add(sOpcao);
    cbbOrdemRelatorio.Items.Add('Por Horas Utilizadas');
    cbbOrdemRelatorio.ItemIndex := 2;
  end;
end;

procedure TfrmChamado.OrdemRelatorioModelo05;
begin
// 05 - Estatísticas
  if cbbModelo.ItemIndex = 4 then
  begin
    cbbOrdemRelatorio.Clear;
    cbbOrdemRelatorio.Items.Add('Por Data');
    cbbOrdemRelatorio.ItemIndex := 0;
  end;
end;

procedure TfrmChamado.OrdemRelatorioModelo08;
begin
  if cbbModelo.ItemIndex = 7 then
  begin
    cbbOrdemRelatorio.Clear;
    cbbOrdemRelatorio.Items.Add('Por Perfil de Cliente');
    cbbOrdemRelatorio.Items.Add('Por Quantidade de Ocorrências');
    cbbOrdemRelatorio.Items.Add('Por Horas Utilizadas');
    cbbOrdemRelatorio.ItemIndex := 0;
  end;
end;

procedure TfrmChamado.PageControl1Change(Sender: TObject);
begin
  inherited;
  TFuncoes.ControleGuias(PageControl1,
                         tsChamadoOcorrencia,
                         btnSalvarOcorrencia,
                         'a Ocorrência');
end;

procedure TfrmChamado.PermissaoAlterarDataHora(APermissao: Boolean);
begin
  edtDocumento.ReadOnly   := not APermissao;
  edtVersao.ReadOnly      := not APermissao;
  mmoTecnica.ReadOnly     := not APermissao;
  mmoSolucao.ReadOnly     := not APermissao;
  edtNomeArquivo.ReadOnly := not APermissao;
  btnAnexar.Enabled       := APermissao;
end;

procedure TfrmChamado.PermissaoEdicaoOcorrencia;
var
  Usuario: TUsuarioController;
  bResult: Boolean;
  Perfil: Integer;
begin
  Usuario := TUsuarioController.Create;
  try
    if FTipoMovimento = caChamado then
      bResult := Usuario.PermissaoChamadoOcorrenciaAlterar(dm.IdUsuario, 0, Perfil)
    else
      bResult := Usuario.PermissaoAtividadeOcorrenciaAlterar(dm.IdUsuario, 0, Perfil);

    btnNovoOcorrencia.Enabled := bResult;
    btnEditarOcorr.Enabled := bResult;
    btnSalvarOcorrencia.Enabled := False;
    btnExcluirOcorrencia.Enabled := bResult;
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TfrmChamado.RelatorioFiltro(AFiltro: TFiltroChamado);
begin
  AFiltro.DataInicial := edtDataInicial.Text;
  AFiltro.DataFinal := edtDataFinal.Text;
  AFiltro.IdCliente := FraCliente.RetornoSelecao();
  AFiltro.IdTipo := FraTipo.RetornoSelecao();
  AFiltro.IdStatus := FraStatus.RetornoSelecao();
  AFiltro.IdUsuarioAbertura := FraUsuario.RetornoSelecao();
  AFiltro.Revenda.IdStr := FraRevenda.RetornoSelecao();
  AFiltro.Modulo.IdStr := FraModulo.RetornoSelecao();
  AFiltro.Cliente.IdUsuario := FraConsultor.RetornoSelecao();
  AFiltro.Cliente.Perfil := edtPerfil.Text;
  AFiltro.TipoMovimento := integer(FTipoMovimento);
  AFiltro.Id := StrToIntDef(edtIdFiltro.Text, 0);
end;

procedure TfrmChamado.RelatorioModelo_01;
var
  Filtro: TFiltroChamado;
begin
  Filtro := TFiltroChamado.Create;
  try
    RelatorioFiltro(Filtro);

    case FTipoMovimento of
      caChamado: FController.Relatorio(Filtro, 01, dm.IdUsuario, '');
      caAtividade: FController.RelatorioAtividade(Filtro, 01, dm.IdUsuario, '');
    end;
  finally
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmChamado.RelatorioModelo_02;
var
  Filtro: TFiltroChamado;
  sOrdem: string;
begin

  Filtro := TFiltroChamado.Create;
  try
    RelatorioFiltro(Filtro);

    case cbbOrdemRelatorio.ItemIndex of
      0: sOrdem := 'Cli_Nome';
      1: sOrdem := 'QtdeChamados Desc';
      2: sOrdem := 'TotalHoras Desc';
    end;

    case FTipoMovimento of
      caChamado  : FController.Relatorio(Filtro, 02, dm.IdUsuario, 'Rev_Nome, Rev_Codigo, ' + sOrdem);
      caAtividade: FController.RelatorioAtividade(Filtro, 02, dm.IdUsuario, 'Rev_Nome, Rev_Codigo, ' + sOrdem);
    end;

  finally
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmChamado.RelatorioModelo_03;
var
  Filtro: TFiltroChamado;
  sOrdem: string;
begin

  Filtro := TFiltroChamado.Create;
  try
    RelatorioFiltro(Filtro);

    case cbbOrdemRelatorio.ItemIndex of
      0: sOrdem := 'Usu_Nome';
      1: sOrdem := 'QtdeChamados Desc';
      2: sOrdem := 'TotalHoras Desc';
    end;

    case FTipoMovimento of
      caChamado:   FController.Relatorio(Filtro, 03, dm.IdUsuario, sOrdem);
      caAtividade: FController.RelatorioAtividade(Filtro, 03, dm.IdUsuario, sOrdem);
    end;

  finally
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmChamado.RelatorioModelo_04;
var
  Filtro: TFiltroChamado;
  sOrdem: string;
begin

  Filtro := TFiltroChamado.Create;
  try
    RelatorioFiltro(Filtro);
    case cbbOrdemRelatorio.ItemIndex of
      0: sOrdem := 'Tip_Nome';
      1: sOrdem := 'QtdeChamados desc';
      2: sOrdem := 'TotalHoras desc';
    end;

    case FTipoMovimento of
      caChamado:   FController.Relatorio(Filtro, 04, dm.IdUsuario, 'Rev_Nome, Rev_Codigo, ' + sOrdem);
      caAtividade: FController.RelatorioAtividade(Filtro, 04, dm.IdUsuario, 'Rev_Nome, Rev_Codigo, ' + sOrdem);
    end;

  finally
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmChamado.RelatorioModelo_05;
var
  Filtro: TFiltroChamado;
  sOrdem: string;
begin

  Filtro := TFiltroChamado.Create;
  try
    RelatorioFiltro(Filtro);

    case cbbOrdemRelatorio.ItemIndex of
      0: sOrdem := 'Cha_DataAbertura';
    end;

    case FTipoMovimento of
      caChamado:   FController.Relatorio(Filtro, 05, dm.IdUsuario, sOrdem);
      caAtividade: FController.RelatorioAtividade(Filtro, 05, dm.IdUsuario, sOrdem);
    end;

  finally
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmChamado.RelatorioModelo_06;
var
  Filtro: TFiltroChamado;
  sOrdem: string;
begin
  Screen.Cursor := crHourGlass;
  Filtro := TFiltroChamado.Create;
  try
    RelatorioFiltro(Filtro);

    case FTipoMovimento of
      caChamado: FController.Relatorio(Filtro, 06, dm.IdUsuario, 'Rev_Nome');
      caAtividade: FController.RelatorioAtividade(Filtro, 06, dm.IdUsuario, sOrdem);
    end;

  finally
    FreeAndNil(Filtro);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmChamado.RelatorioModelo_07;
var
  Filtro: TFiltroChamado;
  sOrdem: string;
begin
  Screen.Cursor := crHourGlass;
  Filtro := TFiltroChamado.Create;
  try
    RelatorioFiltro(Filtro);

    case FTipoMovimento of
      caChamado: FController.Relatorio(Filtro, 07, dm.IdUsuario, 'Usu_Nome');
      caAtividade: FController.RelatorioAtividade(Filtro, 07, dm.IdUsuario, sOrdem);
    end;

  finally
    FreeAndNil(Filtro);
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmChamado.RelatorioModelo_08;
var
  Filtro: TFiltroChamado;
  sOrdem: string;
begin

  Filtro := TFiltroChamado.Create;
  try
    RelatorioFiltro(Filtro);

    case cbbOrdemRelatorio.ItemIndex of
      0: sOrdem := 'Cli_Perfil';
      1: sOrdem := 'QtdeChamados Desc';
      2: sOrdem := 'TotalHoras Desc';
    end;

    case FTipoMovimento of
      caChamado:   FController.Relatorio(Filtro, 08, dm.IdUsuario, sOrdem);
      caAtividade: FController.RelatorioAtividade(Filtro, 03, dm.IdUsuario, sOrdem);
    end;

  finally
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmChamado.RelatoriosAtividades;
var
  iOpcao: integer;
begin
  iOpcao := StrToIntDef(copy(cbbModelo.Text, 1, 2),0);
  case iOpcao of
    1: RelatorioModelo_01;
    2: RelatorioModelo_02;
    3: RelatorioModelo_03;
    4: RelatorioModelo_04;
    5: RelatorioModelo_05;
    6: RelatorioModelo_06;
    7: RelatorioModelo_07;
  end;
end;

procedure TfrmChamado.RelatoriosChamados;
var
  iOpcao: integer;
begin
  iOpcao := StrToIntDef(copy(cbbModelo.Text, 1, 2),0);
  case iOpcao of
    1: RelatorioModelo_01;
    2: RelatorioModelo_02;
    3: RelatorioModelo_03;
    4: RelatorioModelo_04;
    5: RelatorioModelo_05;
    6: RelatorioModelo_06;
    7: RelatorioModelo_07;
    8: RelatorioModelo_08;
  end;
end;

function TfrmChamado.SalvarChamadoOcorrencia: Boolean;
begin
  Result := False;
  if (tsEdicao.Showing) and (tsChamadoOcorrencia.Showing) then
  begin
    if btnSalvarOcorrencia.Enabled then
    begin
      btnSalvarOcorrenciaClick(Self);
      Result := True;
    end;
  end;
end;

function TfrmChamado.SalvarChamadoQuadro: Boolean;
begin
  // se usar quadro, ja abre no modo inclusao
  if FQuadro then
    Self.Close;
  Result := FQuadro;
end;

function TfrmChamado.SalvarOcorrencia: boolean;
var
  bInclusao: Boolean;
begin
  if FController.Model.CDSChamadoOcorrenciaCons.State in [dsEdit, dsInsert] then
  begin
    if FController.Model.CDSChamadoOcorrenciaConsChOco_Data.AsDateTime < FController.Model.CDSCadastroCha_DataAbertura.AsDateTime then
      raise Exception.Create('Data de Ocorrência menor que Data de Abertura!');

    try
      if FController.Model.CDSChamadoOcorrenciaCons.State = dsInsert then
        Result := EntrarTelaStatus()
      else
        Result := True;

      if Result then
      begin
        bInclusao := (FController.Model.CDSChamadoOcorrenciaCons.State = dsInsert);
        // verificar
        FController.PostOcorrencia;
        FController.ModoEdicaoInsercao;
        if (FQuadro) and (FOcorrencia) then
        begin
          FController.Salvar(dm.IdUsuario, FTipoMovimento);

          if bInclusao then
          begin
            if not (TFuncoes.ModoDesenvolvimento()) then
              EnvioEmail(FController.Model.CDSCadastroCha_Id.AsInteger, FController.Model.CDSCadastroCha_Status.AsInteger);
          end;

          Self.Close;
          Exit;
        end;

        Edit1.SetFocus;
      end;
    except
      On E: Exception do
      begin
        Result := False;
        ShowMessage(E.Message);
        edtDocumento.SetFocus;
      end;
    end;
  end;
end;

procedure TfrmChamado.TeclasAtalho(var Key: Word; var Shift: TShiftState);
var
  cancelar: Boolean;
begin
  case Key of
    VK_INSERT: NovaOcorrencia();
    VK_F2: EditarOcorrencia();
    VK_F8:
    begin
      if btnSalvar.Enabled then
      begin
        if tsEdicao.Showing then
          btnSalvar.SetFocus;
        btnSalvarClick(Self);
      end
      else
        SalvarChamadoOcorrencia();
    end;
    VK_ESCAPE:
    begin
      cancelar := False;
      if (tsEdicao.Showing) and (tsChamadoOcorrencia.Showing) then
        cancelar := CancelarOcorrencia();

      if cancelar = False then
        btnCancelarClick(Self);
    end;
  end;

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
  begin
    if (tsEdicao.Showing) and (tsChamadoOcorrencia.Showing) then
    begin
      if btnExcluirOcorrencia.Enabled then
        btnExcluirOcorrenciaClick(Self);
    end;
  end;
end;

function TfrmChamado.TelaSenhaDataHora(ASigla: string;
  out AMesmoUsuario: Boolean; out AUsuarioADM: boolean): Boolean;
var
  bMesmoUsuario: Boolean;
  Formulario: TfrmUsuarioSenha;
  Usuario: TUsuarioController;
begin
  Result := False;
  AMesmoUsuario := False;
//  bMesmoUsuario := False;
  AUsuarioADM := False;

  Formulario := TfrmUsuarioSenha.Create(ASigla, FController.Model.CDSChamadoOcorrenciaConsChOco_Id.AsInteger);
  Usuario := TUsuarioController.Create;
  try
    if (Formulario.ShowModal = mrOk) then
    begin
      Result := True;
      AMesmoUsuario := (FController.Model.CDSChamadoOcorrenciaConsChOco_Usuario.AsInteger = Formulario.IdUsuario);

//      AMesmoUsuario := bMesmoUsuario;
      AUsuarioADM := Usuario.UsuarioADM(Formulario.IdUsuario);
    end;
  finally
    FreeAndNil(Formulario);
    FreeAndNil(Usuario);
  end;
end;

procedure TfrmChamado.tsFiltroShow(Sender: TObject);
begin
  inherited;
  PageControl2.ActivePageIndex := 0;
end;

procedure TfrmChamado.tsGeralShow(Sender: TObject);
begin
  cbbPesquisa.SetFocus;
  inherited;
end;

procedure TfrmChamado.UsuarioAdministrador;
var
  Usuario: TUsuarioController;
  bAdm: Boolean;
  Id: Integer;
  bMesmoUsuario: Boolean;
begin
  Usuario := TUsuarioController.Create;
  try
    Id := FController.Model.CDSChamadoOcorrenciaConsChOco_Id.AsInteger;
    if FTipoMovimento = caChamado then
      bAdm := Usuario.PermissaoChamadoOcorrenciaDataHora(dm.IdUsuario, Id, bMesmoUsuario)
    else
      bAdm := Usuario.PermissaoAtividadeOcorrenciaDataHora(dm.IdUsuario, Id, bMesmoUsuario);

    if edtCodCliente.Enabled = False then
      bAdm := True;

    if (bAdm) then
    begin
      edtData.ReadOnly := False;
      edtData.Color := clWhite;
      edtData.TabStop := True;

      edtHoraInicial.ReadOnly := False;
      edtHoraInicial.Color := clWhite;
      edtHoraInicial.TabStop := True;

      edtHoraFinal.ReadOnly := False;
      edtHoraFinal.Color := clWhite;
      edtHoraFinal.TabStop := True;
    end
    else begin
      edtData.ReadOnly := true;
      edtData.Color := clSilver;
      edtData.TabStop := False;

      edtHoraInicial.ReadOnly := True;
      edtHoraInicial.Color := clSilver;
      edtHoraInicial.TabStop := False;

      edtHoraFinal.ReadOnly := True;
      edtHoraFinal.Color := clSilver;
      edtHoraFinal.TabStop := False;
    end;
  finally
    FreeAndNil(Usuario);
  end;
end;

end.
