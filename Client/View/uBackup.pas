unit uBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, uUtilitarioController;

type
  TfrmBackup = class(TForm)
    pnlRodape: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    SaveDialog1: TSaveDialog;
    BalloonHint1: TBalloonHint;
    pnlBackup: TPanel;
    Label1: TLabel;
    btnBackup: TSpeedButton;
    lblAguarde: TLabel;
    edtDestino: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnBackupClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure GerarBackup;
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;

implementation

{$R *.dfm}

uses uFuncoesSIDomper, uImagens;

procedure TfrmBackup.FormCreate(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnOk.Glyph := img.btnConfirmar.Glyph;
    btnCancelar.Glyph := img.btnCancelar.Glyph;
  finally
    FreeNotification(img);
  end;
end;

procedure TfrmBackup.btnBackupClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    edtDestino.Text :=SaveDialog1.FileName;
end;

procedure TfrmBackup.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBackup.btnOkClick(Sender: TObject);
begin
  if Trim(edtDestino.Text) = '' then
  begin
    edtDestino.SetFocus;
    raise Exception.Create('Informe o Destino do Backup');
  end;

  if TFuncoes.Confirmar('Confirmar geração de backup?') then
  begin
    try
      GerarBackup();
      ShowMessage('Fim do Backup!');
    except
      ON E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end;
end;

procedure TfrmBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBackup.FormKeyDown(Sender: TObject; var Key: Word; Shift:
    TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmBackup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmBackup.GerarBackup;
var
  obj: TUtilitarioController;
begin
  if Trim(edtDestino.Text) = '' then
  begin
    edtDestino.SetFocus;
    raise Exception.Create('Informe o Destino do Backup!');
  end;

  obj := TUtilitarioController.Create;
  try
    lblAguarde.Visible := True;
    btnCancelar.Enabled := False;
    btnOk.Enabled := False;
    application.ProcessMessages;

    obj.GerarBackup(edtDestino.Text);

  finally
    lblAguarde.Visible := False;
    btnCancelar.Enabled := True;
    btnOk.Enabled := true;

    application.ProcessMessages;

    FreeAndNil(obj);
  end;
end;

end.
