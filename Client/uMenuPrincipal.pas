unit uMenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ToolWin, Vcl.ComCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons,
  uEstiloTelas, uConfig, uOrcamentoController, uTelaAbertura, uRamal,
  uListaRamal, uRamalController, System.Generics.Collections, uRecado,
  uRecadoController, uEscala, uImportarClientesController, uFeriado, uUsuarioPermissaoController,
  uCategoria, uTabPreco;

type
  TfrmMenuPrincipal = class(TForm)
    mmMenu: TMainMenu;
    mmMenuCadastro: TMenuItem;
    mmRevendas: TMenuItem;
    mmUsuarios: TMenuItem;
    mmDepartamentos: TMenuItem;
    mmProdutos: TMenuItem;
    mmModulos: TMenuItem;
    mmTipos: TMenuItem;
    mmStatus: TMenuItem;
    mmClientes: TMenuItem;
    N1: TMenuItem;
    mmSairSistema: TMenuItem;
    ToolBar1: TToolBar;
    btnCliente: TToolButton;
    statusBar: TStatusBar;
    ilImgList: TImageList;
    btnSair: TToolButton;
    btn1: TToolButton;
    mmMenuMovimentos: TMenuItem;
    mmSolicitacoes: TMenuItem;
    btnSolicitacao: TToolButton;
    BalloonHint1: TBalloonHint;
    mmVisitas: TMenuItem;
    mmBaseConhecimento: TMenuItem;
    mmMenuConfiguracao: TMenuItem;
    mmParametros: TMenuItem;
    mmVersoes: TMenuItem;
    mmChamados: TMenuItem;
    mmBackup: TMenuItem;
    btnBase: TToolButton;
    btnChamado: TToolButton;
    btnVersao: TToolButton;
    btnVisita: TToolButton;
    btnQuadro: TToolButton;
    mmExecutarSQL: TMenuItem;
    mmEnvioEmail: TMenuItem;
    mmTrocaSenha: TMenuItem;
    mmContaEmail: TMenuItem;
    Image2: TImage;
    mmEnviarEmail: TMenuItem;
    btnAtividade: TToolButton;
    mmAtividades: TMenuItem;
    mmAgendamento: TMenuItem;
    btnAgendamento: TToolButton;
    mmPlanoBackup: TMenuItem;
    mmOrcamentos: TMenuItem;
    mmObservacao: TMenuItem;
    mmFormaPagto: TMenuItem;
    mmModeloRelatorio: TMenuItem;
    btnOrcamento: TToolButton;
    mmEstilosTelas: TMenuItem;
    mmRamais: TMenuItem;
    N2: TMenuItem;
    mmMenuUtilitarios: TMenuItem;
    MostrarRamais1: TMenuItem;
    mmRecados: TMenuItem;
    btnRecado: TToolButton;
    mmEscalas: TMenuItem;
    mmCidades: TMenuItem;
    mmLicencas: TMenuItem;
    mmSincronizaodeClientes: TMenuItem;
    mmFeriado: TMenuItem;
    Categorias1: TMenuItem;
    mmTabPreco: TMenuItem;
    procedure btnBaseClick(Sender: TObject);
    procedure btnChamadoClick(Sender: TObject);
    procedure mmRevendasClick(Sender: TObject);
    procedure mmUsuariosClick(Sender: TObject);
    procedure mmDepartamentosClick(Sender: TObject);
    procedure mmProdutosClick(Sender: TObject);
    procedure mmModulosClick(Sender: TObject);
    procedure mmTiposClick(Sender: TObject);
    procedure mmStatusClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClienteClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnSolicitacaoClick(Sender: TObject);
    procedure btnVersaoClick(Sender: TObject);
    procedure btnVisitaClick(Sender: TObject);
    procedure mmBackupClick(Sender: TObject);
    procedure mmParametrosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnQuadroClick(Sender: TObject);
    procedure mmExecutarSQLClick(Sender: TObject);
    procedure mmEnvioEmailClick(Sender: TObject);
    procedure mmTrocaSenhaClick(Sender: TObject);
    procedure mmContaEmailClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mmEnviarEmailClick(Sender: TObject);
    procedure btnAtividadeClick(Sender: TObject);
    procedure mmAtividadesClick(Sender: TObject);
    procedure mmAgendamentoClick(Sender: TObject);
    procedure btnAgendamentoClick(Sender: TObject);
    procedure mmPlanoBackupClick(Sender: TObject);
    procedure mmObservacaoClick(Sender: TObject);
    procedure mmFormaPagtoClick(Sender: TObject);
    procedure mmModeloRelatorioClick(Sender: TObject);
    procedure btnOrcamentoClick(Sender: TObject);
    procedure mmEstilosTelasClick(Sender: TObject);
    procedure mmRamaisClick(Sender: TObject);
    procedure MostrarRamais1Click(Sender: TObject);
    procedure mmRecadosClick(Sender: TObject);
    procedure btnRecadoClick(Sender: TObject);
    procedure mmEscalasClick(Sender: TObject);
    procedure mmCidadesClick(Sender: TObject);
    procedure mmLicencasClick(Sender: TObject);
    procedure mmSincronizaodeClientesClick(Sender: TObject);
    procedure mmFeriadoClick(Sender: TObject);
    procedure Categorias1Click(Sender: TObject);
    procedure mmTabPrecoClick(Sender: TObject);
  private
    { Private declarations }
    FLogou: Boolean;
    procedure AbrirLogin;
    procedure AbrirQuadro;
    procedure TelaSplach;

    procedure LiberarMenu;
    procedure EnviarEmail();
    procedure AbrirRamal();
    procedure EnviarEmailRecados();
    procedure ImportarArquivoXML;
  public
    { Public declarations }
  end;

