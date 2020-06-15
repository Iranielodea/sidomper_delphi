unit uTableName;

interface

type
  TableName = class(TCustomAttribute)
  private
    FName: String;
  public
    property Name: String read FName write FName;
    constructor Create(aName: String);
  end;

implementation

{ TableName }

constructor TableName.Create(aName: String);
begin
  FName := aName;
end;

end.
