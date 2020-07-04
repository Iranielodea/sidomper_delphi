unit uContatoController;

interface

uses
  System.SysUtils, uRegras, uEnumerador, uDM, Data.DB,
  Vcl.Forms, uFuncoesSIDomper, Data.DBXJSON, Data.DBXJSONReflect, uContatoVO,
  System.Generics.Collections, uConverter, uDMContato;

type
  TContatoController = class
  public
    function Salvar(AContato: TObjectList<TContatoVO>): Integer;
    procedure Excluir(AId: Integer);
    function LocalizarId(AId: Integer): TContatoVO;
    function LocalizarPorCliente(AIdCliente: Integer): TObjectList<TContatoVO>;
    function LocalizarPorOrcamento(AIdOrcamento: Integer): TObjectList<TContatoVO>;
  end;

implementation

{ TContatoController }

procedure TContatoController.Excluir(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.ContatoExcluir(AId);
  finally
    FreeAndNil(Negocio);
  end;
end;

function TContatoController.LocalizarId(AId: Integer): TContatoVO;
var
  Negocio: TServerModule2Client;
  oObjetoJSON : TJSONValue;
  model: TContatoVO;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    model := TConverte.JSONToObject<TContatoVO>(Negocio.ContatoLocalizarPorId(AId));
    Result := model;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TContatoController.LocalizarPorCliente(
  AIdCliente: Integer): TObjectList<TContatoVO>;
var
  Negocio: TServerModule2Client;
  Lista: TObjectList<TContatoVO>;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Lista := TConverte.JSONToObject<TListaContato>(Negocio.ContatoLocalizarPorCliente(AIdCliente));
    Result := Lista;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TContatoController.LocalizarPorOrcamento(
  AIdOrcamento: Integer): TObjectList<TContatoVO>;
var
  Negocio: TServerModule2Client;
  Lista: TObjectList<TContatoVO>;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Lista := TConverte.JSONToObject<TListaContato>(Negocio.ContatoLocalizarPorOrcamento(AIdOrcamento));
    Result := Lista;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TContatoController.Salvar(AContato: TObjectList<TContatoVO>): Integer;
var
  Negocio: TServerModule2Client;
  objJson: TJSONValue;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    objJson := TConverte.ObjectToJSON<TListaContato>(AContato);
//    TConverte.ObjectToJSON<TListaContato>(Negocio.ContatoSalvar(objJson));
  finally
    FreeAndNil(Negocio);
  end;
end;

end.
