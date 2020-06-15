unit uCategoriaVO;

interface

uses
  System.SysUtils, uTableName, uKeyField;

type
  TCategoriaVO = class
  private
    FAtivo: Boolean;
    FCodigo: Integer;
    FId: Integer;
    FNome: string;
    procedure SetAtivo(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    property Id: Integer read FId write SetId;
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Ativo: Boolean read FAtivo write SetAtivo;
  end;

implementation

{ TCategoriaVO }

procedure TCategoriaVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TCategoriaVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCategoriaVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TCategoriaVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
