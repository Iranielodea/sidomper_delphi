unit uOrcamentoVectoVO;

interface

uses
  System.SysUtils, System.Generics.Collections, uTableName, uKeyField;

type
  [TableName('Orcamento_Vectos')]
  TOrcamentoVectoVO = class
  private
    FValor: Currency;
    FDescricao: string;
    FId: Integer;
    FIdOrcamento: Integer;
    FData: TDate;
    FParcela: Integer;
    procedure SetData(const Value: TDate);
    procedure SetDescricao(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdOrcamento(const Value: Integer);
    procedure SetParcela(const Value: Integer);
    procedure SetValor(const Value: Currency);
  public
    [KeyField('OrcVect_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('OrcVect_Orcamento')]
    property IdOrcamento: Integer read FIdOrcamento write SetIdOrcamento;
    [FieldName('OrcVect_Parcela')]
    property Parcela: Integer read FParcela write SetParcela;
    [FieldName('OrcVect_Data')]
    property Data: TDate read FData write SetData;
    [FieldName('OrcVect_Valor')]
    property Valor: Currency read FValor write SetValor;
    [FieldName('OrcVect_Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
  end;

implementation

{ TOrcamentoVectoVO }

procedure TOrcamentoVectoVO.SetData(const Value: TDate);
begin
  if Value = 0 then
    raise Exception.Create('Informe a Data!');

  FData := Value;
end;

procedure TOrcamentoVectoVO.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TOrcamentoVectoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrcamentoVectoVO.SetIdOrcamento(const Value: Integer);
begin
  FIdOrcamento := Value;
end;

procedure TOrcamentoVectoVO.SetParcela(const Value: Integer);
begin
  if Value = 0 then
    raise Exception.Create('Informe a Parcela!');

  FParcela := Value;
end;

procedure TOrcamentoVectoVO.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
