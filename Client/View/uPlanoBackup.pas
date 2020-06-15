unit uPlanoBackup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, uDMPlanoBackup, uPlanoBackupController, Vcl.DBCtrls, Vcl.Mask,
  Data.DB, Vcl.Buttons, uFuncoesSIDomper;

type
  TfrmPlanoBackup = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    dsCad: TDataSource;
    dsItens: TDataSource;
    DBEdit1: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    btnSalvar: TBitBtn;
    btnExcluir: TBitBtn;
    btnSair: TBitBtn;
    btnExcluirItem: TBitBtn;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BalloonHint1: TBalloonHint;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExcluirItemClick(Sender: TObject);
  private
    { Private declarations }
    FController: TPlanoBackupController;
    procedure ImagemBotao;
  public
    { Public declarations }

    //SELECT DatePart(DW, CAST('2015-11-08' AS date))
  end;

var
  frmPlanoBackup: TfrmPlanoBackup;

implementation

{$R *.dfm}

uses uImagens;

procedure TfrmPlanoBackup.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Confirmar Exclusão?') then
    FController.Excluir(FController.Model.CDSCadastroPlb_Id.AsInteger);
end;

procedure TfrmPlanoBackup.btnExcluirItemClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Confirmar Exclusão?') then
  begin
    FController.ExcluirItem(FController.Model.CDSItensPlbIte_Id.AsInteger);
    FController.Model.CDSItens.Delete;
  end;
end;

procedure TfrmPlanoBackup.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPlanoBackup.btnSalvarClick(Sender: TObject);
begin
  FController.Salvar();
  FController.Localizar();
end;

procedure TfrmPlanoBackup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmPlanoBackup.FormCreate(Sender: TObject);
begin
  FController := TPlanoBackupController.create;
  dsCad.DataSet := FController.Model.CDSCadastro;
  dsItens.DataSet := FController.Model.CDSItens;

  FController.Localizar();
  if not FController.RegistroExiste() then
    FController.Novo();

  ImagemBotao();
end;

procedure TfrmPlanoBackup.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

procedure TfrmPlanoBackup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F8: btnSalvarClick(Self);
    VK_ESCAPE: Close;
  end;

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    btnExcluirClick(Self);
end;

procedure TfrmPlanoBackup.ImagemBotao;
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnSalvar.Glyph := img.btnSalvar.Glyph;
    btnExcluir.Glyph := img.btnExcluir.Glyph;
    btnSair.Glyph := img.btnSair.Glyph;
    btnExcluirItem.Glyph := img.btnExcluirItem.Glyph;
  finally
    FreeAndNil(img);
  end;
end;

end.
