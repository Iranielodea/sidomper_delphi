unit uConverter;

interface

uses
  DBXJSON, DBXJSONReflect, System.SysUtils;

type
  TConverte = class
  public
    class function ObjectToJSON<T: class>(aObject: T): TJSONValue;
    class function JSONToObject<T: class>(aJSON: TJSONValue): T;

    class procedure DestroiObj<T: class>(aObject: T);
  end;


implementation

{ TConverte }

class procedure TConverte.DestroiObj<T>(aObject: T);
begin
  if Assigned(aObject) then
    FreeAndNil(aObject);
end;

class function TConverte.JSONToObject<T>(aJSON: TJSONValue): T;
var
  UnMarshal: TJSONUnMarshal;
begin
  if aJSON is TJSONNull then
    Exit(nil);
  UnMarshal := TJSONUnMarshal.Create;
  Result := T(UnMarshal.Unmarshal(aJSON));
  UnMarshal.Free
end;

class function TConverte.ObjectToJSON<T>(aObject: T): TJSONValue;
var
  Marshal: TJSONMarshal;
begin
  if Assigned(aObject) then
  begin
    Marshal := TJSONMarshal.Create(TJSONConverter.Create);
    Result := Marshal.Marshal(aObject);
    Marshal.Free;
  end
  else
    Exit(TJSONNull.Create);
end;

end.
