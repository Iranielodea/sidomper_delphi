unit uConferenciaTempoGeral;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, uImagens, uSolicitacaoController, uSolicitacaoTempoVO, System.Generics.Collections,
  uFuncoesSIDomper, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uGrade,
  uDMSolicitacao, uUsuarioController, uUsuario, uDM, uStatusController,
  uEnumerador, uStatus, uPosicaoBotao, uSolicitacao, uChamado, uVisita,
  uSolicitacaoTempoManual;

type
  TfrmConferenciaTempoGeral = class(TForm)
    PageControl1: TPageControl;
    tsPesquisa: TTabSheet;
    tsEdicao: TTabSheet;
    Panel2: TPanel;
    Panel1: TPanel;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodUsuario: TEdit;
    edtNomeUsuario: TEdit;
    edtData: TMaskEdit;
    edtHoraInicial: TMaskEdit;
    edtHoraFinal: TMaskEdit;
    btnSalvar: TBitBtn;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnCancelar: TBitBtn;
    edtUsuario: TEdit;
    btnUsuario: TSpeedButton;
    dbDados: TDBGrid;
    dsCad: TDataSource;
    Label5: TLabel;
    edtCodStatus: TEdit;
    edtNomeStatus: TEdit;
    btnStatus: TSpeedButton;
    edtStatus: TEdit;
    pnl1: TPanel;
    lbl1: TLabel;
    medtDataFiltro: TMaskEdit;
    edt1: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure dbDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbDadosTitleClick(Column: TColumn);
    procedure btnUsuarioClick(Sender: TObject);
    procedure dbDadosDblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodStatusExit(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure medtDataFiltroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FIdSolicitacao: Integer;
    FController: TSolicitacaoController;
    FId: Integer;
    FIdUsuario: Integer;
    procedure ImagensBotao;
    procedure Novo;
    procedure Editar;
    procedure Salvar;
    procedure Excluir(AId: Integer);
    procedure Cancelar;
    procedure TelaPesquisa;
    procedure TelaEdicao;
    procedure LimparEdicao;
    procedure Primeiro;
    procedure Anterior;
    procedure Proximo;
    procedure Ultimo;
    procedure CarregarGrid();
    procedure BuscarUsuario(AId, ACodigo: Integer);
    procedure BuscarStatus(Id, Codigo: Integer);
    procedure DadosIniciais;
    procedure AbrirTelas(APrograma: string; AId: integer);
  public
    { Public declarations }
  end;

var
  frmConferenciaTempoGeral: TfrmConferenciaTempoGeral;

implementation

{$R *.dfm}

procedure TfrmConferenciaTempoGeral.AbrirTelas(APrograma: string; AId: integer);
var
  FSol: TfrmSolicitacaoTempoManual;
  FCha: TfrmChamado;
  FVis: TfrmVisita;
begin
  if APrograma = 'Solicita��o' then
  begin
    FSol := TfrmSolicitacaoTempoManual.create(AId);
    FSol.ShowModal;
    FSol.Free;
    Exit;
  end;

  if APrograma = 'Chamado' then
  begin
    FCha := TfrmChamado.create(AId, False, False, caChamado, True);
    FCha.ShowModal;
    FCha.Free;
    Exit;
  end;

  if APrograma = 'Atividade' then
  begin
    FCha := TfrmChamado.create(AId, False, False, caAtividade, True);
    FCha.ShowModal;
    FCha.Free;
    Exit;
  end;

  if APrograma = 'Visita' then
  begin
    FVis := TfrmVisita.create(AId, True);
    FVis.ShowModal;
    FVis.Free;
    Exit;
  end;

end;

procedure TfrmConferenciaTempoGeral.Anterior;
begin
  if tsPesquisa.Showing then
  begin
    dsCad.DataSet.Prior;
  end;
end;

procedure TfrmConferenciaTempoGeral.btnAnteriorClick(Sender: TObject);
begin
  Anterior;
end;

procedure TfrmConferenciaTempoGeral.btnCancelarClick(Sender: TObject);
begin
  TelaPesquisa();
  medtDataFiltro.SetFocus;
end;

procedure TfrmConferenciaTempoGeral.btnEditarClick(Sender: TObject);
begin
  Editar();
end;

procedure TfrmConferenciaTempoGeral.btnExcluirClick(Sender: TObject);
var
  Id: Integer;
begin
  Id := FController.Model.CDSTempoSTemp_Id.AsInteger;
  Excluir(Id);
end;

procedure TfrmConferenciaTempoGeral.btnNovoClick(Sender: TObject);
begin
  Novo();
end;

procedure TfrmConferenciaTempoGeral.btnPrimeiroClick(Sender: TObject);
begin
  Primeiro();
end;

procedure TfrmConferenciaTempoGeral.btnProximoClick(Sender: TObject);
begin
  Proximo();
end;

procedure TfrmConferenciaTempoGeral.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmConferenciaTempoGeral.btnSalvarClick(Sender: TObject);
begin
  Salvar();
end;

procedure TfrmConferenciaTempoGeral.btnStatusClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmStatus.create(prSolicitacao, True));
  if dm.IdSelecionado > 0 then
    BuscarStatus(dm.IdSelecionado, 0);
