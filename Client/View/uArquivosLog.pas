unit uArquivosLog;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.Generics.Collections, uClienteController;

type
  TfrmArquivosLog = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    FQuantidadeArquivos: Integer;
    procedure SetQuantidadeArquivos(const Value: Integer);
    function GetQuantidadeArquivos: Integer;
    { Private declarations }
  public
    procedure ListarArquivosLogs();
    property QuantidadeArquivos: Integer read GetQuantidadeArquivos write SetQuantidadeArquivos;
  end;

var
  frmArquivosLog: TfrmArquivosLog;

implementation

{$R *.dfm}

{ TfrmArquivosLog }

procedure TfrmArquivosLog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

function TfrmArquivosLog.GetQuantidadeArquivos: Integer;
begin
  ListarArquivosLogs();
  Result := FQuantidadeArquivos;
end;

procedure TfrmArquivosLog.ListarArquivosLogs;
var
  Lista: TList<string>;
  Cliente: TClienteController;
  i: Integer;
  Count: Integer;
begin
  Cliente := TClienteController.Create;
  try
    Lista := Cliente.ListarArquivosLog();
    Count := Lista.Count;

    for I := 0 to Count -1 do
    begin
      Memo1.Lines.Add(Lista.Items[i]);
      Inc(FQuantidadeArquivos);
    end;
  finally
    FreeAndNil(Cliente);
    if Lista <> nil then
      FreeAndNil(Lista);
  end;

end;

procedure TfrmArquivosLog.SetQuantidadeArquivos(const Value: Integer);
begin
  FQuantidadeArquivos := Value;
end;

end.
