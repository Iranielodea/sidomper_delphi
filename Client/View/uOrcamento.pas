unit uOrcamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMOrcamento,
  Vcl.Mask, Vcl.DBCtrls, uFuncoesSIDomper, uOrcamentoController, uFraUsuario,
  uFraProspect, ppPrnabl, ppClass, ppStrtch, ppRichTx, ppBands, ppCache, ppDB,
  ppDesignLayer, ppParameter, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe,
  Vcl.Menus, uFraCliente, uEnumerador, uClienteEmailController, uTipoController,
  uTipo, uFraTipo, uFiltroOrcamento, System.Generics.Collections, uOrcamentoVO,
  uOrcamentoNAprovado, uCidadeController, uCidade, uFraCidade, uContatoVO,
  uContatoController, uUsuarioController, uProduto, uProdutoController, uModulo,
  uModuloController;


type
  TOperacao = (operNovo, operEditar);

  TfrmOrcamento = class(TfrmBaseCadastro)
    PageControl1: TPageControl;
    tsPrincipal: TTabSheet;
    Panel7: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    edtCodigo: TDBEdit;
    edtNome: TDBEdit;
    Label6: TLabel;
    edtCodUsuario: TDBEdit;
    DBEdit2: TDBEdit;
    Label39: TLabel;
    Label40: TLabel;
    edtDataInicial: TMaskEdit;
    edtDataFinal: TMaskEdit;
    tsObservacao: TTabSheet;
    Panel8: TPanel;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    Label8: TLabel;
    EditorObs: TDBRichEdit;
    dsItens: TDataSource;
    tsOcorrencia: TTabSheet;
    Panel9: TPanel;
    dsOcorrencia: TDataSource;
    dbOcorrencia: TDBGrid;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    edtDataOcorrencia: TDBEdit;
    Label11: TLabel;
    DBMemo2: TDBMemo;
    Label12: TLabel;
    btnNovoOco: TBitBtn;
    btnEditarOco: TBitBtn;
    btnSalvarOco: TBitBtn;
    btnExcluirOco: TBitBtn;
    btnCancelarOco: TBitBtn;
    tsVenctos: TTabSheet;
    Panel10: TPanel;
    dbVenctos: TDBGrid;
    dsVencimento: TDataSource;
    edtTotalParcelas: TDBEdit;
    Label14: TLabel;
    edtTotalOrcamento: TDBEdit;
    Label15: TLabel;
    tsUsuario: TTabSheet;
    Panel11: TPanel;
    FraUsuario: TFraUsuario;
    btnFormatarTexto: TBitBtn;
    editorObs2: TRichEdit;
    Label18: TLabel;
    edtCodCliente: TDBEdit;
    DBEdit9: TDBEdit;
    btnCliente: TSpeedButton;
    Label19: TLabel;
    edtCodForma: TDBEdit;
    DBEdit8: TDBEdit;
    btnForma: TSpeedButton;
    pmOrcamento: TPopupMenu;
    Situao1: TMenuItem;
    pmAnalise: TMenuItem;
    pmAprovado: TMenuItem;
    pmNaoAprovado: TMenuItem;
    GroupBox3: TGroupBox;
    DBText1: TDBText;
    Impresso1: TMenuItem;
    EnviodeEmail1: TMenuItem;
    tsCliente: TTabSheet;
    Panel13: TPanel;
    tsItensOrcamento: TTabSheet;
    Panel14: TPanel;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dbItens: TDBGrid;
    edtTotal: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBEdit10: TDBEdit;
    Label24: TLabel;
    DBGrid3: TDBGrid;
    edtCNPJCPF: TDBEdit;
    Label25: TLabel;
    dsEmail: TDataSource;
    N1: TMenuItem;
    Ocorrncia1: TMenuItem;
    mmDuplicar: TMenuItem;
    Label26: TLabel;
    edtCodTipo: TDBEdit;
    DBEdit11: TDBEdit;
    btnTipo: TSpeedButton;
    tsTipo: TTabSheet;
    Panel12: TPanel;
    FraTipo: TFraTipo;
    GroupBox4: TGroupBox;
    Label27: TLabel;
    cbbModeloRel: TComboBox;
    DBRadioGroup1: TDBRadioGroup;
    cbbSubTipo: TComboBox;
    Label28: TLabel;
    cbbEmailEnviado: TComboBox;
    Label29: TLabel;
    edtDataSituacao: TDBEdit;
    Label30: TLabel;
    Label31: TLabel;
    edtDataSituacaoInicial: TMaskEdit;
    Label32: TLabel;
    edtDataSituacaoFinal: TMaskEdit;
    GroupBox5: TGroupBox;
    chkAnalise: TCheckBox;
    chkAprovado: TCheckBox;
    chkNaoAprovado: TCheckBox;
    edtNumeroFiltro: TEdit;
    lbl1: TLabel;
    DBEdit12: TDBEdit;
    Label20: TLabel;
    DBEdit13: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    edtCodCidade: TDBEdit;
    DBEdit15: TDBEdit;
    btnCidade: TSpeedButton;
    DBEdit16: TDBEdit;
    Label35: TLabel;
    DBEdit17: TDBEdit;
    Label36: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label37: TLabel;
    Label38: TLabel;
    DBEdit20: TDBEdit;
    Label41: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label42: TLabel;
    DBEdit23: TDBEdit;
    Label43: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    Label44: TLabel;
    Label45: TLabel;
    DBEdit26: TDBEdit;
    Label46: TLabel;
    edtCPF: TDBEdit;
    FraCliente: TFraCliente;
    tsCidade: TTabSheet;
    Panel15: TPanel;
    FraCidade: TFraCidade;
    pmFaturado: TMenuItem;
    chkFaturado: TCheckBox;
    DBRadioGroup2: TDBRadioGroup;
    dsContato: TDataSource;
    dbContatos: TDBGrid;
    Label47: TLabel;
    mmObsItens: TDBMemo;
    dsModulo: TDataSource;
    dbModulo: TDBGrid;
    Label48: TLabel;
    mmModuloObs: TDBMemo;
    Label49: TLabel;
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
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure DBMemo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbItensDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbOcorrenciaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dsOcorrenciaStateChange(Sender: TObject);
    procedure btnNovoOcoClick(Sender: TObject);
    procedure btnEditarOcoClick(Sender: TObject);
    procedure btnSalvarOcoClick(Sender: TObject);
    procedure btnExcluirOcoClick(Sender: TObject);
    procedure btnCancelarOcoClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure dbVenctosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbVenctosEnter(Sender: TObject);
    procedure dbVenctosExit(Sender: TObject);
    procedure dbVenctosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsVencimentoStateChange(Sender: TObject);
    procedure btnFormatarTextoClick(Sender: TObject);
    procedure EditorObsChange(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure edtCodFormaExit(Sender: TObject);
    procedure btnFormaClick(Sender: TObject);
    procedure pmAnaliseClick(Sender: TObject);
    procedure pmAprovadoClick(Sender: TObject);
    procedure pmNaoAprovadoClick(Sender: TObject);
    procedure dbDadosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Impresso1Click(Sender: TObject);
    procedure EnviodeEmail1Click(Sender: TObject);
    procedure edtCodClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCNPJCPFExit(Sender: TObject);
    procedure Ocorrncia1Click(Sender: TObject);
    procedure edtCodFormaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmDuplicarClick(Sender: TObject);
    procedure dsEmailStateChange(Sender: TObject);
    procedure edtCodTipoExit(Sender: TObject);
    procedure btnTipoClick(Sender: TObject);
    procedure FraTipobtnProcClick(Sender: TObject);
    procedure FraTipoedtCodigoEnter(Sender: TObject);
    procedure edtNomeExit(Sender: TObject);
    procedure edtNumeroFiltroExit(Sender: TObject);
    procedure edtCodCidadeExit(Sender: TObject);
    procedure btnCidadeClick(Sender: TObject);
    procedure FraClientebtnProcClick(Sender: TObject);
    procedure pmFaturadoClick(Sender: TObject);
    procedure dbContatosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbContatosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbContatosEnter(Sender: TObject);
    procedure dbContatosExit(Sender: TObject);
    procedure dbItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbItensEnter(Sender: TObject);
    procedure dbItensExit(Sender: TObject);
    procedure dbItensCellClick(Column: TColumn);
    procedure tsItensOrcamentoShow(Sender: TObject);
    procedure dbModuloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbModuloEnter(Sender: TObject);
    procedure dbModuloExit(Sender: TObject);
    procedure dbItensKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mmObsItensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbVenctosColExit(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    FController: TOrcamentoController;
    FSalvouOcorrencia: Boolean;

    procedure Localizar(ATexto: string);
    procedure EntrarItem(AOperacao: TOperacao; AMostrarApenasModulos: Boolean = False);
    procedure BuscarFormaPagto(AId, ACodigo: Integer);

    function TelaPrincipal: Boolean;
    function TelaItem: Boolean;
    function TeclasAtalho(Sender: TObject; var Key: Word; Shift: TShiftState): Boolean;
    procedure EditarTela();
    procedure BuscarCliente(AId, ACodigo: Integer);
    procedure BuscarCidade(AId, ACodigo: Integer);
    procedure GerarParcelas;
    function AtualizarStatus(ASituacao: Integer; AAtualizar: Boolean): Integer;
    procedure Imprimir(AImpressao: Boolean; AImprimirDireto: Boolean=False);
    procedure AbrirObservacao(ATipo: Integer);
    procedure CarregarEmail;
    procedure Editar(AIdOrcamento: Integer; AOcorrencia: Boolean=False);
    procedure BuscarEmails(AIdCliente: Integer);
    procedure BuscarContatos(AIdCliente: Integer);
    procedure EnviarEmailSituacao(AId: Integer);
    procedure BuscarTipo(AId, ACodigo: Integer);
    function Filtro: TFiltroOrcamento;
    procedure MostrarAbas(AMostrar: Boolean);
    procedure RecalcularParcelas;
    procedure ControleDataSituacao;
    function MotivoNAprovado(AId: Integer): Boolean;
    function FiltroSituacao: string;
    procedure ValidarSituacao(AIdOrcamento, ASituacao: Integer);
    procedure CarregarContatos;
    procedure LimparContatos;
    function ValidaUsuario(ATipo: Integer; ASalvar: Boolean = False): Boolean;
    procedure SituacaoOrcamento;
    procedure BuscarProduto(AId, ACodigo: Integer);
    procedure BuscarModulo(AId, ACodigo: Integer);
    procedure FiltrarModulo(AIdItem: Integer);
    procedure CalcularParcelaNoGrid;
    procedure PermissaoUsuario();
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False);
  end;

var
  frmOrcamento: TfrmOrcamento;

implementation

{$R *.dfm}

uses uGrade, uDM, uImagens, uProspectController, uProspect,
  uOrcamentoDetalhes, uPosicaoBotao, uFormatarTexto, uFormatacaoMemo,
  uClienteController, uCliente, uFormaPagtoController, uFormaPagto,
  uFormaPagtoVO, uObsevacaoController, uObservacao, uOrcamentoImpressao;

procedure TfrmOrcamento.AbrirObservacao(ATipo: Integer);
var
  obs: TObservacaoController;
begin
{parametro ATipo
  1 - Observacao
  2 - Observacao Email
  3 - Observacao Ocorrencia
}

  if EditorObs.ReadOnly = False then
  begin
    TFuncoes.CriarFormularioModal(TfrmObservacao.create(true, prOrcamento));
    obs := TObservacaoController.Create;
    try

      obs.LocalizarId(dm.IdSelecionado);

      case ATipo of
        1:
        begin
          FController.ModoEdicaoInsercao();
          FController.Model.CDSCadastroOrc_Observacao.AsString := obs.Model.CDSCadastroObs_Descricao.AsString;
        end;
        2:
        begin
          FController.ModoEdicaoInsercao();
          FController.Model.CDSCadastroOrc_ObservacaoEmail.AsString :=
          FController.Model.CDSCadastroOrc_ObservacaoEmail.AsString
          + ' '
          + obs.Model.CDSCadastroObs_Descricao.AsString;
        end;
        3:
        begin
          if dsOcorrencia.DataSet.State in [dsEdit, dsInsert] then
          begin
            FController.Model.CDSOcorrenciaOrcOco_Descricao.AsString :=
            FController.Model.CDSOcorrenciaOrcOco_Descricao.AsString
            + ' '
            + obs.Model.CDSCadastroObs_Descricao.AsString;
          end;
        end;
      end;
    finally
      FreeAndNil(obs);
    end;
  end;


end;

function TfrmOrcamento.AtualizarStatus(ASituacao: Integer; AAtualizar: Boolean): Integer;
var
  Id: Integer;
  bResult: Boolean;
begin
  id := 0;
  if not ValidaUsuario(ASituacao) then
    Exit;

  if AAtualizar then
  begin
    DM.Conectar;
    dm.StartTransacao();
    try
      Id := FController.Model.CDSConsultaOrc_Id.AsInteger;

      bResult := True;

      if ASituacao = 3 then
        bResult := MotivoNAprovado(Id);

      if bResult then
      begin
        FController.AtualizarSituacao(ASituacao, FController.Model.CDSConsultaOrc_Id.AsInteger);
        Localizar(edtDescricao.Text);
        FController.Model.CDSConsulta.Locate('Orc_Id', Id, []);
        dm.Commit();
      end
      else begin
        Id := 0;
        dm.Roolback();
      end;
    except
      On E: Exception do
      begin
        dm.Roolback();
        raise Exception.Create(E.Message);
      end;
    end;
  end;

  Result := Id;

  SituacaoOrcamento();

//  case ASituacao of
//    0:
//    begin
//      pmAnalise.Checked := False;
//      pmAprovado.Checked := False;
//      pmNaoAprovado.Checked := False;
//      pmFaturado.Checked := False;
//    end;
//    1:
//    begin
//      pmAnalise.Checked := True;
//      pmAprovado.Checked := False;
//      pmNaoAprovado.Checked := False;
//      pmFaturado.Checked := False;
//    end;
//    2:
//    begin
//      pmAnalise.Checked := False;
//      pmAprovado.Checked := True;
//      pmNaoAprovado.Checked := False;
//      pmFaturado.Checked := False;
//    end;
//    3:
//    begin
//      pmAnalise.Checked := False;
//      pmAprovado.Checked := False;
//      pmNaoAprovado.Checked := True;
//      pmFaturado.Checked := False;
//    end;
//    4:
//    begin
//      pmAnalise.Checked := False;
//      pmAprovado.Checked := False;
//      pmNaoAprovado.Checked := False;
//      pmFaturado.Checked := True;
//    end;
//  end;

end;

procedure TfrmOrcamento.btnCancelarOcoClick(Sender: TObject);
begin
  inherited;
  dsOcorrencia.DataSet.Cancel;
end;

procedure TfrmOrcamento.btnCidadeClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmCidade.create(true));
  if dm.IdSelecionado > 0 then
    BuscarCidade(dm.IdSelecionado, 0);
