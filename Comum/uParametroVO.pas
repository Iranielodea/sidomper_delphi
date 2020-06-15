unit uParametroVO;

interface

uses
  System.SysUtils, uKeyField, uTableName, System.Generics.Collections;

type
  [TableName('Parametros')]
  TParametroVO = class
  private
    FObs: string;
    FValor: string;
    FCodigo: Integer;
    FId: Integer;
    FPrograma: Integer;
    FNome: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetObs(const Value: string);
    procedure SetPrograma(const Value: Integer);
    procedure SetValor(const Value: string);

  public
    [KeyField('Par_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('Par_Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldNull('Par_Programa')]
    property Programa: Integer read FPrograma write SetPrograma;
    [FieldName('Par_Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('Par_Valor')]
    property Valor: string read FValor write SetValor;
    [FieldName('Par_Obs')]
    property Obs: string read FObs write SetObs;

    constructor Create(); overload;
  end;

  TListaParametros = TObjectList<TParametroVO>;

implementation

{ TParametroVO }

constructor TParametroVO.Create;
begin
  inherited Create;
end;

procedure TParametroVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TParametroVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TParametroVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TParametroVO.SetObs(const Value: string);
begin
  FObs := Value;
end;

procedure TParametroVO.SetPrograma(const Value: Integer);
begin
  FPrograma := Value;
end;

procedure TParametroVO.SetValor(const Value: string);
begin
  FValor := Value;
end;

end.
