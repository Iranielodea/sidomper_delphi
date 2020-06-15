unit uFiltroVersao;

interface

type
  TFiltroVersao = class
  private
    FIdStatus: string;
    FIdUsuario: string;
    FIdTipo: string;
    FDataLiberacaoFinal: string;
    FDataLiberacaoInicial: string;
    FIdCliente: string;
    FDataFinal: string;
    FDataInicial: string;
    FIdProduto: string;
    FIdVersao: Integer;
  public
    property DataInicial: string read FDataInicial write FDataInicial;
    property DataFinal: string read FDataFinal write FDataFinal;
    property DataLiberacaoInicial: string read FDataLiberacaoInicial write FDataLiberacaoInicial;
    property DataLiberacaoFinal: string read FDataLiberacaoFinal write FDataLiberacaoFinal;
    property IdCliente: string read FIdCliente write FIdCliente;
    property IdTipo: string read FIdTipo write FIdTipo;
    property IdStatus: string read FIdStatus write FIdStatus;
    property IdUsuario: string read FIdUsuario write FIdUsuario;
    property IdProduto: string read FIdProduto write FIdProduto;
    property IdVersao: Integer read FIdVersao write FIdVersao;
  end;

implementation

end.
