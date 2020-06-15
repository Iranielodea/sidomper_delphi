unit uListaRamal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, uDMRamal,
  Data.DB, Datasnap.DBClient, uRamalController, uGrade;

type
  TfrmListaRamal = class(TForm)
    dbGrade: TDBGrid;
    dsCad: TDataSource;
    cdsDados: TClientDataSet;
    cdsDadosNumero: TStringField;
    cdsDadosNome: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dbGradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbGradeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure Preencher;
  public
    { Public declarations }
//    constructor create(AForm: TForm);
    constructor Create(AForm: TForm);
  end;

var
  frmListaRamal: TfrmListaRamal;

implementation

{$R *.dfm}

{ TfrmListaRamal }

constructor TfrmListaRamal.create(AForm: TForm);
begin
  inherited create(AForm);
  Self.Top := AForm.Top + 50;
  Self.Left := AForm.Width - 370;
  Self.Height := AForm.Height - 80;
end;

procedure TfrmListaRamal.dbGradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if cdsDadosNumero.AsString = '' then
  begin
    dbGrade.Canvas.Brush.Color:=clRed;
     dbGrade.DefaultDrawColumnCell(Rect, DataCol, Column, State)
  end;
end;

procedure TfrmListaRamal.dbGradeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmListaRamal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmListaRamal.FormShow(Sender: TObject);
begin
  cdsDados.CreateDataSet;
  Preencher();
end;

procedure TfrmListaRamal.Preencher;
var
  Controller: TRamalController;
  IdOld: Integer;
begin
  Controller := TRamalController.Create;
  try
    Controller.ListarTudo();
    Controller.Model.CDSImpressao.DisableControls;
    Controller.Model.CDSImpressao.First;

    IdOld := -1;
    while not Controller.Model.CDSImpressao.Eof do
    begin
      if Controller.Model.CDSImpressaoRam_Id.AsInteger <> IdOld then
      begin
        cdsDados.Append;
        cdsDadosNumero.AsString := '';
        cdsDadosNome.AsString   := Controller.Model.CDSImpressaoRam_Departamento.AsString;
        cdsDados.Post;
      end;
      cdsDados.Append;
      cdsDadosNumero.AsString := Controller.Model.CDSImpressaoRamIt_Numero.AsString;
      cdsDadosNome.AsString   := Controller.Model.CDSImpressaoRamIt_Nome.AsString;
      cdsDados.Post;

      IdOld := Controller.Model.CDSImpressaoRam_Id.AsInteger;
      Controller.Model.CDSImpressao.Next;
    end;
  finally
    cdsDados.First;
    Controller.Model.CDSImpressao.EnableControls;
    FreeAndNil(Controller);
  end;
end;

end.
