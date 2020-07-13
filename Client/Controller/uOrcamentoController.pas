unit uOrcamentoController;

interface

uses
  System.SysUtils, uDMOrcamento, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  uFiltroOrcamento, Data.DBXJSON, Data.DBXJSONReflect, uUsuario, uParcelas, uOrcamentoVO,
  uFormaPagtoVO, uObsevacaoController, uConverter, System.Generics.Collections,
  uOrcamentoEmailVO, uGenericProperty, uDepartamentoEmailVO,
  uParametrosController, uFormaPagtoController, uClienteController,
  uTipoController, uTipoVO, uContatoVO;

type
  TOrcamentoController = class
  private
    FModel: TDMOrcamento;
    FOperacao: TOperacao;
    procedure Post;
    procedure GravarVencimentos(AOrcamento: TOrcamentoVO);
    procedure GravarItens(ObjVO: TOrcamentoVO);
    procedure GravarModulo(ObjVO: TOrcamentoVO);
    procedure GravarOcorrencias(ObjVO: TOrcamentoVO);
    procedure GravarEmail(ObjVO: TOrcamentoVO);
    procedure GravarContato(ObjVO: TOrcamentoVO);
    procedure ObservacaoPadrao;
    procedure TipoUmRegistro;
    function RetornaEmail(AIdOrcamento: integer): string;
  public
    procedure Filtrar(AFiltro: TFiltroOrcamento; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure FiltrarId(AId: Integer);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarCodigo(ACodigo: integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm; AOcorrencia: Boolean=false);
    procedure EditarOcorrencia(AId: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    procedure ModoEdicaoInsercao;
    procedure BuscarUsuarioLogado(AIdUsuario: Integer; ATipo: string);
    procedure CalcularParcelas(AIdFormaPagto: Integer; AValor: Currency;
      out AValorPrimeira: Currency; out AValorOutras: Currency);
    procedure CalcularParcelasDifUltima(AQtdeParcelas: Integer; AValor: Currency;
      out AValorUltima: Currency; out AValorOutras: Currency);
    procedure AtualizarSituacao(ASituacao, AId: Integer);
    procedure Impressao(AIdOrcamento, ACodigoModelo: Integer; APDF: Boolean);
    procedure ImpressaoModelo2(AIdOrcamento, ACodigoModelo: Integer; APDF: Boolean);
    procedure ConfigurarRelatorio(ACodigoModelo: Integer);
    procedure EnviarEmail(AIdCliente, ANumOrcamento, AIdUsuario: Integer;
      AEmail, ATexto, AArquivo: string; AOculto: string = ''; AAssunto: string = ''; AAviso: Boolean=True);
    procedure ListarEmail(AIdOrcamento: Integer);
    procedure LimparEmail;
    procedure EnviarEmailParaSupervisor(AIdUsuario: Integer; AOcorrencia: Boolean = False);
    procedure EnviarEmailSeteDiasParaSupervisor();
    function BuscarEmailRemetenteSeteDias(): Integer;

    function Salvar(AIdUsuario: Integer; ObjVO: TOrcamentoVO): Integer;
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    function CodigoAtual: Integer;
    function ArquivoPDF(APath, ANumeroOrcamento, ACliente: string): string;
    function Duplicar(AIdOrcamento: integer): Integer;
    function RetornarSituacao(ACodigo: Integer): string;
    function RetornarEmailSupervisor(AIdUsuario: Integer): string;

    procedure Relatorios(AFiltro: TFiltroOrcamento; ATipo: Integer);
    procedure ImprimirRelatorio1(ALista: TObjectList<TOrcamentoVO>);
    procedure EmailEnviado(AIdOrcamento: Integer);


    property Model: TDMOrcamento read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
//------------------------------------------------------------------------------
// itens do orcamento
//------------------------------------------------------------------------------
    procedure LocalizarItens(AIdOrdem: Integer);
    procedure ExcluirOrcamentoItem();
//------------------------------------------------------------------------------
// Modulos do orcamento
//------------------------------------------------------------------------------
    procedure LocalizarModulo(AIdOrdem: Integer);
    procedure ExcluirOrcamentoItemModulo();
//------------------------------------------------------------------------------
// Ocorrencias do orcamento
//------------------------------------------------------------------------------
    procedure LocalizarOcorrencia(AIdOrdem: Integer);
    procedure ExcluirOcorrencia();
//------------------------------------------------------------------------------
// Vencimentos do orcamento
//------------------------------------------------------------------------------
    procedure LocalizarVencimento(AIdOrdem: Integer);
    procedure ExcluirVencimento();
    procedure RecalcularParcelas(AIdFormaPagto: Integer; ATotalOrcamento, ATotalParcelas: Currency);
    procedure GerarParcelas(AIdFormaPagto: Integer; ATotalOrcamento: Currency);
  end;

implementation

{ TTipoController }

uses uFuncoesSIDomper, uUsuarioController, uOrcamentoItemVO,
  uOrcamentoItemModuloVO, uOrcamentoOcorrenciaVO, uOrcamentoVectoVO,
  Vcl.Dialogs, uModeloRelatorioController, uEmailBase, uUsuarioVO, uEnviarEmail,
  uContaEmailController, uFormProcesso;

function TOrcamentoController.ArquivoPDF(APath,
  ANumeroOrcamento, ACliente: string): string;
var
  Orcamento: Double;
  sPasta: string;
begin
  sPasta := 'PDF\';
  Orcamento := StrToFloat(ANumeroOrcamento);
  if not DirectoryExists(APath + sPasta) then
    CreateDir(APath + sPasta);
  Result := APath + sPasta + 'Orcamento-' + FormatFloat('000000', orcamento) + '-' + ACliente + '.pdf';
end;

procedure TOrcamentoController.AtualizarSituacao(ASituacao, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.OrcamentoAtualizarSituacao(ASituacao, AId);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.EnviarEmailParaSupervisor(
  AIdUsuario: Integer; AOcorrencia: Boolean);
var
  sEmail: string;
  sTexto: string;
  sEmailParametro: string;
  Parametro: TParametrosController;
  iSituacao: Integer;
begin
  iSituacao := Self.Model.CDSCadastroOrc_Situacao.AsInteger;
  sEmail := RetornarEmailSupervisor(AIdUsuario);
  if sEmail <> '' then
  begin
    if (iSituacao = 2) or (iSituacao = 4) then // aprovado - faturado
    begin
      Parametro := TParametrosController.Create;
      try
        sEmailParametro := Parametro.OrcamentoBuscarEmailOrcamentoAprovado();

        if sEmailParametro <> '' then
          sEmail := sEmail + ';' + sEmailParametro;
      finally
        FreeAndNil(Parametro);
      end;
    end;

    sTexto := '<html>Or�amento enviado para:<br><br>';
    sTexto := sTexto + 'N�mero: ' + FormatFloat('000000', Self.Model.CDSCadastroOrc_Numero.AsFloat) + '<br>';
    sTexto := sTexto + 'Raz�o Social: ' + Self.Model.CDSCadastroOrc_RazaoSocial.AsString + '<br>';
    sTexto := sTexto + 'Contato: ' + Self.Model.CDSCadastroOrc_Contato.AsString + '<br>';
    sTexto := sTexto + 'Telefone: ' + Self.Model.CDSCadastroOrc_Telefone.AsString + '<br>';
    sTexto := sTexto + 'Usu�rio: ' + Self.Model.CDSCadastroUsu_Nome.AsString + '<br>';
    if iSituacao = 4 then // faturado
      sTexto := sTexto + 'Situa��o: A Faturar'
    else
      sTexto := sTexto + 'Situa��o: ' + Self.Model.CDSCadastroCSituacao.AsString;
    sTexto := sTexto + '<br><br>';


    if AOcorrencia then
    begin
      LocalizarOcorrencia(Self.Model.CDSCadastroOrc_Id.AsInteger);
      while not Self.Model.CDSOcorrencia.Eof do
      begin
        if self.Model.CDSOcorrencia.RecNo = 1 then
          sTexto := sTexto + '<bold>Ocorr�ncias</bold> <br>';

        sTexto := sTexto + 'Data: ' + Self.Model.CDSOcorrenciaOrcOco_Data.AsString + '<br>';
        sTexto := sTexto + 'Usu�rio: ' + Self.Model.CDSOcorrenciaUsu_Nome.AsString + '<br>';
        sTexto := sTexto + 'Descri��o: <br>' + Self.Model.CDSOcorrenciaOrcOco_Descricao.AsString + '<br><br>';

        Self.Model.CDSOcorrencia.Next;
      end;
    end;
    sTexto := sTexto + '</html>';

    Self.EnviarEmail(Self.Model.CDSCadastroOrc_Cliente.AsInteger,
                            Self.Model.CDSCadastroOrc_Numero.AsInteger,
                            dm.IdUsuario,
                            sEmail,
                            sTexto,
                            '',
                            '');
  end;
end;

procedure TOrcamentoController.EnviarEmailSeteDiasParaSupervisor();
var
  Negocio: TServerModule2Client;
  sEmailSupervisor: string;
  sTexto: string;
  sEmailUsuario: string;
  ListaOrcamento: TObjectList<TOrcamentoVO>;
  OrcamentoModel: TOrcamentoVO;
  ModelDepEmail: TDepartamentoEmailVO;
  iIdUsuario: Integer;
begin
  dm.Conectar;
  try
    ListaOrcamento := TObjectList<TOrcamentoVO>.create();
    Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
    try
      ListaOrcamento := TConverte.JSONToObject<TListaOrcamento>(Negocio.OrcamentoListarEmailSeteDiasParaSupervisor());
    finally
      FreeAndNil(Negocio);
    end;

    iIdUsuario := BuscarEmailRemetenteSeteDias();

    for OrcamentoModel in ListaOrcamento do
    begin
      sEmailSupervisor  := '';
      sEmailUsuario     := '';

      sTexto := '<html>Or�amento enviado para:<br><br>';
      sTexto := sTexto + 'N�mero: ' +  FormatFloat('000000', OrcamentoModel.Numero) + '<br>';
      sTexto := sTexto + 'Raz�o Social: ' +  OrcamentoModel.RazaoSocial + '<br>';
      sTexto := sTexto + 'Contato: ' + OrcamentoModel.Contato + '<br>';
      sTexto := sTexto + 'Usu�rio: ' + OrcamentoModel.Usuario.Nome + '<br>';
      sTexto := sTexto + 'Situa��o: ' + Self.RetornarSituacao(OrcamentoModel.Situacao);
      sTexto := sTexto + '<br><br>';

  //    if Pos(OrcamentoModel.Usuario.Email, sEmailUsuario) = 0 then
  //      sEmailUsuario := sEmailUsuario + OrcamentoModel.Usuario.Email + ';';

      sEmailUsuario := OrcamentoModel.Usuario.Email;

      for ModelDepEmail in OrcamentoModel.Usuario.Departamento.DepartamentoEmail do
      begin
        if OrcamentoModel.Usuario.Departamento.Id = ModelDepEmail.IdDepartamento then
        begin
          if (Pos(ModelDepEmail.Email, sEmailSupervisor) = 0) and (Pos(ModelDepEmail.Email, sEmailUsuario) = 0) then
            sEmailSupervisor := sEmailSupervisor + ModelDepEmail.Email + ';'
        end;
      end;

      sEmailSupervisor  := Copy(sEmailSupervisor, 1, length(sEmailSupervisor) -1);

      sTexto := sTexto + 'Este or�amento ainda n�o tem defini��o. Favor entrar em contato com o Cliente.';
      sTexto := sTexto + '</html>';

      if sEmailUsuario <> '' then
      begin

        Self.EnviarEmail(Self.Model.CDSCadastroOrc_Cliente.AsInteger,
                                Self.Model.CDSCadastroOrc_Numero.AsInteger,
                                iIdUsuario,
                                sEmailUsuario,
                                sTexto,
                                '',
                                sEmailSupervisor,
                                'Domper - Or�amentos',
                                True);
      end;
    end;
  except
    On E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

function TOrcamentoController.BuscarEmailRemetenteSeteDias: Integer;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.OrcamentoBuscarEmailRemetenteSeteDias();
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.BuscarUsuarioLogado(AIdUsuario: Integer; ATipo: string);
var
  obj: TUsuarioController;
begin
// ORC - Or�amento OCO - Ocorrencia
  obj := TUsuarioController.Create;
  try
    obj.LocalizarId(AIdUsuario);
    if ATipo = 'ORC' then
    begin
      FModel.CDSCadastroOrc_Usuario.AsInteger := obj.Model.CDSCadastroUsu_Id.AsInteger;
      FModel.CDSCadastroUsu_Codigo.AsInteger := obj.Model.CDSCadastroUsu_Codigo.AsInteger;
      FModel.CDSCadastroUsu_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;
    end
    else begin
      FModel.cdsOcorrenciaOrcOco_Usuario.AsInteger := obj.Model.CDSCadastroUsu_Id.AsInteger;
      FModel.cdsOcorrenciaUsu_Codigo.AsInteger := obj.Model.CDSCadastroUsu_Codigo.AsInteger;
      FModel.cdsOcorrenciaUsu_Nome.AsString := obj.Model.CDSCadastroUsu_Nome.AsString;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TOrcamentoController.CalcularParcelas(AIdFormaPagto: Integer; AValor: Currency;
  out AValorPrimeira: Currency; out AValorOutras: Currency);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.OrcamentoGerarParcela(AIdFormaPagto, AValor, AValorPrimeira, AValorOutras);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.CalcularParcelasDifUltima(AQtdeParcelas: Integer;
  AValor: Currency; out AValorUltima, AValorOutras: Currency);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.OrcamentoGerarParcelaDifUltima(AQtdeParcelas, AValor, AValorUltima, AValorOutras);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TOrcamentoController.CodigoAtual: Integer;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.OrcamentoProximoNumero().ToString());
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.ConfigurarRelatorio(ACodigoModelo: Integer);
//var
//  Modelo: TModeloRelatorioController;
begin
  FModel.DesImpressao.Show;
//  Modelo := TModeloRelatorioController.Create;
//  try
//    Modelo.LocalizarCodigo(ACodigoModelo);
//    FModel.DesImpressao.Show;
//  finally
//    FreeAndNil(Modelo);
//  end;
end;

constructor TOrcamentoController.Create;
begin
  inherited Create;
  FModel := TDMOrcamento.Create(nil);
end;

destructor TOrcamentoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

function TOrcamentoController.Duplicar(AIdOrcamento: integer): Integer;
var
  Negocio: TServerModule2Client;
  Id: Integer;
begin
  if AIdOrcamento = 0 then
    raise Exception.Create('N�o h� Registro para Replicar!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Id := StrToInt(Negocio.OrcamentoDuplicar(AIdOrcamento).ToString);
    FiltrarId(Id);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.Editar(AId: Integer; AFormulario: TForm; AOcorrencia: Boolean);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(COrcamentoPrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    LocalizarItens(AId);
    LocalizarModulo(AId);
    LocalizarOcorrencia(AId);
    LocalizarVencimento(AId);

    if AOcorrencia = False then
      TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.EditarOcorrencia(AId: Integer);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(COrcamentoPrograma, AId);
    FModel.CDSCadastro.Open;

    LocalizarItens(AId);
    LocalizarModulo(AId);
    LocalizarOcorrencia(AId);
    LocalizarVencimento(AId);

    FOperacao := opEditar;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.EmailEnviado(AIdOrcamento: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AIdOrcamento = 0 then
    raise Exception.Create('N�o h� Registro para Enviar!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.OrcamentoEmailEnviado(AIdOrcamento);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.EnviarEmail(AIdCliente, ANumOrcamento,
  AIdUsuario: Integer; AEmail, ATexto, AArquivo: string; AOculto: string;
    AAssunto: string; AAviso: Boolean);
var
  ContaEmail: TContaEmailController;
  sArquivo: string;
  sAssunto: string;
  cNumero: Double;
  sCliente: string;
begin
  if AAssunto.Trim() = '' then
  begin
    cNumero := ANumOrcamento;
    sCliente := ' DOMPER Consultoria e Sistemas Ltda.';
    sAssunto := 'Or�amento: ' + FormatFloat('000000', cNumero) + sCliente ;
  end
  else
    sAssunto := AAssunto;

  if Trim(AEmail) <> '' then
  begin
    if AArquivo <> '' then
      sArquivo := ExtractFileName(AArquivo);

    ContaEmail := TContaEmailController.Create;
    try
      ContaEmail.EnviarEmail(AIdUsuario,
                             AEmail,
                             AOculto,
                             sAssunto,
                             ATexto,
                             AArquivo,
                             AAviso);
    finally
      FreeAndNil(ContaEmail);
    end;
  end;
end;

procedure TOrcamentoController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(COrcamentoPrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.ExcluirOcorrencia;
begin
  if FModel.CDSOcorrencia.RecordCount = 0 then
    raise Exception.Create('N�o h� Itens para Excluir!');
  FModel.CDSOcorrencia.Delete;
end;

procedure TOrcamentoController.ExcluirOrcamentoItem;
begin
  if FModel.CDSItens.RecordCount = 0 then
    raise Exception.Create('N�o h� Itens para Excluir!');
  FModel.CDSItens.Delete;
end;

procedure TOrcamentoController.ExcluirOrcamentoItemModulo;
begin
  if FModel.CDSItensModulo.RecordCount = 0 then
    raise Exception.Create('N�o h� Itens para Excluir!');
  FModel.CDSItensModulo.Delete;
end;

procedure TOrcamentoController.ExcluirVencimento;
begin
  if FModel.CDSVenctos.RecordCount = 0 then
    raise Exception.Create('N�o h� Itens para Excluir!');
  FModel.CDSVenctos.Delete;
end;

procedure TOrcamentoController.GravarOcorrencias(ObjVO: TOrcamentoVO);
var
  OrcamentoOcorrenciaVO: TOrcamentoOcorrenciaVO;
begin
  //------------------------------------------------------------------------------  // Ocorrencias
  //------------------------------------------------------------------------------
  FModel.CDSOcorrencia.DisableControls;
  FModel.CDSOcorrencia.First;
  try
    while not FModel.CDSOcorrencia.Eof do
    begin
      OrcamentoOcorrenciaVO := TOrcamentoOcorrenciaVO.Create;
      TGenericProperty.SetProperty<TOrcamentoOcorrenciaVO>(OrcamentoOcorrenciaVO, FModel.CDSOcorrencia);
      ObjVO.OrcamentoOcorrencia.Add(OrcamentoOcorrenciaVO);
      FModel.CDSOcorrencia.Next;
    end;
  finally
    FModel.CDSOcorrencia.First;
    FModel.CDSOcorrencia.EnableControls;
  end;
end;

procedure TOrcamentoController.GravarModulo(ObjVO: TOrcamentoVO);
var
  OrcamentoItemModuloVO: TOrcamentoItemModuloVO;
begin
  //------------------------------------------------------------------------------
  // Modulos
  //------------------------------------------------------------------------------
  FModel.CDSItensModulo.DisableControls;
  FModel.CDSItensModulo.First;
  try
    while not FModel.CDSItensModulo.Eof do
    begin
      OrcamentoItemModuloVO := TOrcamentoItemModuloVO.Create;
      TGenericProperty.SetProperty<TOrcamentoItemModuloVO>(OrcamentoItemModuloVO, FModel.cdsItensModulo);
      ObjVO.OrcamentoItemModulo.Add(OrcamentoItemModuloVO);
      FModel.CDSItensModulo.Next;
    end;
  finally
    FModel.CDSItensModulo.First;
    FModel.CDSItensModulo.EnableControls;
  end;
end;

procedure TOrcamentoController.GerarParcelas(AIdFormaPagto: Integer;
  ATotalOrcamento: Currency);
var
  ValorPrimeira: Currency;
  ValorOutras: Currency;
  Total: Currency;
  FormaPagto: TFormaPagtoController;
  iContador: Integer;
begin
  if AIdFormaPagto > 0 then
  begin
    Total := ATotalOrcamento;

    if Total > 0 then
    begin
      FormaPagto := TFormaPagtoController.Create;
      try
        ValorPrimeira := 0;
        ValorOutras   := 0;
        CalcularParcelas(AIdFormaPagto,
                                   Total,
                                   ValorPrimeira,
                                   ValorOutras);

        FormaPagto.ListarFormaPagto(AIdFormaPagto);

        FModel.CDSVenctos.First;
        while not FModel.CDSVenctos.Eof do
          FModel.CDSVenctos.Delete;

        iContador := 1;
        while not FormaPagto.Model.CDSItens.Eof do
        begin
          FModel.CDSVenctos.Append;
          FModel.CDSVenctosOrcVect_Data.AsDateTime := FModel.CDSCadastroOrc_Data.AsDateTime + FormaPagto.Model.CDSItensFpgIte_Dias.AsInteger;
          FModel.CDSVenctosOrcVect_Orcamento.AsInteger := FModel.CDSCadastroOrc_Id.AsInteger;

          if iContador = 1 then
            FModel.CDSVenctosOrcVect_Valor.AsCurrency := ValorPrimeira
          else
            FModel.CDSVenctosOrcVect_Valor.AsCurrency := ValorOutras;
          FModel.CDSVenctos.Post;

          Inc(iContador);
          FormaPagto.Model.CDSItens.Next;
        end;
      finally
        FreeAndNil(FormaPagto);
      end;
    end;
  end;
end;

procedure TOrcamentoController.GravarEmail(ObjVO: TOrcamentoVO);
var
  VO: TOrcamentoEmailVO;
begin
  FModel.CDSEmail.First;
  while not FModel.CDSEmail.Eof do
  begin
    VO := TOrcamentoEmailVO.Create;
    TGenericProperty.SetProperty<TOrcamentoEmailVO>(VO, FModel.CDSEmail);
    ObjVO.OrcamentoEmail.Add(VO);

    FModel.CDSEmail.Next;
  end;
end;

procedure TOrcamentoController.GravarItens(ObjVO: TOrcamentoVO);
var
  OrcamentoItemVO: TOrcamentoItemVO;
begin
  FModel.CDSItens.DisableControls;
  FModel.CDSItens.First;
  try
    while not FModel.CDSItens.Eof do
    begin
      OrcamentoItemVO := TOrcamentoItemVO.Create;
      TGenericProperty.SetProperty<TOrcamentoItemVO>(OrcamentoItemVO, FModel.CDSItens);
      ObjVO.OrcamentoItem.Add(OrcamentoItemVO);
      FModel.CDSItens.Next;
    end;
  finally
    FModel.CDSItens.First;
    FModel.CDSItens.EnableControls;
  end;
end;

procedure TOrcamentoController.Filtrar(AFiltro: TFiltroOrcamento; ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerModule2Client;
//  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataSituacaoInicial, AFiltro.DataSituacaoFinal);

//  Marshal := TJSONMarshal.Create;
//  try
//    oObjetoJSON := Marshal.Marshal(AFiltro);
//  finally
//    FreeAndNil(Marshal);
//  end;

  oObjetoJSON := TConverte.ObjectToJSON<TFiltroOrcamento>(AFiltro);

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarOrcamento(oObjetoJSON, ACampo, ATexto, dm.IdUsuario, AContem);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(COrcamentoPrograma, ACodigo);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.FiltrarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.OrcamentoFiltrarId(AId);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.GravarVencimentos(AOrcamento: TOrcamentoVO);
var
  OrcamentoVenctoVO: TOrcamentoVectoVO;
begin
  FModel.CDSVenctos.DisableControls;
  FModel.CDSVenctos.First;
  try
    while not FModel.CDSVenctos.Eof do
    begin
      OrcamentoVenctoVO := TOrcamentoVectoVO.Create;
      TGenericProperty.SetProperty<TOrcamentoVectoVO>(OrcamentoVenctoVO, FModel.CDSVenctos);
      AOrcamento.OrcamentoVecto.Add(OrcamentoVenctoVO);
      FModel.CDSVenctos.Next;
    end;
  finally
    FModel.CDSVenctos.First;
    FModel.CDSVenctos.EnableControls;
  end;
end;

procedure TOrcamentoController.Impressao(AIdOrcamento, ACodigoModelo: Integer;
  APDF: Boolean);
var
  Negocio: TServerModule2Client;
  Modelo: TModeloRelatorioController;
  sArquivo: string;
  sEmail: string;
  sTipoRelatorio: string;
begin
  if AIdOrcamento = 0 then
    raise Exception.Create('N�o h� Registro!');

  dm.Conectar;
  Modelo := TModeloRelatorioController.create();
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Modelo.LocalizarCodigo(ACodigoModelo);
    FModel.CDSImpressao.close;

    Negocio.OrcamentoImprimir(AIdOrcamento);

    if Pos('DETALHADO', UpperCase(Modelo.Model.CDSCadastroModR_Arquivo.AsString)) > 0 then
      sTipoRelatorio := 'DETA'
    else
      sTipoRelatorio := 'SIMP';

    sEmail := RetornaEmail(AIdOrcamento);

    FModel.CDSImpressao.Open;
    if sTipoRelatorio = 'SIMP' then
    begin
      FModel.RelImpressaoSimples.Template.FileName := Modelo.Model.CDSCadastroModR_Arquivo.AsString;
      FModel.RelImpressaoSimples.Template.LoadFromFile;
      FModel.ImpressaoRelatorioSimplificado(sEmail);
    end
    else begin
      FModel.RelImpressao.Template.FileName := Modelo.Model.CDSCadastroModR_Arquivo.AsString;
      FModel.RelImpressao.Template.LoadFromFile;
    end;

    if APDF then
    begin
      sArquivo := ArquivoPDF(ExtractFilePath(Modelo.Model.CDSCadastroModR_Arquivo.AsString),
                             FModel.CDSImpressaoOrc_Numero.Asstring,
                             FModel.CDSImpressaoOrc_RazaoSocial.AsString);
      FModel.GerarPDF(sArquivo, sTipoRelatorio);
    end
    else
      FModel.ImpressaoTela(sTipoRelatorio);

    if sTipoRelatorio = 'DETA' then
    begin
      FModel.plblOrcamento01.Caption := sEmail;
//      //FModel.RepOrcamento.Print;
      FModel.RelImpressao.Print;
    end
    else
      FModel.RelImpressaoSimples.print;

    FModel.CDSImpressao.close;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Modelo);
  end;
end;

procedure TOrcamentoController.ImpressaoModelo2(AIdOrcamento,
  ACodigoModelo: Integer; APDF: Boolean);
var
  Negocio: TServerModule2Client;
//  Modelo: TModeloRelatorioController;
  sArquivo: string;
  sEmail: string;
  sTipoRelatorio: string;
begin

// 1 - Detalhado
// 2 - Simplificado

  if AIdOrcamento = 0 then
    raise Exception.Create('N�o h� Registro!');

//  Modelo := TModeloRelatorioController.create();
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
//    Modelo.LocalizarCodigo(ACodigoModelo);
    FModel.CDSImpressao.close;

    Negocio.OrcamentoImprimir(AIdOrcamento);

    if ACodigoModelo = 1 then
      sTipoRelatorio := 'DETA'
    else
      sTipoRelatorio := 'SIMP';

    sEmail := RetornaEmail(AIdOrcamento);

    FModel.CDSImpressao.Open;
    if sTipoRelatorio = 'SIMP' then
    begin
//      FModel.RelImpressaoSimples.Template.FileName := Modelo.Model.CDSCadastroModR_Arquivo.AsString;
//      FModel.RelImpressaoSimples.Template.LoadFromFile;
      FModel.ImpressaoRelatorioSimplificado(sEmail);
    end
    else begin
//      FModel.RelImpressao.Template.FileName := Modelo.Model.CDSCadastroModR_Arquivo.AsString;
//      FModel.RelImpressao.Template.LoadFromFile;
    end;

    if APDF then
    begin
      sArquivo := ArquivoPDF(ExtractFilePath(Application.ExeName),
                             FModel.CDSImpressaoOrc_Numero.Asstring,
                             FModel.CDSImpressaoOrc_RazaoSocial.AsString);
      FModel.GerarPDF(sArquivo, sTipoRelatorio);
    end
    else
      FModel.ImpressaoTela(sTipoRelatorio);

    if sTipoRelatorio = 'DETA' then
    begin
      FModel.plblOrcamento01.Caption := sEmail;
//      //FModel.RepOrcamento.Print;
      FModel.RelImpressao.Print;
    end
    else
      FModel.RelImpressaoSimples.print;

    FModel.CDSImpressao.close;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
//    FreeAndNil(Modelo);
  end;
end;

procedure TOrcamentoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
  lRelatorio: TObjectList<TOrcamentoVO>;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(COrcamentoPrograma, AIdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.ImprimirRelatorio1(ALista: TObjectList<TOrcamentoVO>);
var
  Item: TOrcamentoVO;
begin
  FModel.cdsRelatorios.first;
  while not FModel.cdsRelatorios.eof do
    FModel.cdsRelatorios.Delete();

  for Item in ALista do
  begin
    FModel.cdsRelatorios.Append;
    FModel.cdsRelatoriosData.AsDateTime                     := Item.Data;
    FModel.cdsRelatoriosRazaoSocial.AsString                := Item.RazaoSocial;
    FModel.cdsRelatoriosSituacao.AsString                   := Item.SituacaoDescricao;
    FModel.cdsRelatorios.FieldByName('TipCodigo').AsInteger := Item.Tipo.Codigo;
    FModel.cdsRelatorios.FieldByName('TipNome').AsString    := Item.Tipo.Nome;
    FModel.cdsRelatorios.FieldByName('UsuCodigo').AsInteger := Item.Usuario.Codigo;
    FModel.cdsRelatorios.FieldByName('UsuNome').AsString    := Item.Usuario.Nome;
    FModel.cdsRelatorios.FieldByName('ValorTotal').AsCurrency := Item.TotalOrcamento;
    FModel.cdsRelatorios.FieldByName('ValorMensal').AsCurrency:= Item.TotalMensalidade;
    FModel.cdsRelatorios.FieldByName('TotalGeral').AsCurrency:=  Item.TotalOrcamento + Item.TotalMensalidade;
    FModel.cdsRelatorios.Post;
  end;

  FModel.cdsRelatorios.IndexFieldNames := 'TipNome; Data';

  FModel.Relatorio1.print;
 end;

procedure TOrcamentoController.LimparEmail;
begin
  FModel.CDSEmail.First;
  while not FModel.CDSEmail.Eof do
    FModel.CDSEmail.Delete;
end;

procedure TOrcamentoController.ListarEmail(AIdOrcamento: Integer);
var
  Negocio: TServerModule2Client;
  Lista: TObjectList<TOrcamentoEmailVO>;
  obj: TOrcamentoEmailVO;
begin
  LimparEmail();
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Lista := Tconverte.JSONToObject<TListaOrcamentoEmail>(Negocio.OrcamentoListarEmail(AIdOrcamento));
    for obj in Lista do
    begin
      FModel.CDSEmail.append;
      obj.IdOrcamento := AIdOrcamento;
      TGenericProperty.GetPropertyDataSet<TOrcamentoEmailVO>(obj, FModel.cdsEmail);
      FModel.CDSEmail.Post;
    end;
    FModel.CDSEmail.First;
    dm.Desconectar;
  finally
    FreeAndNil(Lista);
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(COrcamentoPrograma, ACodigo);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(COrcamentoPrograma, AId);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.LocalizarItens(AIdOrdem: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSItens.Close;
    Negocio.OrcamentoItemLocalizar(AIdOrdem);
    FModel.CDSItens.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.LocalizarModulo(AIdOrdem: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSItensModulo.Close;
    Negocio.OrcamentoItemModuloLocalizar(AIdOrdem);
    FModel.CDSItensModulo.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.LocalizarOcorrencia(AIdOrdem: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.cdsOcorrencia.Close;
    Negocio.OrcamentoOcorrenciaLocalizar(AIdOrdem);
    FModel.cdsOcorrencia.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.LocalizarVencimento(AIdOrdem: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSVenctos.Close;
    Negocio.OrcamentoVenctoLocalizar(AIdOrdem);
    FModel.CDSVenctos.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.ModoEdicaoInsercao;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSCadastro);
end;

procedure TOrcamentoController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(COrcamentoPrograma, AIdUsuario);
    FModel.CDSCadastro.Open;

    FModel.CDSCadastro.Append;
    FModel.CDSCadastroOrc_Numero.AsInteger := CodigoAtual();
    FModel.CDSCadastroOrc_Data.AsDateTime := Date;

    ObservacaoPadrao();
    TipoUmRegistro();

    LocalizarItens(0);
    LocalizarModulo(0);
    LocalizarOcorrencia(0);
    LocalizarVencimento(0);

    BuscarUsuarioLogado(AIdUsuario, 'ORC');

    FOperacao := opIncluir;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.ObservacaoPadrao;
var
  Obs: TObservacaoController;
begin
  Obs := TObservacaoController.Create;
  try
    Obs.LocalizarPadrao(prOrcamento);
    FModel.CDSCadastroOrc_Observacao.AsString := Obs.Model.CDSCadastroObs_Descricao.AsString;

    Obs.LocalizarEmailPadrao(prOrcamento);
    FModel.CDSCadastroOrc_ObservacaoEmail.AsString := Obs.Model.CDSCadastroObs_ObsEmail.AsString;
  finally
    FreeAndNil(Obs);
  end;
end;

procedure TOrcamentoController.Post;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Post;
end;

function TOrcamentoController.ProximoCodigo: Integer;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(COrcamentoPrograma).ToString);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TOrcamentoController.ProximoId: Integer;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(COrcamentoPrograma).ToString);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TOrcamentoController.RecalcularParcelas(AIdFormaPagto: Integer;
  ATotalOrcamento, ATotalParcelas: Currency);
var
  Total: Currency;
  ValorPrimeira: Currency;
  ValorOutras: Currency;
  iContador: Integer;
begin
  if AIdFormaPagto = 0 then
    Exit;

  if ATotalOrcamento <> ATotalParcelas then
  begin
    Total := ATotalOrcamento;

    if Total > 0 then
    begin
      ValorPrimeira := 0;
      ValorOutras   := 0;
      CalcularParcelas(AIdFormaPagto,
                                 Total,
                                 ValorPrimeira,
                                 ValorOutras);

      iContador := 1;
      FModel.CDSVenctos.First;
      while not FModel.CDSVenctos.Eof do
      begin
        FModel.CDSVenctos.Edit;
        if iContador = 1 then
          FModel.CDSVenctosOrcVect_Valor.AsCurrency := ValorPrimeira
        else
          FModel.CDSVenctosOrcVect_Valor.AsCurrency := ValorOutras;
        FModel.CDSVenctos.Post;

        Inc(iContador);
        FModel.CDSVenctos.Next;
      end;
      FModel.CDSVenctos.First;
    end;
  end;
end;

procedure TOrcamentoController.Relatorios(
  AFiltro: TFiltroOrcamento; ATipo: Integer);
var
  Negocio: TServerModule2Client;
  oObjetoJSON : TJSONValue;
  Lista: TObjectList<TOrcamentoVO>;
begin
  {ATipo: 1 - Por Tipo
          2 - Gr�fico por Tipo
          3 - Gr�fico por Situacao
          4 - Relatorio por Usuario
          5 - Relatorio por n�o Aprovados
          6 - Graficos de n�o Aprovados
  }

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    oObjetoJSON := TConverte.ObjectToJSON<TFiltroOrcamento>(AFiltro);


    case ATipo of
      1..2:
      begin
        FModel.cdsRelatorio01.Close();
        Negocio.OrcamentoRelatorios(oObjetoJSON, 1, dm.IdUsuario);
        FModel.cdsRelatorio01.Open;

        FModel.cdsGraficoTipo.Close();
        Negocio.OrcamentoRelatorios(oObjetoJSON, 2, dm.IdUsuario);
        FModel.cdsGraficoTipo.Open;

        FModel.Relatorio01();
      end;
      3..4:
      begin
        FModel.cdsRelatorio01.Close();
        Negocio.OrcamentoRelatorios(oObjetoJSON, 1, dm.IdUsuario);
        FModel.cdsRelatorio01.Open;

        FModel.cdsGraficoSituacao.Close();
        FModel.cdsGraficoUsuarioQtde.Close();
        Negocio.OrcamentoRelatorios(oObjetoJSON, ATipo, dm.IdUsuario);
        FModel.cdsGraficoSituacao.Open;
        FModel.cdsGraficoUsuarioQtde.Open();

        FModel.Relatorio02();
      end;
      5..6:
      begin
        FModel.cdsRelatorio03.Close();
        Negocio.OrcamentoRelatorios(oObjetoJSON, ATipo, dm.IdUsuario);
        FModel.cdsRelatorio03.Open;

        FModel.cdsGraficoNaoAprovado.Close();
        Negocio.OrcamentoRelatorios(oObjetoJSON, ATipo, dm.IdUsuario);
        FModel.cdsGraficoNaoAprovado.Open();

        FModel.Relatorio03();
      end;
    end;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TOrcamentoController.RetornaEmail(AIdOrcamento: integer): string;
var
  sEmail: string;
begin

  ListarEmail(AIdOrcamento);
  sEmail := '';
  while not FModel.cdsEmail.Eof do
  begin
    sEmail := sEmail + FModel.CDSEmailEmail.AsString + '; ';
    FModel.cdsEmail.Next;
  end;
  sEmail := Copy(sEmail, 1, Length(sEmail)-2);
  Result := sEmail;
end;

function TOrcamentoController.RetornarEmailSupervisor(
  AIdUsuario: Integer): string;
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.OrcamentoEmailSupervisor(AIdUsuario);
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TOrcamentoController.RetornarSituacao(ACodigo: Integer): string;
begin
  Result := FModel.RetornarSituacao(Acodigo);
end;

function TOrcamentoController.Salvar(AIdUsuario: Integer; ObjVO: TOrcamentoVO): Integer;
var
  Negocio: TServerModule2Client;
//  ObjVO: TOrcamentoVO;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin

//  ObjVO := TOrcamentoVO.create;
//  TGenericProperty.SetProperty<TOrcamentoVO>(ObjVO, FModel.CDSCadastro);
  ObjVO.Cliente.CidadeVO.UF := FModel.CDSCadastroCID_UF.AsString;

  GravarItens(ObjVO);
  GravarModulo(ObjVO);
  GravarOcorrencias(ObjVO);
  GravarVencimentos(ObjVO);
  GravarEmail(ObjVO);
  GravarContato(objVO);

  Marshal := TJSONMarshal.Create;

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      oObjetoJSON := Marshal.Marshal(ObjVO);
      Result := StrToIntDef(Negocio.OrcamentoSalvar(oObjetoJSON).ToString(),0);
      Post;
      FOperacao := opNavegar;
    except
      on E: Exception do
      begin
        TFuncoes.MensagemErroBanco(E.Message);
        Abort;
      end;
    end;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Marshal);
//    FreeAndNil(ObjVO);
  end;
end;

procedure TOrcamentoController.GravarContato(ObjVO: TOrcamentoVO);
var
  model: TContatoVO;
begin
  try
    if (FModel.CDSContato.State = dsInsert) and (FModel.CDSContatoCont_Nome.AsString = '') then
      FModel.CDSContato.Cancel;

    if FModel.CDSContato.state in [dsEdit, dsInsert] then
      FModel.CDSContato.post;

    FModel.CDSContato.DisableControls;
    FModel.CDSContato.First;
    while not FModel.CDSContato.Eof do
    begin
      model := TContatoVO.Create;
      model.Id := FModel.CDSContatoCont_Id.AsInteger;
      model.IdCliente := 0;
      model.IdOrcamento := FModel.CDSContatoCont_Orcamento.AsInteger;
      model.Nome := FModel.CDSContatoCont_Nome.AsString;
      model.Fone1 := FModel.CDSContatoCont_Fone1.AsString;
      model.Fone2 := FModel.CDSContatoCont_Fone2.AsString;
      model.Email := FModel.CDSContatoCont_Email.AsString;
      model.Departamento := FModel.CDSContatoCont_Depto.AsString;
      ObjVO.ListaContato.Add(model);
      FModel.CDSContato.Next;
    end;
  finally
    FModel.CDSContato.EnableControls;
  end;
end;

procedure TOrcamentoController.TipoUmRegistro;
var
  obj: TTipoController;
  Model: TTipoVO;
begin
  obj := TTipoController.Create;
  try
    Model := obj.RetornoUmRegistro(prOrcamento);
    if Model.Id > 0 then
    begin
      FModel.CDSCadastroOrc_Tipo.AsInteger := Model.Id;
      FModel.CDSCadastroTip_Codigo.AsInteger := Model.Codigo;
      FModel.CDSCadastroTip_Nome.AsString := Model.Nome;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Model);
  end;
end;

end.
