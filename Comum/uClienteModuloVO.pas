unit uClienteModuloVO;

interface

uses System.SysUtils, uProdutoVO, uModuloVO, uKeyField, uTableName;

type
  [TableName('Cliente_Modulo')]
  TClienteModuloVO = class
  private
    FProduto: TProduto;
    FId: Integer;
    FModulo: TModuloVO;
    FIdCliente: Integer;
    FIdModulo: Integer;
    FIdProduto: Integer;
    procedure SetModulo(const Value: TModuloVO);
    procedure SetIdCliente(const Value: Integer);
  public
    [KeyField('CliMod_Id')]
    property Id: Integer read FId write FId;
    [FieldNull('CliMod_Modulo')]
    property IdModulo: Integer read FIdModulo write FIdModulo;
    [FieldNull('CliMod_Produto')]
    property IdProduto: Integer read FIdProduto write FIdProduto;
    [FieldNull('CliMod_Cliente')]
    property IdCliente: Integer read FIdCliente write SetIdCliente;

    property Produto: TProduto read FProduto write FProduto;
    property Modulo: TModuloVO read FModulo write SetModulo;

    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TClienteModulo }

constructor TClienteModuloVO.Create;
begin
  FProduto := TProduto.Create;
  FModulo := TModuloVO.Create;
end;

destructor TClienteModuloVO.Destroy;
begin
  FreeAndNil(FProduto);
  FreeAndNil(FModulo);
  inherited;
end;

procedure TClienteModuloVO.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TClienteModuloVO.SetModulo(const Value: TModuloVO);
begin
  FModulo := Value;
end;

end.
