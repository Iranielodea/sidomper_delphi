unit uSolicitacaoOcorrencia;

interface

uses System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, Vcl.Dialogs;

type
  TSolicitacaoOcorrencia = class
  public
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    function LocalizarIdSolicitacao(var Qry: TFDQuery; IdSolicitacao: integer): Boolean;
  end;

implementation

{ TSolicitacaoOcorrencia }

function TSolicitacaoOcorrencia.LocalizarId(var Qry: TFDQuery;
  Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

function TSolicitacaoOcorrencia.LocalizarIdSolicitacao(var Qry: TFDQuery;
  IdSolicitacao: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := IdSolicitacao;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

end.
