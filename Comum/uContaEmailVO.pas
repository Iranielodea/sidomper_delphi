unit uContaEmailVO;

interface

uses
  System.SysUtils;

type
  TContaEmailVO = class
  private
    FEmail: string;
    FAtivo: Boolean;
    FCodigo: Integer;
    FId: Integer;
    FAutenticarSSL: Boolean;
    FSMTP: string;
    FSenha: string;
    FPorta: Integer;
    FNome: string;
    FAutenticar: Boolean;
    procedure SetAtivo(const Value: Boolean);
    procedure SetAutenticar(const Value: Boolean);
    procedure SetAutenticarSSL(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetEmail(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetPorta(const Value: Integer);
    procedure SetSenha(const Value: string);
    procedure SetSMTP(const Value: string);
  public
    property Id: Integer read FId write SetId;
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Email: string read FEmail write SetEmail;
    property Senha: string read FSenha write SetSenha;
    property SMTP: string read FSMTP write SetSMTP;
    property Porta: Integer read FPorta write SetPorta;
    property Ativo: Boolean read FAtivo write SetAtivo;
    property Autenticar: Boolean read FAutenticar write SetAutenticar;
    property AutenticarSSL: Boolean read FAutenticarSSL write SetAutenticarSSL;
  end;

implementation

{ TContaEmailVO }

procedure TContaEmailVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TContaEmailVO.SetAutenticar(const Value: Boolean);
begin
  FAutenticar := Value;
end;

procedure TContaEmailVO.SetAutenticarSSL(const Value: Boolean);
begin
  FAutenticarSSL := Value;
end;

procedure TContaEmailVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TContaEmailVO.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TContaEmailVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TContaEmailVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TContaEmailVO.SetPorta(const Value: Integer);
begin
  FPorta := Value;
end;

procedure TContaEmailVO.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TContaEmailVO.SetSMTP(const Value: string);
begin
  FSMTP := Value;
end;

end.
