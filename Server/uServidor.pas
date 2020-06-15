unit uServidor;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, uConfig, uLerXML, Vcl.ExtCtrls, uParametros, Data.DB;

const
  INICIAR: string = 'Iniciar';
  PARAR: string = 'Parar';

type
  TfrmServidor = class(TForm)
    Label1: TLabel;
    edtPorta: TEdit;
    btnConectar: TButton;
    Label2: TLabel;
    lblStatus: TLabel;
    tmrBackup: TTimer;
    procedure btnConectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrBackupTimer(Sender: TObject);
  private
    { Private declarations }
    FLifeCycle: string;
    procedure Carregar;
    procedure Conectar;
    procedure ImportarXML;
    procedure CarregarVersao;
    procedure AjustarIDs;
  public
    { Public declarations }
  end;

var
  frmServidor: TfrmServidor;

implementation

{$R *.dfm}

uses ServerContainerUnit1, uVersaoSistema, uFormVersao, uServerModulo2;

procedure TfrmServidor.AjustarIDs;
var
  parametro: TParametros;
begin
  if btnConectar.Caption = PARAR then
  begin
    parametro := TParametros.Create;
    try
      parametro.AjustarIdsTabelas();
    finally
      FreeAndNil(parametro);
    end;
  end;
end;

procedure TfrmServidor.btnConectarClick(Sender: TObject);
begin
  Carregar();
  Conectar();
  AjustarIDs();
end;

procedure TfrmServidor.Carregar;
var
  Config: TConfig;
begin
  Config := TConfig.Create;
  try
    Config.Carregar();
    edtPorta.Text := Config.Porta.ToString;
    FLifeCycle := Config.LifeCycle;
  finally
    FreeAndNil(Config);
  end;
end;

procedure TfrmServidor.CarregarVersao;
var
  obj: TVersaoSistema;
//  Formulario: TfrmVersao;
begin
  frmVersao := TfrmVersao.Create(self);
  obj := TVersaoSistema.Create;
  try
    try
      obj.LerVersao;
    except
      frmVersao.ShowModal;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(frmVersao);
  end;
end;

procedure TfrmServidor.Conectar;
begin
  if btnConectar.Caption = INICIAR then
  begin
    ServerContainer1.DSTCPServerTransport1.Port := StrToInt(edtPorta.Text);
    if FLifeCycle.Trim() <> '' then
    begin
      ServerContainer1.DSServerClass1.LifeCycle := FLifeCycle;
      ServerContainer1.DSServerClass2.LifeCycle := FLifeCycle;
    end;
    ServerContainer1.DSServer1.Start;
    if ServerContainer1.DSServer1.Started then
    begin
      btnConectar.Caption := PARAR;
      lblStatus.Caption := 'Rodando';
      lblStatus.Font.Color := clGreen;
    end;
  end
  else begin
    ServerContainer1.DSServer1.Stop;
    if not ServerContainer1.DSServer1.Started then
    begin
      btnConectar.Caption := INICIAR;
      lblStatus.Caption := 'Parado';
      lblStatus.Font.Color := clRed;
    end;
  end;
end;

procedure TfrmServidor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ServerContainer1.DSServer1.Started then
    ServerContainer1.DSServer1.Stop;
end;

procedure TfrmServidor.FormShow(Sender: TObject);
begin
  Carregar;
  CarregarVersao;
end;

procedure TfrmServidor.ImportarXML;
var
  LerXML: TLerXML;
begin
  LerXML := TLerXML.Create;
  try
    LerXML.ListarArquivos(Self);
  finally
    FreeAndNil(LerXML);
  end;
end;

procedure TfrmServidor.tmrBackupTimer(Sender: TObject);
begin
  tmrBackup.Enabled := False;
  try
    ServerModule2.PlanoBackupGerar();
  finally
    tmrBackup.Enabled := True;
  end;
end;

end.

