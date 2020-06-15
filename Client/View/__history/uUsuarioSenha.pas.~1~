unit uUsuarioSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uUsuarioController, uDM, uFuncoesSIDomper;

type
  TfrmUsuarioSenha = class(TForm)
    Panel1: TPanel;
    lblUsuario: TLabel;
    edtUsuario: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FIdUsuario: Integer;
    FSiglaPermissao: string;
    FId: Integer;
    FMesmoUsuario: Boolean;
    { Private declarations }
    function ValidarSenha: Boolean;
    procedure Confirmar;
    function Lib_Chamado_Ocorr_Alt_Data_Hora(AUsuario: TUsuarioController): Boolean;
    function Lib_Chamado_Ocorr_Alt(AUsuario: TUsuarioController): Boolean;
    function Lib_Chamado_Ocorr_Exc(AUsuario: TUsuarioController): Boolean;

    function Lib_Atividade_Ocorr_Alt_Data_Hora(AUsuario: TUsuarioController): Boolean;
    function Lib_Atividade_Ocorr_Alt(AUsuario: TUsuarioController): Boolean;
    function Lib_Atividade_Ocorr_Exc(AUsuario: TUsuarioController): Boolean;

    function Lib_Solicitacao_Ocorr_Geral_Alt(AUsuario: TUsuarioController): Boolean;
    function Lib_Solicitacao_Ocorr_Geral_Exc(AUsuario: TUsuarioController): Boolean;
    function Lib_Solicitacao_Ocorr_Tecnica_Alt(AUsuario: TUsuarioController): Boolean;
    function Lib_Solicitacao_Ocorr_Tecnica_Exc(AUsuario: TUsuarioController): Boolean;

    function Lib_Orcamento_Alt_Situacao(AUsuario: TUsuarioController): Boolean;

    procedure SetMesmoUsuario(const Value: Boolean);

  public
    { Public declarations }
    property IdUsuario: Integer read FIdUsuario;
    property MesmoUsuario: Boolean read FMesmoUsuario write SetMesmoUsuario;
    constructor Create(ASiglaPermissao: string; AId: integer = 0);
  end;

var
  frmUsuarioSenha: TfrmUsuarioSenha;

implementation

{$R *.dfm}

uses uImagens;

