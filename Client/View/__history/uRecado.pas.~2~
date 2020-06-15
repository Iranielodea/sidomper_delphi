unit uRecado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMRecado,
  uRecadoController, Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, uRecadoFiltro,
  uTipoController, uEnumerador, uTipo, uUsuarioController, uClienteController,
  uCliente, uImagens, uUsuario, uFraUsuario, uFraCliente, uFraTipo, uFraStatus,
  uFraAnalista, uStatusController, uStatus, uPosicaoBotao;

type
  TfrmRecado = class(TfrmBaseCadastro)
    GroupBox2: TGroupBox;
    Label39: TLabel;
    edtDataInicial: TMaskEdit;
    Label40: TLabel;
    edtDataFinal: TMaskEdit;
    GroupBox3: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edtDataEncerraInicial: TMaskEdit;
    edtDataEncerraFinal: TMaskEdit;
    PageControl1: TPageControl;
    tsAbertura: TTabSheet;
    Panel7: TPanel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    btnCliente: TSpeedButton;
    Label10: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    btnUsuario: TSpeedButton;
    Label11: TLabel;
    btnTipo: TSpeedButton;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edtCodigo: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    edtNome: TDBEdit;
    edtCodCliente: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit10: TDBEdit;
    edtCodUsuario: TDBEdit;
    DBEdit11: TDBEdit;
    edtCodTipo: TDBEdit;
    DBEdit12: TDBEdit;
    edtCodStatus: TDBEdit;
    DBEdit13: TDBEdit;
    DBMemo1: TDBMemo;
    tsEncerra: TTabSheet;
    Panel8: TPanel;
    DBMemo2: TDBMemo;
    Label17: TLabel;
    dbmEndereco: TDBMemo;
    dbmContato: TDBMemo;
    DBEdit7: TDBEdit;
    Label19: TLabel;
    DBEdit8: TDBEdit;
    Label20: TLabel;
    btnEncerrar: TBitBtn;
    tsUsuarioLcto: TTabSheet;
    Panel9: TPanel;
    tsCliente: TTabSheet;
    Panel10: TPanel;
    tsUsuarioDest: TTabSheet;
    Panel11: TPanel;
    tsTipo: TTabSheet;
    Panel12: TPanel;
    tsStatus: TTabSheet;
    Panel13: TPanel;
    FraUsuario: TFraUsuario;
    FraCliente: TFraCliente;
    FraTipo: TFraTipo;
    FraStatus: TFraStatus;
    FraUsuarioDest: TFraAnalista;
    btnStatus: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnFecharEdicaoClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure dbDadosTitleClick(Column: TColumn);
    procedure edtCodTipoExit(Sender: TObject);
    procedure edtCodTipoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnTipoClick(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure edtCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtCodUsuarioExit(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEncerrarClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure FraTipoedtCodigoEnter(Sender: TObject);
    procedure FraTipobtnProcClick(Sender: TObject);
    procedure FraStatusedtCodigoEnter(Sender: TObject);
    procedure FraStatusbtnProcClick(Sender: TObject);
    procedure edtCodStatusExit(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure edtCodStatusKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbmEnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbmEnderecoEnter(Sender: TObject);
    procedure dbmEnderecoExit(Sender: TObject);
    procedure dbmContatoExit(Sender: TObject);
    procedure dbmContatoEnter(Sender: TObject);
    procedure dbmContatoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBMemo1Exit(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FController: TRecadoController;
    FQuadro: Boolean;
    FId: Integer;
    procedure Localizar(ATexto: string);
    procedure TelaPadrao;
    procedure BuscarCliente(AId, ACodigo: Integer);
    procedure BuscarUsuario(AId, ACodigo: Integer);
    procedure BuscarTipo(AId, ACodigo: Integer);
    procedure BuscarStatus(AId, ACodigo: Integer);
    procedure PermissaoEditar;
    function PermissaoExcluir: Boolean;
    procedure HabilitaAbas;
    procedure Salvar;
    procedure TeclasAtalho(var Key: Word; Shift: TShiftState);
    function RecadoEncerrado: Boolean;
    procedure EnviarEmailAoSalvar(AId: Integer);
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False; AOperacao: string = 'A';
      AQuadro: Boolean=False; AId: Integer=0);
  end;

var
  frmRecado: TfrmRecado;

implementation

{$R *.dfm}

uses uGrade, uDM;

procedure TfrmRecado.btnCancelarClick(Sender: TObject);
begin
  if FQuadro then
    Self.Close()
  else
    inherited;
end;

procedure TfrmRecado.btnClienteClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmCliente.create(FController.Model.CDSCadastroRec_UsuarioLcto.AsInteger ,true));
  if dm.IdSelecionado > 0 then
    BuscarCliente(dm.IdSelecionado, 0);

end;

procedure TfrmRecado.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  HabilitaAbas();
  TelaPadrao;
  if edtCodCliente.Enabled then
    edtCodCliente.SetFocus;

  PermissaoEditar();

  RecadoEncerrado();
end;

procedure TfrmRecado.btnEncerrarClick(Sender: TObject);
begin
  inherited;
  FController.ModoAbrEnc := 'E';
  btnSalvarClick(Self);
end;

procedure TfrmRecado.btnExcluirClick(Sender: TObject);
begin
  if PermissaoExcluir() = False then
    raise Exception.Create('Recado já está Fechado!');


  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmRecado.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmRecado.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmRecado.btnImprimirClick(Sender: TObject);
begin
  Localizar(edtDescricao.Text);
  FController.Imprimir(dm.IdUsuario);
  inherited;
end;

procedure TfrmRecado.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  inherited;
  HabilitaAbas();

  TelaPadrao;
  edtCodCliente.SetFocus;

  RecadoEncerrado();

  tsEncerra.Enabled := False;
end;

procedure TfrmRecado.btnSalvarClick(Sender: TObject);
begin
  Salvar();
  inherited;
end;

procedure TfrmRecado.btnStatusClick(Sender: TObject);
begin
  inherited;
//  TFuncoes.CriarFormularioModal(TfrmStatus.create(prRecado, true));
//  if dm.IdSelecionado > 0 then
//    BuscarStatus(dm.IdSelecionado, 0);
end;

procedure TfrmRecado.btnTipoClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmTipo.create(prRecado, true));
  if dm.IdSelecionado > 0 then
    BuscarTipo(dm.IdSelecionado, 0);
end;

procedure TfrmRecado.btnUsuarioClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmUsuario.create(true));
  if dm.IdSelecionado > 0 then
    BuscarUsuario(dm.IdSelecionado, 0);
