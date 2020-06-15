unit uSolicitacaoOcorrenciaVO;

interface

uses
  System.SysUtils, uUsuarioVO;

type
  TSolicitacaoOcorrenciaVO = class
  private
    FHora: string;
    FDescricao: string;
    FIdTipo: Integer;
    FId: Integer;
    FAnexo: string;
    FIdUsuarioOperacional: Integer;
    FIdSolicitacao: Integer;
    FClassificacao: Integer;
    FData: TDate;
    FUsuario: TUsuarioVO;
    procedure SetAnexo(const Value: string);
    procedure SetClassificacao(const Value: Integer);
    procedure SetData(const Value: TDate);
    procedure SetDescricao(const Value: string);
    procedure SetHora(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdSolicitacao(const Value: Integer);
    procedure SetIdTipo(const Value: Integer);
    procedure SetIdUsuarioOperacional(const Value: Integer);
    procedure SetUsuario(const Value: TUsuarioVO);
  public
    property Id: Integer read FId write SetId;
    property IdSolicitacao: Integer read FIdSolicitacao write SetIdSolicitacao;
    property IdUsuarioOperacional: Integer read FIdUsuarioOperacional write SetIdUsuarioOperacional;
    property Data: TDate read FData write SetData;
    property Hora: string read FHora write SetHora;
    property Descricao: string read FDescricao write SetDescricao;
    property IdTipo: Integer read FIdTipo write SetIdTipo;
    property Classificacao: Integer read FClassificacao write SetClassificacao;
    property Anexo: string read FAnexo write SetAnexo;

    property Usuario: TUsuarioVO read FUsuario write SetUsuario;

    constructor Create; overload;
    destructor Destroy; override;
  end;

implementation

{ TSolicitacaoOcorrenciaVO }

constructor TSolicitacaoOcorrenciaVO.Create;
begin
  inherited Create;
  FUsuario := TUsuarioVO.Create;
end;

destructor TSolicitacaoOcorrenciaVO.Destroy;
begin
  FreeAndNil(FUsuario);
  inherited;
end;

procedure TSolicitacaoOcorrenciaVO.SetAnexo(const Value: string);
begin
  FAnexo := Value;
end;

procedure TSolicitacaoOcorrenciaVO.SetClassificacao(const Value: Integer);
begin
  FClassificacao := Value;
end;

procedure TSolicitacaoOcorrenciaVO.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TSolicitacaoOcorrenciaVO.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TSolicitacaoOcorrenciaVO.SetHora(const Value: string);
begin
  FHora := Value;
end;

procedure TSolicitacaoOcorrenciaVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TSolicitacaoOcorrenciaVO.SetIdSolicitacao(const Value: Integer);
begin
  FIdSolicitacao := Value;
end;

procedure TSolicitacaoOcorrenciaVO.SetIdTipo(const Value: Integer);
begin
  FIdTipo := Value;
end;

procedure TSolicitacaoOcorrenciaVO.SetIdUsuarioOperacional(
  const Value: Integer);
begin
  FIdUsuarioOperacional := Value;
end;

procedure TSolicitacaoOcorrenciaVO.SetUsuario(const Value: TUsuarioVO);
begin
  FUsuario := Value;
end;

end.
