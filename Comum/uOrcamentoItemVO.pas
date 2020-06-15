unit uOrcamentoItemVO;

interface

uses
  System.SysUtils, System.Generics.Collections, uTableName, uKeyField;

type
  [TableName('Orcamento_Item')]
  TOrcamentoItemVO = class
  private
    FIdStatus: Integer;
    FValorDescImpl: Currency;
    FDescricao: string;
    FIdTipo: Integer;
    FIdProduto: Integer;
    FId: Integer;
    FIdOrcamento: Integer;
    FValorLicencaMensal: Currency;
    FValorLicencaImpl: Currency;
    FValorDescMensal: Currency;
    procedure SetDescricao(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdOrcamento(const Value: Integer);
    procedure SetIdProduto(const Value: Integer);
    procedure SetIdStatus(const Value: Integer);
    procedure SetIdTipo(const Value: Integer);
    procedure SetValorDescImpl(const Value: Currency);
    procedure SetValorLicencaImpl(const Value: Currency);
    procedure SetValorLicencaMensal(const Value: Currency);
    procedure SetValorDescMensal(const Value: Currency);
  public
    [KeyField('OrcIte_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('OrcIte_Orcamento')]
    property IdOrcamento: Integer read FIdOrcamento write SetIdOrcamento;
    [FieldName('OrcIte_Produto')]
    property IdProduto: Integer read FIdProduto write SetIdProduto;
    [FieldName('OrcIte_Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('OrcIte_ValorLicencaImpl')]
    property ValorLicencaImpl: Currency read FValorLicencaImpl write SetValorLicencaImpl;
    [FieldName('OrcIte_ValorDescImpl')]
    property ValorDescImpl: Currency read FValorDescImpl write SetValorDescImpl;
    [FieldName('OrcIte_ValorLicencaMensal')]
    property ValorLicencaMensal: Currency read FValorLicencaMensal write SetValorLicencaMensal;
    [FieldName('OrcIte_ValorDescMensal')]
    property ValorDescMensal: Currency read FValorDescMensal write SetValorDescMensal;
    [FieldNull('OrcIte_Tipo')]
    property IdTipo: Integer read FIdTipo write SetIdTipo;
    [FieldNull('OrcIte_Status')]
    property IdStatus: Integer read FIdStatus write SetIdStatus;

  end;

  TListaOrcamentoItem = TObjectList<TOrcamentoItemVO>;

implementation

{ TOrcamentoItemVO }

procedure TOrcamentoItemVO.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TOrcamentoItemVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrcamentoItemVO.SetIdOrcamento(const Value: Integer);
begin
  FIdOrcamento := Value;
end;

procedure TOrcamentoItemVO.SetIdProduto(const Value: Integer);
begin
  if Value = 0 then
    raise Exception.Create('Informe o Produto!');
  FIdProduto := Value;
end;

procedure TOrcamentoItemVO.SetIdStatus(const Value: Integer);
begin
  FIdStatus := Value;
end;

procedure TOrcamentoItemVO.SetIdTipo(const Value: Integer);
begin
  FIdTipo := Value;
end;

procedure TOrcamentoItemVO.SetValorDescImpl(const Value: Currency);
begin
  if Value < 0 then
    raise Exception.Create('Valor do Desc. Impl. Negativo!');

  FValorDescImpl := Value;
end;

procedure TOrcamentoItemVO.SetValorDescMensal(const Value: Currency);
begin
  if Value < 0 then
    raise Exception.Create('Valor Desc. Mensal Neativo!');
  FValorDescMensal := Value;
end;

procedure TOrcamentoItemVO.SetValorLicencaImpl(const Value: Currency);
begin
  if Value < 0 then
    raise Exception.Create('Valor Licença Impl. Negativo!');
  FValorLicencaImpl := Value;
end;

procedure TOrcamentoItemVO.SetValorLicencaMensal(const Value: Currency);
begin
  if Value < 0 then
    raise Exception.Create('Valor Licença Mensal Negativo!');
  FValorLicencaMensal := Value;
end;

end.
