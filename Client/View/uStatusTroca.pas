unit uStatusTroca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uEnumerador, uTipoController, uTipo, uModulo, uModuloController, uClienteModuloController;

type
  TfrmStatusTroca = class(TForm)
    Panel4: TPanel;
    btnConfirmar: TBitBtn;
    btnCancelar: TBitBtn;
    pnlTipo: TPanel;
    Label2: TLabel;
    edtCodTipo: TEdit;
    edtNomeTipo: TEdit;
    btnTipo: TSpeedButton;
    edtIdTipo: TEdit;
    pnlModulo: TPanel;
    Label3: TLabel;
    edtCodModulo: TEdit;
    edtNomeModulo: TEdit;
    pnlStatus: TPanel;
    Label1: TLabel;
    edtCodStatus: TEdit;
    edtNome: TEdit;
    btnStatus: TSpeedButton;
    edtIdStatus: TEdit;
    btnModulo: TSpeedButton;
    edtCodProduto: TEdit;
    edtNomeProduto: TEdit;
    Label4: TLabel;
    edtIdModulo: TEdit;
    edtIdProduto: TEdit;
    edtIdCliente: TEdit;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodStatusExit(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodStatusKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtCodTipoExit(Sender: TObject);
    procedure btnTipoClick(Sender: TObject);
    procedure btnModuloClick(Sender: TObject);
    procedure edtCodModuloExit(Sender: TObject);
    procedure edtCodModuloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FTipoPrograma: TEnumPrograma;
    procedure BuscarStatus(Id, Codigo: Integer);
    procedure BuscarTipo(Id, Codigo: Integer);
    procedure BuscarModulo(AId, ACodigo: Integer);
  public
    { Public declarations }
    constructor Create(TipoPrograma: TEnumPrograma; AIdTipo: Integer = 0);
  end;

var
  frmStatusTroca: TfrmStatusTroca;

implementation

{$R *.dfm}

uses uFuncoesSIDomper, uStatusController, uStatus, uDM, uImagens;

procedure TfrmStatusTroca.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmStatusTroca.btnConfirmarClick(Sender: TObject);
begin
  if pnlTipo.Visible then
  begin
    if edtCodTipo.Text = '' then
    begin
      edtCodTipo.SetFocus;
      raise Exception.Create('Informe o Tipo!');
    end;
  end;

  if edtCodStatus.Text = '' then
  begin
    edtCodStatus.SetFocus;
    raise Exception.Create('Informe o Status!');
  end;
  Close;
  ModalResult := mrOk;
end;

procedure TfrmStatusTroca.btnModuloClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmModulo.create(StrToIntDef(edtIdCliente.Text, 0), true, True));
  if dm.IdSelecionado > 0 then
    BuscarModulo(dm.IdSelecionado, 0);
end;

procedure TfrmStatusTroca.btnStatusClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmStatus.create(FTipoPrograma, True));
  if dm.IdSelecionado > 0 then
    BuscarStatus(dm.IdSelecionado, 0);
end;

procedure TfrmStatusTroca.btnTipoClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmTipo.create(FTipoPrograma, True));
  if dm.IdSelecionado > 0 then
    BuscarTipo(dm.IdSelecionado, 0);
end;

procedure TfrmStatusTroca.BuscarModulo(AId, ACodigo: Integer);
var
  obj: TModuloController;
  ClienteModulo: TClienteModuloController;
begin
  obj := TModuloController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, StrToIntDef(edtIdCliente.Text, 0));
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodModulo.SetFocus;
      end;
    end;
  finally
    edtIdModulo.Text := obj.Model.CDSCadastroMod_Id.AsString;
    edtCodModulo.Text := FormatFloat('0000', obj.Model.CDSCadastroMod_Codigo.AsInteger);
    edtNomeModulo.Text := obj.Model.CDSCadastroMod_Nome.AsString;
    if edtIdModulo.Text = '' then
      edtCodModulo.Clear;

    FreeAndNil(obj);
  end;

  // buscar produto
  if StrToIntDef(edtCodModulo.Text, 0) > 0 then
  begin
    ClienteModulo := TClienteModuloController.Create;
    try
      ClienteModulo.LocalizarModuloProduto(StrToIntDef(edtIdCliente.Text, 0),
        StrToIntDef(edtIdModulo.Text, 0));

      edtIdProduto.Text := ClienteModulo.Model.CDSCadastroCliMod_Produto.AsString;
      edtCodProduto.Text := FormatFloat('0000', ClienteModulo.Model.CDSCadastroProd_Codigo.AsInteger);
      if edtIdProduto.Text = '' then
        edtCodProduto.Clear;
      edtNomeProduto.Text := ClienteModulo.Model.CDSCadastroProd_Nome.AsString;
    finally
      FreeAndNil(ClienteModulo);
    end;
  end
  else begin
    edtIdProduto.Clear;
    edtCodProduto.Clear;
    edtNomeProduto.Clear;
  end;

  edtCodModulo.Modified := False;
  edtCodProduto.Modified := False;
