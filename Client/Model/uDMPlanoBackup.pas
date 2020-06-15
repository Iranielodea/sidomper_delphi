unit uDMPlanoBackup;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient;

type
  TdmPlanoBackup = class(TDataModule)
    CDSCadastro: TClientDataSet;
    CDSItens: TClientDataSet;
    CDSItensPlbIte_Id: TAutoIncField;
    CDSItensPlbIte_Hora: TTimeField;
    CDSItensPlbIte_PlanoBackup: TIntegerField;
    CDSItensPlbIte_Status: TBooleanField;
    CDSCadastroPlb_Id: TAutoIncField;
    CDSCadastroPlb_Destino: TStringField;
    CDSCadastroPlb_Domingo: TBooleanField;
    CDSCadastroPlb_Segunda: TBooleanField;
    CDSCadastroPlb_Terca: TBooleanField;
    CDSCadastroPlb_Quarta: TBooleanField;
    CDSCadastroPlb_Quinta: TBooleanField;
    CDSCadastroPlb_Sexta: TBooleanField;
    CDSCadastroPlb_Sabado: TBooleanField;
    CDSCadastroPlb_Ativo: TBooleanField;
    CDSCadastroPlb_DataUltimoBackup: TDateField;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSItensBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FIdItem: Integer;
  public
    { Public declarations }
  end;

var
  dmPlanoBackup: TdmPlanoBackup;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPlanoBackup.CDSCadastroNewRecord(DataSet: TDataSet);
begin
//  CDSCadastroPlb_Id.AsInteger := 0;
  CDSCadastroPlb_Domingo.AsBoolean  := False;
  CDSCadastroPlb_Segunda.AsBoolean  := True;
  CDSCadastroPlb_Terca.AsBoolean    := True;
  CDSCadastroPlb_Quarta.AsBoolean   := True;
  CDSCadastroPlb_Quinta.AsBoolean   := True;
  CDSCadastroPlb_Sexta.AsBoolean    := True;
  CDSCadastroPlb_Sabado.AsBoolean   := False;
  CDSCadastroPlb_Ativo.AsBoolean    := True;
end;

procedure TdmPlanoBackup.CDSItensBeforePost(DataSet: TDataSet);
begin
  if CDSItens.State = dsInsert then
  begin
    CDSItensPlbIte_PlanoBackup.AsInteger := 0;
    CDSItensPlbIte_Status.AsBoolean := False;
    CDSItensPlbIte_Id.AsInteger := FIdItem;
    Dec(FIdItem);
  end;
end;

procedure TdmPlanoBackup.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount -1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao2;
  end;
  FIdItem := -1;
end;

end.
