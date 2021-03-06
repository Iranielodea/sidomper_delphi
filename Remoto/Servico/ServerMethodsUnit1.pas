unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, Data.DBXJSON,
  ULicenca, ULicencaVO, uLicencaItensVO, uGenericDAO, System.Generics.Collections,
  uConverter, uDM, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, MidasLib;

type
  TServerMethods1 = class(TDSServerModule)
    QItens: TFDQuery;
    dspItens: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function FBLicencasListar(AUtilizada: Boolean = False): TJSONValue;
    function FBLicencasListarItens(AUtilizada: Boolean = False): TJSONValue;

    procedure ListarLicencasItens;
  end;

implementation

{$R *.dfm}

uses System.StrUtils;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.FBLicencasListar(AUtilizada: Boolean = False): TJSONValue;
var
  obj: TLicenca;
  Lista: TObjectList<TLicencaVO>;
begin
  obj := TLicenca.create;

  try
    try
      DM.AbrirConexao();
      Lista := obj.FBListarLicenca(AUtilizada);
      Result := TConverte.ObjectToJSON(Lista);
      DM.FecharConexao();
    except
      Result := nil;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

function TServerMethods1.FBLicencasListarItens(AUtilizada: Boolean = False): TJSONValue;
var
  obj: TLicenca;
  Lista: TObjectList<TLicencaItensVO>;
begin
  obj := TLicenca.create;
  try
    try
      dm.AbrirConexao();
      Lista := obj.FBListarLicencaItens(AUtilizada);
      Result := TConverte.ObjectToJSON(Lista);
      dm.FecharConexao();
    except
      Result := nil;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerMethods1.ListarLicencasItens;
begin
  QItens.Close;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

end.

