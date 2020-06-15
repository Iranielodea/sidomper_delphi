unit uArquivoTexto;

interface

uses
  System.SysUtils;

type
  TTipo = (tpExportar, tpImportar);

  TArquivoTexto = class
  private
    FArquivo: TextFile;
    FRegistro: string;
    function Posicao(ATamanho: integer; AValor: string): string;
    function PosicaoImp(APosicaoIni, ATamanho: Integer; AValor: string): string;
  public
    procedure ExportarString(AValor: string; APosicaoIni, ATamanho: Integer);
    procedure ExportarInt(AValor: Integer; APosicaoIni, ATamanho: Integer);
    procedure ExportarBool(AValor: Boolean);
    procedure NovaLinha;
    procedure ProximoRegistro();

    function FimArquivo(): Boolean;
    function ImportarString(APosicaoIni, ATamanho: Integer): string;
    function ImportarInt(APosicaoIni, ATamanho: Integer): Integer;
    function ImportarBool(APosicaoIni, ATamanho: Integer): Boolean;

    constructor Create(AArquivo: string; ATipo: TTipo); overload;
    destructor Destroy; override;
  end;

implementation

{ TArquivoTexto }

constructor TArquivoTexto.Create(AArquivo: string; ATipo: TTipo);
begin
  inherited Create;
  AssignFile(FArquivo, AArquivo);
  if ATipo = tpExportar then
    Rewrite(FArquivo)
  else
    Reset(FArquivo);
end;

destructor TArquivoTexto.Destroy;
begin
  CloseFile(FArquivo);
  inherited;
end;

procedure TArquivoTexto.NovaLinha;
begin
  Writeln(FArquivo,'');
end;

function TArquivoTexto.Posicao(ATamanho: integer; AValor: string): string;
begin
  Result := Copy(AValor + StringOfChar(' ', ATamanho + 1), 1, ATamanho);
end;

function TArquivoTexto.PosicaoImp(APosicaoIni, ATamanho: Integer;
  AValor: string): string;
begin
  Result := Copy(AValor, APosicaoIni, ATamanho);
end;

procedure TArquivoTexto.ProximoRegistro;
begin
  Readln(FArquivo, FRegistro);
end;

procedure TArquivoTexto.ExportarBool(AValor: Boolean);
begin
  if AValor then
    write(FArquivo,'1')
  else
    write(FArquivo,'0');
end;

procedure TArquivoTexto.ExportarInt(AValor, APosicaoIni, ATamanho: Integer);
begin
  write(FArquivo, Posicao(ATamanho, IntToStr(AValor)));
end;

procedure TArquivoTexto.ExportarString(AValor: string; APosicaoIni, ATamanho: Integer);
begin
  write(FArquivo, Posicao(ATamanho, AValor));
end;

function TArquivoTexto.FimArquivo: Boolean;
begin
  Result := Eof(FArquivo);
end;

function TArquivoTexto.ImportarBool(APosicaoIni, ATamanho: Integer): Boolean;
var
  Resultado: Integer;
begin
  Resultado := StrToIntDef(Trim(PosicaoImp(APosicaoIni, ATamanho, FRegistro)),0);
  Result := (Resultado = 1);
end;

function TArquivoTexto.ImportarInt(APosicaoIni, ATamanho: Integer): Integer;
begin
  Result := StrToIntDef(Trim(PosicaoImp(APosicaoIni, ATamanho, FRegistro)),0);
end;

function TArquivoTexto.ImportarString(APosicaoIni,
  ATamanho: Integer): string;
begin
  Result := Trim(PosicaoImp(APosicaoIni, ATamanho, FRegistro));
end;

end.