end;

procedure TfrmConferenciaTempoGeral.btnUltimoClick(Sender: TObject);
begin
  Ultimo();
end;

procedure TfrmConferenciaTempoGeral.btnUsuarioClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmUsuario.create(true));
  if dm.IdSelecionado > 0 then
    BuscarUsuario(dm.IdSelecionado, 0);
end;

procedure TfrmConferenciaTempoGeral.BuscarStatus(Id, Codigo: Integer);
var
  obj: TStatusController;
begin
  obj := TStatusController.Create;
  try
    try
      obj.Pesquisar(Id, Codigo, prSolicitacao);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodStatus.SetFocus;
      end;
    end;
  finally
    edtStatus.Text := obj.Model.CDSCadastroSta_Id.AsString;
    edtNomeStatus.Text := obj.Model.CDSCadastroSta_Nome.AsString;
    edtCodStatus.Text := TFuncoes.FormatarMascaraCodigo4(obj.Model.CDSCadastroSta_Codigo.AsFloat);

    FreeAndNil(obj);
  end;
  edtCodStatus.Modified := False;
end;

procedure TfrmConferenciaTempoGeral.BuscarUsuario(AId, ACodigo: Integer);
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
    edtUsuario.Text := obj.Model.CDSCadastroUsu_Id.AsString;
    edtCodUsuario.Text := FormatFloat('0000', obj.Model.CDSCadastroUsu_Codigo.AsInteger);
    edtNomeUsuario.Text := obj.Model.CDSCadastroUsu_Nome.AsString;

    if obj.Model.CDSCadastroUsu_Id.AsInteger = 0 then
      edtCodUsuario.Clear;

    FreeAndNil(obj);
  end;
  edtCodUsuario.Modified := False;
end;

procedure TfrmConferenciaTempoGeral.Cancelar;
begin
  TelaPesquisa();
end;

procedure TfrmConferenciaTempoGeral.CarregarGrid();
var
  Item: TSolicitacaoTempoVO;
  Lista: TObjectList<TSolicitacaoTempoVO>;
  sData: string;
  iId: Integer;
begin
  sData := Trim(medtDataFiltro.Text);
  try
    if sData <> DataEmBranco then
      StrToDate(medtDataFiltro.Text);
  except
    edt1.SetFocus;
    raise Exception.Create('Data Inv�lida!');
  end;

  if (sData = DataEmBranco) then
  begin
    edt1.SetFocus;
    raise Exception.Create('Informe a Data!');
  end;

  dsCad.DataSet.DisableControls;
  try
    FController.Model.CDSTempo.First;
    while not FController.Model.CDSTempo.Eof do
      FController.Model.CDSTempo.Delete;

    Lista := FController.ConferenciaPorData(sData, DM.IdUsuario);
    for Item in Lista do
    begin
      FController.Model.CDSTempo.Append;
//      FController.Model.CDSTempoSTemp_Id.AsInteger := Item.Id;
      FController.Model.CDSTempoSol_Id.AsInteger := Item.Id;
      FController.Model.CDSTempoSol_Titulo.AsString := Item.Solicitacao.Titulo;
//      FController.Model.CDSTempoSol_Cliente.AsInteger := Item.Solicitacao.Cliente.Id;
      FController.Model.CDSTempoCli_Nome.AsString := Item.Cliente.RazaoSocial;

