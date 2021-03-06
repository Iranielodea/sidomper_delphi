unit uOrcamentoImpressao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  uOrcamentoController, Vcl.ComCtrls;

type
  TfrmOrcamentoImpressao = class(TForm)
    Panel1: TPanel;
    btnImprimir: TBitBtn;
    btnVoltar: TBitBtn;
    PageControl1: TPageControl;
    tsImpressao: TTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    cbbModelo: TComboBox;
    tsConfig: TTabSheet;
    Panel3: TPanel;
    btnConfig: TButton;
    btnEmail: TBitBtn;
    rgImpressao: TRadioGroup;
    procedure btnVoltarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEmailClick(Sender: TObject);
  private
    { Private declarations }
    FController: TOrcamentoController;
    FIdOrcamento: Integer;
    FImprimirDireto: Boolean;
    procedure PreencherCombo;
    procedure ConfigurarRelatorio;

    function RetornoEmail: string;
    function RetornoTextoEmail: string;
    procedure ImprimirPDFEmail;

  public
    { Public declarations }
    constructor create(AIdOrcamento: Integer; AImprimir: Boolean; AImprimirDireto: Boolean=False);
  end;

var
  frmOrcamentoImpressao: TfrmOrcamentoImpressao;

implementation

{$R *.dfm}

uses uModeloRelatorioController, uImagens, uDM, uFormProcesso;

procedure TfrmOrcamentoImpressao.btnEmailClick(Sender: TObject);
//var
//  sCodigo: string;
//  Modelo: TModeloRelatorioController;
//  sArquivo: string;
//  sEmail: string;
begin
  ImprimirPDFEmail();
//  sCodigo := Copy(cbbModelo.Items[cbbModelo.ItemIndex], 1,4);
//  Modelo := TModeloRelatorioController.Create;
//  try
//    FController.Impressao(FIdOrcamento, StrToIntDef(sCodigo, 0), True);
//    Modelo.LocalizarCodigo(StrToIntDef(sCodigo, 0));
//
//
//    FController.LocalizarId(FIdOrcamento);
//    sArquivo := FController.ArquivoPDF(ExtractFilePath(Modelo.Model.CDSCadastroModR_Arquivo.AsString),
//                                       FController.Model.CDSCadastroOrc_Numero.AsString,
//                                       FController.Model.CDSCadastroOrc_RazaoSocial.AsString);
//    sEmail := RetornoEmail();
//    FController.EnviarEmail(FController.Model.CDSCadastroOrc_Cliente.AsInteger,
//                            FController.Model.CDSCadastroOrc_Numero.AsInteger,
//                            dm.IdUsuario,
//                            sEmail,
//                            RetornoTextoEmail,
//                            sArquivo);
//    DeleteFile(sArquivo);
//
//    FController.EnviarEmailParaSupervisor(dm.IdUsuario);
//
//    FController.EmailEnviado(FController.Model.CDSCadastroOrc_Id.AsInteger);
//
//  finally
//    FreeAndNil(Modelo);
//  end;
end;

procedure TfrmOrcamentoImpressao.btnImprimirClick(Sender: TObject);
//var
//  sCodigo: string;
begin
//  sCodigo := Copy(cbbModelo.Items[cbbModelo.ItemIndex], 1,4);
//  FController.Impressao(FIdOrcamento, StrToIntDef(sCodigo, 0), False);
  FController.ImpressaoModelo2(FIdOrcamento, rgImpressao.ItemIndex + 1, False);
end;

procedure TfrmOrcamentoImpressao.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOrcamentoImpressao.btnConfigClick(Sender: TObject);
begin
  ConfigurarRelatorio();
end;

procedure TfrmOrcamentoImpressao.ConfigurarRelatorio;
var
  sCodigo: string;
begin
  sCodigo := Copy(cbbModelo.Items[cbbModelo.ItemIndex], 1,4);
  FController.ConfigurarRelatorio(StrToIntDef(sCodigo, 0));
end;

