unit uServidor;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, uConfig, Vcl.Buttons, uDM;

const
  INICIAR: string = 'Iniciar';
  PARAR: string = 'Parar';

type
  TfrmServidor = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtPorta: TEdit;
    lblStatus: TLabel;
    btnConectar: TButton;
    Label3: TLabel;
    edtBanco: TEdit;
    btnBancoDados: TBitBtn;
    procedure btnConectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBancoDadosClick(Sender: TObject);
  private
    { Private declarations }
    procedure Conectar;
    procedure Carregar;
  public
    { Public declarations }
  end;

var
  frmServidor: TfrmServidor;

implementation

uses
  ServerContainerUnit1;

{$R *.dfm}

{ TfrmServidor }

procedure TfrmServidor.btnBancoDadosClick(Sender: TObject);
begin
  try
    dm.Conexao.Close;
    dm.Conexao.Params.Values['DataBase'] := edtBanco.Text;
    dm.Conexao.Open;
  except
    ON E: Exception do
    begin
      raise Exception.Create('Erro de Conexão: ' + E.Message);
    end;
  end;
end;

procedure TfrmServidor.btnConectarClick(Sender: TObject);
begin
  Conectar();
end;

procedure TfrmServidor.Carregar;
var
  Config: TConfig;
begin
  Config := TConfig.Create(tpBanco.banFB);
  try
    Config.Carregar();
    edtPorta.Text := Config.Porta.ToString;
  finally
    FreeAndNil(Config);
  end;
end;

procedure TfrmServidor.Conectar;
begin
  if btnConectar.Caption = INICIAR then
  begin
    ServerContainer1.DSTCPServerTransport1.Port := StrToInt(edtPorta.Text);
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

procedure TfrmServidor.FormShow(Sender: TObject);
begin
  Carregar();
end;

end.

