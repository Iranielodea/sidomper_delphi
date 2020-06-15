unit uChamadoGrafico1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, Data.DB, Datasnap.DBClient,
  VclTee.TeeGDIPlus, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, VCLTee.TeEngine,
  VCLTee.TeeProcs, VCLTee.Chart, VCLTee.DBChart, VCLTee.TeeDBCrossTab,
  VCLTee.TeeFunci, VCLTee.Series, uImagens;

type
  TfrmChamadoGrafico1 = class(TForm)
    CDSGrafico1: TClientDataSet;
    CDSGrafico1Cha_DataAbertura: TDateField;
    CDSGrafico1QtdeChamados: TIntegerField;
    CDSGrafico1TotalHoras: TFloatField;
    DBChart1: TDBChart;
    Panel1: TPanel;
    btnSair: TBitBtn;
    Series1: TFastLineSeries;
    TeeFunction1: TAddTeeFunction;
    Series2: TFastLineSeries;
    TeeFunction2: TAddTeeFunction;
    DBCrossTabSource1: TDBCrossTabSource;
    DBCrossTabSource2: TDBCrossTabSource;
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChamadoGrafico1: TfrmChamadoGrafico1;

implementation

{$R *.dfm}

procedure TfrmChamadoGrafico1.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmChamadoGrafico1.FormCreate(Sender: TObject);
var
  img: TfrmImagens;
begin

  CDSGrafico1.RemoteServer := dm.DSPConexao;

  img := TfrmImagens.Create(Self);
  try
    btnSair.Glyph := img.btnSair.Glyph;
  finally
    FreeAndNil(img);
  end;
end;

procedure TfrmChamadoGrafico1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_ESCAPE: btnSairClick(Self);
  end;
end;

end.
