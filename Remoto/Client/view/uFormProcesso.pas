unit uFormProcesso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmProcesso = class(TForm)
    Panel1: TPanel;
    lblMensagem: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Mensagem(pMensagem: string);
  end;

var
  frmProcesso: TfrmProcesso;

implementation

{$R *.dfm}

{ TfrmProcesso }

procedure TfrmProcesso.Mensagem(pMensagem: string);
begin
  lblMensagem.Caption := pMensagem;
  Self.Show;
  Self.Update;
end;

end.
