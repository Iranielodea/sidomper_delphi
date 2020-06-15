unit uFiltroBaseConhecimento;

interface

type
  TFiltroBaseConhecimento = class
  private
    FIdStatus: string;
    FIdTipo: string;
    FDataFinal: string;
    FDataInicial: string;
    FIdUsuario: string;
    FIdProduto: string;
    FIdModulo: string;

  public
    property DataInicial: string read FDataInicial write FDataInicial;
    property DataFinal: string read FDataFinal write FDataFinal;
    property IdTipo: string read FIdTipo write FIdTipo;
    property IdStatus: string read FIdStatus write FIdStatus;
    property IdUsuario: string read FIdUsuario write FIdUsuario;
    property IdProduto: string read FIdProduto write FIdProduto;
    property IdModulo: string read FIdModulo write FIdModulo;
  end;

implementation

end.
