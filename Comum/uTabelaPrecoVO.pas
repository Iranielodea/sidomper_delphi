unit uTabelaPrecoVO;

interface

uses
  System.SysUtils, uTableName, uKeyField, System.Generics.Collections, uProdutoVO,
  uStatusVO, uTipoVO, uModuloVO;

type
  [TableName('TabPreco_Modulo')]
  TTabPrecoModuloVO = class
  private
    FIdTabPreco: Integer;
    FIdModulo: Integer;
    FId: Integer;
    FModulo: TModuloVO;
    procedure SetId(const Value: Integer);
    procedure SetIdModulo(const Value: Integer);
    procedure SetIdTabPreco(const Value: Integer);
    procedure SetModulo(const Value: TModuloVO);

  public
    [KeyField('TabM_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('TabM_TabPreco')]
    property IdTabPreco: Integer read FIdTabPreco write SetIdTabPreco;
    [FieldName('TabM_Modulo')]
    property IdModulo: Integer read FIdModulo write SetIdModulo;

    property Modulo: TModuloVO read FModulo write SetModulo;

    constructor Create(); overload;
    destructor Destroy(); override;
  end;

  [TableName('TabPreco')]
  TTabelaPrecoVO = class
  private
    FIdStatus: Integer;
    FObservacao: string;
    FValorMensalRegNormal: Double;
    FValorMensalSimples: Double;
    FAtivo: Boolean;
    FIdTipo: Integer;
    FValorImplRegNormal: Double;
    FValorImplSimples: Double;
    FIdProduto: Integer;
    FId: Integer;
    FReferencia: string;
    FNome: string;
    FData: TDate;
    FProduto: TProduto;
    FStatus: TStatusVO;
    FTipo: TTipoVO;
    FItensTabela: TObjectList<TTabPrecoModuloVO>;
    procedure SetAtivo(const Value: Boolean);
    procedure SetData(const Value: TDate);
    procedure SetId(const Value: Integer);
    procedure SetIdProduto(const Value: Integer);
    procedure SetIdStatus(const Value: Integer);
    procedure SetIdTipo(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetObservacao(const Value: string);
    procedure SetReferencia(const Value: string);
    procedure SetValorImplRegNormal(const Value: Double);
    procedure SetValorImplSimples(const Value: Double);
    procedure SetValorMensalRegNormal(const Value: Double);
    procedure SetValorMensalSimples(const Value: Double);
    procedure SetStatus(const Value: TStatusVO);
    procedure SetTipo(const Value: TTipoVO);
    procedure SetProduto(const Value: TProduto);
    procedure SetItensTabela(const Value: TObjectList<TTabPrecoModuloVO>);

  public
    [KeyField('Tab_Id')]
    property Id: Integer read FId write SetId;
    [FieldDate('Tab_Data')]
    property Data: TDate read FData write SetData;
    [FieldName('Tab_Referencia')]
    property Referencia: string read FReferencia write SetReferencia;
    [FieldName('Tab_Nome')]
    property Nome: string read FNome write SetNome;
    [FieldNull('Tab_Produto')]
    property IdProduto: Integer read FIdProduto write SetIdProduto;
    [FieldNull('Tab_Status')]
    property IdStatus: Integer read FIdStatus write SetIdStatus;
    [FieldNull('Tab_Tipo')]
    property IdTipo: Integer read FIdTipo write SetIdTipo;
    [FieldName('Tab_Ativo')]
    property Ativo: Boolean read FAtivo write SetAtivo;
    [FieldName('Tab_ValorImplSimples')]
    property ValorImplSimples: Double read FValorImplSimples write SetValorImplSimples;
    [FieldName('Tab_ValorMensalSimples')]
    property ValorMensalSimples: Double read FValorMensalSimples write SetValorMensalSimples;
    [FieldName('Tab_ValorImplRegNormal')]
    property ValorImplRegNormal: Double read FValorImplRegNormal write SetValorImplRegNormal;
    [FieldName('Tab_ValorMensalRegNormal')]
    property ValorMensalRegNormal: Double read FValorMensalRegNormal write SetValorMensalRegNormal;
    [FieldName('Tab_Observacao')]
    property Observacao: string read FObservacao write SetObservacao;

    property Produto: TProduto read FProduto write SetProduto;
    property Status: TStatusVO read FStatus write SetStatus;
    property Tipo: TTipoVO read FTipo write SetTipo;
    property ItensTabela: TObjectList<TTabPrecoModuloVO> read FItensTabela write SetItensTabela;

    constructor Create(); overload;
    destructor Destroy(); override;
  end;

  TListaTabPrecoVO = TObjectList<TTabelaPrecoVO>;

  TTabPrecoConsulta = class
  private
    FId: Integer;
    FNome: string;
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);

  public
    property Id: Integer read FId write SetId;
    property Nome: string read FNome write SetNome;
  end;

  TListaTabPrecoConsulta = TObjectList<TTabPrecoConsulta>;

  TTabPrecoFiltro = class
  private
    FStatusId: string;
    FTipoId: string;
    FProdutoId: string;
    FTabelaId: string;
  public
    property TabelaId: string read FTabelaId write FTabelaId;
    property ProdutoId: string read FProdutoId write FProdutoId;
    property StatusId: string read FStatusId write FStatusId;
    property TipoId: string read FTipoId write FTipoId;
  end;


implementation

{ TTabelaPrecoVO }

constructor TTabelaPrecoVO.Create;
begin
  inherited Create;
  FProduto := TProduto.Create;
  FStatus := TStatusVO.Create;
  FTipo := TTipoVO.Create;
  FItensTabela := TObjectList<TTabPrecoModuloVO>.Create();
end;

destructor TTabelaPrecoVO.Destroy;
begin
  FreeAndNil(FItensTabela);
  FreeAndNil(FTipo);
  FreeAndNil(FStatus);
  FreeAndNil(FProduto);
  inherited;
end;

procedure TTabelaPrecoVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TTabelaPrecoVO.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TTabelaPrecoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TTabelaPrecoVO.SetIdProduto(const Value: Integer);
begin
  FIdProduto := Value;
end;

procedure TTabelaPrecoVO.SetIdStatus(const Value: Integer);
begin
  FIdStatus := Value;
end;

procedure TTabelaPrecoVO.SetIdTipo(const Value: Integer);
begin
  FIdTipo := Value;
end;

procedure TTabelaPrecoVO.SetItensTabela(
  const Value: TObjectList<TTabPrecoModuloVO>);
begin
  FItensTabela := Value;
end;

procedure TTabelaPrecoVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TTabelaPrecoVO.SetObservacao(const Value: string);
begin
  FObservacao := Value;
end;

procedure TTabelaPrecoVO.SetProduto(const Value: TProduto);
begin
  FProduto := Value;
end;

procedure TTabelaPrecoVO.SetReferencia(const Value: string);
begin
  FReferencia := Value;
end;

procedure TTabelaPrecoVO.SetStatus(const Value: TStatusVO);
begin
  FStatus := Value;
end;

procedure TTabelaPrecoVO.SetTipo(const Value: TTipoVO);
begin
  FTipo := Value;
end;

procedure TTabelaPrecoVO.SetValorImplRegNormal(const Value: Double);
begin
  FValorImplRegNormal := Value;
end;

procedure TTabelaPrecoVO.SetValorImplSimples(const Value: Double);
begin
  FValorImplSimples := Value;
end;

procedure TTabelaPrecoVO.SetValorMensalRegNormal(const Value: Double);
begin
  FValorMensalRegNormal := Value;
end;

procedure TTabelaPrecoVO.SetValorMensalSimples(const Value: Double);
begin
  FValorMensalSimples := Value;
end;

{ TTabPrecoModuloVO }

constructor TTabPrecoModuloVO.Create;
begin
  inherited Create;
  FModulo := TModuloVO.Create;
end;

destructor TTabPrecoModuloVO.Destroy;
begin
  FreeAndNil(FModulo);
  inherited;
end;

procedure TTabPrecoModuloVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TTabPrecoModuloVO.SetIdModulo(const Value: Integer);
begin
  FIdModulo := Value;
end;

procedure TTabPrecoModuloVO.SetIdTabPreco(const Value: Integer);
begin
  FIdTabPreco := Value;
end;

procedure TTabPrecoModuloVO.SetModulo(const Value: TModuloVO);
begin
  FModulo := Value;
end;

{ TTabPrecoConsulta }

procedure TTabPrecoConsulta.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TTabPrecoConsulta.SetNome(const Value: string);
begin
  FNome := Value;
end;

end.
