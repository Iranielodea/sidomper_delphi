unit uVersaoSistema;

interface

uses System.SysUtils, Vcl.Forms, uDM, FireDAC.Stan.Param, Data.DB,
  FireDAC.Comp.Client, uFormVersao;

type
  TVersaoSistema = class
  private
    procedure ExecutarSQL(LinhaComando: string);
    function RetornaVersao: Integer;
    function SoNumeros(Valor: string): string;
    function RetornaVersaoAquivo(LinhaComando: string): Integer;
    procedure AtualizaVersao(versao: Integer);
  public
    procedure LerVersao;
  end;

implementation

{ TVersaoSistema }

procedure TVersaoSistema.AtualizaVersao(versao: Integer);
var
  sql: TFDQuery;
  sVersao: string;
  numero1: string;
  numero2: string;
  numero3: string;
begin
  versao := versao + 1;
  sVersao := IntToStr(versao);

  numero1 := Copy(sVersao, 1,1);
  numero2 := Copy(sVersao, 2,3);
  numero3 := Copy(sVersao, 5,2);

  sVersao := numero1 + '.' + numero2 + '.' + numero3;

  sql := TFDQuery.Create(nil);
  try
    sql.Connection := dm.Conexao;
    sql.SQL.Text := 'UPDATE Parametros SET Par_Valor = :Valor WHERE Par_Codigo = :Codigo';

    sql.Params[0].AsString := sVersao;
    sql.Params[1].AsInteger := 11;
    sql.ExecSQL();
  finally
    FreeAndNil(sql);
  end;
end;

procedure TVersaoSistema.ExecutarSQL(LinhaComando: string);
var
  sql: TFDQuery;
begin
  sql := TFDQuery.Create(nil);
  try
    sql.Connection := dm.Conexao;
    sql.SQL.Text := LinhaComando;
    sql.ExecSQL();
  finally
    FreeAndNil(sql);
  end;
end;

procedure TVersaoSistema.LerVersao;
var
  Arquivo: string;
  Arq: TextFile;
  Registro: string;
  VersaoAtual: Integer;
  VersaoArquivo: Integer;
  flag: Boolean;
  InstrucaoSQL: TStringBuilder;
begin
  Arquivo := ExtractFilePath(Application.ExeName) + '\DomperVersao.sql';
  AssignFile(Arq, Arquivo);
  Reset(Arq);

  flag := True;
  VersaoAtual := RetornaVersao();

  InstrucaoSQL := TStringBuilder.Create;

  try
    if VersaoAtual = 100000 then
      Exit;

    while not Eof(Arq) do
    begin
      Readln(Arq, Registro);

      if Trim(Registro) = '' then
        Continue;

      if flag then
        VersaoArquivo := RetornaVersaoAquivo(Registro);

      if VersaoArquivo <= VersaoAtual then
        Continue;

      if flag then
        flag := False;

      if Trim(Registro.ToUpper) <> 'GO' then
      begin
        InstrucaoSQL.AppendLine(Registro);
        frmVersao.mmScript.Lines.Add(Registro);
      end;

      if Trim(Registro.ToUpper) = 'GO' then
      begin
        ExecutarSQL(InstrucaoSQL.ToString);
        InstrucaoSQL.Clear;
        frmVersao.mmScript.Clear;
      end;
    end;

    if flag = False then
    begin
      AtualizaVersao(VersaoAtual);
    end;
  finally
    CloseFile(Arq);
    FreeAndNil(InstrucaoSQL);
  end;
end;

function TVersaoSistema.RetornaVersao: Integer;
var
  sql: TFDQuery;
  iValor: Integer;
begin
  sql := TFDQuery.Create(nil);
  try
    sql.Connection := dm.Conexao;
    sql.SQL.Text := 'SELECT Par_Valor FROM Parametros WHERE Par_Codigo = 11';
    sql.Open();

    iValor := StrToIntDef(SoNumeros(sql.Fields[0].AsString),0);

    if iValor = 0 then
      Result := 100000
    else
      Result := iValor;

  finally
    FreeAndNil(sql);
  end;
end;

function TVersaoSistema.RetornaVersaoAquivo(LinhaComando: string): Integer;
var
  sLinha: string;
  sVersao: string;
begin
  sLinha := Copy(LinhaComando, 1, 8);
  if sLinha = '--VERSAO' then
  begin
    sVersao := Trim(Copy(LinhaComando, 10, 20));
    Result := StrToInt(SoNumeros(sVersao));
  end
  else
    Result := 0;
end;

function TVersaoSistema.SoNumeros(Valor: string): string;
var
  sql: TFDQuery;
begin
  sql := TFDQuery.Create(nil);
  try
    sql.Connection := dm.Conexao;
    sql.SQL.Text := 'SELECT dbo.SoNumeros(:Valor)';

    sql.Params[0].AsString := Valor;
    sql.Open();

    Result := sql.Fields[0].AsString;
  finally
    FreeAndNil(sql);
  end;
end;

end.