end;

procedure TfrmRecado.BuscarCliente(AId, ACodigo: Integer);
var
  obj: TClienteController;
  sFones: string;
  sEndereco: string;
  sContatos: string;
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
    TFuncoes.ModoEdicaoInsercao(dsCad.DataSet);
    FController.Model.CDSCadastroRec_Cliente.AsString := obj.Model.CDSCadastroCli_Id.AsString;
    FController.Model.CDSCadastroCli_Codigo.AsString := obj.Model.CDSCadastroCli_Codigo.AsString;
    FController.Model.CDSCadastroCli_Nome.AsString := obj.Model.CDSCadastroCli_Nome.AsString;
    FController.Model.CDSCadastroRec_RazaoSocial.AsString := obj.Model.CDSCadastroCli_Nome.AsString;
    FController.Model.CDSCadastroRec_Fantasia.AsString := obj.Model.CDSCadastroCli_Fantasia.AsString;
//==============================================================================
// endereco

    sEndereco := obj.Model.CDSCadastroCli_Logradouro.AsString;
    if obj.Model.CDSCadastroCli_Bairro.AsString <> '' then
      sEndereco := sEndereco + sLineBreak +obj.Model.CDSCadastroCli_Bairro.AsString;

    if obj.Model.CDSCadastroCli_CEP.AsString <> '' then
      sEndereco := sEndereco + sLineBreak +obj.Model.CDSCadastroCli_CEP.AsString;

    if obj.Model.CDSCadastroCid_Nome.AsString <> '' then
      sEndereco := sEndereco + sLineBreak +obj.Model.CDSCadastroCid_Nome.AsString + ' - ' + obj.Model.CDSCadastroCid_UF.AsString;
    FController.Model.CDSCadastroRec_Endereco.AsString := sEndereco;
//==============================================================================
// Telefones

    sFones := obj.Model.CDSCadastroCli_Fone1.AsString;
    if obj.Model.CDSCadastroCli_Fone2.AsString <> '' then
      sFones := sFones + ' / ' + obj.Model.CDSCadastroCli_Fone2.AsString;

    if obj.Model.CDSCadastroCli_Celular.AsString <> '' then
      sFones := sFones + ' / ' + obj.Model.CDSCadastroCli_Celular.AsString;

    if obj.Model.CDSCadastroCli_FoneOutro.AsString <> '' then
      sFones := sFones + ' / ' + obj.Model.CDSCadastroCli_FoneOutro.AsString;
    FController.Model.CDSCadastroRec_Telefone.AsString := sFones;