end;

procedure TfrmOrcamento.btnClienteClick(Sender: TObject);
begin
  inherited;
  if edtCodUsuario.Text = '' then
    raise Exception.Create('Informe o Consultor.');

  TFuncoes.CriarFormularioModal(TfrmCliente.create(FController.Model.CDSCadastroOrc_Usuario.AsInteger ,true));
  if dm.IdSelecionado > 0 then
    BuscarCliente(dm.IdSelecionado, 0);
end;

procedure TfrmOrcamento.btnEditarClick(Sender: TObject);
var
  IdOrcamento: Integer;
begin
  IdOrcamento := dbDados.Columns[0].Field.AsInteger;
  FController.Editar(IdOrcamento, Self);
  inherited;
  Editar(IdOrcamento);
  CarregarContatos;
//  btnSalvar.Enabled := False;
end;

procedure TfrmOrcamento.btnEditarOcoClick(Sender: TObject);
begin
  inherited;
  dsOcorrencia.DataSet.Edit;
  edtDataOcorrencia.SetFocus;
end;

procedure TfrmOrcamento.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmOrcamento.btnExcluirOcoClick(Sender: TObject);
begin
  inherited;
  if TFuncoes.Confirmar('Excluir Item?') then
  begin
    FController.ExcluirOcorrencia();
    dsCad.DataSet.Edit;
  end;
end;

procedure TfrmOrcamento.btnFecharEdicaoClick(Sender: TObject);
begin
  FController.Cancelar;
  inherited;
end;

procedure TfrmOrcamento.btnFiltrarClick(Sender: TObject);
begin
  inherited;
  edtDataInicial.SetFocus;
end;

procedure TfrmOrcamento.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text);
end;

procedure TfrmOrcamento.btnImprimirClick(Sender: TObject);
var
  objFiltro: TFiltroOrcamento;
begin
  FController.Imprimir(dm.IdUsuario);

  objFiltro := Filtro();

  case cbbModeloRel.ItemIndex of
    0: FController.Relatorios(objFiltro, 1);
    1: FController.Relatorios(objFiltro, 3);
    2: FController.Relatorios(objFiltro, 5);
  end;

  FreeAndNil(objFiltro);

  inherited;
end;

procedure TfrmOrcamento.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);
  MostrarAbas(True);
  PageControl1.ActivePageIndex := 0;
  inherited;
  FController.LimparEmail();
  TFuncoes.HabilitarCampo(Self, True);
  editorObs2.Clear;
  editorObs2.Text := FController.Model.CDSCadastroOrc_Observacao.AsString;
  CarregarContatos;
  edtNome.SetFocus;
  ControleDataSituacao();
end;

procedure TfrmOrcamento.btnNovoOcoClick(Sender: TObject);
begin
  inherited;
  dsOcorrencia.DataSet.Append;
  FController.Model.CDSOcorrencia.Append;
  FController.BuscarUsuarioLogado(dm.IdUsuario, 'OCO');
  edtDataOcorrencia.SetFocus;
