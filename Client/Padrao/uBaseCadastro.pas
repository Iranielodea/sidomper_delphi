unit uBaseCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ImgList, Vcl.Grids, Vcl.DBGrids, Data.DB, uGrade,
  Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  uImagens, uFuncoesSIDomper;

type
  TfrmBaseCadastro = class(TForm)
    pgControl: TPageControl;
    tsPesquisa: TTabSheet;
    tsEdicao: TTabSheet;
    tsFiltro: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    btnNovo: TBitBtn;
    btnEditar: TBitBtn;
    btnExcluir: TBitBtn;
    btnFiltrar: TBitBtn;
    btnSair: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    Panel3: TPanel;
    Panel4: TPanel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel5: TPanel;
    Panel6: TPanel;
    btnFiltro: TBitBtn;
    btnImprimir: TBitBtn;
    btnFecharFiltro: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cbbCampos: TComboBox;
    edtDescricao: TEdit;
    Label2: TLabel;
    dbDados: TDBGrid;
    dsPesquisa: TDataSource;
    dsCad: TDataSource;
    btnPrimeiro: TBitBtn;
    btnUltimo: TBitBtn;
    BalloonHint1: TBalloonHint;
    PageControl2: TPageControl;
    tsGeral: TTabSheet;
    pnlGeral: TPanel;
    Situa��o: TLabel;
    cbbSituacao: TComboBox;
    cbbPesquisa: TComboBox;
    Label3: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFiltroClick(Sender: TObject);
    procedure btnFecharFiltroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbDadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbDadosDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsCadStateChange(Sender: TObject);
    procedure dbDadosTitleClick(Column: TColumn);
    procedure cbbCamposClick(Sender: TObject);
  private
    FPesquisa: Boolean;
    FPosicaoGrade: Integer;
    { Private declarations }
    procedure TelaPesquisar;
    procedure TelaEdicao;
    procedure TelaFiltro;
    procedure Novo;
    procedure Editar;
    procedure Excluir;
    procedure Salvar;
    procedure Filtrar;
    procedure Filtro;
    procedure NavegarPrimeiroRegistro;
    procedure NavegarAnterior;
    procedure NavegarProximo;
    procedure NavegarUltimoRegistro;
    procedure NavegarRegistroAnterior;
    procedure NavegarProximoRegistro;
    procedure Imprimir;
    procedure Navegar;
    procedure Selecionar;
    procedure Ordenar;

  public
    { Public declarations }
    property Pesquisa: Boolean read FPesquisa write FPesquisa;
  end;

var
  frmBaseCadastro: TfrmBaseCadastro;

implementation

{$R *.dfm}

uses uDM, uPosicaoBotao;

procedure TfrmBaseCadastro.btnFecharFiltroClick(Sender: TObject);
begin
  TelaPesquisar;
end;

procedure TfrmBaseCadastro.btnPrimeiroClick(Sender: TObject);
begin
  if dsPesquisa.DataSet.Active then
    dsPesquisa.DataSet.First;
end;

procedure TfrmBaseCadastro.btnProximoClick(Sender: TObject);
begin
  if dsPesquisa.DataSet.Active then
    dsPesquisa.DataSet.Next;
end;

procedure TfrmBaseCadastro.btnEditarClick(Sender: TObject);
begin
  TelaEdicao;
end;

procedure TfrmBaseCadastro.btnExcluirClick(Sender: TObject);
begin
  try
    edtDescricao.SetFocus;
  except
    // nada
  end;
end;

procedure TfrmBaseCadastro.btnCancelarClick(Sender: TObject);
begin
  TelaPesquisar;
end;

procedure TfrmBaseCadastro.btnFiltrarClick(Sender: TObject);
begin
  TelaFiltro;
end;

procedure TfrmBaseCadastro.btnFiltroClick(Sender: TObject);
begin
  TelaPesquisar;
end;

procedure TfrmBaseCadastro.btnNovoClick(Sender: TObject);
begin
  TFuncoes.HabilitarCampo(Self, True);
  FPosicaoGrade := 0;
  TelaEdicao;
end;

procedure TfrmBaseCadastro.btnAnteriorClick(Sender: TObject);
begin
  if dsPesquisa.DataSet.Active then
    dsPesquisa.DataSet.Prior;
end;

procedure TfrmBaseCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBaseCadastro.btnSalvarClick(Sender: TObject);
begin
  TelaPesquisar;
end;

procedure TfrmBaseCadastro.btnUltimoClick(Sender: TObject);
begin
  if dsPesquisa.DataSet.Active then
    dsPesquisa.DataSet.Last;
end;

procedure TfrmBaseCadastro.cbbCamposClick(Sender: TObject);
begin
  Ordenar();
end;

procedure TfrmBaseCadastro.dbDadosDblClick(Sender: TObject);
begin
  if btnEditar.Visible then
  begin
    btnEditar.Click;
    TelaEdicao;
  end;
end;

procedure TfrmBaseCadastro.dbDadosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsPesquisa.DataSet, dbDados, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmBaseCadastro.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btnEditar.Click;
end;

