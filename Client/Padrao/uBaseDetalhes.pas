unit uBaseDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmBaseDetalhes = class(TForm)
    Panel4: TPanel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseDetalhes: TfrmBaseDetalhes;

implementation

{$R *.dfm}

uses uImagens;

procedure TfrmBaseDetalhes.FormCreate(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnSalvar.Glyph := img.btnSalvar.Glyph;
    btnCancelar.Glyph := img.btnCancelar.Glyph;
  finally
    FreeAndNil(img);
  end;

  btnSalvar.Top := 6;
  btnSalvar.Left := 8;

  btnCancelar.Top := 6;
  btnCancelar.Left := 97;


end;

procedure TfrmBaseDetalhes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    vk_f8: btnSalvar.Click;
    VK_ESCAPE: Close;
  end;
end;

procedure TfrmBaseDetalhes.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

end.
