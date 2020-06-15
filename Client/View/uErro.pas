unit uErro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

const
  ALTURA: Integer = 233;
  ALTURA_DETALHE: Integer = 338;

type
  TfrmErro = class(TForm)
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnDetalhes: TBitBtn;
    lblErro: TLabel;
    mmoErro: TMemo;
    procedure btnDetalhesClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(Mensagem: string; Metodo: string = '');
  end;

var
  frmErro: TfrmErro;

implementation

{$R *.dfm}

procedure TfrmErro.btnDetalhesClick(Sender: TObject);
begin
  mmoErro.Visible := not (mmoErro.Visible);
  if mmoErro.Visible then
    Self.Height := ALTURA_DETALHE
  else
    Self.Height := ALTURA;

  btnDetalhes.Caption := 'Detalhes';
  if mmoErro.Visible then
    btnDetalhes.Caption := 'Ocultar';
end;

procedure TfrmErro.btnOkClick(Sender: TObject);
begin
  Close;
end;

constructor TfrmErro.Create(Mensagem: string; Metodo: string);
begin
  inherited create(nil);

  lblErro.Caption := Mensagem;

  if Pos('UNIQUE', Mensagem) > 0 then
    lblErro.Caption := 'Registro Já Existe!';

  if Pos('FOREIGN KEY', Mensagem) > 0 then
    lblErro.Caption := 'Violação da Chave Estrangeira!!';

  mmoErro.Text := Mensagem + ' ' + Metodo;
end;

procedure TfrmErro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmErro.FormShow(Sender: TObject);
begin
  Self.Height := ALTURA;
end;

end.
