unit uFormVersao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmVersao = class(TForm)
    mmScript: TMemo;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVersao: TfrmVersao;

implementation

{$R *.dfm}

procedure TfrmVersao.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVersao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
