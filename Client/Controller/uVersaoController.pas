unit uVersaoController;

interface

uses
  System.SysUtils, uDMVersao, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  Data.DBXJSON , Data.DBXJSONReflect, uFiltroVersao, uTipoController, uTipoVO;

type
  TVersaoController = class
  private
    FModel: TDMVersao;
    FOperacao: TOperacao;
    procedure Post;
    procedure ObservacaoPadrao;
    procedure TipoUmRegistro;
  public
    function CodigoAtual: Integer;
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure Filtrar(APrograma: Integer; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarVersao(AFiltro: TFiltroVersao; ACampo, ATexto: string; AContem:
        Boolean = False);
    procedure LocalizarId(AId: Integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, Id: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    procedure Pesquisar(AId: Integer);
    procedure LocalizarVersao(AVersao: string);
    function BuscarStatusVersaoDesenvolvimento(): Integer;

    procedure Relatorio01(AIdVersao: Integer);
    procedure Relatorio02(AIdVersao: Integer; AFiltro: TFiltroVersao);
    procedure Relatorio03(AIdVersao: Integer; AFiltro: TFiltroVersao);

    procedure ModoEdicaoInsercao;

    property Model: TDMVersao read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TSolicitacaoController }

uses uFuncoesSIDomper, uUsuarioController, uClienteController, uDMRelVersao,
  uObsevacaoController, uConverter;

procedure TVersaoController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CVersaoPrograma, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TVersaoController.CodigoAtual: Integer;
begin
  Result := FModel.CDSCadastroVer_Id.AsInteger;
end;

function TVersaoController.BuscarStatusVersaoDesenvolvimento: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.VersaoBuscarStatusDesenvolvimento();
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

constructor TVersaoController.Create;
begin
  inherited Create;
  FModel := TDMVersao.Create(nil);
end;

destructor TVersaoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TVersaoController.Editar(AId: Integer; AFormulario: TForm);
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
    Resultado := Negocio.Editar(CVersaoPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.Excluir(AIdUsuario, Id: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if Id = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CVersaoPrograma, AIdUsuario, Id);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.Filtrar(APrograma:Integer; ACampo, ATexto, AAtivo: string;
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
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVersaoController.FiltrarVersao(AFiltro: TFiltroVersao; ACampo, ATexto:
    string; AContem: Boolean = False);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataLiberacaoInicial, AFiltro.DataLiberacaoFinal);

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
    Negocio.FiltrarVersao(oObjetoJSON, ACampo, ATexto, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TVersaoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CVersaoPrograma, AIdUsuario);
//    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CVersaoPrograma, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.LocalizarVersao(AVersao: string);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Negocio.LocalizarVersao(AVersao);
      FModel.CDSCadastro.Open;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TVersaoController.LocalizarVersao');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.ModoEdicaoInsercao;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSCadastro);
end;

procedure TVersaoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  Cliente: TClienteController;
  Usuario: TUsuarioController;
begin
  dm.Conectar;
  Usuario := TUsuarioController.Create;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CVersaoPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;

//------------------------------------------------------------------------------
// usuario padrao
    Usuario.LocalizarId(AIdUsuario);
    FModel.CDSCadastroVer_Usuario.AsInteger := Usuario.Model.CDSCadastroUsu_Id.AsInteger;
    FModel.CDSCadastroUsu_Codigo.AsInteger := Usuario.Model.CDSCadastroUsu_Codigo.AsInteger;
    FModel.CDSCadastroUsu_Nome.AsString := Usuario.Model.CDSCadastroUsu_Nome.AsString;

    ObservacaoPadrao();
    TipoUmRegistro();

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Usuario);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.ObservacaoPadrao;
var
  Obs: TObservacaoController;
begin
  Obs := TObservacaoController.Create;
  try
    Obs.LocalizarPadrao(prVersao);
    FModel.CDSCadastroVer_Descricao.AsString := Obs.Model.CDSCadastroObs_Descricao.AsString;
  finally
    FreeAndNil(Obs);
  end;
end;

procedure TVersaoController.Pesquisar(AId: Integer);
begin
  LocalizarId(AId);
  if FModel.CDSCadastroVer_Id.AsInteger = 0 then
    raise Exception.Create('Registro n�o Encontrado.');
end;

procedure TVersaoController.Post;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Post;
end;


function TVersaoController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CVersaoPrograma).ToString);
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.Relatorio01(AIdVersao: Integer);
var
  Negocio: TServerMethods1Client;
  Relatorio: TDMRelVersao;
  QtdeTotal: Integer;
