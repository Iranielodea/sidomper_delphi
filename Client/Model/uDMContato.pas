unit uDMContato;

interface

uses
  System.SysUtils, System.Classes, uDMBase, ppComm, ppRelatv, ppDB, ppDBPipe,
  Data.DB, Datasnap.DBClient, uDM;

type
  TDMContato = class(TDMBase)
    CDSCadastroCont_Id: TAutoIncField;
    CDSCadastroCont_Cliente: TIntegerField;
    CDSCadastroCont_Orcamento: TIntegerField;
    CDSCadastroCont_Nome: TStringField;
    CDSCadastroCont_Fone1: TStringField;
    CDSCadastroCont_Fone2: TStringField;
    CDSCadastroCont_Depto: TStringField;
    CDSCadastroCont_Email: TStringField;
    CDSTabela: TClientDataSet;
    CDSTabelaCont_Id: TIntegerField;
    CDSTabelaCont_Cliente: TIntegerField;
    CDSTabelaCont_Orcamento: TIntegerField;
    CDSTabelaCont_Nome: TStringField;
    CDSTabelaCont_Fone1: TStringField;
    CDSTabelaCont_Fone2: TStringField;
    CDSTabelaCont_Depto: TStringField;
    CDSTabelaCont_Email: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSTabelaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FId: Integer;
  public
    { Public declarations }
  end;

var
  DMContato: TDMContato;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMContato.CDSTabelaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if CDSTabela.State = dsEdit then
  begin
    CDSTabelaCont_Id.AsInteger := FId;
    Dec(FId);
  end;
end;

procedure TDMContato.DataModuleCreate(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao2;
  end;
  FId := -1;

  CDSTabela.CreateDataSet;
end;

end.