//==============================================================================
// Contatos
    sContatos := obj.Model.CDSCadastroCli_ContatoFinanceiro.AsString;
    if obj.Model.CDSCadastroCli_ContatoCompraVenda.AsString  <> '' then
      sContatos := sContatos + sLineBreak + obj.Model.CDSCadastroCli_ContatoCompraVenda.AsString;
    FController.Model.CDSCadastroRec_Contato.AsString := sContatos;

    FreeAndNil(obj);
  end;
end;

procedure TfrmRecado.BuscarStatus(AId, ACodigo: Integer);
var
  obj: TStatusController;
begin
  obj := TStatusController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prRecado);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodStatus.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(dsCad.DataSet);
    FController.Model.CDSCadastroRec_Status.AsString := obj.Model.CDSCadastroSta_Id.AsString;
    FController.Model.CDSCadastroSta_Codigo.AsString := obj.Model.CDSCadastroSta_Codigo.AsString;
    FController.Model.CDSCadastroSta_Nome.AsString := obj.Model.CDSCadastroSta_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodStatus.Modified := False;
end;

procedure TfrmRecado.BuscarTipo(AId, ACodigo: Integer);
var
  obj: TTipoController;
begin
  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prRecado);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodTipo.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(dsCad.DataSet);
    FController.Model.CDSCadastroRec_Tipo.AsString := obj.Model.CDSCadastroTip_Id.AsString;
    FController.Model.CDSCadastroTip_Codigo.AsString := obj.Model.CDSCadastroTip_Codigo.AsString;
    FController.Model.CDSCadastroTip_Nome.AsString := obj.Model.CDSCadastroTip_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodTipo.Modified := False;
end;

procedure TfrmRecado.BuscarUsuario(AId, ACodigo: Integer);
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
        if edtCodUsuario.Enabled then
          edtCodUsuario.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(dsCad.DataSet);
    FController.Model.CDSCadastroRec_UsuarioDestino.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
    FController.Model.CDSCadastroUsu_CodigoDest.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
    FController.Model.CDSCadastroNomeUsuarioDest.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodUsuario.Modified := False;
end;

constructor TfrmRecado.create(APesquisar: Boolean; AOperacao: string; AQuadro: Boolean;
  AId: Integer);
begin
  inherited create(nil);
  FQuadro := AQuadro;
  FId := AId;

  FController := TRecadoController.Create;
  FController.ModoAbrEnc := AOperacao;

  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  Localizar('ABCDE');

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;

  FraUsuario.Inicializar();
  FraCliente.Inicializar();
  FraUsuarioDest.Inicializar();
  FraTipo.Inicializar();
  FraStatus.Inicializar();
end;

procedure TfrmRecado.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmRecado.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmRecado.dbmContatoEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmRecado.dbmContatoExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmRecado.dbmContatoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TeclasAtalho(Key, Shift);
end;

procedure TfrmRecado.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmRecado.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmRecado.DBMemo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TeclasAtalho(Key, Shift);
end;

procedure TfrmRecado.dbmEnderecoEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmRecado.dbmEnderecoExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmRecado.dbmEnderecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TeclasAtalho(Key, Shift);
end;

procedure TfrmRecado.dsCadStateChange(Sender: TObject);
begin
  inherited;
  btnEncerrar.Enabled := dsCad.DataSet.State in [dsEdit, dsInsert];
end;

procedure TfrmRecado.edtCodClienteExit(Sender: TObject);
begin
  inherited;
  if edtCodCliente.Modified then
    BuscarCliente(0, StrToIntDef(edtCodCliente.Text, 0));
end;

procedure TfrmRecado.edtCodClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    btnClienteClick(Self);
end;

procedure TfrmRecado.edtCodStatusExit(Sender: TObject);
begin
  inherited;
  if edtCodStatus.Modified then
    BuscarStatus(0, StrToIntDef(edtCodStatus.Text, 0));
end;

procedure TfrmRecado.edtCodStatusKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
//  if Key = VK_F9 then
//    btnStatusClick(Self);
end;

