unit uSolicitacaoTempoManual;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, uImagens, uSolicitacaoController, uSolicitacaoTempoVO, System.Generics.Collections,
  uFuncoesSIDomper, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, uGrade,
  uDMSolicitacao, uUsuarioController, uUsuario, uDM, uStatusController,
  uEnumerador, uStatus, uPosicaoBotao;

type
  TfrmSolicitacaoTempoManual = class(TForm)
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
    procedure edtCodUsuarioExit(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure dbDadosDblClick(Sender: TObject);
    procedure edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtCodStatusExit(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
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
    procedure CarregarGrid;
    procedure BuscarUsuario(AId, ACodigo: Integer);
    procedure BuscarStatus(Id, Codigo: Integer);
    procedure PosicionarAoIncluir;
  public
    { Public declarations }
    constructor create(AIdSolicitacao: Integer);
  end;

var
  frmSolicitacaoTempoManual: TfrmSolicitacaoTempoManual;

implementation

{$R *.dfm}

procedure TfrmSolicitacaoTempoManual.Anterior;
begin
  if tsPesquisa.Showing then
    dsCad.DataSet.Prior;
end;

procedure TfrmSolicitacaoTempoManual.btnAnteriorClick(Sender: TObject);
begin
  Anterior;
end;

procedure TfrmSolicitacaoTempoManual.btnCancelarClick(Sender: TObject);
begin
  TelaPesquisa();
end;

procedure TfrmSolicitacaoTempoManual.btnEditarClick(Sender: TObject);
begin
  Editar();
end;

procedure TfrmSolicitacaoTempoManual.btnExcluirClick(Sender: TObject);
var
  Id: Integer;
begin
  Id := FController.Model.CDSTempoSTemp_Id.AsInteger;
  Excluir(Id);
end;

procedure TfrmSolicitacaoTempoManual.btnNovoClick(Sender: TObject);
begin
  Novo();
end;

procedure TfrmSolicitacaoTempoManual.btnPrimeiroClick(Sender: TObject);
begin
  Primeiro();
end;

procedure TfrmSolicitacaoTempoManual.btnProximoClick(Sender: TObject);
begin
  Proximo();
end;

procedure TfrmSolicitacaoTempoManual.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSolicitacaoTempoManual.btnSalvarClick(Sender: TObject);
begin
  Salvar();
end;

procedure TfrmSolicitacaoTempoManual.btnStatusClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmStatus.create(prSolicitacao, True));
  if dm.IdSelecionado > 0 then
    BuscarStatus(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacaoTempoManual.btnUltimoClick(Sender: TObject);
begin
  Ultimo();
end;

procedure TfrmSolicitacaoTempoManual.btnUsuarioClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmUsuario.create(true));
  if dm.IdSelecionado > 0 then
    BuscarUsuario(dm.IdSelecionado, 0);
end;

procedure TfrmSolicitacaoTempoManual.BuscarStatus(Id, Codigo: Integer);
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

procedure TfrmSolicitacaoTempoManual.BuscarUsuario(AId, ACodigo: Integer);
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

procedure TfrmSolicitacaoTempoManual.Cancelar;
begin
  TelaPesquisa();
end;

procedure TfrmSolicitacaoTempoManual.CarregarGrid;
var
  Item: TSolicitacaoTempoVO;
  Lista: TObjectList<TSolicitacaoTempoVO>;
begin
  dsCad.DataSet.DisableControls;
  try
    FController.Model.CDSTempo.First;
    while not FController.Model.CDSTempo.Eof do
      FController.Model.CDSTempo.Delete;

    Lista := FController.SolicitacaoTempoLocalizarPorSolicitacao(FIdSolicitacao);
    for Item in Lista do
    begin
      FController.Model.CDSTempo.Append;
      FController.Model.CDSTempoSTemp_Id.AsInteger := Item.Id;
      FController.Model.CDSTempoSTemp_UsuarioOperacional.AsInteger := Item.IdUsuario;
      FController.Model.CDSTempoSTemp_Solicitacao.AsInteger := Item.IdSolicitacao;
      FController.Model.CDSTempoSTemp_Data.AsDateTime := Item.Data;
      FController.Model.CDSTempoSTemp_HoraInicio.AsDateTime := Item.HoraInicio;
      FController.Model.CDSTempoUsu_Codigo.AsInteger := Item.Usuario.Codigo;
      FController.Model.CDSTempoUsu_Nome.AsString := Item.Usuario.Nome;

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

constructor TfrmSolicitacaoTempoManual.create(AIdSolicitacao: Integer);
begin
  inherited create(nil);
  FIdSolicitacao := AIdSolicitacao;
  FController := TSolicitacaoController.Create;
  dsCad.DataSet := FController.Model.CDSTempo;
  CarregarGrid();
end;

procedure TfrmSolicitacaoTempoManual.dbDadosDblClick(Sender: TObject);
begin
  Editar();
end;

procedure TfrmSolicitacaoTempoManual.dbDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsCad.DataSet, dbDados, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmSolicitacaoTempoManual.dbDadosTitleClick(Column: TColumn);
begin
  FController.Model.CDSTempo.IndexFieldNames := Column.FieldName;
end;

procedure TfrmSolicitacaoTempoManual.Editar;
var
  Model: TSolicitacaoTempoVO;
begin
  if FController.Model.CDSTempo.IsEmpty then
    raise Exception.Create('N�o h� Item para Editar!');

  FId := FController.Model.CDSTempoSTemp_Id.AsInteger;

  LimparEdicao();

  Model := FController.SolicitacaoTempoObterPorId(FId);
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

procedure TfrmSolicitacaoTempoManual.edtCodStatusExit(Sender: TObject);
begin
  if edtCodStatus.Modified then
    BuscarStatus(0, StrToIntDef(edtCodStatus.Text, 0));
end;

procedure TfrmSolicitacaoTempoManual.edtCodUsuarioExit(Sender: TObject);
begin
  if edtCodUsuario.Modified then
    BuscarUsuario(0, StrToIntDef(edtCodUsuario.Text,0));
end;

procedure TfrmSolicitacaoTempoManual.edtCodUsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F9 then
  begin
    if Sender = edtCodUsuario then
      btnUsuarioClick(Self)
    else
      btnStatusClick(Self);
  end;
end;

procedure TfrmSolicitacaoTempoManual.Excluir(AId: Integer);
begin
  if TFuncoes.Confirmar('Confirmar Exclus�o?') then
    FController.SolicitacaoTempoExcluir(AId);
end;

procedure TfrmSolicitacaoTempoManual.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

procedure TfrmSolicitacaoTempoManual.FormKeyDown(Sender: TObject; var Key: Word;
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
          else
            TelaPesquisa();
        end
        else
          TelaPesquisa();
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

//  if (Shift = [ssCtrl]) and (Key = 79) then // CTRL + O
//    Proximo;
//
//  if (Shift = [ssCtrl]) and (Key = 73) then // CTRL + I
//    Anterior;

//  if (Shift = [ssCtrl]) and (Key = VK_HOME) then // CTRL + HOME
//  if Key = VK_LEFT then
//  begin
//    Primeiro();
//  end;

//  if (Shift = [ssCtrl]) and (Key = VK_END) then // CTRL + END
//  if Key = VK_RIGHT then
//  begin
//    Ultimo();
//  end;

//  if (Shift = [ssCtrl]) and (Key = VK_UP) then // CTRL + ^
//  if Key = VK_UP then
//  begin
//    Anterior();
//  end;

//  if (Shift = [ssCtrl]) and (Key = VK_DOWN) then // CTRL + v
//  if Key = VK_DOWN then
//  begin
//    Proximo();
//  end;
end;

procedure TfrmSolicitacaoTempoManual.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmSolicitacaoTempoManual.FormShow(Sender: TObject);
begin
  TelaPesquisa();
  ImagensBotao();
end;

procedure TfrmSolicitacaoTempoManual.ImagensBotao;
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

procedure TfrmSolicitacaoTempoManual.LimparEdicao;
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

procedure TfrmSolicitacaoTempoManual.Novo;
begin
  TelaEdicao();
  LimparEdicao();

  if edtCodUsuario.Enabled then
    edtCodUsuario.SetFocus;

  FId := 0;
end;

procedure TfrmSolicitacaoTempoManual.PosicionarAoIncluir;
var
  Id: Integer;
begin
  FController.Model.CDSTempo.DisableControls;
  FController.Model.CDSTempo.First;
  Id := 0;
  while not FController.Model.CDSTempo.Eof do
  begin
    if FController.Model.CDSTempoSTemp_Id.AsInteger > Id then
      Id := FController.Model.CDSTempoSTemp_Id.AsInteger;

    FController.Model.CDSTempo.Next;
  end;
  FController.Model.CDSTempo.Locate('STemp_Id', Id, []);
  FController.Model.CDSTempo.EnableControls;
end;

procedure TfrmSolicitacaoTempoManual.Primeiro;
begin
  if tsPesquisa.Showing then
    dsCad.DataSet.First;
end;

procedure TfrmSolicitacaoTempoManual.Proximo;
begin
  if tsPesquisa.Showing then
    dsCad.DataSet.Next;
end;

procedure TfrmSolicitacaoTempoManual.Salvar;
var
  Tempo: TSolicitacaoTempoVO;
  sHoraFinal: string;
begin
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
    FController.SolicitacaoTempoSalvar(Tempo);

    CarregarGrid;

  finally
    FreeAndNil(Tempo);
  end;

  if FId > 0 then
    FController.Model.CDSTempo.Locate('STemp_Id', FId, [])
  else
    PosicionarAoIncluir();


  TelaPesquisa();
end;

procedure TfrmSolicitacaoTempoManual.TelaEdicao;
begin
  tsPesquisa.TabVisible := False;
  tsEdicao.TabVisible := True;
end;

procedure TfrmSolicitacaoTempoManual.TelaPesquisa;
begin
  tsPesquisa.TabVisible := True;
  tsEdicao.TabVisible := False;
end;

procedure TfrmSolicitacaoTempoManual.Ultimo;
begin
  if tsPesquisa.Showing then
    dsCad.DataSet.Last;
end;

end.
