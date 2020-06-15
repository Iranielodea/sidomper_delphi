unit uObservacaoEmail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uDMObservacao, Vcl.DBCtrls, Data.DB;

type
  TfrmObservacaoEmail = class(TForm)
    Panel1: TPanel;
    btnConfirmar: TBitBtn;
    btnVoltar: TBitBtn;
    dsCad: TDataSource;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnVoltarClick(Sender: TObject);
    procedure DBMemo1Enter(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Teclas(Key: Word; Shift: TShiftState);
  public
    { Public declarations }
  end;

var
  frmObservacaoEmail: TfrmObservacaoEmail;

implementation

{$R *.dfm}

procedure TfrmObservacaoEmail.btnConfirmarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmObservacaoEmail.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmObservacaoEmail.DBMemo1Enter(Sender: TObject);
begin
  Self.KeyPreview := False;
end;

procedure TfrmObservacaoEmail.DBMemo1Exit(Sender: TObject);
begin
  Self.KeyPreview := True;
end;

procedure TfrmObservacaoEmail.dsCadStateChange(Sender: TObject);
begin
  btnConfirmar.Enabled := dsCad.DataSet.State in [dsEdit, dsInsert];
end;

procedure TfrmObservacaoEmail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Teclas(Key, Shift);
end;

procedure TfrmObservacaoEmail.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmObservacaoEmail.Teclas(Key: Word; Shift: TShiftState);
begin
  case key of
    VK_ESCAPE: Close;
    VK_F8:
    begin
      if btnConfirmar.Enabled then
      begin
        btnConfirmar.SetFocus;
        btnConfirmarClick(Self);
      end;
    end;
  end;
end;

end.
