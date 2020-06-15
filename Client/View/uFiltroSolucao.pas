unit uFiltroSolucao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, uFraCliente;

type
  TfrmFiltroSolucao = class(TForm)
    PageControl1: TPageControl;
    tsCliente: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    btnConfirmar: TBitBtn;
    btnVoltar: TBitBtn;
    btnExcluir: TBitBtn;
    FraCliente: TFraCliente;
    procedure btnVoltarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    FIdCliente: string;
    { Private declarations }
  public
    { Public declarations }
    property IdCliente: string read FIdCliente write FIdCliente;
  end;

var
  frmFiltroSolucao: TfrmFiltroSolucao;

implementation

{$R *.dfm}

uses uImagens;

procedure TfrmFiltroSolucao.btnConfirmarClick(Sender: TObject);
begin
  FIdCliente := FraCliente.RetornoSelecao();
  Close;
  ModalResult := mrOk;
end;

procedure TfrmFiltroSolucao.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFiltroSolucao.FormCreate(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnConfirmar.Glyph := img.btnConfirmar.Glyph;
    btnExcluir.Glyph := img.btnExcluir.Glyph;
    btnVoltar.Glyph := img.btnRetornar.Glyph;
  finally
    FreeAndNil(img);
  end;

  FraCliente.Inicializar();
end;

procedure TfrmFiltroSolucao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F12: btnConfirmarClick(Self);
    VK_ESCAPE: btnVoltarClick(Self);
  end;
end;

procedure TfrmFiltroSolucao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmFiltroSolucao.FormShow(Sender: TObject);
begin
  FraCliente.edtCodigo.SetFocus;
end;

end.
