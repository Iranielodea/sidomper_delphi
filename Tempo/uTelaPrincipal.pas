unit uTelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, uDMSolicitacao,
  uSolicitacaoVO, uSolicitacaoViewModel, uDM;

  Const C_PARAR: string = 'Parar';
        C_INICIAR: string = 'Iniciar';

type
  TfrmTelaPrincipal = class(TForm)
    lblCliente: TLabel;
    lblIdSolicitacao: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblTitulo: TLabel;
    Label5: TLabel;
    lblNivel: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    btnControle: TBitBtn;
    lblStatus: TLabel;
    Label4: TLabel;
    btnDetalhe: TSpeedButton;
    Label1: TLabel;
    lblTempoPrevisto: TLabel;
    Label6: TLabel;
    lblTempoDecorrido: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnControleClick(Sender: TObject);
    procedure btnDetalheClick(Sender: TObject);
  private
    { Private declarations }
    FIdUsuarioLogado: Integer;
    FIdSolicitacao: Integer;
    FIdUsuarioAtendeAtual: Integer;
    procedure MostrarDados;
    procedure Iniciar();
    procedure Parar();
    procedure CorTela();
    procedure Detalhes();
    procedure Detalhar();
    procedure Resumir();
    procedure TamanhoTela();
  public
    { Public declarations }
  end;

var
  frmTelaPrincipal: TfrmTelaPrincipal;

implementation

{$R *.dfm}

procedure TfrmTelaPrincipal.btnControleClick(Sender: TObject);
begin
  if btnControle.Caption = C_PARAR then
    Parar()
  else
    Iniciar();
end;

procedure TfrmTelaPrincipal.btnDetalheClick(Sender: TObject);
begin
  Detalhes();
end;

procedure TfrmTelaPrincipal.CorTela;
begin
  if btnControle.Caption = C_INICIAR then
    Self.Color := clGreen
  else
    Self.Color := clRed;
end;

procedure TfrmTelaPrincipal.Detalhar;
begin
  Self.Height := 200;
  Self.Width := 520;

//  self.Left := 3;
//  self.Top := 3;

//  Self.Left := 1400;
//  Self.Top := 841;
  btnDetalhe.Caption := '>>';
  MostrarDados();
  TamanhoTela();
end;

procedure TfrmTelaPrincipal.Detalhes;
begin
  if btnDetalhe.Caption = '>>' then
    Resumir()
  else
    Detalhar();
end;

procedure TfrmTelaPrincipal.FormShow(Sender: TObject);
var
  id: Integer;
  idUsuario: Integer;
begin
  FIdSolicitacao := StrToIntDef(ParamStr(1), 0);
  FIdUsuarioLogado := StrToIntDef(ParamStr(2), 0);

  lblIdSolicitacao.Caption := '';
  lblCliente.Caption := '';
  lblTitulo.Caption := '';
  lblNivel.Caption := '';
  lblStatus.Caption := '';
  lblTempoPrevisto.Caption := '';
  lblTempoDecorrido.Caption := '';


//  FIdSolicitacao := 1115;
//  FIdUsuarioLogado := 21;

  if FIdSolicitacao = 0 then
  begin
    ShowMessage('Informe a Solicitação.');
    Application.Terminate;
    Exit;
  end;

  MostrarDados();
  Resumir();
  TamanhoTela();
end;

procedure TfrmTelaPrincipal.Parar;
var
  SolicitacaoViewModel: TSolicitacaoViewModel;
begin
  SolicitacaoViewModel := TSolicitacaoViewModel.Create;
  try
    try
      SolicitacaoViewModel.Id := FIdSolicitacao;
      SolicitacaoViewModel.IdUsuarioAtendeAtual := FIdUsuarioAtendeAtual;

      dmSolicitacao.FinalizarTempo(FIdUsuarioLogado, SolicitacaoViewModel);
      btnControle.Caption := C_INICIAR;
      CorTela();
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(SolicitacaoViewModel);
  end;
end;

procedure TfrmTelaPrincipal.Resumir;
begin
  Self.Height := 70;
  Self.Width := 375;
  btnDetalhe.Caption := '<<';
  TamanhoTela();
end;

procedure TfrmTelaPrincipal.TamanhoTela;
begin
  Self.Top := Screen.Height - Self.Height - 35;
  Self.Left := Screen.Width - Self.Width;
end;

procedure TfrmTelaPrincipal.MostrarDados;
  var model: TSolicitacaoViewModel;
begin
  model := dmSolicitacao.ObterPorId(FIdSolicitacao);

  lblIdSolicitacao.Caption := model.Id.ToString();
  lblCliente.Caption := model.NomeCliente;
  lblTitulo.Caption := model.Titulo;
  lblNivel.Caption := model.Nivel;
  lblStatus.Caption := model.NomeStatus;
  lblTempoPrevisto.Caption := FormatFloat(',##0.00', model.TempoPrevisto);
  lblTempoDecorrido.Caption := model.TempoDecorrido;
  FIdUsuarioAtendeAtual := model.IdUsuarioAtendeAtual;

  if model.TempoAberto then
    btnControle.Caption := C_PARAR
  else
    btnControle.Caption := C_INICIAR;

  CorTela();

  FreeAndNil(model);
end;

procedure TfrmTelaPrincipal.Iniciar;
var
  SolicitacaoViewModel: TSolicitacaoViewModel;
begin
  SolicitacaoViewModel := TSolicitacaoViewModel.Create;
  try
    try
      SolicitacaoViewModel.Id := FIdSolicitacao;
      SolicitacaoViewModel.IdUsuarioAtendeAtual := FIdUsuarioAtendeAtual;
      SolicitacaoViewModel.NomeStatus := lblStatus.Caption;

      dmSolicitacao.IniciarTempo(FIdUsuarioLogado, SolicitacaoViewModel);
      btnControle.Caption := C_PARAR;
      CorTela();
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(SolicitacaoViewModel);
  end;
end;

end.

