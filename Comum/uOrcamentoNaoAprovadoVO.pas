unit uOrcamentoNaoAprovadoVO;

interface

uses
  System.SysUtils, uKeyField, uTableName, uTipoVO;

type
  [TableName('Orcamento_NaoAprovado')]
  TOrcamentoNaoAprovadoVO = class
  private
    FDescricao: string;
    FIdTipo: Integer;
    FId: Integer;
    FTipo: TTipoVO;
    FIdOrcamento: Integer;
    procedure SetDescricao(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdTipo(const Value: Integer);
    procedure SetTipo(const Value: TTipoVO);
    procedure SetIdOrcamento(const Value: Integer);
  public
    [KeyField('OrcNAp_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('OrcNAp_Tipo')]
    property IdTipo: Integer read FIdTipo write SetIdTipo;
    [FieldName('OrcNAp_Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('OrcNAp_Orcamento')]
    property IdOrcamento: Integer read FIdOrcamento write SetIdOrcamento;

    property Tipo: TTipoVO read FTipo write SetTipo;

    constructor create;
    destructor destroy; override;
  end;

implementation

{ TOrcamentoNaoAprovadoVO }

constructor TOrcamentoNaoAprovadoVO.create;
begin
  inherited create;
  FTipo := TTipoVO.Create;
end;

destructor TOrcamentoNaoAprovadoVO.destroy;
begin
  FreeAndNil(FTipo);
  inherited;
end;

procedure TOrcamentoNaoAprovadoVO.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TOrcamentoNaoAprovadoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TOrcamentoNaoAprovadoVO.SetIdOrcamento(const Value: Integer);
begin
  FIdOrcamento := Value;
end;

procedure TOrcamentoNaoAprovadoVO.SetIdTipo(const Value: Integer);
begin
  FIdTipo := Value;
end;

procedure TOrcamentoNaoAprovadoVO.SetTipo(const Value: TTipoVO);
begin
  FTipo := Value;
end;

end.
