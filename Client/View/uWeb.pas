unit uWeb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw;

type
  TfrmWeb = class(TForm)
    WebBrowser: TWebBrowser;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Endereco: string); reintroduce;
  end;

var
  frmWeb: TfrmWeb;

implementation

{$R *.dfm}

constructor TfrmWeb.Create(Endereco: string);
begin
  inherited Create(nil);
  WebBrowser.Navigate('http://maps.google.com.br/maps?q=' + Endereco);
end;

procedure TfrmWeb.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
