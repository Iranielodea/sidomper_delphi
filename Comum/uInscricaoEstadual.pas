unit uInscricaoEstadual;

interface

uses
  System.SysUtils, Winapi.Windows;

type
  TConsisteInscricaoEstadual  = function (const Insc, UF: AnsiString): Integer; stdcall;

type
  TValidaIE = class
  public
    class function InscEstadual(Inscricao,Estado: string): Boolean;
  end;

implementation

{ TValidaIE }

class function TValidaIE.InscEstadual(Inscricao, Estado: string): Boolean;
var
  IRet: Integer;
  IOk, IErro, IPar    : Integer;
  LibHandle                 : THandle;
  ConsisteInscricaoEstadual : TConsisteInscricaoEstadual;
  vinsc: string;
  //CInsc:TInscEstadual;
begin
   vinsc:='';
   for iret:=1 to length(Inscricao) do
   begin
      if copy(inscricao,Iret,1) = '/' then
         continue;
      vinsc:=vinsc+copy(inscricao,Iret,1);
   end;
//------------------------------------------------------------------------------
// inscricao Estadual pernambuco
   if trim(Estado) = 'PE' then
   begin
      {
      if length(trim(Inscricao)) = 9 then
       begin
         CInsc:=TInscEstadual.Create;
         if CInsc.Insc_Estadual_PE(Inscricao) = false then
         begin
            MessageDlg ('Inscrição inválida para '+Estado+', Deixe em branco para sair',mtError,[mbOk],0);
            FreeAndNil(CInsc);
            exit;
         end;
         FreeAndNil(CInsc);
         exit;
       end;
       }
   end;
//------------------------------------------------------------------------------

  try
    LibHandle :=  LoadLibrary (PWideChar (Trim ('DllInscE32.Dll')));
    if  LibHandle <=  HINSTANCE_ERROR then
      raise Exception.Create ('Dll não carregada');

    @ConsisteInscricaoEstadual  :=  GetProcAddress (LibHandle,
                                                    'ConsisteInscricaoEstadual');
    if  @ConsisteInscricaoEstadual  = nil then
      raise Exception.Create('Entrypoint Download não encontrado na Dll');

    IRet := ConsisteInscricaoEstadual (pAnsiChar(Ansistring(vinsc)),pAnsiChar(Ansistring(Estado)));
    if Iret = 0 then
      Result := True
//       MessageDlg ('Inscrição válida para '+Estado,mtInformation,[mbOk],0)
    else if Iret = 1 then
      Result := False
//       MessageDlg ('Inscrição inválida para '+Estado+', Deixe em branco para sair',mtError,[mbOk],0)
    else
      raise Exception.Create('Parâmetros inválidos');

  finally
    FreeLibrary (LibHandle);
  end;
end;

end.
