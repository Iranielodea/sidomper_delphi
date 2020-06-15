unit uProspect;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBaseCadastro, Data.DB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uDMProspect,
  uProspectController, Vcl.DBCtrls, Vcl.Mask, uFraUsuario, uFraRevenda;

type
  TfrmProspect = class(TfrmBaseCadastro)
    PageControl1: TPageControl;
    tsPrincipal: TTabSheet;
    Panel7: TPanel;
    Label4: TLabel;
    edtCodigo: TDBEdit;
    Label5: TLabel;
    edtNome: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    edtCNPJ: TDBEdit;
    Label8: TLabel;
    dbmEndereco: TDBMemo;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    dbmContato: TDBMemo;
    Label11: TLabel;
    edtUsuario: TDBEdit;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    edtRevenda: TDBEdit;
    DBEdit8: TDBEdit;
    btnUsuario: TSpeedButton;
    btnRevenda: TSpeedButton;
    DBRadioGroup1: TDBRadioGroup;
    Ativo: TDBCheckBox;
    tsEmail: TTabSheet;
    Panel8: TPanel;
    dsEmail: TDataSource;
    dbEmail: TDBGrid;
    Label17: TLabel;
    edtEmail: TDBEdit;
    Label13: TLabel;
    btnNovoEmail: TBitBtn;
    btnExcluirEmail: TBitBtn;
    btnCancelarEmail: TBitBtn;
    btnSalvarEmail: TBitBtn;
    btnEditarEmail: TBitBtn;
    edtDescricaoEmail: TDBEdit;
    tsUsuario: TTabSheet;
    Panel9: TPanel;
    tsRevenda: TTabSheet;
    Panel10: TPanel;
    FraUsuario: TFraUsuario;
    FraRevenda: TFraRevenda;
    procedure dbmEnderecoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbmEnderecoEnter(Sender: TObject);
    procedure dbmEnderecoExit(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure edtCNPJExit(Sender: TObject);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtUsuarioExit(Sender: TObject);
    procedure edtRevendaExit(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure btnRevendaClick(Sender: TObject);
    procedure dbDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbDadosTitleClick(Column: TColumn);
    procedure edtUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnNovoEmailClick(Sender: TObject);
    procedure btnEditarEmailClick(Sender: TObject);
    procedure btnSalvarEmailClick(Sender: TObject);
    procedure btnExcluirEmailClick(Sender: TObject);
    procedure dsEmailStateChange(Sender: TObject);
    procedure btnCancelarEmailClick(Sender: TObject);
    procedure edtEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnFiltroClick(Sender: TObject);
    procedure dbEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FController: TProspectController;
    procedure Localizar(ATexto: string; AIdUsuario: Integer);
    procedure BuscarUsuario(AId, ACodigo: Integer);
    procedure BuscarRevenda(AId, ACodigo: Integer);
    procedure Salvar;

    procedure NovoEmail;
    procedure EditarEmail;
    procedure ExcluirEmail;
    function CancelarEmail: Boolean;
    function SalvarEmail: Boolean;
    procedure ControleEmail;

    procedure MascaraCNPJCPF();
    procedure Inicio(AIdUsuario: Integer; APesquisar: Boolean);
    procedure ControleBotaoSalvar;
    procedure UsuarioPadrao;
    procedure RevendaPadrao(AId: Integer);
  public
    { Public declarations }
    constructor create(APesquisar: Boolean = False); overload;
  end;

var
  frmProspect: TfrmProspect;

implementation

{$R *.dfm}

uses uFiltroProspect, uGrade, uFuncoesSIDomper, uDM, uImagens, uPosicaoBotao,
  uRevendaController, uUsuarioController, uUsuario, uRevenda;

{ TfrmProspect }

procedure TfrmProspect.btnCancelarEmailClick(Sender: TObject);
begin
  inherited;
  FController.Model.CDSEmail.Cancel;
end;

procedure TfrmProspect.btnEditarClick(Sender: TObject);
begin
  FController.Editar(dbDados.Columns[0].Field.AsInteger, Self);
  inherited;
  PageControl1.ActivePageIndex := 0;
  if edtNome.Enabled then
    edtNome.SetFocus;

  ControleEmail;
end;

procedure TfrmProspect.btnEditarEmailClick(Sender: TObject);
begin
  inherited;
  if dsEmail.DataSet.RecordCount = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  dsEmail.DataSet.Edit;
  edtDescricaoEmail.SetFocus;
end;

procedure TfrmProspect.btnExcluirClick(Sender: TObject);
begin
  if TFuncoes.Confirmar('Excluir Registro?') then
  begin
    FController.Excluir(dm.IdUsuario, dbDados.Columns[0].Field.AsInteger);
    inherited;
  end;
end;

procedure TfrmProspect.btnExcluirEmailClick(Sender: TObject);
begin
  inherited;
  if TFuncoes.Confirmar('Confirmar Exclusão?') then
  begin
    FController.ExcluirEmail(dm.IdUsuario, FController.Model.CDSEmailProsEm_Id.AsInteger);
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
  end;
end;

procedure TfrmProspect.btnFiltroClick(Sender: TObject);
begin
  inherited;
  Localizar(edtDescricao.Text, dm.IdUsuario);
end;

procedure TfrmProspect.btnNovoClick(Sender: TObject);
begin
  FController.Novo(dm.IdUsuario);

  inherited;
  PageControl1.ActivePageIndex := 0;

  ControleEmail();

  UsuarioPadrao();

  edtCodigo.SetFocus;
end;

procedure TfrmProspect.btnNovoEmailClick(Sender: TObject);
begin
  inherited;
  FController.Model.CDSEmail.Last;
  edtDescricaoEmail.SetFocus;
  FController.Model.CDSEmail.Append;
end;

procedure TfrmProspect.btnRevendaClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmRevenda.create(true));
  if dm.IdSelecionado > 0 then
    BuscarRevenda(dm.IdSelecionado, 0);
end;

procedure TfrmProspect.btnSalvarClick(Sender: TObject);
begin
  Salvar();
  inherited;
end;

procedure TfrmProspect.btnSalvarEmailClick(Sender: TObject);
begin
  inherited;
  FController.SalvarEmail();
end;

procedure TfrmProspect.btnUsuarioClick(Sender: TObject);
begin
  inherited;
  TFuncoes.CriarFormularioModal(TfrmUsuario.create(true));
  if dm.IdSelecionado > 0 then
    BuscarUsuario(dm.IdSelecionado, 0);
end;

procedure TfrmProspect.BuscarRevenda(AId, ACodigo: Integer);
var
  RevendaController: TRevendaController;
begin
  RevendaController := TRevendaController.Create;
  try
    try
      RevendaController.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtRevenda.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
    FController.Model.CDSCadastroPros_Revenda.AsString := RevendaController.Model.CDSCadastroRev_Id.AsString;
    FController.Model.CDSCadastroRev_Codigo.AsString := RevendaController.Model.CDSCadastroRev_Codigo.AsString;
    FController.Model.CDSCadastroRev_Nome.AsString := RevendaController.Model.CDSCadastroRev_Nome.AsString;

    FreeAndNil(RevendaController);
  end;
  edtRevenda.Modified := False;

end;

procedure TfrmProspect.BuscarUsuario(AId, ACodigo: Integer);
var
  obj: TUsuarioController;
begin
  obj := TUsuarioController.Create;
  try
    try
      obj.Pesquisar(AId, ACodigo);
    except
      On E: Exception do
      begin
        ShowMessage(E.Message);
        edtUsuario.SetFocus;
      end;
    end;
  finally
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);
    FController.Model.CDSCadastroPros_Usuario.AsString := obj.Model.CDSCadastroUsu_Id.AsString;
    FController.Model.CDSCadastroUsu_Codigo.AsString := obj.Model.CDSCadastroUsu_Codigo.AsString;
    FController.Model.CDSCadastroUsu_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;

    FreeAndNil(obj);
  end;
  edtUsuario.Modified := False;