procedure TfrmBaseCadastro.dbDadosTitleClick(Column: TColumn);
var
  i: Integer;
begin
  for I := 0 to cbbCampos.Items.Count-1 do
  begin
    if cbbCampos.Items[i] = Column.Title.Caption then
    begin
      cbbCampos.ItemIndex := i;
      Break;
    end;
  end;
end;

procedure TfrmBaseCadastro.dsCadStateChange(Sender: TObject);
begin
  btnSalvar.Enabled := dsCad.DataSet.State in [dsEdit, dsInsert];
end;

procedure TfrmBaseCadastro.Editar;
begin
  if dsPesquisa.DataSet.RecordCount > 0 then
    FPosicaoGrade := dsPesquisa.DataSet.RecNo;

  if tsPesquisa.Showing then
  begin
    try
      if btnEditar.Visible then
        btnEditar.Click;
    except
      // nada
    end;
  end;
end;

procedure TfrmBaseCadastro.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    cbbPesquisa.SetFocus;
  end;
end;

procedure TfrmBaseCadastro.Excluir;
begin
  if tsPesquisa.Showing then
  begin
    if btnExcluir.Visible then
    begin
      btnExcluir.SetFocus;
      btnExcluir.Click;
    end;
  end;
end;

procedure TfrmBaseCadastro.Filtrar;
begin
  if tsPesquisa.Showing then
  begin
    btnFiltrar.SetFocus;
    btnFiltrar.Click;
  end;
end;

procedure TfrmBaseCadastro.Filtro;
begin
  if tsFiltro.Showing then
  begin
    btnFiltro.SetFocus;
    btnFiltro.Click;
  end;
end;

procedure TfrmBaseCadastro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
    dsPesquisa.DataSet.Close;
    dsCad.DataSet.Close;
  except
    //
  end;

  Action := caFree;
end;

procedure TfrmBaseCadastro.FormCreate(Sender: TObject);
var
  Imagem: TfrmImagens;
begin
  Imagem := TfrmImagens.Create(Self);
  try
    btnPrimeiro.Glyph := Imagem.btnPrimeiro.Glyph;
    btnAnterior.Glyph := Imagem.btnAnterior.Glyph;
    btnProximo.Glyph := Imagem.btnProximo.Glyph;
    btnUltimo.Glyph := Imagem.btnUltimo.Glyph;
    btnNovo.Glyph := Imagem.btnNovo.Glyph;
    btnEditar.Glyph := Imagem.btnEditar.Glyph;
    btnExcluir.Glyph := Imagem.btnExcluir.Glyph;
    btnFiltrar.Glyph := Imagem.btnFiltrar.Glyph;
    btnSair.Glyph := Imagem.btnSair.Glyph;
    btnSalvar.Glyph := Imagem.btnSalvar.Glyph;
    btnCancelar.Glyph := Imagem.btnCancelar.Glyph;
    btnFiltro.Glyph := Imagem.btnFiltro.Glyph;
    btnImprimir.Glyph := Imagem.btnImprimir.Glyph;
    btnPrimeiro.Glyph := Imagem.btnPrimeiro.Glyph;
    btnFecharFiltro.Glyph := Imagem.btnRetornar.Glyph;

  finally
    FreeAndNil(Imagem);
  end;
end;

procedure TfrmBaseCadastro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_INSERT : Novo;
    VK_F2     : Editar;
    VK_F3     : Filtrar;
    VK_F4     : Filtro;
    VK_F7     : Imprimir;
    VK_F8     : Salvar;
    VK_F12    : Selecionar;
    VK_ESCAPE :
    begin
      if tsPesquisa.Showing then
        Close
      else begin
        if tsEdicao.Showing then
        begin
          if dsCad.DataSet.State in [dsEdit, dsInsert] then
          begin
            begin
              btnCancelar.SetFocus;
              btnCancelarClick(Self);
            end;
  //          raise Exception.Create('Salve ou Cancele para Sair.');
          end
          else
            TelaPesquisar;
        end
        else
          TelaPesquisar;
//        try
//          edtDescricao.SetFocus;
//        except
//          // nada
//        end;
      end;
    end;
  end;

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    Excluir;

  if (Shift = [ssCtrl]) and (Key = 79) then // CTRL + O
    NavegarProximo;

  if (Shift = [ssCtrl]) and (Key = 73) then // CTRL + I
    NavegarAnterior;

//  if (Shift = [ssCtrl]) and (Key = VK_HOME) then // CTRL + HOME
  if Key = VK_LEFT then
  begin
    if edtDescricao.Focused then
      NavegarPrimeiroRegistro;
  end;

//  if (Shift = [ssCtrl]) and (Key = VK_END) then // CTRL + END
  if Key = VK_RIGHT then
  begin
    if edtDescricao.Focused then
      NavegarUltimoRegistro;
  end;

//  if (Shift = [ssCtrl]) and (Key = VK_UP) then // CTRL + ^
  if Key = VK_UP then
  begin
    if edtDescricao.Focused then
      NavegarRegistroAnterior;
  end;