end;

procedure TfrmOrcamento.btnSalvarClick(Sender: TObject);
var
  Id: Integer;
  model: TOrcamentoVO;
begin
  if ValidaUsuario(FController.Model.CDSConsultaOrc_Situacao.AsInteger, True) = False then
  begin
    Exit;
  end;

  if FController.Model.CDSCadastroOrc_FormaPagto.AsInteger = 0 then
    raise Exception.Create('Informe a Forma de Pagamento!');

  if FController.Model.CDSCadastroOrc_Tipo.AsInteger = 0 then
    raise Exception.Create('Informe o Tipo!');

  if Trim(FController.Model.CDSCadastroOrc_RazaoSocial.AsString) = '' then
    raise Exception.Create('Informe a Raz�o Social!');


  TFormatacao.SalvarMemo(editorObs2, FController.Model.CDSCadastroOrc_Observacao);

  FController.ModoEdicaoInsercao();
  RecalcularParcelas();

  model := TOrcamentoVO.create;
  model.Id := FController.Model.CDSCadastroOrc_Id.AsInteger;
  model.Numero := FController.Model.CDSCadastroOrc_Numero.AsInteger;
  model.Data := FController.Model.CDSCadastroOrc_Data.AsDateTime;
  model.IdUsuario := FController.Model.CDSCadastroOrc_Usuario.AsInteger;
  model.IdCliente := FController.Model.CDSCadastroOrc_Cliente.AsInteger;
  model.Observacao := FController.Model.CDSCadastroOrc_Observacao.AsString;
  model.ObservacaoEmail := FController.Model.CDSCadastroOrc_ObservacaoEmail.AsString;
  model.Situacao := FController.Model.CDSCadastroOrc_Situacao.AsInteger;
  model.IdFormaPagto := FController.Model.CDSCadastroOrc_FormaPagto.AsInteger;
  model.RazaoSocial := FController.Model.CDSCadastroOrc_RazaoSocial.AsString;
  model.Fantasia := FController.Model.CDSCadastroOrc_Fantasia.AsString;
  model.Endereco := FController.Model.CDSCadastroOrc_Endereco.AsString;
  model.Telefone := FController.Model.CDSCadastroOrc_Telefone.AsString;
  model.Contato := FController.Model.CDSCadastroOrc_Contato.AsString;
  model.CnpjCpf := FController.Model.CDSCadastroOrc_Dcto.AsString;
  model.IdTipo := FController.Model.CDSCadastroOrc_Tipo.AsInteger;
  model.SubTipo := FController.Model.CDSCadastroOrc_SubTipo.AsInteger;
  model.EmailEnviado := FController.Model.CDSCadastroOrc_EmailEnviado.AsBoolean;
  model.DataSituacao := FController.Model.CDSCadastroOrc_DataSituacao.AsDateTime;
  model.Logradouro := FController.Model.CDSCadastroOrc_Logradouro.AsString;
  model.Bairro := FController.Model.CDSCadastroOrc_Bairro.AsString;
  model.CEP := FController.Model.CDSCadastroOrc_CEP.AsString;
  model.IdCidade := FController.Model.CDSCadastroOrc_Cidade.AsInteger;
  model.Fone1 := FController.Model.CDSCadastroOrc_Fone1.AsString;
  model.Fone2 := FController.Model.CDSCadastroOrc_Fone2.AsString;
  model.Celular := FController.Model.CDSCadastroOrc_Celular.AsString;
  model.FoneOutro := FController.Model.CDSCadastroOrc_FoneOutro.AsString;
  model.ContatoFinanceiro := FController.Model.CDSCadastroOrc_ContatoFinanceiro.AsString;
  model.ContatoFinanceiroFone := FController.Model.CDSCadastroOrc_ContatoFinanceiroFone.AsString;
  model.ContatoCompraVenda := FController.Model.CDSCadastroOrc_ContatoCompraVenda.AsString;
  model.ContatoCompraVendaFone := FController.Model.CDSCadastroOrc_ContatoCompraVendaFone.AsString;
  model.IE := FController.Model.CDSCadastroOrc_IE.AsString;
  model.RepresentanteLegal := FController.Model.CDSCadastroOrc_RepreLegal.AsString;
  model.RepresentanteLegalCPF := FController.Model.CDSCadastroOrc_RepreLegalCPF.AsString;
  model.Enquadramento := FController.Model.CDSCadastroOrc_Enquadramento.AsString;

  if FController.Model.CDSItens.State in [dsEdit, dsInsert] then
  begin
    if FController.Model.CDSItensProd_Codigo.AsInteger = 0 then
      FController.Model.CDSItens.Cancel;

    if FController.Model.CDSItens.State = dsEdit then
    begin
      if FController.Model.CDSItensProd_Codigo.AsInteger = 0 then
      FController.Model.CDSItens.Delete;
    end;
  end;

  try
    FController.Model.CDSItensModulo.Filtered := False;
    Id := FController.Salvar(dm.IdUsuario, model);
  finally
    FreeAndNil(model);
  end;

  FController.FiltrarId(Id);

  if FSalvouOcorrencia then
  begin
    if not (TFuncoes.ModoDesenvolvimento()) then
      FController.EnviarEmailParaSupervisor(dm.IdUsuario, True);
  end;

  FSalvouOcorrencia := False;

  inherited;
end;

procedure TfrmOrcamento.btnSalvarOcoClick(Sender: TObject);
begin
  inherited;
  if FController.Model.CDSOcorrencia.State = dsInsert then
    FSalvouOcorrencia := True;

  FController.Model.CDSOcorrenciaOrcOco_Orcamento.AsInteger := FController.Model.CDSCadastroOrc_Id.AsInteger;
  dsOcorrencia.DataSet.Post;

  if not (FController.Model.CDSCadastro.State in [dsEdit, dsInsert]) then
    FController.Model.CDSCadastro.Edit;
end;

procedure TfrmOrcamento.btnTipoClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmTipo.create(prOrcamento, true));
  if dm.IdSelecionado > 0 then
    BuscarTipo(dm.IdSelecionado, 0);
end;

procedure TfrmOrcamento.BuscarCidade(AId, ACodigo: Integer);
var
  CidadeController: TCidadeController;
begin
  CidadeController := TCidadeController.Create;
  try
    try
      CidadeController.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodCidade.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
    FController.Model.CDSCadastroOrc_Cidade.AsString := CidadeController.Model.CDSCadastroCid_Id.AsString;
    FController.Model.CDSCadastroCid_Codigo.AsString := CidadeController.Model.CDSCadastroCid_Codigo.AsString;
    FController.Model.CDSCadastroCid_Nome.AsString := CidadeController.Model.CDSCadastroCid_Nome.AsString;
    FController.Model.CDSCadastroCid_UF.AsString := CidadeController.Model.CDSCadastroCid_UF.AsString;
    FreeAndNil(CidadeController);
  end;
  edtCodCidade.Modified := False;
end;

procedure TfrmOrcamento.BuscarCliente(AId, ACodigo: Integer);
var
  obj: TClienteController;
