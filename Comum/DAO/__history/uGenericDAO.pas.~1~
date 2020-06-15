unit uGenericDAO;

interface

uses
  System.Rtti, uTableName, uKeyField, System.SysUtils, System.TypInfo,
  Vcl.Dialogs, FireDAC.Comp.Client, uDM, Data.DB;

type
  TGenericDAO = class
  private
    class function GetTableName<T: class>(Obj: T): String;
    class function Insert<T: class>(Obj: T): Integer;
    class procedure Update<T: class>(Obj: T);
    class function ValorString(AValor: Double): string;
  public
    class function Save<T: class>(Obj: T): Integer;
    class function SelectFrom<T: class>(Obj: T; Id: Integer): string;
    class function Select<T: class>(Obj: T; AMaisCampos: Boolean=True): string;
  end;

implementation

{ TGenericDAO }

class function TGenericDAO.GetTableName<T>(Obj: T): String;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Atributo:
  TCustomAttribute;
  strTable: String;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  for Atributo in TypObj.GetAttributes do
  begin
    if Atributo is TableName then
      Exit(TableName(Atributo).Name);
  end;
end;

class function TGenericDAO.Insert<T>(Obj: T): Integer;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strInsert,
  strFields,
  strValues: String;
  Atributo: TCustomAttribute;
  IsKey: Boolean;
  sValor: string;
begin
  strInsert := '';
  strFields := '';
  strValues := '';
  strInsert := 'INSERT INTO ' + GetTableName(Obj);
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

  for Prop in TypObj.GetProperties do
  begin
    IsKey := False;
    for Atributo in Prop.GetAttributes do
    begin
      if Atributo is KeyField then
        IsKey := True;

      if Atributo is ForeingKey then
        Continue;

      if not IsKey then
      begin
//        strFields := strFields + Prop.Name + ',';
        strFields := strFields + FieldName(Atributo).Name + ',';

        case Prop.GetValue(TObject(Obj)).Kind of
          tkWChar, tkLString, tkWString, tkString, tkChar, tkUString:
            strValues := strValues + QuotedStr(Prop.GetValue(TObject(Obj)).AsString) + ',';

          tkInteger, tkInt64:
          begin
            if Prop.GetValue(TObject(Obj)).AsInteger < 0 then
            begin
              strValues := strValues + 'null,';
              Continue;
            end;
//            else
//              strValues := strValues + IntToStr(Prop.GetValue(TObject(Obj)).AsInteger) + ',';

            if Atributo is FieldNull then
            begin
              if Prop.GetValue(TObject(Obj)).AsInteger = 0 then
                strValues := strValues + 'null,'
              else
                strValues := strValues + IntToStr(Prop.GetValue(TObject(Obj)).AsInteger) + ',';
            end
            else
              strValues := strValues + IntToStr(Prop.GetValue(TObject(Obj)).AsInteger) + ',';
          end;

          tkFloat:
          begin
            if Atributo is FieldDate then
            begin
              if Prop.GetValue(TObject(Obj)).AsExtended = 0 then
                strValues := strValues + 'null,'
              else
                strValues := strValues + QuotedStr(FormatDateTime('yyyyMMdd', Prop.GetValue(TObject(Obj)).AsExtended)) + ',';
            end
            else if Atributo is FieldTime then
            begin
              if Prop.GetValue(TObject(Obj)).AsExtended = 0 then
                strValues := strValues + 'null,'
              else
                strValues := strValues + QuotedStr(FormatDateTime('hh:mm:ss', Prop.GetValue(TObject(Obj)).AsExtended)) + ',';
            end
            else begin
              sValor := ValorString(Prop.GetValue(TObject(Obj)).AsExtended);
//              strValues := strValues + FloatToStr(Prop.GetValue(TObject(Obj)).AsExtended) + ',';
              strValues := strValues + sValor + ',';
            end;
          end;

          tkEnumeration:
          begin
            if Prop.GetValue(TObject(Obj)).AsBoolean then
              strValues := strValues + '1,'
            else
              strValues := strValues + '0,';
          end;

          else
            raise Exception.Create('Tipo não Suportado');
        end;
      end;
    end;
  end;


  strFields := Copy(strFields, 1, Length(strFields) - 1);
  strValues := Copy(strValues, 1, Length(strValues) - 1);
  strInsert := strInsert + '(' + strFields + ') VALUES (' + strValues + '); SELECT SCOPE_IDENTITY()';

  Result := dm.Conexao.ExecSQLScalar(strInsert);
end;

class function TGenericDAO.SelectFrom<T>(Obj: T; Id: Integer): string;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strTabela,
  strFields: string;
  Atributo: TCustomAttribute;
  strKeyField: string;
begin
  strFields := '';
  strTabela := GetTableName(Obj);

  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

  for Prop in TypObj.GetProperties do
  begin
    for Atributo in Prop.GetAttributes do
    begin
      if Atributo is KeyField then
        strKeyField := KeyField(Atributo).Name;

      if Atributo is ForeingKey then
        Continue;

      strFields := strFields + FieldName(Atributo).Name + ',';
    end;
  end;

  strFields := Copy(strFields, 1, Length(strFields) - 1);

  Result := 'SELECT ' + strFields + ' FROM ' + strTabela + ' WHERE ' + strKeyField + ' = ' + IntToStr(Id);
end;

