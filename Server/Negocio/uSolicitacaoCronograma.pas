unit uSolicitacaoCronograma;

interface

uses System.SysUtils, FireDAC.Stan.Param, Data.DB, FireDAC.Comp.Client, Vcl.Dialogs;

type
  TSolicitacaoCronograma = class
  public
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    function LocalizarIdSolicitacao(var Qry: TFDQuery; IdSolicitacao: integer): Boolean;
  end;

implementation

{ TSolicitacaoCronograma }

function TSolicitacaoCronograma.LocalizarId(var Qry: TFDQuery;
  Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

function TSolicitacaoCronograma.LocalizarIdSolicitacao(var Qry: TFDQuery;
  IdSolicitacao: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := IdSolicitacao;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

end.
