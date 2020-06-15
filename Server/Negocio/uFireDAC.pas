unit uFireDAC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.DBXFirebird, Data.FMTBcd, Data.SqlExpr, uDM,
  Datasnap.DBClient, Datasnap.Provider, System.Generics.Collections;

type
  TFireDAC = class
  private
    FModel: TFDQuery;
    FLista: TList<string>;
    function Conexao: TFDConnection;
    procedure SetLista(const Value: TList<string>);
    function GetIncrementar: string;
  public
    procedure OpenSQL(InstrucaoSQL: string = '');
    procedure ExecutarSQL(InstrucaoSQL: string='');
    function ExecutarScala(InstrucaoSQL: string=''): Integer;
    procedure StartTransacao;
    procedure Commit;
    Procedure Roolback;

    property Lista: TList<string> read FLista write SetLista;
    property Model: TFDQuery read FModel write FModel;
    property Incrementar: string read GetIncrementar;

    constructor create;
    destructor destroy; override;
  end;

implementation

{ TFireDAC }

procedure TFireDAC.Commit;
begin
  if dm.Conexao.InTransaction then
    dm.Conexao.Commit;
end;

function TFireDAC.Conexao: TFDConnection;
begin
  Result := dm.Conexao;
end;

constructor TFireDAC.create;
begin
  FModel := TFDQuery.Create(nil);
  FModel.Connection := Conexao;

  FLista := TList<string>.Create;
end;

destructor TFireDAC.destroy;
begin
  if FModel.Active then
    FModel.Close;

  FreeAndNil(FModel);
  FreeAndNil(FLista);
  inherited;
end;

function TFireDAC.ExecutarScala(InstrucaoSQL: string): Integer;
var
  sInstrucao: string;
  i: Integer;
begin
  if InstrucaoSQL = '' then
  begin
    sInstrucao := '';
    for I := 0 to FLista.Count -1 do
      sInstrucao := sInstrucao + FLista.Items[i];
  end
  else
    sInstrucao := InstrucaoSQL;

  Result := dm.Conexao.ExecSQLScalar(sInstrucao);
end;

procedure TFireDAC.ExecutarSQL(InstrucaoSQL: string);
var
  sInstrucao: string;
  i: Integer;
begin
  if InstrucaoSQL = '' then
  begin
    sInstrucao := '';
    for I := 0 to FLista.Count -1 do
      sInstrucao := sInstrucao + FLista.Items[i];
  end
  else
    sInstrucao := InstrucaoSQL;

  dm.Conexao.ExecSQL(sInstrucao);
end;

function TFireDAC.GetIncrementar: string;
begin
  Result := ' SELECT SCOPE_IDENTITY();';
end;

procedure TFireDAC.Roolback;
begin
  if dm.Conexao.InTransaction then
    dm.Conexao.Rollback;
end;

procedure TFireDAC.OpenSQL(InstrucaoSQL: string);
var
  sInstrucao: string;
  i: Integer;
begin
  if InstrucaoSQL = '' then
  begin
    sInstrucao := '';
    for I := 0 to FLista.Count -1 do
      sInstrucao := sInstrucao + FLista.Items[i];
  end
  else
    sInstrucao := InstrucaoSQL;


  FModel.SQL.Text := sInstrucao;
  FModel.Open();
end;

procedure TFireDAC.SetLista(const Value: TList<string>);
begin
  FLista := Value;
end;

procedure TFireDAC.StartTransacao;
begin
  if not dm.Conexao.InTransaction then
    dm.Conexao.StartTransaction;
end;

end.