constructor TfrmOrcamentoImpressao.create(AIdOrcamento: Integer; AImprimir: Boolean; AImprimirDireto: Boolean);
begin
  inherited create(nil);
  FIdOrcamento := AIdOrcamento;
  FController := TOrcamentoController.Create;

  if AImprimir then
    btnEmail.Visible := False
  else begin
    btnImprimir.Visible := False;
    btnEmail.Left := btnImprimir.Left;
  end;

  FImprimirDireto := AImprimirDireto;
end;

procedure TfrmOrcamentoImpressao.FormCreate(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnImprimir.Glyph := img.btnImprimir.Glyph;
    btnVoltar.Glyph := img.btnCancelar.Glyph;
    btnEmail.Glyph := img.btnEmail.Glyph;
  finally
    FreeAndNil(img);
  end;
end;

procedure TfrmOrcamentoImpressao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

procedure TfrmOrcamentoImpressao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F6: btnEmailClick(Self);
    VK_F7: btnImprimirClick(Self);
    VK_ESCAPE: Close;
  end;
end;

procedure TfrmOrcamentoImpressao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmOrcamentoImpressao.FormShow(Sender: TObject);
begin
//  PreencherCombo();

  tsConfig.TabVisible := False;

  if FImprimirDireto then
    btnImprimirClick(Self);
end;

procedure TfrmOrcamentoImpressao.ImprimirPDFEmail;
var
  sArquivo: string;
  sEmail: string;
begin
  try
    FController.ImpressaoModelo2(FIdOrcamento, rgImpressao.ItemIndex + 1, True);

    FController.LocalizarId(FIdOrcamento);
    sArquivo := FController.ArquivoPDF(ExtractFilePath(Application.ExeName),
                                       FController.Model.CDSCadastroOrc_Numero.AsString,
                                       FController.Model.CDSCadastroOrc_RazaoSocial.AsString);
    sEmail := RetornoEmail();
    //teste
    FController.EnviarEmail(FController.Model.CDSCadastroOrc_Cliente.AsInteger,
                            FController.Model.CDSCadastroOrc_Numero.AsInteger,
                            dm.IdUsuario,
                            sEmail,
                            RetornoTextoEmail,
                            sArquivo);
    DeleteFile(sArquivo);


    FController.EnviarEmailParaSupervisor(dm.IdUsuario);

    FController.EmailEnviado(FController.Model.CDSCadastroOrc_Id.AsInteger);

  finally
  end;
end;

procedure TfrmOrcamentoImpressao.PreencherCombo;
var
  obj: TModeloRelatorioController;
  sCodigo: string;
begin
  obj := TModeloRelatorioController.Create;
  try
    obj.FiltrarUsuario('ModR_Id', '', '');
    while not obj.Model.CDSConsulta.Eof do
    begin
      sCodigo := FormatFloat('0000', obj.Model.CDSConsultaModR_Codigo.AsFloat);
      cbbModelo.Items.Add(sCodigo + '-' + obj.Model.CDSConsultaModR_Descricao.AsString);
      obj.Model.CDSConsulta.Next;
    end;
    cbbModelo.ItemIndex := 0;
  finally
    FreeAndNil(obj);
  end;
end;

function TfrmOrcamentoImpressao.RetornoEmail: string;
var
  sEmail: string;
begin
  sEmail := '';

  FController.ListarEmail(FIdOrcamento);
  FController.Model.CDSEmail.First;
  while not FController.Model.CDSEmail.Eof do
  begin
    if sEmail = '' then
      sEmail := sEmail + FController.Model.CDSEmailEmail.AsString
    else
      sEmail := sEmail + ';' + FController.Model.CDSEmailEmail.AsString;

    FController.Model.CDSEmail.Next;
  end;
  Result := sEmail;
end;

function TfrmOrcamentoImpressao.RetornoTextoEmail: string;
var
  sTexto: string;
begin
  sTexto := '';
  sTexto := sTexto + 'Ol� ' + FController.Model.CDSCadastroOrc_ContatoCompraVenda.AsString + sLineBreak + sLineBreak;
  sTexto := sTexto + FController.Model.CDSCadastroOrc_ObservacaoEmail.AsString + sLineBreak + sLineBreak;
  sTexto := sTexto + FController.Model.CDSCadastroUsu_Nome.AsString + sLineBreak + sLineBreak;
//  sTexto := sTexto + '</html>';
  Result := sTexto;
end;

end.
