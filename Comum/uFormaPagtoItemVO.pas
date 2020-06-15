unit uFormaPagtoItemVO;

interface

uses
  System.SysUtils;

type
  TFormaPagtoItemVO = class
  private
    FObs: string;
    FId: Integer;
    FDias: Integer;
    FIdFormaPagto: Integer;
    procedure SetDias(const Value: Integer);
    procedure SetId(const Value: Integer);
    procedure SetIdFormaPagto(const Value: Integer);
    procedure SetObs(const Value: string);
  public
    property Id: Integer read FId write SetId;
    property IdFormaPagto: Integer read FIdFormaPagto write SetIdFormaPagto;
    property Dias: Integer read FDias write SetDias;
    property Obs: string read FObs write SetObs;
  end;

implementation

{ TFormaPagtoItem }

procedure TFormaPagtoItemVO.SetDias(const Value: Integer);
begin
  if Value < 0 then
    raise Exception.Create('Dias deve ser maior ou igual a Zero!');

  FDias := Value;
end;

procedure TFormaPagtoItemVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TFormaPagtoItemVO.SetIdFormaPagto(const Value: Integer);
begin
  FIdFormaPagto := Value;
end;

procedure TFormaPagtoItemVO.SetObs(const Value: string);
begin
  FObs := Value;
end;

end.
