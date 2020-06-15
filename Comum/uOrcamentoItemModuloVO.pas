unit uOrcamentoItemModuloVO;

interface

uses
  System.Generics.Collections, uTableName, uKeyField;

type
  [TableName('Orcamento_Item_Modulo')]
  TOrcamentoItemModuloVO = class
  private
    FIdOrcamentoItem: Integer;
    FDescricao: string;
    FIdModulo: Integer;
    FId: Integer;
    procedure SetDescricao(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdModulo(const Value: Integer);
    procedure SetIdOrcamentoItem(const Value: Integer);
  public
    [KeyField('OrcIteMod_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('OrcIteMod_OrcamentoItem')]
    property IdOrcamentoItem: Integer read FIdOrcamentoItem write SetIdOrcamentoItem;
    [FieldName('OrcIteMod_Modulo')]
    property IdModulo: Integer read FIdModulo write SetIdModulo;
    [FieldName('OrcIteMod_Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
  end;

  TListaOrcamentoItemModulo = TObjectList<TOrcamentoItemModuloVO>;

implementation

{ TOrcamentoItemModuloVO }

procedure TOrcamentoItemModuloVO.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TOrcamentoItemModuloVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrcamentoItemModuloVO.SetIdModulo(const Value: Integer);
begin
  FIdModulo := Value;
end;

procedure TOrcamentoItemModuloVO.SetIdOrcamentoItem(const Value: Integer);
begin
  FIdOrcamentoItem := Value;
end;

end.
