unit uOrcamentoNAprovadoController;

interface

uses
  System.SysUtils, uOrcamentoNaoAprovadoVO, Data.DBXJSON , Data.DBXJSONReflect,
  uRegras, uDM, uConverter;

type
  TOrcamentoNAprovadoController = class
  public
    function LocalizarId(AId: Integer): TOrcamentoNaoAprovadoVO;
    function LocalizarOrcamento(AIdOrcamento: Integer): TOrcamentoNaoAprovadoVO;
    procedure Excluir(AId: Integer);
    procedure Salvar(AOrcamentoNaoAprovado: TOrcamentoNaoAprovadoVO);
  end;

implementation

{ TOrcamentoNAprovadoController }

procedure TOrcamentoNAprovadoController.Excluir(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.OrcamentoNaoAprovadoExcluir(AId);
  finally
    FreeAndNil(Negocio);
  end;
end;

function TOrcamentoNAprovadoController.LocalizarId(
  AId: Integer): TOrcamentoNaoAprovadoVO;
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := TConverte.JSONToObject<TOrcamentoNaoAprovadoVO>(Negocio.OrcamentoNaoAprovadoLocalizarId(AId));
  finally
    FreeAndNil(Negocio);
  end;
end;

function TOrcamentoNAprovadoController.LocalizarOrcamento(
  AIdOrcamento: Integer): TOrcamentoNaoAprovadoVO;
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := TConverte.JSONToObject<TOrcamentoNaoAprovadoVO>(Negocio.OrcamentoNaoAprovadoLocalizarOrcamento(AIdOrcamento));
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoNAprovadoController.Salvar(
  AOrcamentoNaoAprovado: TOrcamentoNaoAprovadoVO);
var
  Negocio: TServerModule2Client;
  objJson: TJSONValue;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    objJson := TConverte.ObjectToJSON<TOrcamentoNaoAprovadoVO>(AOrcamentoNaoAprovado);
    Negocio.OrcamentoNaoAprovadoSalvar(objJson);
  finally
    FreeAndNil(Negocio);
  end;
end;

end.
