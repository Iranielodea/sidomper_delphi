unit uParcelas;

interface

uses
  System.SysUtils;

type
  TParcelas = class
  private
    FValorPrimeira: Currency;
    FValorOutras: Currency;
  public
    procedure Calculo(AQtdeParcelas: Integer; AValor: Currency);
    property ValorPrimeira: Currency read FValorPrimeira;
    property ValorOutras: Currency read FValorOutras;
  end;

implementation

{ TParcelas }

procedure TParcelas.Calculo(AQtdeParcelas: Integer; AValor: Currency);
var
  divisao: Currency;
  Mult: Currency;
  Dif: Currency;
begin
  divisao := Trunc(AValor / AQtdeParcelas);
  Mult := AQtdeParcelas * divisao;
  Dif := AValor - Mult;

  FValorPrimeira := divisao + Dif;
  FValorOutras := divisao;
end;

end.
