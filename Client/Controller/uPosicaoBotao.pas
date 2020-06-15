unit uPosicaoBotao;

interface

uses
  Vcl.Buttons, System.SysUtils;

type
  TPosicaoBotao = class
  private
    FIntervalo: Integer;
    FPosicao: Integer;
    FTopo: Integer;
    FIntervaloNavegacao: Integer;
    procedure Incrementar;
    procedure IncrementarNavegacao;
  public
    constructor Create(var Botao: TBitBtn; Posicao: Integer); overload;
    constructor Create(var Botao: TBitBtn; Posicao, Topo: Integer; TemNavegacao: Boolean=False); overload;
    procedure PosicaoBotao(var botao: TBitBtn);
    procedure PosicaoBotaoNavegacao(var botao: TBitBtn);
  end;

implementation

constructor TPosicaoBotao.Create(var Botao: TBitBtn; Posicao: Integer);
begin
  inherited create;
  FPosicao := Posicao;
  FIntervalo := 87;
  FIntervaloNavegacao := 30;
  FTopo := 0;

  Botao.Left := Posicao;
  incrementar();
end;

{ TPosicaoBotao }

constructor TPosicaoBotao.Create(var Botao: TBitBtn; Posicao, Topo: Integer; TemNavegacao: Boolean);
begin
  inherited create;
  FPosicao := Posicao;
  FIntervalo := 87;
  FIntervaloNavegacao := 30;
  FTopo := Topo;

  Botao.Left := Posicao;
  Botao.Top := Topo;
  if TemNavegacao then
    IncrementarNavegacao()
  else
    incrementar();
end;

procedure TPosicaoBotao.Incrementar;
begin
  FPosicao := FPosicao + FIntervalo;
end;

procedure TPosicaoBotao.IncrementarNavegacao;
begin
  FPosicao := FPosicao + FIntervaloNavegacao;
end;

procedure TPosicaoBotao.PosicaoBotao(var botao: TBitBtn);
begin
  if botao.Visible then
  begin
    botao.Left := FPosicao;
    if FTopo > 0 then
      botao.Top := FTopo;

    Incrementar();
  end;
end;

procedure TPosicaoBotao.PosicaoBotaoNavegacao(var botao: TBitBtn);
begin
  if botao.Visible then
  begin
    botao.Left := FPosicao;
    if FTopo > 0 then
      botao.Top := FTopo;

    IncrementarNavegacao();
  end;
end;

end.