begin
  if edtCodUsuario.Text = '' then
  begin
    FController.Model.CDSCadastroOrc_Cliente.Clear;
    FController.Model.CDSCadastroCli_Codigo.Clear;
    FController.Model.CDSCadastroCli_Nome.Clear;

    raise Exception.Create('Informe o Usu�rio.');
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
    FController.Model.CDSCadastroOrc_Cliente.AsString := obj.Model.CDSCadastroCli_Id.AsString;
    FController.Model.CDSCadastroCli_Codigo.AsString := obj.Model.CDSCadastroCli_Codigo.AsString;
    FController.Model.CDSCadastroCli_Nome.AsString := obj.Model.CDSCadastroCli_Nome.AsString;
    FController.Model.CDSCadastroOrc_RazaoSocial.AsString := obj.Model.CDSCadastroCli_Nome.AsString;
    FController.Model.CDSCadastroOrc_Fantasia.AsString := obj.Model.CDSCadastroCli_Fantasia.AsString;
    FController.Model.CDSCadastroOrc_Dcto.AsString := obj.Model.CDSCadastroCli_Dcto.AsString;
    FController.Model.CDSCadastroOrc_IE.AsString := obj.Model.CDSCadastroCli_IE.AsString;
    FController.Model.CDSCadastroOrc_Logradouro.AsString := obj.Model.CDSCadastroCli_Logradouro.AsString;
    FController.Model.CDSCadastroOrc_Bairro.AsString := obj.Model.CDSCadastroCli_Bairro.AsString;
    FController.Model.CDSCadastroOrc_Cidade.AsString := obj.Model.CDSCadastroCli_Cidade.AsString;
    FController.Model.CDSCadastroCid_Codigo.AsString := obj.Model.CDSCadastroCid_Codigo.AsString;
    FController.Model.CDSCadastroCid_Nome.AsString := obj.Model.CDSCadastroCid_Nome.AsString;
    FController.Model.CDSCadastroOrc_CEP.AsString := obj.Model.CDSCadastroCli_CEP.AsString;
    FController.Model.CDSCadastroCid_UF.AsString := obj.Model.CDSCadastroCid_UF.AsString;
    FController.Model.CDSCadastroOrc_ContatoCompraVenda.AsString := obj.Model.CDSCadastroCli_ContatoCompraVenda.AsString;
    FController.Model.CDSCadastroOrc_ContatoCompraVendaFone.AsString := obj.Model.CDSCadastroCli_ContatoCompraVendaFone.AsString;
    FController.Model.CDSCadastroOrc_ContatoFinanceiro.AsString := obj.Model.CDSCadastroCli_ContatoFinanceiro.AsString;
    FController.Model.CDSCadastroOrc_ContatoFinanceiroFone.AsString := obj.Model.CDSCadastroCli_ContatoFinanceiroFone.AsString;
    FController.Model.CDSCadastroOrc_RepreLegal.AsString := obj.Model.CDSCadastroCli_RepreLegal.AsString;
    FController.Model.CDSCadastroOrc_RepreLegalCPF.AsString := obj.Model.CDSCadastroCli_RepreLegalCPF.AsString;
    FController.Model.CDSCadastroOrc_Fone1.AsString := obj.Model.CDSCadastroCli_Fone1.AsString;
    FController.Model.CDSCadastroOrc_Fone2.AsString := obj.Model.CDSCadastroCli_Fone2.AsString;
    FController.Model.CDSCadastroOrc_Celular.AsString := obj.Model.CDSCadastroCli_Celular.AsString;
    FController.Model.CDSCadastroOrc_FoneOutro.AsString := obj.Model.CDSCadastroCli_FoneOutro.AsString;
    FController.Model.CDSCadastroOrc_Enquadramento.AsString := obj.Model.CDSCadastroCli_Enquadramento.AsString;

    BuscarEmails(obj.Model.CDSCadastroCli_Id.AsInteger);
    BuscarContatos(obj.Model.CDSCadastroCli_Id.AsInteger);

    FreeAndNil(obj);
  end;
  edtCodCliente.Modified := False;
end;

procedure TfrmOrcamento.BuscarContatos(AIdCliente: Integer);
var
  ContatoController: TContatoController;
  ListaContatos: TObjectList<TContatoVO>;
  Item: TContatoVO;
begin

  LimparContatos();
  ContatoController := TContatoController.Create;
  try
    ListaContatos := ContatoController.LocalizarPorCliente(AIdCliente);

    for Item in ListaContatos do
    begin
      FController.Model.CDSContato.Append;
      FController.Model.CDSContatoCont_Id.AsInteger         := Item.Id;
      FController.Model.CDSContatoCont_Cliente.AsInteger    := Item.IdCliente;
      FController.Model.CDSContatoCont_Orcamento.AsInteger  := Item.IdOrcamento;
      FController.Model.CDSContatoCont_Nome.AsString        := Item.Nome;
      FController.Model.CDSContatoCont_Fone1.AsString       := Item.Fone1;
      FController.Model.CDSContatoCont_Fone2.AsString       := Item.Fone2;
      FController.Model.CDSContatoCont_Depto.AsString       := Item.Departamento;
      FController.Model.CDSContatoCont_Email.AsString       := Item.Email;
      FController.Model.CDSContato.Post;
    end;
  finally
    FreeAndNil(ContatoController);
    FreeAndNil(ListaContatos);
  end;
end;

procedure TfrmOrcamento.BuscarEmails(AIdCliente: Integer);
var
  Email: TClienteEmailController;
begin
  Email := TClienteEmailController.Create();
  try
    Email.LocalizarCodigo(AIdCliente);

    if not (Email.Model.CDSConsulta.IsEmpty) then
      FController.LimparEmail();

    while not Email.Model.CDSConsulta.Eof do
    begin
      if Email.Model.CDSConsultaCliEm_Notificar.AsBoolean then
      begin
        FController.Model.CDSEmail.Append;
        FController.Model.CDSEmailId.AsInteger := 0;
        FController.Model.CDSEmailIdOrcamento.AsInteger := 0;
        FController.Model.CDSEmailEmail.AsString := Email.Model.CDSConsultaCliEm_Email.AsString;
        FController.Model.CDSEmail.Post;
      end;
      Email.Model.CDSConsulta.Next;
    end;
  finally
    FreeAndNil(Email);
  end;
end;

procedure TfrmOrcamento.BuscarFormaPagto(AId, ACodigo: Integer);
var
  obj: TFormaPagtoController;
begin
  obj := TFormaPagtoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodForma.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
    FController.Model.CDSCadastroOrc_FormaPagto.AsString := obj.Model.CDSCadastroFpg_Id.AsString;
    FController.Model.CDSCadastroFpg_Codigo.AsString := obj.Model.CDSCadastroFpg_Codigo.AsString;
    FController.Model.CDSCadastroFpg_Nome.AsString := obj.Model.CDSCadastroFpg_Nome.AsString;

    if FController.Model.CDSCadastroOrc_FormaPagto.AsInteger > 0 then
      GerarParcelas();

    FreeAndNil(obj);
  end;
  edtCodForma.Modified := False;
end;

procedure TfrmOrcamento.BuscarModulo(AId, ACodigo: Integer);
var
  obj: TModuloController;
begin
  obj := TModuloController.Create;
  try
    if AId > 0 then
      obj.LocalizarId(AId)
    else
      obj.LocalizarCodigo(ACodigo);
  finally
    if not (FController.Model.CDSItensModulo.State in [dsEdit, dsInsert]) then
      FController.Model.CDSItensModulo.Edit;

    FController.Model.CDSItensModuloOrcIteMod_Modulo.AsString := obj.Model.CDSCadastroMod_Id.AsString;
    FController.Model.CDSItensModuloMod_Codigo.AsString := obj.Model.CDSCadastroMod_Codigo.AsString;
    FController.Model.CDSItensModuloMod_Nome.AsString := obj.Model.CDSCadastroMod_Nome.AsString;

    FreeAndNil(obj);
  end;
end;

procedure TfrmOrcamento.BuscarProduto(AId, ACodigo: Integer);
var
  objProduto: TProdutoController;
begin
  objProduto := TProdutoController.Create;
  try
    if AId > 0 then
      objProduto.LocalizarId(AId)
    else
      objProduto.LocalizarCodigo(ACodigo);
  finally
    if not (FController.Model.CDSItens.State in [dsEdit, dsInsert]) then
      FController.Model.CDSItens.Edit;

    FController.Model.CDSItensOrcIte_Produto.AsString := objProduto.Model.CDSCadastroProd_Id.AsString;
    FController.Model.CDSItensProd_Codigo.AsString := objProduto.Model.CDSCadastroProd_Codigo.AsString;
    FController.Model.CDSItensProd_Nome.AsString := objProduto.Model.CDSCadastroProd_Nome.AsString;

    FreeAndNil(objProduto);
  end;
end;

procedure TfrmOrcamento.BuscarTipo(AId, ACodigo: Integer);
var
  obj: TTipoController;
begin
  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prOrcamento);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodTipo.SetFocus;
      end;
    end;
  finally
    FController.ModoEdicaoInsercao();
    FController.Model.CDSCadastroOrc_Tipo.AsString := obj.Model.CDSCadastroTip_Id.AsString;
    FController.Model.CDSCadastroTip_Codigo.AsString := obj.Model.CDSCadastroTip_Codigo.AsString;
    FController.Model.CDSCadastroTip_Nome.AsString := obj.Model.CDSCadastroTip_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodTipo.Modified := False;
end;

procedure TfrmOrcamento.CalcularParcelaNoGrid;
var
  cValor: Currency;
  iParcelas: Integer;
  cResto: Currency;
  cValorUltima: Currency;
  iReg: Integer;
begin
  try
    dsVencimento.DataSet.DisableControls;
    try
      cValor := FController.Model.CDSVenctosOrcVect_Valor.AsCurrency;

      if FController.Model.CDSVenctos.RecordCount > FController.Model.CDSVenctos.RecNo then
      begin
        iReg := FController.Model.CDSVenctos.RecNo;
        iParcelas := FController.Model.CDSVenctos.RecordCount - FController.Model.CDSVenctos.RecNo;

        if iParcelas > 0 then
        begin
          FController.Model.CDSVenctos.First;
          while not FController.Model.CDSVenctos.Eof do
          begin
            if FController.Model.CDSVenctos.RecNo = iReg then
            begin
              FController.Model.CDSVenctos.Next;
              Break;
            end;

            cValor := cValor + FController.Model.CDSVenctosOrcVect_Valor.AsCurrency;
            FController.Model.CDSVenctos.Next;
          end;

          cValorUltima := 0;
          cResto := 0;
          FController.CalcularParcelasDifUltima(iParcelas, dsItens.DataSet.FieldByName('TotalLiquido').Value - cValor, cValorUltima, cResto);

          while not FController.Model.CDSVenctos.Eof do
          begin
            FController.Model.CDSVenctos.Edit;
            if FController.Model.CDSVenctos.RecordCount = FController.Model.CDSVenctos.RecNo then
              FController.Model.CDSVenctosOrcVect_Valor.AsCurrency := cValorUltima
            else
              FController.Model.CDSVenctosOrcVect_Valor.AsCurrency := cResto;
            FController.Model.CDSVenctos.Post;

            FController.Model.CDSVenctos.Next;
          end;
        end;
        FController.Model.CDSVenctos.RecNo := iReg;
      end;
    except
      On E: Exception do
      begin
        ShowMessage(E.Message + ' - ' + E.ClassName);
      end;
    end;
  finally
    dsVencimento.DataSet.EnableControls;
  end;