procedure TfrmRecado.edtCodTipoExit(Sender: TObject);
begin
  inherited;
  if edtCodTipo.Modified then
    BuscarTipo(0, StrToIntDef(edtCodTipo.Text, 0));
end;

procedure TfrmRecado.edtCodTipoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    btnTipoClick(Self);
end;

procedure TfrmRecado.edtCodUsuarioExit(Sender: TObject);
begin
  inherited;
  if edtCodUsuario.Modified then
    BuscarUsuario(0, StrToIntDef(edtCodUsuario.Text, 0));
end;

procedure TfrmRecado.edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    btnUsuarioClick(Self);
end;

procedure TfrmRecado.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmRecado.EnviarEmailAoSalvar(AId: Integer);
begin
  if not TFuncoes.ModoDesenvolvimento() then
  begin
    if FController.ModoAbrEnc = '' then
    begin
      if Trim(FController.Model.CDSCadastroRec_DescricaoFinal.AsString) = '' then
        FController.ModoAbrEnc := 'A'
      else
        FController.ModoAbrEnc := 'E';
    end;

    if FController.ModoAbrEnc = 'A' then // se aberto
    begin
      FController.EnviarEmail(FController.Model.CDSCadastroRec_UsuarioLcto.AsInteger,
                              FController.Model.CDSCadastroRec_UsuarioDestino.AsInteger,
                              AId)
    end
    else begin
      FController.EnviarEmail(FController.Model.CDSCadastroRec_UsuarioDestino.AsInteger,
                              FController.Model.CDSCadastroRec_UsuarioLcto.AsInteger,
                              AId);
    end;
  end;

//  if FController.ModoAbrEnc = 'A' then // se aberto
//  begin
//    if not TFuncoes.ModoDesenvolvimento() then
//      FController.EnviarEmail(FController.Model.CDSCadastroRec_UsuarioDestino.AsInteger, AId);
//  end;
end;

procedure TfrmRecado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(FController) then
    FreeAndNil(FController);
end;

procedure TfrmRecado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if FQuadro then
  begin
    if Key = VK_ESCAPE then
      Self.Close;
  end;
end;

procedure TfrmRecado.FormShow(Sender: TObject);
var
  img: TfrmImagens;
  Botao: TPosicaoBotao;
begin
  inherited;
  img := TfrmImagens.Create(Self);
  try
    btnCliente.Glyph := img.btnProcurar.Glyph;
    btnUsuario.Glyph := img.btnProcurar.Glyph;
    btnTipo.Glyph := img.btnProcurar.Glyph;
    btnStatus.Glyph := img.btnProcurar.Glyph;
    btnEncerrar.Glyph := img.btnConfirmar.Glyph;
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
  begin
    btnEncerrar.Visible := False;
    if FId > 0 then
    begin
      FController.FiltrarId(FId);
      btnEditarClick(Self);

      if FController.ModoAbrEnc = 'E' then
      begin
        tsEncerra.Show;
        try
          DBMemo2.SetFocus;
        except
        end;
      end;
    end
    else
      btnNovoClick(Self);
  end;
end;

procedure TfrmRecado.FraStatusbtnProcClick(Sender: TObject);
begin
  inherited;
  FraStatus.TipoPrograma := prRecado;
  FraStatus.btnProcClick(Sender);
end;

procedure TfrmRecado.FraStatusedtCodigoEnter(Sender: TObject);
begin
  inherited;
  FraStatus.TipoPrograma := prRecado;
end;

procedure TfrmRecado.FraTipobtnProcClick(Sender: TObject);
begin
  inherited;
  FraTipo.TipoPrograma := prRecado;
  FraTipo.btnProcClick(Sender);
end;

procedure TfrmRecado.FraTipoedtCodigoEnter(Sender: TObject);
begin
  inherited;
  FraTipo.TipoPrograma := prRecado;
end;

procedure TfrmRecado.HabilitaAbas;
begin
  tsAbertura.Enabled  := True;
  tsEncerra.Enabled   := True;
end;

procedure TfrmRecado.Localizar(ATexto: string);
var
  sCampo: string;
  bContem: Boolean;
  Filtro: TRecadoFiltro;
