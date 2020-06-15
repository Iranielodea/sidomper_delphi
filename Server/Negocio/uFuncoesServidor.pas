unit uFuncoesServidor;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TFuncoes = class
  public
    class function EmailExisteNaLista(Email: string; Lista: TList<string>): Boolean;
    class function RetornaListaEmail(Lista: TList<string>): string;
    class function SomenteNumeros(Texto: string): string;
    class function DataIngles(AData: string): string;
    class function HoraToDecimal(Hora: String): double;
    class function DecimalToHora(Hora: double): string;
    class function ValorAmericano(AValor: string): string;
    class function TrocaCaracter(AValor, AOldCacracter, ANewCaracter: string): string;
    class function BolToString(AValor: Boolean): string;
    class function ValorOrNull(AValor: Integer): string;
    class function DataOrNull(AData: TDate): string;
    class function HoraOrNull(AHora: TTime): string;
    class function StringOrNull(AValor: string): string;
    class function UltimoDiaMes(AData: TDateTime): TDateTime;

    class function CalcularDias(ADataInicial, ADataFinal: TDate): Double;
  end;

implementation

{ TFuncoes }

class function TFuncoes.BolToString(AValor: Boolean): string;
begin
  if AValor then
    Result := '1'
  else
    Result := '0';
end;

class function TFuncoes.CalcularDias(ADataInicial, ADataFinal: TDate): Double;
begin
  try
    Result := ADataFinal - ADataInicial;
  except
    Result := 0;
  end;
end;

class function TFuncoes.DataIngles(AData: string): string;
begin
  try
    Result := QuotedStr(FormatDateTime('YYYYMMDD', StrToDate(AData)));
  except
    raise Exception.Create('Data Inválida.');
  end;
end;

class function TFuncoes.DataOrNull(AData: TDate): string;
begin
  if AData > 0 then
    Result := QuotedStr(FormatDateTime('yyyymmdd', AData))
  else
    Result := 'NULL';
end;

class function TFuncoes.DecimalToHora(Hora: double): string;
var
  a,b,c: double;
  d,e,f: string;
begin
  try
    a := frac(Hora);
    b := int(hora);
    c := (a * 60);
    d := formatfloat('00', b);
    e := formatfloat('00', c);
    f := d + ':' + e;
  except
    f := '00:00';
  end;
  result := f;
end;

class function TFuncoes.EmailExisteNaLista(Email: string; Lista: TList<string>): Boolean;
begin
  Result := Lista.Contains(Email);
end;

class function TFuncoes.HoraOrNull(AHora: TTime): string;
begin
  if AHora > 0 then
    Result := QuotedStr(FormatDateTime('hh:mm', AHora))
  else
    Result := 'NULL';
end;

class function TFuncoes.HoraToDecimal(Hora: String): double;
var a,b,c,d: double;
begin
  try
    a := StrToFloat(copy(Hora, 4, 2));
    b := a / 60;
    c := int(StrToFloat(copy(Hora, 1, 2)));
    d := c + b;
  except
    d := 0;
  end;
  result := d;
end;

class function TFuncoes.RetornaListaEmail(Lista: TList<string>): string;
var
  sReturn: string;
  sEmail: string;
begin
  sReturn := '';
  for sEmail in Lista do
  begin
    if sReturn = '' then
      sReturn := sEmail
    else
      sReturn := sReturn + ';' + sEmail;
  end;
  Result := sReturn;
end;

class function TFuncoes.SomenteNumeros(Texto: string): string;
var
  i: Integer;
  schar: string;
begin
  schar := '';
  for i := 1 to Length(Texto) do
  begin
    if Texto[i] in ['0','1','2','3','4','5','6','7','8','9'] then
      schar := schar + Texto[i];
  end;

  Result := schar;
end;

class function TFuncoes.StringOrNull(AValor: string): string;
begin
  if AValor.Trim() = '' then
    Result := 'NULL'
  else
    Result := QuotedStr(AValor);
end;

class function TFuncoes.TrocaCaracter(AValor, AOldCacracter,
  ANewCaracter: string): string;
begin
  Result := StringReplace(AValor, AOldCacracter, ANewCaracter, [rfReplaceAll]);
end;

class function TFuncoes.UltimoDiaMes(AData: TDateTime): TDateTime;
var
  ano, mes, dia : word;
  mDtTemp : TDateTime;
begin
  Decodedate(AData, ano, mes, dia);
  mDtTemp := (AData - dia) + 33;
  Decodedate(mDtTemp, ano, mes, dia);
  Result := mDtTemp - dia;
end;

class function TFuncoes.ValorAmericano(AValor: string): string;
begin
  Result := TrocaCaracter(AValor, ',','.');
end;

class function TFuncoes.ValorOrNull(AValor: Integer): string;
begin
  if AValor = 0 then
    Result := 'Null'
  else
    Result := IntToStr(AValor);
end;

end.
