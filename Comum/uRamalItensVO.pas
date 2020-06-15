unit uRamalItensVO;

interface

uses
  System.SysUtils, uTableName, uKeyField, System.Generics.Collections;

type
  [TableName('Ramal_Itens')]
  TRamalItensVO = class
  private
    FIdRamal: Integer;
    FId: Integer;
    FNumero: Integer;
    FNome: string;
    procedure SetId(const Value: Integer);
    procedure SetIdRamal(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetNumero(const Value: Integer);
  public
    [KeyField('RamIt_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('RamIt_Ramal')]
    property IdRamal: Integer read FIdRamal write SetIdRamal;
    [FieldName('RamIt_Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('RamIt_Numero')]
    property Numero: Integer read FNumero write SetNumero;
  end;

  TListaRamalItens = TObjectList<TRamalItensVO>;

implementation

{ TRamalItensVO }

procedure TRamalItensVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TRamalItensVO.SetIdRamal(const Value: Integer);
begin
  FIdRamal := Value;
end;

procedure TRamalItensVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TRamalItensVO.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

end.
