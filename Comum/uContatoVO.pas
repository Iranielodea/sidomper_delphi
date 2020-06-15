unit uContatoVO;

interface

uses
  System.SysUtils, uKeyField, uTableName, System.Generics.Collections;

type
  [TableName('Contato')]
  TContatoVO = class
  private
    FEmail: string;
    FId: Integer;
    FDepartamento: string;
    FIdOrcamento: Integer;
    FFone2: string;
    FFone1: string;
    FIdCliente: Integer;
    FNome: string;
    procedure SetDepartamento(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetFone1(const Value: string);
    procedure SetFone2(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdCliente(const Value: Integer);
    procedure SetIdOrcamento(const Value: Integer);
    procedure SetNome(const Value: string);
  public
    [KeyField('Cont_Id')]
    property Id: Integer read FId write SetId;
    [FieldNull('Cont_Cliente')]
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    [FieldNull('Cont_orcamento')]
    property IdOrcamento: Integer read FIdOrcamento write SetIdOrcamento;
    [FieldName('Cont_Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('Cont_Fone1')]
    property Fone1: string read FFone1 write SetFone1;
    [FieldName('Cont_Fone2')]
    property Fone2: string read FFone2 write SetFone2;
    [FieldName('Cont_Depto')]
    property Departamento: string read FDepartamento write SetDepartamento;
    [FieldName('Cont_Email')]
    property Email: string read FEmail write SetEmail;
  end;

  TListaContato = TObjectList<TContatoVO>;

implementation

{ TContatoVO }

procedure TContatoVO.SetDepartamento(const Value: string);
begin
  FDepartamento := Value;
end;

procedure TContatoVO.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TContatoVO.SetFone1(const Value: string);
begin
  FFone1 := Value;
end;

procedure TContatoVO.SetFone2(const Value: string);
begin
  FFone2 := Value;
end;

procedure TContatoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TContatoVO.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TContatoVO.SetIdOrcamento(const Value: Integer);
begin
  FIdOrcamento := Value;
end;

procedure TContatoVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
