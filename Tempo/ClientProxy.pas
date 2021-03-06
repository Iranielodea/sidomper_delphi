//
// Created by the DataSnap proxy generator.
// 09/07/2018 19:31:09
//

unit ClientProxy;

interface

uses Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FDuplicacaoRegistroCommand: TDBXCommand;
    FNovoCommand: TDBXCommand;
    FExcluirCommand: TDBXCommand;
    FEditarCommand: TDBXCommand;
    FFiltrarCommand: TDBXCommand;
    FFiltrarCodigoCommand: TDBXCommand;
    FLocalizarIdCommand: TDBXCommand;
    FLocalizarCodigoCommand: TDBXCommand;
    FSalvarCommand: TDBXCommand;
    FProximoIdCommand: TDBXCommand;
    FProximoIdGeralCommand: TDBXCommand;
    FProximoCodigoCommand: TDBXCommand;
    FRelatorioCommand: TDBXCommand;
    FFiltrarChamadoCommand: TDBXCommand;
    FFiltrarIdChamadoCommand: TDBXCommand;
    FLocalizarChamadoOcorrenciaCommand: TDBXCommand;
    FLocalizarChamadoStatusCommand: TDBXCommand;
    FSalvarChamadoCommand: TDBXCommand;
    FSalvarChamadoObjCommand: TDBXCommand;
    FFiltrarChamadoQuadro1Command: TDBXCommand;
    FFiltrarChamadoQuadro2Command: TDBXCommand;
    FFiltrarChamadoQuadro3Command: TDBXCommand;
    FFiltrarChamadoQuadro4Command: TDBXCommand;
    FFiltrarChamadoQuadro5Command: TDBXCommand;
    FFiltrarChamadoQuadro6Command: TDBXCommand;
    FRetornaIdScopeCommand: TDBXCommand;
    FRetornaIdAtualCommand: TDBXCommand;
    FChamadoAnexosCommand: TDBXCommand;
    FChamadoQuadroCommand: TDBXCommand;
    FChamadoBuscarTotalHorasDoChamadoCommand: TDBXCommand;
    FFiltrarAtividadeCommand: TDBXCommand;
    FFiltrarAtividadeQuadro1Command: TDBXCommand;
    FFiltrarAtividadeQuadro2Command: TDBXCommand;
    FFiltrarAtividadeQuadro3Command: TDBXCommand;
    FFiltrarAtividadeQuadro4Command: TDBXCommand;
    FFiltrarAtividadeQuadro5Command: TDBXCommand;
    FFiltrarAtividadeQuadro6Command: TDBXCommand;
    FFiltrarSolicitacaoIdCommand: TDBXCommand;
    FFiltrarSolicitacaoQuadro1Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro2Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro3Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro4Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro5Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro6Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro7Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro8Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro9Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro10Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro11Command: TDBXCommand;
    FFiltrarSolicitacaoQuadro12Command: TDBXCommand;
    FFiltrarSolicitacaoCommand: TDBXCommand;
    FSalvarSolicitacaoCommand: TDBXCommand;
    FLocalizarCronogramaIdSolicitacaoCommand: TDBXCommand;
    FLocalizarCronogramaIdCommand: TDBXCommand;
    FLocalizarOcorrenciaGeralIdSolicitacaoCommand: TDBXCommand;
    FLocalizarOcorrenciaTecnicaIdSolicitacaoCommand: TDBXCommand;
    FLocalizarSolicitacaoStatusCommand: TDBXCommand;
    FSolicitacaoAnexosCommand: TDBXCommand;
    FSolicitracaoQuadroCommand: TDBXCommand;
    FSolicitacaoRelatorioCommand: TDBXCommand;
    FSolicitacaoTempoLocalizarIdCommand: TDBXCommand;
    FSolicitacaoTempoExcluirCommand: TDBXCommand;
    FSolicitacaoTempoLocalizarPorSolicitacaoCommand: TDBXCommand;
    FSolicitacaoTempoIniciarCommand: TDBXCommand;
    FSolicitacaoTempoFinalizarCommand: TDBXCommand;
    FSolicitacaoTempoListarStatusCommand: TDBXCommand;
    FSolicitacaoTempoAtualAbertaCommand: TDBXCommand;
    FSolicitacaoTempoSalvarCommand: TDBXCommand;
    FSolicitacaoPermissaoSolicitacaoTempoCommand: TDBXCommand;
    FPermissaoConferenciaTempoGeralCommand: TDBXCommand;
    FSolicitacaoTempoRetornarHorasAgrupadoPorStatusCommand: TDBXCommand;
    FSolicitacaoTempoFiltrarPorDataCommand: TDBXCommand;
    FAtividadeNovoCommand: TDBXCommand;
    FAtividadeExcluirCommand: TDBXCommand;
    FAtividadeEditarCommand: TDBXCommand;
    FAtividadeQuadroCommand: TDBXCommand;
    FLocalizarVersaoCommand: TDBXCommand;
    FFiltrarClienteCommand: TDBXCommand;
    FLocalizarCodigoClienteCommand: TDBXCommand;
    FLocalizarClienteModuloProdutoCommand: TDBXCommand;
    FClienteSalvarCommand: TDBXCommand;
    FClienteSalvarTesteCommand: TDBXCommand;
    FClienteLocaliarIdObjCommand: TDBXCommand;
    FClienteHistoricoCommand: TDBXCommand;
    FClienteImportarCommand: TDBXCommand;
    FClienteRelatoriosCommand: TDBXCommand;
    FUsuarioUsuarioADMCommand: TDBXCommand;
    FExisteUsuarioCommand: TDBXCommand;
    FLocalizarUsuarioCommand: TDBXCommand;
    FFiltrarUsuarioCommand: TDBXCommand;
    FRetornaNumeroSolicitacaoCommand: TDBXCommand;
    FFiltrarVisitaCommand: TDBXCommand;
    FFiltrarVersaoCommand: TDBXCommand;
    FFiltrarBaseConhCommand: TDBXCommand;
    FFiltrarStatusProgramaCommand: TDBXCommand;
    FLocalizarCodigoStatusProgramaCommand: TDBXCommand;
    FConferenciaFiltrarPorDataCommand: TDBXCommand;
    FFiltrarTipoProgramaCommand: TDBXCommand;
    FLocalizarCodigoTipoProgramaCommand: TDBXCommand;
    FTipoRetornoUmRegistroCommand: TDBXCommand;
    FStatus_LocalizarPorProgramaCommand: TDBXCommand;
    FLocalizarParametroCommand: TDBXCommand;
    FListarTabelasBancoDadosCommand: TDBXCommand;
    FListarTabelasCamposBancoDadosCommand: TDBXCommand;
    FInstrucaoSQLCommand: TDBXCommand;
    FChamadoListarProblemaSolucaoCommand: TDBXCommand;
    FAtividadeListarProblemaSolucaoCommand: TDBXCommand;
    FListaArquivosDiretorioCommand: TDBXCommand;
    FBuscarCaminhoImportacaoXMLCommand: TDBXCommand;
    FRetornarChamadoEmailsCommand: TDBXCommand;
    FRetornarChamadoEmailClienteCommand: TDBXCommand;
    FRetornarVisitaEmailsCommand: TDBXCommand;
    FRetornarVisitaEmailClienteCommand: TDBXCommand;
    FRetornarSolicitacaoEmailsCommand: TDBXCommand;
    FRetornarSolicitacaoEmailClienteCommand: TDBXCommand;
    FFiltrarRevendaCommand: TDBXCommand;
    FLocalizarCodigoRevendaCommand: TDBXCommand;
    FFiltrarModuloClienteCommand: TDBXCommand;
    FLocalizarModuloClienteCodigoCommand: TDBXCommand;
    FFiltrarUsuarioRevendaCommand: TDBXCommand;
    FLocalizarCodigoUsuarioCommand: TDBXCommand;
    FFiltrarRevendaEmailCommand: TDBXCommand;
    FUsuarioLocalizarNomeCommand: TDBXCommand;
    FExecutarSQLCommand: TDBXCommand;
    FSelectSQLCommand: TDBXCommand;
    FDepartamentoSalvarCommand: TDBXCommand;
    FDepartamentoFiltrarIdCommand: TDBXCommand;
    FDepartamentoMostrarAnexosCommand: TDBXCommand;
    FUsuarioRetornaListaPermissaoCommand: TDBXCommand;
    FBuscarTitulosQuadrosChamadosCommand: TDBXCommand;
    FParametrosAtualizarParametroCommand: TDBXCommand;
    FparametrosCaminhoAnexosCommand: TDBXCommand;
    FParametrosCaminhoXMLClientesCommand: TDBXCommand;
    FParametrosRevendaPadraoCommand: TDBXCommand;
    FParametrosExportarDadosBaseNovaCommand: TDBXCommand;
    FParametrosImportarDadosBaseNovaCommand: TDBXCommand;
    FStartTransacaoCommand: TDBXCommand;
    FCommitCommand: TDBXCommand;
    FRoolbackCommand: TDBXCommand;
    FPermissaoAcessarCommand: TDBXCommand;
    FPermissaoIncluirCommand: TDBXCommand;
    FPermissaoEditarCommand: TDBXCommand;
    FPermissaoExcluirCommand: TDBXCommand;
    FPermissaoRelatorioCommand: TDBXCommand;
    FPermissaoSolicitacaoAberturaCommand: TDBXCommand;
    FPermissaoSolicitacaoAnaliseCommand: TDBXCommand;
    FPermissaoSolicitacaoOcorrenciaGeralCommand: TDBXCommand;
    FPermissaoSolicitacaoOcorrenciaTecnicaCommand: TDBXCommand;
    FPermissaoSolicitacaoStatusCommand: TDBXCommand;
    FPermissaoSolicitacaoQuadroCommand: TDBXCommand;
    FPermissaoRecadoQuadroCommand: TDBXCommand;
    FPermissaoChamadoAberturaCommand: TDBXCommand;
    FPermissaoChamadoOcorrenciaCommand: TDBXCommand;
    FPermissaoChamadoStatusCommand: TDBXCommand;
    FPermissaoChamadoQuadroCommand: TDBXCommand;
    FPermissaoChamadoOcorrenciaDataHoraCommand: TDBXCommand;
    FPermissaoChamadoOcorrenciaAlterarCommand: TDBXCommand;
    FPermissaoChamadoOcorrenciaExcluirCommand: TDBXCommand;
    FPermissaoAtividadeAberturaCommand: TDBXCommand;
    FPermissaoAtividadeOcorrenciasCommand: TDBXCommand;
    FPermissaoAtividadeStatusCommand: TDBXCommand;
    FPermissaoAtividadeQuadroCommand: TDBXCommand;
    FPermissaoAtividadeOcorrenciaCommand: TDBXCommand;
    FPermissaoAtividadeOcorrenciaDataHoraCommand: TDBXCommand;
    FPermissaoAtividadeOcorrenciaAlterarCommand: TDBXCommand;
    FPermissaoAtividadeOcorrenciaExcluirCommand: TDBXCommand;
    FUsuarioAcessoMenuCommand: TDBXCommand;
    FExcluirPermissaoUsuarioCommand: TDBXCommand;
    FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand: TDBXCommand;
    FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand: TDBXCommand;
    FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand: TDBXCommand;
    FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand: TDBXCommand;
    FPermissaoOrcamentoAlteracaoSituacaoCommand: TDBXCommand;
    FPermissaoOrcamentoUsuarioCommand: TDBXCommand;
    FUsuarioPermissaoSalvarCommand: TDBXCommand;
    FVisitaAtualizacaoVersaoCommand: TDBXCommand;
    FBackupCommand: TDBXCommand;
    FRelatorioChamadoCommand: TDBXCommand;
    FRelatorioVisitaCommand: TDBXCommand;
    FRelatorioVisita2Command: TDBXCommand;
    FRelatorioVersaoCommand: TDBXCommand;
    FVersaoBuscarStatusDesenvolvimentoCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure DuplicacaoRegistro(CampoWhere: string; CampoValor: string; Tabela: string);
    procedure Novo(Programa: Integer; IdUsuario: Integer);
    procedure Excluir(Programa: Integer; IdUsuario: Integer; Id: Integer);
    function Editar(programa: Integer; Idusuario: Integer; Id: Integer): Boolean;
    procedure Filtrar(Programa: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
    procedure FiltrarCodigo(Programa: Integer; Codigo: Integer);
    procedure LocalizarId(Programa: Integer; Id: Integer);
    procedure LocalizarCodigo(Programa: Integer; Codigo: Integer);
    procedure Salvar(Programa: Integer; IdUsuario: Integer);
    function ProximoId(Programa: Integer): TJSONNumber;
    function ProximoIdGeral(ATabela: string): Integer;
    function ProximoCodigo(Programa: Integer): TJSONNumber;
    procedure Relatorio(Programa: Integer; IdUsuario: Integer);
    procedure FiltrarChamado(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
    procedure FiltrarIdChamado(IdChamado: Integer);
    procedure LocalizarChamadoOcorrencia(IdChamado: Integer);
    procedure LocalizarChamadoStatus(idChamado: Integer);
    procedure SalvarChamado(Programa: Integer; IdUsuario: Integer; ChamadoStatus: TJSONValue);
    function SalvarChamadoObj(IdUsuario: Integer; ChamadoVO: TJSONValue): TJSONNumber;
    procedure FiltrarChamadoQuadro1(IdUsuario: Integer);
    procedure FiltrarChamadoQuadro2(IdUsuario: Integer);
    procedure FiltrarChamadoQuadro3(IdUsuario: Integer);
    procedure FiltrarChamadoQuadro4(IdUsuario: Integer);
    procedure FiltrarChamadoQuadro5(IdUsuario: Integer);
    procedure FiltrarChamadoQuadro6(IdUsuario: Integer);
    function RetornaIdScope: Integer;
    function RetornaIdAtual(ATabela: string): Integer;
    procedure ChamadoAnexos(AIdChamado: Integer);
    procedure ChamadoQuadro(AIdUsuario: Integer; AIdRevenda: Integer);
    function ChamadoBuscarTotalHorasDoChamado(AIdChamado: Integer): Double;
    procedure FiltrarAtividade(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
    procedure FiltrarAtividadeQuadro1(IdUsuario: Integer);
    procedure FiltrarAtividadeQuadro2(IdUsuario: Integer);
    procedure FiltrarAtividadeQuadro3(IdUsuario: Integer);
    procedure FiltrarAtividadeQuadro4(IdUsuario: Integer);
    procedure FiltrarAtividadeQuadro5(IdUsuario: Integer);
    procedure FiltrarAtividadeQuadro6(IdUsuario: Integer);
    procedure FiltrarSolicitacaoId(IdSolicitacao: Integer);
    procedure FiltrarSolicitacaoQuadro1(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro2(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro3(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro4(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro5(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro6(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro7(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro8(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro9(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro10(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro11(IdUsuario: Integer);
    procedure FiltrarSolicitacaoQuadro12(IdUsuario: Integer);
    procedure FiltrarSolicitacao(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
    procedure SalvarSolicitacao(Programa: Integer; IdUsuario: Integer; SolicitacaoStatus: TJSONValue);
    procedure LocalizarCronogramaIdSolicitacao(IdSolicitacao: Integer);
    procedure LocalizarCronogramaId(Id: Integer);
    procedure LocalizarOcorrenciaGeralIdSolicitacao(IdSolicitacao: Integer);
    procedure LocalizarOcorrenciaTecnicaIdSolicitacao(IdSolicitacao: Integer);
    procedure LocalizarSolicitacaoStatus(IdSolicitacao: Integer);
    procedure SolicitacaoAnexos(AIdSolicitacao: Integer);
    procedure SolicitracaoQuadro(AIdUsuario: Integer);
    procedure SolicitacaoRelatorio(AModelo: Integer; AIdUsuario: Integer; AFiltro: TJSONValue; var AQtdeSolicitacao: Integer);
    function SolicitacaoTempoLocalizarId(AId: Integer): TJSONValue;
    procedure SolicitacaoTempoExcluir(AId: Integer);
    function SolicitacaoTempoLocalizarPorSolicitacao(AIdSolicitacao: Integer): TJSONValue;
    procedure SolicitacaoTempoIniciar(AIdUsuarioLogado: Integer; ASolicitacaoTempoVO: TJSONValue);
    procedure SolicitacaoTempoFinalizar(AIdUsuarioLogado: Integer; ASolicitacaoTempoVO: TJSONValue; AValidarUsuario: Boolean);
    function SolicitacaoTempoListarStatus: TJSONArray;
    function SolicitacaoTempoAtualAberta(AIdSolicitacao: Integer): Boolean;
    function SolicitacaoTempoSalvar(ASolicitacaoTempoVO: TJSONValue): TJSONNumber;
    function SolicitacaoPermissaoSolicitacaoTempo(IdUsuario: Integer): Boolean;
    function PermissaoConferenciaTempoGeral(IdUsuario: Integer): Boolean;
    function SolicitacaoTempoRetornarHorasAgrupadoPorStatus(AIdSolicitacao: Integer): TJSONValue;
    function SolicitacaoTempoFiltrarPorData(AData: string; AId: Integer; AIdUsuario: Integer): TJSONValue;
    procedure AtividadeNovo(AIdUsuario: Integer);
    procedure AtividadeExcluir(AIdUsuario: Integer; AId: Integer);
    function AtividadeEditar(AIdUsuario: Integer; AId: Integer): Boolean;
    procedure AtividadeQuadro(AIdUsuario: Integer; AIdRevenda: Integer);
    procedure LocalizarVersao(AVersao: string);
    procedure FiltrarCliente(Filtro: TJSONValue; Programa: Integer; IdUsuario: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
    procedure LocalizarCodigoCliente(Codigo: Integer; IdUsuario: Integer);
    procedure LocalizarClienteModuloProduto(IdCliente: Integer; IdModulo: Integer);
    function ClienteSalvar(ACliente: TJSONValue): TJSONNumber;
    function ClienteSalvarTeste: TJSONValue;
    function ClienteLocaliarIdObj(AId: Integer; ADetalhes: Boolean): TJSONValue;
    function ClienteHistorico(AIdCliente: Integer): TJSONValue;
    procedure ClienteImportar(ACliente: TJSONValue);
    function ClienteRelatorios(AModelo: Integer; AIdUsuario: Integer; AFiltro: TJSONValue): string;
    function UsuarioUsuarioADM(AIdUsuario: Integer): Boolean;
    function ExisteUsuario: Boolean;
    procedure LocalizarUsuario(UserName: string; Password: string);
    procedure FiltrarUsuario(Filtro: TJSONValue; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
    function RetornaNumeroSolicitacao(IdSolicitacao: Integer): TJSONNumber;
    procedure FiltrarVisita(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
    procedure FiltrarVersao(Filtro: TJSONValue; Campo: string; Texto: string; Contem: Boolean);
    procedure FiltrarBaseConh(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
    procedure FiltrarStatusPrograma(Campo: string; Texto: string; Ativo: string; StatusPrograma: Integer; Contem: Boolean);
    procedure LocalizarCodigoStatusPrograma(StatusPrograma: Integer; Codigo: Integer);
    function ConferenciaFiltrarPorData(AData: string; AIdUsuario: Integer): TJSONValue;
    procedure FiltrarTipoPrograma(Campo: string; Texto: string; Ativo: string; TipoPrograma: Integer; Contem: Boolean);
    procedure LocalizarCodigoTipoPrograma(TipoPrograma: Integer; Codigo: Integer);
    function TipoRetornoUmRegistro(APrograma: Integer): TJSONValue;
    function Status_LocalizarPorPrograma(ATipo: Integer): TJSONValue;
    function LocalizarParametro(Codigo: Integer; Programa: Integer): string;
    procedure ListarTabelasBancoDados;
    procedure ListarTabelasCamposBancoDados(Tabela: string);
    procedure InstrucaoSQL(ComandoSQL: string; Tipo: Integer);
    procedure ChamadoListarProblemaSolucao(Filtro: TJSONValue; Texto: string; IdUsuario: Integer);
    procedure AtividadeListarProblemaSolucao(Filtro: TJSONValue; Texto: string; IdUsuario: Integer);
    function ListaArquivosDiretorio(Diretorio: string; Extensao: string): TJSONArray;
    function BuscarCaminhoImportacaoXML: string;
    function RetornarChamadoEmails(IdChamado: Integer; IdUsuario: Integer; IdStatus: Integer): string;
    function RetornarChamadoEmailCliente(idChamado: Integer; IdUsuario: Integer): string;
    function RetornarVisitaEmails(IdVisita: Integer; IdUsuario: Integer; IdStatus: Integer): string;
    function RetornarVisitaEmailCliente(idVisita: Integer; IdUsuario: Integer): string;
    function RetornarSolicitacaoEmails(IdSolicitacao: Integer; IdUsuario: Integer; IdStatus: Integer): string;
    function RetornarSolicitacaoEmailCliente(IdSolicitacao: Integer; IdUsuario: Integer): string;
    procedure FiltrarRevenda(Campo: string; Texto: string; Ativo: string; IdUsuario: Integer; Contem: Boolean);
    procedure LocalizarCodigoRevenda(Codigo: Integer; IdUsuario: Integer);
    procedure FiltrarModuloCliente(IdCliente: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
    procedure LocalizarModuloClienteCodigo(IdCliente: Integer; Codigo: Integer);
    procedure FiltrarUsuarioRevenda(Filtro: TJSONValue; IdUsuario: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
    procedure LocalizarCodigoUsuario(Codigo: Integer; IdUsuario: Integer);
    procedure FiltrarRevendaEmail(IdRevenda: Integer);
    procedure UsuarioLocalizarNome(Nome: string);
    procedure ExecutarSQL(InstrucaoSQL: string);
    function SelectSQL(InstrucaoSQL: string): string;
    function DepartamentoSalvar(ADepartamento: TJSONValue): TJSONNumber;
    procedure DepartamentoFiltrarId(AId: Integer);
    function DepartamentoMostrarAnexos(AIdUsuario: Integer): Boolean;
    function UsuarioRetornaListaPermissao: TJSONArray;
    procedure BuscarTitulosQuadrosChamados;
    procedure ParametrosAtualizarParametro(ACodigo: Integer; APrograma: Integer; AValor: string);
    function parametrosCaminhoAnexos: string;
    function ParametrosCaminhoXMLClientes: string;
    function ParametrosRevendaPadrao(AIdUsuario: Integer): TJSONNumber;
    procedure ParametrosExportarDadosBaseNova;
    procedure ParametrosImportarDadosBaseNova;
    procedure StartTransacao;
    procedure Commit;
    procedure Roolback;
    procedure PermissaoAcessar(Programa: Integer; IdUsuario: Integer);
    procedure PermissaoIncluir(Programa: Integer; IdUsuario: Integer);
    procedure PermissaoEditar(Programa: Integer; IdUsuario: Integer);
    procedure PermissaoExcluir(Programa: Integer; IdUsuario: Integer);
    procedure PermissaoRelatorio(Programa: Integer; IdUsuario: Integer);
    function PermissaoSolicitacaoAbertura(IdUsuario: Integer): Boolean;
    function PermissaoSolicitacaoAnalise(IdUsuario: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaGeral(IdUsuario: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnica(IdUsuario: Integer): Boolean;
    function PermissaoSolicitacaoStatus(IdUsuario: Integer): Boolean;
    function PermissaoSolicitacaoQuadro(IdUsuario: Integer): Boolean;
    function PermissaoRecadoQuadro(IdUsuario: Integer): Boolean;
    function PermissaoChamadoAbertura(IdUsuario: Integer): Boolean;
    function PermissaoChamadoOcorrencia(IdUsuario: Integer): Boolean;
    function PermissaoChamadoStatus(IdUsuario: Integer): Boolean;
    function PermissaoChamadoQuadro(IdUsuario: Integer): Boolean;
    function PermissaoChamadoOcorrenciaDataHora(IdUsuario: Integer; out MesmoUsuario: Boolean; Id: Integer): Boolean;
    function PermissaoChamadoOcorrenciaAlterar(IdUsuario: Integer; out Perfil: Integer; Id: Integer): Boolean;
    function PermissaoChamadoOcorrenciaExcluir(IdUsuario: Integer; Id: Integer): Boolean;
    function PermissaoAtividadeAbertura(IdUsuario: Integer): Boolean;
    function PermissaoAtividadeOcorrencias(IdUsuario: Integer): Boolean;
    function PermissaoAtividadeStatus(IdUsuario: Integer): Boolean;
    function PermissaoAtividadeQuadro(IdUsuario: Integer): Boolean;
    function PermissaoAtividadeOcorrencia(AIdUsuario: Integer; ATipo: Integer; AId: Integer): Boolean;
    function PermissaoAtividadeOcorrenciaDataHora(IdUsuario: Integer; out MesmoUsuario: Boolean; Id: Integer): Boolean;
    function PermissaoAtividadeOcorrenciaAlterar(IdUsuario: Integer; out Perfil: Integer; Id: Integer): Boolean;
    function PermissaoAtividadeOcorrenciaExcluir(IdUsuario: Integer; Id: Integer): Boolean;
    procedure UsuarioAcessoMenu(IdUsuario: Integer);
    procedure ExcluirPermissaoUsuario(IdUsuario: Integer);
    function PermissaoSolicitacaoOcorrenciaGeralAlterar(IdUsuario: Integer; Id: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaGeralExcluir(IdUsuario: Integer; Id: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnicaAlterar(IdUsuario: Integer; Id: Integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnicaExcluir(IdUsuario: Integer; Id: Integer): Boolean;
    function PermissaoOrcamentoAlteracaoSituacao(IdUsuario: Integer): Boolean;
    function PermissaoOrcamentoUsuario(IdUsuario: Integer): Boolean;
    procedure UsuarioPermissaoSalvar(IdUsuario: Integer; Sigla: string);
    function VisitaAtualizacaoVersao(AIdCliente: Integer; AIdTipo: Integer; AVersao: string): string;
    procedure Backup(Destino: string);
    procedure RelatorioChamado(Modelo: Integer; IdUsuario: Integer; Filtro: TJSONValue; Ordem: string; ATipo: Integer);
    procedure RelatorioVisita(Modelo: Integer; IdUsuario: Integer; Filtro: TJSONValue; Ordem: string);
    function RelatorioVisita2(AModelo: Integer; AIdUsuario: Integer; AFiltro: TJSONValue): TJSONValue;
    procedure RelatorioVersao(AModelo: Integer; AIdVersao: Integer; out AQtdeRetorno: Integer; AFiltro: TJSONValue);
    function VersaoBuscarStatusDesenvolvimento: Integer;
  end;

  TServerModule2Client = class(TDSAdminClient)
  private
    FNovoCommand: TDBXCommand;
    FExcluirCommand: TDBXCommand;
    FEditarCommand: TDBXCommand;
    FFiltrarCommand: TDBXCommand;
    FFiltrarCodigoCommand: TDBXCommand;
    FLocalizarIdCommand: TDBXCommand;
    FLocalizarCodigoCommand: TDBXCommand;
    FSalvarCommand: TDBXCommand;
    FProximoIdCommand: TDBXCommand;
    FProximoCodigoCommand: TDBXCommand;
    FRelatorioCommand: TDBXCommand;
    FAgendamentoNovoCommand: TDBXCommand;
    FAgendamentoExcluirCommand: TDBXCommand;
    FAgendamentoEditarCommand: TDBXCommand;
    FAgendamentoFiltrarCommand: TDBXCommand;
    FAgendamentoFiltarIdCommand: TDBXCommand;
    FAgendamentoLocalizarIdCommand: TDBXCommand;
    FAgendamentoSalvarCommand: TDBXCommand;
    FAgendamentoRelatorioCommand: TDBXCommand;
    FAgendamentoQuadroCommand: TDBXCommand;
    FAgendamentoPermissaoQuadroCommand: TDBXCommand;
    FAgendamentoReagendamentoCommand: TDBXCommand;
    FAgendamentoCancelamentoCommand: TDBXCommand;
    FAgendamentoEncerramentoCommand: TDBXCommand;
    FAgendamentoLocalizarStatusAberturaCommand: TDBXCommand;
    FAgendamentoTipoProgramaCommand: TDBXCommand;
    FAgendamentoRetornarEmailsCommand: TDBXCommand;
    FAgendamentoRetornarClienteCommand: TDBXCommand;
    FAgendamentoAbertoCommand: TDBXCommand;
    FPlanoBackupExcluirCommand: TDBXCommand;
    FPlanoBackupLocalizarCommand: TDBXCommand;
    FPlanoBackupLocalizarItemCommand: TDBXCommand;
    FPlanoBackupExcluirItemCommand: TDBXCommand;
    FPlanoBackupSalvarCommand: TDBXCommand;
    FObservacaoSalvarCommand: TDBXCommand;
    FFiltrarObservacaoProgramaCommand: TDBXCommand;
    FObservacaoPadraoCommand: TDBXCommand;
    FObservacaoEmailPadraoCommand: TDBXCommand;
    FEscalaSalvarCommand: TDBXCommand;
    FEscalaFiltrarCommand: TDBXCommand;
    FEscalaRelatoriosCommand: TDBXCommand;
    FEscalaBuscarUltimaDataCommand: TDBXCommand;
    FModeloRelatorioSalvarCommand: TDBXCommand;
    FFormaPagtoSalvarCommand: TDBXCommand;
    FFormaPagtoFiltroItemCommand: TDBXCommand;
    FPlanoBackupGerarCommand: TDBXCommand;
    FSalvarProspectCommand: TDBXCommand;
    FFiltrarProspectCommand: TDBXCommand;
    FLocalizarCodigoProspectCommand: TDBXCommand;
    FEmailLocalizarCodigoCommand: TDBXCommand;
    FEmailProspectNovoCommand: TDBXCommand;
    FEmailProspectEditarEmailCommand: TDBXCommand;
    FEmailProspectExcluirEmailCommand: TDBXCommand;
    FFiltrarOrcamentoCommand: TDBXCommand;
    FOrcamentoFiltrarIdCommand: TDBXCommand;
    FOrcamentoGerarParcelaCommand: TDBXCommand;
    FOrcamentoGerarParcelaDifUltimaCommand: TDBXCommand;
    FOrcamentoAtualizarSituacaoCommand: TDBXCommand;
    FOrcamentoImprimirCommand: TDBXCommand;
    FOrcamentoEmailEnviadoCommand: TDBXCommand;
    FOrcamentoProximoNumeroCommand: TDBXCommand;
    FOrcamentoSalvarCommand: TDBXCommand;
    FOrcamentoDuplicarCommand: TDBXCommand;
    FOrcamentoEmailSupervisorCommand: TDBXCommand;
    FOrcamentoBuscarEmailRemetenteSeteDiasCommand: TDBXCommand;
    FOrcamentoUsuarioMesmoCadastroCommand: TDBXCommand;
    FOrcamentoRelatoriosCommand: TDBXCommand;
    FOrcamentoItemLocalizarCommand: TDBXCommand;
    FOrcamentoItemModuloLocalizarCommand: TDBXCommand;
    FOrcamentoOcorrenciaLocalizarCommand: TDBXCommand;
    FOrcamentoVenctoLocalizarCommand: TDBXCommand;
    FOrcamentoListarEmailCommand: TDBXCommand;
    FOrcamentoListarEmailSeteDiasParaSupervisorCommand: TDBXCommand;
    FRamalSalvarCommand: TDBXCommand;
    FRamalFiltrarIdCommand: TDBXCommand;
    FRamalListarItensCommand: TDBXCommand;
    FOrcamentoNaoAprovadoLocalizarIdCommand: TDBXCommand;
    FOrcamentoNaoAprovadoLocalizarOrcamentoCommand: TDBXCommand;
    FOrcamentoNaoAprovadoExcluirCommand: TDBXCommand;
    FOrcamentoNaoAprovadoSalvarCommand: TDBXCommand;
    FRecadoFiltrarCommand: TDBXCommand;
    FRecadoFiltrarIdCommand: TDBXCommand;
    FRecadoSalvarCommand: TDBXCommand;
    FRecadoQuadroCommand: TDBXCommand;
    FRecadoPermissaoUsuarioCommand: TDBXCommand;
    FStatusEncerramentoRecadosCommand: TDBXCommand;
    FStatusAberturaRecadosCommand: TDBXCommand;
    FUsuarioRelRendimentoCommand: TDBXCommand;
    FUsuarioDiasTrabalhadosCommand: TDBXCommand;
    FContatoExcluirCommand: TDBXCommand;
    FContatoLocalizarPorIdCommand: TDBXCommand;
    FContatoLocalizarPorClienteCommand: TDBXCommand;
    FContatoLocalizarPorOrcamentoCommand: TDBXCommand;
    FLicencasImportarCommand: TDBXCommand;
    FLicencasListarTodosCommand: TDBXCommand;
    FLicencasListarTodosItensCommand: TDBXCommand;
    FParametrosCaminhoAplicativoImportarLicencasCommand: TDBXCommand;
    FLicencaPermissaoAcessarCommand: TDBXCommand;
    FLicencasSalvarCommand: TDBXCommand;
    FLicencasLimparCommand: TDBXCommand;
    FModeloRelatoriosFiltrarCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure Novo(Programa: Integer; IdUsuario: Integer);
    procedure Excluir(Programa: Integer; IdUsuario: Integer; Id: Integer);
    function Editar(programa: Integer; Idusuario: Integer; Id: Integer): Boolean;
    procedure Filtrar(Programa: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
    procedure FiltrarCodigo(Programa: Integer; Codigo: Integer);
    procedure LocalizarId(Programa: Integer; Id: Integer);
    procedure LocalizarCodigo(Programa: Integer; Codigo: Integer);
    procedure Salvar(Programa: Integer; IdUsuario: Integer);
    function ProximoId(Programa: Integer): TJSONNumber;
    function ProximoCodigo(Programa: Integer): TJSONNumber;
    procedure Relatorio(Programa: Integer; IdUsuario: Integer);
    procedure AgendamentoNovo(APrograma: Integer; AIdUsuario: Integer);
    procedure AgendamentoExcluir(APrograma: Integer; AIdUsuario: Integer; AId: Integer);
    function AgendamentoEditar(APrograma: Integer; AIdUsuario: Integer; AId: Integer): Boolean;
    function AgendamentoFiltrar(Filtro: TJSONValue; ACampo: string; ATexto: string; AIdUsuario: Integer; AContem: Boolean): string;
    function AgendamentoFiltarId(AId: Integer): string;
    function AgendamentoLocalizarId(APrograma: Integer; AId: Integer): Boolean;
    function AgendamentoSalvar(APrograma: Integer; AIdUsuario: Integer; AAgendamentoVO: TJSONValue): Integer;
    procedure AgendamentoRelatorio(APrograma: Integer; AIdUsuario: Integer);
    procedure AgendamentoQuadro(ADataInicial: string; ADataFinal: string; AIdUsuario: Integer; AIdRevenda: Integer);
    function AgendamentoPermissaoQuadro(AIdUsuario: Integer): Boolean;
    procedure AgendamentoReagendamento(AIdUsuario: Integer; AIdAgendamento: Integer; AData: string; AHora: string; ATexto: string);
    procedure AgendamentoCancelamento(AIdUsuario: Integer; AIdAgendamento: Integer; AData: string; AHora: string; ATexto: string);
    procedure AgendamentoEncerramento(AIdUsuario: Integer; AIdAgendamento: Integer; AIdPrograma: Integer);
    function AgendamentoLocalizarStatusAbertura: Integer;
    function AgendamentoTipoPrograma(AIdAgenda: Integer): Integer;
    function AgendamentoRetornarEmails(AIdAgenda: Integer; AIdUsuario: Integer; AIdStatus: Integer): string;
    function AgendamentoRetornarCliente(AIdAgenda: Integer; AIdUsuario: Integer): string;
    function AgendamentoAberto(AIdUsuario: Integer): Boolean;
    procedure PlanoBackupExcluir(AId: Integer);
    procedure PlanoBackupLocalizar;
    procedure PlanoBackupLocalizarItem(AId: Integer);
    procedure PlanoBackupExcluirItem(AId: Integer);
    procedure PlanoBackupSalvar(APlanoBackup: TJSONValue; APlanoItens: TJSONValue);
    function ObservacaoSalvar(AObservacaoVO: TJSONValue): Integer;
    procedure FiltrarObservacaoPrograma(Campo: string; Texto: string; Ativo: string; StatusPrograma: Integer; Contem: Boolean);
    procedure ObservacaoPadrao(APrograma: Integer);
    procedure ObservacaoEmailPadrao(APrograma: Integer);
    function EscalaSalvar(AEscalaVO: TJSONValue; AIdUsuario: Integer): Integer;
    function EscalaFiltrar(Filtro: TJSONValue; ACampo: string; ATexto: string; AIdUsuario: Integer; AContem: Boolean): string;
    procedure EscalaRelatorios(AFiltro: TJSONValue; AModelo: Integer);
    function EscalaBuscarUltimaData: string;
    function ModeloRelatorioSalvar(AModeloRelatorioVO: TJSONValue): Integer;
    function FormaPagtoSalvar(AFormaPagtoVO: TJSONValue): Integer;
    procedure FormaPagtoFiltroItem(AIdFormaPagto: Integer);
    procedure PlanoBackupGerar;
    function SalvarProspect(AIdUsuario: Integer; AProspectVO: TJSONValue): Integer;
    procedure FiltrarProspect(Filtro: TJSONValue; Programa: Integer; IdUsuario: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
    procedure LocalizarCodigoProspect(Codigo: Integer; IdUsuario: Integer);
    procedure EmailLocalizarCodigo(AIdProspect: Integer);
    procedure EmailProspectNovo(Programa: Integer; IdUsuario: Integer);
    function EmailProspectEditarEmail(Programa: Integer; IdUsuario: Integer): Boolean;
    procedure EmailProspectExcluirEmail(APrograma: Integer; AIdUsuario: Integer; AId: Integer);
    procedure FiltrarOrcamento(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
    procedure OrcamentoFiltrarId(AId: Integer);
    procedure OrcamentoGerarParcela(AIdFormaPagto: Integer; ATotalOrcamento: Currency; out AValorPrimeira: Currency; out AValorOutras: Currency);
    procedure OrcamentoGerarParcelaDifUltima(AQtdeParcelas: Integer; ATotalOrcamento: Currency; out AValorUltima: Currency; out AValorOutras: Currency);
    procedure OrcamentoAtualizarSituacao(ASituacao: Integer; AId: Integer);
    procedure OrcamentoImprimir(AIdOrcamento: Integer);
    procedure OrcamentoEmailEnviado(AIdOrcamento: Integer);
    function OrcamentoProximoNumero: TJSONNumber;
    function OrcamentoSalvar(AOrcamento: TJSONValue): TJSONNumber;
    function OrcamentoDuplicar(AIdOrcamento: Integer): TJSONNumber;
    function OrcamentoEmailSupervisor(AIdUsuario: Integer): string;
    function OrcamentoBuscarEmailRemetenteSeteDias: Integer;
    function OrcamentoUsuarioMesmoCadastro(AId: Integer; AIdUsuario: Integer; ATipoOperacao: Integer): Boolean;
    procedure OrcamentoRelatorios(AFiltro: TJSONValue; ATipo: Integer; AIdUsuario: Integer);
    procedure OrcamentoItemLocalizar(AIdOrdem: Integer);
    procedure OrcamentoItemModuloLocalizar(AIdOrdemItem: Integer);
    procedure OrcamentoOcorrenciaLocalizar(AIdOrdem: Integer);
    procedure OrcamentoVenctoLocalizar(AIdOrdem: Integer);
    function OrcamentoListarEmail(AIdOrdem: Integer): TJSONValue;
    function OrcamentoListarEmailSeteDiasParaSupervisor: TJSONValue;
    function RamalSalvar(AIdUsuario: Integer; ARamalVO: TJSONValue): Integer;
    procedure RamalFiltrarId(AId: Integer);
    procedure RamalListarItens(AIdRamal: Integer);
    function OrcamentoNaoAprovadoLocalizarId(AId: Integer): TJSONValue;
    function OrcamentoNaoAprovadoLocalizarOrcamento(AIdOrcamento: Integer): TJSONValue;
    procedure OrcamentoNaoAprovadoExcluir(AId: Integer);
    procedure OrcamentoNaoAprovadoSalvar(AOrcamentoNAprovado: TJSONValue);
    procedure RecadoFiltrar(Filtro: TJSONValue; Campo: string; Texto: string; Contem: Boolean);
    procedure RecadoFiltrarId(AId: Integer);
    function RecadoSalvar(ARecado: TJSONValue): TJSONNumber;
    procedure RecadoQuadro(AIdUsuario: Integer; AIdRevenda: Integer);
    function RecadoPermissaoUsuario(AIdUsuario: Integer; AAcao: string): Boolean;
    function StatusEncerramentoRecados: TJSONValue;
    function StatusAberturaRecados: TJSONValue;
    procedure UsuarioRelRendimento(ADataInicial: string; ADataFinal: string);
    function UsuarioDiasTrabalhados(ADataInicial: string; ADataFinal: string): TJSONValue;
    procedure ContatoExcluir(AId: Integer);
    function ContatoLocalizarPorId(AId: Integer): TJSONValue;
    function ContatoLocalizarPorCliente(AIdCliente: Integer): TJSONValue;
    function ContatoLocalizarPorOrcamento(AIdOrcamento: Integer): TJSONValue;
    procedure LicencasImportar;
    function LicencasListarTodos(AFiltro: TJSONValue): TJSONValue;
    function LicencasListarTodosItens(AFiltro: TJSONValue): TJSONValue;
    function ParametrosCaminhoAplicativoImportarLicencas: string;
    procedure LicencaPermissaoAcessar(APrograma: Integer; AIdUsuario: Integer);
    function LicencasSalvar(ALicenca: TJSONValue; ALicencaItens: TJSONValue): string;
    function LicencasLimpar: string;
    procedure ModeloRelatoriosFiltrar(Campo: string; Texto: string; Ativo: string; IdUsuario: Integer; Contem: Boolean);
  end;

implementation

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods1.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods1.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

procedure TServerMethods1Client.DuplicacaoRegistro(CampoWhere: string; CampoValor: string; Tabela: string);
begin
  if FDuplicacaoRegistroCommand = nil then
  begin
    FDuplicacaoRegistroCommand := FDBXConnection.CreateCommand;
    FDuplicacaoRegistroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDuplicacaoRegistroCommand.Text := 'TServerMethods1.DuplicacaoRegistro';
    FDuplicacaoRegistroCommand.Prepare;
  end;
  FDuplicacaoRegistroCommand.Parameters[0].Value.SetWideString(CampoWhere);
  FDuplicacaoRegistroCommand.Parameters[1].Value.SetWideString(CampoValor);
  FDuplicacaoRegistroCommand.Parameters[2].Value.SetWideString(Tabela);
  FDuplicacaoRegistroCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.Novo(Programa: Integer; IdUsuario: Integer);
begin
  if FNovoCommand = nil then
  begin
    FNovoCommand := FDBXConnection.CreateCommand;
    FNovoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FNovoCommand.Text := 'TServerMethods1.Novo';
    FNovoCommand.Prepare;
  end;
  FNovoCommand.Parameters[0].Value.SetInt32(Programa);
  FNovoCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FNovoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.Excluir(Programa: Integer; IdUsuario: Integer; Id: Integer);
begin
  if FExcluirCommand = nil then
  begin
    FExcluirCommand := FDBXConnection.CreateCommand;
    FExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExcluirCommand.Text := 'TServerMethods1.Excluir';
    FExcluirCommand.Prepare;
  end;
  FExcluirCommand.Parameters[0].Value.SetInt32(Programa);
  FExcluirCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FExcluirCommand.Parameters[2].Value.SetInt32(Id);
  FExcluirCommand.ExecuteUpdate;
end;

function TServerMethods1Client.Editar(programa: Integer; Idusuario: Integer; Id: Integer): Boolean;
begin
  if FEditarCommand = nil then
  begin
    FEditarCommand := FDBXConnection.CreateCommand;
    FEditarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEditarCommand.Text := 'TServerMethods1.Editar';
    FEditarCommand.Prepare;
  end;
  FEditarCommand.Parameters[0].Value.SetInt32(programa);
  FEditarCommand.Parameters[1].Value.SetInt32(Idusuario);
  FEditarCommand.Parameters[2].Value.SetInt32(Id);
  FEditarCommand.ExecuteUpdate;
  Result := FEditarCommand.Parameters[3].Value.GetBoolean;
end;

procedure TServerMethods1Client.Filtrar(Programa: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
begin
  if FFiltrarCommand = nil then
  begin
    FFiltrarCommand := FDBXConnection.CreateCommand;
    FFiltrarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarCommand.Text := 'TServerMethods1.Filtrar';
    FFiltrarCommand.Prepare;
  end;
  FFiltrarCommand.Parameters[0].Value.SetInt32(Programa);
  FFiltrarCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarCommand.Parameters[3].Value.SetWideString(Ativo);
  FFiltrarCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarCodigo(Programa: Integer; Codigo: Integer);
begin
  if FFiltrarCodigoCommand = nil then
  begin
    FFiltrarCodigoCommand := FDBXConnection.CreateCommand;
    FFiltrarCodigoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarCodigoCommand.Text := 'TServerMethods1.FiltrarCodigo';
    FFiltrarCodigoCommand.Prepare;
  end;
  FFiltrarCodigoCommand.Parameters[0].Value.SetInt32(Programa);
  FFiltrarCodigoCommand.Parameters[1].Value.SetInt32(Codigo);
  FFiltrarCodigoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarId(Programa: Integer; Id: Integer);
begin
  if FLocalizarIdCommand = nil then
  begin
    FLocalizarIdCommand := FDBXConnection.CreateCommand;
    FLocalizarIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarIdCommand.Text := 'TServerMethods1.LocalizarId';
    FLocalizarIdCommand.Prepare;
  end;
  FLocalizarIdCommand.Parameters[0].Value.SetInt32(Programa);
  FLocalizarIdCommand.Parameters[1].Value.SetInt32(Id);
  FLocalizarIdCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarCodigo(Programa: Integer; Codigo: Integer);
begin
  if FLocalizarCodigoCommand = nil then
  begin
    FLocalizarCodigoCommand := FDBXConnection.CreateCommand;
    FLocalizarCodigoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCodigoCommand.Text := 'TServerMethods1.LocalizarCodigo';
    FLocalizarCodigoCommand.Prepare;
  end;
  FLocalizarCodigoCommand.Parameters[0].Value.SetInt32(Programa);
  FLocalizarCodigoCommand.Parameters[1].Value.SetInt32(Codigo);
  FLocalizarCodigoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.Salvar(Programa: Integer; IdUsuario: Integer);
begin
  if FSalvarCommand = nil then
  begin
    FSalvarCommand := FDBXConnection.CreateCommand;
    FSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSalvarCommand.Text := 'TServerMethods1.Salvar';
    FSalvarCommand.Prepare;
  end;
  FSalvarCommand.Parameters[0].Value.SetInt32(Programa);
  FSalvarCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FSalvarCommand.ExecuteUpdate;
end;

function TServerMethods1Client.ProximoId(Programa: Integer): TJSONNumber;
begin
  if FProximoIdCommand = nil then
  begin
    FProximoIdCommand := FDBXConnection.CreateCommand;
    FProximoIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FProximoIdCommand.Text := 'TServerMethods1.ProximoId';
    FProximoIdCommand.Prepare;
  end;
  FProximoIdCommand.Parameters[0].Value.SetInt32(Programa);
  FProximoIdCommand.ExecuteUpdate;
  Result := TJSONNumber(FProximoIdCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.ProximoIdGeral(ATabela: string): Integer;
begin
  if FProximoIdGeralCommand = nil then
  begin
    FProximoIdGeralCommand := FDBXConnection.CreateCommand;
    FProximoIdGeralCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FProximoIdGeralCommand.Text := 'TServerMethods1.ProximoIdGeral';
    FProximoIdGeralCommand.Prepare;
  end;
  FProximoIdGeralCommand.Parameters[0].Value.SetWideString(ATabela);
  FProximoIdGeralCommand.ExecuteUpdate;
  Result := FProximoIdGeralCommand.Parameters[1].Value.GetInt32;
end;

function TServerMethods1Client.ProximoCodigo(Programa: Integer): TJSONNumber;
begin
  if FProximoCodigoCommand = nil then
  begin
    FProximoCodigoCommand := FDBXConnection.CreateCommand;
    FProximoCodigoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FProximoCodigoCommand.Text := 'TServerMethods1.ProximoCodigo';
    FProximoCodigoCommand.Prepare;
  end;
  FProximoCodigoCommand.Parameters[0].Value.SetInt32(Programa);
  FProximoCodigoCommand.ExecuteUpdate;
  Result := TJSONNumber(FProximoCodigoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.Relatorio(Programa: Integer; IdUsuario: Integer);
begin
  if FRelatorioCommand = nil then
  begin
    FRelatorioCommand := FDBXConnection.CreateCommand;
    FRelatorioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioCommand.Text := 'TServerMethods1.Relatorio';
    FRelatorioCommand.Prepare;
  end;
  FRelatorioCommand.Parameters[0].Value.SetInt32(Programa);
  FRelatorioCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FRelatorioCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarChamado(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
begin
  if FFiltrarChamadoCommand = nil then
  begin
    FFiltrarChamadoCommand := FDBXConnection.CreateCommand;
    FFiltrarChamadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarChamadoCommand.Text := 'TServerMethods1.FiltrarChamado';
    FFiltrarChamadoCommand.Prepare;
  end;
  FFiltrarChamadoCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarChamadoCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarChamadoCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarChamadoCommand.Parameters[3].Value.SetInt32(IdUsuario);
  FFiltrarChamadoCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarChamadoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarIdChamado(IdChamado: Integer);
begin
  if FFiltrarIdChamadoCommand = nil then
  begin
    FFiltrarIdChamadoCommand := FDBXConnection.CreateCommand;
    FFiltrarIdChamadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarIdChamadoCommand.Text := 'TServerMethods1.FiltrarIdChamado';
    FFiltrarIdChamadoCommand.Prepare;
  end;
  FFiltrarIdChamadoCommand.Parameters[0].Value.SetInt32(IdChamado);
  FFiltrarIdChamadoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarChamadoOcorrencia(IdChamado: Integer);
begin
  if FLocalizarChamadoOcorrenciaCommand = nil then
  begin
    FLocalizarChamadoOcorrenciaCommand := FDBXConnection.CreateCommand;
    FLocalizarChamadoOcorrenciaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarChamadoOcorrenciaCommand.Text := 'TServerMethods1.LocalizarChamadoOcorrencia';
    FLocalizarChamadoOcorrenciaCommand.Prepare;
  end;
  FLocalizarChamadoOcorrenciaCommand.Parameters[0].Value.SetInt32(IdChamado);
  FLocalizarChamadoOcorrenciaCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarChamadoStatus(idChamado: Integer);
begin
  if FLocalizarChamadoStatusCommand = nil then
  begin
    FLocalizarChamadoStatusCommand := FDBXConnection.CreateCommand;
    FLocalizarChamadoStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarChamadoStatusCommand.Text := 'TServerMethods1.LocalizarChamadoStatus';
    FLocalizarChamadoStatusCommand.Prepare;
  end;
  FLocalizarChamadoStatusCommand.Parameters[0].Value.SetInt32(idChamado);
  FLocalizarChamadoStatusCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.SalvarChamado(Programa: Integer; IdUsuario: Integer; ChamadoStatus: TJSONValue);
begin
  if FSalvarChamadoCommand = nil then
  begin
    FSalvarChamadoCommand := FDBXConnection.CreateCommand;
    FSalvarChamadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSalvarChamadoCommand.Text := 'TServerMethods1.SalvarChamado';
    FSalvarChamadoCommand.Prepare;
  end;
  FSalvarChamadoCommand.Parameters[0].Value.SetInt32(Programa);
  FSalvarChamadoCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FSalvarChamadoCommand.Parameters[2].Value.SetJSONValue(ChamadoStatus, FInstanceOwner);
  FSalvarChamadoCommand.ExecuteUpdate;
end;

function TServerMethods1Client.SalvarChamadoObj(IdUsuario: Integer; ChamadoVO: TJSONValue): TJSONNumber;
begin
  if FSalvarChamadoObjCommand = nil then
  begin
    FSalvarChamadoObjCommand := FDBXConnection.CreateCommand;
    FSalvarChamadoObjCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSalvarChamadoObjCommand.Text := 'TServerMethods1.SalvarChamadoObj';
    FSalvarChamadoObjCommand.Prepare;
  end;
  FSalvarChamadoObjCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FSalvarChamadoObjCommand.Parameters[1].Value.SetJSONValue(ChamadoVO, FInstanceOwner);
  FSalvarChamadoObjCommand.ExecuteUpdate;
  Result := TJSONNumber(FSalvarChamadoObjCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.FiltrarChamadoQuadro1(IdUsuario: Integer);
begin
  if FFiltrarChamadoQuadro1Command = nil then
  begin
    FFiltrarChamadoQuadro1Command := FDBXConnection.CreateCommand;
    FFiltrarChamadoQuadro1Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarChamadoQuadro1Command.Text := 'TServerMethods1.FiltrarChamadoQuadro1';
    FFiltrarChamadoQuadro1Command.Prepare;
  end;
  FFiltrarChamadoQuadro1Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarChamadoQuadro1Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarChamadoQuadro2(IdUsuario: Integer);
begin
  if FFiltrarChamadoQuadro2Command = nil then
  begin
    FFiltrarChamadoQuadro2Command := FDBXConnection.CreateCommand;
    FFiltrarChamadoQuadro2Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarChamadoQuadro2Command.Text := 'TServerMethods1.FiltrarChamadoQuadro2';
    FFiltrarChamadoQuadro2Command.Prepare;
  end;
  FFiltrarChamadoQuadro2Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarChamadoQuadro2Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarChamadoQuadro3(IdUsuario: Integer);
begin
  if FFiltrarChamadoQuadro3Command = nil then
  begin
    FFiltrarChamadoQuadro3Command := FDBXConnection.CreateCommand;
    FFiltrarChamadoQuadro3Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarChamadoQuadro3Command.Text := 'TServerMethods1.FiltrarChamadoQuadro3';
    FFiltrarChamadoQuadro3Command.Prepare;
  end;
  FFiltrarChamadoQuadro3Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarChamadoQuadro3Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarChamadoQuadro4(IdUsuario: Integer);
begin
  if FFiltrarChamadoQuadro4Command = nil then
  begin
    FFiltrarChamadoQuadro4Command := FDBXConnection.CreateCommand;
    FFiltrarChamadoQuadro4Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarChamadoQuadro4Command.Text := 'TServerMethods1.FiltrarChamadoQuadro4';
    FFiltrarChamadoQuadro4Command.Prepare;
  end;
  FFiltrarChamadoQuadro4Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarChamadoQuadro4Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarChamadoQuadro5(IdUsuario: Integer);
begin
  if FFiltrarChamadoQuadro5Command = nil then
  begin
    FFiltrarChamadoQuadro5Command := FDBXConnection.CreateCommand;
    FFiltrarChamadoQuadro5Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarChamadoQuadro5Command.Text := 'TServerMethods1.FiltrarChamadoQuadro5';
    FFiltrarChamadoQuadro5Command.Prepare;
  end;
  FFiltrarChamadoQuadro5Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarChamadoQuadro5Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarChamadoQuadro6(IdUsuario: Integer);
begin
  if FFiltrarChamadoQuadro6Command = nil then
  begin
    FFiltrarChamadoQuadro6Command := FDBXConnection.CreateCommand;
    FFiltrarChamadoQuadro6Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarChamadoQuadro6Command.Text := 'TServerMethods1.FiltrarChamadoQuadro6';
    FFiltrarChamadoQuadro6Command.Prepare;
  end;
  FFiltrarChamadoQuadro6Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarChamadoQuadro6Command.ExecuteUpdate;
end;

function TServerMethods1Client.RetornaIdScope: Integer;
begin
  if FRetornaIdScopeCommand = nil then
  begin
    FRetornaIdScopeCommand := FDBXConnection.CreateCommand;
    FRetornaIdScopeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaIdScopeCommand.Text := 'TServerMethods1.RetornaIdScope';
    FRetornaIdScopeCommand.Prepare;
  end;
  FRetornaIdScopeCommand.ExecuteUpdate;
  Result := FRetornaIdScopeCommand.Parameters[0].Value.GetInt32;
end;

function TServerMethods1Client.RetornaIdAtual(ATabela: string): Integer;
begin
  if FRetornaIdAtualCommand = nil then
  begin
    FRetornaIdAtualCommand := FDBXConnection.CreateCommand;
    FRetornaIdAtualCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaIdAtualCommand.Text := 'TServerMethods1.RetornaIdAtual';
    FRetornaIdAtualCommand.Prepare;
  end;
  FRetornaIdAtualCommand.Parameters[0].Value.SetWideString(ATabela);
  FRetornaIdAtualCommand.ExecuteUpdate;
  Result := FRetornaIdAtualCommand.Parameters[1].Value.GetInt32;
end;

procedure TServerMethods1Client.ChamadoAnexos(AIdChamado: Integer);
begin
  if FChamadoAnexosCommand = nil then
  begin
    FChamadoAnexosCommand := FDBXConnection.CreateCommand;
    FChamadoAnexosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FChamadoAnexosCommand.Text := 'TServerMethods1.ChamadoAnexos';
    FChamadoAnexosCommand.Prepare;
  end;
  FChamadoAnexosCommand.Parameters[0].Value.SetInt32(AIdChamado);
  FChamadoAnexosCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.ChamadoQuadro(AIdUsuario: Integer; AIdRevenda: Integer);
begin
  if FChamadoQuadroCommand = nil then
  begin
    FChamadoQuadroCommand := FDBXConnection.CreateCommand;
    FChamadoQuadroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FChamadoQuadroCommand.Text := 'TServerMethods1.ChamadoQuadro';
    FChamadoQuadroCommand.Prepare;
  end;
  FChamadoQuadroCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FChamadoQuadroCommand.Parameters[1].Value.SetInt32(AIdRevenda);
  FChamadoQuadroCommand.ExecuteUpdate;
end;

function TServerMethods1Client.ChamadoBuscarTotalHorasDoChamado(AIdChamado: Integer): Double;
begin
  if FChamadoBuscarTotalHorasDoChamadoCommand = nil then
  begin
    FChamadoBuscarTotalHorasDoChamadoCommand := FDBXConnection.CreateCommand;
    FChamadoBuscarTotalHorasDoChamadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FChamadoBuscarTotalHorasDoChamadoCommand.Text := 'TServerMethods1.ChamadoBuscarTotalHorasDoChamado';
    FChamadoBuscarTotalHorasDoChamadoCommand.Prepare;
  end;
  FChamadoBuscarTotalHorasDoChamadoCommand.Parameters[0].Value.SetInt32(AIdChamado);
  FChamadoBuscarTotalHorasDoChamadoCommand.ExecuteUpdate;
  Result := FChamadoBuscarTotalHorasDoChamadoCommand.Parameters[1].Value.GetDouble;
end;

procedure TServerMethods1Client.FiltrarAtividade(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
begin
  if FFiltrarAtividadeCommand = nil then
  begin
    FFiltrarAtividadeCommand := FDBXConnection.CreateCommand;
    FFiltrarAtividadeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarAtividadeCommand.Text := 'TServerMethods1.FiltrarAtividade';
    FFiltrarAtividadeCommand.Prepare;
  end;
  FFiltrarAtividadeCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarAtividadeCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarAtividadeCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarAtividadeCommand.Parameters[3].Value.SetInt32(IdUsuario);
  FFiltrarAtividadeCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarAtividadeCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarAtividadeQuadro1(IdUsuario: Integer);
begin
  if FFiltrarAtividadeQuadro1Command = nil then
  begin
    FFiltrarAtividadeQuadro1Command := FDBXConnection.CreateCommand;
    FFiltrarAtividadeQuadro1Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarAtividadeQuadro1Command.Text := 'TServerMethods1.FiltrarAtividadeQuadro1';
    FFiltrarAtividadeQuadro1Command.Prepare;
  end;
  FFiltrarAtividadeQuadro1Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarAtividadeQuadro1Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarAtividadeQuadro2(IdUsuario: Integer);
begin
  if FFiltrarAtividadeQuadro2Command = nil then
  begin
    FFiltrarAtividadeQuadro2Command := FDBXConnection.CreateCommand;
    FFiltrarAtividadeQuadro2Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarAtividadeQuadro2Command.Text := 'TServerMethods1.FiltrarAtividadeQuadro2';
    FFiltrarAtividadeQuadro2Command.Prepare;
  end;
  FFiltrarAtividadeQuadro2Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarAtividadeQuadro2Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarAtividadeQuadro3(IdUsuario: Integer);
begin
  if FFiltrarAtividadeQuadro3Command = nil then
  begin
    FFiltrarAtividadeQuadro3Command := FDBXConnection.CreateCommand;
    FFiltrarAtividadeQuadro3Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarAtividadeQuadro3Command.Text := 'TServerMethods1.FiltrarAtividadeQuadro3';
    FFiltrarAtividadeQuadro3Command.Prepare;
  end;
  FFiltrarAtividadeQuadro3Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarAtividadeQuadro3Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarAtividadeQuadro4(IdUsuario: Integer);
begin
  if FFiltrarAtividadeQuadro4Command = nil then
  begin
    FFiltrarAtividadeQuadro4Command := FDBXConnection.CreateCommand;
    FFiltrarAtividadeQuadro4Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarAtividadeQuadro4Command.Text := 'TServerMethods1.FiltrarAtividadeQuadro4';
    FFiltrarAtividadeQuadro4Command.Prepare;
  end;
  FFiltrarAtividadeQuadro4Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarAtividadeQuadro4Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarAtividadeQuadro5(IdUsuario: Integer);
begin
  if FFiltrarAtividadeQuadro5Command = nil then
  begin
    FFiltrarAtividadeQuadro5Command := FDBXConnection.CreateCommand;
    FFiltrarAtividadeQuadro5Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarAtividadeQuadro5Command.Text := 'TServerMethods1.FiltrarAtividadeQuadro5';
    FFiltrarAtividadeQuadro5Command.Prepare;
  end;
  FFiltrarAtividadeQuadro5Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarAtividadeQuadro5Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarAtividadeQuadro6(IdUsuario: Integer);
begin
  if FFiltrarAtividadeQuadro6Command = nil then
  begin
    FFiltrarAtividadeQuadro6Command := FDBXConnection.CreateCommand;
    FFiltrarAtividadeQuadro6Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarAtividadeQuadro6Command.Text := 'TServerMethods1.FiltrarAtividadeQuadro6';
    FFiltrarAtividadeQuadro6Command.Prepare;
  end;
  FFiltrarAtividadeQuadro6Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarAtividadeQuadro6Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoId(IdSolicitacao: Integer);
begin
  if FFiltrarSolicitacaoIdCommand = nil then
  begin
    FFiltrarSolicitacaoIdCommand := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoIdCommand.Text := 'TServerMethods1.FiltrarSolicitacaoId';
    FFiltrarSolicitacaoIdCommand.Prepare;
  end;
  FFiltrarSolicitacaoIdCommand.Parameters[0].Value.SetInt32(IdSolicitacao);
  FFiltrarSolicitacaoIdCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro1(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro1Command = nil then
  begin
    FFiltrarSolicitacaoQuadro1Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro1Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro1Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro1';
    FFiltrarSolicitacaoQuadro1Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro1Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro1Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro2(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro2Command = nil then
  begin
    FFiltrarSolicitacaoQuadro2Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro2Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro2Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro2';
    FFiltrarSolicitacaoQuadro2Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro2Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro2Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro3(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro3Command = nil then
  begin
    FFiltrarSolicitacaoQuadro3Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro3Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro3Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro3';
    FFiltrarSolicitacaoQuadro3Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro3Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro3Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro4(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro4Command = nil then
  begin
    FFiltrarSolicitacaoQuadro4Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro4Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro4Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro4';
    FFiltrarSolicitacaoQuadro4Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro4Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro4Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro5(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro5Command = nil then
  begin
    FFiltrarSolicitacaoQuadro5Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro5Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro5Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro5';
    FFiltrarSolicitacaoQuadro5Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro5Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro5Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro6(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro6Command = nil then
  begin
    FFiltrarSolicitacaoQuadro6Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro6Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro6Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro6';
    FFiltrarSolicitacaoQuadro6Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro6Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro6Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro7(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro7Command = nil then
  begin
    FFiltrarSolicitacaoQuadro7Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro7Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro7Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro7';
    FFiltrarSolicitacaoQuadro7Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro7Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro7Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro8(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro8Command = nil then
  begin
    FFiltrarSolicitacaoQuadro8Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro8Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro8Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro8';
    FFiltrarSolicitacaoQuadro8Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro8Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro8Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro9(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro9Command = nil then
  begin
    FFiltrarSolicitacaoQuadro9Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro9Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro9Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro9';
    FFiltrarSolicitacaoQuadro9Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro9Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro9Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro10(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro10Command = nil then
  begin
    FFiltrarSolicitacaoQuadro10Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro10Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro10Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro10';
    FFiltrarSolicitacaoQuadro10Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro10Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro10Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro11(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro11Command = nil then
  begin
    FFiltrarSolicitacaoQuadro11Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro11Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro11Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro11';
    FFiltrarSolicitacaoQuadro11Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro11Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro11Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacaoQuadro12(IdUsuario: Integer);
begin
  if FFiltrarSolicitacaoQuadro12Command = nil then
  begin
    FFiltrarSolicitacaoQuadro12Command := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoQuadro12Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoQuadro12Command.Text := 'TServerMethods1.FiltrarSolicitacaoQuadro12';
    FFiltrarSolicitacaoQuadro12Command.Prepare;
  end;
  FFiltrarSolicitacaoQuadro12Command.Parameters[0].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoQuadro12Command.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarSolicitacao(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
begin
  if FFiltrarSolicitacaoCommand = nil then
  begin
    FFiltrarSolicitacaoCommand := FDBXConnection.CreateCommand;
    FFiltrarSolicitacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarSolicitacaoCommand.Text := 'TServerMethods1.FiltrarSolicitacao';
    FFiltrarSolicitacaoCommand.Prepare;
  end;
  FFiltrarSolicitacaoCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarSolicitacaoCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarSolicitacaoCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarSolicitacaoCommand.Parameters[3].Value.SetInt32(IdUsuario);
  FFiltrarSolicitacaoCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarSolicitacaoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.SalvarSolicitacao(Programa: Integer; IdUsuario: Integer; SolicitacaoStatus: TJSONValue);
begin
  if FSalvarSolicitacaoCommand = nil then
  begin
    FSalvarSolicitacaoCommand := FDBXConnection.CreateCommand;
    FSalvarSolicitacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSalvarSolicitacaoCommand.Text := 'TServerMethods1.SalvarSolicitacao';
    FSalvarSolicitacaoCommand.Prepare;
  end;
  FSalvarSolicitacaoCommand.Parameters[0].Value.SetInt32(Programa);
  FSalvarSolicitacaoCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FSalvarSolicitacaoCommand.Parameters[2].Value.SetJSONValue(SolicitacaoStatus, FInstanceOwner);
  FSalvarSolicitacaoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarCronogramaIdSolicitacao(IdSolicitacao: Integer);
begin
  if FLocalizarCronogramaIdSolicitacaoCommand = nil then
  begin
    FLocalizarCronogramaIdSolicitacaoCommand := FDBXConnection.CreateCommand;
    FLocalizarCronogramaIdSolicitacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCronogramaIdSolicitacaoCommand.Text := 'TServerMethods1.LocalizarCronogramaIdSolicitacao';
    FLocalizarCronogramaIdSolicitacaoCommand.Prepare;
  end;
  FLocalizarCronogramaIdSolicitacaoCommand.Parameters[0].Value.SetInt32(IdSolicitacao);
  FLocalizarCronogramaIdSolicitacaoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarCronogramaId(Id: Integer);
begin
  if FLocalizarCronogramaIdCommand = nil then
  begin
    FLocalizarCronogramaIdCommand := FDBXConnection.CreateCommand;
    FLocalizarCronogramaIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCronogramaIdCommand.Text := 'TServerMethods1.LocalizarCronogramaId';
    FLocalizarCronogramaIdCommand.Prepare;
  end;
  FLocalizarCronogramaIdCommand.Parameters[0].Value.SetInt32(Id);
  FLocalizarCronogramaIdCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarOcorrenciaGeralIdSolicitacao(IdSolicitacao: Integer);
begin
  if FLocalizarOcorrenciaGeralIdSolicitacaoCommand = nil then
  begin
    FLocalizarOcorrenciaGeralIdSolicitacaoCommand := FDBXConnection.CreateCommand;
    FLocalizarOcorrenciaGeralIdSolicitacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarOcorrenciaGeralIdSolicitacaoCommand.Text := 'TServerMethods1.LocalizarOcorrenciaGeralIdSolicitacao';
    FLocalizarOcorrenciaGeralIdSolicitacaoCommand.Prepare;
  end;
  FLocalizarOcorrenciaGeralIdSolicitacaoCommand.Parameters[0].Value.SetInt32(IdSolicitacao);
  FLocalizarOcorrenciaGeralIdSolicitacaoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarOcorrenciaTecnicaIdSolicitacao(IdSolicitacao: Integer);
begin
  if FLocalizarOcorrenciaTecnicaIdSolicitacaoCommand = nil then
  begin
    FLocalizarOcorrenciaTecnicaIdSolicitacaoCommand := FDBXConnection.CreateCommand;
    FLocalizarOcorrenciaTecnicaIdSolicitacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarOcorrenciaTecnicaIdSolicitacaoCommand.Text := 'TServerMethods1.LocalizarOcorrenciaTecnicaIdSolicitacao';
    FLocalizarOcorrenciaTecnicaIdSolicitacaoCommand.Prepare;
  end;
  FLocalizarOcorrenciaTecnicaIdSolicitacaoCommand.Parameters[0].Value.SetInt32(IdSolicitacao);
  FLocalizarOcorrenciaTecnicaIdSolicitacaoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarSolicitacaoStatus(IdSolicitacao: Integer);
begin
  if FLocalizarSolicitacaoStatusCommand = nil then
  begin
    FLocalizarSolicitacaoStatusCommand := FDBXConnection.CreateCommand;
    FLocalizarSolicitacaoStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarSolicitacaoStatusCommand.Text := 'TServerMethods1.LocalizarSolicitacaoStatus';
    FLocalizarSolicitacaoStatusCommand.Prepare;
  end;
  FLocalizarSolicitacaoStatusCommand.Parameters[0].Value.SetInt32(IdSolicitacao);
  FLocalizarSolicitacaoStatusCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.SolicitacaoAnexos(AIdSolicitacao: Integer);
begin
  if FSolicitacaoAnexosCommand = nil then
  begin
    FSolicitacaoAnexosCommand := FDBXConnection.CreateCommand;
    FSolicitacaoAnexosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoAnexosCommand.Text := 'TServerMethods1.SolicitacaoAnexos';
    FSolicitacaoAnexosCommand.Prepare;
  end;
  FSolicitacaoAnexosCommand.Parameters[0].Value.SetInt32(AIdSolicitacao);
  FSolicitacaoAnexosCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.SolicitracaoQuadro(AIdUsuario: Integer);
begin
  if FSolicitracaoQuadroCommand = nil then
  begin
    FSolicitracaoQuadroCommand := FDBXConnection.CreateCommand;
    FSolicitracaoQuadroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitracaoQuadroCommand.Text := 'TServerMethods1.SolicitracaoQuadro';
    FSolicitracaoQuadroCommand.Prepare;
  end;
  FSolicitracaoQuadroCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FSolicitracaoQuadroCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.SolicitacaoRelatorio(AModelo: Integer; AIdUsuario: Integer; AFiltro: TJSONValue; var AQtdeSolicitacao: Integer);
begin
  if FSolicitacaoRelatorioCommand = nil then
  begin
    FSolicitacaoRelatorioCommand := FDBXConnection.CreateCommand;
    FSolicitacaoRelatorioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoRelatorioCommand.Text := 'TServerMethods1.SolicitacaoRelatorio';
    FSolicitacaoRelatorioCommand.Prepare;
  end;
  FSolicitacaoRelatorioCommand.Parameters[0].Value.SetInt32(AModelo);
  FSolicitacaoRelatorioCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FSolicitacaoRelatorioCommand.Parameters[2].Value.SetJSONValue(AFiltro, FInstanceOwner);
  FSolicitacaoRelatorioCommand.Parameters[3].Value.SetInt32(AQtdeSolicitacao);
  FSolicitacaoRelatorioCommand.ExecuteUpdate;
  AQtdeSolicitacao := FSolicitacaoRelatorioCommand.Parameters[3].Value.GetInt32;
end;

function TServerMethods1Client.SolicitacaoTempoLocalizarId(AId: Integer): TJSONValue;
begin
  if FSolicitacaoTempoLocalizarIdCommand = nil then
  begin
    FSolicitacaoTempoLocalizarIdCommand := FDBXConnection.CreateCommand;
    FSolicitacaoTempoLocalizarIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoTempoLocalizarIdCommand.Text := 'TServerMethods1.SolicitacaoTempoLocalizarId';
    FSolicitacaoTempoLocalizarIdCommand.Prepare;
  end;
  FSolicitacaoTempoLocalizarIdCommand.Parameters[0].Value.SetInt32(AId);
  FSolicitacaoTempoLocalizarIdCommand.ExecuteUpdate;
  Result := TJSONValue(FSolicitacaoTempoLocalizarIdCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.SolicitacaoTempoExcluir(AId: Integer);
begin
  if FSolicitacaoTempoExcluirCommand = nil then
  begin
    FSolicitacaoTempoExcluirCommand := FDBXConnection.CreateCommand;
    FSolicitacaoTempoExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoTempoExcluirCommand.Text := 'TServerMethods1.SolicitacaoTempoExcluir';
    FSolicitacaoTempoExcluirCommand.Prepare;
  end;
  FSolicitacaoTempoExcluirCommand.Parameters[0].Value.SetInt32(AId);
  FSolicitacaoTempoExcluirCommand.ExecuteUpdate;
end;

function TServerMethods1Client.SolicitacaoTempoLocalizarPorSolicitacao(AIdSolicitacao: Integer): TJSONValue;
begin
  if FSolicitacaoTempoLocalizarPorSolicitacaoCommand = nil then
  begin
    FSolicitacaoTempoLocalizarPorSolicitacaoCommand := FDBXConnection.CreateCommand;
    FSolicitacaoTempoLocalizarPorSolicitacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoTempoLocalizarPorSolicitacaoCommand.Text := 'TServerMethods1.SolicitacaoTempoLocalizarPorSolicitacao';
    FSolicitacaoTempoLocalizarPorSolicitacaoCommand.Prepare;
  end;
  FSolicitacaoTempoLocalizarPorSolicitacaoCommand.Parameters[0].Value.SetInt32(AIdSolicitacao);
  FSolicitacaoTempoLocalizarPorSolicitacaoCommand.ExecuteUpdate;
  Result := TJSONValue(FSolicitacaoTempoLocalizarPorSolicitacaoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.SolicitacaoTempoIniciar(AIdUsuarioLogado: Integer; ASolicitacaoTempoVO: TJSONValue);
begin
  if FSolicitacaoTempoIniciarCommand = nil then
  begin
    FSolicitacaoTempoIniciarCommand := FDBXConnection.CreateCommand;
    FSolicitacaoTempoIniciarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoTempoIniciarCommand.Text := 'TServerMethods1.SolicitacaoTempoIniciar';
    FSolicitacaoTempoIniciarCommand.Prepare;
  end;
  FSolicitacaoTempoIniciarCommand.Parameters[0].Value.SetInt32(AIdUsuarioLogado);
  FSolicitacaoTempoIniciarCommand.Parameters[1].Value.SetJSONValue(ASolicitacaoTempoVO, FInstanceOwner);
  FSolicitacaoTempoIniciarCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.SolicitacaoTempoFinalizar(AIdUsuarioLogado: Integer; ASolicitacaoTempoVO: TJSONValue; AValidarUsuario: Boolean);
begin
  if FSolicitacaoTempoFinalizarCommand = nil then
  begin
    FSolicitacaoTempoFinalizarCommand := FDBXConnection.CreateCommand;
    FSolicitacaoTempoFinalizarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoTempoFinalizarCommand.Text := 'TServerMethods1.SolicitacaoTempoFinalizar';
    FSolicitacaoTempoFinalizarCommand.Prepare;
  end;
  FSolicitacaoTempoFinalizarCommand.Parameters[0].Value.SetInt32(AIdUsuarioLogado);
  FSolicitacaoTempoFinalizarCommand.Parameters[1].Value.SetJSONValue(ASolicitacaoTempoVO, FInstanceOwner);
  FSolicitacaoTempoFinalizarCommand.Parameters[2].Value.SetBoolean(AValidarUsuario);
  FSolicitacaoTempoFinalizarCommand.ExecuteUpdate;
end;

function TServerMethods1Client.SolicitacaoTempoListarStatus: TJSONArray;
begin
  if FSolicitacaoTempoListarStatusCommand = nil then
  begin
    FSolicitacaoTempoListarStatusCommand := FDBXConnection.CreateCommand;
    FSolicitacaoTempoListarStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoTempoListarStatusCommand.Text := 'TServerMethods1.SolicitacaoTempoListarStatus';
    FSolicitacaoTempoListarStatusCommand.Prepare;
  end;
  FSolicitacaoTempoListarStatusCommand.ExecuteUpdate;
  Result := TJSONArray(FSolicitacaoTempoListarStatusCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.SolicitacaoTempoAtualAberta(AIdSolicitacao: Integer): Boolean;
begin
  if FSolicitacaoTempoAtualAbertaCommand = nil then
  begin
    FSolicitacaoTempoAtualAbertaCommand := FDBXConnection.CreateCommand;
    FSolicitacaoTempoAtualAbertaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoTempoAtualAbertaCommand.Text := 'TServerMethods1.SolicitacaoTempoAtualAberta';
    FSolicitacaoTempoAtualAbertaCommand.Prepare;
  end;
  FSolicitacaoTempoAtualAbertaCommand.Parameters[0].Value.SetInt32(AIdSolicitacao);
  FSolicitacaoTempoAtualAbertaCommand.ExecuteUpdate;
  Result := FSolicitacaoTempoAtualAbertaCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.SolicitacaoTempoSalvar(ASolicitacaoTempoVO: TJSONValue): TJSONNumber;
begin
  if FSolicitacaoTempoSalvarCommand = nil then
  begin
    FSolicitacaoTempoSalvarCommand := FDBXConnection.CreateCommand;
    FSolicitacaoTempoSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoTempoSalvarCommand.Text := 'TServerMethods1.SolicitacaoTempoSalvar';
    FSolicitacaoTempoSalvarCommand.Prepare;
  end;
  FSolicitacaoTempoSalvarCommand.Parameters[0].Value.SetJSONValue(ASolicitacaoTempoVO, FInstanceOwner);
  FSolicitacaoTempoSalvarCommand.ExecuteUpdate;
  Result := TJSONNumber(FSolicitacaoTempoSalvarCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.SolicitacaoPermissaoSolicitacaoTempo(IdUsuario: Integer): Boolean;
begin
  if FSolicitacaoPermissaoSolicitacaoTempoCommand = nil then
  begin
    FSolicitacaoPermissaoSolicitacaoTempoCommand := FDBXConnection.CreateCommand;
    FSolicitacaoPermissaoSolicitacaoTempoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoPermissaoSolicitacaoTempoCommand.Text := 'TServerMethods1.SolicitacaoPermissaoSolicitacaoTempo';
    FSolicitacaoPermissaoSolicitacaoTempoCommand.Prepare;
  end;
  FSolicitacaoPermissaoSolicitacaoTempoCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FSolicitacaoPermissaoSolicitacaoTempoCommand.ExecuteUpdate;
  Result := FSolicitacaoPermissaoSolicitacaoTempoCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoConferenciaTempoGeral(IdUsuario: Integer): Boolean;
begin
  if FPermissaoConferenciaTempoGeralCommand = nil then
  begin
    FPermissaoConferenciaTempoGeralCommand := FDBXConnection.CreateCommand;
    FPermissaoConferenciaTempoGeralCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoConferenciaTempoGeralCommand.Text := 'TServerMethods1.PermissaoConferenciaTempoGeral';
    FPermissaoConferenciaTempoGeralCommand.Prepare;
  end;
  FPermissaoConferenciaTempoGeralCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoConferenciaTempoGeralCommand.ExecuteUpdate;
  Result := FPermissaoConferenciaTempoGeralCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.SolicitacaoTempoRetornarHorasAgrupadoPorStatus(AIdSolicitacao: Integer): TJSONValue;
begin
  if FSolicitacaoTempoRetornarHorasAgrupadoPorStatusCommand = nil then
  begin
    FSolicitacaoTempoRetornarHorasAgrupadoPorStatusCommand := FDBXConnection.CreateCommand;
    FSolicitacaoTempoRetornarHorasAgrupadoPorStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoTempoRetornarHorasAgrupadoPorStatusCommand.Text := 'TServerMethods1.SolicitacaoTempoRetornarHorasAgrupadoPorStatus';
    FSolicitacaoTempoRetornarHorasAgrupadoPorStatusCommand.Prepare;
  end;
  FSolicitacaoTempoRetornarHorasAgrupadoPorStatusCommand.Parameters[0].Value.SetInt32(AIdSolicitacao);
  FSolicitacaoTempoRetornarHorasAgrupadoPorStatusCommand.ExecuteUpdate;
  Result := TJSONValue(FSolicitacaoTempoRetornarHorasAgrupadoPorStatusCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.SolicitacaoTempoFiltrarPorData(AData: string; AId: Integer; AIdUsuario: Integer): TJSONValue;
begin
  if FSolicitacaoTempoFiltrarPorDataCommand = nil then
  begin
    FSolicitacaoTempoFiltrarPorDataCommand := FDBXConnection.CreateCommand;
    FSolicitacaoTempoFiltrarPorDataCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSolicitacaoTempoFiltrarPorDataCommand.Text := 'TServerMethods1.SolicitacaoTempoFiltrarPorData';
    FSolicitacaoTempoFiltrarPorDataCommand.Prepare;
  end;
  FSolicitacaoTempoFiltrarPorDataCommand.Parameters[0].Value.SetWideString(AData);
  FSolicitacaoTempoFiltrarPorDataCommand.Parameters[1].Value.SetInt32(AId);
  FSolicitacaoTempoFiltrarPorDataCommand.Parameters[2].Value.SetInt32(AIdUsuario);
  FSolicitacaoTempoFiltrarPorDataCommand.ExecuteUpdate;
  Result := TJSONValue(FSolicitacaoTempoFiltrarPorDataCommand.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.AtividadeNovo(AIdUsuario: Integer);
begin
  if FAtividadeNovoCommand = nil then
  begin
    FAtividadeNovoCommand := FDBXConnection.CreateCommand;
    FAtividadeNovoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtividadeNovoCommand.Text := 'TServerMethods1.AtividadeNovo';
    FAtividadeNovoCommand.Prepare;
  end;
  FAtividadeNovoCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FAtividadeNovoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.AtividadeExcluir(AIdUsuario: Integer; AId: Integer);
begin
  if FAtividadeExcluirCommand = nil then
  begin
    FAtividadeExcluirCommand := FDBXConnection.CreateCommand;
    FAtividadeExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtividadeExcluirCommand.Text := 'TServerMethods1.AtividadeExcluir';
    FAtividadeExcluirCommand.Prepare;
  end;
  FAtividadeExcluirCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FAtividadeExcluirCommand.Parameters[1].Value.SetInt32(AId);
  FAtividadeExcluirCommand.ExecuteUpdate;
end;

function TServerMethods1Client.AtividadeEditar(AIdUsuario: Integer; AId: Integer): Boolean;
begin
  if FAtividadeEditarCommand = nil then
  begin
    FAtividadeEditarCommand := FDBXConnection.CreateCommand;
    FAtividadeEditarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtividadeEditarCommand.Text := 'TServerMethods1.AtividadeEditar';
    FAtividadeEditarCommand.Prepare;
  end;
  FAtividadeEditarCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FAtividadeEditarCommand.Parameters[1].Value.SetInt32(AId);
  FAtividadeEditarCommand.ExecuteUpdate;
  Result := FAtividadeEditarCommand.Parameters[2].Value.GetBoolean;
end;

procedure TServerMethods1Client.AtividadeQuadro(AIdUsuario: Integer; AIdRevenda: Integer);
begin
  if FAtividadeQuadroCommand = nil then
  begin
    FAtividadeQuadroCommand := FDBXConnection.CreateCommand;
    FAtividadeQuadroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtividadeQuadroCommand.Text := 'TServerMethods1.AtividadeQuadro';
    FAtividadeQuadroCommand.Prepare;
  end;
  FAtividadeQuadroCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FAtividadeQuadroCommand.Parameters[1].Value.SetInt32(AIdRevenda);
  FAtividadeQuadroCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarVersao(AVersao: string);
begin
  if FLocalizarVersaoCommand = nil then
  begin
    FLocalizarVersaoCommand := FDBXConnection.CreateCommand;
    FLocalizarVersaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarVersaoCommand.Text := 'TServerMethods1.LocalizarVersao';
    FLocalizarVersaoCommand.Prepare;
  end;
  FLocalizarVersaoCommand.Parameters[0].Value.SetWideString(AVersao);
  FLocalizarVersaoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarCliente(Filtro: TJSONValue; Programa: Integer; IdUsuario: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
begin
  if FFiltrarClienteCommand = nil then
  begin
    FFiltrarClienteCommand := FDBXConnection.CreateCommand;
    FFiltrarClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarClienteCommand.Text := 'TServerMethods1.FiltrarCliente';
    FFiltrarClienteCommand.Prepare;
  end;
  FFiltrarClienteCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarClienteCommand.Parameters[1].Value.SetInt32(Programa);
  FFiltrarClienteCommand.Parameters[2].Value.SetInt32(IdUsuario);
  FFiltrarClienteCommand.Parameters[3].Value.SetWideString(Campo);
  FFiltrarClienteCommand.Parameters[4].Value.SetWideString(Texto);
  FFiltrarClienteCommand.Parameters[5].Value.SetWideString(Ativo);
  FFiltrarClienteCommand.Parameters[6].Value.SetBoolean(Contem);
  FFiltrarClienteCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarCodigoCliente(Codigo: Integer; IdUsuario: Integer);
begin
  if FLocalizarCodigoClienteCommand = nil then
  begin
    FLocalizarCodigoClienteCommand := FDBXConnection.CreateCommand;
    FLocalizarCodigoClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCodigoClienteCommand.Text := 'TServerMethods1.LocalizarCodigoCliente';
    FLocalizarCodigoClienteCommand.Prepare;
  end;
  FLocalizarCodigoClienteCommand.Parameters[0].Value.SetInt32(Codigo);
  FLocalizarCodigoClienteCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FLocalizarCodigoClienteCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarClienteModuloProduto(IdCliente: Integer; IdModulo: Integer);
begin
  if FLocalizarClienteModuloProdutoCommand = nil then
  begin
    FLocalizarClienteModuloProdutoCommand := FDBXConnection.CreateCommand;
    FLocalizarClienteModuloProdutoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarClienteModuloProdutoCommand.Text := 'TServerMethods1.LocalizarClienteModuloProduto';
    FLocalizarClienteModuloProdutoCommand.Prepare;
  end;
  FLocalizarClienteModuloProdutoCommand.Parameters[0].Value.SetInt32(IdCliente);
  FLocalizarClienteModuloProdutoCommand.Parameters[1].Value.SetInt32(IdModulo);
  FLocalizarClienteModuloProdutoCommand.ExecuteUpdate;
end;

function TServerMethods1Client.ClienteSalvar(ACliente: TJSONValue): TJSONNumber;
begin
  if FClienteSalvarCommand = nil then
  begin
    FClienteSalvarCommand := FDBXConnection.CreateCommand;
    FClienteSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FClienteSalvarCommand.Text := 'TServerMethods1.ClienteSalvar';
    FClienteSalvarCommand.Prepare;
  end;
  FClienteSalvarCommand.Parameters[0].Value.SetJSONValue(ACliente, FInstanceOwner);
  FClienteSalvarCommand.ExecuteUpdate;
  Result := TJSONNumber(FClienteSalvarCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.ClienteSalvarTeste: TJSONValue;
begin
  if FClienteSalvarTesteCommand = nil then
  begin
    FClienteSalvarTesteCommand := FDBXConnection.CreateCommand;
    FClienteSalvarTesteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FClienteSalvarTesteCommand.Text := 'TServerMethods1.ClienteSalvarTeste';
    FClienteSalvarTesteCommand.Prepare;
  end;
  FClienteSalvarTesteCommand.ExecuteUpdate;
  Result := TJSONValue(FClienteSalvarTesteCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.ClienteLocaliarIdObj(AId: Integer; ADetalhes: Boolean): TJSONValue;
begin
  if FClienteLocaliarIdObjCommand = nil then
  begin
    FClienteLocaliarIdObjCommand := FDBXConnection.CreateCommand;
    FClienteLocaliarIdObjCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FClienteLocaliarIdObjCommand.Text := 'TServerMethods1.ClienteLocaliarIdObj';
    FClienteLocaliarIdObjCommand.Prepare;
  end;
  FClienteLocaliarIdObjCommand.Parameters[0].Value.SetInt32(AId);
  FClienteLocaliarIdObjCommand.Parameters[1].Value.SetBoolean(ADetalhes);
  FClienteLocaliarIdObjCommand.ExecuteUpdate;
  Result := TJSONValue(FClienteLocaliarIdObjCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.ClienteHistorico(AIdCliente: Integer): TJSONValue;
begin
  if FClienteHistoricoCommand = nil then
  begin
    FClienteHistoricoCommand := FDBXConnection.CreateCommand;
    FClienteHistoricoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FClienteHistoricoCommand.Text := 'TServerMethods1.ClienteHistorico';
    FClienteHistoricoCommand.Prepare;
  end;
  FClienteHistoricoCommand.Parameters[0].Value.SetInt32(AIdCliente);
  FClienteHistoricoCommand.ExecuteUpdate;
  Result := TJSONValue(FClienteHistoricoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.ClienteImportar(ACliente: TJSONValue);
begin
  if FClienteImportarCommand = nil then
  begin
    FClienteImportarCommand := FDBXConnection.CreateCommand;
    FClienteImportarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FClienteImportarCommand.Text := 'TServerMethods1.ClienteImportar';
    FClienteImportarCommand.Prepare;
  end;
  FClienteImportarCommand.Parameters[0].Value.SetJSONValue(ACliente, FInstanceOwner);
  FClienteImportarCommand.ExecuteUpdate;
end;

function TServerMethods1Client.ClienteRelatorios(AModelo: Integer; AIdUsuario: Integer; AFiltro: TJSONValue): string;
begin
  if FClienteRelatoriosCommand = nil then
  begin
    FClienteRelatoriosCommand := FDBXConnection.CreateCommand;
    FClienteRelatoriosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FClienteRelatoriosCommand.Text := 'TServerMethods1.ClienteRelatorios';
    FClienteRelatoriosCommand.Prepare;
  end;
  FClienteRelatoriosCommand.Parameters[0].Value.SetInt32(AModelo);
  FClienteRelatoriosCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FClienteRelatoriosCommand.Parameters[2].Value.SetJSONValue(AFiltro, FInstanceOwner);
  FClienteRelatoriosCommand.ExecuteUpdate;
  Result := FClienteRelatoriosCommand.Parameters[3].Value.GetWideString;
end;

function TServerMethods1Client.UsuarioUsuarioADM(AIdUsuario: Integer): Boolean;
begin
  if FUsuarioUsuarioADMCommand = nil then
  begin
    FUsuarioUsuarioADMCommand := FDBXConnection.CreateCommand;
    FUsuarioUsuarioADMCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuarioUsuarioADMCommand.Text := 'TServerMethods1.UsuarioUsuarioADM';
    FUsuarioUsuarioADMCommand.Prepare;
  end;
  FUsuarioUsuarioADMCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FUsuarioUsuarioADMCommand.ExecuteUpdate;
  Result := FUsuarioUsuarioADMCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.ExisteUsuario: Boolean;
begin
  if FExisteUsuarioCommand = nil then
  begin
    FExisteUsuarioCommand := FDBXConnection.CreateCommand;
    FExisteUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExisteUsuarioCommand.Text := 'TServerMethods1.ExisteUsuario';
    FExisteUsuarioCommand.Prepare;
  end;
  FExisteUsuarioCommand.ExecuteUpdate;
  Result := FExisteUsuarioCommand.Parameters[0].Value.GetBoolean;
end;

procedure TServerMethods1Client.LocalizarUsuario(UserName: string; Password: string);
begin
  if FLocalizarUsuarioCommand = nil then
  begin
    FLocalizarUsuarioCommand := FDBXConnection.CreateCommand;
    FLocalizarUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarUsuarioCommand.Text := 'TServerMethods1.LocalizarUsuario';
    FLocalizarUsuarioCommand.Prepare;
  end;
  FLocalizarUsuarioCommand.Parameters[0].Value.SetWideString(UserName);
  FLocalizarUsuarioCommand.Parameters[1].Value.SetWideString(Password);
  FLocalizarUsuarioCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarUsuario(Filtro: TJSONValue; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
begin
  if FFiltrarUsuarioCommand = nil then
  begin
    FFiltrarUsuarioCommand := FDBXConnection.CreateCommand;
    FFiltrarUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarUsuarioCommand.Text := 'TServerMethods1.FiltrarUsuario';
    FFiltrarUsuarioCommand.Prepare;
  end;
  FFiltrarUsuarioCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarUsuarioCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarUsuarioCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarUsuarioCommand.Parameters[3].Value.SetWideString(Ativo);
  FFiltrarUsuarioCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarUsuarioCommand.ExecuteUpdate;
end;

function TServerMethods1Client.RetornaNumeroSolicitacao(IdSolicitacao: Integer): TJSONNumber;
begin
  if FRetornaNumeroSolicitacaoCommand = nil then
  begin
    FRetornaNumeroSolicitacaoCommand := FDBXConnection.CreateCommand;
    FRetornaNumeroSolicitacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornaNumeroSolicitacaoCommand.Text := 'TServerMethods1.RetornaNumeroSolicitacao';
    FRetornaNumeroSolicitacaoCommand.Prepare;
  end;
  FRetornaNumeroSolicitacaoCommand.Parameters[0].Value.SetInt32(IdSolicitacao);
  FRetornaNumeroSolicitacaoCommand.ExecuteUpdate;
  Result := TJSONNumber(FRetornaNumeroSolicitacaoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.FiltrarVisita(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
begin
  if FFiltrarVisitaCommand = nil then
  begin
    FFiltrarVisitaCommand := FDBXConnection.CreateCommand;
    FFiltrarVisitaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarVisitaCommand.Text := 'TServerMethods1.FiltrarVisita';
    FFiltrarVisitaCommand.Prepare;
  end;
  FFiltrarVisitaCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarVisitaCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarVisitaCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarVisitaCommand.Parameters[3].Value.SetInt32(IdUsuario);
  FFiltrarVisitaCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarVisitaCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarVersao(Filtro: TJSONValue; Campo: string; Texto: string; Contem: Boolean);
begin
  if FFiltrarVersaoCommand = nil then
  begin
    FFiltrarVersaoCommand := FDBXConnection.CreateCommand;
    FFiltrarVersaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarVersaoCommand.Text := 'TServerMethods1.FiltrarVersao';
    FFiltrarVersaoCommand.Prepare;
  end;
  FFiltrarVersaoCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarVersaoCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarVersaoCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarVersaoCommand.Parameters[3].Value.SetBoolean(Contem);
  FFiltrarVersaoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarBaseConh(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
begin
  if FFiltrarBaseConhCommand = nil then
  begin
    FFiltrarBaseConhCommand := FDBXConnection.CreateCommand;
    FFiltrarBaseConhCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarBaseConhCommand.Text := 'TServerMethods1.FiltrarBaseConh';
    FFiltrarBaseConhCommand.Prepare;
  end;
  FFiltrarBaseConhCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarBaseConhCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarBaseConhCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarBaseConhCommand.Parameters[3].Value.SetInt32(IdUsuario);
  FFiltrarBaseConhCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarBaseConhCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarStatusPrograma(Campo: string; Texto: string; Ativo: string; StatusPrograma: Integer; Contem: Boolean);
begin
  if FFiltrarStatusProgramaCommand = nil then
  begin
    FFiltrarStatusProgramaCommand := FDBXConnection.CreateCommand;
    FFiltrarStatusProgramaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarStatusProgramaCommand.Text := 'TServerMethods1.FiltrarStatusPrograma';
    FFiltrarStatusProgramaCommand.Prepare;
  end;
  FFiltrarStatusProgramaCommand.Parameters[0].Value.SetWideString(Campo);
  FFiltrarStatusProgramaCommand.Parameters[1].Value.SetWideString(Texto);
  FFiltrarStatusProgramaCommand.Parameters[2].Value.SetWideString(Ativo);
  FFiltrarStatusProgramaCommand.Parameters[3].Value.SetInt32(StatusPrograma);
  FFiltrarStatusProgramaCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarStatusProgramaCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarCodigoStatusPrograma(StatusPrograma: Integer; Codigo: Integer);
begin
  if FLocalizarCodigoStatusProgramaCommand = nil then
  begin
    FLocalizarCodigoStatusProgramaCommand := FDBXConnection.CreateCommand;
    FLocalizarCodigoStatusProgramaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCodigoStatusProgramaCommand.Text := 'TServerMethods1.LocalizarCodigoStatusPrograma';
    FLocalizarCodigoStatusProgramaCommand.Prepare;
  end;
  FLocalizarCodigoStatusProgramaCommand.Parameters[0].Value.SetInt32(StatusPrograma);
  FLocalizarCodigoStatusProgramaCommand.Parameters[1].Value.SetInt32(Codigo);
  FLocalizarCodigoStatusProgramaCommand.ExecuteUpdate;
end;

function TServerMethods1Client.ConferenciaFiltrarPorData(AData: string; AIdUsuario: Integer): TJSONValue;
begin
  if FConferenciaFiltrarPorDataCommand = nil then
  begin
    FConferenciaFiltrarPorDataCommand := FDBXConnection.CreateCommand;
    FConferenciaFiltrarPorDataCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FConferenciaFiltrarPorDataCommand.Text := 'TServerMethods1.ConferenciaFiltrarPorData';
    FConferenciaFiltrarPorDataCommand.Prepare;
  end;
  FConferenciaFiltrarPorDataCommand.Parameters[0].Value.SetWideString(AData);
  FConferenciaFiltrarPorDataCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FConferenciaFiltrarPorDataCommand.ExecuteUpdate;
  Result := TJSONValue(FConferenciaFiltrarPorDataCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.FiltrarTipoPrograma(Campo: string; Texto: string; Ativo: string; TipoPrograma: Integer; Contem: Boolean);
begin
  if FFiltrarTipoProgramaCommand = nil then
  begin
    FFiltrarTipoProgramaCommand := FDBXConnection.CreateCommand;
    FFiltrarTipoProgramaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarTipoProgramaCommand.Text := 'TServerMethods1.FiltrarTipoPrograma';
    FFiltrarTipoProgramaCommand.Prepare;
  end;
  FFiltrarTipoProgramaCommand.Parameters[0].Value.SetWideString(Campo);
  FFiltrarTipoProgramaCommand.Parameters[1].Value.SetWideString(Texto);
  FFiltrarTipoProgramaCommand.Parameters[2].Value.SetWideString(Ativo);
  FFiltrarTipoProgramaCommand.Parameters[3].Value.SetInt32(TipoPrograma);
  FFiltrarTipoProgramaCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarTipoProgramaCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarCodigoTipoPrograma(TipoPrograma: Integer; Codigo: Integer);
begin
  if FLocalizarCodigoTipoProgramaCommand = nil then
  begin
    FLocalizarCodigoTipoProgramaCommand := FDBXConnection.CreateCommand;
    FLocalizarCodigoTipoProgramaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCodigoTipoProgramaCommand.Text := 'TServerMethods1.LocalizarCodigoTipoPrograma';
    FLocalizarCodigoTipoProgramaCommand.Prepare;
  end;
  FLocalizarCodigoTipoProgramaCommand.Parameters[0].Value.SetInt32(TipoPrograma);
  FLocalizarCodigoTipoProgramaCommand.Parameters[1].Value.SetInt32(Codigo);
  FLocalizarCodigoTipoProgramaCommand.ExecuteUpdate;
end;

function TServerMethods1Client.TipoRetornoUmRegistro(APrograma: Integer): TJSONValue;
begin
  if FTipoRetornoUmRegistroCommand = nil then
  begin
    FTipoRetornoUmRegistroCommand := FDBXConnection.CreateCommand;
    FTipoRetornoUmRegistroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FTipoRetornoUmRegistroCommand.Text := 'TServerMethods1.TipoRetornoUmRegistro';
    FTipoRetornoUmRegistroCommand.Prepare;
  end;
  FTipoRetornoUmRegistroCommand.Parameters[0].Value.SetInt32(APrograma);
  FTipoRetornoUmRegistroCommand.ExecuteUpdate;
  Result := TJSONValue(FTipoRetornoUmRegistroCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.Status_LocalizarPorPrograma(ATipo: Integer): TJSONValue;
begin
  if FStatus_LocalizarPorProgramaCommand = nil then
  begin
    FStatus_LocalizarPorProgramaCommand := FDBXConnection.CreateCommand;
    FStatus_LocalizarPorProgramaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStatus_LocalizarPorProgramaCommand.Text := 'TServerMethods1.Status_LocalizarPorPrograma';
    FStatus_LocalizarPorProgramaCommand.Prepare;
  end;
  FStatus_LocalizarPorProgramaCommand.Parameters[0].Value.SetInt32(ATipo);
  FStatus_LocalizarPorProgramaCommand.ExecuteUpdate;
  Result := TJSONValue(FStatus_LocalizarPorProgramaCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.LocalizarParametro(Codigo: Integer; Programa: Integer): string;
begin
  if FLocalizarParametroCommand = nil then
  begin
    FLocalizarParametroCommand := FDBXConnection.CreateCommand;
    FLocalizarParametroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarParametroCommand.Text := 'TServerMethods1.LocalizarParametro';
    FLocalizarParametroCommand.Prepare;
  end;
  FLocalizarParametroCommand.Parameters[0].Value.SetInt32(Codigo);
  FLocalizarParametroCommand.Parameters[1].Value.SetInt32(Programa);
  FLocalizarParametroCommand.ExecuteUpdate;
  Result := FLocalizarParametroCommand.Parameters[2].Value.GetWideString;
end;

procedure TServerMethods1Client.ListarTabelasBancoDados;
begin
  if FListarTabelasBancoDadosCommand = nil then
  begin
    FListarTabelasBancoDadosCommand := FDBXConnection.CreateCommand;
    FListarTabelasBancoDadosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListarTabelasBancoDadosCommand.Text := 'TServerMethods1.ListarTabelasBancoDados';
    FListarTabelasBancoDadosCommand.Prepare;
  end;
  FListarTabelasBancoDadosCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.ListarTabelasCamposBancoDados(Tabela: string);
begin
  if FListarTabelasCamposBancoDadosCommand = nil then
  begin
    FListarTabelasCamposBancoDadosCommand := FDBXConnection.CreateCommand;
    FListarTabelasCamposBancoDadosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListarTabelasCamposBancoDadosCommand.Text := 'TServerMethods1.ListarTabelasCamposBancoDados';
    FListarTabelasCamposBancoDadosCommand.Prepare;
  end;
  FListarTabelasCamposBancoDadosCommand.Parameters[0].Value.SetWideString(Tabela);
  FListarTabelasCamposBancoDadosCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.InstrucaoSQL(ComandoSQL: string; Tipo: Integer);
begin
  if FInstrucaoSQLCommand = nil then
  begin
    FInstrucaoSQLCommand := FDBXConnection.CreateCommand;
    FInstrucaoSQLCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FInstrucaoSQLCommand.Text := 'TServerMethods1.InstrucaoSQL';
    FInstrucaoSQLCommand.Prepare;
  end;
  FInstrucaoSQLCommand.Parameters[0].Value.SetWideString(ComandoSQL);
  FInstrucaoSQLCommand.Parameters[1].Value.SetInt32(Tipo);
  FInstrucaoSQLCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.ChamadoListarProblemaSolucao(Filtro: TJSONValue; Texto: string; IdUsuario: Integer);
begin
  if FChamadoListarProblemaSolucaoCommand = nil then
  begin
    FChamadoListarProblemaSolucaoCommand := FDBXConnection.CreateCommand;
    FChamadoListarProblemaSolucaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FChamadoListarProblemaSolucaoCommand.Text := 'TServerMethods1.ChamadoListarProblemaSolucao';
    FChamadoListarProblemaSolucaoCommand.Prepare;
  end;
  FChamadoListarProblemaSolucaoCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FChamadoListarProblemaSolucaoCommand.Parameters[1].Value.SetWideString(Texto);
  FChamadoListarProblemaSolucaoCommand.Parameters[2].Value.SetInt32(IdUsuario);
  FChamadoListarProblemaSolucaoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.AtividadeListarProblemaSolucao(Filtro: TJSONValue; Texto: string; IdUsuario: Integer);
begin
  if FAtividadeListarProblemaSolucaoCommand = nil then
  begin
    FAtividadeListarProblemaSolucaoCommand := FDBXConnection.CreateCommand;
    FAtividadeListarProblemaSolucaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAtividadeListarProblemaSolucaoCommand.Text := 'TServerMethods1.AtividadeListarProblemaSolucao';
    FAtividadeListarProblemaSolucaoCommand.Prepare;
  end;
  FAtividadeListarProblemaSolucaoCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FAtividadeListarProblemaSolucaoCommand.Parameters[1].Value.SetWideString(Texto);
  FAtividadeListarProblemaSolucaoCommand.Parameters[2].Value.SetInt32(IdUsuario);
  FAtividadeListarProblemaSolucaoCommand.ExecuteUpdate;
end;

function TServerMethods1Client.ListaArquivosDiretorio(Diretorio: string; Extensao: string): TJSONArray;
begin
  if FListaArquivosDiretorioCommand = nil then
  begin
    FListaArquivosDiretorioCommand := FDBXConnection.CreateCommand;
    FListaArquivosDiretorioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FListaArquivosDiretorioCommand.Text := 'TServerMethods1.ListaArquivosDiretorio';
    FListaArquivosDiretorioCommand.Prepare;
  end;
  FListaArquivosDiretorioCommand.Parameters[0].Value.SetWideString(Diretorio);
  FListaArquivosDiretorioCommand.Parameters[1].Value.SetWideString(Extensao);
  FListaArquivosDiretorioCommand.ExecuteUpdate;
  Result := TJSONArray(FListaArquivosDiretorioCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

function TServerMethods1Client.BuscarCaminhoImportacaoXML: string;
begin
  if FBuscarCaminhoImportacaoXMLCommand = nil then
  begin
    FBuscarCaminhoImportacaoXMLCommand := FDBXConnection.CreateCommand;
    FBuscarCaminhoImportacaoXMLCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FBuscarCaminhoImportacaoXMLCommand.Text := 'TServerMethods1.BuscarCaminhoImportacaoXML';
    FBuscarCaminhoImportacaoXMLCommand.Prepare;
  end;
  FBuscarCaminhoImportacaoXMLCommand.ExecuteUpdate;
  Result := FBuscarCaminhoImportacaoXMLCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.RetornarChamadoEmails(IdChamado: Integer; IdUsuario: Integer; IdStatus: Integer): string;
begin
  if FRetornarChamadoEmailsCommand = nil then
  begin
    FRetornarChamadoEmailsCommand := FDBXConnection.CreateCommand;
    FRetornarChamadoEmailsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornarChamadoEmailsCommand.Text := 'TServerMethods1.RetornarChamadoEmails';
    FRetornarChamadoEmailsCommand.Prepare;
  end;
  FRetornarChamadoEmailsCommand.Parameters[0].Value.SetInt32(IdChamado);
  FRetornarChamadoEmailsCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FRetornarChamadoEmailsCommand.Parameters[2].Value.SetInt32(IdStatus);
  FRetornarChamadoEmailsCommand.ExecuteUpdate;
  Result := FRetornarChamadoEmailsCommand.Parameters[3].Value.GetWideString;
end;

function TServerMethods1Client.RetornarChamadoEmailCliente(idChamado: Integer; IdUsuario: Integer): string;
begin
  if FRetornarChamadoEmailClienteCommand = nil then
  begin
    FRetornarChamadoEmailClienteCommand := FDBXConnection.CreateCommand;
    FRetornarChamadoEmailClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornarChamadoEmailClienteCommand.Text := 'TServerMethods1.RetornarChamadoEmailCliente';
    FRetornarChamadoEmailClienteCommand.Prepare;
  end;
  FRetornarChamadoEmailClienteCommand.Parameters[0].Value.SetInt32(idChamado);
  FRetornarChamadoEmailClienteCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FRetornarChamadoEmailClienteCommand.ExecuteUpdate;
  Result := FRetornarChamadoEmailClienteCommand.Parameters[2].Value.GetWideString;
end;

function TServerMethods1Client.RetornarVisitaEmails(IdVisita: Integer; IdUsuario: Integer; IdStatus: Integer): string;
begin
  if FRetornarVisitaEmailsCommand = nil then
  begin
    FRetornarVisitaEmailsCommand := FDBXConnection.CreateCommand;
    FRetornarVisitaEmailsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornarVisitaEmailsCommand.Text := 'TServerMethods1.RetornarVisitaEmails';
    FRetornarVisitaEmailsCommand.Prepare;
  end;
  FRetornarVisitaEmailsCommand.Parameters[0].Value.SetInt32(IdVisita);
  FRetornarVisitaEmailsCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FRetornarVisitaEmailsCommand.Parameters[2].Value.SetInt32(IdStatus);
  FRetornarVisitaEmailsCommand.ExecuteUpdate;
  Result := FRetornarVisitaEmailsCommand.Parameters[3].Value.GetWideString;
end;

function TServerMethods1Client.RetornarVisitaEmailCliente(idVisita: Integer; IdUsuario: Integer): string;
begin
  if FRetornarVisitaEmailClienteCommand = nil then
  begin
    FRetornarVisitaEmailClienteCommand := FDBXConnection.CreateCommand;
    FRetornarVisitaEmailClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornarVisitaEmailClienteCommand.Text := 'TServerMethods1.RetornarVisitaEmailCliente';
    FRetornarVisitaEmailClienteCommand.Prepare;
  end;
  FRetornarVisitaEmailClienteCommand.Parameters[0].Value.SetInt32(idVisita);
  FRetornarVisitaEmailClienteCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FRetornarVisitaEmailClienteCommand.ExecuteUpdate;
  Result := FRetornarVisitaEmailClienteCommand.Parameters[2].Value.GetWideString;
end;

function TServerMethods1Client.RetornarSolicitacaoEmails(IdSolicitacao: Integer; IdUsuario: Integer; IdStatus: Integer): string;
begin
  if FRetornarSolicitacaoEmailsCommand = nil then
  begin
    FRetornarSolicitacaoEmailsCommand := FDBXConnection.CreateCommand;
    FRetornarSolicitacaoEmailsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornarSolicitacaoEmailsCommand.Text := 'TServerMethods1.RetornarSolicitacaoEmails';
    FRetornarSolicitacaoEmailsCommand.Prepare;
  end;
  FRetornarSolicitacaoEmailsCommand.Parameters[0].Value.SetInt32(IdSolicitacao);
  FRetornarSolicitacaoEmailsCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FRetornarSolicitacaoEmailsCommand.Parameters[2].Value.SetInt32(IdStatus);
  FRetornarSolicitacaoEmailsCommand.ExecuteUpdate;
  Result := FRetornarSolicitacaoEmailsCommand.Parameters[3].Value.GetWideString;
end;

function TServerMethods1Client.RetornarSolicitacaoEmailCliente(IdSolicitacao: Integer; IdUsuario: Integer): string;
begin
  if FRetornarSolicitacaoEmailClienteCommand = nil then
  begin
    FRetornarSolicitacaoEmailClienteCommand := FDBXConnection.CreateCommand;
    FRetornarSolicitacaoEmailClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRetornarSolicitacaoEmailClienteCommand.Text := 'TServerMethods1.RetornarSolicitacaoEmailCliente';
    FRetornarSolicitacaoEmailClienteCommand.Prepare;
  end;
  FRetornarSolicitacaoEmailClienteCommand.Parameters[0].Value.SetInt32(IdSolicitacao);
  FRetornarSolicitacaoEmailClienteCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FRetornarSolicitacaoEmailClienteCommand.ExecuteUpdate;
  Result := FRetornarSolicitacaoEmailClienteCommand.Parameters[2].Value.GetWideString;
end;

procedure TServerMethods1Client.FiltrarRevenda(Campo: string; Texto: string; Ativo: string; IdUsuario: Integer; Contem: Boolean);
begin
  if FFiltrarRevendaCommand = nil then
  begin
    FFiltrarRevendaCommand := FDBXConnection.CreateCommand;
    FFiltrarRevendaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarRevendaCommand.Text := 'TServerMethods1.FiltrarRevenda';
    FFiltrarRevendaCommand.Prepare;
  end;
  FFiltrarRevendaCommand.Parameters[0].Value.SetWideString(Campo);
  FFiltrarRevendaCommand.Parameters[1].Value.SetWideString(Texto);
  FFiltrarRevendaCommand.Parameters[2].Value.SetWideString(Ativo);
  FFiltrarRevendaCommand.Parameters[3].Value.SetInt32(IdUsuario);
  FFiltrarRevendaCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarRevendaCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarCodigoRevenda(Codigo: Integer; IdUsuario: Integer);
begin
  if FLocalizarCodigoRevendaCommand = nil then
  begin
    FLocalizarCodigoRevendaCommand := FDBXConnection.CreateCommand;
    FLocalizarCodigoRevendaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCodigoRevendaCommand.Text := 'TServerMethods1.LocalizarCodigoRevenda';
    FLocalizarCodigoRevendaCommand.Prepare;
  end;
  FLocalizarCodigoRevendaCommand.Parameters[0].Value.SetInt32(Codigo);
  FLocalizarCodigoRevendaCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FLocalizarCodigoRevendaCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarModuloCliente(IdCliente: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
begin
  if FFiltrarModuloClienteCommand = nil then
  begin
    FFiltrarModuloClienteCommand := FDBXConnection.CreateCommand;
    FFiltrarModuloClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarModuloClienteCommand.Text := 'TServerMethods1.FiltrarModuloCliente';
    FFiltrarModuloClienteCommand.Prepare;
  end;
  FFiltrarModuloClienteCommand.Parameters[0].Value.SetInt32(IdCliente);
  FFiltrarModuloClienteCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarModuloClienteCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarModuloClienteCommand.Parameters[3].Value.SetWideString(Ativo);
  FFiltrarModuloClienteCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarModuloClienteCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarModuloClienteCodigo(IdCliente: Integer; Codigo: Integer);
begin
  if FLocalizarModuloClienteCodigoCommand = nil then
  begin
    FLocalizarModuloClienteCodigoCommand := FDBXConnection.CreateCommand;
    FLocalizarModuloClienteCodigoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarModuloClienteCodigoCommand.Text := 'TServerMethods1.LocalizarModuloClienteCodigo';
    FLocalizarModuloClienteCodigoCommand.Prepare;
  end;
  FLocalizarModuloClienteCodigoCommand.Parameters[0].Value.SetInt32(IdCliente);
  FLocalizarModuloClienteCodigoCommand.Parameters[1].Value.SetInt32(Codigo);
  FLocalizarModuloClienteCodigoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarUsuarioRevenda(Filtro: TJSONValue; IdUsuario: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
begin
  if FFiltrarUsuarioRevendaCommand = nil then
  begin
    FFiltrarUsuarioRevendaCommand := FDBXConnection.CreateCommand;
    FFiltrarUsuarioRevendaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarUsuarioRevendaCommand.Text := 'TServerMethods1.FiltrarUsuarioRevenda';
    FFiltrarUsuarioRevendaCommand.Prepare;
  end;
  FFiltrarUsuarioRevendaCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarUsuarioRevendaCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FFiltrarUsuarioRevendaCommand.Parameters[2].Value.SetWideString(Campo);
  FFiltrarUsuarioRevendaCommand.Parameters[3].Value.SetWideString(Texto);
  FFiltrarUsuarioRevendaCommand.Parameters[4].Value.SetWideString(Ativo);
  FFiltrarUsuarioRevendaCommand.Parameters[5].Value.SetBoolean(Contem);
  FFiltrarUsuarioRevendaCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.LocalizarCodigoUsuario(Codigo: Integer; IdUsuario: Integer);
begin
  if FLocalizarCodigoUsuarioCommand = nil then
  begin
    FLocalizarCodigoUsuarioCommand := FDBXConnection.CreateCommand;
    FLocalizarCodigoUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCodigoUsuarioCommand.Text := 'TServerMethods1.LocalizarCodigoUsuario';
    FLocalizarCodigoUsuarioCommand.Prepare;
  end;
  FLocalizarCodigoUsuarioCommand.Parameters[0].Value.SetInt32(Codigo);
  FLocalizarCodigoUsuarioCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FLocalizarCodigoUsuarioCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.FiltrarRevendaEmail(IdRevenda: Integer);
begin
  if FFiltrarRevendaEmailCommand = nil then
  begin
    FFiltrarRevendaEmailCommand := FDBXConnection.CreateCommand;
    FFiltrarRevendaEmailCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarRevendaEmailCommand.Text := 'TServerMethods1.FiltrarRevendaEmail';
    FFiltrarRevendaEmailCommand.Prepare;
  end;
  FFiltrarRevendaEmailCommand.Parameters[0].Value.SetInt32(IdRevenda);
  FFiltrarRevendaEmailCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.UsuarioLocalizarNome(Nome: string);
begin
  if FUsuarioLocalizarNomeCommand = nil then
  begin
    FUsuarioLocalizarNomeCommand := FDBXConnection.CreateCommand;
    FUsuarioLocalizarNomeCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuarioLocalizarNomeCommand.Text := 'TServerMethods1.UsuarioLocalizarNome';
    FUsuarioLocalizarNomeCommand.Prepare;
  end;
  FUsuarioLocalizarNomeCommand.Parameters[0].Value.SetWideString(Nome);
  FUsuarioLocalizarNomeCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.ExecutarSQL(InstrucaoSQL: string);
begin
  if FExecutarSQLCommand = nil then
  begin
    FExecutarSQLCommand := FDBXConnection.CreateCommand;
    FExecutarSQLCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExecutarSQLCommand.Text := 'TServerMethods1.ExecutarSQL';
    FExecutarSQLCommand.Prepare;
  end;
  FExecutarSQLCommand.Parameters[0].Value.SetWideString(InstrucaoSQL);
  FExecutarSQLCommand.ExecuteUpdate;
end;

function TServerMethods1Client.SelectSQL(InstrucaoSQL: string): string;
begin
  if FSelectSQLCommand = nil then
  begin
    FSelectSQLCommand := FDBXConnection.CreateCommand;
    FSelectSQLCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSelectSQLCommand.Text := 'TServerMethods1.SelectSQL';
    FSelectSQLCommand.Prepare;
  end;
  FSelectSQLCommand.Parameters[0].Value.SetWideString(InstrucaoSQL);
  FSelectSQLCommand.ExecuteUpdate;
  Result := FSelectSQLCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.DepartamentoSalvar(ADepartamento: TJSONValue): TJSONNumber;
begin
  if FDepartamentoSalvarCommand = nil then
  begin
    FDepartamentoSalvarCommand := FDBXConnection.CreateCommand;
    FDepartamentoSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDepartamentoSalvarCommand.Text := 'TServerMethods1.DepartamentoSalvar';
    FDepartamentoSalvarCommand.Prepare;
  end;
  FDepartamentoSalvarCommand.Parameters[0].Value.SetJSONValue(ADepartamento, FInstanceOwner);
  FDepartamentoSalvarCommand.ExecuteUpdate;
  Result := TJSONNumber(FDepartamentoSalvarCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.DepartamentoFiltrarId(AId: Integer);
begin
  if FDepartamentoFiltrarIdCommand = nil then
  begin
    FDepartamentoFiltrarIdCommand := FDBXConnection.CreateCommand;
    FDepartamentoFiltrarIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDepartamentoFiltrarIdCommand.Text := 'TServerMethods1.DepartamentoFiltrarId';
    FDepartamentoFiltrarIdCommand.Prepare;
  end;
  FDepartamentoFiltrarIdCommand.Parameters[0].Value.SetInt32(AId);
  FDepartamentoFiltrarIdCommand.ExecuteUpdate;
end;

function TServerMethods1Client.DepartamentoMostrarAnexos(AIdUsuario: Integer): Boolean;
begin
  if FDepartamentoMostrarAnexosCommand = nil then
  begin
    FDepartamentoMostrarAnexosCommand := FDBXConnection.CreateCommand;
    FDepartamentoMostrarAnexosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDepartamentoMostrarAnexosCommand.Text := 'TServerMethods1.DepartamentoMostrarAnexos';
    FDepartamentoMostrarAnexosCommand.Prepare;
  end;
  FDepartamentoMostrarAnexosCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FDepartamentoMostrarAnexosCommand.ExecuteUpdate;
  Result := FDepartamentoMostrarAnexosCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.UsuarioRetornaListaPermissao: TJSONArray;
begin
  if FUsuarioRetornaListaPermissaoCommand = nil then
  begin
    FUsuarioRetornaListaPermissaoCommand := FDBXConnection.CreateCommand;
    FUsuarioRetornaListaPermissaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuarioRetornaListaPermissaoCommand.Text := 'TServerMethods1.UsuarioRetornaListaPermissao';
    FUsuarioRetornaListaPermissaoCommand.Prepare;
  end;
  FUsuarioRetornaListaPermissaoCommand.ExecuteUpdate;
  Result := TJSONArray(FUsuarioRetornaListaPermissaoCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.BuscarTitulosQuadrosChamados;
begin
  if FBuscarTitulosQuadrosChamadosCommand = nil then
  begin
    FBuscarTitulosQuadrosChamadosCommand := FDBXConnection.CreateCommand;
    FBuscarTitulosQuadrosChamadosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FBuscarTitulosQuadrosChamadosCommand.Text := 'TServerMethods1.BuscarTitulosQuadrosChamados';
    FBuscarTitulosQuadrosChamadosCommand.Prepare;
  end;
  FBuscarTitulosQuadrosChamadosCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.ParametrosAtualizarParametro(ACodigo: Integer; APrograma: Integer; AValor: string);
begin
  if FParametrosAtualizarParametroCommand = nil then
  begin
    FParametrosAtualizarParametroCommand := FDBXConnection.CreateCommand;
    FParametrosAtualizarParametroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FParametrosAtualizarParametroCommand.Text := 'TServerMethods1.ParametrosAtualizarParametro';
    FParametrosAtualizarParametroCommand.Prepare;
  end;
  FParametrosAtualizarParametroCommand.Parameters[0].Value.SetInt32(ACodigo);
  FParametrosAtualizarParametroCommand.Parameters[1].Value.SetInt32(APrograma);
  FParametrosAtualizarParametroCommand.Parameters[2].Value.SetWideString(AValor);
  FParametrosAtualizarParametroCommand.ExecuteUpdate;
end;

function TServerMethods1Client.parametrosCaminhoAnexos: string;
begin
  if FparametrosCaminhoAnexosCommand = nil then
  begin
    FparametrosCaminhoAnexosCommand := FDBXConnection.CreateCommand;
    FparametrosCaminhoAnexosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FparametrosCaminhoAnexosCommand.Text := 'TServerMethods1.parametrosCaminhoAnexos';
    FparametrosCaminhoAnexosCommand.Prepare;
  end;
  FparametrosCaminhoAnexosCommand.ExecuteUpdate;
  Result := FparametrosCaminhoAnexosCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.ParametrosCaminhoXMLClientes: string;
begin
  if FParametrosCaminhoXMLClientesCommand = nil then
  begin
    FParametrosCaminhoXMLClientesCommand := FDBXConnection.CreateCommand;
    FParametrosCaminhoXMLClientesCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FParametrosCaminhoXMLClientesCommand.Text := 'TServerMethods1.ParametrosCaminhoXMLClientes';
    FParametrosCaminhoXMLClientesCommand.Prepare;
  end;
  FParametrosCaminhoXMLClientesCommand.ExecuteUpdate;
  Result := FParametrosCaminhoXMLClientesCommand.Parameters[0].Value.GetWideString;
end;

function TServerMethods1Client.ParametrosRevendaPadrao(AIdUsuario: Integer): TJSONNumber;
begin
  if FParametrosRevendaPadraoCommand = nil then
  begin
    FParametrosRevendaPadraoCommand := FDBXConnection.CreateCommand;
    FParametrosRevendaPadraoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FParametrosRevendaPadraoCommand.Text := 'TServerMethods1.ParametrosRevendaPadrao';
    FParametrosRevendaPadraoCommand.Prepare;
  end;
  FParametrosRevendaPadraoCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FParametrosRevendaPadraoCommand.ExecuteUpdate;
  Result := TJSONNumber(FParametrosRevendaPadraoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.ParametrosExportarDadosBaseNova;
begin
  if FParametrosExportarDadosBaseNovaCommand = nil then
  begin
    FParametrosExportarDadosBaseNovaCommand := FDBXConnection.CreateCommand;
    FParametrosExportarDadosBaseNovaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FParametrosExportarDadosBaseNovaCommand.Text := 'TServerMethods1.ParametrosExportarDadosBaseNova';
    FParametrosExportarDadosBaseNovaCommand.Prepare;
  end;
  FParametrosExportarDadosBaseNovaCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.ParametrosImportarDadosBaseNova;
begin
  if FParametrosImportarDadosBaseNovaCommand = nil then
  begin
    FParametrosImportarDadosBaseNovaCommand := FDBXConnection.CreateCommand;
    FParametrosImportarDadosBaseNovaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FParametrosImportarDadosBaseNovaCommand.Text := 'TServerMethods1.ParametrosImportarDadosBaseNova';
    FParametrosImportarDadosBaseNovaCommand.Prepare;
  end;
  FParametrosImportarDadosBaseNovaCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.StartTransacao;
begin
  if FStartTransacaoCommand = nil then
  begin
    FStartTransacaoCommand := FDBXConnection.CreateCommand;
    FStartTransacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStartTransacaoCommand.Text := 'TServerMethods1.StartTransacao';
    FStartTransacaoCommand.Prepare;
  end;
  FStartTransacaoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.Commit;
begin
  if FCommitCommand = nil then
  begin
    FCommitCommand := FDBXConnection.CreateCommand;
    FCommitCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCommitCommand.Text := 'TServerMethods1.Commit';
    FCommitCommand.Prepare;
  end;
  FCommitCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.Roolback;
begin
  if FRoolbackCommand = nil then
  begin
    FRoolbackCommand := FDBXConnection.CreateCommand;
    FRoolbackCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRoolbackCommand.Text := 'TServerMethods1.Roolback';
    FRoolbackCommand.Prepare;
  end;
  FRoolbackCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.PermissaoAcessar(Programa: Integer; IdUsuario: Integer);
begin
  if FPermissaoAcessarCommand = nil then
  begin
    FPermissaoAcessarCommand := FDBXConnection.CreateCommand;
    FPermissaoAcessarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoAcessarCommand.Text := 'TServerMethods1.PermissaoAcessar';
    FPermissaoAcessarCommand.Prepare;
  end;
  FPermissaoAcessarCommand.Parameters[0].Value.SetInt32(Programa);
  FPermissaoAcessarCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FPermissaoAcessarCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.PermissaoIncluir(Programa: Integer; IdUsuario: Integer);
begin
  if FPermissaoIncluirCommand = nil then
  begin
    FPermissaoIncluirCommand := FDBXConnection.CreateCommand;
    FPermissaoIncluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoIncluirCommand.Text := 'TServerMethods1.PermissaoIncluir';
    FPermissaoIncluirCommand.Prepare;
  end;
  FPermissaoIncluirCommand.Parameters[0].Value.SetInt32(Programa);
  FPermissaoIncluirCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FPermissaoIncluirCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.PermissaoEditar(Programa: Integer; IdUsuario: Integer);
begin
  if FPermissaoEditarCommand = nil then
  begin
    FPermissaoEditarCommand := FDBXConnection.CreateCommand;
    FPermissaoEditarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoEditarCommand.Text := 'TServerMethods1.PermissaoEditar';
    FPermissaoEditarCommand.Prepare;
  end;
  FPermissaoEditarCommand.Parameters[0].Value.SetInt32(Programa);
  FPermissaoEditarCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FPermissaoEditarCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.PermissaoExcluir(Programa: Integer; IdUsuario: Integer);
begin
  if FPermissaoExcluirCommand = nil then
  begin
    FPermissaoExcluirCommand := FDBXConnection.CreateCommand;
    FPermissaoExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoExcluirCommand.Text := 'TServerMethods1.PermissaoExcluir';
    FPermissaoExcluirCommand.Prepare;
  end;
  FPermissaoExcluirCommand.Parameters[0].Value.SetInt32(Programa);
  FPermissaoExcluirCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FPermissaoExcluirCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.PermissaoRelatorio(Programa: Integer; IdUsuario: Integer);
begin
  if FPermissaoRelatorioCommand = nil then
  begin
    FPermissaoRelatorioCommand := FDBXConnection.CreateCommand;
    FPermissaoRelatorioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoRelatorioCommand.Text := 'TServerMethods1.PermissaoRelatorio';
    FPermissaoRelatorioCommand.Prepare;
  end;
  FPermissaoRelatorioCommand.Parameters[0].Value.SetInt32(Programa);
  FPermissaoRelatorioCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FPermissaoRelatorioCommand.ExecuteUpdate;
end;

function TServerMethods1Client.PermissaoSolicitacaoAbertura(IdUsuario: Integer): Boolean;
begin
  if FPermissaoSolicitacaoAberturaCommand = nil then
  begin
    FPermissaoSolicitacaoAberturaCommand := FDBXConnection.CreateCommand;
    FPermissaoSolicitacaoAberturaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoSolicitacaoAberturaCommand.Text := 'TServerMethods1.PermissaoSolicitacaoAbertura';
    FPermissaoSolicitacaoAberturaCommand.Prepare;
  end;
  FPermissaoSolicitacaoAberturaCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoSolicitacaoAberturaCommand.ExecuteUpdate;
  Result := FPermissaoSolicitacaoAberturaCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoSolicitacaoAnalise(IdUsuario: Integer): Boolean;
begin
  if FPermissaoSolicitacaoAnaliseCommand = nil then
  begin
    FPermissaoSolicitacaoAnaliseCommand := FDBXConnection.CreateCommand;
    FPermissaoSolicitacaoAnaliseCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoSolicitacaoAnaliseCommand.Text := 'TServerMethods1.PermissaoSolicitacaoAnalise';
    FPermissaoSolicitacaoAnaliseCommand.Prepare;
  end;
  FPermissaoSolicitacaoAnaliseCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoSolicitacaoAnaliseCommand.ExecuteUpdate;
  Result := FPermissaoSolicitacaoAnaliseCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoSolicitacaoOcorrenciaGeral(IdUsuario: Integer): Boolean;
begin
  if FPermissaoSolicitacaoOcorrenciaGeralCommand = nil then
  begin
    FPermissaoSolicitacaoOcorrenciaGeralCommand := FDBXConnection.CreateCommand;
    FPermissaoSolicitacaoOcorrenciaGeralCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoSolicitacaoOcorrenciaGeralCommand.Text := 'TServerMethods1.PermissaoSolicitacaoOcorrenciaGeral';
    FPermissaoSolicitacaoOcorrenciaGeralCommand.Prepare;
  end;
  FPermissaoSolicitacaoOcorrenciaGeralCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoSolicitacaoOcorrenciaGeralCommand.ExecuteUpdate;
  Result := FPermissaoSolicitacaoOcorrenciaGeralCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoSolicitacaoOcorrenciaTecnica(IdUsuario: Integer): Boolean;
begin
  if FPermissaoSolicitacaoOcorrenciaTecnicaCommand = nil then
  begin
    FPermissaoSolicitacaoOcorrenciaTecnicaCommand := FDBXConnection.CreateCommand;
    FPermissaoSolicitacaoOcorrenciaTecnicaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoSolicitacaoOcorrenciaTecnicaCommand.Text := 'TServerMethods1.PermissaoSolicitacaoOcorrenciaTecnica';
    FPermissaoSolicitacaoOcorrenciaTecnicaCommand.Prepare;
  end;
  FPermissaoSolicitacaoOcorrenciaTecnicaCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoSolicitacaoOcorrenciaTecnicaCommand.ExecuteUpdate;
  Result := FPermissaoSolicitacaoOcorrenciaTecnicaCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoSolicitacaoStatus(IdUsuario: Integer): Boolean;
begin
  if FPermissaoSolicitacaoStatusCommand = nil then
  begin
    FPermissaoSolicitacaoStatusCommand := FDBXConnection.CreateCommand;
    FPermissaoSolicitacaoStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoSolicitacaoStatusCommand.Text := 'TServerMethods1.PermissaoSolicitacaoStatus';
    FPermissaoSolicitacaoStatusCommand.Prepare;
  end;
  FPermissaoSolicitacaoStatusCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoSolicitacaoStatusCommand.ExecuteUpdate;
  Result := FPermissaoSolicitacaoStatusCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoSolicitacaoQuadro(IdUsuario: Integer): Boolean;
begin
  if FPermissaoSolicitacaoQuadroCommand = nil then
  begin
    FPermissaoSolicitacaoQuadroCommand := FDBXConnection.CreateCommand;
    FPermissaoSolicitacaoQuadroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoSolicitacaoQuadroCommand.Text := 'TServerMethods1.PermissaoSolicitacaoQuadro';
    FPermissaoSolicitacaoQuadroCommand.Prepare;
  end;
  FPermissaoSolicitacaoQuadroCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoSolicitacaoQuadroCommand.ExecuteUpdate;
  Result := FPermissaoSolicitacaoQuadroCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoRecadoQuadro(IdUsuario: Integer): Boolean;
begin
  if FPermissaoRecadoQuadroCommand = nil then
  begin
    FPermissaoRecadoQuadroCommand := FDBXConnection.CreateCommand;
    FPermissaoRecadoQuadroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoRecadoQuadroCommand.Text := 'TServerMethods1.PermissaoRecadoQuadro';
    FPermissaoRecadoQuadroCommand.Prepare;
  end;
  FPermissaoRecadoQuadroCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoRecadoQuadroCommand.ExecuteUpdate;
  Result := FPermissaoRecadoQuadroCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoChamadoAbertura(IdUsuario: Integer): Boolean;
begin
  if FPermissaoChamadoAberturaCommand = nil then
  begin
    FPermissaoChamadoAberturaCommand := FDBXConnection.CreateCommand;
    FPermissaoChamadoAberturaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoChamadoAberturaCommand.Text := 'TServerMethods1.PermissaoChamadoAbertura';
    FPermissaoChamadoAberturaCommand.Prepare;
  end;
  FPermissaoChamadoAberturaCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoChamadoAberturaCommand.ExecuteUpdate;
  Result := FPermissaoChamadoAberturaCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoChamadoOcorrencia(IdUsuario: Integer): Boolean;
begin
  if FPermissaoChamadoOcorrenciaCommand = nil then
  begin
    FPermissaoChamadoOcorrenciaCommand := FDBXConnection.CreateCommand;
    FPermissaoChamadoOcorrenciaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoChamadoOcorrenciaCommand.Text := 'TServerMethods1.PermissaoChamadoOcorrencia';
    FPermissaoChamadoOcorrenciaCommand.Prepare;
  end;
  FPermissaoChamadoOcorrenciaCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoChamadoOcorrenciaCommand.ExecuteUpdate;
  Result := FPermissaoChamadoOcorrenciaCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoChamadoStatus(IdUsuario: Integer): Boolean;
begin
  if FPermissaoChamadoStatusCommand = nil then
  begin
    FPermissaoChamadoStatusCommand := FDBXConnection.CreateCommand;
    FPermissaoChamadoStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoChamadoStatusCommand.Text := 'TServerMethods1.PermissaoChamadoStatus';
    FPermissaoChamadoStatusCommand.Prepare;
  end;
  FPermissaoChamadoStatusCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoChamadoStatusCommand.ExecuteUpdate;
  Result := FPermissaoChamadoStatusCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoChamadoQuadro(IdUsuario: Integer): Boolean;
begin
  if FPermissaoChamadoQuadroCommand = nil then
  begin
    FPermissaoChamadoQuadroCommand := FDBXConnection.CreateCommand;
    FPermissaoChamadoQuadroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoChamadoQuadroCommand.Text := 'TServerMethods1.PermissaoChamadoQuadro';
    FPermissaoChamadoQuadroCommand.Prepare;
  end;
  FPermissaoChamadoQuadroCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoChamadoQuadroCommand.ExecuteUpdate;
  Result := FPermissaoChamadoQuadroCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoChamadoOcorrenciaDataHora(IdUsuario: Integer; out MesmoUsuario: Boolean; Id: Integer): Boolean;
begin
  if FPermissaoChamadoOcorrenciaDataHoraCommand = nil then
  begin
    FPermissaoChamadoOcorrenciaDataHoraCommand := FDBXConnection.CreateCommand;
    FPermissaoChamadoOcorrenciaDataHoraCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoChamadoOcorrenciaDataHoraCommand.Text := 'TServerMethods1.PermissaoChamadoOcorrenciaDataHora';
    FPermissaoChamadoOcorrenciaDataHoraCommand.Prepare;
  end;
  FPermissaoChamadoOcorrenciaDataHoraCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoChamadoOcorrenciaDataHoraCommand.Parameters[2].Value.SetInt32(Id);
  FPermissaoChamadoOcorrenciaDataHoraCommand.ExecuteUpdate;
  MesmoUsuario := FPermissaoChamadoOcorrenciaDataHoraCommand.Parameters[1].Value.GetBoolean;
  Result := FPermissaoChamadoOcorrenciaDataHoraCommand.Parameters[3].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoChamadoOcorrenciaAlterar(IdUsuario: Integer; out Perfil: Integer; Id: Integer): Boolean;
begin
  if FPermissaoChamadoOcorrenciaAlterarCommand = nil then
  begin
    FPermissaoChamadoOcorrenciaAlterarCommand := FDBXConnection.CreateCommand;
    FPermissaoChamadoOcorrenciaAlterarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoChamadoOcorrenciaAlterarCommand.Text := 'TServerMethods1.PermissaoChamadoOcorrenciaAlterar';
    FPermissaoChamadoOcorrenciaAlterarCommand.Prepare;
  end;
  FPermissaoChamadoOcorrenciaAlterarCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoChamadoOcorrenciaAlterarCommand.Parameters[2].Value.SetInt32(Id);
  FPermissaoChamadoOcorrenciaAlterarCommand.ExecuteUpdate;
  Perfil := FPermissaoChamadoOcorrenciaAlterarCommand.Parameters[1].Value.GetInt32;
  Result := FPermissaoChamadoOcorrenciaAlterarCommand.Parameters[3].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoChamadoOcorrenciaExcluir(IdUsuario: Integer; Id: Integer): Boolean;
begin
  if FPermissaoChamadoOcorrenciaExcluirCommand = nil then
  begin
    FPermissaoChamadoOcorrenciaExcluirCommand := FDBXConnection.CreateCommand;
    FPermissaoChamadoOcorrenciaExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoChamadoOcorrenciaExcluirCommand.Text := 'TServerMethods1.PermissaoChamadoOcorrenciaExcluir';
    FPermissaoChamadoOcorrenciaExcluirCommand.Prepare;
  end;
  FPermissaoChamadoOcorrenciaExcluirCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoChamadoOcorrenciaExcluirCommand.Parameters[1].Value.SetInt32(Id);
  FPermissaoChamadoOcorrenciaExcluirCommand.ExecuteUpdate;
  Result := FPermissaoChamadoOcorrenciaExcluirCommand.Parameters[2].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoAtividadeAbertura(IdUsuario: Integer): Boolean;
begin
  if FPermissaoAtividadeAberturaCommand = nil then
  begin
    FPermissaoAtividadeAberturaCommand := FDBXConnection.CreateCommand;
    FPermissaoAtividadeAberturaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoAtividadeAberturaCommand.Text := 'TServerMethods1.PermissaoAtividadeAbertura';
    FPermissaoAtividadeAberturaCommand.Prepare;
  end;
  FPermissaoAtividadeAberturaCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoAtividadeAberturaCommand.ExecuteUpdate;
  Result := FPermissaoAtividadeAberturaCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoAtividadeOcorrencias(IdUsuario: Integer): Boolean;
begin
  if FPermissaoAtividadeOcorrenciasCommand = nil then
  begin
    FPermissaoAtividadeOcorrenciasCommand := FDBXConnection.CreateCommand;
    FPermissaoAtividadeOcorrenciasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoAtividadeOcorrenciasCommand.Text := 'TServerMethods1.PermissaoAtividadeOcorrencias';
    FPermissaoAtividadeOcorrenciasCommand.Prepare;
  end;
  FPermissaoAtividadeOcorrenciasCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoAtividadeOcorrenciasCommand.ExecuteUpdate;
  Result := FPermissaoAtividadeOcorrenciasCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoAtividadeStatus(IdUsuario: Integer): Boolean;
begin
  if FPermissaoAtividadeStatusCommand = nil then
  begin
    FPermissaoAtividadeStatusCommand := FDBXConnection.CreateCommand;
    FPermissaoAtividadeStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoAtividadeStatusCommand.Text := 'TServerMethods1.PermissaoAtividadeStatus';
    FPermissaoAtividadeStatusCommand.Prepare;
  end;
  FPermissaoAtividadeStatusCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoAtividadeStatusCommand.ExecuteUpdate;
  Result := FPermissaoAtividadeStatusCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoAtividadeQuadro(IdUsuario: Integer): Boolean;
begin
  if FPermissaoAtividadeQuadroCommand = nil then
  begin
    FPermissaoAtividadeQuadroCommand := FDBXConnection.CreateCommand;
    FPermissaoAtividadeQuadroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoAtividadeQuadroCommand.Text := 'TServerMethods1.PermissaoAtividadeQuadro';
    FPermissaoAtividadeQuadroCommand.Prepare;
  end;
  FPermissaoAtividadeQuadroCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoAtividadeQuadroCommand.ExecuteUpdate;
  Result := FPermissaoAtividadeQuadroCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoAtividadeOcorrencia(AIdUsuario: Integer; ATipo: Integer; AId: Integer): Boolean;
begin
  if FPermissaoAtividadeOcorrenciaCommand = nil then
  begin
    FPermissaoAtividadeOcorrenciaCommand := FDBXConnection.CreateCommand;
    FPermissaoAtividadeOcorrenciaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoAtividadeOcorrenciaCommand.Text := 'TServerMethods1.PermissaoAtividadeOcorrencia';
    FPermissaoAtividadeOcorrenciaCommand.Prepare;
  end;
  FPermissaoAtividadeOcorrenciaCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FPermissaoAtividadeOcorrenciaCommand.Parameters[1].Value.SetInt32(ATipo);
  FPermissaoAtividadeOcorrenciaCommand.Parameters[2].Value.SetInt32(AId);
  FPermissaoAtividadeOcorrenciaCommand.ExecuteUpdate;
  Result := FPermissaoAtividadeOcorrenciaCommand.Parameters[3].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoAtividadeOcorrenciaDataHora(IdUsuario: Integer; out MesmoUsuario: Boolean; Id: Integer): Boolean;
begin
  if FPermissaoAtividadeOcorrenciaDataHoraCommand = nil then
  begin
    FPermissaoAtividadeOcorrenciaDataHoraCommand := FDBXConnection.CreateCommand;
    FPermissaoAtividadeOcorrenciaDataHoraCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoAtividadeOcorrenciaDataHoraCommand.Text := 'TServerMethods1.PermissaoAtividadeOcorrenciaDataHora';
    FPermissaoAtividadeOcorrenciaDataHoraCommand.Prepare;
  end;
  FPermissaoAtividadeOcorrenciaDataHoraCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoAtividadeOcorrenciaDataHoraCommand.Parameters[2].Value.SetInt32(Id);
  FPermissaoAtividadeOcorrenciaDataHoraCommand.ExecuteUpdate;
  MesmoUsuario := FPermissaoAtividadeOcorrenciaDataHoraCommand.Parameters[1].Value.GetBoolean;
  Result := FPermissaoAtividadeOcorrenciaDataHoraCommand.Parameters[3].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoAtividadeOcorrenciaAlterar(IdUsuario: Integer; out Perfil: Integer; Id: Integer): Boolean;
begin
  if FPermissaoAtividadeOcorrenciaAlterarCommand = nil then
  begin
    FPermissaoAtividadeOcorrenciaAlterarCommand := FDBXConnection.CreateCommand;
    FPermissaoAtividadeOcorrenciaAlterarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoAtividadeOcorrenciaAlterarCommand.Text := 'TServerMethods1.PermissaoAtividadeOcorrenciaAlterar';
    FPermissaoAtividadeOcorrenciaAlterarCommand.Prepare;
  end;
  FPermissaoAtividadeOcorrenciaAlterarCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoAtividadeOcorrenciaAlterarCommand.Parameters[2].Value.SetInt32(Id);
  FPermissaoAtividadeOcorrenciaAlterarCommand.ExecuteUpdate;
  Perfil := FPermissaoAtividadeOcorrenciaAlterarCommand.Parameters[1].Value.GetInt32;
  Result := FPermissaoAtividadeOcorrenciaAlterarCommand.Parameters[3].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoAtividadeOcorrenciaExcluir(IdUsuario: Integer; Id: Integer): Boolean;
begin
  if FPermissaoAtividadeOcorrenciaExcluirCommand = nil then
  begin
    FPermissaoAtividadeOcorrenciaExcluirCommand := FDBXConnection.CreateCommand;
    FPermissaoAtividadeOcorrenciaExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoAtividadeOcorrenciaExcluirCommand.Text := 'TServerMethods1.PermissaoAtividadeOcorrenciaExcluir';
    FPermissaoAtividadeOcorrenciaExcluirCommand.Prepare;
  end;
  FPermissaoAtividadeOcorrenciaExcluirCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoAtividadeOcorrenciaExcluirCommand.Parameters[1].Value.SetInt32(Id);
  FPermissaoAtividadeOcorrenciaExcluirCommand.ExecuteUpdate;
  Result := FPermissaoAtividadeOcorrenciaExcluirCommand.Parameters[2].Value.GetBoolean;
end;

procedure TServerMethods1Client.UsuarioAcessoMenu(IdUsuario: Integer);
begin
  if FUsuarioAcessoMenuCommand = nil then
  begin
    FUsuarioAcessoMenuCommand := FDBXConnection.CreateCommand;
    FUsuarioAcessoMenuCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuarioAcessoMenuCommand.Text := 'TServerMethods1.UsuarioAcessoMenu';
    FUsuarioAcessoMenuCommand.Prepare;
  end;
  FUsuarioAcessoMenuCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FUsuarioAcessoMenuCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.ExcluirPermissaoUsuario(IdUsuario: Integer);
begin
  if FExcluirPermissaoUsuarioCommand = nil then
  begin
    FExcluirPermissaoUsuarioCommand := FDBXConnection.CreateCommand;
    FExcluirPermissaoUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExcluirPermissaoUsuarioCommand.Text := 'TServerMethods1.ExcluirPermissaoUsuario';
    FExcluirPermissaoUsuarioCommand.Prepare;
  end;
  FExcluirPermissaoUsuarioCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FExcluirPermissaoUsuarioCommand.ExecuteUpdate;
end;

function TServerMethods1Client.PermissaoSolicitacaoOcorrenciaGeralAlterar(IdUsuario: Integer; Id: Integer): Boolean;
begin
  if FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand = nil then
  begin
    FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand := FDBXConnection.CreateCommand;
    FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand.Text := 'TServerMethods1.PermissaoSolicitacaoOcorrenciaGeralAlterar';
    FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand.Prepare;
  end;
  FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand.Parameters[1].Value.SetInt32(Id);
  FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand.ExecuteUpdate;
  Result := FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand.Parameters[2].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoSolicitacaoOcorrenciaGeralExcluir(IdUsuario: Integer; Id: Integer): Boolean;
begin
  if FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand = nil then
  begin
    FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand := FDBXConnection.CreateCommand;
    FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand.Text := 'TServerMethods1.PermissaoSolicitacaoOcorrenciaGeralExcluir';
    FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand.Prepare;
  end;
  FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand.Parameters[1].Value.SetInt32(Id);
  FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand.ExecuteUpdate;
  Result := FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand.Parameters[2].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoSolicitacaoOcorrenciaTecnicaAlterar(IdUsuario: Integer; Id: Integer): Boolean;
begin
  if FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand = nil then
  begin
    FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand := FDBXConnection.CreateCommand;
    FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand.Text := 'TServerMethods1.PermissaoSolicitacaoOcorrenciaTecnicaAlterar';
    FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand.Prepare;
  end;
  FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand.Parameters[1].Value.SetInt32(Id);
  FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand.ExecuteUpdate;
  Result := FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand.Parameters[2].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoSolicitacaoOcorrenciaTecnicaExcluir(IdUsuario: Integer; Id: Integer): Boolean;
begin
  if FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand = nil then
  begin
    FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand := FDBXConnection.CreateCommand;
    FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand.Text := 'TServerMethods1.PermissaoSolicitacaoOcorrenciaTecnicaExcluir';
    FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand.Prepare;
  end;
  FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand.Parameters[1].Value.SetInt32(Id);
  FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand.ExecuteUpdate;
  Result := FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand.Parameters[2].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoOrcamentoAlteracaoSituacao(IdUsuario: Integer): Boolean;
begin
  if FPermissaoOrcamentoAlteracaoSituacaoCommand = nil then
  begin
    FPermissaoOrcamentoAlteracaoSituacaoCommand := FDBXConnection.CreateCommand;
    FPermissaoOrcamentoAlteracaoSituacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoOrcamentoAlteracaoSituacaoCommand.Text := 'TServerMethods1.PermissaoOrcamentoAlteracaoSituacao';
    FPermissaoOrcamentoAlteracaoSituacaoCommand.Prepare;
  end;
  FPermissaoOrcamentoAlteracaoSituacaoCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoOrcamentoAlteracaoSituacaoCommand.ExecuteUpdate;
  Result := FPermissaoOrcamentoAlteracaoSituacaoCommand.Parameters[1].Value.GetBoolean;
end;

function TServerMethods1Client.PermissaoOrcamentoUsuario(IdUsuario: Integer): Boolean;
begin
  if FPermissaoOrcamentoUsuarioCommand = nil then
  begin
    FPermissaoOrcamentoUsuarioCommand := FDBXConnection.CreateCommand;
    FPermissaoOrcamentoUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPermissaoOrcamentoUsuarioCommand.Text := 'TServerMethods1.PermissaoOrcamentoUsuario';
    FPermissaoOrcamentoUsuarioCommand.Prepare;
  end;
  FPermissaoOrcamentoUsuarioCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FPermissaoOrcamentoUsuarioCommand.ExecuteUpdate;
  Result := FPermissaoOrcamentoUsuarioCommand.Parameters[1].Value.GetBoolean;
end;

procedure TServerMethods1Client.UsuarioPermissaoSalvar(IdUsuario: Integer; Sigla: string);
begin
  if FUsuarioPermissaoSalvarCommand = nil then
  begin
    FUsuarioPermissaoSalvarCommand := FDBXConnection.CreateCommand;
    FUsuarioPermissaoSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuarioPermissaoSalvarCommand.Text := 'TServerMethods1.UsuarioPermissaoSalvar';
    FUsuarioPermissaoSalvarCommand.Prepare;
  end;
  FUsuarioPermissaoSalvarCommand.Parameters[0].Value.SetInt32(IdUsuario);
  FUsuarioPermissaoSalvarCommand.Parameters[1].Value.SetWideString(Sigla);
  FUsuarioPermissaoSalvarCommand.ExecuteUpdate;
end;

function TServerMethods1Client.VisitaAtualizacaoVersao(AIdCliente: Integer; AIdTipo: Integer; AVersao: string): string;
begin
  if FVisitaAtualizacaoVersaoCommand = nil then
  begin
    FVisitaAtualizacaoVersaoCommand := FDBXConnection.CreateCommand;
    FVisitaAtualizacaoVersaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FVisitaAtualizacaoVersaoCommand.Text := 'TServerMethods1.VisitaAtualizacaoVersao';
    FVisitaAtualizacaoVersaoCommand.Prepare;
  end;
  FVisitaAtualizacaoVersaoCommand.Parameters[0].Value.SetInt32(AIdCliente);
  FVisitaAtualizacaoVersaoCommand.Parameters[1].Value.SetInt32(AIdTipo);
  FVisitaAtualizacaoVersaoCommand.Parameters[2].Value.SetWideString(AVersao);
  FVisitaAtualizacaoVersaoCommand.ExecuteUpdate;
  Result := FVisitaAtualizacaoVersaoCommand.Parameters[3].Value.GetWideString;
end;

procedure TServerMethods1Client.Backup(Destino: string);
begin
  if FBackupCommand = nil then
  begin
    FBackupCommand := FDBXConnection.CreateCommand;
    FBackupCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FBackupCommand.Text := 'TServerMethods1.Backup';
    FBackupCommand.Prepare;
  end;
  FBackupCommand.Parameters[0].Value.SetWideString(Destino);
  FBackupCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.RelatorioChamado(Modelo: Integer; IdUsuario: Integer; Filtro: TJSONValue; Ordem: string; ATipo: Integer);
begin
  if FRelatorioChamadoCommand = nil then
  begin
    FRelatorioChamadoCommand := FDBXConnection.CreateCommand;
    FRelatorioChamadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioChamadoCommand.Text := 'TServerMethods1.RelatorioChamado';
    FRelatorioChamadoCommand.Prepare;
  end;
  FRelatorioChamadoCommand.Parameters[0].Value.SetInt32(Modelo);
  FRelatorioChamadoCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FRelatorioChamadoCommand.Parameters[2].Value.SetJSONValue(Filtro, FInstanceOwner);
  FRelatorioChamadoCommand.Parameters[3].Value.SetWideString(Ordem);
  FRelatorioChamadoCommand.Parameters[4].Value.SetInt32(ATipo);
  FRelatorioChamadoCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.RelatorioVisita(Modelo: Integer; IdUsuario: Integer; Filtro: TJSONValue; Ordem: string);
begin
  if FRelatorioVisitaCommand = nil then
  begin
    FRelatorioVisitaCommand := FDBXConnection.CreateCommand;
    FRelatorioVisitaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioVisitaCommand.Text := 'TServerMethods1.RelatorioVisita';
    FRelatorioVisitaCommand.Prepare;
  end;
  FRelatorioVisitaCommand.Parameters[0].Value.SetInt32(Modelo);
  FRelatorioVisitaCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FRelatorioVisitaCommand.Parameters[2].Value.SetJSONValue(Filtro, FInstanceOwner);
  FRelatorioVisitaCommand.Parameters[3].Value.SetWideString(Ordem);
  FRelatorioVisitaCommand.ExecuteUpdate;
end;

function TServerMethods1Client.RelatorioVisita2(AModelo: Integer; AIdUsuario: Integer; AFiltro: TJSONValue): TJSONValue;
begin
  if FRelatorioVisita2Command = nil then
  begin
    FRelatorioVisita2Command := FDBXConnection.CreateCommand;
    FRelatorioVisita2Command.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioVisita2Command.Text := 'TServerMethods1.RelatorioVisita2';
    FRelatorioVisita2Command.Prepare;
  end;
  FRelatorioVisita2Command.Parameters[0].Value.SetInt32(AModelo);
  FRelatorioVisita2Command.Parameters[1].Value.SetInt32(AIdUsuario);
  FRelatorioVisita2Command.Parameters[2].Value.SetJSONValue(AFiltro, FInstanceOwner);
  FRelatorioVisita2Command.ExecuteUpdate;
  Result := TJSONValue(FRelatorioVisita2Command.Parameters[3].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerMethods1Client.RelatorioVersao(AModelo: Integer; AIdVersao: Integer; out AQtdeRetorno: Integer; AFiltro: TJSONValue);
begin
  if FRelatorioVersaoCommand = nil then
  begin
    FRelatorioVersaoCommand := FDBXConnection.CreateCommand;
    FRelatorioVersaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioVersaoCommand.Text := 'TServerMethods1.RelatorioVersao';
    FRelatorioVersaoCommand.Prepare;
  end;
  FRelatorioVersaoCommand.Parameters[0].Value.SetInt32(AModelo);
  FRelatorioVersaoCommand.Parameters[1].Value.SetInt32(AIdVersao);
  FRelatorioVersaoCommand.Parameters[3].Value.SetJSONValue(AFiltro, FInstanceOwner);
  FRelatorioVersaoCommand.ExecuteUpdate;
  AQtdeRetorno := FRelatorioVersaoCommand.Parameters[2].Value.GetInt32;
end;

function TServerMethods1Client.VersaoBuscarStatusDesenvolvimento: Integer;
begin
  if FVersaoBuscarStatusDesenvolvimentoCommand = nil then
  begin
    FVersaoBuscarStatusDesenvolvimentoCommand := FDBXConnection.CreateCommand;
    FVersaoBuscarStatusDesenvolvimentoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FVersaoBuscarStatusDesenvolvimentoCommand.Text := 'TServerMethods1.VersaoBuscarStatusDesenvolvimento';
    FVersaoBuscarStatusDesenvolvimentoCommand.Prepare;
  end;
  FVersaoBuscarStatusDesenvolvimentoCommand.ExecuteUpdate;
  Result := FVersaoBuscarStatusDesenvolvimentoCommand.Parameters[0].Value.GetInt32;
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerMethods1Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FDuplicacaoRegistroCommand.DisposeOf;
  FNovoCommand.DisposeOf;
  FExcluirCommand.DisposeOf;
  FEditarCommand.DisposeOf;
  FFiltrarCommand.DisposeOf;
  FFiltrarCodigoCommand.DisposeOf;
  FLocalizarIdCommand.DisposeOf;
  FLocalizarCodigoCommand.DisposeOf;
  FSalvarCommand.DisposeOf;
  FProximoIdCommand.DisposeOf;
  FProximoIdGeralCommand.DisposeOf;
  FProximoCodigoCommand.DisposeOf;
  FRelatorioCommand.DisposeOf;
  FFiltrarChamadoCommand.DisposeOf;
  FFiltrarIdChamadoCommand.DisposeOf;
  FLocalizarChamadoOcorrenciaCommand.DisposeOf;
  FLocalizarChamadoStatusCommand.DisposeOf;
  FSalvarChamadoCommand.DisposeOf;
  FSalvarChamadoObjCommand.DisposeOf;
  FFiltrarChamadoQuadro1Command.DisposeOf;
  FFiltrarChamadoQuadro2Command.DisposeOf;
  FFiltrarChamadoQuadro3Command.DisposeOf;
  FFiltrarChamadoQuadro4Command.DisposeOf;
  FFiltrarChamadoQuadro5Command.DisposeOf;
  FFiltrarChamadoQuadro6Command.DisposeOf;
  FRetornaIdScopeCommand.DisposeOf;
  FRetornaIdAtualCommand.DisposeOf;
  FChamadoAnexosCommand.DisposeOf;
  FChamadoQuadroCommand.DisposeOf;
  FChamadoBuscarTotalHorasDoChamadoCommand.DisposeOf;
  FFiltrarAtividadeCommand.DisposeOf;
  FFiltrarAtividadeQuadro1Command.DisposeOf;
  FFiltrarAtividadeQuadro2Command.DisposeOf;
  FFiltrarAtividadeQuadro3Command.DisposeOf;
  FFiltrarAtividadeQuadro4Command.DisposeOf;
  FFiltrarAtividadeQuadro5Command.DisposeOf;
  FFiltrarAtividadeQuadro6Command.DisposeOf;
  FFiltrarSolicitacaoIdCommand.DisposeOf;
  FFiltrarSolicitacaoQuadro1Command.DisposeOf;
  FFiltrarSolicitacaoQuadro2Command.DisposeOf;
  FFiltrarSolicitacaoQuadro3Command.DisposeOf;
  FFiltrarSolicitacaoQuadro4Command.DisposeOf;
  FFiltrarSolicitacaoQuadro5Command.DisposeOf;
  FFiltrarSolicitacaoQuadro6Command.DisposeOf;
  FFiltrarSolicitacaoQuadro7Command.DisposeOf;
  FFiltrarSolicitacaoQuadro8Command.DisposeOf;
  FFiltrarSolicitacaoQuadro9Command.DisposeOf;
  FFiltrarSolicitacaoQuadro10Command.DisposeOf;
  FFiltrarSolicitacaoQuadro11Command.DisposeOf;
  FFiltrarSolicitacaoQuadro12Command.DisposeOf;
  FFiltrarSolicitacaoCommand.DisposeOf;
  FSalvarSolicitacaoCommand.DisposeOf;
  FLocalizarCronogramaIdSolicitacaoCommand.DisposeOf;
  FLocalizarCronogramaIdCommand.DisposeOf;
  FLocalizarOcorrenciaGeralIdSolicitacaoCommand.DisposeOf;
  FLocalizarOcorrenciaTecnicaIdSolicitacaoCommand.DisposeOf;
  FLocalizarSolicitacaoStatusCommand.DisposeOf;
  FSolicitacaoAnexosCommand.DisposeOf;
  FSolicitracaoQuadroCommand.DisposeOf;
  FSolicitacaoRelatorioCommand.DisposeOf;
  FSolicitacaoTempoLocalizarIdCommand.DisposeOf;
  FSolicitacaoTempoExcluirCommand.DisposeOf;
  FSolicitacaoTempoLocalizarPorSolicitacaoCommand.DisposeOf;
  FSolicitacaoTempoIniciarCommand.DisposeOf;
  FSolicitacaoTempoFinalizarCommand.DisposeOf;
  FSolicitacaoTempoListarStatusCommand.DisposeOf;
  FSolicitacaoTempoAtualAbertaCommand.DisposeOf;
  FSolicitacaoTempoSalvarCommand.DisposeOf;
  FSolicitacaoPermissaoSolicitacaoTempoCommand.DisposeOf;
  FPermissaoConferenciaTempoGeralCommand.DisposeOf;
  FSolicitacaoTempoRetornarHorasAgrupadoPorStatusCommand.DisposeOf;
  FSolicitacaoTempoFiltrarPorDataCommand.DisposeOf;
  FAtividadeNovoCommand.DisposeOf;
  FAtividadeExcluirCommand.DisposeOf;
  FAtividadeEditarCommand.DisposeOf;
  FAtividadeQuadroCommand.DisposeOf;
  FLocalizarVersaoCommand.DisposeOf;
  FFiltrarClienteCommand.DisposeOf;
  FLocalizarCodigoClienteCommand.DisposeOf;
  FLocalizarClienteModuloProdutoCommand.DisposeOf;
  FClienteSalvarCommand.DisposeOf;
  FClienteSalvarTesteCommand.DisposeOf;
  FClienteLocaliarIdObjCommand.DisposeOf;
  FClienteHistoricoCommand.DisposeOf;
  FClienteImportarCommand.DisposeOf;
  FClienteRelatoriosCommand.DisposeOf;
  FUsuarioUsuarioADMCommand.DisposeOf;
  FExisteUsuarioCommand.DisposeOf;
  FLocalizarUsuarioCommand.DisposeOf;
  FFiltrarUsuarioCommand.DisposeOf;
  FRetornaNumeroSolicitacaoCommand.DisposeOf;
  FFiltrarVisitaCommand.DisposeOf;
  FFiltrarVersaoCommand.DisposeOf;
  FFiltrarBaseConhCommand.DisposeOf;
  FFiltrarStatusProgramaCommand.DisposeOf;
  FLocalizarCodigoStatusProgramaCommand.DisposeOf;
  FConferenciaFiltrarPorDataCommand.DisposeOf;
  FFiltrarTipoProgramaCommand.DisposeOf;
  FLocalizarCodigoTipoProgramaCommand.DisposeOf;
  FTipoRetornoUmRegistroCommand.DisposeOf;
  FStatus_LocalizarPorProgramaCommand.DisposeOf;
  FLocalizarParametroCommand.DisposeOf;
  FListarTabelasBancoDadosCommand.DisposeOf;
  FListarTabelasCamposBancoDadosCommand.DisposeOf;
  FInstrucaoSQLCommand.DisposeOf;
  FChamadoListarProblemaSolucaoCommand.DisposeOf;
  FAtividadeListarProblemaSolucaoCommand.DisposeOf;
  FListaArquivosDiretorioCommand.DisposeOf;
  FBuscarCaminhoImportacaoXMLCommand.DisposeOf;
  FRetornarChamadoEmailsCommand.DisposeOf;
  FRetornarChamadoEmailClienteCommand.DisposeOf;
  FRetornarVisitaEmailsCommand.DisposeOf;
  FRetornarVisitaEmailClienteCommand.DisposeOf;
  FRetornarSolicitacaoEmailsCommand.DisposeOf;
  FRetornarSolicitacaoEmailClienteCommand.DisposeOf;
  FFiltrarRevendaCommand.DisposeOf;
  FLocalizarCodigoRevendaCommand.DisposeOf;
  FFiltrarModuloClienteCommand.DisposeOf;
  FLocalizarModuloClienteCodigoCommand.DisposeOf;
  FFiltrarUsuarioRevendaCommand.DisposeOf;
  FLocalizarCodigoUsuarioCommand.DisposeOf;
  FFiltrarRevendaEmailCommand.DisposeOf;
  FUsuarioLocalizarNomeCommand.DisposeOf;
  FExecutarSQLCommand.DisposeOf;
  FSelectSQLCommand.DisposeOf;
  FDepartamentoSalvarCommand.DisposeOf;
  FDepartamentoFiltrarIdCommand.DisposeOf;
  FDepartamentoMostrarAnexosCommand.DisposeOf;
  FUsuarioRetornaListaPermissaoCommand.DisposeOf;
  FBuscarTitulosQuadrosChamadosCommand.DisposeOf;
  FParametrosAtualizarParametroCommand.DisposeOf;
  FparametrosCaminhoAnexosCommand.DisposeOf;
  FParametrosCaminhoXMLClientesCommand.DisposeOf;
  FParametrosRevendaPadraoCommand.DisposeOf;
  FParametrosExportarDadosBaseNovaCommand.DisposeOf;
  FParametrosImportarDadosBaseNovaCommand.DisposeOf;
  FStartTransacaoCommand.DisposeOf;
  FCommitCommand.DisposeOf;
  FRoolbackCommand.DisposeOf;
  FPermissaoAcessarCommand.DisposeOf;
  FPermissaoIncluirCommand.DisposeOf;
  FPermissaoEditarCommand.DisposeOf;
  FPermissaoExcluirCommand.DisposeOf;
  FPermissaoRelatorioCommand.DisposeOf;
  FPermissaoSolicitacaoAberturaCommand.DisposeOf;
  FPermissaoSolicitacaoAnaliseCommand.DisposeOf;
  FPermissaoSolicitacaoOcorrenciaGeralCommand.DisposeOf;
  FPermissaoSolicitacaoOcorrenciaTecnicaCommand.DisposeOf;
  FPermissaoSolicitacaoStatusCommand.DisposeOf;
  FPermissaoSolicitacaoQuadroCommand.DisposeOf;
  FPermissaoRecadoQuadroCommand.DisposeOf;
  FPermissaoChamadoAberturaCommand.DisposeOf;
  FPermissaoChamadoOcorrenciaCommand.DisposeOf;
  FPermissaoChamadoStatusCommand.DisposeOf;
  FPermissaoChamadoQuadroCommand.DisposeOf;
  FPermissaoChamadoOcorrenciaDataHoraCommand.DisposeOf;
  FPermissaoChamadoOcorrenciaAlterarCommand.DisposeOf;
  FPermissaoChamadoOcorrenciaExcluirCommand.DisposeOf;
  FPermissaoAtividadeAberturaCommand.DisposeOf;
  FPermissaoAtividadeOcorrenciasCommand.DisposeOf;
  FPermissaoAtividadeStatusCommand.DisposeOf;
  FPermissaoAtividadeQuadroCommand.DisposeOf;
  FPermissaoAtividadeOcorrenciaCommand.DisposeOf;
  FPermissaoAtividadeOcorrenciaDataHoraCommand.DisposeOf;
  FPermissaoAtividadeOcorrenciaAlterarCommand.DisposeOf;
  FPermissaoAtividadeOcorrenciaExcluirCommand.DisposeOf;
  FUsuarioAcessoMenuCommand.DisposeOf;
  FExcluirPermissaoUsuarioCommand.DisposeOf;
  FPermissaoSolicitacaoOcorrenciaGeralAlterarCommand.DisposeOf;
  FPermissaoSolicitacaoOcorrenciaGeralExcluirCommand.DisposeOf;
  FPermissaoSolicitacaoOcorrenciaTecnicaAlterarCommand.DisposeOf;
  FPermissaoSolicitacaoOcorrenciaTecnicaExcluirCommand.DisposeOf;
  FPermissaoOrcamentoAlteracaoSituacaoCommand.DisposeOf;
  FPermissaoOrcamentoUsuarioCommand.DisposeOf;
  FUsuarioPermissaoSalvarCommand.DisposeOf;
  FVisitaAtualizacaoVersaoCommand.DisposeOf;
  FBackupCommand.DisposeOf;
  FRelatorioChamadoCommand.DisposeOf;
  FRelatorioVisitaCommand.DisposeOf;
  FRelatorioVisita2Command.DisposeOf;
  FRelatorioVersaoCommand.DisposeOf;
  FVersaoBuscarStatusDesenvolvimentoCommand.DisposeOf;
  inherited;
end;

procedure TServerModule2Client.Novo(Programa: Integer; IdUsuario: Integer);
begin
  if FNovoCommand = nil then
  begin
    FNovoCommand := FDBXConnection.CreateCommand;
    FNovoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FNovoCommand.Text := 'TServerModule2.Novo';
    FNovoCommand.Prepare;
  end;
  FNovoCommand.Parameters[0].Value.SetInt32(Programa);
  FNovoCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FNovoCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.Excluir(Programa: Integer; IdUsuario: Integer; Id: Integer);
begin
  if FExcluirCommand = nil then
  begin
    FExcluirCommand := FDBXConnection.CreateCommand;
    FExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FExcluirCommand.Text := 'TServerModule2.Excluir';
    FExcluirCommand.Prepare;
  end;
  FExcluirCommand.Parameters[0].Value.SetInt32(Programa);
  FExcluirCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FExcluirCommand.Parameters[2].Value.SetInt32(Id);
  FExcluirCommand.ExecuteUpdate;
end;

function TServerModule2Client.Editar(programa: Integer; Idusuario: Integer; Id: Integer): Boolean;
begin
  if FEditarCommand = nil then
  begin
    FEditarCommand := FDBXConnection.CreateCommand;
    FEditarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEditarCommand.Text := 'TServerModule2.Editar';
    FEditarCommand.Prepare;
  end;
  FEditarCommand.Parameters[0].Value.SetInt32(programa);
  FEditarCommand.Parameters[1].Value.SetInt32(Idusuario);
  FEditarCommand.Parameters[2].Value.SetInt32(Id);
  FEditarCommand.ExecuteUpdate;
  Result := FEditarCommand.Parameters[3].Value.GetBoolean;
end;

procedure TServerModule2Client.Filtrar(Programa: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
begin
  if FFiltrarCommand = nil then
  begin
    FFiltrarCommand := FDBXConnection.CreateCommand;
    FFiltrarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarCommand.Text := 'TServerModule2.Filtrar';
    FFiltrarCommand.Prepare;
  end;
  FFiltrarCommand.Parameters[0].Value.SetInt32(Programa);
  FFiltrarCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarCommand.Parameters[3].Value.SetWideString(Ativo);
  FFiltrarCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.FiltrarCodigo(Programa: Integer; Codigo: Integer);
begin
  if FFiltrarCodigoCommand = nil then
  begin
    FFiltrarCodigoCommand := FDBXConnection.CreateCommand;
    FFiltrarCodigoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarCodigoCommand.Text := 'TServerModule2.FiltrarCodigo';
    FFiltrarCodigoCommand.Prepare;
  end;
  FFiltrarCodigoCommand.Parameters[0].Value.SetInt32(Programa);
  FFiltrarCodigoCommand.Parameters[1].Value.SetInt32(Codigo);
  FFiltrarCodigoCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.LocalizarId(Programa: Integer; Id: Integer);
begin
  if FLocalizarIdCommand = nil then
  begin
    FLocalizarIdCommand := FDBXConnection.CreateCommand;
    FLocalizarIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarIdCommand.Text := 'TServerModule2.LocalizarId';
    FLocalizarIdCommand.Prepare;
  end;
  FLocalizarIdCommand.Parameters[0].Value.SetInt32(Programa);
  FLocalizarIdCommand.Parameters[1].Value.SetInt32(Id);
  FLocalizarIdCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.LocalizarCodigo(Programa: Integer; Codigo: Integer);
begin
  if FLocalizarCodigoCommand = nil then
  begin
    FLocalizarCodigoCommand := FDBXConnection.CreateCommand;
    FLocalizarCodigoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCodigoCommand.Text := 'TServerModule2.LocalizarCodigo';
    FLocalizarCodigoCommand.Prepare;
  end;
  FLocalizarCodigoCommand.Parameters[0].Value.SetInt32(Programa);
  FLocalizarCodigoCommand.Parameters[1].Value.SetInt32(Codigo);
  FLocalizarCodigoCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.Salvar(Programa: Integer; IdUsuario: Integer);
begin
  if FSalvarCommand = nil then
  begin
    FSalvarCommand := FDBXConnection.CreateCommand;
    FSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSalvarCommand.Text := 'TServerModule2.Salvar';
    FSalvarCommand.Prepare;
  end;
  FSalvarCommand.Parameters[0].Value.SetInt32(Programa);
  FSalvarCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FSalvarCommand.ExecuteUpdate;
end;

function TServerModule2Client.ProximoId(Programa: Integer): TJSONNumber;
begin
  if FProximoIdCommand = nil then
  begin
    FProximoIdCommand := FDBXConnection.CreateCommand;
    FProximoIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FProximoIdCommand.Text := 'TServerModule2.ProximoId';
    FProximoIdCommand.Prepare;
  end;
  FProximoIdCommand.Parameters[0].Value.SetInt32(Programa);
  FProximoIdCommand.ExecuteUpdate;
  Result := TJSONNumber(FProximoIdCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.ProximoCodigo(Programa: Integer): TJSONNumber;
begin
  if FProximoCodigoCommand = nil then
  begin
    FProximoCodigoCommand := FDBXConnection.CreateCommand;
    FProximoCodigoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FProximoCodigoCommand.Text := 'TServerModule2.ProximoCodigo';
    FProximoCodigoCommand.Prepare;
  end;
  FProximoCodigoCommand.Parameters[0].Value.SetInt32(Programa);
  FProximoCodigoCommand.ExecuteUpdate;
  Result := TJSONNumber(FProximoCodigoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerModule2Client.Relatorio(Programa: Integer; IdUsuario: Integer);
begin
  if FRelatorioCommand = nil then
  begin
    FRelatorioCommand := FDBXConnection.CreateCommand;
    FRelatorioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRelatorioCommand.Text := 'TServerModule2.Relatorio';
    FRelatorioCommand.Prepare;
  end;
  FRelatorioCommand.Parameters[0].Value.SetInt32(Programa);
  FRelatorioCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FRelatorioCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.AgendamentoNovo(APrograma: Integer; AIdUsuario: Integer);
begin
  if FAgendamentoNovoCommand = nil then
  begin
    FAgendamentoNovoCommand := FDBXConnection.CreateCommand;
    FAgendamentoNovoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoNovoCommand.Text := 'TServerModule2.AgendamentoNovo';
    FAgendamentoNovoCommand.Prepare;
  end;
  FAgendamentoNovoCommand.Parameters[0].Value.SetInt32(APrograma);
  FAgendamentoNovoCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FAgendamentoNovoCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.AgendamentoExcluir(APrograma: Integer; AIdUsuario: Integer; AId: Integer);
begin
  if FAgendamentoExcluirCommand = nil then
  begin
    FAgendamentoExcluirCommand := FDBXConnection.CreateCommand;
    FAgendamentoExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoExcluirCommand.Text := 'TServerModule2.AgendamentoExcluir';
    FAgendamentoExcluirCommand.Prepare;
  end;
  FAgendamentoExcluirCommand.Parameters[0].Value.SetInt32(APrograma);
  FAgendamentoExcluirCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FAgendamentoExcluirCommand.Parameters[2].Value.SetInt32(AId);
  FAgendamentoExcluirCommand.ExecuteUpdate;
end;

function TServerModule2Client.AgendamentoEditar(APrograma: Integer; AIdUsuario: Integer; AId: Integer): Boolean;
begin
  if FAgendamentoEditarCommand = nil then
  begin
    FAgendamentoEditarCommand := FDBXConnection.CreateCommand;
    FAgendamentoEditarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoEditarCommand.Text := 'TServerModule2.AgendamentoEditar';
    FAgendamentoEditarCommand.Prepare;
  end;
  FAgendamentoEditarCommand.Parameters[0].Value.SetInt32(APrograma);
  FAgendamentoEditarCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FAgendamentoEditarCommand.Parameters[2].Value.SetInt32(AId);
  FAgendamentoEditarCommand.ExecuteUpdate;
  Result := FAgendamentoEditarCommand.Parameters[3].Value.GetBoolean;
end;

function TServerModule2Client.AgendamentoFiltrar(Filtro: TJSONValue; ACampo: string; ATexto: string; AIdUsuario: Integer; AContem: Boolean): string;
begin
  if FAgendamentoFiltrarCommand = nil then
  begin
    FAgendamentoFiltrarCommand := FDBXConnection.CreateCommand;
    FAgendamentoFiltrarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoFiltrarCommand.Text := 'TServerModule2.AgendamentoFiltrar';
    FAgendamentoFiltrarCommand.Prepare;
  end;
  FAgendamentoFiltrarCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FAgendamentoFiltrarCommand.Parameters[1].Value.SetWideString(ACampo);
  FAgendamentoFiltrarCommand.Parameters[2].Value.SetWideString(ATexto);
  FAgendamentoFiltrarCommand.Parameters[3].Value.SetInt32(AIdUsuario);
  FAgendamentoFiltrarCommand.Parameters[4].Value.SetBoolean(AContem);
  FAgendamentoFiltrarCommand.ExecuteUpdate;
  Result := FAgendamentoFiltrarCommand.Parameters[5].Value.GetWideString;
end;

function TServerModule2Client.AgendamentoFiltarId(AId: Integer): string;
begin
  if FAgendamentoFiltarIdCommand = nil then
  begin
    FAgendamentoFiltarIdCommand := FDBXConnection.CreateCommand;
    FAgendamentoFiltarIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoFiltarIdCommand.Text := 'TServerModule2.AgendamentoFiltarId';
    FAgendamentoFiltarIdCommand.Prepare;
  end;
  FAgendamentoFiltarIdCommand.Parameters[0].Value.SetInt32(AId);
  FAgendamentoFiltarIdCommand.ExecuteUpdate;
  Result := FAgendamentoFiltarIdCommand.Parameters[1].Value.GetWideString;
end;

function TServerModule2Client.AgendamentoLocalizarId(APrograma: Integer; AId: Integer): Boolean;
begin
  if FAgendamentoLocalizarIdCommand = nil then
  begin
    FAgendamentoLocalizarIdCommand := FDBXConnection.CreateCommand;
    FAgendamentoLocalizarIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoLocalizarIdCommand.Text := 'TServerModule2.AgendamentoLocalizarId';
    FAgendamentoLocalizarIdCommand.Prepare;
  end;
  FAgendamentoLocalizarIdCommand.Parameters[0].Value.SetInt32(APrograma);
  FAgendamentoLocalizarIdCommand.Parameters[1].Value.SetInt32(AId);
  FAgendamentoLocalizarIdCommand.ExecuteUpdate;
  Result := FAgendamentoLocalizarIdCommand.Parameters[2].Value.GetBoolean;
end;

function TServerModule2Client.AgendamentoSalvar(APrograma: Integer; AIdUsuario: Integer; AAgendamentoVO: TJSONValue): Integer;
begin
  if FAgendamentoSalvarCommand = nil then
  begin
    FAgendamentoSalvarCommand := FDBXConnection.CreateCommand;
    FAgendamentoSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoSalvarCommand.Text := 'TServerModule2.AgendamentoSalvar';
    FAgendamentoSalvarCommand.Prepare;
  end;
  FAgendamentoSalvarCommand.Parameters[0].Value.SetInt32(APrograma);
  FAgendamentoSalvarCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FAgendamentoSalvarCommand.Parameters[2].Value.SetJSONValue(AAgendamentoVO, FInstanceOwner);
  FAgendamentoSalvarCommand.ExecuteUpdate;
  Result := FAgendamentoSalvarCommand.Parameters[3].Value.GetInt32;
end;

procedure TServerModule2Client.AgendamentoRelatorio(APrograma: Integer; AIdUsuario: Integer);
begin
  if FAgendamentoRelatorioCommand = nil then
  begin
    FAgendamentoRelatorioCommand := FDBXConnection.CreateCommand;
    FAgendamentoRelatorioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoRelatorioCommand.Text := 'TServerModule2.AgendamentoRelatorio';
    FAgendamentoRelatorioCommand.Prepare;
  end;
  FAgendamentoRelatorioCommand.Parameters[0].Value.SetInt32(APrograma);
  FAgendamentoRelatorioCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FAgendamentoRelatorioCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.AgendamentoQuadro(ADataInicial: string; ADataFinal: string; AIdUsuario: Integer; AIdRevenda: Integer);
begin
  if FAgendamentoQuadroCommand = nil then
  begin
    FAgendamentoQuadroCommand := FDBXConnection.CreateCommand;
    FAgendamentoQuadroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoQuadroCommand.Text := 'TServerModule2.AgendamentoQuadro';
    FAgendamentoQuadroCommand.Prepare;
  end;
  FAgendamentoQuadroCommand.Parameters[0].Value.SetWideString(ADataInicial);
  FAgendamentoQuadroCommand.Parameters[1].Value.SetWideString(ADataFinal);
  FAgendamentoQuadroCommand.Parameters[2].Value.SetInt32(AIdUsuario);
  FAgendamentoQuadroCommand.Parameters[3].Value.SetInt32(AIdRevenda);
  FAgendamentoQuadroCommand.ExecuteUpdate;
end;

function TServerModule2Client.AgendamentoPermissaoQuadro(AIdUsuario: Integer): Boolean;
begin
  if FAgendamentoPermissaoQuadroCommand = nil then
  begin
    FAgendamentoPermissaoQuadroCommand := FDBXConnection.CreateCommand;
    FAgendamentoPermissaoQuadroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoPermissaoQuadroCommand.Text := 'TServerModule2.AgendamentoPermissaoQuadro';
    FAgendamentoPermissaoQuadroCommand.Prepare;
  end;
  FAgendamentoPermissaoQuadroCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FAgendamentoPermissaoQuadroCommand.ExecuteUpdate;
  Result := FAgendamentoPermissaoQuadroCommand.Parameters[1].Value.GetBoolean;
end;

procedure TServerModule2Client.AgendamentoReagendamento(AIdUsuario: Integer; AIdAgendamento: Integer; AData: string; AHora: string; ATexto: string);
begin
  if FAgendamentoReagendamentoCommand = nil then
  begin
    FAgendamentoReagendamentoCommand := FDBXConnection.CreateCommand;
    FAgendamentoReagendamentoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoReagendamentoCommand.Text := 'TServerModule2.AgendamentoReagendamento';
    FAgendamentoReagendamentoCommand.Prepare;
  end;
  FAgendamentoReagendamentoCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FAgendamentoReagendamentoCommand.Parameters[1].Value.SetInt32(AIdAgendamento);
  FAgendamentoReagendamentoCommand.Parameters[2].Value.SetWideString(AData);
  FAgendamentoReagendamentoCommand.Parameters[3].Value.SetWideString(AHora);
  FAgendamentoReagendamentoCommand.Parameters[4].Value.SetWideString(ATexto);
  FAgendamentoReagendamentoCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.AgendamentoCancelamento(AIdUsuario: Integer; AIdAgendamento: Integer; AData: string; AHora: string; ATexto: string);
begin
  if FAgendamentoCancelamentoCommand = nil then
  begin
    FAgendamentoCancelamentoCommand := FDBXConnection.CreateCommand;
    FAgendamentoCancelamentoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoCancelamentoCommand.Text := 'TServerModule2.AgendamentoCancelamento';
    FAgendamentoCancelamentoCommand.Prepare;
  end;
  FAgendamentoCancelamentoCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FAgendamentoCancelamentoCommand.Parameters[1].Value.SetInt32(AIdAgendamento);
  FAgendamentoCancelamentoCommand.Parameters[2].Value.SetWideString(AData);
  FAgendamentoCancelamentoCommand.Parameters[3].Value.SetWideString(AHora);
  FAgendamentoCancelamentoCommand.Parameters[4].Value.SetWideString(ATexto);
  FAgendamentoCancelamentoCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.AgendamentoEncerramento(AIdUsuario: Integer; AIdAgendamento: Integer; AIdPrograma: Integer);
begin
  if FAgendamentoEncerramentoCommand = nil then
  begin
    FAgendamentoEncerramentoCommand := FDBXConnection.CreateCommand;
    FAgendamentoEncerramentoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoEncerramentoCommand.Text := 'TServerModule2.AgendamentoEncerramento';
    FAgendamentoEncerramentoCommand.Prepare;
  end;
  FAgendamentoEncerramentoCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FAgendamentoEncerramentoCommand.Parameters[1].Value.SetInt32(AIdAgendamento);
  FAgendamentoEncerramentoCommand.Parameters[2].Value.SetInt32(AIdPrograma);
  FAgendamentoEncerramentoCommand.ExecuteUpdate;
end;

function TServerModule2Client.AgendamentoLocalizarStatusAbertura: Integer;
begin
  if FAgendamentoLocalizarStatusAberturaCommand = nil then
  begin
    FAgendamentoLocalizarStatusAberturaCommand := FDBXConnection.CreateCommand;
    FAgendamentoLocalizarStatusAberturaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoLocalizarStatusAberturaCommand.Text := 'TServerModule2.AgendamentoLocalizarStatusAbertura';
    FAgendamentoLocalizarStatusAberturaCommand.Prepare;
  end;
  FAgendamentoLocalizarStatusAberturaCommand.ExecuteUpdate;
  Result := FAgendamentoLocalizarStatusAberturaCommand.Parameters[0].Value.GetInt32;
end;

function TServerModule2Client.AgendamentoTipoPrograma(AIdAgenda: Integer): Integer;
begin
  if FAgendamentoTipoProgramaCommand = nil then
  begin
    FAgendamentoTipoProgramaCommand := FDBXConnection.CreateCommand;
    FAgendamentoTipoProgramaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoTipoProgramaCommand.Text := 'TServerModule2.AgendamentoTipoPrograma';
    FAgendamentoTipoProgramaCommand.Prepare;
  end;
  FAgendamentoTipoProgramaCommand.Parameters[0].Value.SetInt32(AIdAgenda);
  FAgendamentoTipoProgramaCommand.ExecuteUpdate;
  Result := FAgendamentoTipoProgramaCommand.Parameters[1].Value.GetInt32;
end;

function TServerModule2Client.AgendamentoRetornarEmails(AIdAgenda: Integer; AIdUsuario: Integer; AIdStatus: Integer): string;
begin
  if FAgendamentoRetornarEmailsCommand = nil then
  begin
    FAgendamentoRetornarEmailsCommand := FDBXConnection.CreateCommand;
    FAgendamentoRetornarEmailsCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoRetornarEmailsCommand.Text := 'TServerModule2.AgendamentoRetornarEmails';
    FAgendamentoRetornarEmailsCommand.Prepare;
  end;
  FAgendamentoRetornarEmailsCommand.Parameters[0].Value.SetInt32(AIdAgenda);
  FAgendamentoRetornarEmailsCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FAgendamentoRetornarEmailsCommand.Parameters[2].Value.SetInt32(AIdStatus);
  FAgendamentoRetornarEmailsCommand.ExecuteUpdate;
  Result := FAgendamentoRetornarEmailsCommand.Parameters[3].Value.GetWideString;
end;

function TServerModule2Client.AgendamentoRetornarCliente(AIdAgenda: Integer; AIdUsuario: Integer): string;
begin
  if FAgendamentoRetornarClienteCommand = nil then
  begin
    FAgendamentoRetornarClienteCommand := FDBXConnection.CreateCommand;
    FAgendamentoRetornarClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoRetornarClienteCommand.Text := 'TServerModule2.AgendamentoRetornarCliente';
    FAgendamentoRetornarClienteCommand.Prepare;
  end;
  FAgendamentoRetornarClienteCommand.Parameters[0].Value.SetInt32(AIdAgenda);
  FAgendamentoRetornarClienteCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FAgendamentoRetornarClienteCommand.ExecuteUpdate;
  Result := FAgendamentoRetornarClienteCommand.Parameters[2].Value.GetWideString;
end;

function TServerModule2Client.AgendamentoAberto(AIdUsuario: Integer): Boolean;
begin
  if FAgendamentoAbertoCommand = nil then
  begin
    FAgendamentoAbertoCommand := FDBXConnection.CreateCommand;
    FAgendamentoAbertoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAgendamentoAbertoCommand.Text := 'TServerModule2.AgendamentoAberto';
    FAgendamentoAbertoCommand.Prepare;
  end;
  FAgendamentoAbertoCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FAgendamentoAbertoCommand.ExecuteUpdate;
  Result := FAgendamentoAbertoCommand.Parameters[1].Value.GetBoolean;
end;

procedure TServerModule2Client.PlanoBackupExcluir(AId: Integer);
begin
  if FPlanoBackupExcluirCommand = nil then
  begin
    FPlanoBackupExcluirCommand := FDBXConnection.CreateCommand;
    FPlanoBackupExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPlanoBackupExcluirCommand.Text := 'TServerModule2.PlanoBackupExcluir';
    FPlanoBackupExcluirCommand.Prepare;
  end;
  FPlanoBackupExcluirCommand.Parameters[0].Value.SetInt32(AId);
  FPlanoBackupExcluirCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.PlanoBackupLocalizar;
begin
  if FPlanoBackupLocalizarCommand = nil then
  begin
    FPlanoBackupLocalizarCommand := FDBXConnection.CreateCommand;
    FPlanoBackupLocalizarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPlanoBackupLocalizarCommand.Text := 'TServerModule2.PlanoBackupLocalizar';
    FPlanoBackupLocalizarCommand.Prepare;
  end;
  FPlanoBackupLocalizarCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.PlanoBackupLocalizarItem(AId: Integer);
begin
  if FPlanoBackupLocalizarItemCommand = nil then
  begin
    FPlanoBackupLocalizarItemCommand := FDBXConnection.CreateCommand;
    FPlanoBackupLocalizarItemCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPlanoBackupLocalizarItemCommand.Text := 'TServerModule2.PlanoBackupLocalizarItem';
    FPlanoBackupLocalizarItemCommand.Prepare;
  end;
  FPlanoBackupLocalizarItemCommand.Parameters[0].Value.SetInt32(AId);
  FPlanoBackupLocalizarItemCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.PlanoBackupExcluirItem(AId: Integer);
begin
  if FPlanoBackupExcluirItemCommand = nil then
  begin
    FPlanoBackupExcluirItemCommand := FDBXConnection.CreateCommand;
    FPlanoBackupExcluirItemCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPlanoBackupExcluirItemCommand.Text := 'TServerModule2.PlanoBackupExcluirItem';
    FPlanoBackupExcluirItemCommand.Prepare;
  end;
  FPlanoBackupExcluirItemCommand.Parameters[0].Value.SetInt32(AId);
  FPlanoBackupExcluirItemCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.PlanoBackupSalvar(APlanoBackup: TJSONValue; APlanoItens: TJSONValue);
begin
  if FPlanoBackupSalvarCommand = nil then
  begin
    FPlanoBackupSalvarCommand := FDBXConnection.CreateCommand;
    FPlanoBackupSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPlanoBackupSalvarCommand.Text := 'TServerModule2.PlanoBackupSalvar';
    FPlanoBackupSalvarCommand.Prepare;
  end;
  FPlanoBackupSalvarCommand.Parameters[0].Value.SetJSONValue(APlanoBackup, FInstanceOwner);
  FPlanoBackupSalvarCommand.Parameters[1].Value.SetJSONValue(APlanoItens, FInstanceOwner);
  FPlanoBackupSalvarCommand.ExecuteUpdate;
end;

function TServerModule2Client.ObservacaoSalvar(AObservacaoVO: TJSONValue): Integer;
begin
  if FObservacaoSalvarCommand = nil then
  begin
    FObservacaoSalvarCommand := FDBXConnection.CreateCommand;
    FObservacaoSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FObservacaoSalvarCommand.Text := 'TServerModule2.ObservacaoSalvar';
    FObservacaoSalvarCommand.Prepare;
  end;
  FObservacaoSalvarCommand.Parameters[0].Value.SetJSONValue(AObservacaoVO, FInstanceOwner);
  FObservacaoSalvarCommand.ExecuteUpdate;
  Result := FObservacaoSalvarCommand.Parameters[1].Value.GetInt32;
end;

procedure TServerModule2Client.FiltrarObservacaoPrograma(Campo: string; Texto: string; Ativo: string; StatusPrograma: Integer; Contem: Boolean);
begin
  if FFiltrarObservacaoProgramaCommand = nil then
  begin
    FFiltrarObservacaoProgramaCommand := FDBXConnection.CreateCommand;
    FFiltrarObservacaoProgramaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarObservacaoProgramaCommand.Text := 'TServerModule2.FiltrarObservacaoPrograma';
    FFiltrarObservacaoProgramaCommand.Prepare;
  end;
  FFiltrarObservacaoProgramaCommand.Parameters[0].Value.SetWideString(Campo);
  FFiltrarObservacaoProgramaCommand.Parameters[1].Value.SetWideString(Texto);
  FFiltrarObservacaoProgramaCommand.Parameters[2].Value.SetWideString(Ativo);
  FFiltrarObservacaoProgramaCommand.Parameters[3].Value.SetInt32(StatusPrograma);
  FFiltrarObservacaoProgramaCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarObservacaoProgramaCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.ObservacaoPadrao(APrograma: Integer);
begin
  if FObservacaoPadraoCommand = nil then
  begin
    FObservacaoPadraoCommand := FDBXConnection.CreateCommand;
    FObservacaoPadraoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FObservacaoPadraoCommand.Text := 'TServerModule2.ObservacaoPadrao';
    FObservacaoPadraoCommand.Prepare;
  end;
  FObservacaoPadraoCommand.Parameters[0].Value.SetInt32(APrograma);
  FObservacaoPadraoCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.ObservacaoEmailPadrao(APrograma: Integer);
begin
  if FObservacaoEmailPadraoCommand = nil then
  begin
    FObservacaoEmailPadraoCommand := FDBXConnection.CreateCommand;
    FObservacaoEmailPadraoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FObservacaoEmailPadraoCommand.Text := 'TServerModule2.ObservacaoEmailPadrao';
    FObservacaoEmailPadraoCommand.Prepare;
  end;
  FObservacaoEmailPadraoCommand.Parameters[0].Value.SetInt32(APrograma);
  FObservacaoEmailPadraoCommand.ExecuteUpdate;
end;

function TServerModule2Client.EscalaSalvar(AEscalaVO: TJSONValue; AIdUsuario: Integer): Integer;
begin
  if FEscalaSalvarCommand = nil then
  begin
    FEscalaSalvarCommand := FDBXConnection.CreateCommand;
    FEscalaSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEscalaSalvarCommand.Text := 'TServerModule2.EscalaSalvar';
    FEscalaSalvarCommand.Prepare;
  end;
  FEscalaSalvarCommand.Parameters[0].Value.SetJSONValue(AEscalaVO, FInstanceOwner);
  FEscalaSalvarCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FEscalaSalvarCommand.ExecuteUpdate;
  Result := FEscalaSalvarCommand.Parameters[2].Value.GetInt32;
end;

function TServerModule2Client.EscalaFiltrar(Filtro: TJSONValue; ACampo: string; ATexto: string; AIdUsuario: Integer; AContem: Boolean): string;
begin
  if FEscalaFiltrarCommand = nil then
  begin
    FEscalaFiltrarCommand := FDBXConnection.CreateCommand;
    FEscalaFiltrarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEscalaFiltrarCommand.Text := 'TServerModule2.EscalaFiltrar';
    FEscalaFiltrarCommand.Prepare;
  end;
  FEscalaFiltrarCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FEscalaFiltrarCommand.Parameters[1].Value.SetWideString(ACampo);
  FEscalaFiltrarCommand.Parameters[2].Value.SetWideString(ATexto);
  FEscalaFiltrarCommand.Parameters[3].Value.SetInt32(AIdUsuario);
  FEscalaFiltrarCommand.Parameters[4].Value.SetBoolean(AContem);
  FEscalaFiltrarCommand.ExecuteUpdate;
  Result := FEscalaFiltrarCommand.Parameters[5].Value.GetWideString;
end;

procedure TServerModule2Client.EscalaRelatorios(AFiltro: TJSONValue; AModelo: Integer);
begin
  if FEscalaRelatoriosCommand = nil then
  begin
    FEscalaRelatoriosCommand := FDBXConnection.CreateCommand;
    FEscalaRelatoriosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEscalaRelatoriosCommand.Text := 'TServerModule2.EscalaRelatorios';
    FEscalaRelatoriosCommand.Prepare;
  end;
  FEscalaRelatoriosCommand.Parameters[0].Value.SetJSONValue(AFiltro, FInstanceOwner);
  FEscalaRelatoriosCommand.Parameters[1].Value.SetInt32(AModelo);
  FEscalaRelatoriosCommand.ExecuteUpdate;
end;

function TServerModule2Client.EscalaBuscarUltimaData: string;
begin
  if FEscalaBuscarUltimaDataCommand = nil then
  begin
    FEscalaBuscarUltimaDataCommand := FDBXConnection.CreateCommand;
    FEscalaBuscarUltimaDataCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEscalaBuscarUltimaDataCommand.Text := 'TServerModule2.EscalaBuscarUltimaData';
    FEscalaBuscarUltimaDataCommand.Prepare;
  end;
  FEscalaBuscarUltimaDataCommand.ExecuteUpdate;
  Result := FEscalaBuscarUltimaDataCommand.Parameters[0].Value.GetWideString;
end;

function TServerModule2Client.ModeloRelatorioSalvar(AModeloRelatorioVO: TJSONValue): Integer;
begin
  if FModeloRelatorioSalvarCommand = nil then
  begin
    FModeloRelatorioSalvarCommand := FDBXConnection.CreateCommand;
    FModeloRelatorioSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FModeloRelatorioSalvarCommand.Text := 'TServerModule2.ModeloRelatorioSalvar';
    FModeloRelatorioSalvarCommand.Prepare;
  end;
  FModeloRelatorioSalvarCommand.Parameters[0].Value.SetJSONValue(AModeloRelatorioVO, FInstanceOwner);
  FModeloRelatorioSalvarCommand.ExecuteUpdate;
  Result := FModeloRelatorioSalvarCommand.Parameters[1].Value.GetInt32;
end;

function TServerModule2Client.FormaPagtoSalvar(AFormaPagtoVO: TJSONValue): Integer;
begin
  if FFormaPagtoSalvarCommand = nil then
  begin
    FFormaPagtoSalvarCommand := FDBXConnection.CreateCommand;
    FFormaPagtoSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFormaPagtoSalvarCommand.Text := 'TServerModule2.FormaPagtoSalvar';
    FFormaPagtoSalvarCommand.Prepare;
  end;
  FFormaPagtoSalvarCommand.Parameters[0].Value.SetJSONValue(AFormaPagtoVO, FInstanceOwner);
  FFormaPagtoSalvarCommand.ExecuteUpdate;
  Result := FFormaPagtoSalvarCommand.Parameters[1].Value.GetInt32;
end;

procedure TServerModule2Client.FormaPagtoFiltroItem(AIdFormaPagto: Integer);
begin
  if FFormaPagtoFiltroItemCommand = nil then
  begin
    FFormaPagtoFiltroItemCommand := FDBXConnection.CreateCommand;
    FFormaPagtoFiltroItemCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFormaPagtoFiltroItemCommand.Text := 'TServerModule2.FormaPagtoFiltroItem';
    FFormaPagtoFiltroItemCommand.Prepare;
  end;
  FFormaPagtoFiltroItemCommand.Parameters[0].Value.SetInt32(AIdFormaPagto);
  FFormaPagtoFiltroItemCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.PlanoBackupGerar;
begin
  if FPlanoBackupGerarCommand = nil then
  begin
    FPlanoBackupGerarCommand := FDBXConnection.CreateCommand;
    FPlanoBackupGerarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FPlanoBackupGerarCommand.Text := 'TServerModule2.PlanoBackupGerar';
    FPlanoBackupGerarCommand.Prepare;
  end;
  FPlanoBackupGerarCommand.ExecuteUpdate;
end;

function TServerModule2Client.SalvarProspect(AIdUsuario: Integer; AProspectVO: TJSONValue): Integer;
begin
  if FSalvarProspectCommand = nil then
  begin
    FSalvarProspectCommand := FDBXConnection.CreateCommand;
    FSalvarProspectCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FSalvarProspectCommand.Text := 'TServerModule2.SalvarProspect';
    FSalvarProspectCommand.Prepare;
  end;
  FSalvarProspectCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FSalvarProspectCommand.Parameters[1].Value.SetJSONValue(AProspectVO, FInstanceOwner);
  FSalvarProspectCommand.ExecuteUpdate;
  Result := FSalvarProspectCommand.Parameters[2].Value.GetInt32;
end;

procedure TServerModule2Client.FiltrarProspect(Filtro: TJSONValue; Programa: Integer; IdUsuario: Integer; Campo: string; Texto: string; Ativo: string; Contem: Boolean);
begin
  if FFiltrarProspectCommand = nil then
  begin
    FFiltrarProspectCommand := FDBXConnection.CreateCommand;
    FFiltrarProspectCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarProspectCommand.Text := 'TServerModule2.FiltrarProspect';
    FFiltrarProspectCommand.Prepare;
  end;
  FFiltrarProspectCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarProspectCommand.Parameters[1].Value.SetInt32(Programa);
  FFiltrarProspectCommand.Parameters[2].Value.SetInt32(IdUsuario);
  FFiltrarProspectCommand.Parameters[3].Value.SetWideString(Campo);
  FFiltrarProspectCommand.Parameters[4].Value.SetWideString(Texto);
  FFiltrarProspectCommand.Parameters[5].Value.SetWideString(Ativo);
  FFiltrarProspectCommand.Parameters[6].Value.SetBoolean(Contem);
  FFiltrarProspectCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.LocalizarCodigoProspect(Codigo: Integer; IdUsuario: Integer);
begin
  if FLocalizarCodigoProspectCommand = nil then
  begin
    FLocalizarCodigoProspectCommand := FDBXConnection.CreateCommand;
    FLocalizarCodigoProspectCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLocalizarCodigoProspectCommand.Text := 'TServerModule2.LocalizarCodigoProspect';
    FLocalizarCodigoProspectCommand.Prepare;
  end;
  FLocalizarCodigoProspectCommand.Parameters[0].Value.SetInt32(Codigo);
  FLocalizarCodigoProspectCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FLocalizarCodigoProspectCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.EmailLocalizarCodigo(AIdProspect: Integer);
begin
  if FEmailLocalizarCodigoCommand = nil then
  begin
    FEmailLocalizarCodigoCommand := FDBXConnection.CreateCommand;
    FEmailLocalizarCodigoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEmailLocalizarCodigoCommand.Text := 'TServerModule2.EmailLocalizarCodigo';
    FEmailLocalizarCodigoCommand.Prepare;
  end;
  FEmailLocalizarCodigoCommand.Parameters[0].Value.SetInt32(AIdProspect);
  FEmailLocalizarCodigoCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.EmailProspectNovo(Programa: Integer; IdUsuario: Integer);
begin
  if FEmailProspectNovoCommand = nil then
  begin
    FEmailProspectNovoCommand := FDBXConnection.CreateCommand;
    FEmailProspectNovoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEmailProspectNovoCommand.Text := 'TServerModule2.EmailProspectNovo';
    FEmailProspectNovoCommand.Prepare;
  end;
  FEmailProspectNovoCommand.Parameters[0].Value.SetInt32(Programa);
  FEmailProspectNovoCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FEmailProspectNovoCommand.ExecuteUpdate;
end;

function TServerModule2Client.EmailProspectEditarEmail(Programa: Integer; IdUsuario: Integer): Boolean;
begin
  if FEmailProspectEditarEmailCommand = nil then
  begin
    FEmailProspectEditarEmailCommand := FDBXConnection.CreateCommand;
    FEmailProspectEditarEmailCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEmailProspectEditarEmailCommand.Text := 'TServerModule2.EmailProspectEditarEmail';
    FEmailProspectEditarEmailCommand.Prepare;
  end;
  FEmailProspectEditarEmailCommand.Parameters[0].Value.SetInt32(Programa);
  FEmailProspectEditarEmailCommand.Parameters[1].Value.SetInt32(IdUsuario);
  FEmailProspectEditarEmailCommand.ExecuteUpdate;
  Result := FEmailProspectEditarEmailCommand.Parameters[2].Value.GetBoolean;
end;

procedure TServerModule2Client.EmailProspectExcluirEmail(APrograma: Integer; AIdUsuario: Integer; AId: Integer);
begin
  if FEmailProspectExcluirEmailCommand = nil then
  begin
    FEmailProspectExcluirEmailCommand := FDBXConnection.CreateCommand;
    FEmailProspectExcluirEmailCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEmailProspectExcluirEmailCommand.Text := 'TServerModule2.EmailProspectExcluirEmail';
    FEmailProspectExcluirEmailCommand.Prepare;
  end;
  FEmailProspectExcluirEmailCommand.Parameters[0].Value.SetInt32(APrograma);
  FEmailProspectExcluirEmailCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FEmailProspectExcluirEmailCommand.Parameters[2].Value.SetInt32(AId);
  FEmailProspectExcluirEmailCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.FiltrarOrcamento(Filtro: TJSONValue; Campo: string; Texto: string; IdUsuario: Integer; Contem: Boolean);
begin
  if FFiltrarOrcamentoCommand = nil then
  begin
    FFiltrarOrcamentoCommand := FDBXConnection.CreateCommand;
    FFiltrarOrcamentoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FFiltrarOrcamentoCommand.Text := 'TServerModule2.FiltrarOrcamento';
    FFiltrarOrcamentoCommand.Prepare;
  end;
  FFiltrarOrcamentoCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FFiltrarOrcamentoCommand.Parameters[1].Value.SetWideString(Campo);
  FFiltrarOrcamentoCommand.Parameters[2].Value.SetWideString(Texto);
  FFiltrarOrcamentoCommand.Parameters[3].Value.SetInt32(IdUsuario);
  FFiltrarOrcamentoCommand.Parameters[4].Value.SetBoolean(Contem);
  FFiltrarOrcamentoCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.OrcamentoFiltrarId(AId: Integer);
begin
  if FOrcamentoFiltrarIdCommand = nil then
  begin
    FOrcamentoFiltrarIdCommand := FDBXConnection.CreateCommand;
    FOrcamentoFiltrarIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoFiltrarIdCommand.Text := 'TServerModule2.OrcamentoFiltrarId';
    FOrcamentoFiltrarIdCommand.Prepare;
  end;
  FOrcamentoFiltrarIdCommand.Parameters[0].Value.SetInt32(AId);
  FOrcamentoFiltrarIdCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.OrcamentoGerarParcela(AIdFormaPagto: Integer; ATotalOrcamento: Currency; out AValorPrimeira: Currency; out AValorOutras: Currency);
begin
  if FOrcamentoGerarParcelaCommand = nil then
  begin
    FOrcamentoGerarParcelaCommand := FDBXConnection.CreateCommand;
    FOrcamentoGerarParcelaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoGerarParcelaCommand.Text := 'TServerModule2.OrcamentoGerarParcela';
    FOrcamentoGerarParcelaCommand.Prepare;
  end;
  FOrcamentoGerarParcelaCommand.Parameters[0].Value.SetInt32(AIdFormaPagto);
  FOrcamentoGerarParcelaCommand.Parameters[1].Value.AsCurrency := ATotalOrcamento;
  FOrcamentoGerarParcelaCommand.ExecuteUpdate;
  AValorPrimeira := FOrcamentoGerarParcelaCommand.Parameters[2].Value.AsCurrency;
  AValorOutras := FOrcamentoGerarParcelaCommand.Parameters[3].Value.AsCurrency;
end;

procedure TServerModule2Client.OrcamentoGerarParcelaDifUltima(AQtdeParcelas: Integer; ATotalOrcamento: Currency; out AValorUltima: Currency; out AValorOutras: Currency);
begin
  if FOrcamentoGerarParcelaDifUltimaCommand = nil then
  begin
    FOrcamentoGerarParcelaDifUltimaCommand := FDBXConnection.CreateCommand;
    FOrcamentoGerarParcelaDifUltimaCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoGerarParcelaDifUltimaCommand.Text := 'TServerModule2.OrcamentoGerarParcelaDifUltima';
    FOrcamentoGerarParcelaDifUltimaCommand.Prepare;
  end;
  FOrcamentoGerarParcelaDifUltimaCommand.Parameters[0].Value.SetInt32(AQtdeParcelas);
  FOrcamentoGerarParcelaDifUltimaCommand.Parameters[1].Value.AsCurrency := ATotalOrcamento;
  FOrcamentoGerarParcelaDifUltimaCommand.ExecuteUpdate;
  AValorUltima := FOrcamentoGerarParcelaDifUltimaCommand.Parameters[2].Value.AsCurrency;
  AValorOutras := FOrcamentoGerarParcelaDifUltimaCommand.Parameters[3].Value.AsCurrency;
end;

procedure TServerModule2Client.OrcamentoAtualizarSituacao(ASituacao: Integer; AId: Integer);
begin
  if FOrcamentoAtualizarSituacaoCommand = nil then
  begin
    FOrcamentoAtualizarSituacaoCommand := FDBXConnection.CreateCommand;
    FOrcamentoAtualizarSituacaoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoAtualizarSituacaoCommand.Text := 'TServerModule2.OrcamentoAtualizarSituacao';
    FOrcamentoAtualizarSituacaoCommand.Prepare;
  end;
  FOrcamentoAtualizarSituacaoCommand.Parameters[0].Value.SetInt32(ASituacao);
  FOrcamentoAtualizarSituacaoCommand.Parameters[1].Value.SetInt32(AId);
  FOrcamentoAtualizarSituacaoCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.OrcamentoImprimir(AIdOrcamento: Integer);
begin
  if FOrcamentoImprimirCommand = nil then
  begin
    FOrcamentoImprimirCommand := FDBXConnection.CreateCommand;
    FOrcamentoImprimirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoImprimirCommand.Text := 'TServerModule2.OrcamentoImprimir';
    FOrcamentoImprimirCommand.Prepare;
  end;
  FOrcamentoImprimirCommand.Parameters[0].Value.SetInt32(AIdOrcamento);
  FOrcamentoImprimirCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.OrcamentoEmailEnviado(AIdOrcamento: Integer);
begin
  if FOrcamentoEmailEnviadoCommand = nil then
  begin
    FOrcamentoEmailEnviadoCommand := FDBXConnection.CreateCommand;
    FOrcamentoEmailEnviadoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoEmailEnviadoCommand.Text := 'TServerModule2.OrcamentoEmailEnviado';
    FOrcamentoEmailEnviadoCommand.Prepare;
  end;
  FOrcamentoEmailEnviadoCommand.Parameters[0].Value.SetInt32(AIdOrcamento);
  FOrcamentoEmailEnviadoCommand.ExecuteUpdate;
end;

function TServerModule2Client.OrcamentoProximoNumero: TJSONNumber;
begin
  if FOrcamentoProximoNumeroCommand = nil then
  begin
    FOrcamentoProximoNumeroCommand := FDBXConnection.CreateCommand;
    FOrcamentoProximoNumeroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoProximoNumeroCommand.Text := 'TServerModule2.OrcamentoProximoNumero';
    FOrcamentoProximoNumeroCommand.Prepare;
  end;
  FOrcamentoProximoNumeroCommand.ExecuteUpdate;
  Result := TJSONNumber(FOrcamentoProximoNumeroCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.OrcamentoSalvar(AOrcamento: TJSONValue): TJSONNumber;
begin
  if FOrcamentoSalvarCommand = nil then
  begin
    FOrcamentoSalvarCommand := FDBXConnection.CreateCommand;
    FOrcamentoSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoSalvarCommand.Text := 'TServerModule2.OrcamentoSalvar';
    FOrcamentoSalvarCommand.Prepare;
  end;
  FOrcamentoSalvarCommand.Parameters[0].Value.SetJSONValue(AOrcamento, FInstanceOwner);
  FOrcamentoSalvarCommand.ExecuteUpdate;
  Result := TJSONNumber(FOrcamentoSalvarCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.OrcamentoDuplicar(AIdOrcamento: Integer): TJSONNumber;
begin
  if FOrcamentoDuplicarCommand = nil then
  begin
    FOrcamentoDuplicarCommand := FDBXConnection.CreateCommand;
    FOrcamentoDuplicarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoDuplicarCommand.Text := 'TServerModule2.OrcamentoDuplicar';
    FOrcamentoDuplicarCommand.Prepare;
  end;
  FOrcamentoDuplicarCommand.Parameters[0].Value.SetInt32(AIdOrcamento);
  FOrcamentoDuplicarCommand.ExecuteUpdate;
  Result := TJSONNumber(FOrcamentoDuplicarCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.OrcamentoEmailSupervisor(AIdUsuario: Integer): string;
begin
  if FOrcamentoEmailSupervisorCommand = nil then
  begin
    FOrcamentoEmailSupervisorCommand := FDBXConnection.CreateCommand;
    FOrcamentoEmailSupervisorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoEmailSupervisorCommand.Text := 'TServerModule2.OrcamentoEmailSupervisor';
    FOrcamentoEmailSupervisorCommand.Prepare;
  end;
  FOrcamentoEmailSupervisorCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FOrcamentoEmailSupervisorCommand.ExecuteUpdate;
  Result := FOrcamentoEmailSupervisorCommand.Parameters[1].Value.GetWideString;
end;

function TServerModule2Client.OrcamentoBuscarEmailRemetenteSeteDias: Integer;
begin
  if FOrcamentoBuscarEmailRemetenteSeteDiasCommand = nil then
  begin
    FOrcamentoBuscarEmailRemetenteSeteDiasCommand := FDBXConnection.CreateCommand;
    FOrcamentoBuscarEmailRemetenteSeteDiasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoBuscarEmailRemetenteSeteDiasCommand.Text := 'TServerModule2.OrcamentoBuscarEmailRemetenteSeteDias';
    FOrcamentoBuscarEmailRemetenteSeteDiasCommand.Prepare;
  end;
  FOrcamentoBuscarEmailRemetenteSeteDiasCommand.ExecuteUpdate;
  Result := FOrcamentoBuscarEmailRemetenteSeteDiasCommand.Parameters[0].Value.GetInt32;
end;

function TServerModule2Client.OrcamentoUsuarioMesmoCadastro(AId: Integer; AIdUsuario: Integer; ATipoOperacao: Integer): Boolean;
begin
  if FOrcamentoUsuarioMesmoCadastroCommand = nil then
  begin
    FOrcamentoUsuarioMesmoCadastroCommand := FDBXConnection.CreateCommand;
    FOrcamentoUsuarioMesmoCadastroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoUsuarioMesmoCadastroCommand.Text := 'TServerModule2.OrcamentoUsuarioMesmoCadastro';
    FOrcamentoUsuarioMesmoCadastroCommand.Prepare;
  end;
  FOrcamentoUsuarioMesmoCadastroCommand.Parameters[0].Value.SetInt32(AId);
  FOrcamentoUsuarioMesmoCadastroCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FOrcamentoUsuarioMesmoCadastroCommand.Parameters[2].Value.SetInt32(ATipoOperacao);
  FOrcamentoUsuarioMesmoCadastroCommand.ExecuteUpdate;
  Result := FOrcamentoUsuarioMesmoCadastroCommand.Parameters[3].Value.GetBoolean;
end;

procedure TServerModule2Client.OrcamentoRelatorios(AFiltro: TJSONValue; ATipo: Integer; AIdUsuario: Integer);
begin
  if FOrcamentoRelatoriosCommand = nil then
  begin
    FOrcamentoRelatoriosCommand := FDBXConnection.CreateCommand;
    FOrcamentoRelatoriosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoRelatoriosCommand.Text := 'TServerModule2.OrcamentoRelatorios';
    FOrcamentoRelatoriosCommand.Prepare;
  end;
  FOrcamentoRelatoriosCommand.Parameters[0].Value.SetJSONValue(AFiltro, FInstanceOwner);
  FOrcamentoRelatoriosCommand.Parameters[1].Value.SetInt32(ATipo);
  FOrcamentoRelatoriosCommand.Parameters[2].Value.SetInt32(AIdUsuario);
  FOrcamentoRelatoriosCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.OrcamentoItemLocalizar(AIdOrdem: Integer);
begin
  if FOrcamentoItemLocalizarCommand = nil then
  begin
    FOrcamentoItemLocalizarCommand := FDBXConnection.CreateCommand;
    FOrcamentoItemLocalizarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoItemLocalizarCommand.Text := 'TServerModule2.OrcamentoItemLocalizar';
    FOrcamentoItemLocalizarCommand.Prepare;
  end;
  FOrcamentoItemLocalizarCommand.Parameters[0].Value.SetInt32(AIdOrdem);
  FOrcamentoItemLocalizarCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.OrcamentoItemModuloLocalizar(AIdOrdemItem: Integer);
begin
  if FOrcamentoItemModuloLocalizarCommand = nil then
  begin
    FOrcamentoItemModuloLocalizarCommand := FDBXConnection.CreateCommand;
    FOrcamentoItemModuloLocalizarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoItemModuloLocalizarCommand.Text := 'TServerModule2.OrcamentoItemModuloLocalizar';
    FOrcamentoItemModuloLocalizarCommand.Prepare;
  end;
  FOrcamentoItemModuloLocalizarCommand.Parameters[0].Value.SetInt32(AIdOrdemItem);
  FOrcamentoItemModuloLocalizarCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.OrcamentoOcorrenciaLocalizar(AIdOrdem: Integer);
begin
  if FOrcamentoOcorrenciaLocalizarCommand = nil then
  begin
    FOrcamentoOcorrenciaLocalizarCommand := FDBXConnection.CreateCommand;
    FOrcamentoOcorrenciaLocalizarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoOcorrenciaLocalizarCommand.Text := 'TServerModule2.OrcamentoOcorrenciaLocalizar';
    FOrcamentoOcorrenciaLocalizarCommand.Prepare;
  end;
  FOrcamentoOcorrenciaLocalizarCommand.Parameters[0].Value.SetInt32(AIdOrdem);
  FOrcamentoOcorrenciaLocalizarCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.OrcamentoVenctoLocalizar(AIdOrdem: Integer);
begin
  if FOrcamentoVenctoLocalizarCommand = nil then
  begin
    FOrcamentoVenctoLocalizarCommand := FDBXConnection.CreateCommand;
    FOrcamentoVenctoLocalizarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoVenctoLocalizarCommand.Text := 'TServerModule2.OrcamentoVenctoLocalizar';
    FOrcamentoVenctoLocalizarCommand.Prepare;
  end;
  FOrcamentoVenctoLocalizarCommand.Parameters[0].Value.SetInt32(AIdOrdem);
  FOrcamentoVenctoLocalizarCommand.ExecuteUpdate;
end;

function TServerModule2Client.OrcamentoListarEmail(AIdOrdem: Integer): TJSONValue;
begin
  if FOrcamentoListarEmailCommand = nil then
  begin
    FOrcamentoListarEmailCommand := FDBXConnection.CreateCommand;
    FOrcamentoListarEmailCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoListarEmailCommand.Text := 'TServerModule2.OrcamentoListarEmail';
    FOrcamentoListarEmailCommand.Prepare;
  end;
  FOrcamentoListarEmailCommand.Parameters[0].Value.SetInt32(AIdOrdem);
  FOrcamentoListarEmailCommand.ExecuteUpdate;
  Result := TJSONValue(FOrcamentoListarEmailCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.OrcamentoListarEmailSeteDiasParaSupervisor: TJSONValue;
begin
  if FOrcamentoListarEmailSeteDiasParaSupervisorCommand = nil then
  begin
    FOrcamentoListarEmailSeteDiasParaSupervisorCommand := FDBXConnection.CreateCommand;
    FOrcamentoListarEmailSeteDiasParaSupervisorCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoListarEmailSeteDiasParaSupervisorCommand.Text := 'TServerModule2.OrcamentoListarEmailSeteDiasParaSupervisor';
    FOrcamentoListarEmailSeteDiasParaSupervisorCommand.Prepare;
  end;
  FOrcamentoListarEmailSeteDiasParaSupervisorCommand.ExecuteUpdate;
  Result := TJSONValue(FOrcamentoListarEmailSeteDiasParaSupervisorCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.RamalSalvar(AIdUsuario: Integer; ARamalVO: TJSONValue): Integer;
begin
  if FRamalSalvarCommand = nil then
  begin
    FRamalSalvarCommand := FDBXConnection.CreateCommand;
    FRamalSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRamalSalvarCommand.Text := 'TServerModule2.RamalSalvar';
    FRamalSalvarCommand.Prepare;
  end;
  FRamalSalvarCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FRamalSalvarCommand.Parameters[1].Value.SetJSONValue(ARamalVO, FInstanceOwner);
  FRamalSalvarCommand.ExecuteUpdate;
  Result := FRamalSalvarCommand.Parameters[2].Value.GetInt32;
end;

procedure TServerModule2Client.RamalFiltrarId(AId: Integer);
begin
  if FRamalFiltrarIdCommand = nil then
  begin
    FRamalFiltrarIdCommand := FDBXConnection.CreateCommand;
    FRamalFiltrarIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRamalFiltrarIdCommand.Text := 'TServerModule2.RamalFiltrarId';
    FRamalFiltrarIdCommand.Prepare;
  end;
  FRamalFiltrarIdCommand.Parameters[0].Value.SetInt32(AId);
  FRamalFiltrarIdCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.RamalListarItens(AIdRamal: Integer);
begin
  if FRamalListarItensCommand = nil then
  begin
    FRamalListarItensCommand := FDBXConnection.CreateCommand;
    FRamalListarItensCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRamalListarItensCommand.Text := 'TServerModule2.RamalListarItens';
    FRamalListarItensCommand.Prepare;
  end;
  FRamalListarItensCommand.Parameters[0].Value.SetInt32(AIdRamal);
  FRamalListarItensCommand.ExecuteUpdate;
end;

function TServerModule2Client.OrcamentoNaoAprovadoLocalizarId(AId: Integer): TJSONValue;
begin
  if FOrcamentoNaoAprovadoLocalizarIdCommand = nil then
  begin
    FOrcamentoNaoAprovadoLocalizarIdCommand := FDBXConnection.CreateCommand;
    FOrcamentoNaoAprovadoLocalizarIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoNaoAprovadoLocalizarIdCommand.Text := 'TServerModule2.OrcamentoNaoAprovadoLocalizarId';
    FOrcamentoNaoAprovadoLocalizarIdCommand.Prepare;
  end;
  FOrcamentoNaoAprovadoLocalizarIdCommand.Parameters[0].Value.SetInt32(AId);
  FOrcamentoNaoAprovadoLocalizarIdCommand.ExecuteUpdate;
  Result := TJSONValue(FOrcamentoNaoAprovadoLocalizarIdCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.OrcamentoNaoAprovadoLocalizarOrcamento(AIdOrcamento: Integer): TJSONValue;
begin
  if FOrcamentoNaoAprovadoLocalizarOrcamentoCommand = nil then
  begin
    FOrcamentoNaoAprovadoLocalizarOrcamentoCommand := FDBXConnection.CreateCommand;
    FOrcamentoNaoAprovadoLocalizarOrcamentoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoNaoAprovadoLocalizarOrcamentoCommand.Text := 'TServerModule2.OrcamentoNaoAprovadoLocalizarOrcamento';
    FOrcamentoNaoAprovadoLocalizarOrcamentoCommand.Prepare;
  end;
  FOrcamentoNaoAprovadoLocalizarOrcamentoCommand.Parameters[0].Value.SetInt32(AIdOrcamento);
  FOrcamentoNaoAprovadoLocalizarOrcamentoCommand.ExecuteUpdate;
  Result := TJSONValue(FOrcamentoNaoAprovadoLocalizarOrcamentoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerModule2Client.OrcamentoNaoAprovadoExcluir(AId: Integer);
begin
  if FOrcamentoNaoAprovadoExcluirCommand = nil then
  begin
    FOrcamentoNaoAprovadoExcluirCommand := FDBXConnection.CreateCommand;
    FOrcamentoNaoAprovadoExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoNaoAprovadoExcluirCommand.Text := 'TServerModule2.OrcamentoNaoAprovadoExcluir';
    FOrcamentoNaoAprovadoExcluirCommand.Prepare;
  end;
  FOrcamentoNaoAprovadoExcluirCommand.Parameters[0].Value.SetInt32(AId);
  FOrcamentoNaoAprovadoExcluirCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.OrcamentoNaoAprovadoSalvar(AOrcamentoNAprovado: TJSONValue);
begin
  if FOrcamentoNaoAprovadoSalvarCommand = nil then
  begin
    FOrcamentoNaoAprovadoSalvarCommand := FDBXConnection.CreateCommand;
    FOrcamentoNaoAprovadoSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FOrcamentoNaoAprovadoSalvarCommand.Text := 'TServerModule2.OrcamentoNaoAprovadoSalvar';
    FOrcamentoNaoAprovadoSalvarCommand.Prepare;
  end;
  FOrcamentoNaoAprovadoSalvarCommand.Parameters[0].Value.SetJSONValue(AOrcamentoNAprovado, FInstanceOwner);
  FOrcamentoNaoAprovadoSalvarCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.RecadoFiltrar(Filtro: TJSONValue; Campo: string; Texto: string; Contem: Boolean);
begin
  if FRecadoFiltrarCommand = nil then
  begin
    FRecadoFiltrarCommand := FDBXConnection.CreateCommand;
    FRecadoFiltrarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRecadoFiltrarCommand.Text := 'TServerModule2.RecadoFiltrar';
    FRecadoFiltrarCommand.Prepare;
  end;
  FRecadoFiltrarCommand.Parameters[0].Value.SetJSONValue(Filtro, FInstanceOwner);
  FRecadoFiltrarCommand.Parameters[1].Value.SetWideString(Campo);
  FRecadoFiltrarCommand.Parameters[2].Value.SetWideString(Texto);
  FRecadoFiltrarCommand.Parameters[3].Value.SetBoolean(Contem);
  FRecadoFiltrarCommand.ExecuteUpdate;
end;

procedure TServerModule2Client.RecadoFiltrarId(AId: Integer);
begin
  if FRecadoFiltrarIdCommand = nil then
  begin
    FRecadoFiltrarIdCommand := FDBXConnection.CreateCommand;
    FRecadoFiltrarIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRecadoFiltrarIdCommand.Text := 'TServerModule2.RecadoFiltrarId';
    FRecadoFiltrarIdCommand.Prepare;
  end;
  FRecadoFiltrarIdCommand.Parameters[0].Value.SetInt32(AId);
  FRecadoFiltrarIdCommand.ExecuteUpdate;
end;

function TServerModule2Client.RecadoSalvar(ARecado: TJSONValue): TJSONNumber;
begin
  if FRecadoSalvarCommand = nil then
  begin
    FRecadoSalvarCommand := FDBXConnection.CreateCommand;
    FRecadoSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRecadoSalvarCommand.Text := 'TServerModule2.RecadoSalvar';
    FRecadoSalvarCommand.Prepare;
  end;
  FRecadoSalvarCommand.Parameters[0].Value.SetJSONValue(ARecado, FInstanceOwner);
  FRecadoSalvarCommand.ExecuteUpdate;
  Result := TJSONNumber(FRecadoSalvarCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerModule2Client.RecadoQuadro(AIdUsuario: Integer; AIdRevenda: Integer);
begin
  if FRecadoQuadroCommand = nil then
  begin
    FRecadoQuadroCommand := FDBXConnection.CreateCommand;
    FRecadoQuadroCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRecadoQuadroCommand.Text := 'TServerModule2.RecadoQuadro';
    FRecadoQuadroCommand.Prepare;
  end;
  FRecadoQuadroCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FRecadoQuadroCommand.Parameters[1].Value.SetInt32(AIdRevenda);
  FRecadoQuadroCommand.ExecuteUpdate;
end;

function TServerModule2Client.RecadoPermissaoUsuario(AIdUsuario: Integer; AAcao: string): Boolean;
begin
  if FRecadoPermissaoUsuarioCommand = nil then
  begin
    FRecadoPermissaoUsuarioCommand := FDBXConnection.CreateCommand;
    FRecadoPermissaoUsuarioCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FRecadoPermissaoUsuarioCommand.Text := 'TServerModule2.RecadoPermissaoUsuario';
    FRecadoPermissaoUsuarioCommand.Prepare;
  end;
  FRecadoPermissaoUsuarioCommand.Parameters[0].Value.SetInt32(AIdUsuario);
  FRecadoPermissaoUsuarioCommand.Parameters[1].Value.SetWideString(AAcao);
  FRecadoPermissaoUsuarioCommand.ExecuteUpdate;
  Result := FRecadoPermissaoUsuarioCommand.Parameters[2].Value.GetBoolean;
end;

function TServerModule2Client.StatusEncerramentoRecados: TJSONValue;
begin
  if FStatusEncerramentoRecadosCommand = nil then
  begin
    FStatusEncerramentoRecadosCommand := FDBXConnection.CreateCommand;
    FStatusEncerramentoRecadosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStatusEncerramentoRecadosCommand.Text := 'TServerModule2.StatusEncerramentoRecados';
    FStatusEncerramentoRecadosCommand.Prepare;
  end;
  FStatusEncerramentoRecadosCommand.ExecuteUpdate;
  Result := TJSONValue(FStatusEncerramentoRecadosCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.StatusAberturaRecados: TJSONValue;
begin
  if FStatusAberturaRecadosCommand = nil then
  begin
    FStatusAberturaRecadosCommand := FDBXConnection.CreateCommand;
    FStatusAberturaRecadosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FStatusAberturaRecadosCommand.Text := 'TServerModule2.StatusAberturaRecados';
    FStatusAberturaRecadosCommand.Prepare;
  end;
  FStatusAberturaRecadosCommand.ExecuteUpdate;
  Result := TJSONValue(FStatusAberturaRecadosCommand.Parameters[0].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerModule2Client.UsuarioRelRendimento(ADataInicial: string; ADataFinal: string);
begin
  if FUsuarioRelRendimentoCommand = nil then
  begin
    FUsuarioRelRendimentoCommand := FDBXConnection.CreateCommand;
    FUsuarioRelRendimentoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuarioRelRendimentoCommand.Text := 'TServerModule2.UsuarioRelRendimento';
    FUsuarioRelRendimentoCommand.Prepare;
  end;
  FUsuarioRelRendimentoCommand.Parameters[0].Value.SetWideString(ADataInicial);
  FUsuarioRelRendimentoCommand.Parameters[1].Value.SetWideString(ADataFinal);
  FUsuarioRelRendimentoCommand.ExecuteUpdate;
end;

function TServerModule2Client.UsuarioDiasTrabalhados(ADataInicial: string; ADataFinal: string): TJSONValue;
begin
  if FUsuarioDiasTrabalhadosCommand = nil then
  begin
    FUsuarioDiasTrabalhadosCommand := FDBXConnection.CreateCommand;
    FUsuarioDiasTrabalhadosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUsuarioDiasTrabalhadosCommand.Text := 'TServerModule2.UsuarioDiasTrabalhados';
    FUsuarioDiasTrabalhadosCommand.Prepare;
  end;
  FUsuarioDiasTrabalhadosCommand.Parameters[0].Value.SetWideString(ADataInicial);
  FUsuarioDiasTrabalhadosCommand.Parameters[1].Value.SetWideString(ADataFinal);
  FUsuarioDiasTrabalhadosCommand.ExecuteUpdate;
  Result := TJSONValue(FUsuarioDiasTrabalhadosCommand.Parameters[2].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerModule2Client.ContatoExcluir(AId: Integer);
begin
  if FContatoExcluirCommand = nil then
  begin
    FContatoExcluirCommand := FDBXConnection.CreateCommand;
    FContatoExcluirCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FContatoExcluirCommand.Text := 'TServerModule2.ContatoExcluir';
    FContatoExcluirCommand.Prepare;
  end;
  FContatoExcluirCommand.Parameters[0].Value.SetInt32(AId);
  FContatoExcluirCommand.ExecuteUpdate;
end;

function TServerModule2Client.ContatoLocalizarPorId(AId: Integer): TJSONValue;
begin
  if FContatoLocalizarPorIdCommand = nil then
  begin
    FContatoLocalizarPorIdCommand := FDBXConnection.CreateCommand;
    FContatoLocalizarPorIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FContatoLocalizarPorIdCommand.Text := 'TServerModule2.ContatoLocalizarPorId';
    FContatoLocalizarPorIdCommand.Prepare;
  end;
  FContatoLocalizarPorIdCommand.Parameters[0].Value.SetInt32(AId);
  FContatoLocalizarPorIdCommand.ExecuteUpdate;
  Result := TJSONValue(FContatoLocalizarPorIdCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.ContatoLocalizarPorCliente(AIdCliente: Integer): TJSONValue;
begin
  if FContatoLocalizarPorClienteCommand = nil then
  begin
    FContatoLocalizarPorClienteCommand := FDBXConnection.CreateCommand;
    FContatoLocalizarPorClienteCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FContatoLocalizarPorClienteCommand.Text := 'TServerModule2.ContatoLocalizarPorCliente';
    FContatoLocalizarPorClienteCommand.Prepare;
  end;
  FContatoLocalizarPorClienteCommand.Parameters[0].Value.SetInt32(AIdCliente);
  FContatoLocalizarPorClienteCommand.ExecuteUpdate;
  Result := TJSONValue(FContatoLocalizarPorClienteCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.ContatoLocalizarPorOrcamento(AIdOrcamento: Integer): TJSONValue;
begin
  if FContatoLocalizarPorOrcamentoCommand = nil then
  begin
    FContatoLocalizarPorOrcamentoCommand := FDBXConnection.CreateCommand;
    FContatoLocalizarPorOrcamentoCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FContatoLocalizarPorOrcamentoCommand.Text := 'TServerModule2.ContatoLocalizarPorOrcamento';
    FContatoLocalizarPorOrcamentoCommand.Prepare;
  end;
  FContatoLocalizarPorOrcamentoCommand.Parameters[0].Value.SetInt32(AIdOrcamento);
  FContatoLocalizarPorOrcamentoCommand.ExecuteUpdate;
  Result := TJSONValue(FContatoLocalizarPorOrcamentoCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

procedure TServerModule2Client.LicencasImportar;
begin
  if FLicencasImportarCommand = nil then
  begin
    FLicencasImportarCommand := FDBXConnection.CreateCommand;
    FLicencasImportarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLicencasImportarCommand.Text := 'TServerModule2.LicencasImportar';
    FLicencasImportarCommand.Prepare;
  end;
  FLicencasImportarCommand.ExecuteUpdate;
end;

function TServerModule2Client.LicencasListarTodos(AFiltro: TJSONValue): TJSONValue;
begin
  if FLicencasListarTodosCommand = nil then
  begin
    FLicencasListarTodosCommand := FDBXConnection.CreateCommand;
    FLicencasListarTodosCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLicencasListarTodosCommand.Text := 'TServerModule2.LicencasListarTodos';
    FLicencasListarTodosCommand.Prepare;
  end;
  FLicencasListarTodosCommand.Parameters[0].Value.SetJSONValue(AFiltro, FInstanceOwner);
  FLicencasListarTodosCommand.ExecuteUpdate;
  Result := TJSONValue(FLicencasListarTodosCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.LicencasListarTodosItens(AFiltro: TJSONValue): TJSONValue;
begin
  if FLicencasListarTodosItensCommand = nil then
  begin
    FLicencasListarTodosItensCommand := FDBXConnection.CreateCommand;
    FLicencasListarTodosItensCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLicencasListarTodosItensCommand.Text := 'TServerModule2.LicencasListarTodosItens';
    FLicencasListarTodosItensCommand.Prepare;
  end;
  FLicencasListarTodosItensCommand.Parameters[0].Value.SetJSONValue(AFiltro, FInstanceOwner);
  FLicencasListarTodosItensCommand.ExecuteUpdate;
  Result := TJSONValue(FLicencasListarTodosItensCommand.Parameters[1].Value.GetJSONValue(FInstanceOwner));
end;

function TServerModule2Client.ParametrosCaminhoAplicativoImportarLicencas: string;
begin
  if FParametrosCaminhoAplicativoImportarLicencasCommand = nil then
  begin
    FParametrosCaminhoAplicativoImportarLicencasCommand := FDBXConnection.CreateCommand;
    FParametrosCaminhoAplicativoImportarLicencasCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FParametrosCaminhoAplicativoImportarLicencasCommand.Text := 'TServerModule2.ParametrosCaminhoAplicativoImportarLicencas';
    FParametrosCaminhoAplicativoImportarLicencasCommand.Prepare;
  end;
  FParametrosCaminhoAplicativoImportarLicencasCommand.ExecuteUpdate;
  Result := FParametrosCaminhoAplicativoImportarLicencasCommand.Parameters[0].Value.GetWideString;
end;

procedure TServerModule2Client.LicencaPermissaoAcessar(APrograma: Integer; AIdUsuario: Integer);
begin
  if FLicencaPermissaoAcessarCommand = nil then
  begin
    FLicencaPermissaoAcessarCommand := FDBXConnection.CreateCommand;
    FLicencaPermissaoAcessarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLicencaPermissaoAcessarCommand.Text := 'TServerModule2.LicencaPermissaoAcessar';
    FLicencaPermissaoAcessarCommand.Prepare;
  end;
  FLicencaPermissaoAcessarCommand.Parameters[0].Value.SetInt32(APrograma);
  FLicencaPermissaoAcessarCommand.Parameters[1].Value.SetInt32(AIdUsuario);
  FLicencaPermissaoAcessarCommand.ExecuteUpdate;
end;

function TServerModule2Client.LicencasSalvar(ALicenca: TJSONValue; ALicencaItens: TJSONValue): string;
begin
  if FLicencasSalvarCommand = nil then
  begin
    FLicencasSalvarCommand := FDBXConnection.CreateCommand;
    FLicencasSalvarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLicencasSalvarCommand.Text := 'TServerModule2.LicencasSalvar';
    FLicencasSalvarCommand.Prepare;
  end;
  FLicencasSalvarCommand.Parameters[0].Value.SetJSONValue(ALicenca, FInstanceOwner);
  FLicencasSalvarCommand.Parameters[1].Value.SetJSONValue(ALicencaItens, FInstanceOwner);
  FLicencasSalvarCommand.ExecuteUpdate;
  Result := FLicencasSalvarCommand.Parameters[2].Value.GetWideString;
end;

function TServerModule2Client.LicencasLimpar: string;
begin
  if FLicencasLimparCommand = nil then
  begin
    FLicencasLimparCommand := FDBXConnection.CreateCommand;
    FLicencasLimparCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FLicencasLimparCommand.Text := 'TServerModule2.LicencasLimpar';
    FLicencasLimparCommand.Prepare;
  end;
  FLicencasLimparCommand.ExecuteUpdate;
  Result := FLicencasLimparCommand.Parameters[0].Value.GetWideString;
end;

procedure TServerModule2Client.ModeloRelatoriosFiltrar(Campo: string; Texto: string; Ativo: string; IdUsuario: Integer; Contem: Boolean);
begin
  if FModeloRelatoriosFiltrarCommand = nil then
  begin
    FModeloRelatoriosFiltrarCommand := FDBXConnection.CreateCommand;
    FModeloRelatoriosFiltrarCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FModeloRelatoriosFiltrarCommand.Text := 'TServerModule2.ModeloRelatoriosFiltrar';
    FModeloRelatoriosFiltrarCommand.Prepare;
  end;
  FModeloRelatoriosFiltrarCommand.Parameters[0].Value.SetWideString(Campo);
  FModeloRelatoriosFiltrarCommand.Parameters[1].Value.SetWideString(Texto);
  FModeloRelatoriosFiltrarCommand.Parameters[2].Value.SetWideString(Ativo);
  FModeloRelatoriosFiltrarCommand.Parameters[3].Value.SetInt32(IdUsuario);
  FModeloRelatoriosFiltrarCommand.Parameters[4].Value.SetBoolean(Contem);
  FModeloRelatoriosFiltrarCommand.ExecuteUpdate;
end;


constructor TServerModule2Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;


constructor TServerModule2Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;


destructor TServerModule2Client.Destroy;
begin
  FNovoCommand.DisposeOf;
  FExcluirCommand.DisposeOf;
  FEditarCommand.DisposeOf;
  FFiltrarCommand.DisposeOf;
  FFiltrarCodigoCommand.DisposeOf;
  FLocalizarIdCommand.DisposeOf;
  FLocalizarCodigoCommand.DisposeOf;
  FSalvarCommand.DisposeOf;
  FProximoIdCommand.DisposeOf;
  FProximoCodigoCommand.DisposeOf;
  FRelatorioCommand.DisposeOf;
  FAgendamentoNovoCommand.DisposeOf;
  FAgendamentoExcluirCommand.DisposeOf;
  FAgendamentoEditarCommand.DisposeOf;
  FAgendamentoFiltrarCommand.DisposeOf;
  FAgendamentoFiltarIdCommand.DisposeOf;
  FAgendamentoLocalizarIdCommand.DisposeOf;
  FAgendamentoSalvarCommand.DisposeOf;
  FAgendamentoRelatorioCommand.DisposeOf;
  FAgendamentoQuadroCommand.DisposeOf;
  FAgendamentoPermissaoQuadroCommand.DisposeOf;
  FAgendamentoReagendamentoCommand.DisposeOf;
  FAgendamentoCancelamentoCommand.DisposeOf;
  FAgendamentoEncerramentoCommand.DisposeOf;
  FAgendamentoLocalizarStatusAberturaCommand.DisposeOf;
  FAgendamentoTipoProgramaCommand.DisposeOf;
  FAgendamentoRetornarEmailsCommand.DisposeOf;
  FAgendamentoRetornarClienteCommand.DisposeOf;
  FAgendamentoAbertoCommand.DisposeOf;
  FPlanoBackupExcluirCommand.DisposeOf;
  FPlanoBackupLocalizarCommand.DisposeOf;
  FPlanoBackupLocalizarItemCommand.DisposeOf;
  FPlanoBackupExcluirItemCommand.DisposeOf;
  FPlanoBackupSalvarCommand.DisposeOf;
  FObservacaoSalvarCommand.DisposeOf;
  FFiltrarObservacaoProgramaCommand.DisposeOf;
  FObservacaoPadraoCommand.DisposeOf;
  FObservacaoEmailPadraoCommand.DisposeOf;
  FEscalaSalvarCommand.DisposeOf;
  FEscalaFiltrarCommand.DisposeOf;
  FEscalaRelatoriosCommand.DisposeOf;
  FEscalaBuscarUltimaDataCommand.DisposeOf;
  FModeloRelatorioSalvarCommand.DisposeOf;
  FFormaPagtoSalvarCommand.DisposeOf;
  FFormaPagtoFiltroItemCommand.DisposeOf;
  FPlanoBackupGerarCommand.DisposeOf;
  FSalvarProspectCommand.DisposeOf;
  FFiltrarProspectCommand.DisposeOf;
  FLocalizarCodigoProspectCommand.DisposeOf;
  FEmailLocalizarCodigoCommand.DisposeOf;
  FEmailProspectNovoCommand.DisposeOf;
  FEmailProspectEditarEmailCommand.DisposeOf;
  FEmailProspectExcluirEmailCommand.DisposeOf;
  FFiltrarOrcamentoCommand.DisposeOf;
  FOrcamentoFiltrarIdCommand.DisposeOf;
  FOrcamentoGerarParcelaCommand.DisposeOf;
  FOrcamentoGerarParcelaDifUltimaCommand.DisposeOf;
  FOrcamentoAtualizarSituacaoCommand.DisposeOf;
  FOrcamentoImprimirCommand.DisposeOf;
  FOrcamentoEmailEnviadoCommand.DisposeOf;
  FOrcamentoProximoNumeroCommand.DisposeOf;
  FOrcamentoSalvarCommand.DisposeOf;
  FOrcamentoDuplicarCommand.DisposeOf;
  FOrcamentoEmailSupervisorCommand.DisposeOf;
  FOrcamentoBuscarEmailRemetenteSeteDiasCommand.DisposeOf;
  FOrcamentoUsuarioMesmoCadastroCommand.DisposeOf;
  FOrcamentoRelatoriosCommand.DisposeOf;
  FOrcamentoItemLocalizarCommand.DisposeOf;
  FOrcamentoItemModuloLocalizarCommand.DisposeOf;
  FOrcamentoOcorrenciaLocalizarCommand.DisposeOf;
  FOrcamentoVenctoLocalizarCommand.DisposeOf;
  FOrcamentoListarEmailCommand.DisposeOf;
  FOrcamentoListarEmailSeteDiasParaSupervisorCommand.DisposeOf;
  FRamalSalvarCommand.DisposeOf;
  FRamalFiltrarIdCommand.DisposeOf;
  FRamalListarItensCommand.DisposeOf;
  FOrcamentoNaoAprovadoLocalizarIdCommand.DisposeOf;
  FOrcamentoNaoAprovadoLocalizarOrcamentoCommand.DisposeOf;
  FOrcamentoNaoAprovadoExcluirCommand.DisposeOf;
  FOrcamentoNaoAprovadoSalvarCommand.DisposeOf;
  FRecadoFiltrarCommand.DisposeOf;
  FRecadoFiltrarIdCommand.DisposeOf;
  FRecadoSalvarCommand.DisposeOf;
  FRecadoQuadroCommand.DisposeOf;
  FRecadoPermissaoUsuarioCommand.DisposeOf;
  FStatusEncerramentoRecadosCommand.DisposeOf;
  FStatusAberturaRecadosCommand.DisposeOf;
  FUsuarioRelRendimentoCommand.DisposeOf;
  FUsuarioDiasTrabalhadosCommand.DisposeOf;
  FContatoExcluirCommand.DisposeOf;
  FContatoLocalizarPorIdCommand.DisposeOf;
  FContatoLocalizarPorClienteCommand.DisposeOf;
  FContatoLocalizarPorOrcamentoCommand.DisposeOf;
  FLicencasImportarCommand.DisposeOf;
  FLicencasListarTodosCommand.DisposeOf;
  FLicencasListarTodosItensCommand.DisposeOf;
  FParametrosCaminhoAplicativoImportarLicencasCommand.DisposeOf;
  FLicencaPermissaoAcessarCommand.DisposeOf;
  FLicencasSalvarCommand.DisposeOf;
  FLicencasLimparCommand.DisposeOf;
  FModeloRelatoriosFiltrarCommand.DisposeOf;
  inherited;
end;

end.

