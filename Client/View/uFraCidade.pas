unit uFraCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCidadeController,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  uImagens, uGrade, uCidade, uFuncoesSIDomper, uDM;

type
  TFraCidade = class(TFrame)
    btnProc: TSpeedButton;
    edtCodigo: TEdit;
    edtNome: TEdit;
    dbTabela: TDBGrid;
    edtId: TEdit;
    dsTabela: TDataSource;
    CDSTabela: TClientDataSet;
    CDSTabelaId: TIntegerField;
    CDSTabelaCodigo: TIntegerField;
    CDSTabelaNome: TStringField;
    BalloonHint1: TBalloonHint;
    procedure dbTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProcClick(Sender: TObject);
  private
    { Private declarations }
    procedure Buscar(AId, ACodigo: integer);
    procedure Adiciona;
  public
    { Public declarations }
    function RetornoSelecao(): string;
    procedure Inicializar;
  end;

implementation

{$R *.dfm}

{ TFraCidade }

procedure TFraCidade.Adiciona;
begin
  Buscar(0, StrToIntDef(edtCodigo.Text, 0));
  if edtCodigo.Text <> '' then
  begin
    CDSTabela.Append;
    CDSTabelaId.AsInteger := StrToIntDef(edtId.Text, 0);
    CDSTabelaCodigo.AsInteger := StrToIntDef(edtCodigo.Text, 0);
    CDSTabelaNome.AsString := edtNome.Text;
    CDSTabela.Post;
    edtCodigo.Clear;
    edtNome.Clear;
    edtId.SetFocus;
  end;
end;

procedure TFraCidade.btnProcClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmCidade.create(true));
  if dm.IdSelecionado > 0 then
  begin
    Buscar(dm.IdSelecionado, 0);
    edtCodigo.SetFocus;
  end;
end;

procedure TFraCidade.Buscar(AId, ACodigo: integer);
var
  obj: TCidadeController;
begin
  obj := TCidadeController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodigo.SetFocus;
      end;
    end;
  finally
    edtId.Text := obj.Model.CDSCadastroCid_Id.AsString;
    edtCodigo.Text := obj.Model.CDSCadastroCid_Codigo.AsString;
    edtNome.Text := obj.Model.CDSCadastroCid_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodigo.Modified := False;
end;

procedure TFraCidade.dbTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsTabela.DataSet, dbTabela, Sender, Rect, DataCol, Column, State);
end;

procedure TFraCidade.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F9: btnProcClick(Self);
    VK_RETURN: Adiciona;
  end;
end;

procedure TFraCidade.Inicializar;
var
  Img: TfrmImagens;
begin
  edtId.SendToBack;

//  inherited;
  Img := TfrmImagens.Create(Self);
  try
    btnProc.Glyph := Img.btnProcurar.Glyph;
  finally
    FreeAndNil(Img);
  end;

  CDSTabela.CreateDataSet;
end;

function TFraCidade.RetornoSelecao: string;
var
  bPrimeiro: Boolean;
  sMontar: string;
begin
  sMontar := '';
  if CDSTabela.Active = False then
  begin
    Result := sMontar;
    Exit;
  end;

  bPrimeiro := True;
  CDSTabela.First;
  while not CDSTabela.Eof do
  begin
    if bPrimeiro then
    begin
      sMontar := ' (' + CDSTabelaId.AsString;
      bPrimeiro := False;
    end
    else
      sMontar := sMontar + ',' + CDSTabelaId.AsString;
    CDSTabela.Next;
  end;
  if sMontar <> '' then
    sMontar := sMontar + ') ';
  Result := sMontar;
end;

end.