end;

procedure TfrmOrcamento.CarregarContatos;
var
  model: TContatoVO;
  lista: TObjectList<TContatoVO>;
  ContatoController: TContatoController;
begin
  ContatoController := TContatoController.Create;

  LimparContatos();

  Lista := ContatoController.LocalizarPorOrcamento(FController.Model.CDSCadastroOrc_Id.AsInteger);
  for model in lista do
  begin
    FController.Model.CDSContato.Append;
    FController.Model.CDSContatoCont_Id.AsInteger := model.Id;
    FController.Model.CDSContatoCont_Cliente.AsInteger := model.IdCliente;
    FController.Model.CDSContatoCont_Orcamento.AsInteger := model.IdOrcamento;
    FController.Model.CDSContatoCont_Nome.AsString := model.Nome;
    FController.Model.CDSContatoCont_Fone1.AsString := model.Fone1;
    FController.Model.CDSContatoCont_Fone2.AsString := model.Fone2;
    FController.Model.CDSContatoCont_Depto.AsString := model.Departamento;
    FController.Model.CDSContatoCont_Email.AsString := model.Email;
    FController.Model.CDSContato.Post;
  end;
  FreeAndNil(lista);
  FreeAndNil(ContatoController);
  FController.Model.CDSContato.First;
end;

procedure TfrmOrcamento.CarregarEmail;
begin
  FController.ListarEmail(FController.Model.CDSCadastroOrc_Id.AsInteger);
end;

procedure TfrmOrcamento.ControleDataSituacao;
begin
  edtDataSituacao.ReadOnly := True;
  edtDataSituacao.TabStop := False;
end;

procedure TfrmOrcamento.edtCNPJCPFExit(Sender: TObject);
begin
  inherited;
  if edtCNPJCPF.Modified then
  begin
    FController.Model.CDSCadastroOrc_Dcto.Text := TFuncoes.MascaraCnpjCpf(edtCNPJCPF.Text);
  end;
end;

constructor TfrmOrcamento.create(APesquisar: Boolean);
begin
  inherited create(nil);
  FController := TOrcamentoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;
  dsOcorrencia.DataSet := FController.Model.CDSOcorrencia;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  cbbCampos.ItemIndex := 1;
  Localizar('ABCDEF');

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;
  FraUsuario.Inicializar();
  FraCliente.Inicializar();
  FraCidade.Inicializar();
  FraTipo.Inicializar();

  FSalvouOcorrencia := False;
end;

procedure TfrmOrcamento.FiltrarModulo(AIdItem: Integer);
begin
  FController.Model.CDSItensModulo.Filter := 'OrcIteMod_OrcamentoItem = ' + IntToStr(AIdItem);
end;

procedure TfrmOrcamento.RecalcularParcelas;
var
  Total: Currency;
  TotalParcela: Currency;
begin
  try
    Total := FController.Model.CDSItensTotalLiquido.Value;
    TotalParcela := FController.Model.CDSVenctosTotalParcelas.Value;
  except
    Total := 0;
    TotalParcela := 0;
  end;

  FController.RecalcularParcelas(FController.Model.CDSCadastroOrc_FormaPagto.AsInteger,
                                 Total,
                                 TotalParcela);
end;

procedure TfrmOrcamento.SituacaoOrcamento;
begin
  case FController.Model.CDSConsultaOrc_Situacao.AsInteger of
    0:
    begin
      pmAnalise.Checked := False;
      pmAprovado.Checked := False;
      pmNaoAprovado.Checked := False;
      pmFaturado.Checked := False;
    end;
    1:
    begin
      pmAnalise.Checked := True;
      pmAprovado.Checked := False;
      pmNaoAprovado.Checked := False;
      pmFaturado.Checked := False;
    end;
    2:
    begin
      pmAnalise.Checked := False;
      pmAprovado.Checked := True;
      pmNaoAprovado.Checked := False;
      pmFaturado.Checked := False;
    end;
    3:
    begin
      pmAnalise.Checked := False;
      pmAprovado.Checked := False;
      pmNaoAprovado.Checked := True;
      pmFaturado.Checked := False;
    end;
    4:
    begin
      pmAnalise.Checked := False;
      pmAprovado.Checked := False;
      pmNaoAprovado.Checked := False;
      pmFaturado.Checked := True;
    end;
  end;
end;

procedure TfrmOrcamento.dbContatosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsContato.DataSet, dbContatos, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmOrcamento.dbContatosEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmOrcamento.dbContatosExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmOrcamento.dbContatosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if not (dsCad.State in [dsInsert, dsEdit]) then
    dsCad.DataSet.Edit;

  case key of
    VK_ESCAPE: btnCancelar.Click;
    VK_F8: btnSalvar.Click;
    VK_RETURN:
    begin
      if dbContatos.SelectedIndex <= 3 then
        dbContatos.SelectedIndex := dbContatos.SelectedIndex + 1
      else begin
        dbContatos.SelectedIndex := 0;
        dsContato.DataSet.Append;
      end;
    end;
  end;

end;

procedure TfrmOrcamento.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmOrcamento.dbDadosMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  SituacaoOrcamento;
//    AtualizarStatus(FController.Model.CDSConsultaOrc_Situacao.AsInteger, False);
end;

procedure TfrmOrcamento.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmOrcamento.dbVenctosColExit(Sender: TObject);
begin
  inherited;
  if FController.Model.CDSVenctos.State = dsEdit then
  begin
    if dbVenctos.SelectedField.Name = 'CDSVenctosOrcVect_Valor' then
    begin
      if FController.Model.CDSVenctosOrcVect_Valor.OldValue <> FController.Model.CDSVenctosOrcVect_Valor.NewValue then
        CalcularParcelaNoGrid();
    end;
  end;
end;

procedure TfrmOrcamento.dbVenctosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsVencimento.DataSet, dbVenctos, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmOrcamento.dbVenctosEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmOrcamento.dbVenctosExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmOrcamento.dbVenctosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    TGrade.NavegarGrid(2, 3, dbVenctos, dsVencimento.DataSet);

  if Key = VK_INSERT then
    Key := 0;

  TeclasAtalho(Sender, Key, Shift);
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmOrcamento.dbItensCellClick(Column: TColumn);
begin
  inherited;
  FiltrarModulo(FController.Model.CDSItensOrcIte_Id.AsInteger);
end;

procedure TfrmOrcamento.dbItensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsItens.DataSet, dbItens, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmOrcamento.dbItensEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmOrcamento.dbItensExit(Sender: TObject);
begin
  inherited;
  if FController.Model.CDSItens.State in [dsEdit, dsInsert] then
  begin
    if FController.Model.CDSItensProd_Codigo.AsInteger > 0 then
      FController.Model.CDSItens.Post;
  end;
  FiltrarModulo(FController.Model.CDSItensOrcIte_Id.AsInteger);
  Self.KeyPreview := True;
end;

procedure TfrmOrcamento.dbItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  col: Integer;
begin
  inherited;

  if Key = VK_ESCAPE then
  begin
    if FController.Model.CDSItens.State in [dsEdit, dsInsert] then
    begin
      FController.Model.CDSItens.Cancel;
      Exit;
    end;
  end;

  if Key = VK_F9 then
  begin
    TFuncoes.CriarFormularioModal(TfrmProduto.create(true));
    if dm.IdSelecionado > 0 then
      BuscarProduto(dm.IdSelecionado,0);
  end;

  if Key = VK_RETURN then
  begin
    col := dbItens.SelectedIndex;
    if dbItens.SelectedIndex <= 5 then
      dbItens.SelectedIndex :=  col + 1
    else begin
      col := 1;
      dbItens.SelectedIndex := col;
      dsItens.DataSet.Append;
    end;

    if dbItens.Columns[col].FieldName = 'Prod_Codigo' then
    begin
      if FController.Model.CDSItensProd_Codigo.AsInteger > 0 then
        BuscarProduto(0, FController.Model.CDSItensProd_Codigo.AsInteger)
      else begin
        if FController.Model.CDSItens.State = dsEdit then
          dsItens.DataSet.Delete;
      end;
    end;
  end;
  TeclasAtalho(Sender, Key, Shift);
end;

