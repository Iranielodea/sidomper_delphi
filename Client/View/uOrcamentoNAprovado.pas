unit uOrcamentoNAprovado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls,
  uImagens, uOrcamentoNaoAprovadoVO, uOrcamentoNAprovadoController,
  uTipoController, uEnumerador, uFuncoesSIDomper, uTipo, uDM;

type
  TfrmOrcamentoNAprovado = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtCodTipo: TEdit;
    edtNomeTipo: TEdit;
    edtTipo: TEdit;
    mmoDescricao: TMemo;
    btnTipo: TSpeedButton;
    Panel1: TPanel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure mmoDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mmoDescricaoEnter(Sender: TObject);
    procedure mmoDescricaoExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure edtCodTipoExit(Sender: TObject);
    procedure btnTipoClick(Sender: TObject);
  private
    { Private declarations }
    FIdOrcamento: Integer;
    procedure Salvar;
    procedure TeclasAtalho(var Key: Word; Shift: TShiftState);

    procedure BuscarTipo(AId, ACodigo: Integer);
  public
    { Public declarations }
    constructor Create(AIdOrcamento: Integer);
  end;

var
  frmOrcamentoNAprovado: TfrmOrcamentoNAprovado;

implementation

{$R *.dfm}

procedure TfrmOrcamentoNAprovado.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrcamentoNAprovado.btnSalvarClick(Sender: TObject);
begin
  Salvar();
end;

procedure TfrmOrcamentoNAprovado.btnTipoClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmTipo.create(prOrcamentoNAprovado, true));
  if dm.IdSelecionado > 0 then
    BuscarTipo(dm.IdSelecionado, 0);
end;

procedure TfrmOrcamentoNAprovado.BuscarTipo(AId, ACodigo: Integer);
var
  obj: TTipoController;
begin
  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, prOrcamentoNAprovado);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodTipo.SetFocus;
      end;
    end;
  finally
    edtTipo.Text := obj.Model.CDSCadastroTip_Id.AsString;
    edtCodTipo.Text := obj.Model.CDSCadastroTip_Codigo.AsString;
    edtNomeTipo.Text := obj.Model.CDSCadastroTip_Nome.AsString;

    if edtCodTipo.Text <> '' then
      edtCodTipo.Text := FormatFloat('0000', obj.Model.CDSCadastroTip_Codigo.AsInteger);

    FreeAndNil(obj);
  end;
  edtCodTipo.Modified := False;
end;

constructor TfrmOrcamentoNAprovado.Create(AIdOrcamento: Integer);
begin
  inherited Create(nil);
  FIdOrcamento := AIdOrcamento;
end;

procedure TfrmOrcamentoNAprovado.edtCodTipoExit(Sender: TObject);
begin
  if edtCodTipo.Modified then
    BuscarTipo(0, StrToIntDef(edtCodTipo.Text, 0));
end;

procedure TfrmOrcamentoNAprovado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TeclasAtalho(Key, Shift);
end;

procedure TfrmOrcamentoNAprovado.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmOrcamentoNAprovado.FormShow(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnSalvar.Glyph := img.btnSalvar.Glyph;
    btnCancelar.Glyph := img.btnCancelar.Glyph;
    btnTipo.Glyph := img.btnProcurar.Glyph;
  finally
    FreeAndNil(img);
  end;

  btnTipoClick(Self);
  mmoDescricao.SetFocus;
end;

procedure TfrmOrcamentoNAprovado.mmoDescricaoEnter(Sender: TObject);
begin
  Self.KeyPreview := False;
end;

procedure TfrmOrcamentoNAprovado.mmoDescricaoExit(Sender: TObject);
begin
  Self.KeyPreview := True;
end;

procedure TfrmOrcamentoNAprovado.mmoDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TeclasAtalho(Key, Shift);
end;

procedure TfrmOrcamentoNAprovado.Salvar;
var
  Controller: TOrcamentoNAprovadoController;
  VO: TOrcamentoNaoAprovadoVO;
begin
  if edtCodTipo.Text = '' then
  begin
    ShowMessage('Informe o Tipo!');
    edtCodTipo.SetFocus;
    Exit;
  end;

  if Trim(mmoDescricao.Text) = '' then
  begin
    ShowMessage('Informe a Descrição!');
    mmoDescricao.SetFocus;
    Exit;
  end;

  Controller := TOrcamentoNAprovadoController.Create;
  VO := TOrcamentoNaoAprovadoVO.create;
  try
    VO.Id           := 0;
    VO.IdTipo       := StrToIntDef(edtCodTipo.Text, 0);
    VO.Descricao    := mmoDescricao.Text;
    VO.IdOrcamento  := FIdOrcamento;
    Controller.Salvar(VO);

    Close();
    ModalResult := mrOk;
  finally
    FreeAndNil(Controller);
    FreeAndNil(VO);
  end;
end;

procedure TfrmOrcamentoNAprovado.TeclasAtalho(var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F8:
    begin
      btnSalvar.SetFocus;
      Salvar();
    end;

    VK_ESCAPE: Close;
  end;
end;

end.