//      FController.Model.CDSTempoSTemp_UsuarioOperacional.AsInteger := Item.IdUsuario;
      FController.Model.CDSTempoUsu_Nome.AsString := Item.Usuario.Nome;
//      FController.Model.CDSTempoUsu_Codigo.AsInteger := Item.Usuario.Codigo;

//      FController.Model.CDSTempoSTemp_Solicitacao.AsInteger := Item.IdSolicitacao;
      FController.Model.CDSTempoSTemp_Data.AsDateTime := Item.Data;
      FController.Model.CDSTempoSTemp_HoraInicio.AsDateTime := Item.HoraInicio;
//      FController.Model.CDSTempoSTemp_TotalHoras.AsFloat := Item.TotalHoras;

//      FController.Model.CDSTempoSTemp_Status.AsInteger := Item.Status.Id;
//      FController.Model.CDSTempoSta_Codigo.AsInteger := Item.Status.Codigo;
      FController.Model.CDSTempoSta_Nome.AsString := Item.Status.Nome;
      FController.Model.CDSTempoPrograma.AsString := Item.Programa;

      if Item.HoraFim > 0 then
        FController.Model.CDSTempoSTemp_HoraFim.AsDateTime := Item.HoraFim;

      FController.Model.CDSTempo.Post;
    end;
    FController.Model.CDSTempo.First;
  finally
    dsCad.DataSet.EnableControls;
    FreeAndNil(Lista);
  end;
end;

procedure TfrmConferenciaTempoGeral.DadosIniciais;
begin
  FController := TSolicitacaoController.Create;
  dsCad.DataSet := FController.Model.CDSTempo;
  medtDataFiltro.Text := DateToStr(Date);
  FController.Model.CDSTempo.IndexFieldNames := 'Usu_Nome;STemp_HoraInicio';
  CarregarGrid();
end;

procedure TfrmConferenciaTempoGeral.dbDadosDblClick(Sender: TObject);
begin
  //Editar();
  AbrirTelas(FController.Model.CDSTempoPrograma.AsString, FController.Model.CDSTempoSol_Id.AsInteger);
end;

procedure TfrmConferenciaTempoGeral.dbDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsCad.DataSet, dbDados, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmConferenciaTempoGeral.dbDadosTitleClick(Column: TColumn);
begin
  FController.Model.CDSTempo.IndexFieldNames := Column.FieldName;
end;

procedure TfrmConferenciaTempoGeral.Editar;
var
  Model: TSolicitacaoTempoVO;
begin
  AbrirTelas(FController.Model.CDSTempoPrograma.AsString, FController.Model.CDSTempoSol_Id.AsInteger);
  Exit;

  if FController.Model.CDSTempo.IsEmpty then
    raise Exception.Create('N�o h� Item para Editar!');

  FId := FController.Model.CDSTempoSTemp_Id.AsInteger;

  LimparEdicao();

  Model := FController.SolicitacaoTempoObterPorId(FId);
  FIdSolicitacao := Model.IdSolicitacao;
  edtUsuario.Text := Model.IdUsuario.ToString();
  edtCodUsuario.Text := FormatFloat('0000', Model.Usuario.Codigo);
  edtNomeUsuario.Text := Model.Usuario.Nome;
  edtData.Text := DateToStr(Model.Data);
  edtHoraInicial.Text := FormatDateTime('hh:mm', Model.HoraInicio);

  if Model.HoraFim > 0 then
    edtHoraFinal.Text := FormatDateTime('hh:mm', Model.HoraFim);

  if Model.IdStatus > 0 then
  begin
    edtStatus.Text := Model.IdStatus.ToString();
    edtCodStatus.Text := TFuncoes.FormatarMascaraCodigo4(Model.Status.Codigo);
    edtNomeStatus.Text := Model.Status.Nome;
  end;

  TelaEdicao();
  if edtCodUsuario.Enabled then
    edtCodUsuario.SetFocus;
end;

procedure TfrmConferenciaTempoGeral.edtCodStatusExit(Sender: TObject);
begin
  if edtCodStatus.Modified then
    BuscarStatus(0, StrToIntDef(edtCodStatus.Text, 0));
end;

