unit uFraTipo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Data.DB, Datasnap.DBClient, uEnumerador;

type
  TFraTipo = class(TFrame)
    edtCodigo: TEdit;
    edtNome: TEdit;
    dbTabela: TDBGrid;
    dsTabela: TDataSource;
    CDSTabela: TClientDataSet;
    edtId: TEdit;
    BalloonHint1: TBalloonHint;
    btnProc: TSpeedButton;
    CDSTabelaId: TIntegerField;
    CDSTabelaCodigo: TIntegerField;
    CDSTabelaNome: TStringField;
    procedure dbTabelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProcClick(Sender: TObject);
  private
    FTipoPrograma: TEnumPrograma;
    { Private declarations }
    procedure Buscar(AId, ACodigo: integer);
    procedure Adiciona;

  public
    { Public declarations }
    function RetornoSelecao(): string;
    procedure Inicializar;
    property TipoPrograma: TEnumPrograma read FTipoPrograma write FTipoPrograma default prTodos;
  end;

implementation

{$R *.dfm}

uses uImagens, uGrade, uTipo, uTipoController, uDMTipo, uDM, uFuncoesSIDomper;

procedure TFraTipo.Inicializar;
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

function TFraTipo.RetornoSelecao: string;
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

procedure TFraTipo.Adiciona;
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

procedure TFraTipo.btnProcClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmTipo.create(FTipoPrograma, true));
  if dm.IdSelecionado > 0 then
  begin
    Buscar(dm.IdSelecionado, 0);
    edtCodigo.SetFocus;
  end;
end;

procedure TFraTipo.Buscar(AId, ACodigo: integer);
var
  obj: TTipoController;
begin
  obj := TTipoController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo, FTipoPrograma);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodigo.SetFocus;
      end;
    end;
  finally
    edtId.Text := obj.Model.CDSCadastroTip_Id.AsString;
    edtCodigo.Text := obj.Model.CDSCadastroTip_Codigo.AsString;
    edtNome.Text := obj.Model.CDSCadastroTip_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodigo.Modified := False;
end;

procedure TFraTipo.dbTabelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsTabela.DataSet, dbTabela, Sender, Rect, DataCol, Column, State);
end;

procedure TFraTipo.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F9: btnProcClick(Self);
    VK_RETURN: Adiciona;
  end;

end;

end.
