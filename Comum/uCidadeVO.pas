unit uCidadeVO;

interface

uses
  System.SysUtils, uKeyField, uTableName;

type
  [TableName('Cidade')]
  TCidadeVO = class
  private
    FAtivo: Boolean;
    FUF: string;
    FCodigo: Integer;
    FId: integer;
    FNome: string;
    procedure SetAtivo(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetId(const Value: integer);
    procedure SetNome(const Value: string);
    procedure SetUF(const Value: string);
  public
    [KeyField('Cid_Id')]
    property Id: integer read FId write SetId;
    [FieldName('Cid_Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('Cid_Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('Cid_UF')]
    property UF: string read FUF write SetUF;
    [FieldName('Cid_Ativo')]
    property Ativo: Boolean read FAtivo write SetAtivo;
  end;

implementation

{ TCidadeVO }

procedure TCidadeVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TCidadeVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TCidadeVO.SetId(const Value: integer);
begin
  FId := Value;
end;

procedure TCidadeVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TCidadeVO.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
