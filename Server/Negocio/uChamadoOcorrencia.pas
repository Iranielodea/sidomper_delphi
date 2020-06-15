unit uChamadoOcorrencia;

interface

uses System.SysUtils, FireDAC.Stan.Param, Data.DB, FireDAC.Comp.Client, Vcl.Dialogs;

type
  TChamadoOcorrencia = class
  public
    function LocalizarIdChamado(var Qry: TFDQuery; IdChamado: integer): Boolean;
  end;

implementation

{ TChamadoOcorrencia }

function TChamadoOcorrencia.LocalizarIdChamado(var Qry: TFDQuery;
  IdChamado: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := IdChamado;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

end.
