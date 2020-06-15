unit uModeloRelatorioVO;

interface

uses
  System.SysUtils, uKeyField, uTableName;

type
  [TableName('Modelo_Relatorio')]
  TModeloRelatorioVO = class
  private
    FDescricao: string;
    FCodigo: Integer;
    FId: Integer;
    FArquivo: string;
    FIdRevenda: Integer;
    procedure SetArquivo(const Value: string);
    procedure SetCodigo(const Value: Integer);
    procedure SetDescricao(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdRevenda(const Value: Integer);
  public
    [KeyField('ModR_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('ModR_Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('ModR_Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('ModR_Arquivo')]
    property Arquivo: string read FArquivo write SetArquivo;
    [FieldNull('ModR_Revenda')]
    property IdRevenda: Integer read FIdRevenda write SetIdRevenda;
  end;

implementation

{ TModeloRelatorio }

procedure TModeloRelatorioVO.SetArquivo(const Value: string);
begin
  if Value.Trim = '' then
    raise Exception.Create('Infome o Nome do Arquivo!');
  FArquivo := Value;
end;

procedure TModeloRelatorioVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TModeloRelatorioVO.SetDescricao(const Value: string);
begin
  if Value.Trim = '' then
    raise Exception.Create('Informe a Descrição do Modelo!');
  FDescricao := Value;
end;

procedure TModeloRelatorioVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TModeloRelatorioVO.SetIdRevenda(const Value: Integer);
begin
  FIdRevenda := Value;
end;

end.