procedure TfrmOrcamento.dbItensKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Key = VK_UP) or (Key = VK_DOWN) or (Key = VK_PRIOR) or (Key = VK_NEXT) then
    FiltrarModulo(FController.Model.CDSItensOrcIte_Id.AsInteger);
end;

procedure TfrmOrcamento.DBMemo1Enter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmOrcamento.DBMemo1Exit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmOrcamento.DBMemo1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TeclasAtalho(Sender, Key, Shift);

  if Key = VK_F9 then
  begin
    if Sender = EditorObs then
      AbrirObservacao(1)
    else if Sender = DBMemo1 then
      AbrirObservacao(2)
    else if Sender = DBMemo2 then
      AbrirObservacao(3);
  end;
end;

procedure TfrmOrcamento.dbModuloEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmOrcamento.dbModuloExit(Sender: TObject);
begin
  inherited;
  if FController.Model.CDSItensModulo.State in [dsEdit, dsInsert] then
  begin
    if FController.Model.CDSItensModuloMod_Codigo.AsInteger > 0 then
      FController.Model.CDSItensModulo.Post;
  end;
  Self.KeyPreview := True;
end;

procedure TfrmOrcamento.dbModuloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  col: Integer;
begin
  inherited;

  if Key = VK_ESCAPE then
  begin
    if FController.Model.CDSItensModulo.State in [dsEdit, dsInsert] then
    begin
      FController.Model.CDSItensModulo.Cancel;
      Exit;
    end;
  end;

  if Key = VK_F9 then
  begin
    TFuncoes.CriarFormularioModal(TfrmModulo.create(true));
    if dm.IdSelecionado > 0 then
      BuscarModulo(dm.IdSelecionado,0);
  end;

  if Key = VK_RETURN then
  begin
    col := dbModulo.SelectedIndex;
    if dbModulo.SelectedIndex < 1 then
      dbModulo.SelectedIndex :=  col + 1
    else begin
      col := 0;
      dbModulo.SelectedIndex := col;
      dsModulo.DataSet.Append;
    end;

    if dbModulo.Columns[col].FieldName = 'Mod_Codigo' then
    begin
      if FController.Model.CDSItensModuloMod_Codigo.AsInteger > 0 then
        BuscarModulo(0, FController.Model.CDSItensModuloMod_Codigo.AsInteger);
    end;
  end;
  TeclasAtalho(Sender, Key, Shift);
end;

procedure TfrmOrcamento.dbOcorrenciaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  TGrade.Zebrar(dsOcorrencia.DataSet, dbOcorrencia, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmOrcamento.dsCadStateChange(Sender: TObject);
begin
  inherited;
  btnSalvar.Enabled := (dsCad.State in [dsEdit, dsInsert]) and (dsOcorrencia.State = dsBrowse);
end;

procedure TfrmOrcamento.dsEmailStateChange(Sender: TObject);
begin
  inherited;
  if btnSalvar.Enabled = False then
    btnSalvar.Enabled := dsEmail.DataSet.State in [dsEdit, dsInsert];
end;

procedure TfrmOrcamento.dsOcorrenciaStateChange(Sender: TObject);
begin
  inherited;
  btnNovoOco.Enabled := dsOcorrencia.State = dsBrowse;
  btnEditarOco.Enabled := dsOcorrencia.State = dsBrowse;
  btnSalvarOco.Enabled := dsOcorrencia.State in [dsEdit, dsInsert];
  btnExcluirOco.Enabled := dsOcorrencia.State = dsBrowse;
  btnCancelarOco.Enabled := btnSalvarOco.Enabled;

  btnSalvar.Enabled := (dsCad.State in [dsEdit, dsInsert]) and (dsOcorrencia.State = dsBrowse);

  if dsOcorrencia.DataSet.State = dsBrowse then
    dbOcorrencia.Enabled := True
  else
    dbOcorrencia.Enabled := False;
end;

procedure TfrmOrcamento.dsVencimentoStateChange(Sender: TObject);
begin
  inherited;
  if dsVencimento.State in [dsEdit, dsInsert] then
    btnSalvar.Enabled := True;
end;

procedure TfrmOrcamento.Editar(AIdOrcamento: Integer; AOcorrencia: Boolean);
begin
  FController.ListarEmail(AIdOrcamento);
  EditarTela();
  FController.ModoEdicaoInsercao;
  editorObs2.Text := EditorObs.Text;
//  TFormatacao.CarregarMemo(editorTexto2);

  if AOcorrencia then
  begin
    tsOcorrencia.Show;
    btnNovoOcoClick(Self);
    MostrarAbas(False);
  end
  else begin
    MostrarAbas(True);
    PageControl1.ActivePageIndex := 0;
    if edtNome.Enabled then
      edtNome.SetFocus;
  end;
  ControleDataSituacao();
end;

procedure TfrmOrcamento.edtCodCidadeExit(Sender: TObject);
begin
  inherited;
  if edtCodCidade.Modified then
    BuscarCidade(0, StrToIntDef(edtCodCidade.Text, 0));
end;

procedure TfrmOrcamento.edtCodClienteExit(Sender: TObject);
begin
  inherited;
  if edtCodCliente.Modified then
    BuscarCliente(0, StrToIntDef(edtCodCliente.Text, 0));
end;

procedure TfrmOrcamento.edtCodClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
  begin
    if Sender = edtCodCliente then
      btnClienteClick(Self)
    else if Sender = edtCodForma then
      btnFormaClick(Self)
    else if Sender = edtCodTipo then
      btnTipoClick(Self)
    else if Sender = edtCodCidade then
      btnCidadeClick(Self);
  end;
end;

procedure TfrmOrcamento.edtCodFormaExit(Sender: TObject);
begin
  inherited;
  if edtCodForma.Modified then
    BuscarFormaPagto(0, StrToIntDef(edtCodForma.Text, 0));
end;

procedure TfrmOrcamento.edtCodFormaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F9 then
    btnFormaClick(Self);
end;

procedure TfrmOrcamento.edtCodTipoExit(Sender: TObject);
begin
  inherited;
  if edtCodTipo.Modified then
    BuscarTipo(0, StrToIntDef(edtCodTipo.Text,0));
end;

procedure TfrmOrcamento.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text);
end;

procedure TfrmOrcamento.edtNumeroFiltroExit(Sender: TObject);
begin
  inherited;
  if edtNumeroFiltro.Modified then
  begin
    edtNumeroFiltro.Text := FormatFloat('000000', StrToFloatDef(edtNumeroFiltro.Text, 0));
    edtNumeroFiltro.Modified := False;
  end;
end;

procedure TfrmOrcamento.edtNomeExit(Sender: TObject);
begin
  inherited;
  if edtNome.Modified then
  begin
    if dsCad.State = dsInsert then
      FController.Model.CDSCadastroOrc_DataSituacao.AsDateTime := FController.Model.CDSCadastroOrc_Data.AsDateTime;

    edtNome.Modified := False;
  end;
end;

procedure TfrmOrcamento.EntrarItem(AOperacao: TOperacao; AMostrarApenasModulos: Boolean);
var
  Formulario: TfrmOrcamentoDetalhe;
begin
  inherited;
  if AOperacao = operNovo then
    Formulario := TfrmOrcamentoDetalhe.create(FController, FController.Model.CDSCadastroOrc_Id.AsInteger, 0, edtCodCliente.Enabled)
  else begin
    if FController.Model.CDSItens.RecordCount = 0 then
      raise Exception.Create('N�o h� Itens para Editar!');
    Formulario := TfrmOrcamentoDetalhe.create(FController, FController.Model.CDSCadastroOrc_Id.AsInteger, FController.Model.CDSItensOrcIte_Id.AsInteger, edtCodCliente.Enabled);
  end;
  try
    Formulario.ShowModal;
    if Formulario.Salvou then
      FController.ModoEdicaoInsercao();
  finally
    FreeAndNil(Formulario);
  end;

  RecalcularParcelas;

end;

procedure TfrmOrcamento.EnviarEmailSituacao(AId: Integer);
begin
  FController.LocalizarId(AId);
  FController.EnviarEmailParaSupervisor(dm.IdUsuario);
end;

procedure TfrmOrcamento.EnviodeEmail1Click(Sender: TObject);
begin
  inherited;
  Imprimir(False);
end;

function TfrmOrcamento.Filtro: TFiltroOrcamento;
var
  objFiltro: TFiltroOrcamento;
begin
  objFiltro := TFiltroOrcamento.Create;
  objFiltro.DataInicial := edtDataInicial.Text;
  objFiltro.DataFinal   := edtDataFinal.Text;
  objFiltro.DataSituacaoInicial := edtDataSituacaoInicial.Text;
  objFiltro.DataSituacaoFinal   := edtDataSituacaoFinal.Text;
  objFiltro.Usuario.Id  := FraUsuario.RetornoSelecao();
  objFiltro.Cliente.Id  := FraCliente.RetornoSelecao();
  objFiltro.Cliente.IdCidade := FraCidade.RetornoSelecao();
  objFiltro.IdTipo      := FraTipo.RetornoSelecao();
  objFiltro.Situacao    := FiltroSituacao();
  objFiltro.SubTipo     := cbbSubTipo.ItemIndex;
  objFiltro.EmailEnviado:= Copy(cbbEmailEnviado.Text, 1, 1);
  objFiltro.Numero      := StrToIntDef(edtNumeroFiltro.Text, 0);

  Result := objFiltro;
