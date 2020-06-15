unit uChamadoColaborador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDMChamado, uChamadoController, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls, uGrade, uChamadoColaboradorVO, uChamadoColaboradorController,
  System.Generics.Collections;

type
  TfrmChamadoColaborador = class(TForm)
    dbColaborador: TDBGrid;
    dsCad: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    edtCodUsuario: TDBEdit;
    DBEdit1: TDBEdit;
    btnUsuario: TSpeedButton;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    edtDataFim: TDBEdit;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCancelar: TBitBtn;
    Edit1: TEdit;
    BalloonHint1: TBalloonHint;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbColaboradorDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbColaboradorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDataFimKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodUsuarioExit(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edtCodUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FController: TChamadoController;
    FIdOcorrencia: Integer;
    FSalvou: Boolean;
    FListaColaborador: TObjectList<TChamadoColaboradorVO>;
    procedure Novo;
    procedure Editar;
    procedure Salvar;
    procedure Excluir;
    procedure Cancelar;
    procedure BuscarUsuario(AId, ACodigo: Integer);
//    procedure PreencherDados;
  public
    { Public declarations }
    constructor create(AIdOcorrencia: Integer; AController: TChamadoController;
      ListaColaborador: TObjectList<TChamadoColaboradorVO>);
  end;

var
  frmChamadoColaborador: TfrmChamadoColaborador;

implementation

{$R *.dfm}

uses uFuncoesSIDomper, uUsuarioController, uUsuario, uDM, uImagens;

{ TfrmChamadoColaborador }

procedure TfrmChamadoColaborador.btnCancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TfrmChamadoColaborador.btnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TfrmChamadoColaborador.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfrmChamadoColaborador.btnNovoClick(Sender: TObject);
begin
  Novo;
end;

procedure TfrmChamadoColaborador.btnSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TfrmChamadoColaborador.btnUsuarioClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmUsuario.create(true));
  if dm.IdSelecionado > 0 then
    BuscarUsuario(dm.IdSelecionado, 0);
end;

procedure TfrmChamadoColaborador.BuscarUsuario(AId, ACodigo: Integer);
var
  obj: TUsuarioController;
begin
  TFuncoes.ModoEdicaoInsercao(FController.Model.CDSChamadoOcorrColaborador);
  obj := TUsuarioController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodUsuario.SetFocus;
      end;
    end;
  finally
    FController.Model.CDSChamadoOcorrColaboradorChaOCol_Usuario.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
    FController.Model.CDSChamadoOcorrColaboradorUsu_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
    FController.Model.CDSChamadoOcorrColaboradorUsu_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodUsuario.Modified := False;
end;

procedure TfrmChamadoColaborador.Cancelar;
begin
  if dsCad.State in [dsEdit, dsInsert] then
    dsCad.DataSet.Cancel
  else
    Close;
end;

constructor TfrmChamadoColaborador.create(AIdOcorrencia: Integer; AController:
  TChamadoController; ListaColaborador: TObjectList<TChamadoColaboradorVO>);
begin
  inherited create(nil);
  FController := AController;
  FIdOcorrencia := AIdOcorrencia;
  dsCad.DataSet := AController.Model.CDSChamadoOcorrColaborador;
  Edit1.SendToBack;
//  AController.LocalizarChamadoColaborador(AIdOcorrencia);
  FListaColaborador := ListaColaborador;
  AController.Model.CDSChamadoOcorrColaborador.Filter := 'ChaOCol_ChamadoOcorrencia = ' + IntToStr(AIdOcorrencia);
  AController.Model.CDSChamadoOcorrColaborador.Filtered := True;

  FSalvou := False;
end;

//procedure TfrmChamadoColaborador.PreencherDados;
//var
//  i: Integer;
//  Colaborador: TChamadoColaboradorVO;
//begin
//
//  FController.ListaColaboradores.Clear;
//
//  FController.Model.CDSChamadoOcorrColaborador.First;
//  while not FController.Model.CDSChamadoOcorrColaborador.Eof do
//  begin
//    if FController.Model.CDSChamadoOcorrColaboradorChaOCol_ChamadoOcorrencia.AsInteger < 0 then
//    begin
//      Colaborador := TChamadoColaboradorVO.Create;
//      Colaborador.IdOcorrencia  := FController.Model.CDSChamadoOcorrColaboradorChaOCol_ChamadoOcorrencia.AsInteger;
//      Colaborador.HoraInicial   := FController.Model.CDSChamadoOcorrColaboradorChaOcol_HoraInicio.AsDateTime;
//      Colaborador.HoraFim       := FController.Model.CDSChamadoOcorrColaboradorChaOCol_HoraFim.AsDateTime;
//      Colaborador.IdUsuario     := FController.Model.CDSChamadoOcorrColaboradorChaOCol_Usuario.AsInteger;
//
//      FController.ListaColaboradores.Add(Colaborador);
//    end;
//    FController.Model.CDSChamadoOcorrColaborador.Next;
//  end;
//end;