procedure TfrmConferenciaTempoGeral.Excluir(AId: Integer);
begin
  Exit;
  if TFuncoes.Confirmar('Confirmar Exclus�o?') then
  begin
    FController.SolicitacaoTempoExcluir(AId);
    CarregarGrid();
  end;
end;

procedure TfrmConferenciaTempoGeral.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

procedure TfrmConferenciaTempoGeral.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_INSERT : Novo;
    VK_F2     : Editar;
    VK_F8     : Salvar;
    VK_ESCAPE :
    begin
      if tsPesquisa.Showing then
        Close
      else begin
        if tsEdicao.Showing then
        begin
          if dsCad.DataSet.State in [dsEdit, dsInsert] then
          begin
            begin
              btnCancelar.SetFocus;
              Cancelar();
            end;
  //          raise Exception.Create('Salve ou Cancele para Sair.');
          end
          else begin
            TelaPesquisa();
            medtDataFiltro.SetFocus;
          end;
        end
        else begin
          TelaPesquisa();
          medtDataFiltro.SetFocus;
        end;
//        try
//          edtDescricao.SetFocus;
//        except
//          // nada
//        end;
      end;
    end;
  end;

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Excluir(dsCad.DataSet.FieldByName('STemp_Id').AsInteger);

  if (Shift = [ssCtrl]) and (Key = 79) then // CTRL + O
    Proximo;

  if (Shift = [ssCtrl]) and (Key = 73) then // CTRL + I
    Anterior;

//  if (Shift = [ssCtrl]) and (Key = VK_HOME) then // CTRL + HOME
  if Key = VK_LEFT then
  begin
    if medtDataFiltro.Focused then
      Primeiro();
  end;

//  if (Shift = [ssCtrl]) and (Key = VK_END) then // CTRL + END
  if Key = VK_RIGHT then
  begin
    if medtDataFiltro.Focused then
      Ultimo();
  end;

//  if (Shift = [ssCtrl]) and (Key = VK_UP) then // CTRL + ^
  if Key = VK_UP then
  begin
    if medtDataFiltro.Focused then
      Anterior();
  end;

//  if (Shift = [ssCtrl]) and (Key = VK_DOWN) then // CTRL + v
  if Key = VK_DOWN then
  begin
    if medtDataFiltro.Focused then
      Proximo();
  end;
end;

procedure TfrmConferenciaTempoGeral.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmConferenciaTempoGeral.FormShow(Sender: TObject);
begin
  DadosIniciais();
  TelaPesquisa();
  ImagensBotao();
  medtDataFiltro.Text := DateToStr(Date);
  medtDataFiltro.SetFocus;
end;

procedure TfrmConferenciaTempoGeral.ImagensBotao;
var
  Imagem: TfrmImagens;
  Botao: TPosicaoBotao;
  iPosicao: Integer;
begin
  Imagem := TfrmImagens.Create(Self);
  try
    btnPrimeiro.Glyph := Imagem.btnPrimeiro.Glyph;
    btnAnterior.Glyph := Imagem.btnAnterior.Glyph;
    btnProximo.Glyph := Imagem.btnProximo.Glyph;
    btnUltimo.Glyph := Imagem.btnUltimo.Glyph;
    btnNovo.Glyph := Imagem.btnNovo.Glyph;
    btnEditar.Glyph := Imagem.btnEditar.Glyph;
    btnExcluir.Glyph := Imagem.btnExcluir.Glyph;
    btnSair.Glyph := Imagem.btnSair.Glyph;
    btnSalvar.Glyph := Imagem.btnSalvar.Glyph;
    btnCancelar.Glyph := Imagem.btnCancelar.Glyph;
    btnPrimeiro.Glyph := Imagem.btnPrimeiro.Glyph;
    btnUsuario.Glyph := Imagem.btnProcurar.Glyph;
    btnStatus.Glyph := Imagem.btnProcurar.Glyph;
  finally
    FreeAndNil(Imagem);
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
    Botao.PosicaoBotao(btnSair);
  finally
    FreeAndNil(Botao);
  end;
//------------------------------------------------------------------------------
// Cadastro

  iPosicao := 6;
  Botao := TPosicaoBotao.Create(btnSalvar, iPosicao, 6);
  try
    Botao.PosicaoBotao(btnCancelar);
  finally
    FreeAndNil(Botao);
  end;
