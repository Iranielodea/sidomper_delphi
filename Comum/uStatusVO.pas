unit uStatusVO;

interface

uses
  System.SysUtils, uTableName, uKeyField, System.Generics.Collections;

type
  [TableName('Status')]
  TStatusVO = class
  private
    FAtivo: Boolean;
    FCodigo: Integer;
    FId: Integer;
    FNome: string;
    FNotificarSupervisor: Boolean;
    FNotificarRevenda: Boolean;
    FNotificarCliente: Boolean;
    FConceito: string;
    FPrograma: Integer;
    FNotificarConsultor: Boolean;
    procedure SetAtivo(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetConceito(const Value: string);
    procedure SetNotificarCliente(const Value: Boolean);
    procedure SetNotificarConsultor(const Value: Boolean);
    procedure SetNotificarRevenda(const Value: Boolean);
    procedure SetNotificarSupervisor(const Value: Boolean);
    procedure SetPrograma(const Value: Integer);
  public
    [KeyField('Sta_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('Sta_Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('Sta_Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('Sta_Ativo')]
    property Ativo: Boolean read FAtivo write SetAtivo;
    [FieldName('Sta_Programa')]
    property Programa: Integer read FPrograma write SetPrograma;
    [FieldName('Sta_NotificarCliente')]
    property NotificarCliente: Boolean read FNotificarCliente write SetNotificarCliente;
    [FieldName('Sta_NotificarSupervisor')]
    property NotificarSupervisor: Boolean read FNotificarSupervisor write SetNotificarSupervisor;
    [FieldName('Sta_NotificarConsultor')]
    property NotificarConsultor: Boolean read FNotificarConsultor write SetNotificarConsultor;
    [FieldName('Sta_NotificarRevenda')]
    property NotificarRevenda: Boolean read FNotificarRevenda write SetNotificarRevenda;
    [FieldName('Sta_Conceito')]
    property Conceito: string read FConceito write SetConceito;
  end;

  TListaStatus = TObjectList<TStatusVO>;

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