end;

function TfrmProspect.CancelarEmail: Boolean;
begin
  Result := False;
  if tsEmail.Showing then
  begin
    if (FController.Model.CDSEmail.State in [dsEdit, dsInsert]) then
    begin
      btnCancelarEmailClick(Self);
      Result := True;
    end;
  end;
end;

procedure TfrmProspect.ControleBotaoSalvar;
begin
  btnSalvar.Enabled := ((btnSalvarEmail.Enabled = False) and (FController.Model.CDSCadastro.State in [dsEdit, dsInsert]));
end;

procedure TfrmProspect.ControleEmail;
var
  habilitar: Boolean;
begin
  habilitar := edtEmail.Enabled;

  if habilitar = False then
  begin
    btnNovoEmail.Enabled := habilitar;
    btnExcluirEmail.Enabled := habilitar;
    btnCancelarEmail.Enabled := habilitar;
    btnEditarEmail.Enabled := habilitar;
    btnSalvarEmail.Enabled := habilitar;
  end;

  if FController.Model.CDSCadastro.State = dsInsert then
  begin
    btnNovoEmail.Enabled := True;
    btnExcluirEmail.Enabled := True;
    btnCancelarEmail.Enabled := False;
    btnEditarEmail.Enabled := True;
    btnSalvarEmail.Enabled := False;
  end;

  if habilitar then
    dbEmail.Options := dbEmail.Options + [dgEditing]
  else
    dbEmail.Options := dbEmail.Options - [dgEditing];
