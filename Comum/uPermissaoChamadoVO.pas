unit uPermissaoChamadoVO;

interface

uses
  System.SysUtils;

type
  TPermissaoChamadoAtividade = class
  private
    FOcorrencia: Boolean;
    FStatus: Boolean;
    FAbertura: Boolean;
    procedure SetAbertura(const Value: Boolean);
    procedure SetOcorrencia(const Value: Boolean);
    procedure SetStatus(const Value: Boolean);
  public
    property Abertura: Boolean read FAbertura write SetAbertura;
    property Ocorrencia: Boolean read FOcorrencia write SetOcorrencia;
    property Status: Boolean read FStatus write SetStatus;
  end;

  TPermissaoChamadoVO = class(TPermissaoChamadoAtividade)
  end;

  TPermissaoAtividadeVO = class(TPermissaoChamadoAtividade)
  end;


implementation

{ TPermissaoChamadoAtividade }

procedure TPermissaoChamadoAtividade.SetAbertura(const Value: Boolean);
begin
  FAbertura := Value;
end;

procedure TPermissaoChamadoAtividade.SetOcorrencia(const Value: Boolean);
begin
  FOcorrencia := Value;
end;

procedure TPermissaoChamadoAtividade.SetStatus(const Value: Boolean);
begin
  FStatus := Value;
end;

end.
