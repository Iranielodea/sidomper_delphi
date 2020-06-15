unit uChamadoColaboradorVO;

interface

uses
  System.SysUtils, System.DateUtils, uUsuarioVO;

type
  TChamadoColaboradorVO = class
  private
    FHoraInicial: TTime;
    FIdUsuario: Integer;
    FId: Integer;
    FIdOcorrencia: Integer;
    FHoraFim: TTime;
    FTotalHoras: Double;
    FUsuarioVO: TUsuarioVO;
    procedure SetHoraFim(const Value: TTime);
    procedure SetHoraInicial(const Value: TTime);
    procedure SetId(const Value: Integer);
    procedure SetIdOcorrencia(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetTotalHoras(const Value: Double);
    procedure SetUsuarioVO(const Value: TUsuarioVO);
  public
    property Id: Integer read FId write SetId;
    property IdOcorrencia: Integer read FIdOcorrencia write SetIdOcorrencia;
    property HoraInicial: TTime read FHoraInicial write SetHoraInicial;
    property HoraFim: TTime read FHoraFim write SetHoraFim;
    property IdUsuario: Integer read FIdUsuario write SetIdUsuario;
    property TotalHoras: Double read FTotalHoras write SetTotalHoras;
    property UsuarioVO: TUsuarioVO read FUsuarioVO write SetUsuarioVO;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TChamadoColaboradorVO }

constructor TChamadoColaboradorVO.Create;
begin
  inherited Create;
  FUsuarioVO := TUsuarioVO.Create;
end;

destructor TChamadoColaboradorVO.Destroy;
begin
  FreeAndNil(FUsuarioVO);
  inherited;
end;

procedure TChamadoColaboradorVO.SetHoraFim(const Value: TTime);
begin
  FHoraFim := Value;
end;

procedure TChamadoColaboradorVO.SetHoraInicial(const Value: TTime);
begin
  FHoraInicial := Value;
end;

procedure TChamadoColaboradorVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TChamadoColaboradorVO.SetIdOcorrencia(const Value: Integer);
begin
  FIdOcorrencia := Value;
end;

procedure TChamadoColaboradorVO.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TChamadoColaboradorVO.SetTotalHoras(const Value: Double);
begin
  FTotalHoras := Value;
end;

procedure TChamadoColaboradorVO.SetUsuarioVO(const Value: TUsuarioVO);
begin
  FUsuarioVO := Value;
end;

end.