end;

constructor TfrmProspect.create(APesquisar: Boolean);
begin
  inherited create(nil);
  Inicio(dm.IdUsuario, APesquisar);
end;

procedure TfrmProspect.dbDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    dbDadosDblClick(Self);
    if edtCodigo.Enabled then
      edtCodigo.SetFocus;
  end;
end;

procedure TfrmProspect.dbDadosTitleClick(Column: TColumn);
begin
  inherited;
  TFuncoes.OrdenarCamposGrid(FController.Model.cdsconsulta, Column.FieldName);
end;

procedure TfrmProspect.dbEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  TGrade.DesabilitarTelcasDeleteGrid(Key, Shift);
end;

procedure TfrmProspect.dbmEnderecoEnter(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := False;
end;

procedure TfrmProspect.dbmEnderecoExit(Sender: TObject);
begin
  inherited;
  Self.KeyPreview := True;
end;

procedure TfrmProspect.dbmEnderecoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Sender = dbmEndereco) or (Sender = dbmContato)  then
  begin
    case Key of
      VK_ESCAPE: btnCancelarClick(Self);
      VK_F8:
      begin
        if btnSalvar.Enabled then
          btnSalvarClick(Self);
      end;
    end;
  end;

end;

procedure TfrmProspect.dsEmailStateChange(Sender: TObject);
begin
  inherited;
  if dsEmail.State in [dsEdit, dsInsert] then
    TFuncoes.ModoEdicaoInsercao(FController.Model.CDSCadastro);

  btnSalvarEmail.Enabled := (dsEmail.DataSet.State in [dsEdit, dsInsert]);
  btnCancelarEmail.Enabled := (dsEmail.DataSet.State in [dsEdit, dsInsert]);
  btnEditarEmail.Enabled := (dsEmail.DataSet.State in [dsBrowse]);
  btnExcluirEmail.Enabled := (dsEmail.DataSet.State in [dsBrowse]);
  btnNovoEmail.Enabled := (dsEmail.DataSet.State in [dsBrowse]);
  dbEmail.Enabled := (dsEmail.DataSet.State in [dsBrowse]);

  ControleBotaoSalvar;

end;

procedure TfrmProspect.EditarEmail;
begin
  if (tsEdicao.Showing) and (tsEmail.Showing) and (btnEditarEmail.Enabled) then
    btnEditarEmailClick(Self);
end;

