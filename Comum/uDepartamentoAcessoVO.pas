unit uDepartamentoAcessoVO;

interface

uses
  System.SysUtils, uKeyField, uTableName;

type
  [TableName('Departamento_Acesso')]
  TDepartamentoAcessoVO = class
  private
    FExcluir: Boolean;
    FIdDepartamento: Integer;
    FIncluir: Boolean;
    FId: Integer;
    FPrograma: Integer;
    FRelatorio: Boolean;
    FAcesso: Boolean;
    FEditar: Boolean;
    procedure SetAcesso(const Value: Boolean);
    procedure SetEditar(const Value: Boolean);
    procedure SetExcluir(const Value: Boolean);
    procedure SetId(const Value: Integer);
    procedure SetIdDepartamento(const Value: Integer);
    procedure SetIncluir(const Value: Boolean);
    procedure SetPrograma(const Value: Integer);
    procedure SetRelatorio(const Value: Boolean);
  public
    [KeyField('DepAc_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('DepAc_Departamento')]
    property IdDepartamento: Integer read FIdDepartamento write SetIdDepartamento;
    [FieldName('DepAc_Programa')]
    property Programa: Integer read FPrograma write SetPrograma;
    [FieldName('DepAc_Acesso')]
    property Acesso: Boolean read FAcesso write SetAcesso;
    [FieldName('DepAc_Incluir')]
    property Incluir: Boolean read FIncluir write SetIncluir;
    [FieldName('DepAc_Editar')]
    property Editar: Boolean read FEditar write SetEditar;
    [FieldName('DepAc_Excluir')]
    property Excluir: Boolean read FExcluir write SetExcluir;
    [FieldName('DepAc_Relatorio')]
    property Relatorio: Boolean read FRelatorio write SetRelatorio;
  end;

implementation

{ TDepartamentoAcessoVO }

procedure TDepartamentoAcessoVO.SetAcesso(const Value: Boolean);
begin
  FAcesso := Value;
end;

procedure TDepartamentoAcessoVO.SetEditar(const Value: Boolean);
begin
  FEditar := Value;
end;

procedure TDepartamentoAcessoVO.SetExcluir(const Value: Boolean);
begin
  FExcluir := Value;
end;

procedure TDepartamentoAcessoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TDepartamentoAcessoVO.SetIdDepartamento(const Value: Integer);
begin
  FIdDepartamento := Value;
end;

procedure TDepartamentoAcessoVO.SetIncluir(const Value: Boolean);
begin
  FIncluir := Value;
end;

procedure TDepartamentoAcessoVO.SetPrograma(const Value: Integer);
begin
  FPrograma := Value;
end;

procedure TDepartamentoAcessoVO.SetRelatorio(const Value: Boolean);
begin
  FRelatorio := Value;
end;

end.
