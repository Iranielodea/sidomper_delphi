unit uTipoVO;

interface

uses
  System.SysUtils, uKeyField, uTableName;

type
  [TableName('Tipo')]
  TTipoVO = class
  private
    FConceito: string;
    FAtivo: Boolean;
    FCodigo: Integer;
    FId: Integer;
    FPrograma: Integer;
    FNome: string;
    procedure SetAtivo(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetConceito(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetPrograma(const Value: Integer);
  public
    [KeyField('Tip_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('Tip_Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('Tip_Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('Tip_Ativo')]
    property Ativo: Boolean read FAtivo write SetAtivo;
    [FieldName('Tip_Programa')]
    property Programa: Integer read FPrograma write SetPrograma;
    [FieldName('Tip_Conceito')]
    property Conceito: string read FConceito write SetConceito;
  end;

implementation

{ TTipoVO }

procedure TTipoVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TTipoVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TTipoVO.SetConceito(const Value: string);
begin
  FConceito := Value;
end;

procedure TTipoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TTipoVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TTipoVO.SetPrograma(const Value: Integer);
begin
  FPrograma := Value;
end;

end.