procedure TfrmProspect.edtCNPJExit(Sender: TObject);
begin
  inherited;
  if edtCNPJ.Modified then
    MascaraCNPJCPF();
end;

procedure TfrmProspect.edtDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    Localizar(edtDescricao.Text, dm.IdUsuario);
end;

procedure TfrmProspect.edtEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    btnSalvarEmailClick(Self);
end;

procedure TfrmProspect.edtRevendaExit(Sender: TObject);
begin
  inherited;
  if edtRevenda.Modified then
    BuscarRevenda(0, StrToIntDef(edtRevenda.Text, 0));
end;

procedure TfrmProspect.edtUsuarioExit(Sender: TObject);
begin
  inherited;
  if edtUsuario.Modified then
    BuscarUsuario(0, StrToIntDef(edtUsuario.Text, 0));
end;

procedure TfrmProspect.edtUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = VK_F9 then
  begin
    if Sender = edtUsuario then
      btnUsuarioClick(Self)
    else if Sender = edtRevenda then
      btnRevendaClick(Self);
  end;
end;

procedure TfrmProspect.ExcluirEmail;
begin
  if tsEmail.Showing then
  begin
    if btnExcluirEmail.Enabled then
      btnExcluirEmailClick(Self);
  end;
end;

procedure TfrmProspect.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(FController);
end;

procedure TfrmProspect.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if CancelarEmail then
      Exit;
  end;

  if Key = VK_F8 then
  begin
    if SalvarEmail() then
      Exit;
  end;

  inherited;

  case Key of
    VK_INSERT: NovoEmail();
    VK_F2: EditarEmail();
    VK_ESCAPE: PageControl1.TabIndex := 0;
  end;

  if (Shift = [ssCtrl]) and (Key = VK_DELETE) then
    ExcluirEmail;
end;

procedure TfrmProspect.FormShow(Sender: TObject);
var
  Img: TfrmImagens;
  Botao: TPosicaoBotao;
  iPosicao: Integer;
begin
  inherited;

  PageControl1.TabIndex := 0;

  Img := TfrmImagens.Create(Self);
  try
    btnUsuario.Glyph := Img.btnProcurar.Glyph;
    btnRevenda.Glyph := Img.btnProcurar.Glyph;

    btnNovoEmail.Glyph := Img.btnNovoItem.Glyph;
    btnEditarEmail.Glyph := Img.btnEditar.Glyph;
    btnExcluirEmail.Glyph := Img.btnExcluirItem.Glyph;
    btnCancelarEmail.Glyph := Img.btnCancelarItem.Glyph;
    btnSalvarEmail.Glyph := Img.btnSalvar.Glyph;

  finally
    FreeAndNil(Img);
  end;

  iPosicao := 528;
  Botao := TPosicaoBotao.Create(btnNovoEmail, iPosicao, 500);
  try
    Botao.PosicaoBotao(btnEditarEmail);
    Botao.PosicaoBotao(btnSalvarEmail);
    Botao.PosicaoBotao(btnExcluirEmail);
    Botao.PosicaoBotao(btnCancelarEmail);
  finally
    FreeAndNil(Botao);
  end;
end;

procedure TfrmProspect.Inicio(AIdUsuario: Integer; APesquisar: Boolean);
begin
  FController := TProspectController.Create;
  dsPesquisa.DataSet := FController.Model.CDSConsulta;
  dsCad.DataSet := FController.Model.CDSCadastro;

  dsEmail.DataSet := FController.Model.CDSEmail;

  TGrade.RetornaCamposGrid(dbDados, cbbCampos);
  Localizar('ABCDE', AIdUsuario);

  if APesquisar then
  begin
    cbbSituacao.ItemIndex := 0;
    Pesquisa := APesquisar;
  end;

  FraUsuario.Inicializar();
  FraRevenda.Inicializar();
end;

procedure TfrmProspect.Localizar(ATexto: string; AIdUsuario: Integer);
var
  sCampo: string;
  sSituacao: string;
  bContem: Boolean;
  Filtro: TFiltroProspect;
