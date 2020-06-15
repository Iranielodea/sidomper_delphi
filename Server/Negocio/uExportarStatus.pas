unit uExportarStatus;

interface

uses
  System.SysUtils, System.Classes, uArquivoTexto, uDM, uFireDAC,
  uStatusVO, System.Generics.Collections, uGenericDAO;

type
  TExportarStatus = class
  private
    FArquivo: string;

  public
    procedure Exportar();
    function Importar(): TObjectList<TStatusVO>;

    constructor Create(); overload;
  end;

implementation

{ TExportarTipo }

constructor TExportarStatus.Create;
begin
  inherited Create;
  FArquivo := 'D:\DOMPER\SIDomper\Banco\Status.txt';
end;

procedure TExportarStatus.Exportar;
var
  obj: TFireDAC;
  Arq: TArquivoTexto;
begin
  obj := TFireDAC.create;
  Arq := TArquivoTexto.Create(FArquivo, tpExportar);
  try
    obj.OpenSQL('SELECT * FROM Status');
    while not obj.Model.Eof do
    begin
      Arq.ExportarInt(obj.Model.FieldByName('Sta_Codigo').AsInteger,      001, 005);
      Arq.ExportarString(obj.Model.FieldByName('Sta_Nome').AsString,      006, 050);
      Arq.ExportarBool(obj.Model.FieldByName('Sta_Ativo').AsBoolean);
      Arq.ExportarInt(obj.Model.FieldByName('Sta_Programa').AsInteger,    057, 005);
      Arq.ExportarBool(obj.Model.FieldByName('Sta_NotificarCliente').AsBoolean);
      Arq.ExportarBool(obj.Model.FieldByName('Sta_NotificarSupervisor').AsBoolean);
      Arq.ExportarBool(obj.Model.FieldByName('Sta_NotificarConsultor').AsBoolean);
      Arq.ExportarBool(obj.Model.FieldByName('Sta_NotificarRevenda').AsBoolean);
      Arq.ExportarString(obj.Model.FieldByName('Sta_Conceito').AsString,  066, 500);
      Arq.NovaLinha();
      obj.Model.Next;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Arq);
  end;
end;

function TExportarStatus.Importar: TObjectList<TStatusVO>;
var
  model: TStatusVO;
  lista: TObjectList<TStatusVO>;
  Arq: TArquivoTexto;
begin
  lista := TObjectList<TStatusVO>.Create();
  Arq := TArquivoTexto.Create(FArquivo, tpImportar);
  try
    while not (Arq.FimArquivo()) do
    begin
      Arq.ProximoRegistro();

      model := TStatusVO.Create;
      model.Id                  := 0;
      model.Codigo              := Arq.ImportarInt(001, 005);
      model.Nome                := Arq.ImportarString(006, 050);
      model.Ativo               := Arq.ImportarBool(056, 001);
      model.Programa            := Arq.ImportarInt(057, 005);
      model.NotificarCliente    := Arq.ImportarBool(062, 001);
      model.NotificarSupervisor := Arq.ImportarBool(063, 001);
      model.NotificarConsultor  := Arq.ImportarBool(064, 001);
      model.NotificarRevenda    := Arq.ImportarBool(065, 001);
      model.Conceito            := Arq.ImportarString(066, 500);

      lista.Add(model);
    end;
  finally
    FreeAndNil(Arq);
  end;
  Result := lista;
end;

end.
