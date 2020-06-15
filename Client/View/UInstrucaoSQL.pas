unit UInstrucaoSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, uDMUtilitario, uUtilitarioController, Data.DB;

type
  TfrmInstrucaoSQL = class(TForm)
    pnlCorpo: TPanel;
    pnlRodape: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    lstCampos: TListBox;
    Panel3: TPanel;
    lstTabelas: TListBox;
    GroupBox1: TGroupBox;
    mmInstrucao: TMemo;
    GroupBox2: TGroupBox;
    dbGrade: TDBGrid;
    btnExecutar: TBitBtn;
    btnCancelar: TBitBtn;
    dsTabela: TDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure lstTabelasClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure dbGradeDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FController: TUtilitarioController;
    procedure ListarCampos;
    procedure PreencherListBox;
  public
    { Public declarations }
  end;

var
  frmInstrucaoSQL: TfrmInstrucaoSQL;

implementation

{$R *.dfm}

uses uFuncoesSIDomper, uGrade, uImagens, uUsuarioSenha;

procedure TfrmInstrucaoSQL.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInstrucaoSQL.ListarCampos;
begin
  lstCampos.Clear;
  FController.ListarCamposTabelaBancoDados(lstTabelas.Items[lstTabelas.ItemIndex]);
  while not FController.Model.CDSListarCampos.Eof do
  begin
    lstCampos.Items.Add(FController.Model.CDSListarCamposCOLUNA.AsString);
    FController.Model.CDSListarCampos.Next;
  end;
end;

procedure TfrmInstrucaoSQL.PreencherListBox;
begin
  FController.ListarTabelasBancoDados;
  while not FController.Model.CDSListarTabelas.Eof do
  begin
    lstTabelas.Items.Add(FController.Model.CDSListarTabelasTabelas.AsString);
    FController.Model.CDSListarTabelas.Next;
  end;
end;

procedure TfrmInstrucaoSQL.lstTabelasClick(Sender: TObject);
begin
  ListarCampos();
end;

procedure TfrmInstrucaoSQL.btnExecutarClick(Sender: TObject);
begin
  FController.ExecutarSQL(mmInstrucao.Text);
end;

procedure TfrmInstrucaoSQL.dbGradeDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsTabela.DataSet, dbGrade, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmInstrucaoSQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmInstrucaoSQL.FormCreate(Sender: TObject);
var
  img: TfrmImagens;
begin

  img := TfrmImagens.Create(self);
  try
    btnExecutar.Glyph := img.btnConfirmar.Glyph;
    btnCancelar.Glyph := img.btnCancelar.Glyph;
  finally
    FreeAndNil(img);
  end;

  FController := TUtilitarioController.Create;

  PreencherListBox();
end;

procedure TfrmInstrucaoSQL.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

procedure TfrmInstrucaoSQL.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