var
  frmMenuPrincipal: TfrmMenuPrincipal;

implementation

{$R *.dfm}

uses uRevenda, uUsuario, uDepartamento, uFuncoesSIDomper, uProduto, uModulo, uTipo,
  uStatus, uCliente, uUsuarioController, uDM, uSolicitacao, uVisita,
  uBaseConh, uParametros, uVersao, uChamado, uBackup, uQuadro, uEnumerador,
  uLogin, uChamadoController, UInstrucaoSQL, uSolicitacaoController,
  uArquivosLog, uTelaEnviarEmail, uUsuarioSenha, uTrocaSenha, uContaEmail,
  uParametrosController, uEnvioEmailClientes, uAgendamento,
  uAgendamentoController, uPlanoBackup, uProspect, uOrcamento, uObservacao,
  uFormaPagto, uModeloRelatorio, uQuadro2, uCidade, ULicenca;

procedure TfrmMenuPrincipal.AbrirLogin;
var
  usuario: TUsuarioController;
  Parametro: TParametrosController;
  login: TfrmLogin;
begin
  usuario := TUsuarioController.Create;
  Parametro := TParametrosController.Create;
  login := TfrmLogin.Create(Self);
  try

    FLogou := False;
    login.ShowModal;
    FLogou := login.Logou;

    if FLogou then
    begin
      usuario.LocalizarId(dm.IdUsuario);
      statusBar.Panels[0].Text := 'Usuário: ' + usuario.Model.CDSCadastroUsu_UserName.AsString;

      statusBar.Panels[1].Text := 'Versão: ' + Parametro.BuscarVersaoAtual();
    end;
  finally
    FreeAndNil(usuario);
    FreeAndNil(login);
    FreeAndNil(Parametro);
  end;

  btnSair.Visible := True;

  if FLogou then
    LiberarMenu();
end;

procedure TfrmMenuPrincipal.AbrirQuadro;
var
  ChamadoController: TChamadoController;
  bPermissaoChamado: Boolean;
  bPermissaoSolicitacao: Boolean;
  bPermissaoAtividade: Boolean;
  SolicitacaoController: TSolicitacaoController;
  AgendamentoController: TAgendamentoController;
  bPermissaoAgendamento: Boolean;
  bRecado: Boolean;
  RecadoController: TRecadoController;
begin
  ChamadoController := TChamadoController.Create;
  SolicitacaoController := TSolicitacaoController.Create;
  RecadoController := TRecadoController.Create;
  try
    bPermissaoChamado     := ChamadoController.PermissaoChamadoQuadro(dm.IdUsuario);
    bPermissaoSolicitacao := SolicitacaoController.PermissaoQuadro(dm.IdUsuario);
    bPermissaoAtividade   := ChamadoController.PermissaoAtividadeQuadro(dm.IdUsuario);
    bPermissaoAgendamento := AgendamentoController.PermissaoQuadro(dm.IdUsuario);
    bRecado := RecadoController.PermissaoAcessarQuadro(dm.IdUsuario);
  finally
    FreeAndNil(ChamadoController);
    FreeAndNil(SolicitacaoController);
    FreeAndNil(RecadoController);
  end;

  btnQuadro.Visible := ((bPermissaoChamado) or (bPermissaoSolicitacao) or (bPermissaoAtividade) or (bPermissaoAgendamento) or (bRecado));

  if btnQuadro.Visible then
  begin
    if not (TFuncoes.FormularioEstaCriado(TfrmQuadro2)) then
    begin

      frmQuadro2 := TfrmQuadro2.Create;
      frmQuadro2.Show;
    end
    else begin
      if frmQuadro2.WindowState = wsMinimized then
        frmQuadro2.WindowState := wsMaximized;
    end;
  end;