end;

function TfrmOrcamento.FiltroSituacao: string;
var
  sSituacao: string;
begin
  sSituacao := '';
  if chkAnalise.Checked then
    sSituacao := '1,';
  if chkAprovado.Checked then
    sSituacao := sSituacao + '2,';
  if chkNaoAprovado.Checked then
    sSituacao := sSituacao + '3,';
  if chkFaturado.Checked then
    sSituacao := sSituacao + '4,';

  if sSituacao <> '' then
    sSituacao := Copy(sSituacao, 1, length(sSituacao)-1);

  Result := sSituacao;
end;

procedure TfrmOrcamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FController.Model.CDSItensModulo.Filtered := False;
  inherited;
end;

procedure TfrmOrcamento.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmOrcamento.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  if tsPrincipal.Showing then
//  begin
//    if Key = VK_INSERT then
//    begin
//      if NovoOrcamentoItem then
//        Exit;
//    end;
//
//    if Key = VK_F2 then
//    begin
//      if EditarOrcamentoItem then
//        Exit;
//    end;
//
//    if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
//    begin
//      if ExcluirOrcamentoItem then
//        Exit;
//    end;
//  end;

  if TeclasAtalho(Sender, Key, Shift) then
    Exit;

  inherited;
end;

procedure TfrmOrcamento.FormShow(Sender: TObject);
var
  img: TfrmImagens;
  iPosicao: Integer;
  Botao: TPosicaoBotao;
begin
  inherited;
  img := TfrmImagens.Create(Self);
  try
    btnCliente.Glyph := img.btnProcurar.Glyph;
    btnForma.Glyph := img.btnProcurar.Glyph;
    btnTipo.Glyph := img.btnProcurar.Glyph;
    btnCidade.Glyph := img.btnProcurar.Glyph;

    btnNovoOco.Glyph := img.btnNovoItem.Glyph;
    btnEditarOco.Glyph := img.btnEditar.Glyph;
    btnSalvarOco.Glyph := img.btnSalvar.Glyph;
    btnExcluirOco.Glyph := img.btnEditar.Glyph;
    btnCancelarOco.Glyph := img.btnCancelarItem.Glyph;

  finally
    FreeAndNil(img);
  end;

  iPosicao := 519;
  Botao := TPosicaoBotao.Create(btnNovoOco, iPosicao, 536);
  try
    Botao.PosicaoBotao(btnEditarOco);
    Botao.PosicaoBotao(btnExcluirOco);
    Botao.PosicaoBotao(btnSalvarOco);
    Botao.PosicaoBotao(btnCancelarOco);
  finally
    FreeAndNil(Botao);
  end;

//------------------------------------------------------------------------------
// cadastro
  iPosicao := 6;
  Botao := TPosicaoBotao.Create(btnSalvar, iPosicao, 6);
  try
    Botao.PosicaoBotao(btnCancelar);
  finally
    FreeAndNil(Botao);
  end;

//------------------------------------------------------------------------------
// Pesquisa
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
    Botao.PosicaoBotao(btnSair);
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

  PermissaoUsuario();

  cbbCampos.ItemIndex := 2;
end;

procedure TfrmOrcamento.FraClientebtnProcClick(Sender: TObject);
begin
  inherited;
  FraCliente.btnProcClick(Sender);

end;

procedure TfrmOrcamento.FraTipobtnProcClick(Sender: TObject);
begin
  inherited;
  if Copy(cbbModeloRel.Text, 1, 2) = '03' then
    FraTipo.TipoPrograma := prOrcamentoNAprovado
  else
    FraTipo.TipoPrograma := prOrcamento;
  FraTipo.btnProcClick(Sender);
end;

procedure TfrmOrcamento.FraTipoedtCodigoEnter(Sender: TObject);
begin
  inherited;
  if Copy(cbbModeloRel.Text, 1, 2) = '03' then
    FraTipo.TipoPrograma := prOrcamentoNAprovado
  else
    FraTipo.TipoPrograma := prOrcamento;
end;

procedure TfrmOrcamento.GerarParcelas;
var
  Total: Currency;
begin
  try
    Total := FController.Model.CDSItensTotalLiquido.Value;
  except
    Total := 0;
  end;
  FController.GerarParcelas(FController.Model.CDSCadastroOrc_FormaPagto.AsInteger,
                            Total);
end;

procedure TfrmOrcamento.Impresso1Click(Sender: TObject);
begin
  inherited;
  Imprimir(True);
end;

procedure TfrmOrcamento.Imprimir(AImpressao: Boolean; AImprimirDireto: Boolean);
var
  obj: TfrmOrcamentoImpressao;
  Reg: Integer;
begin
  inherited;

  if FController.Model.CDSConsulta.IsEmpty then
    raise Exception.Create('N�o h� Registros!');

  Reg := FController.Model.CDSConsulta.RecNo;

  obj := TfrmOrcamentoImpressao.create(FController.Model.CDSConsultaOrc_Id.AsInteger, AImpressao, AImprimirDireto);
  try
    obj.ShowModal;
  finally
    FreeAndNil(obj);
  end;

  Localizar(edtDescricao.Text);

  try
    FController.Model.CDSConsulta.RecNo := Reg;
  except
    // nada
  end;

end;

procedure TfrmOrcamento.EditarTela;
begin
  if edtCodCliente.Enabled = False then
  begin
//    btnNovoOco.Enabled := False;
//    btnEditarOco.Enabled := False;
//    btnExcluirOco.Enabled := False;
    dbVenctos.Enabled := False;
    edtDataOcorrencia.Enabled := True;
    DBMemo2.Enabled := True;
  end;
end;

procedure TfrmOrcamento.EditorObsChange(Sender: TObject);
begin
  inherited;
  editorObs2.Text := EditorObs.Text;
end;

procedure TfrmOrcamento.btnFormaClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmFormaPagto.create(true));
  if dm.IdSelecionado > 0 then
    BuscarFormaPagto(dm.IdSelecionado, 0);
end;

procedure TfrmOrcamento.btnFormatarTextoClick(Sender: TObject);
var
  form: TfrmFormatarTexto;
begin
  FController.ModoEdicaoInsercao();
  form := TfrmFormatarTexto.Create(EditorObs);

  if form.ShowModal = mrOk then
  begin
    EditorObs.PasteFromClipboard;
    editorObs2.Clear;
    editorObs2.PasteFromClipboard;
  end;

  FreeAndNil(form);
end;

procedure TfrmOrcamento.LimparContatos;
begin
  FController.Model.CDSContato.DisableControls;
  FController.Model.CDSContato.First;
  while not FController.Model.CDSContato.Eof do
    FController.Model.CDSContato.Delete;

  FController.Model.CDSContato.First;
  FController.Model.CDSContato.EnableControls;
end;

procedure TfrmOrcamento.Localizar(ATexto: string);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
  objFiltro: TFiltroOrcamento;
begin
  try
    objFiltro := Filtro();

    sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
    sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
    bContem := (cbbPesquisa.ItemIndex = 1);

    if sCampo = 'CSituacao' then
    begin
      sCampo := 'Orc_Situacao';
      ATexto := '0';
    end;

    FController.Filtrar(objFiltro, sCampo, ATexto, sSituacao, bContem);
    FController.Model.CDSConsulta.IndexFieldNames := sCampo;
  finally
    FreeAndNil(objFiltro);
  end;
end;

procedure TfrmOrcamento.mmDuplicarClick(Sender: TObject);
begin
  inherited;
  if TFuncoes.Confirmar('Confirmar Replica��o do Or�amento?') then
  begin
    FController.Duplicar(FController.Model.CDSConsultaOrc_Id.AsInteger);
    btnEditarClick(Self);
  end;
end;

procedure TfrmOrcamento.mmObsItensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TeclasAtalho(Sender, Key, Shift);
end;

procedure TfrmOrcamento.MostrarAbas(AMostrar: Boolean);
begin
  tsPrincipal.TabVisible := AMostrar;
  tsItensOrcamento.TabVisible := AMostrar;
  tsObservacao.TabVisible := AMostrar;
  tsVenctos.TabVisible := AMostrar;
end;

function TfrmOrcamento.MotivoNAprovado(AId: Integer): Boolean;
var
  Formulario: TfrmOrcamentoNAprovado;
begin
  Formulario := TfrmOrcamentoNAprovado.Create(AId);
  try
    if Formulario.ShowModal = mrOk then
      Result := True
    else
      Result := False;
  finally
    FreeAndNil(Formulario);
  end;

end;

procedure TfrmOrcamento.Ocorrncia1Click(Sender: TObject);
var
  IdOrcamento: Integer;
