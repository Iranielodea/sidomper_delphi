unit uFiltroChamado;

interface

uses uRevendaVO, uModuloVO, System.SysUtils, uFiltroCliente;

type
  TFiltroChamado = class
  private
    FIdStatus: string;
    FIdTipo: string;
    FIdCliente: string;
    FIdUsuarioAbertura: string;
    FDataFinal: string;
    FDataInicial: string;
    FRevenda: TRevendaVO;
    FModulo: TModuloVO;
    FCliente: TFiltroCliente;
    FTipoMovimento: Integer;
    FId: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    property DataInicial: string read FDataInicial write FDataInicial;
    property DataFinal: string read FDataFinal write FDataFinal;
    property IdUsuarioAbertura: string read FIdUsuarioAbertura write FIdUsuarioAbertura;
    property IdCliente: string read FIdCliente write FIdCliente;
    property IdTipo: string read FIdTipo write FIdTipo;
    property IdStatus: string read FIdStatus write FIdStatus;
    property Revenda: TRevendaVO read FRevenda write FRevenda;
    property Modulo: TModuloVO read FModulo write FModulo;
    property Cliente: TFiltroCliente read FCliente write FCliente;
    property TipoMovimento: Integer read FTipoMovimento write FTipoMovimento;
    property Id: Integer read FId write FId;
  end;

implementation

constructor TFiltroChamado.Create;
begin
  inherited Create();
  FRevenda := TRevendaVO.Create;
  FModulo := TModuloVO.Create;
  FCliente := TFiltroCliente.Create;
end;

destructor TFiltroChamado.Destroy;
begin
  FreeAndNil(FRevenda);
  FreeAndNil(FModulo);
  FreeAndNil(FCliente);
  inherited;
end;

end.
