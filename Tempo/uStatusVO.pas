unit uStatusVO;

interface

uses
  System.SysUtils;

type
  TStatusVO = class
  private
    FCodigo: Integer;
    FId: Integer;
    FNome: string;
    FNotificarSupervisor: Boolean;
    FNotificarRevenda: Boolean;
    FNotificarCliente: Boolean;
    FConceito: string;
    FAtivo: Boolean;
    FPrograma: Integer;
    FNotificarConsultor: Boolean;
    procedure SetCodigo(const Value: Integer);
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetAtivo(const Value: Boolean);
    procedure SetConceito(const Value: string);
    procedure SetNotificarCliente(const Value: Boolean);
    procedure SetNotificarConsultor(const Value: Boolean);
    procedure SetNotificarRevenda(const Value: Boolean);
    procedure SetNotificarSupervisor(const Value: Boolean);
    procedure SetPrograma(const Value: Integer);

  public
    property Id: Integer read FId write SetId;
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Ativo: Boolean read FAtivo write SetAtivo;
    property Programa: Integer read FPrograma write SetPrograma;
    property NotificarCliente: Boolean read FNotificarCliente write SetNotificarCliente;
    property NotificarSupervisor: Boolean read FNotificarSupervisor write SetNotificarSupervisor;
    property NotificarConsultor: Boolean read FNotificarConsultor write SetNotificarConsultor;
    property NotificarRevenda: Boolean read FNotificarRevenda write SetNotificarRevenda;
    property Conceito: string read FConceito write SetConceito;

  end;

implementation

{ TStatusVO }

procedure TStatusVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TStatusVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TStatusVO.SetConceito(const Value: string);
begin
  FConceito := Value;
end;

procedure TStatusVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TStatusVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TStatusVO.SetNotificarCliente(const Value: Boolean);
begin
  FNotificarCliente := Value;
end;

procedure TStatusVO.SetNotificarConsultor(const Value: Boolean);
begin
  FNotificarConsultor := Value;
end;

procedure TStatusVO.SetNotificarRevenda(const Value: Boolean);
begin
  FNotificarRevenda := Value;
end;

procedure TStatusVO.SetNotificarSupervisor(const Value: Boolean);
begin
  FNotificarSupervisor := Value;
end;

procedure TStatusVO.SetPrograma(const Value: Integer);
begin
  FPrograma := Value;
end;

end.