end;

procedure TfrmMenuPrincipal.AbrirRamal;
var
  F: TfrmListaRamal;
  Ramal: TRamalController;
  bMostrar: Boolean;
begin
  if (TFuncoes.FormularioEstaCriado(TfrmListaRamal)) then
    Exit;

  Ramal := TRamalController.Create;
  try
    Ramal.ListarTudo();
    bMostrar := not (Ramal.Model.CDSImpressao.IsEmpty);
  finally
    FreeAndNil(Ramal);
  end;

  if bMostrar then
  begin
    F := TfrmListaRamal.Create(Self);
    F.Show;
  end;
end;

procedure TfrmMenuPrincipal.btnAgendamentoClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmAgendamento)) then
    TFuncoes.CriarFormulario(TfrmAgendamento.create());
end;

procedure TfrmMenuPrincipal.btnAtividadeClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmChamado)) then
    TFuncoes.CriarFormulario(TfrmChamado.create(False, False, caAtividade), CAtividadePrograma);
end;

procedure TfrmMenuPrincipal.btnBaseClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmBaseConh)) then
    TFuncoes.CriarFormulario(TfrmBaseConh.create());
end;

procedure TfrmMenuPrincipal.btnChamadoClick(Sender: TObject);
begin

  if not (TFuncoes.FormularioEstaCriado(TfrmChamado)) then
    TFuncoes.CriarFormulario(TfrmChamado.create(False, False, caChamado));
end;

procedure TfrmMenuPrincipal.btnClienteClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmCliente)) then
    TFuncoes.CriarFormulario(TfrmCliente.create());
end;

procedure TfrmMenuPrincipal.btnOrcamentoClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmOrcamento)) then
    TFuncoes.CriarFormulario(TfrmOrcamento.create());
end;

procedure TfrmMenuPrincipal.btnQuadroClick(Sender: TObject);
begin
  AbrirQuadro();
end;

procedure TfrmMenuPrincipal.btnRecadoClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmRecado)) then
    TFuncoes.CriarFormulario(TfrmRecado.create());
end;

procedure TfrmMenuPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMenuPrincipal.btnSolicitacaoClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmSolicitacao)) then
    TFuncoes.CriarFormulario(TfrmSolicitacao.create());
end;

procedure TfrmMenuPrincipal.btnVersaoClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmVersao)) then
    TFuncoes.CriarFormulario(TfrmVersao.create());
end;

procedure TfrmMenuPrincipal.btnVisitaClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmVisita)) then
    TFuncoes.CriarFormulario(TfrmVisita.create());
end;

procedure TfrmMenuPrincipal.Categorias1Click(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmCategoria)) then
    TFuncoes.CriarFormulario(TfrmCategoria.create());
end;

procedure TfrmMenuPrincipal.EnviarEmail;
//var
//  OrcamentoController: TOrcamentoController;
//  ParametroController: TParametrosController;
//  sData: string;
begin

//  if TFuncoes.ModoDesenvolvimento() then
//    Exit;

//  ParametroController := TParametrosController.Create;
//  try
//    sData := ParametroController.OrcamentoBuscarDataUltimoEmail();
//  finally
//    FreeAndNil(ParametroController);
//  end;
//
//  ParametroController := TParametrosController.Create;
//  OrcamentoController := TOrcamentoController.Create;
//  try
//    try
//      if StrToDate(sData) <> Date then
//      begin
//        ParametroController.OrcamentoGravarDataUltimoEmail();
//        EnviarEmailRecados();
//        OrcamentoController.EnviarEmailSeteDiasParaSupervisor();
//      end;
//    except
//      on E: Exception do
//      begin
//        ShowMessage(E.Message);
//      end;
//    end;
//  finally
//    FreeAndNil(OrcamentoController);
//    FreeAndNil(ParametroController);
//  end;
end;

procedure TfrmMenuPrincipal.EnviarEmailRecados;
var
  Recado: TRecadoController;
