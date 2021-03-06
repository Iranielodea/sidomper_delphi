unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, Data.DBXJSON, ULicenca, System.Generics.Collections,
  ULicencaVO, uLicencaItensVO, uConverter;

type
  TServerMethods1 = class(TDSServerModule)
  private
    { Private declarations }
    procedure LogErro(AMensagem: string);
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    function FBLicencasListar(AUtilizada: Boolean = False): TJSONValue;
    function FBLicencasListarItens(AUtilizada: Boolean = False): TJSONValue;
  end;

var
  ServerMethods1: TServerMethods1;

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
//      Lista := obj.ListarTodosItens();

      Lista := obj.FBListarLicenca(AUtilizada);
      Result := TConverte.ObjectToJSON(Lista);
    except
      on E: Exception do
      begin
        LogErro(E.Message);
      end;
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
      Lista := obj.FBListarLicencaItens(AUtilizada); // ImportarItens(); // ListarTodosItens();
      Result := TConverte.ObjectToJSON(Lista);
    except
      on E: Exception do
      begin
        LogErro(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerMethods1.LogErro(AMensagem: string);
var
  Arq: Text;
  sDiretorio: string;
  sArquivo: string;
begin
  sDiretorio := 'D:\WSDomper\DATABASE';
//  sDiretorio := 'D:\TEMP\SIDOMPER';
  sArquivo := '\LogDomperServico.txt';
  if DirectoryExists(sDiretorio) then
  begin
    AssignFile(Arq, sDiretorio + '\LogDomperServico.txt');
    Rewrite(Arq);
    Writeln(Arq, AMensagem);
    CloseFile(Arq);
  end;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

initialization
//  ReportMemoryLeaksOnShutdown := True;

end.