class function TGenericDAO.Save<T>(Obj: T): Integer;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  Atributo: TCustomAttribute;
  isKey: Boolean;
  Id: Integer;
begin
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  for Prop in TypObj.GetProperties do
  begin
    Result := 0;
    isKey := False;
    for Atributo in Prop.GetAttributes do
    begin
      if Atributo is KeyField then
      begin
        id := Prop.GetValue(TObject(Obj)).AsInteger;
        if Id <= 0 then
          Result := Insert<T>(Obj)
        else begin
          Update<T>(Obj);
          Result := Id;
        end;

        isKey := True;
        Break;
      end;
    end;

    if isKey then
      Break;

  end;
end;

class function TGenericDAO.Select<T>(Obj: T; AMaisCampos: Boolean): string;
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strTabela,
  strFields: string;
  Atributo: TCustomAttribute;
begin
  strFields := '';
  strTabela := GetTableName(Obj);

  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);

  for Prop in TypObj.GetProperties do
  begin
    for Atributo in Prop.GetAttributes do
    begin
      if Atributo is ForeingKey then
        Continue;

      strFields := strFields + FieldName(Atributo).Name + ',';
    end;
  end;

  if AMaisCampos = False then
    strFields := Copy(strFields, 1, Length(strFields)- 1);


  Result := 'SELECT ' + strFields;
end;

class procedure TGenericDAO.Update<T>(Obj: T);
var
  Contexto: TRttiContext;
  TypObj: TRttiType;
  Prop: TRttiProperty;
  strUpdate,
  strSet,
  strKeyField,
  strKeyValue: String;
  Atributo: TCustomAttribute;
  isKey: Boolean;
  sValor: string;
begin
  strUpdate := '';
  strSet := '';
  strKeyField := '';
  strKeyValue := '';
  strUpdate := 'UPDATE ' + GetTableName(Obj);
  Contexto := TRttiContext.Create;
  TypObj := Contexto.GetType(TObject(Obj).ClassInfo);
  for Prop in TypObj.GetProperties do
  begin
    isKey := False;
    for Atributo in Prop.GetAttributes do
    begin
      if Atributo is KeyField then
      begin
        strKeyField := KeyField(Atributo).Name;
        strKeyValue := IntToStr(Prop.GetValue(TObject(Obj)).AsInteger);
        isKey := True;
      end;

      if isKey then
        Continue;

      if Atributo is ForeingKey then
        Continue;

//      strSet := strSet + Prop.Name + ' = ';
      strSet := strSet + FieldName(Atributo).Name + ' = ';

      case Prop.GetValue(TObject(Obj)).Kind of
        tkWChar, tkLString, tkWString, tkString,tkChar, tkUString:
          strSet := strSet + QuotedStr(Prop.GetValue(TObject(Obj)).AsString) + ',';

        tkInteger, tkInt64:
        begin
          if Prop.GetValue(TObject(Obj)).AsInteger < 0 then
          begin
            strSet := strSet + 'null' + ',';
            Continue;
          end;
//          else
//            strSet := strSet + IntToStr(Prop.GetValue(TObject(Obj)).AsInteger) + ',';

          if Atributo is FieldNull then
          begin
            if Prop.GetValue(TObject(Obj)).AsInteger = 0 then
              strSet := strSet + 'null' + ','
            else
              strSet := strSet + IntToStr(Prop.GetValue(TObject(Obj)).AsInteger) + ',';
          end
          else
            strSet := strSet + IntToStr(Prop.GetValue(TObject(Obj)).AsInteger) + ',';
        end;
        tkEnumeration:
        begin
          if Prop.GetValue(TObject(Obj)).AsBoolean then
            strSet := strSet + '1,'
          else
            strSet := strSet + '0,';
        end;
        tkFloat:
            if Atributo is FieldDate then
            begin
              if Prop.GetValue(TObject(Obj)).AsExtended = 0 then
                strSet := strSet + 'null,'
              else
                strSet := strSet + QuotedStr(FormatDateTime('yyyyMMdd', Prop.GetValue(TObject(Obj)).AsExtended)) + ',';
            end
            else if Atributo is FieldTime then
            begin
              if Prop.GetValue(TObject(Obj)).AsExtended = 0 then
                strSet := strSet + 'null,'
              else
                strSet := strSet + QuotedStr(FormatDateTime('hh:mm:ss', Prop.GetValue(TObject(Obj)).AsExtended)) +  ',';
            end
            else begin
              sValor := ValorString(Prop.GetValue(TObject(Obj)).AsExtended);
//              sValor := FloatToStr(Prop.GetValue(TObject(Obj)).AsExtended);
//              sValor := StringReplace(sValor, ',','.', [rfReplaceAll]);
              strSet := strSet + sValor + ',';
            end
        else
          raise Exception.Create('Tipo não Suportado!');
      end;
    end;
  end;
  strSet := Copy(strSet, 1, Length(strSet) - 1);
  strUpdate := strUpdate + ' SET ' + strSet + ' WHERE ' + strKeyField + ' = ' + strKeyValue;

  dm.Conexao.ExecSQL(strUpdate);
end;

class function TGenericDAO.ValorString(AValor: Double): string;
var
  sValor: string;
begin
  sValor := FloatToStr(AValor);
  sValor := StringReplace(sValor, ',','.', [rfReplaceAll]);
  Result := sValor;
end;

end.
