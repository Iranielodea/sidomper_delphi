unit uSolicitacaoCronogramaVO;

interface

uses
  System.SysUtils, uUsuarioVO;

type
  TSolicitacaoCronogramaVO = class
  private
    FId: Integer;
    FIdUsuarioOperacional: Integer;
    FHoraFim: string;
    FIdSolicitacao: Integer;
    FHoraInicio: string;
    FData: TDate;
    FUsuarioOperacional: TUsuarioVO;
    procedure SetData(const Value: TDate);
    procedure SetHoraFim(const Value: string);
    procedure SetHoraInicio(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdSolicitacao(const Value: Integer);
    procedure SetIdUsuarioOperacional(const Value: Integer);
    procedure SetUsuarioOperacional(const Value: TUsuarioVO);
  public
    property Id: Integer read FId write SetId;
    property IdSolicitacao: Integer read FIdSolicitacao write SetIdSolicitacao;
    property IdUsuarioOperacional: Integer read FIdUsuarioOperacional write SetIdUsuarioOperacional;
    property Data: TDate read FData write SetData;
    property HoraInicio: string read FHoraInicio write SetHoraInicio;
    property HoraFim: string read FHoraFim write SetHoraFim;

    property UsuarioOperacional: TUsuarioVO read FUsuarioOperacional write SetUsuarioOperacional;

    constructor Create(); overload;
    destructor Destroy; override;
  end;


implementation

{ TSolicitacaoCronogramaVO }

constructor TSolicitacaoCronogramaVO.Create;
begin
  inherited Create;
  FUsuarioOperacional := TUsuarioVO.Create;
end;

destructor TSolicitacaoCronogramaVO.Destroy;
begin
  FreeAndNil(FUsuarioOperacional);
  inherited;
end;

procedure TSolicitacaoCronogramaVO.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TSolicitacaoCronogramaVO.SetHoraFim(const Value: string);
begin
  FHoraFim := Value;
end;

procedure TSolicitacaoCronogramaVO.SetHoraInicio(const Value: string);
begin
  FHoraInicio := Value;
end;

procedure TSolicitacaoCronogramaVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TSolicitacaoCronogramaVO.SetIdSolicitacao(const Value: Integer);
begin
  FIdSolicitacao := Value;
end;

procedure TSolicitacaoCronogramaVO.SetIdUsuarioOperacional(
  const Value: Integer);
begin
  FIdUsuarioOperacional := Value;
end;

procedure TSolicitacaoCronogramaVO.SetUsuarioOperacional(
  const Value: TUsuarioVO);
begin
  FUsuarioOperacional := Value;
end;

end.
