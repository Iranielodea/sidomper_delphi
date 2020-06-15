unit uListaAnexos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, uDMChamado, uGrade,
  uChamadoController, Vcl.Menus, Vcl.Buttons, uEnumerador, uDMSolicitacao,
  uSolicitacaoController;

type
  TfrmListaAnexos = class(TForm)
    PageControl1: TPageControl;
    tsChamado: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    dsCad: TDataSource;
    dbDados: TDBGrid;
    btnVoltar: TBitBtn;
    tsSolicitacao: TTabSheet;
    Panel3: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    dsSolicitacao: TDataSource;
    Label11: TLabel;
    edtAnexo: TDBEdit;
    btnAnexo: TSpeedButton;
    dbSolicitacao: TDBGrid;
    procedure dbDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure dbDadosDblClick(Sender: TObject);
    procedure btnAnexoClick(Sender: TObject);
    procedure dbSolicitacaoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbSolicitacaoDblClick(Sender: TObject);
  private
    { Private declarations }
//    FIdChamado: Integer;
    FChamadoController: TChamadoController;
    FSolicitacaoController: TSolicitacaoController;
  public
    { Public declarations }
    constructor create(AId: Integer; ATipo: TEnumTipoPrograma);
  end;

var
  frmListaAnexos: TfrmListaAnexos;

implementation

{$R *.dfm}

uses uFuncoesSIDomper, uImagens;

procedure TfrmListaAnexos.btnAnexoClick(Sender: TObject);
begin
  TFuncoes.VisualizarArquivo(edtAnexo.Text);
end;

procedure TfrmListaAnexos.btnVoltarClick(Sender: TObject);
begin
  Close;
end;

constructor TfrmListaAnexos.create(AId: Integer; ATipo: TEnumTipoPrograma);
begin
  inherited create(nil);
  FChamadoController := TChamadoController.Create;
  FSolicitacaoController := TSolicitacaoController.Create;

  dsCad.DataSet := FChamadoController.Model.CDSChamadoAnexo;
  dsSolicitacao.DataSet := FSolicitacaoController.Model.CDSSolicitacaoAnexo;

  case ATipo of
    tpChamado:
    begin
      tsChamado.Caption := 'Chamado';
      FChamadoController.ChamadoAnexos(AId);
      tsSolicitacao.TabVisible := False;
    end;

    tpAtividade:
    begin
      tsChamado.Caption := 'Atividade';
      FChamadoController.ChamadoAnexos(AId);
      tsSolicitacao.TabVisible := False;
    end;

    tpSolicitacao:
    begin
      tsChamado.TabVisible := False;
      FSolicitacaoController.SolicitacaoAnexos(AId);
    end;
  end;
end;

procedure TfrmListaAnexos.dbDadosDblClick(Sender: TObject);
begin
  TFuncoes.VisualizarArquivo(FChamadoController.Model.CDSChamadoAnexoChOco_Anexo.AsString);
end;

procedure TfrmListaAnexos.dbDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsCad.DataSet, dbDados, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmListaAnexos.dbSolicitacaoDblClick(Sender: TObject);
begin
  TFuncoes.VisualizarArquivo(FSolicitacaoController.Model.CDSSolicitacaoAnexoSOcor_Anexo.AsString);
end;

procedure TfrmListaAnexos.dbSolicitacaoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsSolicitacao.DataSet, dbSolicitacao, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmListaAnexos.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FChamadoController);
  FreeAndNil(FSolicitacaoController);
end;

procedure TfrmListaAnexos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmListaAnexos.FormShow(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnVoltar.Glyph := img.btnRetornar.Glyph;
    btnAnexo.Glyph := img.btnExportar.Glyph;
  finally
    FreeAndNil(img);
  end;
end;

end.
