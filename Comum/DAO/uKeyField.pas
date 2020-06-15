unit uKeyField;

interface

type
  KeyField = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;
    constructor Create(aName: String);
  end;

type
  FieldName = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;
    constructor Create(aName: String);
  end;

type
  ForeingKey = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;
    constructor Create(aName: String);
  end;

type
  FieldNull = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;
    constructor Create(aName: String);
  end;

type
  FieldDate = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;
    constructor Create(aName: String);
  end;

type
  FieldTime = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;
    constructor Create(aName: String);
  end;


implementation

{ KeyField }

constructor KeyField.Create(aName: String);
begin
  FName := aName;
end;

{ Field }

constructor FieldName.Create(aName: String);
begin
  FName := aName;
end;

{ ForeingKey }

constructor ForeingKey.Create(aName: String);
begin
  FName := aName;
end;

{ FieldNull }

constructor FieldNull.Create(aName: String);
begin
  FName := aName;
end;

{ FieldDate }

constructor FieldDate.Create(aName: String);
begin
  FName := aName;
end;

{ FieldTime }

constructor FieldTime.Create(aName: String);
begin
  FName := aName;
end;

end.
