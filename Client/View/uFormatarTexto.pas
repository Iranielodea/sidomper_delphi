unit uFormatarTexto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.Buttons, Vcl.ImgList, uFormatacaoMemo;

type
  TfrmFormatarTexto = class(TForm)
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    ckCor: TColorBox;
    btn1: TToolButton;
    ckFontes: TComboBox;
    btn2: TToolButton;
    ckTamanho: TComboBox;
    btn3: TToolButton;
    btnItalico: TSpeedButton;
    btnNegrito: TSpeedButton;
    btnSublinhado: TSpeedButton;
    btnRiscado: TSpeedButton;
    ImageList1: TImageList;
    btnEsquerdo: TToolButton;
    ToolButton1: TToolButton;
    btnCentro: TToolButton;
    btnDireito: TToolButton;
    btnSalvar: TToolButton;
    btnVoltar: TToolButton;
    Editor: TRichEdit;
    BalloonHint1: TBalloonHint;
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnNegritoClick(Sender: TObject);
    procedure btnItalicoClick(Sender: TObject);
    procedure btnSublinhadoClick(Sender: TObject);
    procedure ckFontesChange(Sender: TObject);
    procedure ckTamanhoChange(Sender: TObject);
    procedure ckCorChange(Sender: TObject);
    procedure btnRiscadoClick(Sender: TObject);
    procedure btnEsquerdoClick(Sender: TObject);
    procedure btnCentroClick(Sender: TObject);
    procedure btnDireitoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    procedure Inicio;
    { Private declarations }
  public
    { Public declarations }
    constructor create(AEditor: TRichEdit); overload;
    constructor create(AEditor: TDBRichEdit); overload;
  end;

var
  frmFormatarTexto: TfrmFormatarTexto;

implementation

{$R *.dfm}

procedure TfrmFormatarTexto.btnCentroClick(Sender: TObject);
begin
  TFormatacao.AlinhamentoCentro(Editor);
end;

procedure TfrmFormatarTexto.btnDireitoClick(Sender: TObject);
begin
  TFormatacao.AlinhamentoDireito(Editor);
end;

procedure TfrmFormatarTexto.Inicio;
begin
  Self.Top := 10;
  Self.Left := 10;
  ckFontes.Items := Screen.Fonts;
  ckFontes.Text := DefFontData.Name;
  ckTamanho.Text := IntToStr(-MulDiv(DefFontData.Height, 72, Screen.PixelsPerInch));
end;

procedure TfrmFormatarTexto.btnEsquerdoClick(Sender: TObject);
begin
  TFormatacao.AlinhamentoEsquerdo(Editor);
end;

procedure TfrmFormatarTexto.btnItalicoClick(Sender: TObject);
begin
  TFormatacao.EstiloItalico(Editor);
end;

procedure TfrmFormatarTexto.btnNegritoClick(Sender: TObject);
begin
  TFormatacao.EstiloNegrito(Editor);
end;

procedure TfrmFormatarTexto.btnRiscadoClick(Sender: TObject);
begin
  TFormatacao.EstiloRiscado(Editor);
end;

procedure TfrmFormatarTexto.btnSalvarClick(Sender: TObject);
begin
  Editor.SelectAll;
  Editor.CopyToClipboard;
  Close;
  ModalResult := mrOk;
end;

procedure TfrmFormatarTexto.btnSublinhadoClick(Sender: TObject);
begin
  TFormatacao.EstiloSublinhado(Editor);
end;

procedure TfrmFormatarTexto.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFormatarTexto.ckCorChange(Sender: TObject);
begin
  Editor.selattributes.Color := ckCor.Selected;
end;

procedure TfrmFormatarTexto.ckFontesChange(Sender: TObject);
begin
  Editor.SelAttributes.Name := ckFontes.Items[ckFontes.ItemIndex];
end;

procedure TfrmFormatarTexto.ckTamanhoChange(Sender: TObject);
begin
  Editor.selattributes.Size := StrToInt(ckTamanho.Items[ckTamanho.ItemIndex]);
end;

constructor TfrmFormatarTexto.create(AEditor: TDBRichEdit);
begin
  inherited create(nil);

  if Self.Height < AEditor.Height then
    Self.Height := AEditor.Height + 70;

  if Self.Width < AEditor.Width then
    Self.Width := AEditor.Width + 20;

  if Length(AEditor.Text) > 0 then
  begin
    AEditor.SelectAll;
    AEditor.CopyToClipboard;

    Editor.PasteFromClipboard;
  end;

end;

constructor TfrmFormatarTexto.create(AEditor: TRichEdit);
begin
  inherited create(nil);

  if Self.Height < AEditor.Height then
    Self.Height := AEditor.Height + 70;

  if Self.Width < AEditor.Width then
    Self.Width := AEditor.Width + 20;

  if Length(AEditor.Text) > 0 then
  begin
    AEditor.SelectAll;
    AEditor.CopyToClipboard;

    Editor.PasteFromClipboard;
  end;
end;

procedure TfrmFormatarTexto.FormCreate(Sender: TObject);
begin
  Inicio;
end;

procedure TfrmFormatarTexto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F8: btnSalvarClick(Self);
    VK_ESCAPE: Close;
  end;
end;

procedure TfrmFormatarTexto.FormShow(Sender: TObject);
begin
  Editor.SelStart := Perform(EM_LINEINDEX, 0, 0); // posiciona na primeira linha
  Editor.SetFocus;
end;

end.
