unit uFormaPagtoVO;

interface

uses
  System.Generics.Collections, uFormaPagtoItemVO, System.SysUtils;

type
  TFormaPagtoVO = class
  private
    FItens: TObjectList<TFormaPagtoItemVO>;
    FAtivo: Boolean;
    FCodigo: Integer;
    FId: Integer;
    FNome: string;
    procedure SetAtivo(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetId(const Value: Integer);
    procedure SetItens(const Value: TObjectList<TFormaPagtoItemVO>);
    procedure SetNome(const Value: string);
  public
    property Id: Integer read FId write SetId;
    property Codigo: Integer read FCodigo write SetCodigo;
    property Nome: string read FNome write SetNome;
    property Ativo: Boolean read FAtivo write SetAtivo;
    property Itens: TObjectList<TFormaPagtoItemVO> read FItens write SetItens;
    constructor create;
    destructor destroy; override;
  end;

implementation

{ TFormaPagtoVO }

constructor TFormaPagtoVO.create;
begin
  inherited create;
  FItens := TObjectList<TFormaPagtoItemVO>.Create();
end;

destructor TFormaPagtoVO.destroy;
begin
  FreeAndNil(FItens);
  inherited;
end;

procedure TFormaPagtoVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TFormaPagtoVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TFormaPagtoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TFormaPagtoVO.SetItens(const Value: TObjectList<TFormaPagtoItemVO>);
begin
  FItens := Value;
end;

procedure TFormaPagtoVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
