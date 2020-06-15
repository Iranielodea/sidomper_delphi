unit uListaProblemaChamado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.DBCGrids, Vcl.ExtCtrls, uChamadoController, uDMChamado, Vcl.Mask,
  Vcl.DBCtrls, uEnumerador;

type
  TfrmListaProblemaChamado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtTexto: TEdit;
    DBCtrlGrid1: TDBCtrlGrid;
    dsPesquisa: TDataSource;
    lblIdChamado: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    btnFiltrar: TBitBtn;
    procedure edtTextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure lblIdChamadoDblClick(Sender: TObject);
    procedure lblIdChamadoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lblIdChamadoMouseLeave(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    FController: TChamadoController;
    FTipoMovimento: TEnumChamadoAtividade;
    FSelecionar: Boolean;
    FIdChamado: Integer;
    FIdCliente: string;
    procedure Listar();
  public
    { Public declarations }
    constructor Create(ASelecionar: Boolean = False; ATipo: TEnumChamadoAtividade = caChamado);
    property IdChamado: Integer read FIdChamado;
  end;

var
  frmListaProblemaChamado: TfrmListaProblemaChamado;

implementation

{$R *.dfm}

uses uDM, uImagens, uFiltroSolucao, uFiltroChamado;

procedure TfrmListaProblemaChamado.btnFiltrarClick(Sender: TObject);
var
  Formulario: TfrmFiltroSolucao;
begin
  Formulario := TfrmFiltroSolucao.Create(Self);
  try
    if Formulario.ShowModal = mrOk then
    begin
      FIdCliente := Formulario.IdCliente;
      Listar();
    end;
  finally
    FreeAndNil(Formulario);
  end;
end;

constructor TfrmListaProblemaChamado.Create(ASelecionar: Boolean; ATipo: TEnumChamadoAtividade);
begin
  inherited Create(nil);
  FSelecionar := ASelecionar;
  FTipoMovimento := ATipo;

  if FSelecionar = false then
    lblIdChamado.Font.Style := [];
end;

procedure TfrmListaProblemaChamado.edtTextoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Listar();
  end;
end;

procedure TfrmListaProblemaChamado.FormCreate(Sender: TObject);
var
  img: TfrmImagens;
begin
  img := TfrmImagens.Create(Self);
  try
    btnFiltrar.Glyph := img.btnFiltrar.Glyph;
  finally
    FreeAndNil(img);
  end;

  FController := TChamadoController.Create;
  dsPesquisa.DataSet := FController.Model.CDSListarProblemaSolucao;
end;

procedure TfrmListaProblemaChamado.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FController);
end;

procedure TfrmListaProblemaChamado.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F3: btnFiltrarClick(Self);
    VK_ESCAPE: Close;
  end;
end;

procedure TfrmListaProblemaChamado.lblIdChamadoDblClick(Sender: TObject);
begin
  if FSelecionar then
  begin
    if FController.Model.CDSListarProblemaSolucao.Active then
    begin
      FIdChamado := FController.Model.CDSListarProblemaSolucaoChOco_Chamado.AsInteger;
      Close;
      ModalResult := mrOk;
    end;
  end;
end;

procedure TfrmListaProblemaChamado.lblIdChamadoMouseLeave(Sender: TObject);
begin
  Screen.Cursor := crDefault;
end;

procedure TfrmListaProblemaChamado.lblIdChamadoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if FSelecionar then
    Screen.Cursor := crHandPoint;
end;

procedure TfrmListaProblemaChamado.Listar;
var
  Filtro: TFiltroChamado;
begin
  if Trim(edtTexto.Text) = '' then
  begin
    edtTexto.SetFocus;
    raise Exception.Create('Digite o Texto para ser Pesquisado!');
  end;
  Filtro := TFiltroChamado.Create;
  try
    Filtro.IdCliente := FIdCliente;
    if FTipoMovimento = caChamado then
      FController.ListarProblemaSolucao(Filtro, edtTexto.Text, dm.IdUsuario)
    else
      FController.AtividadeListarProblemaSolucao(Filtro, edtTexto.Text, dm.IdUsuario);
  finally
    FreeAndNil(Filtro);
  end;
end;

end.