//  if (Shift = [ssCtrl]) and (Key = VK_DOWN) then // CTRL + v
  if Key = VK_DOWN then
  begin
    if edtDescricao.Focused then
      NavegarProximoRegistro;
  end;

end;

procedure TfrmBaseCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmBaseCadastro.FormShow(Sender: TObject);
//var
//  i: Integer;
var
  Botao: TPosicaoBotao;
  iPosicao: Integer;
begin
  TelaPesquisar;
  pgControl.TabIndex := 0;
  PageControl2.TabIndex := 0;

//  FGrade := TGrade.Create;
//  for i := 0 to dbDados.Columns.Count -1 do
//    cbbCampos.Items.Add(dbDados.Columns[i].Title.Caption);
//  cbbCampos.ItemIndex := 1;

  if edtDescricao.Visible then
    edtDescricao.SetFocus;

end;

procedure TfrmBaseCadastro.Imprimir;
begin
  if tsFiltro.Showing then
  begin
    btnImprimir.SetFocus;
    btnImprimir.Click;
  end;
end;

procedure TfrmBaseCadastro.Navegar;
var
  sCampo: string;
  i: Integer;
begin
  for I := 0 to dbDados.Columns.Count -1 do
  begin
    if dbDados.Columns[i].Title.Caption = cbbCampos.Text then
    begin
      sCampo := dbDados.Columns[i].FieldName;
      Break;
    end;
  end;
  (dsPesquisa.DataSet as TClientDataSet).IndexFieldNames := sCampo;
end;

procedure TfrmBaseCadastro.NavegarAnterior;
begin
  if tsPesquisa.Showing then
  begin
    if cbbCampos.ItemIndex = 0   then
      cbbCampos.ItemIndex := 1;

    cbbCampos.ItemIndex := cbbCampos.ItemIndex - 1;
    Navegar();
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmBaseCadastro.NavegarPrimeiroRegistro;
begin
  if tsPesquisa.Showing then
    btnPrimeiro.Click;
end;

procedure TfrmBaseCadastro.NavegarProximo;
begin
  if tsPesquisa.Showing then
  begin
    cbbCampos.ItemIndex := cbbCampos.ItemIndex + 1;
    Navegar();
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmBaseCadastro.NavegarProximoRegistro;
begin
  if tsPesquisa.Showing then
    btnProximo.Click;
end;

procedure TfrmBaseCadastro.NavegarRegistroAnterior;
begin
  if tsPesquisa.Showing then
    btnAnterior.Click;
end;

procedure TfrmBaseCadastro.NavegarUltimoRegistro;
begin
  if tsPesquisa.Showing then
    btnUltimo.Click;
//    btnEditar.Click;
end;

procedure TfrmBaseCadastro.Novo;
begin
  if tsPesquisa.Showing then
  begin
    if btnNovo.Visible then
      btnNovo.Click;
  end;
end;

procedure TfrmBaseCadastro.Ordenar;
var
  i: Integer;
begin
  if not dsPesquisa.DataSet.Active then
    Exit;

  if not dsPesquisa.DataSet.IsEmpty then
  begin
    for i := 0 to dbDados.Columns.Count-1 do
    begin
      if cbbCampos.Text = dbDados.Columns[i].Title.Caption then
      begin
        (dsPesquisa.DataSet as TClientDataSet).IndexFieldNames := dbDados.Columns[i].FieldName;
        Break;
      end;
    end;
  end;
end;

procedure TfrmBaseCadastro.Salvar;
begin
  if tsEdicao.Showing then
  begin
    if btnSalvar.Enabled then
    begin
      btnSalvar.SetFocus;
      btnSalvar.Click;
    end;
  end;
end;

procedure TfrmBaseCadastro.Selecionar;
begin
  if tsPesquisa.Showing then
  begin
    if dsPesquisa.DataSet.RecordCount > 0 then
    begin
      if FPesquisa then
      begin
        dm.IdSelecionado := dbDados.Columns[0].Field.AsInteger;
        Close;
      end;
    end;
  end;
end;

procedure TfrmBaseCadastro.TelaEdicao;
begin
  tsPesquisa.TabVisible := False;
  tsEdicao.TabVisible := True;
  tsFiltro.TabVisible := False;
end;

procedure TfrmBaseCadastro.TelaFiltro;
begin
  tsPesquisa.TabVisible := False;
  tsEdicao.TabVisible := False;
  tsFiltro.TabVisible := True;
end;

procedure TfrmBaseCadastro.TelaPesquisar;
begin
  tsPesquisa.TabVisible := True;
  tsEdicao.TabVisible := False;
  tsFiltro.TabVisible := False;

  PageControl2.TabIndex := 0;
  pgControl.TabIndex := 0;
  try
    if FPosicaoGrade > 0 then
      dsPesquisa.DataSet.RecNo := FPosicaoGrade;
    edtDescricao.SetFocus;
  except
    // nada
  end;

end;

end.
