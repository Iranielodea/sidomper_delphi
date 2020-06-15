unit uSolicitacaoStatusVO;

interface

type
  TSolicitacaoStatusVO = class
  private
    FId: Integer;
    FIdSolicitacao: Integer;
    FData: TDate;
    FIdStatus: Integer;
    FDescricaoLiberacao: string;
    FIdStatusNovo: Integer;
    FIdUsuarioOperacional: Integer;
    FHora: string;
  public
    property Id: Integer read FId write FId;
    property IdSolicitacao: Integer read FIdSolicitacao write FIdSolicitacao;
    property Data: TDate read FData write FData;
    property IdStatus: Integer read FIdStatus write FIdStatus;
    property IdUsuarioOperacional: Integer read FIdUsuarioOperacional write FIdUsuarioOperacional;
    property IdStatusNovo: Integer read FIdStatusNovo write FIdStatusNovo;
    property DescricaoLiberacao: string read FDescricaoLiberacao write FDescricaoLiberacao;
    property Hora: string read FHora write FHora;
  end;

implementation

end.
