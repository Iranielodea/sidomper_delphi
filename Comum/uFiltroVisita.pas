unit uFiltroVisita;

interface

uses uRevendaVO;

type
  TFiltroVisita = class
  private
    FIdStatus: string;
    FIdTipo: string;
    FIdCliente: string;
    FDataFinal: string;
    FDataInicial: string;
    FIdUsuario: string;
    FRevenda: TRevendaVO;
    FId: Integer;
    FQtdeDias: Integer;
    FIdCidade: string;
    FPerfil: string;

  public
    constructor Create;
    destructor Destroy; override;

    property DataInicial: string read FDataInicial write FDataInicial;
    property DataFinal: string read FDataFinal write FDataFinal;
    property IdCliente: string read FIdCliente write FIdCliente;
    property IdTipo: string read FIdTipo write FIdTipo;
    property IdStatus: string read FIdStatus write FIdStatus;
    property IdUsuario: string read FIdUsuario write FIdUsuario;
    property Revenda: TRevendaVO read FRevenda write FRevenda;
    property Id: Integer read FId write FId;
    property IdCidade: string read FIdCidade write FIdCidade;
    property QtdeDias: Integer read FQtdeDias write FQtdeDias;
    property Perfil: string read FPerfil write FPerfil;
  end;

implementation

{ TFiltroVisita }

constructor TFiltroVisita.Create;
begin
  inherited Create();
  Revenda := TRevendaVO.Create;
end;

destructor TFiltroVisita.Destroy;
begin
  Revenda.Free;
  inherited;
end;

end.
