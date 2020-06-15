unit uChamadoModulos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, uImagens, uGrade, Data.DB, uClienteModuloController, uDMClienteModulo;

type
  TfrmChamadoModulos = class(TForm)
    dbDados: TDBGrid;
    Panel1: TPanel;
    btnCancelar: TBitBtn;
    dsCad: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbDadosTitleClick(Column: TColumn);
  private
    { Private declarations }
    FController: TClienteModuloController;
  public
    { Public declarations }
    constructor Create(AIdCliente: Integer);
  end;

var
  frmChamadoModulos: TfrmChamadoModulos;

implementation

{$R *.dfm}

procedure TfrmChamadoModulos.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

constructor TfrmChamadoModulos.Create(AIdCliente: Integer);
begin
  inherited Create(nil);
  FController := TClienteModuloController.Create;
  dsCad.DataSet := FController.Model.CDSConsulta;
  FController.LocalizarCodigo(AIdCliente);
end;

procedure TfrmChamadoModulos.dbDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsCad.DataSet, dbDados, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmChamadoModulos.dbDadosTitleClick(Column: TColumn);
begin
  FController.Model.CDSConsulta.IndexFieldNames := Column.FieldName;
end;

procedure TfrmChamadoModulos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

procedure TfrmChamadoModulos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmChamadoModulos.FormShow(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(self);
  btnCancelar.Glyph := img.btnCancelar.Glyph;
  FreeAndNil(img);
end;

end.
