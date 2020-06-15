unit uArquivos;

interface

uses
  System.Generics.Collections, System.SysUtils, Data.DBXJSON;

type
  TArquivos = class
  public
    function ListarArquivosDiretorio(Diretorio, Extensao: string): TJSONArray;
  end;

implementation

{ TArquivos }

function TArquivos.ListarArquivosDiretorio(Diretorio,
  Extensao: string): TJSONArray;
var
  F: TSearchRec;
  Ret: Integer;
//  lista: TList<string>;
  Lista: TJSONArray;
begin
  if not (DirectoryExists(Diretorio)) then
    raise Exception.Create('Diretório dos Arquivos Logs não Encontrado.');

//  lista := TList<string>.Create;
  Lista := TJSONArray.Create;
  Ret := FindFirst(Diretorio + '\*.' + Extensao, faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if (F.Name <> '.') and (F.Name <> '..') then
        Lista.Add(Diretorio + '\' + F.Name);

      Ret := FindNext(F);
    end;

    Result := lista;
  finally
    FindClose(F);
  end;
end;

end.
