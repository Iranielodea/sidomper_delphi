unit uListaProblemaSolicitacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDMSolicitacao, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, Vcl.DBCGrids, uDM, uSolicitacaoController,
  uFiltroSolicitacao, Vcl.ComCtrls;

type
  TfrmListaProblemaSolicitacao = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtTexto: TEdit;
    dsPesquisa: TDataSource;
    DBCtrlGrid1: TDBCtrlGrid;
    lblIdSolicitacao: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    Label2: TLabel;
    DBMemo3: TDBMemo;
    Label5: TLabel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    dbredtRichLib: TDBRichEdit;
    dbredtRichOco: TDBRichEdit;
    procedure edtTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lblIdSolicitacaoDblClick(Sender: TObject);
    procedure lblIdSolicitacaoMouseLeave(Sender: TObject);
    procedure lblIdSolicitacaoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBMemo2DblClick(Sender: TObject);
    procedure dbredtRichLibDblClick(Sender: TObject);
    procedure DBMemo3DblClick(Sender: TObject);
    procedure dbredtRichOcoDblClick(Sender: TObject);
  private
    { Private declarations }
    FController: TSolicitacaoController;
    FSelecionar: Boolean;
    FIdSolicitacao: Integer;
    procedure Listar();
  public
    { Public declarations }
    property IdSolicitacao: Integer read FIdSolicitacao;
    constructor Create(ASelecionar: Boolean = False);
  end;

var
  frmListaProblemaSolicitacao: TfrmListaProblemaSolicitacao;

implementation

{$R *.dfm}

constructor TfrmListaProblemaSolicitacao.Create(ASelecionar: Boolean);
begin
  inherited Create(nil);
  FSelecionar := ASelecionar;
  if FSelecionar = false then
    lblIdSolicitacao.Font.Style := [];
end;

procedure TfrmListaProblemaSolicitacao.DBMemo2DblClick(Sender: TObject);
begin
  dbredtRichLib.Visible := True;
end;

procedure TfrmListaProblemaSolicitacao.DBMemo3DblClick(Sender: TObject);
begin
  dbredtRichOco.Visible := True;
end;

procedure TfrmListaProblemaSolicitacao.dbredtRichLibDblClick(Sender: TObject);
begin
  dbredtRichLib.Visible := False;
end;

procedure TfrmListaProblemaSolicitacao.dbredtRichOcoDblClick(Sender: TObject);
begin
  dbredtRichOco.Visible := False;
end;

procedure TfrmListaProblemaSolicitacao.edtTextoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Listar();
  end;
end;

procedure TfrmListaProblemaSolicitacao.FormCreate(Sender: TObject);
begin
  dm.ConexaoBanco;
  FController := TSolicitacaoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSListarProblemaSolucao;
end;

procedure TfrmListaProblemaSolicitacao.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

procedure TfrmListaProblemaSolicitacao.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmListaProblemaSolicitacao.lblIdSolicitacaoDblClick(
  Sender: TObject);
begin
  if FSelecionar then
  begin
    if FController.Model.CDSListarProblemaSolucao.Active then
    begin
      FIdSolicitacao := FController.Model.CDSListarProblemaSolucaoSol_Id.AsInteger;
      Close;
      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmListaProblemaSolicitacao.lblIdSolicitacaoMouseLeave(
  Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TfrmListaProblemaSolicitacao.lblIdSolicitacaoMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  if FSelecionar then
    Screen.Cursor := crHandPoint;
end;

procedure TfrmListaProblemaSolicitacao.Listar;
var
  Filtro: TFiltroSolicitacao;
begin
  if Trim(edtTexto.Text) = '' then
  begin
    edtTexto.SetFocus;
    raise Exception.Create('Digite o Texto para ser Pesquisado!');
  end;
  Filtro := TFiltroSolicitacao.Create;
  try
//    Filtro.IdCliente := FIdCliente;
    FController.ListarProblemaSolucao(Filtro, edtTexto.Text, dm.IdUsuario)
  finally
    FreeAndNil(Filtro);
  end;
end;

end.
