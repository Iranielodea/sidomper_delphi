unit uDepartamentoEmailVO;

interface

uses
  System.SysUtils, uTableName, uKeyField, System.Generics.Collections;

type
  [TableName('Departamento_Email')]
  TDepartamentoEmailVO = class
  private
    FIdDepartamento: Integer;
    FEmail: string;
    FId: Integer;
    procedure SetEmail(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdDepartamento(const Value: Integer);
  public
    [KeyField('DepEm_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('DepEm_Departamento')]
    Property IdDepartamento: Integer read FIdDepartamento write SetIdDepartamento;
    [FieldName('DepEm_Email')]
    property Email: string read FEmail write SetEmail;
  end;

  TListaDepartamentoEmail = TObjectList<TDepartamentoEmailVO>;

implementation

{ TDepartamentoEmailVO }

procedure TDepartamentoEmailVO.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TDepartamentoEmailVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TDepartamentoEmailVO.SetIdDepartamento(const Value: Integer);
begin
  FIdDepartamento := Value;
end;

end.