begin
  sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
  bContem := (cbbPesquisa.ItemIndex = 1);

  Filtro := TRecadoFiltro.Create;
  Filtro.DataInicial := edtDataInicial.Text;
  Filtro.DataFinal := edtDataFinal.Text;
  Filtro.DataInicialDest := edtDataEncerraInicial.Text;
  Filtro.DataFinalDest := edtDataEncerraFinal.Text;
  Filtro.IdUsuarioLcto := FraUsuario.RetornoSelecao();
  Filtro.IdCliente := FraCliente.RetornoSelecao();
  Filtro.IdUsuarioDestino := FraUsuarioDest.RetornoSelecao();
  Filtro.IdTipo := FraTipo.RetornoSelecao();
  Filtro.IdStatus := FraStatus.RetornoSelecao();

  FController.Filtrar(Filtro, sCampo, ATexto, bContem);
  FreeAndNil(Filtro);
end;

procedure TfrmRecado.PermissaoEditar;
var
  Usuario: TUsuarioController;
  UsuarioADM: Boolean;
  IdUsuarioLcto: Integer;
  IdUsuarioDest: Integer;
begin
  if edtCodCliente.Enabled = False then
    Exit;

  Usuario := TUsuarioController.Create;
  try
    UsuarioADM := Usuario.UsuarioADM(DM.IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;

  IdUsuarioLcto := FController.Model.CDSCadastroRec_UsuarioLcto.AsInteger;
  IdUsuarioDest := FController.Model.CDSCadastroRec_UsuarioDestino.AsInteger;

  if UsuarioADM then
  begin
    tsAbertura.Enabled  := True;
    tsEncerra.Enabled   := True;
    Exit;
  end;

  if FController.Model.CDSCadastroRec_DataFinal.AsFloat > 0 then
  begin
    tsAbertura.Enabled  := False;
    tsEncerra.Enabled   := False;
    Exit;
  end;

  if (dm.IdUsuario = IdUsuarioLcto) and (dm.IdUsuario = IdUsuarioDest) then
  begin
    tsAbertura.Enabled  := True;
    tsEncerra.Enabled   := True;
    Exit;
  end;

  tsAbertura.Enabled := (dm.IdUsuario = IdUsuarioLcto);
  tsEncerra.Enabled := (dm.IdUsuario = IdUsuarioDest);
end;

function TfrmRecado.PermissaoExcluir: Boolean;
var
  Usuario: TUsuarioController;
  UsuarioADM: Boolean;
  IdUsuarioLcto: Integer;
  IdUsuarioDest: Integer;
begin
  if edtCodCliente.Enabled = False then
  begin
    Result := False;
    Exit;
  end;

  if FController.Model.CDSConsulta.IsEmpty then
    raise Exception.Create('Não há Registro para Excluir!');

  Usuario := TUsuarioController.Create;
  try
    UsuarioADM := Usuario.UsuarioADM(DM.IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;

  FController.LocalizarId(dbDados.Columns[0].Field.AsInteger);

  IdUsuarioLcto := FController.Model.CDSCadastroRec_UsuarioLcto.AsInteger;
  IdUsuarioDest := FController.Model.CDSCadastroRec_UsuarioDestino.AsInteger;

  if UsuarioADM then
  begin
    Result := True;
    Exit;
  end;

  if (dm.IdUsuario = IdUsuarioLcto) and (dm.IdUsuario = IdUsuarioDest) then
  begin
    Result := True;
    Exit;
  end;

  if FController.Model.CDSCadastroRec_DataFinal.AsFloat = 0 then
  begin
    if dm.IdUsuario = IdUsuarioLcto then
      Result := True
    else
      Result := False;
  end
  else
    Result := False;
end;

function TfrmRecado.RecadoEncerrado: Boolean;
var
  bResult: Boolean;
begin
  bResult := (FController.Model.CDSCadastroRec_DataFinal.AsFloat > 0);

  edtCodStatus.Enabled := not bResult;
  btnStatus.Enabled := not bResult;

  Result := bResult;
end;

procedure TfrmRecado.Salvar;
var
  Id: Integer;
begin
  Id := FController.Salvar(dm.IdUsuario, FController.ModoAbrEnc);

  EnviarEmailAoSalvar(Id);

  if FQuadro then
    Self.Close
  else
    FController.FiltrarId(Id);
end;

procedure TfrmRecado.TeclasAtalho(var Key: Word; Shift: TShiftState);
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
    VK_ESCAPE: btnCancelarClick(Self);
  end;
end;

procedure TfrmRecado.TelaPadrao;
begin
  PageControl1.ActivePageIndex := 0;
end;

end.
