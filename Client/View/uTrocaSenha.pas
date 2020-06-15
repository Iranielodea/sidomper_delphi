unit uTrocaSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  uUsuarioController;

type
  TfrmTrocaSenha = class(TForm)
    Label1: TLabel;
    edtSenhaAtual: TEdit;
    Label2: TLabel;
    edtNovaSenha: TEdit;
    Label3: TLabel;
    edtRedigitar: TEdit;
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrocaSenha: TfrmTrocaSenha;

implementation

{$R *.dfm}

uses uDM, uImagens;

procedure TfrmTrocaSenha.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTrocaSenha.btnConfirmarClick(Sender: TObject);
var
  Usuario: TUsuarioController;
begin
  if Trim(edtSenhaAtual.Text) = '' then
  begin
    edtSenhaAtual.SetFocus;
    raise Exception.Create('Informe a Senha Atual!');
  end;

  if Trim(edtNovaSenha.Text) = '' then
  begin
    edtNovaSenha.SetFocus;
    raise Exception.Create('Informe a Nova Senha!');
  end;

  if edtNovaSenha.Text <> edtRedigitar.Text then
  begin
    edtNovaSenha.SetFocus;
    raise Exception.Create('Nova Senha diferente da senha redigitada!');
  end;

  Usuario := TUsuarioController.Create;
  try
    Usuario.LocalizarId(dm.IdUsuario);
    if Usuario.Model.CDSCadastroUsu_Password.AsString <> edtSenhaAtual.Text then
    begin
      edtSenhaAtual.SetFocus;
      raise Exception.Create('Senha atual não cadastrada!');
    end;

    Usuario.ModoEdicaoInsercao();
    Usuario.Model.CDSCadastroUsu_Password.AsString := edtNovaSenha.Text;
    Usuario.AlterarSenha(dm.IdSelecionado);

    ShowMessage('Senha Alterada com sucesso!');

  finally
    FreeAndNil(Usuario);
  end;

end;

procedure TfrmTrocaSenha.FormCreate(Sender: TObject);
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
end;

procedure TfrmTrocaSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmTrocaSenha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