procedure TfrmUsuarioSenha.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsuarioSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmUsuarioSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmUsuarioSenha.FormShow(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnConfirmar.Glyph := img.btnConfirmar.Glyph;
    btnCancelar.Glyph := img.btnCancelar.Glyph;
  finally
    FreeAndNil(img);
  end;

  if edtUsuario.Visible then
    edtUsuario.SetFocus
  else
    edtSenha.SetFocus;
end;

function TfrmUsuarioSenha.Lib_Atividade_Ocorr_Alt(
  AUsuario: TUsuarioController): Boolean;
var
  Perfil: Integer;
begin
  Result := AUsuario.PermissaoAtividadeOcorrenciaAlterar(AUsuario.Model.CDSCadastroUsu_Id.AsInteger, FId, Perfil);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

function TfrmUsuarioSenha.Lib_Atividade_Ocorr_Alt_Data_Hora(
  AUsuario: TUsuarioController): Boolean;
var
  bMesmoUsuario: Boolean;
begin
  Result := AUsuario.PermissaoAtividadeOcorrenciaDataHora(AUsuario.Model.CDSCadastroUsu_Id.AsInteger, FId, bMesmoUsuario);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

function TfrmUsuarioSenha.Lib_Atividade_Ocorr_Exc(
  AUsuario: TUsuarioController): Boolean;
begin
  Result := AUsuario.PermissaoAtividadeOcorrenciaExcluir(AUsuario.Model.CDSCadastroUsu_Id.AsInteger, FId);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

function TfrmUsuarioSenha.Lib_Chamado_Ocorr_Alt(
  AUsuario: TUsuarioController): Boolean;
var
  Perfil: Integer;
begin
  Result := AUsuario.PermissaoChamadoOcorrenciaAlterar(AUsuario.Model.CDSCadastroUsu_Id.AsInteger, FId, Perfil);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

function TfrmUsuarioSenha.Lib_Chamado_Ocorr_Alt_Data_Hora(
  AUsuario: TUsuarioController): Boolean;
begin
  Result := AUsuario.PermissaoChamadoOcorrenciaDataHora(AUsuario.Model.CDSCadastroUsu_Id.AsInteger, FId, FMesmoUsuario);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

function TfrmUsuarioSenha.Lib_Chamado_Ocorr_Exc(
  AUsuario: TUsuarioController): Boolean;
begin
  Result := AUsuario.PermissaoChamadoOcorrenciaExcluir(AUsuario.Model.CDSCadastroUsu_Id.AsInteger, FId);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

function TfrmUsuarioSenha.Lib_Orcamento_Alt_Situacao(
  AUsuario: TUsuarioController): Boolean;
begin
  Result := AUsuario.PermissaoOrcamentoAlteracaoSituacao(AUsuario.Model.CDSCadastroUsu_Id.AsInteger);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

function TfrmUsuarioSenha.Lib_Solicitacao_Ocorr_Geral_Alt(
  AUsuario: TUsuarioController): Boolean;
begin
  Result := AUsuario.PermissaoSolicitacaoOcorrenciaGeralAlterar(AUsuario.Model.CDSCadastroUsu_Id.AsInteger, FId);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

function TfrmUsuarioSenha.Lib_Solicitacao_Ocorr_Geral_Exc(
  AUsuario: TUsuarioController): Boolean;
begin
  Result := AUsuario.PermissaoSolicitacaoOcorrenciaGeralExcluir(AUsuario.Model.CDSCadastroUsu_Id.AsInteger, FId);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

function TfrmUsuarioSenha.Lib_Solicitacao_Ocorr_Tecnica_Alt(
  AUsuario: TUsuarioController): Boolean;
begin
  Result := AUsuario.PermissaoSolicitacaoOcorrenciaTecnicaAlterar(AUsuario.Model.CDSCadastroUsu_Id.AsInteger, FId);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

function TfrmUsuarioSenha.Lib_Solicitacao_Ocorr_Tecnica_Exc(
  AUsuario: TUsuarioController): Boolean;
begin
  Result := AUsuario.PermissaoSolicitacaoOcorrenciaTecnicaExcluir(AUsuario.Model.CDSCadastroUsu_Id.AsInteger, FId);
  if Result = False then
  begin
    edtUsuario.SetFocus;
    ShowMessage('Usuário sem Permissão!');
  end;
end;

procedure TfrmUsuarioSenha.SetMesmoUsuario(const Value: Boolean);
begin
  FMesmoUsuario := Value;
end;

function TfrmUsuarioSenha.ValidarSenha: Boolean;
var
  Usuario: TUsuarioController;
begin
  Result := False;

  if Trim(edtSenha.Text) = '' then
  begin
    edtSenha.SetFocus;
    raise Exception.Create('Informe a Senha!');
  end;

  if FSiglaPermissao.Trim() = '' then
  begin
    if TFuncoes.SenhaInterna(edtSenha.Text) then
      Result := True
    else begin
      Result := False;
      edtSenha.SetFocus;
      raise Exception.Create('Senha Inválida!');
    end;
  end;

  if (Trim(edtUsuario.Text) = '') and (edtUsuario.Visible) then
  begin
    edtUsuario.SetFocus;
    raise Exception.Create('Informe o Usuário.');
  end;

  Usuario := TUsuarioController.Create;
  try
    Usuario.LocalizarUsuario(edtUsuario.Text, edtSenha.Text);

    if FSiglaPermissao = 'Lib_Chamado_Ocorr_Alt_Data_Hora' then
      Result := Lib_Chamado_Ocorr_Alt_Data_Hora(Usuario)
    else if FSiglaPermissao = 'Lib_Chamado_Ocorr_Alt' then
      Result := Lib_Chamado_Ocorr_Alt(Usuario)
    else if FSiglaPermissao = 'Lib_Chamado_Ocorr_Exc' then
      Result := Lib_Chamado_Ocorr_Exc(Usuario)
    else if FSiglaPermissao = 'Lib_Solicitacao_Ocorr_Geral_Alt' then
      Result := Lib_Solicitacao_Ocorr_Geral_Alt(Usuario)
    else if FSiglaPermissao = 'Lib_Solicitacao_Ocorr_Geral_Exc' then
      Result := Lib_Solicitacao_Ocorr_Geral_Exc(Usuario)
    else if FSiglaPermissao = 'Lib_Solicitacao_Ocorr_Tecnica_Alt' then
      Result := Lib_Solicitacao_Ocorr_Tecnica_Alt(Usuario)
    else if FSiglaPermissao = 'Lib_Solicitacao_Ocorr_Tecnica_Exc' then
      Result := Lib_Solicitacao_Ocorr_Tecnica_Exc(Usuario);

    if FSiglaPermissao = 'Lib_Atividade_Ocorr_Alt_Data_Hora' then
      Result := Lib_Atividade_Ocorr_Alt_Data_Hora(Usuario)
    else if FSiglaPermissao = 'Lib_Atividade_Ocorr_Alt' then
      Result := Lib_Atividade_Ocorr_Alt(Usuario)
    else if FSiglaPermissao = 'Lib_Atividade_Ocorr_Exc' then
      Result := Lib_Atividade_Ocorr_Exc(Usuario)
    else if FSiglaPermissao = 'Lib_Orcamento_Alt_Situacao' then
      Result := Lib_Orcamento_Alt_Situacao(Usuario);


    if Result then
      FIdUsuario := Usuario.Model.CDSCadastroUsu_Id.AsInteger;

  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TfrmUsuarioSenha.btnConfirmarClick(Sender: TObject);
begin
  Confirmar();
end;

procedure TfrmUsuarioSenha.Confirmar;
begin
  if ValidarSenha() then
  begin
    Close;
    ModalResult := mrOk;
  end;
end;

constructor TfrmUsuarioSenha.Create(ASiglaPermissao: string; AId: Integer = 0);
begin
  inherited Create(nil);
  FSiglaPermissao := ASiglaPermissao;

  lblUsuario.Visible := (FSiglaPermissao.Trim() <> '');
  edtUsuario.Visible := (FSiglaPermissao.Trim() <> '');

  FId := AId;
end;

end.
