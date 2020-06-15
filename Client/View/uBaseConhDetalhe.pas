unit uBaseConhDetalhe;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, uBaseConhController;

const
  COR_ABERTURA: Integer = clRed;
  COR_OCORR_GERAL: Integer = clPurple;
  COR_STATUS: Integer = clOlive;
  COR_PADRAO: Integer = clBlack;
  COR_TITULO: Integer = clRed;

  TAMANHO_DIVISAO:    Integer = 164;
  TRACO:              Char = '_';

type
  TfrmBaseConhDetalhe = class(TForm)
    redtGeral: TRichEdit;
    procedure redtGeralKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure FormatarLinha(var AMemo: TRichEdit; ACor: Integer; ATexto: string; ANegrito: Boolean = False); overload;
    procedure PreencherDados(AObj: TBaseConhController);
  public
    { Public declarations }
    constructor create(AIdBase: integer);
  end;

var
  frmBaseConhDetalhe: TfrmBaseConhDetalhe;

implementation

{$R *.dfm}

{ TfrmBaseConhDetalhe }

constructor TfrmBaseConhDetalhe.create(AIdBase: integer);
var
  Controller: TBaseConhController;
begin
  inherited create(nil);
  Controller := TBaseConhController.Create;
  try
    Controller.LocalizarId(AIdBase);
    PreencherDados(Controller);
  finally
    FreeAndNil(Controller);
  end;
end;

procedure TfrmBaseConhDetalhe.FormatarLinha(var AMemo: TRichEdit; ACor: Integer;
  ATexto: string; ANegrito: Boolean);
begin
  AMemo.SelAttributes.Color := ACor;
  if ANegrito then
    AMemo.SelAttributes.Style:=[fsBold];

  AMemo.Lines.Add(ATexto);
  AMemo.SelAttributes.Color:=Color;
end;

procedure TfrmBaseConhDetalhe.PreencherDados(AObj: TBaseConhController);
begin
  redtGeral.Lines.Add('');
  FormatarLinha(redtGeral,COR_TITULO, 'ABERTURA', True);
  FormatarLinha(redtGeral,COR_PADRAO, 'ID: ' + AObj.Model.CDSCadastroBas_Id.AsString);
  FormatarLinha(redtGeral,COR_PADRAO, 'Data: ' + AObj.Model.CDSCadastroBas_Data.AsString);
  FormatarLinha(redtGeral,COR_PADRAO, 'Nome: ' + AObj.Model.CDSCadastroBas_Nome.AsString);
  FormatarLinha(redtGeral,COR_PADRAO, 'Usuário: ' + AObj.Model.CDSCadastroUsu_Nome.AsString);
  FormatarLinha(redtGeral,COR_PADRAO, 'Módulo: ' + AObj.Model.CDSCadastroMod_Nome.AsString);
  FormatarLinha(redtGeral,COR_PADRAO, 'Produto: ' + AObj.Model.CDSCadastroProd_Nome.AsString);
  FormatarLinha(redtGeral,COR_PADRAO, 'Tipo: ' + AObj.Model.CDSCadastroTip_Nome.AsString);
  FormatarLinha(redtGeral,COR_PADRAO, 'Status: ' + AObj.Model.CDSCadastroSta_Nome.AsString);
  FormatarLinha(redtGeral,COR_PADRAO, 'Anexo: ' + AObj.Model.CDSCadastroBas_Anexo.AsString);
  FormatarLinha(redtGeral,COR_PADRAO, StringOfChar(TRACO, TAMANHO_DIVISAO));
  redtGeral.Lines.Add('');
  FormatarLinha(redtGeral,COR_TITULO, 'DESCRIÇÃO', True);
  FormatarLinha(redtGeral,COR_PADRAO, AObj.Model.CDSCadastroBas_Descricao.AsString);
  redtGeral.SelStart := Perform(EM_LINEINDEX, 0, 0);
end;

procedure TfrmBaseConhDetalhe.redtGeralKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.