end;

procedure TfrmConferenciaTempoGeral.LimparEdicao;
begin
  edtUsuario.Clear;
  edtCodUsuario.Clear;
  edtNomeUsuario.Clear;
  edtData.Clear;
  edtHoraInicial.Clear;
  edtHoraFinal.Clear;
  edtStatus.Clear;
  edtCodStatus.Clear;
  edtNomeStatus.Clear;
end;

procedure TfrmConferenciaTempoGeral.medtDataFiltroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    CarregarGrid();
    edt1.SetFocus;
  end;
end;

procedure TfrmConferenciaTempoGeral.Novo;
begin
  Exit;
  if FController.Model.CDSTempo.IsEmpty then
    raise Exception.Create('N�o h� Item para Inserir!');

  TelaEdicao();
  LimparEdicao();

  FIdSolicitacao := FController.Model.CDSTempoSol_Id.AsInteger;

  if edtCodUsuario.Enabled then
    edtCodUsuario.SetFocus;

  edtData.Text := medtDataFiltro.Text;

  FId := 0;
end;

procedure TfrmConferenciaTempoGeral.Primeiro;
begin
  if tsPesquisa.Showing then
  begin
    dsCad.DataSet.First;
  end;
end;

procedure TfrmConferenciaTempoGeral.Proximo;
begin
  if tsPesquisa.Showing then
  begin
    dsCad.DataSet.Next;
  end;
end;

procedure TfrmConferenciaTempoGeral.Salvar;
var
  Tempo: TSolicitacaoTempoVO;
  sHoraFinal: string;
  iId: Integer;
begin
  Exit;
  if edtCodUsuario.Text = '' then
  begin
    edtCodUsuario.SetFocus;
    raise Exception.Create('Informe o Usu�rio');
  end;

  try
    StrToDate(edtData.Text);
  except
    edtData.SetFocus;
    raise Exception.Create('Data Inv�lida!');
  end;

  try
    StrToTime(edtHoraInicial.Text);
  except
    edtHoraInicial.SetFocus;
    raise Exception.Create('Hora Inicial Inv�lida!');
  end;

  sHoraFinal := '00:00';
  if edtHoraFinal.Text <> '  :  ' then
  begin
    sHoraFinal := edtHoraFinal.Text;
    try
      StrToTime(edtHoraInicial.Text);
    except
      edtHoraInicial.SetFocus;
      raise Exception.Create('Hora Inv�lida!');
    end;

    if StrToTime(edtHoraInicial.Text) > StrToTime(edtHoraFinal.Text) then
    begin
      edtHoraInicial.SetFocus;
      raise Exception.Create('Hora Inicial maior que Hora Final!');
    end;
  end;

  if StrToIntDef(edtStatus.Text, 0) = 0 then
  begin
    edtCodStatus.SetFocus;
    raise Exception.Create('Informe o Status');
  end;

  Tempo := TSolicitacaoTempoVO.create;
  try
    Tempo.Id            := FId;
    Tempo.IdSolicitacao := FIdSolicitacao;
    Tempo.IdUsuario     := StrToInt(edtUsuario.Text);
    Tempo.Data          := StrToDate(edtData.Text);
    Tempo.HoraInicio    := StrToTime(edtHoraInicial.Text);
    Tempo.HoraFim       := StrToTime(sHoraFinal);
    Tempo.IdStatus      := StrToIntDef(edtStatus.Text, 0);
    iId := FController.SolicitacaoTempoSalvar(Tempo);

    CarregarGrid();

  finally
    FreeAndNil(Tempo);
  end;

  TelaPesquisa();
  medtDataFiltro.SetFocus;
end;

procedure TfrmConferenciaTempoGeral.TelaEdicao;
begin
  tsPesquisa.TabVisible := False;
  tsEdicao.TabVisible := True;
end;

procedure TfrmConferenciaTempoGeral.TelaPesquisa;
begin
  tsPesquisa.TabVisible := True;
  tsEdicao.TabVisible := False;
end;

procedure TfrmConferenciaTempoGeral.Ultimo;
begin
  if tsPesquisa.Showing then
  begin
    dsCad.DataSet.Last;
  end;
end;

end.