begin
  IdOrcamento := dbDados.Columns[0].Field.AsInteger;
  FController.EditarOcorrencia(IdOrcamento);

  tsPesquisa.TabVisible := False;
  tsFiltro.TabVisible := False;
  tsEdicao.TabVisible := True;

  Editar(IdOrcamento, True);
end;

procedure TfrmOrcamento.PageControl1Change(Sender: TObject);
begin
  inherited;
  if dsOcorrencia.State in [dsEdit, dsInsert] then
  begin
    TFuncoes.ControleGuias(PageControl1,
                           tsOcorrencia,
                           btnSalvarOco,
                           'a Ocorr�ncia!');
  end;
end;

procedure TfrmOrcamento.PermissaoUsuario;
var
  UsuarioController: TUsuarioController;
begin
  UsuarioController := TUsuarioController.Create;
  try
    tsUsuario.Enabled := UsuarioController.PermissaoOrcamentoUsuario(dm.IdUsuario);
  finally
    FreeAndNil(UsuarioController);
  end;
end;

procedure TfrmOrcamento.pmAnaliseClick(Sender: TObject);
var
  Id: Integer;
begin
  inherited;
  Id := AtualizarStatus(1, True);
  EnviarEmailSituacao(Id);
end;

procedure TfrmOrcamento.pmAprovadoClick(Sender: TObject);
var
  Id: Integer;
begin
  inherited;
  ValidarSituacao(FController.Model.CDSConsultaOrc_Id.AsInteger, 2);
  Id := AtualizarStatus(2, True);
  EnviarEmailSituacao(Id);
end;

procedure TfrmOrcamento.pmFaturadoClick(Sender: TObject);
var
  Id: Integer;
begin
  inherited;
  ValidarSituacao(FController.Model.CDSConsultaOrc_Id.AsInteger, 4);
  Id := AtualizarStatus(4, True);
  EnviarEmailSituacao(Id);
end;

procedure TfrmOrcamento.pmNaoAprovadoClick(Sender: TObject);
var
  Id: Integer;
begin
  inherited;

  Id := AtualizarStatus(3, True);

  if Id > 0 then
    EnviarEmailSituacao(Id);
end;

function TfrmOrcamento.TeclasAtalho(Sender: TObject; var Key: Word;
  Shift: TShiftState): Boolean;
begin
  Result := False;

  if ((tsEdicao.Showing) and (tsObservacao.Showing)) or ((tsEdicao.Showing) and (tsItensOrcamento.Showing)) then
  begin
    case Key of
      VK_F8:
      begin
        if btnSalvar.Enabled then
        begin
          btnSalvar.SetFocus;
          btnSalvarClick(Self);
          Result := True;
        end;
      end;
      VK_ESCAPE:
      begin
        if btnCancelar.Enabled then
        begin
          btnCancelar.SetFocus;
          btnCancelarClick(Self);
          Result := True;
        end;
      end;
    end;
  end;

  if (tsEdicao.Showing) and (tsOcorrencia.Showing) then
  begin
    case Key of
      VK_INSERT:
      begin
        if btnNovoOco.Enabled then
        begin
          btnNovoOco.SetFocus;
          btnNovoOcoClick(Self);
          Result := True;
          Exit;
        end;
      end;
      VK_F2:
      begin
        if btnEditarOco.Enabled then
        begin
          btnEditarOco.SetFocus;
          btnEditarOcoClick(Self);
          Result := True;
          Exit;
        end;
      end;
      VK_F8:
      begin
        if btnSalvarOco.Enabled then
        begin
          btnSalvarOco.SetFocus;
          btnSalvarOcoClick(Self);
          Result := True;
          Exit;
        end;
      end;
      VK_ESCAPE:
      begin
        if btnCancelarOco.Enabled then
        begin
          btnCancelarOco.SetFocus;
          btnCancelarOcoClick(Self);
          Result := True;
          Exit;
        end;
      end;
    end;

    if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    begin
      if btnExcluirOco.Enabled then
      begin
        btnExcluirOco.SetFocus;
        btnExcluirOcoClick(Self);
        Result := True;
        Exit;
      end;
    end;
  end;

  if (tsEdicao.Showing) and (tsVenctos.Showing) then
  begin
    if Key =  VK_ESCAPE then
    begin
      if dsVencimento.State in [dsEdit, dsInsert] then
      begin
        dsVencimento.DataSet.Cancel;
        Result := True;
        Exit;
      end
      else begin
        if btnCancelar.Enabled then
        begin
          btnCancelar.SetFocus;
          btnCancelarClick(Self);
        end;
        Result := True;
        Exit;
      end;
    end;

    if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    begin
      if tsVenctos.Showing then
      begin
        if FController.Model.CDSVenctos.RecordCount > 0 then
        begin
          if TFuncoes.Confirmar('Excluir Parcela?') then
          begin
            FController.ExcluirVencimento();
            dsVencimento.DataSet.Edit;
            result := True;
          end;
          Exit;
        end;
      end;
    end;

    if Key = VK_F8 then
    begin
      if btnSalvar.Enabled then
      begin
        btnSalvar.SetFocus;
        btnSalvarClick(Self);
      end;
    end;
  end;

  if Key = VK_F7 then
  begin
    if tsPesquisa.Showing then
    begin
      Imprimir(True, True);
      Result := True;
    end;
  end;

end;

function TfrmOrcamento.TelaItem: Boolean;
begin
  Result := ((tsEdicao.Showing) and (tsItensOrcamento.Showing));
end;

function TfrmOrcamento.TelaPrincipal: Boolean;
begin
  Result := ((tsEdicao.Showing) and (tsPrincipal.Showing));
end;

procedure TfrmOrcamento.tsItensOrcamentoShow(Sender: TObject);
begin
  inherited;
  FController.Model.CDSItensModulo.Filtered := True;
  FiltrarModulo(FController.Model.CDSItensOrcIte_Id.AsInteger);
end;

procedure TfrmOrcamento.ValidarSituacao(AIdOrcamento, ASituacao: Integer);
var
  sErro: string;
begin
  sErro := '';
  FController.LocalizarId(AIdOrcamento);
  if (ASituacao = 2) or (ASituacao = 4) then // aprovado e Faturado
  begin
    if Trim(FController.Model.CDSCadastroOrc_Fantasia.AsString) = '' then
      sErro := sErro + ' Informe o Nome Fantasia.' + sLineBreak;

    if Trim(FController.Model.CDSCadastroOrc_Dcto.AsString) = '' then
      sErro := sErro + ' Informe o CNPJ.' + sLineBreak;

    if Trim(FController.Model.CDSCadastroOrc_Logradouro.AsString) = '' then
      sErro := sErro + ' Informe o Endere�o.' + sLineBreak;

    if Trim(FController.Model.CDSCadastroOrc_Bairro.AsString) = '' then
      sErro := sErro + ' Informe o Bairro.' + sLineBreak;

    if FController.Model.CDSCadastroOrc_Cidade.AsInteger = 0 then
      sErro := sErro + ' Informe o Cidade.' + sLineBreak;

    if Trim(FController.Model.CDSCadastroOrc_CEP.AsString) = '' then
      sErro := sErro + ' Informe o CEP.' + sLineBreak;

    if Trim(FController.Model.CDSCadastroOrc_Fone1.AsString) = '' then
      sErro := sErro + ' Informe o Fone1.' + sLineBreak;
  end;

  if ASituacao = 4 then // faturado
  begin
    if Trim(FController.Model.CDSCadastroOrc_RepreLegal.AsString) = '' then
      sErro := sErro + ' Informe o Representante Legal.' + sLineBreak;

    if Trim(FController.Model.CDSCadastroOrc_RepreLegalCPF.AsString) = '' then
      sErro := sErro + ' Informe o CPF do Representante Legal.' + sLineBreak;
  end;

  if sErro <> '' then
    raise Exception.Create(sErro);

end;

function TfrmOrcamento.ValidaUsuario(ATipo: Integer; ASalvar: Boolean = False): Boolean;
var
  UsuarioController: TUsuarioController;
  bUsuarioADM: Boolean;
begin
  if ASalvar = False then
  begin
    if (FController.Model.CDSConsultaOrc_Situacao.AsInteger = 4) and (ATipo = 4) then // Faturado
    begin
      Result := False;
      raise Exception.Create('Situa��o Atual j� est� Faturado');
    end;

    if FController.Model.CDSConsultaOrc_Situacao.AsInteger <> 4 then // diferente que faturado
    begin
      Result := True;
      Exit;
    end;
  end;

  if (ASalvar) and (ATipo <> 4) then
  begin
    Result := True;
    Exit;
  end;

  UsuarioController := TUsuarioController.Create;
  try
    bUsuarioADM := UsuarioController.UsuarioADM(dm.IdUsuario);
  finally
    FreeAndNil(UsuarioController);
  end;

   Result := False;

  if bUsuarioADM then
  begin
    Result := True;
    Exit;
  end;

  Result := TFuncoes.TelaSenha('Lib_Orcamento_Alt_Situacao');
end;

end.
