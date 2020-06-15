unit uFiltroAgendamento;

interface

type
  TFiltroAgendamento = class
  private
    FIdStatus: string;
    FIdUsuario: string;
    FIdTipo: string;
    FIdCliente: string;
    FDataFinal: string;
    FDataInicial: string;
  public
    property DataInicial: string read FDataInicial write FDataInicial;
    property DataFinal: string read FDataFinal write FDataFinal;
    property IdUsuario: string read FIdUsuario write FIdUsuario;
    property IdCliente: string read FIdCliente write FIdCliente;
    property IdTipo: string read FIdTipo write FIdTipo;
    property IdStatus: string read FIdStatus write FIdStatus;
  end;

implementation

end.
