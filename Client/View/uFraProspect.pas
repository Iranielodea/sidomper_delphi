unit uFraProspect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Data.DB, Datasnap.DBClient;

type
  TFraProspect = class(TFrame)
    edtCodigo: TEdit;
    edtNome: TEdit;
    dbCliente: TDBGrid;
    dsCliente: TDataSource;
    CDSCliente: TClientDataSet;
    CDSClienteCli_Id: TIntegerField;
    CDSClienteCli_Codigo: TIntegerField;
    CDSClienteCli_Nome: TStringField;
    edtId: TEdit;
    BalloonHint1: TBalloonHint;
    btnProc: TSpeedButton;
    procedure dbClienteDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnProcClick(Sender: TObject);
  private
    { Private declarations }
    procedure BuscarCliente(AId, ACodigo: integer);
    procedure Adiciona;

  public
    { Public declarations }
    function RetornoSelecao(): string;
    procedure Inicializar();
    function TemRegistros: Boolean;
  end;

implementation

{$R *.dfm}

uses uImagens, uGrade, uCliente, uClienteController, uDMCliente, uDM, uFuncoesSIDomper,
uProspectController, uDMProspect, uProspect;

procedure TFraProspect.Inicializar;
var
  Img: TfrmImagens;
begin
  edtId.SendToBack;
  Img := TfrmImagens.Create(Self);
  try
    btnProc.Glyph := Img.btnProcurar.Glyph;
  finally
    FreeAndNil(Img);
  end;
  CDSCliente.CreateDataSet;
end;

function TFraProspect.RetornoSelecao: string;
var
  bPrimeiro: Boolean;
  sMontar: string;
begin
  sMontar := '';
  if CDSCliente.Active = False then
  begin
    Result := sMontar;
    Exit;
  end;

  bPrimeiro := True;
  CDSCliente.First;
  while not CDSCliente.Eof do
  begin
    if bPrimeiro then
    begin
      sMontar := ' (' + CDSClienteCli_Id.AsString;
      bPrimeiro := False;
    end
    else
      sMontar := sMontar + ',' + CDSClienteCli_Id.AsString;
    CDSCliente.Next;
  end;
  if sMontar <> '' then
    sMontar := sMontar + ') ';
  Result := sMontar;
end;

function TFraProspect.TemRegistros: Boolean;
begin
  Result := (CDSCliente.RecordCount > 0);
end;

procedure TFraProspect.Adiciona;
begin
  BuscarCliente(0, StrToIntDef(edtCodigo.Text, 0));
  if edtCodigo.Text <> '' then
  begin
    CDSCliente.Append;
    CDSClienteCli_Id.AsInteger := StrToIntDef(edtId.Text, 0);
    CDSClienteCli_Codigo.AsInteger := StrToIntDef(edtCodigo.Text, 0);
    CDSClienteCli_Nome.AsString := edtNome.Text;
    CDSCliente.Post;
    edtCodigo.Clear;
    edtNome.Clear;
    edtId.SetFocus;
  end;
end;

procedure TFraProspect.btnProcClick(Sender: TObject);
begin
  TFuncoes.CriarFormularioModal(TfrmProspect.create(true));
  if dm.IdSelecionado > 0 then
  begin
    BuscarCliente(dm.IdSelecionado, 0);
    edtCodigo.SetFocus;
  end;
end;

procedure TFraProspect.BuscarCliente(AId, ACodigo: integer);
var
  obj: TProspectController;
begin
  obj := TProspectController.Create;
  try
    try
      obj.APesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtCodigo.SetFocus;
      end;
    end;
  finally
    edtId.Text := obj.Model.CDSCadastroPros_Id.AsString;
    edtCodigo.Text := obj.Model.CDSCadastroPros_Codigo.AsString;
    edtNome.Text := obj.Model.CDSCadastroPros_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtCodigo.Modified := False;
end;

procedure TFraProspect.dbClienteDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsCliente.DataSet, dbCliente, Sender, Rect, DataCol, Column, State);
end;

procedure TFraProspect.edtCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_F9: btnProcClick(Self);
    VK_RETURN: Adiciona;
  end;

end;

end.
