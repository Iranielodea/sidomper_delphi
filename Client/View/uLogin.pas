unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, uUsuarioVO, Vcl.Imaging.jpeg, uUtilitarioController, Vcl.FileCtrl,
  uFuncoesSIDomper;

type
  TfrmLogin = class(TForm)
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Image1: TImage;
    btnExportarBase: TBitBtn;
    lblUsuario: TLabel;
    lblSenha: TLabel;
    btnImportar: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExportarBaseClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
  private
    { Private declarations }
    FLogou: Boolean;
    procedure EntrarSistema;
    procedure LogarDesenvolvimento();
    function UsuarioExiste(): Boolean;
    procedure ExportarBaseDados();
    procedure ImportarBaseDados();
    procedure VerificaSeExisteLogo();
  public
    { Public declarations }
    property Logou: Boolean read FLogou;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uUsuarioController, uDM, uMenuPrincipal;

procedure TfrmLogin.btnExportarBaseClick(Sender: TObject);
begin
  ExportarBaseDados();
end;

procedure TfrmLogin.btnImportarClick(Sender: TObject);
begin
  ImportarBaseDados();
end;

procedure TfrmLogin.edtSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    EntrarSistema();
end;

procedure TfrmLogin.EntrarSistema;
var
  usuario: TUsuarioController;
begin
  if Trim(edtUsuario.Text) = '' then
  begin
    ShowMessage('Informe o Usu�rio.');
    edtUsuario.SetFocus;
    Exit;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    ShowMessage('Informe a Senha.');
    edtSenha.SetFocus;
    Exit;
  end;

  if (UpperCase(edtUsuario.Text) = 'PERF') then
  begin
    if TFuncoes.SenhaInterna(edtSenha.Text) then
    begin
      btnImportar.Visible := True;
      btnExportarBase.Visible := True;
      Exit;
    end;
  end;

  usuario := TUsuarioController.Create;
  try
    try
      usuario.LocalizarUsuario(edtUsuario.Text, edtSenha.Text);
      dm.IdUsuario := usuario.Model.CDSCadastroUsu_Id.AsInteger;
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        Exit;
      end;
    end;
  finally
    FreeAndNil(usuario);
  end;

  FLogou := True;
  ModalResult := mrOk;
  Self.Close;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  edtUsuario.SetFocus;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FLogou then
    Action := caFree
  else
    Application.Terminate;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  FLogou := False;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  LogarDesenvolvimento();
  UsuarioExiste();
  VerificaSeExisteLogo();
end;

procedure TfrmLogin.ImportarBaseDados;
var
  obj: TUtilitarioController;
begin
  if UsuarioExiste() then
    raise Exception.Create('J� existe usu�rio cadastrado!');

  if TFuncoes.Confirmar('Confirmar importa��o de dados?') then
  begin
    obj := TUtilitarioController.Create;
    try
      obj.ImportarDadosBaseNova();
      ShowMessage('Dados importados com sucesso!');
    finally
      FreeAndNil(obj);
    end;
  end;
end;

procedure TfrmLogin.LogarDesenvolvimento;
var
  Model: TUsuarioVO;
  Controller: TUsuarioController;
begin
  Controller := TUsuarioController.Create;
  try
    Model := Controller.LoginDesenvolvimento();
    if Model.Id > 0 then
    begin
      edtUsuario.Text := Model.UserName;
      edtSenha.Text   := Model.Password;
    end;
  finally
    FreeAndNil(Model);
    FreeAndNil(Controller);
  end;
end;

procedure TfrmLogin.ExportarBaseDados;
var
  obj: TUtilitarioController;
begin
  if not UsuarioExiste() then
    raise Exception.Create('N�o existe usu�rios cadastrados para exportar!');

  if TFuncoes.Confirmar('Confirmar exporta��o de dados?') then
  begin
    obj := TUtilitarioController.Create;
    try
      obj.ExportarDadosBaseNova();
      ShowMessage('Dados exportados com sucesso!');
    finally
      FreeAndNil(obj);
    end;
  end;
end;

function TfrmLogin.UsuarioExiste: Boolean;
var
  usuario: TUsuarioController;
begin
  usuario := TUsuarioController.Create;
  try
    Result := usuario.ExisteUsuario();
  finally
    FreeAndNil(usuario);
  end;
end;

procedure TfrmLogin.VerificaSeExisteLogo;
var
  sArquivo: string;
  sArquivoCompleto: string;
  Lista: TFileListBox;
  sDiretorio: string;
  iCount: Integer;
  i: Integer;
begin
  sDiretorio := ExtractFileDir(Application.ExeName);
  Lista := TFileListBox.Create(nil);
  try
    try
      Lista.Parent := Self;
      Lista.Directory := sDiretorio;
      iCount := Lista.Count;
      for I := 0 to iCount-1 do
      begin
        sArquivoCompleto := ExtractFileName(sDiretorio + '\' +  Lista.Items[i]);
        sArquivo := Copy(sArquivoCompleto, 1, length(sArquivoCompleto)-4);

        if UpperCase(sArquivo) = 'LOGO' then
        begin
          Image1.Picture.LoadFromFile(sArquivoCompleto);
          lblUsuario.Visible := True;
          lblSenha.Visible := True;
          Break;
        end;
      end;
    except
      // nada
    end;
  finally
    FreeAndNil(Lista);
  end;
end;

end.
