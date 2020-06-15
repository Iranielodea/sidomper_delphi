unit uChamadoStatusVO;

interface

type
  TChamadoStatusVO = class
  private
    FId: Integer;
    FIdChamado: Integer;
    FData: TDate;
    FIdStatus: Integer;
    FIdUsuarioAtendeAtual: Integer;
    FHora: TTime;
  public
    property Id: Integer read FId write FId;
    property IdChamado: Integer read FIdChamado write FIdChamado;
    property Data: TDate read FData write FData;
    property Hora: TTime read FHora write FHora;
    property IdStatus: Integer read FIdStatus write FIdStatus;
    property IdUsuarioAtendeAtual: Integer read FIdUsuarioAtendeAtual write FIdUsuarioAtendeAtual;
  end;

implementation

end.