begin
  Relatorio := TDMRelVersao.Create(nil);
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.RelatorioVersao(1, AIdVersao, QtdeTotal, nil);
      Relatorio.ImpressaoRelatorio1(QtdeTotal);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TVersaoController.Relatorio01');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Relatorio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.Relatorio02(AIdVersao: Integer; AFiltro: TFiltroVersao);
var
  Negocio: TServerMethods1Client;
  Relatorio: TDMRelVersao;
  QtdeTotal: Integer;
  objJson: TJSONValue;
begin
  Relatorio := TDMRelVersao.Create(nil);
  AFiltro.DataInicial := '01/01/1970';
  AFiltro.DataFinal := '31/12/2099';
  AFiltro.DataLiberacaoInicial := '/  /';
  AFiltro.DataLiberacaoFinal := '/  /';

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      objJson := TConverte.ObjectToJSON(AFiltro);
      Negocio.RelatorioVersao(2, AIdVersao, QtdeTotal, objJson);
      Relatorio.ImpressaoRelatorio2();
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TVersaoController.Relatorio02');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Relatorio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.Relatorio03(AIdVersao: Integer; AFiltro: TFiltroVersao);
var
  Negocio: TServerMethods1Client;
  Relatorio: TDMRelVersao;
  QtdeTotal: Integer;
  objJson: TJSONValue;
  sPeriodo: string;
begin
  if (AFiltro.DataInicial.Trim <> DataEmBranco) or (AFiltro.DataFinal.Trim <> DataEmBranco) then
    sPeriodo := 'Dt. Emiss�o: ' + AFiltro.DataInicial + ' A ' + AFiltro.DataFinal;

  if (AFiltro.DataLiberacaoInicial.Trim <> DataEmBranco) or (AFiltro.DataLiberacaoFinal.Trim <> DataEmBranco) then
    sPeriodo := 'Dt. Libera��o: ' + AFiltro.DataLiberacaoInicial + ' A ' + AFiltro.DataLiberacaoFinal;

  dm.Conectar;
  Relatorio := TDMRelVersao.Create(nil);
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      objJson := TConverte.ObjectToJSON(AFiltro);
      Negocio.RelatorioVersao(3, AIdVersao, QtdeTotal, objJson);
      Relatorio.ImpressaoRelatorio3(sPeriodo);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TVersaoController.Relatorio03');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Relatorio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  lOperacao: TOperacao;
begin
  if TFuncoes.DataEmBrancoNula(FModel.CDSCadastroVer_DataInicio.AsString) then
    raise Exception.Create('Informe a Data de In�cio!');

  if TFuncoes.DataEmBrancoNula(FModel.CDSCadastroVer_DataLiberacao.AsString) then
    raise Exception.Create('Informe a Data de Libera��o!');

  TFuncoes.ValidaIntervaloDatas(FModel.CDSCadastroVer_DataInicio.AsString,
                                   FModel.CDSCadastroVer_DataLiberacao.AsString);


  if FModel.CDSCadastroVer_Usuario.AsInteger = 0 then
    raise Exception.Create('Informe o para Usu�rio!');

  if Trim(FModel.CDSCadastroVer_Descricao.AsString) = '' then
    raise Exception.Create('Informe a Descri��o!');

  if FModel.CDSCadastroVer_Status.AsInteger = 0 then
    raise Exception.Create('Informe o Status!');

  if FModel.CDSCadastroVer_Tipo.AsInteger = 0 then
    raise Exception.Create('Informe o Tipo!');

  dm.Conectar;
  lOperacao := FOperacao;
  try

    Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
    try
      Negocio.StartTransacao;

      if FOperacao = opIncluir then
        FModel.CDSCadastroVer_Id.AsInteger := Negocio.ProximoId(CVersaoPrograma).AsInt;

      Post();

      if FModel.CDSCadastro.ChangeCount > 0 then
        FModel.CDSCadastro.ApplyUpdates(0);

      Negocio.Salvar(CVersaoPrograma, DM.IdUsuario);

      Negocio.Commit;

      FOperacao := opNavegar;
    except
      ON E: Exception do
      begin
        FOperacao := lOperacao;
        Negocio.Roolback;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TVersaoController.TipoUmRegistro;
var
  obj: TTipoController;
  Model: TTipoVO;
begin
  obj := TTipoController.Create;
  try
    Model := obj.RetornoUmRegistro(prVersao);
    if Model.Id > 0 then
    begin
      FModel.CDSCadastroVer_Tipo.AsInteger := Model.Id;
      FModel.CDSCadastroTip_Codigo.AsInteger := Model.Codigo;
      FModel.CDSCadastroTip_Nome.AsString := Model.Nome;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Model);
  end;
end;

end.
