unit uRecadoFiltro;

interface

uses
  System.SysUtils;

type
  TRecadoFiltro = class
  private
    FIdStatus: string;
    FIdUsuario: string;
    FIdTipo: string;
    FIdCliente: string;
    FDataFinal: string;
    FDataInicial: string;
    FIdUsuarioDestino: string;
    FDataFinalDest: string;
    FDataInicialDest: string;
    FIdUsuarioLcto: string;
    FUsuarioADM: Boolean;
  public
    property DataInicial: string read FDataInicial write FDataInicial;
    property DataFinal: string read FDataFinal write FDataFinal;
    property DataInicialDest: string read FDataInicialDest write FDataInicialDest;
    property DataFinalDest: string read FDataFinalDest write FDataFinalDest;
    property IdUsuarioLcto: string read FIdUsuarioLcto write FIdUsuarioLcto;
    property IdUsuarioDestino: string read FIdUsuarioDestino write FIdUsuarioDestino;
    property IdCliente: string read FIdCliente write FIdCliente;
    property IdTipo: string read FIdTipo write FIdTipo;
    property IdStatus: string read FIdStatus write FIdStatus;
    property UsuarioADM: Boolean read FUsuarioADM write FUsuarioADM;
  end;

implementation

end.
