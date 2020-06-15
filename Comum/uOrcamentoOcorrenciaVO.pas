unit uOrcamentoOcorrenciaVO;

interface

uses
  System.Generics.Collections, System.SysUtils, uTableName, uKeyField;

type
  [TableName('Orcamento_Ocorrencia')]
  TOrcamentoOcorrenciaVO = class
  private
    FDescricao: string;
    FIdUsuario: Integer;
    FId: Integer;
    FIdOrcamento: Integer;
    FData: TDate;
    procedure SetData(const Value: TDate);
    procedure SetDescricao(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdOrcamento(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
  public
    [KeyField('OrcOco_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('OrcOco_Orcamento')]
    property IdOrcamento: Integer read FIdOrcamento write SetIdOrcamento;
    [FieldName('OrcOco_Data')]
    property Data: TDate read FData write SetData;
    [FieldName('OrcOco_Usuario')]
    property IdUsuario: Integer read FIdUsuario write SetIdUsuario;
    [FieldName('OrcOco_Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
  end;

  TListaOrcamentoOcorrencia = TObjectList<TOrcamentoOcorrenciaVO>;

implementation

{ TOrcamentoOcorrenciaVO }

procedure TOrcamentoOcorrenciaVO.SetData(const Value: TDate);
begin
  if Value = 0 then
    raise Exception.Create('Informe a Data da Ocorrência!');
  FData := Value;
end;

procedure TOrcamentoOcorrenciaVO.SetDescricao(const Value: string);
begin
  if Value.Trim = '' then
    raise Exception.Create('Informe a Descrição da Ocorrência!');
  FDescricao := Value;
end;

procedure TOrcamentoOcorrenciaVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrcamentoOcorrenciaVO.SetIdOrcamento(const Value: Integer);
begin
  FIdOrcamento := Value;
end;

procedure TOrcamentoOcorrenciaVO.SetIdUsuario(const Value: Integer);
begin
  if Value = 0 then
    raise Exception.Create('Informe o Usuário da Ocorrência!');
  FIdUsuario := Value;
end;

end.