begin
  Recado := TRecadoController.Create;
  try
    try
      Recado.Quadro(0,0);
      Recado.Model.CDSLcto.First;
      while not Recado.Model.CDSLcto.Eof do
      begin
        Recado.EnviarEmail(Recado.Model.CDSLctoRec_UsuarioLcto.AsInteger,
                           Recado.Model.CDSLctoRec_UsuarioDestino.AsInteger,
                           Recado.Model.CDSLctoRec_Id.AsInteger);
        Recado.Model.CDSLcto.Next;
      end;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Recado);
  end;
end;

procedure TfrmMenuPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not TFuncoes.Confirmar('Deseja sair do Sistema?') then
    Action := caNone
  else
    Application.Terminate;
end;

procedure TfrmMenuPrincipal.FormCreate(Sender: TObject);
begin
  FLogou := False;
end;

procedure TfrmMenuPrincipal.FormShow(Sender: TObject);
//var
//  ParametroController: TParametrosController;
//  UsuarioController: TUsuarioController;
//  UsuarioPermissaoController: TUsuarioPermissaoController;
begin
  TelaSplach();
  AbrirLogin;

  if FLogou then
  begin
    EnviarEmail();
    AbrirRamal();
    AbrirQuadro();
  end;
end;

procedure TfrmMenuPrincipal.ImportarArquivoXML;
var
  obj: TImportarClientesController;
begin
  obj := TImportarClientesController.Create;
  try
    try
      obj.ImportarXML(Self);
      obj.MostrarArquivoLogClientes();
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    freeAndNil(obj);
  end;
end;

procedure TfrmMenuPrincipal.LiberarMenu;
var
  i: Integer;
  iQtde: Integer;
  iTag: Integer;
  Usuario: TUsuarioController;
begin

  Usuario := TUsuarioController.Create;
  try
    Usuario.UsuarioAcessoMenu(dm.IdUsuario);
    while not Usuario.Model.CDSUsuarioAcessoMenu.Eof do
    begin
      iQtde := Self.ComponentCount -1;
      iTag := Usuario.Model.CDSUsuarioAcessoMenuDepAc_Programa.AsInteger;
      for I := 0 to iQtde do
      begin
        if Self.Components[i] is TMenuItem then
        begin
          if TMenuItem(Self.Components[i]).Tag = iTag then
            TMenuItem(Self.Components[i]).Visible := False;
        end;
      end;
      Usuario.Model.CDSUsuarioAcessoMenu.Next;
    end;

  finally
    FreeAndNil(Usuario);
  end;

  btnCliente.Visible := mmClientes.Visible;
  btnBase.Visible := mmBaseConhecimento.Visible;
  btnChamado.Visible := mmChamados.Visible;
  btnSolicitacao.Visible := mmSolicitacoes.Visible;
  btnVersao.Visible := mmVersoes.Visible;
  btnVisita.Visible := mmVisitas.Visible;
  btnAtividade.Visible := mmAtividades.Visible;
  btnAgendamento.Visible := mmAgendamento.Visible;
  btnOrcamento.Visible := mmOrcamentos.Visible;
  btnRecado.Visible := mmRecados.Visible;
end;

procedure TfrmMenuPrincipal.mmDepartamentosClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmDepartamento)) then
    TFuncoes.CriarFormulario(TfrmDepartamento.create());
end;

procedure TfrmMenuPrincipal.mmEnviarEmailClick(Sender: TObject);
var
  Formulario: TfrmEnviarEmailCliente;
begin
  Formulario := TfrmEnviarEmailCliente.Create(Self);
  Formulario.Show;
end;

procedure TfrmMenuPrincipal.mmEnvioEmailClick(Sender: TObject);
var
  Formulario: TfrmTelaEnviarEmail;
begin
  Formulario := TfrmTelaEnviarEmail.Create(Self);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmMenuPrincipal.mmEscalasClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmEscala)) then
    TFuncoes.CriarFormulario(TfrmEscala.create());
end;

procedure TfrmMenuPrincipal.mmEstilosTelasClick(Sender: TObject);
var
  Formulario: TfrmEstiloTelas;
begin
  Formulario := TfrmEstiloTelas.Create(Self);
  Formulario.Show();
end;

procedure TfrmMenuPrincipal.mmExecutarSQLClick(Sender: TObject);
var
  Formulario: TfrmInstrucaoSQL;
begin
  if TFuncoes.TelaSenha('') then
  begin
    if not (TFuncoes.FormularioEstaCriado(TfrmInstrucaoSQL)) then
    begin
      Formulario := TfrmInstrucaoSQL.Create(self);
      Formulario.Show;
    end;
  end;
end;

procedure TfrmMenuPrincipal.mmFeriadoClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmFeriado)) then
    TFuncoes.CriarFormulario(TfrmFeriado.create());
end;