procedure TfrmChamadoColaborador.dbColaboradorDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsCad.DataSet, dbColaborador, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmChamadoColaborador.dbColaboradorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmChamadoColaborador.dsCadStateChange(Sender: TObject);
begin
  dbColaborador.Enabled := not (dsCad.DataSet.State in [dsEdit, dsInsert]);
  btnNovo.Enabled := dsCad.DataSet.State = dsBrowse;
  btnEditar.Enabled := dsCad.DataSet.State = dsBrowse;
  btnSalvar.Enabled := (dsCad.DataSet.State in [dsEdit, dsInsert]);
  btnExcluir.Enabled := btnEditar.Enabled;
  btnCancelar.Enabled := btnSalvar.Enabled;
end;

procedure TfrmChamadoColaborador.Editar;
begin
  if btnEditar.Enabled then
  begin
    dsCad.DataSet.Edit;
    edtCodUsuario.SetFocus;
  end;
end;

procedure TfrmChamadoColaborador.edtCodUsuarioExit(Sender: TObject);
begin
  if edtCodUsuario.Modified then
    BuscarUsuario(0, StrToIntDef(edtCodUsuario.Text, 0));
end;

procedure TfrmChamadoColaborador.edtCodUsuarioKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F9 then
    btnUsuarioClick(Self);
end;

procedure TfrmChamadoColaborador.edtDataFimKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Salvar;
    Edit1.SetFocus;
  end;
end;

procedure TfrmChamadoColaborador.Excluir;
begin
  if btnExcluir.Enabled then
  begin
    if TFuncoes.Confirmar('Confirmar Exclusão?') then
      dsCad.DataSet.Delete;

    if FController.Model.CDSChamadoOcorrColaboradorChaOCol_ChamadoOcorrencia.AsInteger > 0 then
      FController.Model.CDSChamadoOcorrColaborador.ApplyUpdates(0);
  end;
end;

procedure TfrmChamadoColaborador.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FSalvou then
    ModalResult := mrOk;

//  PreencherDados;
  FController.Model.CDSChamadoOcorrColaborador.Filtered := False;

end;

procedure TfrmChamadoColaborador.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_INSERT: Novo();
    VK_F2: Editar();
    VK_F8: Salvar();
    VK_ESCAPE: Cancelar();
  end;

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Excluir();
end;

procedure TfrmChamadoColaborador.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmChamadoColaborador.FormShow(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnEditar.Glyph := img.btnEditar.Glyph;
    btnNovo.Glyph := img.btnNovoItem.Glyph;
    btnUsuario.Glyph := img.btnProcurar.Glyph;
    btnSalvar.Glyph := img.btnSalvar.Glyph;
    btnExcluir.Glyph := img.btnExcluirItem.Glyph;
    btnCancelar.Glyph := img.btnCancelarItem.Glyph;

  finally
    FreeAndNil(img);
  end;

  if dsCad.DataSet.RecordCount = 0 then
    Novo();
end;

procedure TfrmChamadoColaborador.Novo;
begin
  if btnNovo.Enabled then
  begin
    edtCodUsuario.SetFocus;
    dsCad.DataSet.Append;
  end;
end;

procedure TfrmChamadoColaborador.Salvar;
begin
  if btnSalvar.Enabled then
  begin
    if dsCad.DataSet.State in [dsEdit, dsInsert] then
    begin
      FController.Model.CDSChamadoOcorrColaboradorChaOCol_ChamadoOcorrencia.AsInteger := FIdOcorrencia;
      dsCad.DataSet.Post;

//      if FController.Model.CDSChamadoOcorrColaboradorChaOCol_ChamadoOcorrencia.AsInteger > 0 then
//        FController.Model.CDSChamadoOcorrColaborador.ApplyUpdates(0);
      FSalvou := True;

      FController.Model.CDSChamadoOcorrColaborador.Filter := 'ChaOCol_ChamadoOcorrencia = ' + IntToStr(FIdOcorrencia);
    end;
  end;
end;

end.
