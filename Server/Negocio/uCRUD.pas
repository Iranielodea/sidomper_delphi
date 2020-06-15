unit uCRUD;

interface

uses
  System.Generics.Collections, System.SysUtils, uDM;

type
  TCRUD = class
  private
    FTabela: string;
    FChavePrimaria: string;
    FValor: TList<string>;
    FCampo: TList<string>;
    procedure SetCampo(const Value: TList<string>);
    procedure SetValor(const Value: TList<string>);
  public
    function InsertSQL(): Integer;
    procedure UpdateSQL(AValorChave: string);
    procedure DeleteSQL(AValorChave: string);
    Procedure Limpar();
    procedure Dados(ACampo, AValor: string);

    function TipoString(AValor: string): string;
    function TipoBool(AValor: Boolean): string;
    function TipoInt(AValor: Integer): string;
    function TipoIntNull(AValor: Integer): string;
    function TipoData(AValor: TDate): string;

    property Campo: TList<string> read FCampo write SetCampo;
    property Valor: TList<string> read FValor write SetValor;
    constructor create(ATabela, APrimaryKey: string);
    destructor destroy; override;
  end;

implementation

{ TCRUD }

constructor TCRUD.create(ATabela, APrimaryKey: string);
begin
  inherited create;
  FTabela := ATabela;
  FChavePrimaria := APrimaryKey;
  FCampo := TList<string>.Create;
  FValor := TList<string>.create;
end;

procedure TCRUD.Dados(ACampo, AValor: string);
begin
  FCampo.Add(ACampo);
  FValor.Add(AValor);
end;

procedure TCRUD.DeleteSQL(AValorChave: string);
begin
  dm.Conexao.ExecSQL('DELETE FROM ' + FTabela + ' WHERE ' + FChavePrimaria + ' = ' + AValorChave);
end;

destructor TCRUD.destroy;
begin
  FreeAndNil(FCampo);
  FreeAndNil(FValor);
  inherited;
end;

function TCRUD.InsertSQL: Integer;
var
  Sql: string;
  i: Integer;
begin
  Sql := 'INSERT INTO ' + FTabela + '(';
  for I := 0 to FCampo.Count -1 do
    Sql := Sql + FCampo[i] + ',';

  Delete(Sql, Sql.Length , 1);
  Sql := Sql + ') VALUES (';

  for I := 0 to FValor.Count -1 do
    Sql := Sql + FValor[i] + ',';

  Delete(Sql, Sql.Length , 1);
  Sql := Sql + '); SELECT SCOPE_IDENTITY()';

  Result := dm.Conexao.ExecSQLScalar(Sql);
end;

procedure TCRUD.Limpar;
begin
  FCampo.Clear;
  FValor.Clear;
end;

procedure TCRUD.SetCampo(const Value: TList<string>);
begin
  FCampo := Value;
end;

procedure TCRUD.SetValor(const Value: TList<string>);
begin
  FValor := Value;
end;

function TCRUD.TipoBool(AValor: Boolean): string;
begin
  if AValor then
    Result := '1'
  else
    Result := '0';
end;

function TCRUD.TipoData(AValor: TDate): string;
begin
  if AValor > 0 then
    Result := FormatDateTime('yyy-mm-dd', AValor)
  else
    Result := 'NULL';
end;

function TCRUD.TipoInt(AValor: Integer): string;
begin
  Result := IntToStr(AValor);
end;

function TCRUD.TipoIntNull(AValor: Integer): string;
begin
  if AValor > 0 then
    Result := IntToStr(AValor)
  else
    Result := 'NULL';
end;

function TCRUD.TipoString(AValor: string): string;
begin
  Result := '''' + AValor + '''';
end;

procedure TCRUD.UpdateSQL(AValorChave: string);
var
  Sql: string;
  i: Integer;
begin
  Sql := 'UPDATE ' + FTabela + ' SET ';
  for I := 0 to FValor.Count -1 do
  begin
    if FCampo[i] = FChavePrimaria then
      Continue;

    Sql := Sql + FCampo[i] + '=' + FValor[i] + ',';
  end;

  Delete(Sql, Sql.Length , 1);

  Sql := Sql + ' WHERE ' + FChavePrimaria + '=' + AValorChave;

  dm.Conexao.ExecSQL(Sql);
end;

end.