procedure TfrmMenuPrincipal.mmFormaPagtoClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmFormaPagto)) then
    TFuncoes.CriarFormulario(TfrmFormaPagto.create());
end;

procedure TfrmMenuPrincipal.mmLicencasClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmLicenca)) then
    TFuncoes.CriarFormulario(TfrmLicenca.create(self));
end;

procedure TfrmMenuPrincipal.mmModeloRelatorioClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmModeloRelatorio)) then
    TFuncoes.CriarFormulario(TfrmModeloRelatorio.create());
end;

procedure TfrmMenuPrincipal.mmModulosClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmModulo)) then
    TFuncoes.CriarFormulario(TfrmModulo.create());
end;

procedure TfrmMenuPrincipal.mmObservacaoClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmObservacao)) then
    TFuncoes.CriarFormulario(TfrmObservacao.create());
end;

procedure TfrmMenuPrincipal.mmProdutosClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmProduto)) then
    TFuncoes.CriarFormulario(TfrmProduto.create());
end;

procedure TfrmMenuPrincipal.mmRamaisClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmRamal)) then
    TFuncoes.CriarFormulario(TfrmRamal.create());
end;

procedure TfrmMenuPrincipal.mmRecadosClick(Sender: TObject);
begin
  btnRecadoClick(Self);
end;

procedure TfrmMenuPrincipal.mmRevendasClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmRevenda)) then
    TFuncoes.CriarFormulario(TfrmRevenda.create());
end;

procedure TfrmMenuPrincipal.mmSincronizaodeClientesClick(Sender: TObject);
begin
  ImportarArquivoXML();
end;

procedure TfrmMenuPrincipal.mmStatusClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmStatus)) then
    TFuncoes.CriarFormulario(TfrmStatus.create());
end;

procedure TfrmMenuPrincipal.mmTabPrecoClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmTabPreco)) then
    TFuncoes.CriarFormulario(TfrmTabPreco.create());
end;

procedure TfrmMenuPrincipal.mmTiposClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmTipo)) then
    TFuncoes.CriarFormulario(TfrmTipo.create());
end;

procedure TfrmMenuPrincipal.mmTrocaSenhaClick(Sender: TObject);
var
  Formulario: TfrmTrocaSenha;
begin
  Formulario := TfrmTrocaSenha.Create(Self);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmMenuPrincipal.mmUsuariosClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmUsuario)) then
    TFuncoes.CriarFormulario(TfrmUsuario.create());
end;

procedure TfrmMenuPrincipal.MostrarRamais1Click(Sender: TObject);
begin
  AbrirRamal();
end;

procedure TfrmMenuPrincipal.TelaSplach;
var
  Tela: TfrmTelaAbertura;
begin
  Tela := TfrmTelaAbertura.Create(Self);
  Tela.Show;
  Tela.Update;
  Sleep(3000);
  Tela.Free;
end;

procedure TfrmMenuPrincipal.mmAgendamentoClick(Sender: TObject);
begin
  btnAgendamentoClick(Self);
end;

procedure TfrmMenuPrincipal.mmAtividadesClick(Sender: TObject);
begin
  btnAtividadeClick(Self);
end;

procedure TfrmMenuPrincipal.mmBackupClick(Sender: TObject);
var
  Formulario: TfrmBackup;
begin
  if TFuncoes.TelaSenha('') then
  begin
    if not (TFuncoes.FormularioEstaCriado(TfrmBackup)) then
    begin
      Formulario := TfrmBackup.Create(Self);
      Formulario.Show;
    end;
  end;
end;

procedure TfrmMenuPrincipal.mmCidadesClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmCidade)) then
    TFuncoes.CriarFormulario(TfrmCidade.create());
end;

procedure TfrmMenuPrincipal.mmContaEmailClick(Sender: TObject);
begin
  if not (TFuncoes.FormularioEstaCriado(TfrmContaEmail)) then
    TFuncoes.CriarFormulario(TfrmContaEmail.create());
end;

procedure TfrmMenuPrincipal.mmParametrosClick(Sender: TObject);
begin
  if TFuncoes.TelaSenha('') then
  begin
    if not (TFuncoes.FormularioEstaCriado(TfrmParametros)) then
      TFuncoes.CriarFormulario(TfrmParametros.create());
  end;
end;

procedure TfrmMenuPrincipal.mmPlanoBackupClick(Sender: TObject);
var
  Formulario: TfrmPlanoBackup;
begin
  Formulario := TfrmPlanoBackup.Create(Self);
  Formulario.Show;
end;

initialization
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

end.
