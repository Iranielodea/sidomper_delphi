unit uVisitaController;

interface

uses
  System.SysUtils, uDMVisita, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  Data.DBXJSON , Data.DBXJSONReflect, uFiltroVisita, uTipoController, uTipoVO,
  uConverter, uDMRelChamado, uChamadoVO, System.Generics.Collections;

type
  TVisitaController = class
  private
    FModel: TDMVisita;
    FOperacao: TOperacao;
    procedure Post;
    procedure Relatorio01(AFiltro: TFiltroVisita; AModelo, AIdUsuario: Integer);
    procedure Relatorio02(AFiltro: TFiltroVisita; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure Relatorio03(AFiltro: TFiltroVisita; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure Relatorio04(AFiltro: TFiltroVisita; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure Relatorio05(AFiltro: TFiltroVisita; AModelo, AIdUsuario: Integer);
    procedure Relatorio06(AFiltro: TFiltroVisita; AModelo, AIdUsuario: Integer);
    procedure Relatorio07(AFiltro: TFiltroVisita; AModelo, AIdUsuario: Integer);
    procedure Relatorio08(AFiltro: TFiltroVisita; AModelo, AIdUsuario: Integer;
        AOrdem: string);


    procedure ObservacaoPadrao;
    procedure TipoUmRegistro;
    procedure AtualizaVersao(AIdCliente, AIdTipo: Integer; AVersao: string);
  public
    function CodigoAtual: Integer;
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure Filtrar(APrograma: Integer; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarVisita(AFiltro: TFiltroVisita; ACampo, ATexto: string; AIdUsuario:
        Integer; AContem: Boolean = False);
    procedure LocalizarId(AId: Integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    procedure Pesquisar(AId: Integer);
    procedure ModoEdicaoInsercao;

    property Model: TDMVisita read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
    procedure Relatorio(AFiltro: TFiltroVisita; AModelo, AIdUsuario: Integer; AOrdem:
        string);
    function RetornarEmails(AIdVisita, AIdUsuario, AIdStatus: Integer): string;
    function RetornarEmailsCliente(AIdVisita: Integer): string;

  end;

implementation

{ TSolicitacaoController }

uses uFuncoesSIDomper, uUsuarioController, uClienteController, uClienteModuloController,
  uSolicitacaoStatusVO, uDMRelVisita, uObsevacaoController;

procedure TVisitaController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CVisitaPrograma, ACodigo);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TVisitaController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroVis_Id.AsInteger;
end;

procedure TVisitaController.AtualizaVersao(AIdCliente, AIdTipo: Integer;
  AVersao: string);
var
  Negocio: TServerMethods1Client;
  sResult: string;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      sResult := Negocio.VisitaAtualizacaoVersao(AIdCliente, AIdTipo, AVersao);
      if sResult <> '' then
        raise Exception.Create(sResult);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

constructor TVisitaController.Create;
begin
  inherited Create;
  FModel := TDMVisita.Create(nil);
end;

destructor TVisitaController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TVisitaController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CVisitaPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CVisitaPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.Filtrar(APrograma:Integer; ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(APrograma, ACampo, ATexto,  AAtivo, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.FiltrarVisita(AFiltro: TFiltroVisita; ACampo, ATexto:
    string; AIdUsuario: Integer; AContem: Boolean = False);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarVisita(oObjetoJSON, ACampo, ATexto, AIdUsuario, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CVisitaPrograma, AIdUsuario);
    dm.Desconectar;
//    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CVisitaPrograma, AId);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.ModoEdicaoInsercao;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSCadastro);
end;

procedure TVisitaController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  Cliente: TClienteController;
  Usuario: TUsuarioController;
  IdCliente: Integer;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CVisitaPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

//------------------------------------------------------------------------------
// usuario logado
    Usuario := TUsuarioController.Create;
    try
      Usuario.LocalizarId(AIdUsuario);
      FModel.CDSCadastroVis_Usuario.AsInteger := Usuario.Model.CDSCadastroUsu_Id.AsInteger;
      FModel.CDSCadastroUsu_Codigo.AsInteger := Usuario.Model.CDSCadastroUsu_Codigo.AsInteger;
      FModel.CDSCadastroUsu_Nome.AsString := Usuario.Model.CDSCadastroUsu_Nome.AsString;
      IdCliente := Usuario.Model.CDSCadastroUsu_Cliente.AsInteger;
    finally
      FreeAndNil(Usuario);
    end;

//------------------------------------------------------------------------------
// Cliente do usuario logado
    if IdCliente > 0 then
    begin
      Cliente := TClienteController.Create;
      try
        Cliente.LocalizarId(IdCliente);
        FModel.CDSCadastroVis_Cliente.AsInteger := IdCliente;
        FModel.CDSCadastroCli_Codigo.AsInteger := Cliente.Model.CDSCadastroCli_Codigo.AsInteger;
        FModel.CDSCadastroCli_Nome.AsString := Cliente.Model.CDSCadastroCli_Nome.AsString;
      finally
        FreeAndNil(Cliente);
      end;
    end;

    ObservacaoPadrao();
    TipoUmRegistro();

    FOperacao := opIncluir;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.ObservacaoPadrao;
var
  Obs: TObservacaoController;
begin
  Obs := TObservacaoController.Create;
  try
    Obs.LocalizarPadrao(prVisita);
    FModel.CDSCadastroVis_Descricao.AsString := Obs.Model.CDSCadastroObs_Descricao.AsString;
  finally
    FreeAndNil(Obs);
  end;
end;

procedure TVisitaController.Pesquisar(AId: Integer);
begin
  LocalizarId(AId);
  if FModel.CDSCadastroVis_Id.AsInteger = 0 then
    raise Exception.Create('Solicita��o n�o Encontrada.');
end;

procedure TVisitaController.Post;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Post;
end;


function TVisitaController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CVisitaPrograma).ToString);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.Relatorio(AFiltro: TFiltroVisita; AModelo,
  AIdUsuario: Integer; AOrdem: string);
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

  case AModelo of
    1: Relatorio01(AFiltro, AModelo, AIdUsuario);
    2: Relatorio02(AFiltro, AModelo, AIdUsuario, AOrdem);
    3: Relatorio03(AFiltro, AModelo, AIdUsuario, AOrdem);
    4: Relatorio04(AFiltro, AModelo, AIdUsuario, AOrdem);
    5: Relatorio05(AFiltro, AModelo, AIdUsuario);
    6: Relatorio06(AFiltro, AModelo, AIdUsuario);
    7: Relatorio07(AFiltro, AModelo, AIdUsuario);
    8: Relatorio08(AFiltro, AModelo, AIdUsuario, AOrdem);
  end;

end;

procedure TVisitaController.Relatorio01(AFiltro: TFiltroVisita; AModelo,
  AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelVisita;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  rel := TDMRelVisita.Create(nil);

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    rel.CDSRelVisitaModelo1.Close;
    Negocio.RelatorioVisita(AModelo, AIdUsuario, oObjetoJSON, '');
    rel.lblPeriodoModelo1.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
    rel.RelVisitaModelo1.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TVisitaController.Relatorio02(AFiltro: TFiltroVisita; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelVisita;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  rel := TDMRelVisita.Create(nil);

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    rel.CDSRelVisitaModelo2.Close;
    Negocio.RelatorioVisita(AModelo, AIdUsuario, oObjetoJSON, AOrdem);
    rel.lblPeriodoModelo2.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
    rel.RelVisitaModelo2.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TVisitaController.Relatorio03(AFiltro: TFiltroVisita; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelVisita;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  rel := TDMRelVisita.Create(nil);

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    rel.CDSRelVisitaModelo3.Close;
    Negocio.RelatorioVisita(AModelo, AIdUsuario, oObjetoJSON, AOrdem);
    rel.lblPeriodoModelo3.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
    rel.RelVisitaModelo3.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TVisitaController.Relatorio04(AFiltro: TFiltroVisita; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelVisita;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  rel := TDMRelVisita.Create(nil);

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    rel.CDSRelVisitaModelo4.Close;
    Negocio.RelatorioVisita(AModelo, AIdUsuario, oObjetoJSON, AOrdem);
    rel.lblPeriodoModelo4.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
    rel.RelVisitaModelo4.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TVisitaController.Relatorio05(AFiltro: TFiltroVisita; AModelo,
  AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
//  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
  sOrdem: string;
  sMesAnoInicial: string;
  sMesAnoFinal: string;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

  if AFiltro.DataInicial.Trim = DataEmBranco then
    raise Exception.Create('Informe a Data Inicial!');

  if AFiltro.DataFinal.Trim = DataEmBranco then
    raise Exception.Create('Informe a Data Final!');


  if AFiltro.DataInicial <> DataEmBranco then
  begin
    sMesAnoInicial := FormatDateTime('mm', StrToDate(AFiltro.DataInicial));
    sMesAnoInicial := sMesAnoInicial + '/';
    sMesAnoInicial := sMesAnoInicial + FormatDateTime('yyyy', StrToDate(AFiltro.DataInicial));
  end;

  if AFiltro.DataFinal <> DataEmBranco then
  begin
    sMesAnoFinal := FormatDateTime('mm', StrToDate(AFiltro.DataFinal));
    sMesAnoFinal := sMesAnoFinal + '/';
    sMesAnoFinal := sMesAnoFinal + FormatDateTime('yyyy', StrToDate(AFiltro.DataFinal));
  end;


// serializa o objeto
//  Marshal := TJSONMarshal.Create;
//  try
//    oObjetoJSON := Marshal.Marshal(AFiltro);
//  finally
//    FreeAndNil(Marshal);
//  end;
  sOrdem := '';

  oObjetoJSON := TConverte.ObjectToJSON<TFiltroVisita>(AFiltro);

  rel := TDMRelChamado.Create(nil);

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    rel.CDSRelChamadoModelo6.Close;
    Negocio.RelatorioVisita(AModelo, AIdUsuario, oObjetoJSON, sOrdem);
    rel.lblRelatorioVisita5.Caption := 'Per�odo de ' + sMesAnoInicial + ' At� ' + sMesAnoFinal;
    rel.RelVisitaModelo5.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TVisitaController.Relatorio06(AFiltro: TFiltroVisita; AModelo,
  AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
  sOrdem: string;
  sMesAnoInicial: string;
  sMesAnoFinal: string;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

  if AFiltro.DataInicial.Trim = DataEmBranco then
    raise Exception.Create('Informe a Data Inicial!');

  if AFiltro.DataFinal.Trim = DataEmBranco then
    raise Exception.Create('Informe a Data Final!');

  if AFiltro.DataInicial <> DataEmBranco then
  begin
    sMesAnoInicial := FormatDateTime('mm', StrToDate(AFiltro.DataInicial));
    sMesAnoInicial := sMesAnoInicial + '/';
    sMesAnoInicial := sMesAnoInicial + FormatDateTime('yyyy', StrToDate(AFiltro.DataInicial));
  end;

  if AFiltro.DataFinal <> DataEmBranco then
  begin
    sMesAnoFinal := FormatDateTime('mm', StrToDate(AFiltro.DataFinal));
    sMesAnoFinal := sMesAnoFinal + '/';
    sMesAnoFinal := sMesAnoFinal + FormatDateTime('yyyy', StrToDate(AFiltro.DataFinal));
  end;

  sOrdem := '';

  oObjetoJSON := TConverte.ObjectToJSON<TFiltroVisita>(AFiltro);

  rel := TDMRelChamado.Create(nil);

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    rel.CDSRelChamadoModelo6.Close;
    Negocio.RelatorioVisita(AModelo, AIdUsuario, oObjetoJSON, sOrdem);
    rel.lblRelatorioVisita6.Caption := 'Per�odo de ' + sMesAnoInicial + ' At� ' + sMesAnoFinal;
    rel.RelVisitaModelo6.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TVisitaController.Relatorio07(AFiltro: TFiltroVisita; AModelo,
  AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  oObjetoJSON : TJSONValue;
  retorno: TJSONValue;
  rel: TDMRelVisita;
  lista: TObjectList<TRelChamadoVO>;
begin
  oObjetoJSON := TConverte.ObjectToJSON<TFiltroVisita>(AFiltro);

  dm.Conectar;
  rel := TDMRelVisita.Create(nil);
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    retorno := Negocio.RelatorioVisita2(AModelo, AIdUsuario, oObjetoJSON);
    lista := TConverte.JSONToObject<TListaRelChamado>(retorno);
    rel.ImpressaoRelatorioModelo7(lista, AFiltro.QtdeDias.ToString);
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
    FreeAndNil(lista);
    dm.Desconectar;
  end;
end;

procedure TVisitaController.Relatorio08(AFiltro: TFiltroVisita; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelVisita;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  rel := TDMRelVisita.Create(nil);

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    rel.CDSRelVisitaModelo8.Close;
    Negocio.RelatorioVisita(AModelo, AIdUsuario, oObjetoJSON, AOrdem);
    rel.lblPeriodoModelo8.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
    rel.RelVisitaModelo8.Print;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

function TVisitaController.RetornarEmails(AIdVisita, AIdUsuario,
  AIdStatus: Integer): string;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.RetornarVisitaEmails(AIdVisita, AIdUsuario, AIdStatus);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TVisitaController.RetornarEmailsCliente(AIdVisita: Integer): string;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.RetornarVisitaEmailCliente(AIdVisita, dm.IdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  lOperacao: TOperacao;
//  Marshal : TJSONMarshal;
//  oObjetoJSON : TJSONValue;
//  obj: TSolicitacaoStatusVO;
  IdSolicitacao: Integer;
begin
  if TFuncoes.DataEmBrancoNula(FModel.CDSCadastroVis_Data.AsString) then
    raise Exception.Create('Informe a Data!');

  if FModel.CDSCadastroVis_HoraInicio.AsString = '' then
    raise Exception.Create('Informe a Hora Inicial.');

  if FModel.CDSCadastroVis_HoraFim.AsString = '' then
    raise Exception.Create('Informe a Hora Final.');

  if FModel.CDSCadastroVis_HoraInicio.AsDateTime > FModel.CDSCadastroVis_HoraFim.AsDateTime then
    raise Exception.Create('Hora Inicial maior que Hora Final.');

  if FModel.CDSCadastroVis_Usuario.AsInteger = 0 then
    raise Exception.Create('Informe o Consultor!');

  if FModel.CDSCadastroVis_Cliente.AsInteger = 0 then
    raise Exception.Create('Informe o Cliente!');

  if FModel.CDSCadastroVis_Tipo.AsInteger = 0 then
    raise Exception.Create('Informe o Tipo!');

  if FModel.CDSCadastroVis_Status.AsInteger = 0 then
    raise Exception.Create('Informe o Status!');

  if Trim(FModel.CDSCadastroVis_Descricao.AsString) = '' then
    raise Exception.Create('Informe a Descri��o!');

  if Trim(FModel.CDSCadastroVis_Anexo.asstring) <> '' then
  begin
    if not FileExists(FModel.CDSCadastroVis_Anexo.asstring) then
      raise Exception.Create('Arquivo do Anexo n�o Existe');
  end;

  lOperacao := FOperacao;
  try
    dm.Conectar;
    Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
    try

      if FOperacao = opIncluir then
        FModel.CDSCadastroVis_Id.AsInteger := Negocio.ProximoId(CVisitaPrograma).AsInt;

      FModel.CDSCadastroVis_HoraInicio.AsString := FormatDateTime('hh:mm', FModel.CDSCadastroVis_HoraInicio.AsDateTime);
      FModel.CDSCadastroVis_HoraFim.AsString := FormatDateTime('hh:mm', FModel.CDSCadastroVis_HoraFim.AsDateTime);

      Post();

      if FModel.CDSCadastro.ChangeCount > 0 then
        FModel.CDSCadastro.ApplyUpdates(0);

      AtualizaVersao(FModel.CDSCadastroVis_Cliente.AsInteger, FModel.CDSCadastroVis_Tipo.AsInteger, FModel.CDSCadastroVis_Versao.AsString);

      //dm.Conectar;
//      Negocio.Salvar(CVisitaPrograma, DM.IdUsuario);

      dm.IdCadastro := FModel.CDSCadastroVis_Id.AsInteger;

//      Negocio.Commit;

      FOperacao := opNavegar;
      dm.Desconectar;
    except
      ON E: Exception do
      begin
        FOperacao := lOperacao;
//        Negocio.Roolback;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVisitaController.TipoUmRegistro;
var
  obj: TTipoController;
  Model: TTipoVO;
begin
  obj := TTipoController.Create;
  try
    Model := obj.RetornoUmRegistro(prVisita);
    if Model.Id > 0 then
    begin
      FModel.CDSCadastrovis_Tipo.AsInteger := Model.Id;
      FModel.CDSCadastroTip_Codigo.AsInteger := Model.Codigo;
      FModel.CDSCadastroTip_Nome.AsString := Model.Nome;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Model);
  end;
end;

end.