end;

procedure TfrmStatusTroca.BuscarStatus(Id, Codigo: Integer);
var
  obj: TStatusController;
begin
  obj := TStatusController.Create;
  try
    try
      obj.Pesquisar(Id, Codigo, FTipoPrograma);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodStatus.SetFocus;
      end;
    end;
  finally
    edtIdStatus.Text := obj.Model.CDSCadastroSta_Id.AsString;
    edtNome.Text := obj.Model.CDSCadastroSta_Nome.AsString;
    edtCodStatus.Text := TFuncoes.FormatarMascaraCodigo4(obj.Model.CDSCadastroSta_Codigo.AsFloat);

    FreeAndNil(obj);
  end;
  edtCodStatus.Modified := False;

end;

procedure TfrmStatusTroca.BuscarTipo(Id, Codigo: Integer);
var
  obj: TTipoController;
begin
  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(Id, Codigo, FTipoPrograma);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodTipo.SetFocus;
      end;
    end;
  finally
    edtIdTipo.Text := obj.Model.CDSCadastroTip_Id.AsString;
    edtNomeTipo.Text := obj.Model.CDSCadastroTip_Nome.AsString;
    edtCodTipo.Text := TFuncoes.FormatarMascaraCodigo4(obj.Model.CDSCadastroTip_Codigo.AsFloat);

    FreeAndNil(obj);
  end;
  edtCodTipo.Modified := False;
end;

constructor TfrmStatusTroca.Create(TipoPrograma: TEnumPrograma; AIdTipo: Integer);
begin
  inherited Create(nil);
  FTipoPrograma := TipoPrograma;
  pnlTipo.Visible := (AIdTipo > 0);

  if AIdTipo > 0 then
    BuscarTipo(AIdTipo, 0);

  if TipoPrograma <> prChamado then
  begin
    pnlModulo.Visible := False;
    Self.Height := Self.Height - pnlModulo.Height;
  end;
end;

procedure TfrmStatusTroca.edtCodModuloExit(Sender: TObject);
begin
  if edtCodModulo.Modified then
    BuscarModulo(0, StrToIntDef(edtCodModulo.Text, 0));
end;

procedure TfrmStatusTroca.edtCodModuloKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
    btnModuloClick(Self);
end;

procedure TfrmStatusTroca.edtCodStatusExit(Sender: TObject);
begin
  if edtCodStatus.Modified then
    BuscarStatus(0, StrToIntDef(edtCodStatus.Text, 0));
end;

procedure TfrmStatusTroca.edtCodStatusKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F9 then
  begin
    if Sender = edtCodStatus then
      btnStatusClick(Self)
    else if Sender = edtCodTipo then
      btnTipoClick(Self);
  end;
end;

procedure TfrmStatusTroca.edtCodTipoExit(Sender: TObject);
begin
  if edtCodTipo.Modified then
    BuscarTipo(0, StrToIntDef(edtCodTipo.Text, 0));
end;

procedure TfrmStatusTroca.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmStatusTroca.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;


procedure TfrmStatusTroca.FormShow(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(self);
  try
    btnConfirmar.Glyph := img.btnConfirmar.Glyph;
    btnCancelar.Glyph := img.btnCancelar.Glyph;
    btnStatus.Glyph := img.btnProcurar.Glyph;
    btnTipo.Glyph := img.btnProcurar.Glyph;
    btnModulo.Glyph := img.btnProcurar.Glyph;
  finally
    FreeAndNil(img);
  end;

  if (pnlModulo.Visible = False) and (pnlTipo.Visible = False) then
  begin
    pnlStatus.Align := alNone;
    pnlStatus.Top := 50;
  end;

  try
    if (pnlModulo.Visible) and (edtCodModulo.Text = '') then
    begin
      edtCodModulo.SetFocus
    end
    else begin
      if edtCodTipo.Visible then
        edtCodTipo.SetFocus
      else
        edtCodStatus.SetFocus;
    end;
  except
    edtCodStatus.SetFocus;
  end;
end;

end.