begin
  sCampo := TGrade.FiltrarCampo(dbDados, cbbCampos);
  sSituacao := Copy(cbbSituacao.Items.Strings[cbbSituacao.ItemIndex], 1, 1);
  bContem := (cbbPesquisa.ItemIndex = 1);

  Filtro := TFiltroProspect.Create;
  try
    Filtro.IdUsuario :=  FraUsuario.RetornoSelecao();
    Filtro.IdRevenda :=  FraRevenda.RetornoSelecao();

    FController.Filtrar(Filtro, sCampo, ATexto, sSituacao, AIdUsuario, bContem);
    FController.Model.CDSConsulta.IndexFieldNames := sCampo;
  finally
    FreeAndNil(Filtro);
  end;
end;

procedure TfrmProspect.MascaraCNPJCPF;
var
  iDoc: Integer;
  sDoc: string;
begin
  if not (FController.Model.CDSCadastro.State in [dsEdit, dsInsert]) then
    Exit;

  sDoc := TFuncoes.SomenteNumeros(edtCNPJ.Text);
  iDoc := Length(sDoc);
  if iDoc > 0 then
  begin
    if iDoc = 11 then
      sDoc := TFuncoes.FormatarMascara('###.###.###-##', sDoc)
    else
      sDoc := TFuncoes.FormatarMascara('##.###.###/####-##', sDoc);

    FController.Model.CDSCadastroPros_Docto.Text := sDoc;
  end;
end;

procedure TfrmProspect.NovoEmail;
begin
  if tsEmail.Showing then
  begin
    if btnNovoEmail.Enabled then
      btnNovoEmailClick(Self);
  end;
end;

procedure TfrmProspect.RevendaPadrao(AId: Integer);
var
  Revenda: TRevendaController;
begin
  if AId > 0 then
  begin
    Revenda := TRevendaController.Create;
    try
      Revenda.LocalizarId(AId);
      FController.Model.CDSCadastroPros_Revenda.AsString := Revenda.Model.CDSCadastroRev_Id.AsString;
      FController.Model.CDSCadastroRev_Codigo.AsString := Revenda.Model.CDSCadastroRev_Codigo.AsString;
      FController.Model.CDSCadastroRev_Nome.AsString := Revenda.Model.CDSCadastroRev_Nome.AsString;
    finally
      FreeAndNil(Revenda);
    end;
    edtRevenda.Modified := False;
  end;
end;

procedure TfrmProspect.Salvar;
var
  bInclusao: Boolean;
begin
  bInclusao := (FController.Model.CDSCadastro.State = dsInsert);
  FController.Salvar(dm.IdUsuario);
  FController.FiltrarCodigo(FController.Model.CDSCadastroPros_Codigo.AsInteger);
  PageControl1.TabIndex := 0;
end;

function TfrmProspect.SalvarEmail: Boolean;
begin
  Result := False;
  if (tsEdicao.Showing) and (tsEmail.Showing)  then
  begin
    if btnSalvarEmail.Enabled then
    begin
      btnSalvarEmailClick(Self);
      Result := True;
    end;
  end;
end;

procedure TfrmProspect.UsuarioPadrao;
var
  usuario: TUsuarioController;
begin
  usuario := TUsuarioController.Create;
  try
    usuario.LocalizarId(dm.IdUsuario);
    FController.Model.CDSCadastroPros_Usuario.AsInteger := usuario.Model.CDSCadastroUsu_Id.AsInteger;
    FController.Model.CDSCadastroUsu_Codigo.AsInteger := usuario.Model.CDSCadastroUsu_Codigo.AsInteger;
    FController.Model.CDSCadastroUsu_Nome.AsString := usuario.Model.CDSCadastroUsu_Nome.AsString;

    RevendaPadrao(usuario.Model.CDSCadastroUsu_Revenda.AsInteger);
  finally
    FreeAndNil(usuario);
  end;
  edtUsuario.Modified := False;
end;

end.
