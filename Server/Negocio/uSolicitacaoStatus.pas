unit uSolicitacaoStatus;

interface

uses System.SysUtils, FireDAC.Stan.Param, Data.DB, FireDAC.Comp.Client, Vcl.Dialogs;

type
  TSolicitacaoStatusNegocio = class
  public
    function LocalizarIdSolicitacao(var Qry: TFDQuery; IdSolicitacao: integer): Boolean;
  end;

implementation

{ TSolicitacaoStatus }

function TSolicitacaoStatusNegocio.LocalizarIdSolicitacao(var Qry: TFDQuery;
  IdSolicitacao: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := IdSolicitacao;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

end.
