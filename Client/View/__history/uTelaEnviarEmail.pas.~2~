unit uTelaEnviarEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Buttons, uEnviarEmail, Vcl.Menus, uEmailBase, uEmailModelo2;

type
  TfrmTelaEnviarEmail = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    tsConfig: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtPorta: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtLogin: TEdit;
    edtSenha: TEdit;
    Label5: TLabel;
    edtPara: TEdit;
    edtCopia: TEdit;
    Label11: TLabel;
    edtCopiaOculta: TEdit;
    Label12: TLabel;
    Label6: TLabel;
    edtAssunto: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edtNome: TEdit;
    Label9: TLabel;
    mmTexto: TMemo;
    cbbHost: TComboBox;
    OpenDialog: TOpenDialog;
    chkConfLeitura: TCheckBox;
    Label10: TLabel;
    cbbPrioridade: TComboBox;
    btnAnexar: TBitBtn;
    mmoAnexo: TMemo;
    Panel3: TPanel;
    btnEnviar: TBitBtn;
    btnFechar: TBitBtn;
    btnLimparAnexo: TBitBtn;
    Label13: TLabel;
    cbbModelo: TComboBox;
    chkAut: TCheckBox;
    chkAutSSL: TCheckBox;
    procedure btnEnviarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mmTextoEnter(Sender: TObject);
    procedure mmTextoExit(Sender: TObject);
    procedure btnAnexarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimparAnexoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaEnviarEmail: TfrmTelaEnviarEmail;

implementation

{$R *.dfm}

uses uFuncoesSIDomper;

procedure TfrmTelaEnviarEmail.btnAnexarClick(Sender: TObject);
const
  SEPARADOR = ';';
begin
  if OpenDialog.Execute() then
  begin
    if mmoAnexo.Text = '' then
      mmoAnexo.Text := OpenDialog.FileName
    else
      mmoAnexo.Text := mmoAnexo.Text + SEPARADOR + OpenDialog.FileName;
  end;
end;

procedure TfrmTelaEnviarEmail.btnEnviarClick(Sender: TObject);
var
  Email: TEmailBase;
  bEnviado: Boolean;
begin
  btnEnviar.Enabled := False;
  Screen.Cursor := crHourGlass;

  if cbbModelo.ItemIndex = 0 then
    Email := TEmail.Create
  else
    Email := TEmail2.Create;

  try
    Email.Porta             := StrToIntDef(edtPorta.Text, 0);
    Email.Host              := cbbHost.Text;
    Email.UserName          := edtLogin.Text;
    Email.Password          := edtSenha.Text;
    Email.MeuEmail          := edtLogin.Text;
    Email.MeuNome           := edtNome.Text;
    Email.Destinatario      := edtPara.Text;
    Email.Copia             := edtCopia.Text;
    Email.CopiaOculta       := edtCopiaOculta.Text;
    Email.Assunto           := edtAssunto.Text;
    Email.NivelPrioridade   := cbbPrioridade.ItemIndex;
    Email.ConfirmarLeitura  := chkConfLeitura.Checked;
    Email.Texto             := mmTexto.Text;
    Email.ArquivoAnexo      := mmoAnexo.Text;
    Email.Autenticar        := chkAut.Checked;
    Email.AutenticarSSL     := chkAutSSL.Checked;

    bEnviado := Email.EnviarEmail();

  finally
    FreeAndNil(Email);
    Screen.Cursor := crDefault;
    btnEnviar.Enabled := True;
  end;

  if bEnviado then
    ShowMessage('Email enviado com sucesso!');
end;

procedure TfrmTelaEnviarEmail.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaEnviarEmail.btnLimparAnexoClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Confirmar Exclusão dos Anexos?') then
    mmoAnexo.Clear;
end;

procedure TfrmTelaEnviarEmail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmTelaEnviarEmail.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmTelaEnviarEmail.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
  edtNome.SetFocus;
end;

procedure TfrmTelaEnviarEmail.mmTextoEnter(Sender: TObject);
begin
  Self.KeyPreview := False;
end;

procedure TfrmTelaEnviarEmail.mmTextoExit(Sender: TObject);
begin
  Self.KeyPreview := True;
end;

end.
