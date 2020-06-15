unit uRamalVO;

interface

uses
  System.SysUtils, uTableName, uKeyField, uRamalItensVO, System.Generics.Collections;

type
  [TableName('Ramal')]
  TRamalVO = class
  private
    FId: Integer;
    FDepartamento: string;
    FItens: TObjectList<TRamalItensVO>;
    procedure SetDepartamento(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetItens(const Value: TObjectList<TRamalItensVO>);
  public
    [KeyField('Ram_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('Ram_Departamento')]
    property Departamento: string read FDepartamento write SetDepartamento;

    property Itens: TObjectList<TRamalItensVO> read FItens write SetItens;

    constructor create;
    destructor destroy; override;
  end;

  TListaRamal = TObjectList<TRamalVO>;


implementation

{ TRamalVO }

constructor TRamalVO.create;
begin
  inherited create;
  FItens := TObjectList<TRamalItensVO>.Create();
end;

destructor TRamalVO.destroy;
begin
  FreeAndNil(FItens);
  inherited;
end;

procedure TRamalVO.SetDepartamento(const Value: string);
begin
  FDepartamento := Value;
end;

procedure TRamalVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TRamalVO.SetItens(const Value: TObjectList<TRamalItensVO>);
begin
  FItens := Value;
end;

end.
