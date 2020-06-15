unit uGenericProperty;

interface

uses
  System.Generics.Collections, System.Rtti, System.TypInfo, Data.DB, Datasnap.DBClient,
  System.SysUtils, uKeyField;

type
  TGenericProperty = class
  public
    class procedure SetProperty<T: class>(Obj: T; ADataSet: TDataSet);
    class procedure GetPropertyDataSet<T: class>(Obj: T; ADataSet: TDataSet);
  end;

implementation

{ TGenericProperty }

class procedure TGenericProperty.GetPropertyDataSet<T>(Obj: T;
  ADataSet: TDataSet);
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  Atributo: TCustomAttribute;
  I: Integer;
  achou: Boolean;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

  for I := 0 to ADataSet.FieldCount -1 do
  begin
    achou := False;
    for Prop in TypObj.GetProperties do
    begin
      for Atributo in Prop.GetAttributes do
      begin

        if Atributo is ForeingKey then
          Continue;

        if UpperCase(ADataSet.Fields[i].FieldName) =  UpperCase(KeyField(Atributo).Name) then
        begin
          case Prop.GetValue(TObject(Obj)).Kind of
            tkWChar, tkLString, tkWString, tkString,tkChar, tkUString:
              ADataSet.Fields[i].AsString := Prop.GetValue(TObject(Obj)).AsString;

            tkInteger, tkInt64:
            begin
              ADataSet.Fields[i].AsInteger := Prop.GetValue(TObject(Obj)).AsInteger;
            end;
            tkEnumeration:
            begin
              ADataSet.Fields[i].AsBoolean := Prop.GetValue(TObject(Obj)).AsBoolean;
            end;
            tkFloat:
              Prop.SetValue(TObject(Obj), ADataSet.Fields[i].AsFloat);
            else
              raise Exception.Create('Tipo não Suportado!');
          end;
          achou := True;
          Break;
        end;

        if achou then
          Break;
      end;
      if achou then
        Break;
    end;
  end;
end;

class procedure TGenericProperty.SetProperty<T>(Obj: T; ADataSet: TDataSet);
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  Atributo: TCustomAttribute;
  I: Integer;
  achou: Boolean;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

  for I := 0 to ADataSet.FieldCount -1 do
  begin
    achou := False;
    for Prop in TypObj.GetProperties do
    begin
      for Atributo in Prop.GetAttributes do
      begin

        if Atributo is ForeingKey then
          Continue;

        if UpperCase(ADataSet.Fields[i].FieldName) =  UpperCase(KeyField(Atributo).Name) then
        begin
          case Prop.GetValue(TObject(Obj)).Kind of
            tkWChar, tkLString, tkWString, tkString,tkChar, tkUString:
              Prop.SetValue(TObject(Obj), ADataSet.Fields[i].AsString);

            tkInteger, tkInt64:
            begin
              Prop.SetValue(TObject(Obj), ADataSet.Fields[i].AsInteger);
            end;
            tkEnumeration:
            begin
              Prop.SetValue(TObject(Obj), ADataSet.Fields[i].AsBoolean);
            end;
            tkFloat:
              Prop.SetValue(TObject(Obj), ADataSet.Fields[i].AsFloat);
            else
              raise Exception.Create('Tipo não Suportado!');
          end;
          achou := True;
          Break;
        end;

        if achou then
          Break;
      end;
      if achou then
        Break;
    end;
  end;
end;

end.
