unit uExtensoValor;

interface

uses
  System.SysUtils, System.Variants;

type
  TExtensoValor = class
  private
    function preparaextenso(Valor: string): double;
    function Ext999(intValor: integer): string;
    function Extenso(intValor: integer): string;
    procedure ExtSinPlur(intValor: integer; stSing, stPlural: string; var stValor: string);
    function Zeros(vtaman: integer; vcampo: string): string;
    function MoedaExtenso(dblValor: double; stMoeda, stMoedas: string): string;
  public
    function ValorExtenso(dblValor: double): string;
  end;

implementation

{ TExtensoValor }

function TExtensoValor.Ext999(intValor: integer): string;
var stValExtenso, stUnidade, stDezena, stCentena : string;
    intUnidade, intDezena, intCentena : integer;
    stUnidades, stTeens, stDezenas, stCentenas : Variant;
begin
  stUnidades := VarArrayOf(['UM', 'DOIS', 'TRES', 'QUATRO', 'CINCO',
                            'SEIS', 'SETE', 'OITO', 'NOVE' ]);
  stTeens := VarArrayOf(['ONZE', 'DOZE', 'TREZE', 'CATORZE', 'QUINZE',
                         'DEZESSEIS', 'DEZESSETE', 'DEZOITO', 'DEZENOVE']);
  stDezenas := VarArrayOf(['DEZ', 'VINTE', 'TRINTA', 'QUARENTA', 'CINQUENTA',
                           'SESSENTA', 'SETENTA', 'OITENTA', 'NOVENTA']);
  stCentenas := VarArrayOf(['CENTO', 'DUZENTOS', 'TREZENTOS', 'QUATROCENTOS',
                            'QUINHENTOS', 'SEISCENTOS', 'SETECENTOS',
                            'OITOCENTOS', 'NOVECENTOS']);

  if intValor = 0 then
     stValExtenso := 'ZERO'
  else if intValor = 100 then
     stValExtenso := 'CEM'
  else if intValor <= 999 then
     begin
       stCentena := '';
       stDezena := '';
       stUnidade := '';
       intCentena := Trunc(intValor/100);
       intDezena  := Trunc((intValor - intCentena*100)/10);
       intUnidade := Trunc(intValor - intCentena*100 - intDezena*10);
       if intCentena <> 0 then
          stCentena := stCentenas[intCentena - 1] + ' E ';
       if intDezena = 1 then
          if intUnidade = 0 then
             stDezena := 'DEZ'
          else
             stDezena := stTeens[intUnidade - 1];
       if intDezena > 1 then
          stDezena := stDezenas[intDezena - 1] + ' E ';
       if (intUnidade <> 0) and (intDezena <> 1) then
          stUnidade := stUnidades[intUnidade - 1];
       stValExtenso := stCentena + stDezena + stUnidade;
       if Copy(stValExtenso, Length(stValExtenso) - 2, 3) = ' E ' then
          Delete(stValExtenso, Length(stValExtenso) - 2, 3);
     end;
  Result := stValExtenso;
end;

function TExtensoValor.Extenso(intValor: integer): string;
var stValExtenso, stValor : string;
    intValor1, intValor2, intValor3, intValor4 : integer;
begin
  stValor :=Zeros(12,InttoStr(IntValor));
  intValor1 := StrToInt(Copy(stValor, 1, 3));
  intValor2 := StrToInt(Copy(stValor, 4, 3));
  intValor3 := StrToInt(Copy(stValor, 7, 3));
  intValor4 := StrToInt(Copy(stValor, 10, 3));
  stValExtenso := '';
  if intValor1 > 0 then
     begin
       stValExtenso := Ext999(intValor1);
       ExtSinPlur(intValor1, 'BILHAO, ', 'BILHOES, ', stValExtenso);
     end;
  if intValor2 > 0 then
     begin
       stValExtenso := stValExtenso + Ext999(intValor2);
       ExtSinPlur(intValor2, 'MILHAO, ', 'MILHOES, ', stValExtenso);
     end;
  if intValor3 > 0 then
     stValExtenso := stValExtenso + Ext999(intValor3) + ' MIL, ';
  if intValor4 > 0 then
     stValExtenso := stValExtenso + Ext999(intValor4);
  if Copy(stValExtenso, Length(stValExtenso) - 1, 2) = ', ' then
     Delete(stValExtenso, Length(stValExtenso) - 1, 2);
  Result := stValExtenso;
end;

procedure TExtensoValor.ExtSinPlur(intValor: integer; stSing, stPlural: string;
  var stValor: string);
begin
  if (Copy(stValor, Length(stValor) - 2, 3) = 'OES') or
       (Copy(stValor, Length(stValor) - 1, 2) = 'AO') then
     stValor := stValor + ' DE';
  if intValor = 1 then
     stValor := stValor + ' ' + stSing
  else
     stValor := stValor + ' ' + stPlural;
end;

function TExtensoValor.MoedaExtenso(dblValor: double; stMoeda,
  stMoedas: string): string;
var stMoedaExtenso, stCentavos : string;
    intCentavos, intMoeda : integer;
begin
  intMoeda := Trunc(dblValor);
  intCentavos := Round(100*(dblValor - intMoeda));
  if intCentavos > 0 then
     begin
       stCentavos := Ext999(intCentavos) + ' CENTAVO';
       if intCentavos <> 1 then stCentavos := stCentavos + 'S';
     end
  else stCentavos := '';
  if intMoeda > 0 then
     begin
       stMoedaExtenso := Extenso(intMoeda);
       ExtSinPlur(intMoeda, stMoeda, stMoedas, stMoedaExtenso);
     end
  else stMoedaExtenso := '';
  if (intCentavos <> 0) and (intMoeda <> 0) then
     stMoedaExtenso := stMoedaExtenso + ' E ' + stCentavos
  else
     stMoedaExtenso := stMoedaExtenso + stCentavos;
  Result := '('+stMoedaExtenso+')';
end;

function TExtensoValor.preparaextenso(Valor: string): double;
var i: integer;
   vv: string[30];
begin
   vv:='';
   for i:=1 to length(valor) do
   begin
      if copy(valor,i,1) = '.' then
         continue;
      vv:=vv + copy(valor,i,1);
   end;
   if vv = '' then
      vv:='0';
   result:=strtofloat(vv);
end;

function TExtensoValor.ValorExtenso(dblValor: double): string;
begin
   Result := MoedaExtenso(dblValor, 'REAL', 'REAIS');
end;

function TExtensoValor.Zeros(vtaman: integer; vcampo: string): string;
var
  vcomp: integer;
  vzeros: string;
begin
  {* Acrescenta zeros na frente de um número *}
  vcomp:=length(vcampo);
  vzeros:=copy('000000000000000000',1, vtaman - vcomp);
  zeros:=vzeros+vcampo;
end;

end.
