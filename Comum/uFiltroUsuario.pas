unit uFiltroUsuario;

interface

type
  TFiltroUsuario = class
  private
    FIdRevenda: string;
    FIdCliente: string;
    FIdDepartamento: string;
    FId: string;
  public
    property Id: string read FId write FId;
    property IdCliente: string read FIdCliente write FIdCliente;
    property IdRevenda: string read FIdRevenda write FIdRevenda;
    property IdDepartamento: string read FIdDepartamento write FIdDepartamento;
  end;

implementation

end.
