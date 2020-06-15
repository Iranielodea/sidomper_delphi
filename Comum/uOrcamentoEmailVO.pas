unit uOrcamentoEmailVO;

interface

uses
  uKeyField, uTableName, System.Generics.Collections;

type
  [TableName('Orcamento_Email')]
  TOrcamentoEmailVO = class
  private
    FEmail: string;
    FId: Integer;
    FIdOrcamento: Integer;
    procedure SetEmail(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdOrcamento(const Value: Integer);
  public
    [KeyField('OrcEm_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('OrcEm_Orcamento')]
    property IdOrcamento: Integer read FIdOrcamento write SetIdOrcamento;
    [FieldName('OrcEm_Email')]
    property Email: string read FEmail write SetEmail;
  end;

  TListaOrcamentoEmail = TObjectList<TOrcamentoEmailVO>;

implementation

{ TOrcamentoEmailVO }

procedure TOrcamentoEmailVO.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TOrcamentoEmailVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrcamentoEmailVO.SetIdOrcamento(const Value: Integer);
begin
  FIdOrcamento := Value;
end;

end.
