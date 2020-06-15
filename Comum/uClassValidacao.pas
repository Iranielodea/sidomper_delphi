unit uClassValidacao;

interface

  uses SysUtils;

type
  TValidacao = class
  private

  public
    class procedure ValidaCPF(Cpf: String);
    class procedure ValidaCNPJ(CGC: String);
  end;

implementation

{ TValidacao }

class procedure TValidacao.ValidaCNPJ(CGC: String);
var vSoma: integer;
    vd,vd1,vd2,vd3,vd5,vd6,vd7,vd8: real;
    vd4: string[10];
    vlCnpj: String;
Begin
  if trim(CGC) = '' then
    exit;

//***************************
// primeiro digito
//***************************
     vSoma:=strtoint(copy(cgc,1,1))*5  + strtoint(copy(cgc,2,1))*4 +
            strtoint(copy(cgc,3,1))*3  + strtoint(copy(cgc,4,1))*2 +
            strtoint(copy(cgc,5,1))*9  + strtoint(copy(cgc,6,1))*8 +
            strtoint(copy(cgc,7,1))*7  + strtoint(copy(cgc,8,1))*6 +
            strtoint(copy(cgc,9,1))*5  + strtoint(copy(cgc,10,1))*4+
            strtoint(copy(cgc,11,1))*3 + strtoint(copy(cgc,12,1))*2;
     vd:=vsoma div 11;
     vd1:=vd*11;
     vd2:=vsoma - vd1;
     vd3:=11 - vd2;
     if (vd3 = 10) or (vd3 = 11) then
       vd3:=0;
     vd4:=floattostr(vd3);
//***************************
//segundo digito
//***************************
     vSoma:=strtoint(copy(cgc,1,1))*6  + strtoint(copy(cgc,2,1))*5  +
            strtoint(copy(cgc,3,1))*4  + strtoint(copy(cgc,4,1))*3  +
            strtoint(copy(cgc,5,1))*2  + strtoint(copy(cgc,6,1))*9  +
            strtoint(copy(cgc,7,1))*8  + strtoint(copy(cgc,8,1))*7  +
            strtoint(copy(cgc,9,1))*6  + strtoint(copy(cgc,10,1))*5 +
            strtoint(copy(cgc,11,1))*4 + strtoint(copy(cgc,12,1))*3 +
            strtoint(vd4)*2;
     vd5:=vsoma div 11;
     vd6:=vd5*11;
     vd7:=vsoma - vd6;
     vd8:=11 - vd7;
     if (vd8 = 10) or (vd8 = 11) then
        vd8:=0;
     vlCnpj:=concat(copy(cgc,1,12),vd4,floattostr(vd8));
     if CGC <> vlCnpj then
     begin
       raise Exception.Create('CNPJ inválido, ajuste ou deixe em branco !');
     end;
end;

class procedure TValidacao.ValidaCPF(Cpf: String);
var vSoma: integer;
    vd,vd1,vd2,vd3,vd5,vd6,vd7,vd8: real;
    vd4: string;
    vlCpf: String;
begin
    if trim(Cpf) = '' then
      exit;

     if length(Cpf) <> 11 then
     begin
        raise Exception.Create('CPF deve ter 11 digítos !');
     end;

     if (Cpf = '00000000000') or
        (Cpf = '22222222222') or
        (Cpf = '33333333333') or
        (Cpf = '44444444444') or
        (Cpf = '55555555555') or
        (Cpf = '66666666666') or
        (Cpf = '77777777777') or
        (Cpf = '88888888888') or
        (Cpf = '99999999999') or
        (Cpf = '11111111111') then
        raise Exception.Create('CPF inválido!');

//primeiro digito************
     vSoma:=strtoint(copy(cpf,1,1))*10 + strtoint(copy(cpf,2,1))*9 +
            strtoint(copy(cpf,3,1))*8  + strtoint(copy(cpf,4,1))*7 +
            strtoint(copy(cpf,5,1))*6  + strtoint(copy(cpf,6,1))*5 +
            strtoint(copy(cpf,7,1))*4  + strtoint(copy(cpf,8,1))*3 +
            strtoint(copy(cpf,9,1))*2;
     vd:=vsoma div 11;
     vd1:=vd*11;
     vd2:=vsoma - vd1;
     vd3:=11 - vd2;
     if (vd3 = 10) or (vd3 = 11) then
       vd3:=0;
     vd4:=floattostr(vd3);
//segundo digito*************
     vSoma:=strtoint(copy(cpf,1,1))*11 + strtoint(copy(cpf,2,1))*10 +
            strtoint(copy(cpf,3,1))*9  + strtoint(copy(cpf,4,1))*8  +
            strtoint(copy(cpf,7,1))*5  + strtoint(copy(cpf,8,1))*4  +
            strtoint(copy(cpf,5,1))*7  + strtoint(copy(cpf,6,1))*6  +
            strtoint(copy(cpf,9,1))*3  + strtoint(vd4)*2;
     vd5:=vsoma div 11;
     vd6:=vd5*11;
     vd7:=vsoma - vd6;
     vd8:=11 - vd7;
     if (vd8 = 10) or (vd8 = 11) then
        vd8:=0;
     vlCpf:=concat(copy(cpf,1,9),vd4,floattostr(vd8));
     if vlCpf <> cpf then
     begin
       raise Exception.Create('CPF inválido, ajuste ou deixe em branco !');
     end;
end;

end.
