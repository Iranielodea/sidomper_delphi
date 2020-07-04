unit uServerModulo2;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, uDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, uAgendamento, uAgendamentoVO,
  Data.DBXJSON, Data.DBXJSONReflect, uEnumerador, uPlanoBackup, uPlanoBackupVO,
  System.Generics.Collections, uCadastroPadrao, ServerMethodsUnit1, Vcl.Menus,
  uModeloRelatorioVO, uConverter, uOrcamentoEmailVO, uDepartamentoEmailVO,
  uRamal, uRamalVO, uOrcamentoNaoAprovadoVO, uOrcamentoNAprovado, uRecado,
  uRecadoFiltro, uRecadoVO, uStatus, uStatusVO, Dialogs, uTipoVO, uTipo, uEscala,
  uEscalaVO, uUsuarioVO, uCidade, uContato, uContatoVO, uFiltroLicenca,
  uRecadoQuadroViewModel, ULicenca, ULicencaVO, uLicencaItensVO, uTabPreco,
  uTabelaPrecoVO;

type
  TServerModule2 = class(TDSServerModule)
    QAgendamentoCad: TFDQuery;
    QAgendamentoCons: TFDQuery;
    dspAgendamentoCad: TDataSetProvider;
    dspAgendamentoCons: TDataSetProvider;
    spAgendamento: TFDStoredProc;
    QAgendaQuadro: TFDQuery;
    dspAgendaQuadro: TDataSetProvider;
    QPlanoBackup: TFDQuery;
    QPlanoBackupPlb_Id: TFDAutoIncField;
    QPlanoBackupPlb_Destino: TStringField;
    QPlanoBackupPlb_Domingo: TBooleanField;
    QPlanoBackupPlb_Segunda: TBooleanField;
    QPlanoBackupPlb_Terca: TBooleanField;
    QPlanoBackupPlb_Quarta: TBooleanField;
    QPlanoBackupPlb_Quinta: TBooleanField;
    QPlanoBackupPlb_Sexta: TBooleanField;
    QPlanoBackupPlb_Sabado: TBooleanField;
    QPlanoBackupPlb_Ativo: TBooleanField;
    QPlanoBackupPlb_DataUltimoBackup: TDateField;
    dspPlanoBackup: TDataSetProvider;
    QPlanoBackupItens: TFDQuery;
    QPlanoBackupItensPlbIte_Hora: TTimeField;
    QPlanoBackupItensPlbIte_Id: TFDAutoIncField;
    QPlanoBackupItensPlbIte_PlanoBackup: TIntegerField;
    QPlanoBackupItensPlbIte_Status: TBooleanField;
    dspPlanoBackupItens: TDataSetProvider;
    spPlanoBackup: TFDStoredProc;
    spPlanoBackupItens: TFDStoredProc;
    QBackup: TFDQuery;
    QBackupDiaHoje: TIntegerField;
    QBackupPlb_Destino: TStringField;
    QBackupPlb_Domingo: TBooleanField;
    QBackupPlb_Segunda: TBooleanField;
    QBackupPlb_Terca: TBooleanField;
    QBackupPlb_Quarta: TBooleanField;
    QBackupPlb_Quinta: TBooleanField;
    QBackupPlb_Sexta: TBooleanField;
    QBackupPlb_Sabado: TBooleanField;
    QBackupPlb_DataUltimoBackup: TDateField;
    QBackupPlbIte_Id: TFDAutoIncField;
    QBackupPlbIte_Hora: TTimeField;
    QBackupPlbIte_Status: TBooleanField;
    QProspectCad: TFDQuery;
    QProspectCadPros_Ativo: TBooleanField;
    QProspectCadPros_Contato: TStringField;
    QProspectCadPros_Docto: TStringField;
    QProspectCadPros_Endereco: TStringField;
    QProspectCadPros_Enquadramento: TStringField;
    QProspectCadPros_Fantasia: TStringField;
    QProspectCadPros_Id: TFDAutoIncField;
    QProspectCadPros_Nome: TStringField;
    QProspectCadPros_Revenda: TIntegerField;
    QProspectCadPros_Telefone: TStringField;
    QProspectCadPros_Usuario: TIntegerField;
    QProspectCadRev_Codigo: TIntegerField;
    QProspectCadRev_Nome: TWideStringField;
    QProspectCadUsu_Codigo: TIntegerField;
    QProspectCadUsu_Nome: TWideStringField;
    dspProspectCad: TDataSetProvider;
    QProspectCons: TFDQuery;
    spProspect: TFDStoredProc;
    QProspectCadPros_Codigo: TIntegerField;
    dspProspectCons: TDataSetProvider;
    QProspectEmail: TFDQuery;
    dspProspectEmail: TDataSetProvider;
    spProspectEmail: TFDStoredProc;
    QProspectEmailProsEm_Id: TFDAutoIncField;
    QProspectEmailProsEm_Prospect: TIntegerField;
    QProspectEmailProsEm_Email: TStringField;
    QProspectEmailProsEm_Descricao: TStringField;
    QOrcamentoCad: TFDQuery;
    dspOrcamentoCad: TDataSetProvider;
    spOrcamento: TFDStoredProc;
    QOrcamentoCons: TFDQuery;
    dspOrcamentoCons: TDataSetProvider;
    QOrcamentoItemCad: TFDQuery;
    dspOrcamentoItemCad: TDataSetProvider;
    spOrcamentoItem: TFDStoredProc;
    QOrcamentoItemCons: TFDQuery;
    dspOrcamentoItemCons: TDataSetProvider;
    QOrcamentoItemModuloCad: TFDQuery;
    dspOrcamentoItemModuloCad: TDataSetProvider;
    spOrcamentoItemModulo: TFDStoredProc;
    QOrcamentoItemModuloCons: TFDQuery;
    dspOrcamentoItemModuloCons: TDataSetProvider;
    QOrcamentoOcorrenciaCad: TFDQuery;
    dspOrcamentoOcorrenciaCad: TDataSetProvider;
    spOrcamentoOcorrencia: TFDStoredProc;
    QOrcamentoOcorrenciaCons: TFDQuery;
    dspOrcamentoOcorrenciaCons: TDataSetProvider;
    QOrcamentoVectCad: TFDQuery;
    dspOrcamentoVectCad: TDataSetProvider;
    MainMenu1: TMainMenu;
    spOrcamentoVect: TFDStoredProc;
    QOrcamentoVectCons: TFDQuery;
    dspOrcamentoVectCon: TDataSetProvider;
    QObservacaoCad: TFDQuery;
    dspObservacaoCad: TDataSetProvider;
    QObservacaoCons: TFDQuery;
    dspObservacaoCons: TDataSetProvider;
    spObservacao: TFDStoredProc;
    QFormaPagtoCad: TFDQuery;
    dspFormaPagtoCad: TDataSetProvider;
    QFormaPagtoCons: TFDQuery;
    dspFormaPagtoCons: TDataSetProvider;
    QFormaPagtoItemCons: TFDQuery;
    dspFormaPagtoItemCons: TDataSetProvider;
    QOrcamentoImprimir: TFDQuery;
    dspOrcamentoImprimir: TDataSetProvider;
    QOrcamentoOcorrenciaImp: TFDQuery;
    dsPonteOrcamentoOcorr: TDataSource;
    QOrcamentoImprimirOrc_Id: TFDAutoIncField;
    QOrcamentoImprimirOrc_Numero: TIntegerField;
    QOrcamentoImprimirOrc_Data: TDateField;
    QOrcamentoImprimirOrc_IdUsuario: TIntegerField;
    QOrcamentoImprimirOrc_IdProspect: TIntegerField;
    QOrcamentoImprimirOrc_Observacao: TMemoField;
    QOrcamentoImprimirOrc_ObservacaoEmail: TMemoField;
    QOrcamentoImprimirOrc_IdCliente: TIntegerField;
    QOrcamentoImprimirOrc_Situacao: TIntegerField;
    QOrcamentoImprimirOrc_IdFormaPagto: TIntegerField;
    QOrcamentoImprimirUsu_Codigo: TIntegerField;
    QOrcamentoImprimirUsu_Nome: TWideStringField;
    QOrcamentoImprimirCli_Codigo: TIntegerField;
    QOrcamentoImprimirOrcIte_Id: TFDAutoIncField;
    QOrcamentoImprimirOrcIte_Orcamento: TIntegerField;
    QOrcamentoImprimirOrc_IdProduto: TIntegerField;
    QOrcamentoImprimirOrcIte_Descricao: TStringField;
    QOrcamentoImprimirOrcIte_ValorLicencaImpl: TCurrencyField;
    QOrcamentoImprimirOrcIte_ValorDescImpl: TCurrencyField;
    QOrcamentoImprimirOrcIte_ValorLicencaMensal: TCurrencyField;
    QOrcamentoImprimirOrcIte_ValorDescMensal: TCurrencyField;
    QOrcamentoImprimirOrc_IdTipo: TIntegerField;
    QOrcamentoImprimirOrc_IdStatus: TIntegerField;
    QOrcamentoImprimirProd_Codigo: TIntegerField;
    QOrcamentoImprimirProd_Nome: TWideStringField;
    QOrcamentoImprimirSta_Codigo: TIntegerField;
    QOrcamentoImprimirSta_Nome: TWideStringField;
    QOrcamentoOcorrenciaImpOrcOco_Data: TDateField;
    QOrcamentoOcorrenciaImpOrcOco_Descricao: TStringField;
    QOrcamentoOcorrenciaImpOrcOco_Id: TFDAutoIncField;
    QOrcamentoOcorrenciaImpOrcOco_Orcamento: TIntegerField;
    QOrcamentoOcorrenciaImpOrcOco_Usuario: TIntegerField;
    QOrcamentoOcorrenciaImpUsu_Codigo: TIntegerField;
    QOrcamentoOcorrenciaImpUsu_Nome: TWideStringField;
    dspOrcamentoOcorrenciaImp: TDataSetProvider;
    QOrcamentoVenctImp: TFDQuery;
    dspOrcamentoVenctImp: TDataSetProvider;
    QOrcamentoImprimirTotalItem: TCurrencyField;
    QOrcamentoItemModuloImp: TFDQuery;
    dspOrcamentoItemModuloImp: TDataSetProvider;
    QModeloRelatorioCad: TFDQuery;
    QModeloRelatorioCons: TFDQuery;
    dspModeloRelatorioCad: TDataSetProvider;
    dspModeloRelatorioCons: TDataSetProvider;
    QOrcamentoImprimirOrc_RazaoSocial: TStringField;
    QOrcamentoImprimirOrc_Fantasia: TStringField;
    QOrcamentoImprimirOrc_Contato: TStringField;
    QOrcamentoImprimirOrc_Dcto: TStringField;
    QOrcamentoImprimirOrc_Endereco: TStringField;
    QOrcamentoImprimirOrc_Telefone: TStringField;
    QRamalCad: TFDQuery;
    QRamalCons: TFDQuery;
    dspRamalCad: TDataSetProvider;
    dspRamalCons: TDataSetProvider;
    QRamalItens: TFDQuery;
    dspRamalItens: TDataSetProvider;
    QRamalRelatorio: TFDQuery;
    dspRamalRelatorio: TDataSetProvider;
    QOrcamentoRelatorio1: TFDQuery;
    dspOrcamentoRelatorio1: TDataSetProvider;
    QOrcamentoGraficoTipo: TFDQuery;
    dspOrcamentoGraficoTipo: TDataSetProvider;
    QOrcamentoGraficoUsuario: TFDQuery;
    dspOrcamentoGraficoUsuario: TDataSetProvider;
    QOrcamentoGraficoUsuarioQtde: TFDQuery;
    dspOrcamentoGraficoUsuarioQtde: TDataSetProvider;
    QOrcamentoRelatorio3: TFDQuery;
    dspOrcamentoRelatorio3: TDataSetProvider;
    QOrcamentoGraficoNaoAprovado: TFDQuery;
    dspOrcamentoGraficoNaoAprovado: TDataSetProvider;
    QRecadoCad: TFDQuery;
    dspRecadoCad: TDataSetProvider;
    QRecadoCons: TFDQuery;
    dspRecadoCons: TDataSetProvider;
    QRecadoQuadro: TFDQuery;
    dspRecadoQuadro: TDataSetProvider;
    QUsuarioRenda: TFDQuery;
    dspUsuarioRenda: TDataSetProvider;
    QEscalaCons: TFDQuery;
    dspEscalaCons: TDataSetProvider;
    QEscalaCad: TFDQuery;
    dspEscalaCad: TDataSetProvider;
    QEscalaCadEsc_Id: TFDAutoIncField;
    QEscalaCadEsc_Data: TDateField;
    QEscalaCadEsc_Usuario: TIntegerField;
    QEscalaCadEsc_HoraInicio: TTimeField;
    QEscalaCadEsc_HoraFim: TTimeField;
    QEscalaCadUsu_Codigo: TIntegerField;
    QEscalaCadUsu_Nome: TWideStringField;
    QEscalaRelatorio1: TFDQuery;
    dspEscalaRelatorio1: TDataSetProvider;
    QCidadeCad: TFDQuery;
    QCidadeCadCid_Id: TFDAutoIncField;
    QCidadeCadCid_Codigo: TIntegerField;
    QCidadeCadCid_Nome: TStringField;
    QCidadeCadCid_UF: TStringField;
    dspCidadeCad: TDataSetProvider;
    QCidadeCons: TFDQuery;
    dspCidadeCons: TDataSetProvider;
    QCidadeCadCid_Ativo: TBooleanField;
    QOrcamentoImprimirOrc_Fone1: TStringField;
    QOrcamentoImprimirOrc_Fone2: TStringField;
    QOrcamentoImprimirOrc_Celular: TStringField;
    QOrcamentoImprimirOrc_FoneOutro: TStringField;
    QOrcamentoImprimirOrc_ContatoFinanceiro: TStringField;
    QOrcamentoImprimirOrc_ContatoFinanceiroFone: TStringField;
    QOrcamentoImprimirOrc_ContatoCompraVenda: TStringField;
    QOrcamentoImprimirOrc_ContatoCompraVendaFone: TStringField;
    QOrcamentoImprimirOrc_IE: TStringField;
    QOrcamentoImprimirOrc_RepreLegal: TStringField;
    QOrcamentoImprimirOrc_RepreLegalCPF: TStringField;
    QOrcamentoImprimirCid_Codigo: TIntegerField;
    QOrcamentoImprimirCid_Nome: TStringField;
    QOrcamentoImprimirCid_UF: TStringField;
    QOrcamentoImprimirOrc_Logradouro: TStringField;
    QOrcamentoImprimirOrc_Bairro: TStringField;
    QOrcamentoImprimirOrc_CEP: TStringField;
    QContato: TFDQuery;
    dspContato: TDataSetProvider;
    QFeriadoCad: TFDQuery;
    dspFeriadoCad: TDataSetProvider;
    QFeriadoCadFer_Id: TFDAutoIncField;
    QFeriadoCadFer_Data: TDateField;
    QFeriadoCadFer_Descricao: TStringField;
    QFeriadoCons: TFDQuery;
    dspFeriadoCons: TDataSetProvider;
    QCategoriaCad: TFDQuery;
    QCategoriaCons: TFDQuery;
    dspCategoriaCad: TDataSetProvider;
    QCategoriaCadCat_Id: TFDAutoIncField;
    QCategoriaCadCat_Codigo: TIntegerField;
    QCategoriaCadCat_Nome: TStringField;
    QCategoriaCadCat_Ativo: TBooleanField;
    dspCategoriaCons: TDataSetProvider;
    QTabPrecoCons: TFDQuery;
    QTabPrecoCad: TFDQuery;
    dspTabPrecoCons: TDataSetProvider;
    dspTabPrecoCad: TDataSetProvider;
    QTabPrecoConsTab_Id: TFDAutoIncField;
    QTabPrecoConsTab_Nome: TStringField;
    QTabPrecoCadTab_Id: TFDAutoIncField;
    QTabPrecoCadTab_Data: TDateField;
    QTabPrecoCadTab_Referencia: TStringField;
    QTabPrecoCadTab_Nome: TStringField;
    QTabPrecoCadTab_Produto: TIntegerField;
    QTabPrecoCadTab_Status: TIntegerField;
    QTabPrecoCadTab_Tipo: TIntegerField;
    QTabPrecoCadTab_Ativo: TBooleanField;
    QTabPrecoCadTab_ValorImplSimples: TBCDField;
    QTabPrecoCadTab_ValorMensalSimples: TBCDField;
    QTabPrecoCadTab_Observacao: TStringField;
    QTabPrecoCadTab_ValorImplRegNormal: TBCDField;
    QTabPrecoCadTab_ValorMensalRegNormal: TBCDField;
    QTabPrecoCadProd_Codigo: TIntegerField;
    QTabPrecoCadProd_Nome: TWideStringField;
    QTabPrecoCadSta_Codigo: TIntegerField;
    QTabPrecoCadSta_Nome: TWideStringField;
    QTabPrecoCadTip_Codigo: TIntegerField;
    QTabPrecoCadTip_Nome: TWideStringField;
    QTabPrecoItens: TFDQuery;
    dspTabPrecoItens: TDataSetProvider;
    QTabPrecoItensTabM_Id: TFDAutoIncField;
    QTabPrecoItensTabM_TabPreco: TIntegerField;
    QTabPrecoItensTabM_Modulo: TIntegerField;
    QTabPrecoItensMod_Codigo: TIntegerField;
    QTabPrecoItensMod_Nome: TWideStringField;
    QTabPrecoConsTab_Referencia: TStringField;
  private
    { Private declarations }
  public
//------------------------------------------------------------------------------
// Cadastro Padrao
//------------------------------------------------------------------------------
    procedure Novo(Programa, IdUsuario: Integer);
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Editar(programa, Idusuario, Id: Integer): Boolean;
    procedure Filtrar(Programa: Integer; Campo, Texto, Ativo: string; Contem: Boolean = True);
    procedure FiltrarCodigo(Programa, Codigo: Integer);
    procedure LocalizarId(Programa, Id: integer);
    procedure LocalizarCodigo(Programa, Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoId(Programa: Integer): TJSONNumber;
    function ProximoCodigo(Programa: Integer): TJSONNumber;
    procedure Relatorio(Programa, IdUsuario: integer);
//------------------------------------------------------------------------------
// Tabela de Precos
//------------------------------------------------------------------------------
    procedure TabPrecoNovo(Programa, IdUsuario: Integer);
    function TabPrecoEditar(Programa, IdUsuario: Integer): Boolean;
    procedure TabPrecoExcluir(Programa, IdUsuario, Id: Integer);
    procedure TabPrecoFiltrar(Campo, Texto, Ativo: string; Contem: Boolean; AFiltro: TJSONValue; Id: Integer = 0);
    function TabPrecoLocalizarId(Id: integer): TJSONValue;
    function TabPrecoSalvar(Programa, IdUsuario: Integer; ATabPreco: TJSONValue): TJSONNumber;
    procedure TabPrecoRelatorio(Programa, IdUsuario: Integer);

//------------------------------------------------------------------------------
// Agendamento
//------------------------------------------------------------------------------
    procedure AgendamentoNovo(APrograma, AIdUsuario: Integer);
    procedure AgendamentoExcluir(APrograma, AIdUsuario, AId: Integer);
    function AgendamentoEditar(APrograma, AIdUsuario, AId: Integer): Boolean;
    function AgendamentoFiltrar(Filtro: TJSONValue; ACampo, ATexto: string; AIdUsuario: Integer; AContem: Boolean = True): string;
    function AgendamentoFiltarId(AId: integer): string;
    function AgendamentoLocalizarId(APrograma, AId: integer): Boolean;
    function AgendamentoSalvar(APrograma, AIdUsuario: Integer; AAgendamentoVO: TJSONValue): Integer;
    procedure AgendamentoRelatorio(APrograma, AIdUsuario: Integer);
    procedure AgendamentoQuadro(ADataInicial, ADataFinal: string; AIdUsuario, AIdRevenda: Integer);
    function AgendamentoQuadroJSON(ADataInicial, ADataFinal: string; AIdUsuario, AIdRevenda: Integer): TJSONValue;

    function AgendamentoPermissaoQuadro(AIdUsuario: Integer): Boolean;
    procedure AgendamentoReagendamento(AIdUsuario, AIdAgendamento: Integer; AData, AHora, ATexto: string);
    procedure AgendamentoCancelamento(AIdUsuario, AIdAgendamento: Integer; AData, AHora, ATexto: string);
    procedure AgendamentoEncerramento(AIdUsuario, AIdAgendamento, AIdPrograma: Integer);
    procedure AgendamentoEncerramentoWEB(AIdUsuario, AIdAgendamento: Integer);
    function AgendamentoLocalizarStatusAbertura(): Integer;
    function AgendamentoTipoPrograma(AIdAgenda: Integer): Integer;

    function AgendamentoRetornarEmails(AIdAgenda, AIdUsuario, AIdStatus: integer): string;
    function AgendamentoRetornarCliente(AIdAgenda, AIdUsuario: integer): string;
    function AgendamentoAberto(AIdUsuario: Integer): Boolean;
//------------------------------------------------------------------------------
// outros
//------------------------------------------------------------------------------
    procedure PlanoBackupExcluir(AId: Integer);
    procedure PlanoBackupLocalizar();
    procedure PlanoBackupLocalizarItem(AId: integer);
    procedure PlanoBackupExcluirItem(AId: integer);
    procedure PlanoBackupSalvar(APlanoBackup: TJSONValue; APlanoItens: TJSONValue);
//------------------------------------------------------------------------------
// Observacao
    function ObservacaoSalvar(AObservacaoVO: TJSONValue): Integer;
    procedure FiltrarObservacaoPrograma(Campo, Texto, Ativo: string; StatusPrograma: Integer; Contem: Boolean = True);
    procedure ObservacaoPadrao(APrograma: Integer);
    procedure ObservacaoEmailPadrao(APrograma: Integer);
//------------------------------------------------------------------------------
// Escalas
    function EscalaSalvar(AEscalaVO: TJSONValue; AIdUsuario: integer): Integer;
    function EscalaFiltrar(Filtro: TJSONValue; ACampo, ATexto: string; AIdUsuario: Integer; AContem: Boolean = True): string;
    procedure EscalaRelatorios(AFiltro: TJSONValue; AModelo: Integer);
    function EscalaBuscarUltimaData(): string;
//------------------------------------------------------------------------------

    function ModeloRelatorioSalvar(AModeloRelatorioVO: TJSONValue): Integer;

    function FormaPagtoSalvar(AFormaPagtoVO: TJSONValue): Integer;
    procedure FormaPagtoFiltroItem(AIdFormaPagto: Integer);

    procedure PlanoBackupGerar;
//------------------------------------------------------------------------------
// Prospect
//------------------------------------------------------------------------------
    function SalvarProspect(AIdUsuario: Integer; AProspectVO: TJSONValue): Integer;
    procedure FiltrarProspect(Filtro: TJSONValue; Programa, IdUsuario: Integer; Campo, Texto, Ativo: string; Contem: Boolean = True);
    procedure LocalizarCodigoProspect(Codigo, IdUsuario: integer);
//------------------------------------------------------------------------------
// Prospect Email
//------------------------------------------------------------------------------
    procedure EmailLocalizarCodigo(AIdProspect: Integer);
    procedure EmailProspectNovo(Programa, IdUsuario: Integer);
    function EmailProspectEditarEmail(Programa, IdUsuario: Integer): Boolean;
    procedure EmailProspectExcluirEmail(APrograma, AIdUsuario, AId: Integer);
//------------------------------------------------------------------------------
// Orcamento
//------------------------------------------------------------------------------
    procedure FiltrarOrcamento(Filtro: TJSONValue; Campo, Texto: string;
      IdUsuario: Integer; Contem: Boolean);
    procedure OrcamentoFiltrarId(AId: Integer);
    procedure OrcamentoGerarParcela(AIdFormaPagto: Integer; ATotalOrcamento: Currency;
      out AValorPrimeira: Currency; out AValorOutras: Currency);
    procedure OrcamentoGerarParcelaDifUltima(AQtdeParcelas: Integer; ATotalOrcamento: Currency;
      out AValorUltima: Currency; out AValorOutras: Currency);

    procedure OrcamentoAtualizarSituacao(ASituacao, AId: Integer);
    procedure OrcamentoImprimir(AIdOrcamento: Integer);
    procedure OrcamentoEmailEnviado(AIdOrcamento: Integer);

    function OrcamentoProximoNumero: TJSONNumber;
    function OrcamentoSalvar(AOrcamento: TJSONValue): TJSONNumber;
    function OrcamentoDuplicar(AIdOrcamento: Integer): TJSONNumber;
    function OrcamentoEmailSupervisor(AIdUsuario: Integer): string;
    function OrcamentoBuscarEmailRemetenteSeteDias(): Integer;
    function OrcamentoUsuarioMesmoCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;
//------------------------------------------------------------------------------
// Relatorios orcamentos
//------------------------------------------------------------------------------
    procedure OrcamentoRelatorios(AFiltro: TJSONValue; ATipo, AIdUsuario: Integer);
//------------------------------------------------------------------------------
// Itens do Orcamento
//------------------------------------------------------------------------------
    procedure OrcamentoItemLocalizar(AIdOrdem: integer);
//------------------------------------------------------------------------------
// Modulos do Orcamento
//------------------------------------------------------------------------------
    procedure OrcamentoItemModuloLocalizar(AIdOrdemItem: integer);
//------------------------------------------------------------------------------
// Ocorrencias do Orcamento
//------------------------------------------------------------------------------
    procedure OrcamentoOcorrenciaLocalizar(AIdOrdem: integer);
//------------------------------------------------------------------------------
// Vencimentos do Orcamento
//------------------------------------------------------------------------------
    procedure OrcamentoVenctoLocalizar(AIdOrdem: integer);
//------------------------------------------------------------------------------
// Vencimentos do Orcamento
//------------------------------------------------------------------------------
    function OrcamentoListarEmail(AIdOrdem: Integer): TJSONValue;
    function OrcamentoListarEmailSeteDiasParaSupervisor(): TJSONValue;
//------------------------------------------------------------------------------
// Ramal
//------------------------------------------------------------------------------
    function RamalSalvar(AIdUsuario: Integer; ARamalVO: TJSONValue): Integer;
    procedure RamalFiltrarId(AId: Integer);
    procedure RamalListarItens(AIdRamal: Integer);
//------------------------------------------------------------------------------
// Orcamento não Aprovado
//------------------------------------------------------------------------------
    function OrcamentoNaoAprovadoLocalizarId(AId: integer): TJSONValue;
    function OrcamentoNaoAprovadoLocalizarOrcamento(AIdOrcamento: integer): TJSONValue;
    procedure OrcamentoNaoAprovadoExcluir(AId: integer);
    procedure OrcamentoNaoAprovadoSalvar(AOrcamentoNAprovado: TJSONValue);
//------------------------------------------------------------------------------
// Recados
//------------------------------------------------------------------------------
    procedure RecadoFiltrar(Filtro: TJSONValue; Campo, Texto: string;
      Contem: Boolean);
    procedure RecadoFiltrarId(AId: Integer);
    function RecadoSalvar(ARecado: TJSONValue): TJSONNumber;
    procedure RecadoQuadro(AIdUsuario, AIdRevenda: Integer);
    function RecadoQuadroJSON(AIdUsuario, AIdRevenda: Integer): TJSONValue;

    function RecadoPermissaoUsuario(AIdUsuario: Integer; AAcao: string): Boolean;
//------------------------------------------------------------------------------
// Parametros
//------------------------------------------------------------------------------
    function StatusEncerramentoRecados: TJSONValue;
    function StatusAberturaRecados: TJSONValue;
//------------------------------------------------------------------------------
// Usuarios
//------------------------------------------------------------------------------
    procedure UsuarioRelRendimento(ADataInicial, ADataFinal: string; AFiltroUsuario: TJSONValue);
    function UsuarioDiasTrabalhados(ADataInicial, ADataFinal: string): TJSONValue;
//------------------------------------------------------------------------------
// Contatos
//------------------------------------------------------------------------------
    procedure ContatoExcluir(AId: Integer);
    function ContatoLocalizarPorId(AId: Integer): TJSONValue;
    function ContatoLocalizarPorCliente(AIdCliente: Integer): TJSONValue;
    function ContatoLocalizarPorOrcamento(AIdOrcamento: Integer): TJSONValue;
//------------------------------------------------------------------------------
// Licencas
//------------------------------------------------------------------------------
    procedure LicencasImportar();
    function LicencasListarTodos(AFiltro: TJSONValue): TJSONValue;
    function LicencasListarTodosItens(AFiltro: TJSONValue): TJSONValue;
    function ParametrosCaminhoAplicativoImportarLicencas(): string;
    procedure LicencaPermissaoAcessar(APrograma, AIdUsuario: Integer);
    function LicencasSalvar(ALicenca, ALicencaItens: TJSONValue): string;
    function LicencasLimpar(): string;
//------------------------------------------------------------------------------
// Modelos de Relatorios
//------------------------------------------------------------------------------
    Procedure ModeloRelatoriosFiltrar(Campo, Texto, Ativo: string; IdUsuario: Integer; Contem: Boolean = True);
  end;

  var
    ServerModule2: TServerModule2;
implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFiltroAgendamento, uUsuario, uAgendamentoEmail, uFiltroUsuario,
  uFiltroCliente, uProspect, uProspectVO, uFiltroProspect, uProspectEmailVO,
  uOrcamento, uFiltroOrcamento, uOrcamentoVO, uObservacaoVO, uObservacao,
  uFormaPagto, uFormaPagtoVO, uParametros, uModeloRelatorio;

{$R *.dfm}

{ TServerModule2 }


{ TServerModule2 }

function TServerModule2.AgendamentoAberto(AIdUsuario: Integer): Boolean;
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    Result := obj.VerificarAgendamentoAberto(AIdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.AgendamentoCancelamento(AIdUsuario, AIdAgendamento: Integer; AData,
  AHora, ATexto: string);
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    obj.Cancelamento(AIdUsuario, AIdAgendamento, AData, AHora, ATexto);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.AgendamentoEditar(APrograma, AIdUsuario, AId: Integer): Boolean;
var
  obj: TAgendamento;
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  obj := TAgendamento.Create;
  try
    AgendamentoLocalizarId(CAgendamentoPrograma, AId);

    Result := obj.Editar(APrograma, AIdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(AIdUsuario);

      if Result = False then
        Result := obj.UsuarioIgualCadastro(AId, AIdUsuario, 2);
    end;

    if obj.UsuarioIgualCadastro(AId, AIdUsuario, 2) then
      Result := AgendamentoLocalizarId(CAgendamentoPrograma, AId);

//    else begin
//      try
//        AgendamentoLocalizarId(CAgendamentoPrograma, AId);
//        Result := obj.Editar(APrograma, AIdUsuario);
//      except
//        On E: Exception do
//        begin
//          raise Exception.Create(E.Message);
//        end;
//      end;
//    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Usuario);
  end;
end;

procedure TServerModule2.AgendamentoEncerramentoWEB(AIdUsuario,
  AIdAgendamento: Integer);
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    try
      obj.EncerramentoWEB(AIdUsuario, AIdAgendamento);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.AgendamentoEncerramento(AIdUsuario, AIdAgendamento, AIdPrograma: Integer);
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    try
      obj.Encerramento(AIdUsuario, AIdAgendamento, AIdPrograma);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.AgendamentoExcluir(APrograma, AIdUsuario, AId: Integer);
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    try
      obj.Excluir(APrograma, AIdUsuario, AId);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.AgendamentoFiltarId(AId: integer): string;
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    QAgendamentoCons.Close;
    QAgendamentoCons.SQL.Text := obj.FiltrarPorId(AId);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.AgendamentoFiltrar(Filtro: TJSONValue; ACampo, ATexto: string;
  AIdUsuario: Integer; AContem: Boolean): string;
var
  obj: TAgendamento;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroAgendamento;
begin
  if Filtro is TJSONNull then
    Exit;

  UnMarshal := TJSONUnMarshal.Create;
  obj := TAgendamento.Create;
  try
    oFiltro := TFiltroAgendamento(UnMarshal.Unmarshal(Filtro));
    QAgendamentoCons.Close;
    QAgendamentoCons.SQL.Text := obj.Filtrar(oFiltro, ACampo, ATexto, AIdUsuario, AContem);
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
    FreeAndNil(obj);
  end;
end;

function TServerModule2.AgendamentoLocalizarId(APrograma, AId: integer): Boolean;
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    QAgendamentoCad.Close;
    Result := obj.LocalizarId(QAgendamentoCad, AId);
  finally
    FreeAndNil(Obj);
  end;
end;

function TServerModule2.AgendamentoLocalizarStatusAbertura: Integer;
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    Result := obj.LocalizarStatusAbertura();
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.AgendamentoNovo(APrograma, AIdUsuario: Integer);
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    try
      obj.Novo(APrograma, AIdUsuario);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.AgendamentoPermissaoQuadro(
  AIdUsuario: Integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoAgendamentoQuadro(AIdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TServerModule2.AgendamentoReagendamento(AIdUsuario, AIdAgendamento: Integer;
  AData, AHora, ATexto: string);
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    obj.Reagendamento(AIdUsuario, AIdAgendamento, AData, AHora, ATexto);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.AgendamentoRelatorio(APrograma, AIdUsuario: Integer);
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    obj.Relatorio(APrograma, AIdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.AgendamentoRetornarCliente(AIdAgenda,
  AIdUsuario: integer): string;
var
  obj: TAgendamentoEmail;
begin
  obj := TAgendamentoEmail.Create;
  try
    Result := obj.RetornaEmailCliente(AIdAgenda, AIdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.AgendamentoRetornarEmails(AIdAgenda, AIdUsuario,
  AIdStatus: integer): string;
var
  obj: TAgendamentoEmail;
begin
  obj := TAgendamentoEmail.Create;
  try
    Result := obj.RetornaEmails(AIdAgenda, AIdUsuario, AIdStatus);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.AgendamentoSalvar(APrograma, AIdUsuario: Integer;
  AAgendamentoVO: TJSONValue): Integer;
var
  obj: TAgendamento;
  UnMarshal : TJSONUnMarshal;
  oAgendamentoVO: TAgendamentoVO;
begin
  if AAgendamentoVO is TJSONNull then
    Exit;

  UnMarshal := TJSONUnMarshal.Create;
  obj := TAgendamento.Create;
  try
    oAgendamentoVO := TAgendamentoVO(UnMarshal.Unmarshal(AAgendamentoVO));
    Result := obj.Salvar(APrograma, AIdUsuario, oAgendamentoVO, spAgendamento);
  finally
    FreeAndNil(obj);
    FreeAndNil(UnMarshal);
    FreeAndNil(oAgendamentoVO);
  end;
end;

function TServerModule2.ParametrosCaminhoAplicativoImportarLicencas: string;
var
  obj: TParametros;
begin
  obj := TParametros.Create;
  try
    Result := obj.CaminhoAplicativoImportarLicencas();
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.PlanoBackupExcluir(AId: Integer);
var
  obj: TPlanoBackup;
begin
  obj := TPlanoBackup.Create;
  try
    obj.Excluir(AId);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.PlanoBackupExcluirItem(AId: integer);
var
  obj: TPlanoBackup;
begin
  obj := TPlanoBackup.Create;
  try
    obj.ExcluirItem(AId);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.PlanoBackupGerar;
var
  obj: TPlanoBackup;
begin
  obj := TPlanoBackup.Create;
  try
    try

      obj.ExecutarPlano(QBackup);
    except
      // nada
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.PlanoBackupLocalizar;
var
  obj: TPlanoBackup;
begin
  obj := TPlanoBackup.Create;
  try
    obj.Localizar(QPlanoBackup);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.PlanoBackupLocalizarItem(AId: integer);
begin
  QPlanoBackupItens.Close;
  QPlanoBackupItens.Params[0].AsInteger := AId;
end;

procedure TServerModule2.PlanoBackupSalvar(APlanoBackup: TJSONValue;
  APlanoItens: TJSONValue);
var
  obj: TPlanoBackup;
  ListaHoras: TObjectList<TPlanoBackupItensVO>;
  UnMarshal : TJSONUnMarshal;
  oPlanoVO: TPlanoBackupVO;
begin
  obj := TPlanoBackup.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oPlanoVO := TPlanoBackupVO(UnMarshal.Unmarshal(APlanoBackup));
    ListaHoras := TListaHoras(UnMarshal.Unmarshal(APlanoItens));

    if ListaHoras.Count = 0 then
      raise Exception.Create('Informe os Horários!');

    obj.Salvar(oPlanoVO, ListaHoras, spPlanoBackup, spPlanoBackupItens);
  finally
    FreeAndNil(obj);
    FreeAndNil(ListaHoras);
    FreeAndNil(oPlanoVO);
    FreeAndNil(UnMarshal);
  end;
end;

function TServerModule2.ProximoCodigo(Programa: Integer): TJSONNumber;
var
  iResultado: Integer;
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      iResultado := obj.ProximoCodigo(Programa);
      Result := TJSONNumber.Create(iResultado);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.ProximoId(Programa: Integer): TJSONNumber;
var
  obj: TCadastroPadrao;
  iResultado: Integer;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      iResultado := obj.ProximoId(Programa);
      Result := TJSONNumber.Create(iResultado);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.RamalFiltrarId(AId: Integer);
var
  obj: TRamal;
begin
  obj := TRamal.Create;
  try
    QRamalCons.SQL.Text := obj.FiltrarId(AId);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.RamalListarItens(AIdRamal: Integer);
begin
  QRamalItens.Params[0].AsInteger := AIdRamal;
end;

function TServerModule2.RamalSalvar(AIdUsuario: Integer;
  ARamalVO: TJSONValue): Integer;
var
  obj: TRamal;
  oObjVO: TRamalVO;
begin
  obj := TRamal.Create;
  try
    oObjVO := TConverte.JSONToObject<TRamalVO>(ARamalVO);
    Result := obj.Salvar(oObjVO);
  finally
    FreeAndNil(obj);
    FreeAndNil(oObjVO);
  end;
end;

procedure TServerModule2.RecadoFiltrar(Filtro: TJSONValue; Campo, Texto: string;
  Contem: Boolean);
var
  obj: TRecado;
  objFiltro: TRecadoFiltro;
begin
  obj := TRecado.Create;
  try
    objFiltro := TConverte.JSONToObject<TRecadoFiltro>(Filtro);

    QRecadoCons.Close;
    QRecadoCons.SQL.Text := obj.Filtrar(objFiltro, Campo, Texto, Contem);
//    showmessage(QRecadoCons.SQL.Text);
  finally
    FreeAndNil(obj);
    FreeAndNil(objFiltro);
  end;
end;

procedure TServerModule2.RecadoFiltrarId(AId: Integer);
var
  obj: TRecado;
begin
  obj := TRecado.Create;
  try
    try
      QRecadoCons.Close;
      QRecadoCons.SQL.Text := obj.FiltrarId(AId);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.RecadoPermissaoUsuario(AIdUsuario: Integer;
  AAcao: string): Boolean;
var
  obj: TRecado;
begin
  obj := TRecado.Create;
  try
    Result := obj.PermissaoAcesso(AIdUsuario, AAcao);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.RecadoQuadro(AIdUsuario, AIdRevenda: Integer);
var
  objRecado: TRecado;
begin
  objRecado := TRecado.Create;
  QRecadoQuadro.Close;
  QRecadoQuadro.SQL.Text := objRecado.RetornaQuadro(AIdUsuario, AIdRevenda);
  FreeAndNil(objRecado);


//  QRecadoQuadro.Close;
//  QRecadoQuadro.Params[0].AsInteger := AIdUsuario;
//  QRecadoQuadro.Params[1].AsInteger := AIdRevenda;
end;

function TServerModule2.RecadoQuadroJSON(AIdUsuario,
  AIdRevenda: Integer): TJSONValue;
var
  objRecado: TRecado;
  Lista: TObjectList<TRecadoQuadroViewModel>;
begin
  objRecado := TRecado.Create;
  dm.AbrirConexao;
  try
    try
      QRecadoQuadro.Close;
      QRecadoQuadro.SQL.Text := objRecado.RetornaQuadro(AIdUsuario, AIdRevenda);
      QRecadoQuadro.Open();
    except
      On E: Exception do
      begin
        raise Exception.Create(e.Message);
      end;
    end;

    Lista := objRecado.ListarQuadro(QRecadoQuadro);

    QRecadoQuadro.Close;

    Result := TConverte.ObjectToJSON<TListaRecadoQuadroViewModel>(Lista);
  finally
    dm.FecharConexao;
    FreeAndNil(objRecado);
    FreeAndNil(Lista);
  end;
end;

function TServerModule2.RecadoSalvar(ARecado: TJSONValue): TJSONNumber;
var
  obj: TRecado;
  oObjVO: TRecadoVO;
  iResultado: Integer;
begin
  obj := TRecado.Create;
  try
    oObjVO := TConverte.JSONToObject<TRecadoVO>(ARecado);
    iResultado := obj.Salvar(oObjVO);
    Result := TJSONNumber.Create(iResultado);

  finally
    FreeAndNil(obj);
    FreeAndNil(oObjVO);
  end;
end;

procedure TServerModule2.Relatorio(Programa, IdUsuario: integer);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.PermissaoRelatorio(Programa, IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;


procedure TServerModule2.Salvar(Programa, IdUsuario: Integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      obj.Salvar(Programa, IdUsuario);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.SalvarProspect(AIdUsuario: Integer;
  AProspectVO: TJSONValue): Integer;
var
  obj: TProspect;
  UnMarshal : TJSONUnMarshal;
  oProspectVO: TProspectVO;
begin
  if AProspectVO is TJSONNull then
    Exit;

  UnMarshal := TJSONUnMarshal.Create;
  obj := TProspect.Create;
  try
    oProspectVO := TProspectVO(UnMarshal.Unmarshal(AProspectVO));
    Result := obj.Salvar(AIdUsuario, oProspectVO, spProspect);
  finally
    FreeAndNil(obj);
    FreeAndNil(UnMarshal);
    FreeAndNil(oProspectVO);
  end;
end;

function TServerModule2.StatusAberturaRecados: TJSONValue;
var
  Parametro: TParametros;
  Status: TStatus;
  Id: Integer;
  VO: TStatusVO;
begin
  Parametro := TParametros.Create;
  Status := TStatus.Create;
  try
    Id := Parametro.StatusAberturaRecados();
    VO := Status.LocalizarId(Id);
    Result := TConverte.ObjectToJSON<TStatusVO>(VO);
  finally
    FreeAndNil(Parametro);
    FreeAndNil(Status);
    FreeAndNil(VO);
  end;
end;

function TServerModule2.StatusEncerramentoRecados: TJSONValue;
var
  Parametro: TParametros;
  Status: TStatus;
  Id: Integer;
  VO: TStatusVO;
begin
  Parametro := TParametros.Create;
  Status := TStatus.Create;
  try
    Id := Parametro.StatusEncerramentoRecados();
    VO := Status.LocalizarId(Id);
    Result := TConverte.ObjectToJSON<TStatusVO>(VO);
  finally
    FreeAndNil(Parametro);
    FreeAndNil(Status);
    FreeAndNil(VO);
  end;
end;

function TServerModule2.TabPrecoEditar(Programa, IdUsuario: Integer): Boolean;
var
  obj: TTabPreco;
begin
  obj := TTabPreco.Create;
  try
    try
      obj.Editar(Programa, IdUsuario);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.TabPrecoExcluir(Programa, IdUsuario, Id: Integer);
var
  obj: TTabPreco;
begin
  obj := TTabPreco.Create;
  try
    try
      obj.Excluir(Programa, IdUsuario, Id);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.TabPrecoFiltrar(Campo, Texto, Ativo: string; Contem: Boolean;
  AFiltro: TJSONValue; Id: Integer = 0);
var
  obj: TTabPreco;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TTabPrecoFiltro;
begin
  UnMarshal := TJSONUnMarshal.Create;
  obj := TTabPreco.Create;
  try
    try
      oFiltro := TTabPrecoFiltro(UnMarshal.Unmarshal(AFiltro));
      QTabPrecoCons.Close;
      QTabPrecoCons.SQL.Text := obj.Filtrar(Campo, Texto, Ativo, oFiltro, Contem, Id);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
    FreeAndNil(obj);
  end;
end;

function TServerModule2.TabPrecoLocalizarId(Id: integer): TJSONValue;
var
  obj: TTabPreco;
  model: TTabelaPrecoVO;
begin
  obj := TTabPreco.Create;
  try
    model := obj.ObterPorId(Id);
    Result := TConverte.ObjectToJSON<TTabelaPrecoVO>(model);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.TabPrecoNovo(Programa, IdUsuario: Integer);
var
  obj: TTabPreco;
begin
  obj := TTabPreco.Create;
  try
    try
      obj.Novo(Programa, IdUsuario);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.TabPrecoRelatorio(Programa, IdUsuario: Integer);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.PermissaoRelatorio(Programa, IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerModule2.TabPrecoSalvar(Programa, IdUsuario: Integer;
  ATabPreco: TJSONValue): TJSONNumber;
var
  obj: TTabPreco;
//  UnMarshal : TJSONUnMarshal;
  oObjVO: TTabelaPrecoVO;
  iResultado: Integer;
begin
  obj := TTabPreco.Create;
//  UnMarshal := TJSONUnMarshal.Create;
  try
    try
      oObjVO := TConverte.JSONToObject<TTabelaPrecoVO>(ATabPreco); // TOrcamentoVO(UnMarshal.Unmarshal(AOrcamento));
      iResultado := obj.SalvarObj(Programa, IdUsuario, oObjVO);
      Result := TJSONNumber.Create(iResultado);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(oObjVO);
//    FreeAndNil(UnMarshal);
  end;

end;

function TServerModule2.UsuarioDiasTrabalhados(ADataInicial,
  ADataFinal: string): TJSONValue;
var
  obj: TUsuario;
  Lista: TObjectList<TUsuarioVO>;
begin
  obj := TUsuario.create;
//  Lista := TObjectList<TUsuarioVO>.create;
  try
    Lista := obj.DiasTrabalhados(StrToDate(ADataInicial), StrToDate(ADataFinal));
    Result := TConverte.ObjectToJSON(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerModule2.UsuarioRelRendimento(ADataInicial, ADataFinal: string; AFiltroUsuario: TJSONValue);
var
  Usuario: TUsuario;
  objFiltro: TFiltroUsuario;
begin
  if ADataInicial.Trim = DataEmBranco then
    ADataInicial := '01/01/1900';

  if ADataFinal.Trim = DataEmBranco then
    ADataFinal := '31/12/2099';

  if StrToDate(ADataInicial) > StrToDate(ADataFinal) then
    raise Exception.Create('Data Inicial maior que Data Final!');

  QUsuarioRenda.Close;
  Usuario := TUsuario.Create;
  try
    objFiltro := TConverte.JSONToObject<TFiltroUsuario>(AFiltroUsuario);
    QUsuarioRenda.SQL.Text := Usuario.RelatorioRendimento(ADataInicial, ADataFinal, objFiltro);
  finally
    FreeAndNil(Usuario);
    FreeAndNil(objFiltro);
  end;

//  QUsuarioRenda.ParamByName('DATAINICIAL').AsDateTime := StrToDate(ADataInicial);
//  QUsuarioRenda.ParamByName('DATAFINAL').AsDateTime := StrToDate(ADataFinal);

end;

function TServerModule2.OrcamentoUsuarioMesmoCadastro(AId, AIdUsuario,
  ATipoOperacao: Integer): Boolean;
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    Result := obj.UsuarioIgualCadastro(AId, AIdUsuario, ATipoOperacao)
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.AgendamentoTipoPrograma(AIdAgenda: Integer): Integer;
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    Result := obj.TipoPrograma(AIdAgenda);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.ContatoExcluir(AId: Integer);
var
  obj: TContato;
begin
  obj := TContato.create;
  try
    obj.Excluir(AId);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.ContatoLocalizarPorCliente(
  AIdCliente: Integer): TJSONValue;
var
  obj: TContato;
  Lista: TObjectList<TContatoVO>;
begin
  obj := TContato.create;
  try
    Lista := obj.LocalizarPorCliente(AIdCliente);
    Result := TConverte.ObjectToJSON(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

function TServerModule2.ContatoLocalizarPorId(AId: Integer): TJSONValue;
var
  obj: TContato;
  Lista: TContatoVO;
begin
  obj := TContato.create;
  try
    Lista := obj.LocalizarPorId(AId);
    Result := TConverte.ObjectToJSON(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

function TServerModule2.ContatoLocalizarPorOrcamento(
  AIdOrcamento: Integer): TJSONValue;
var
  obj: TContato;
  Lista: TObjectList<TContatoVO>;
begin
  obj := TContato.create;
  try
    Lista := obj.LocalizarPorOrcamento(AIdOrcamento);
    Result := TConverte.ObjectToJSON(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerModule2.OrcamentoAtualizarSituacao(ASituacao, AId: Integer);
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    obj.AtualizarSituacao(ASituacao, AId);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.OrcamentoBuscarEmailRemetenteSeteDias: Integer;
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    Result := obj.BuscarRemetenteEmailSeteDias();
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.OrcamentoDuplicar(AIdOrcamento: Integer): TJSONNumber;
var
  obj: TOrcamento;
  iResultado: Integer;
begin
  obj := TOrcamento.Create;
  try
    iResultado := obj.Replicar(AIdOrcamento,
                             spOrcamento,
                             spOrcamentoItem,
                             spOrcamentoVect,
                             spOrcamentoItemModulo,
                             spOrcamentoOcorrencia);

    Result := TJSONNumber.Create(iResultado);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.OrcamentoEmailEnviado(AIdOrcamento: Integer);
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    obj.EmailEnviado(AIdOrcamento);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.OrcamentoEmailSupervisor(AIdUsuario: Integer): string;
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    Result := obj.RetornarEmailSupervisor(AIdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.Editar(programa, Idusuario, Id: Integer): Boolean;
var
  obj: TCadastroPadrao;
  bPermissao: Boolean;
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  obj := TCadastroPadrao.Create;
  try
    try
      if programa = COrcamentoPrograma then
      begin
        LocalizarId(programa, Id);
        bPermissao := obj.Editar(Programa, IdUsuario);

        if bPermissao then
          bPermissao := Usuario.UsuarioADM(Idusuario);

        if bPermissao = False then
          bPermissao := OrcamentoUsuarioMesmoCadastro(Id, Idusuario, 2);

        Result := bPermissao;
      end
      else begin
        LocalizarId(programa, Id);
        Result := obj.Editar(Programa, IdUsuario);
      end;

    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Usuario);
  end;
end;

procedure TServerModule2.EmailLocalizarCodigo(AIdProspect: Integer);
var
  obj: TProspect;
begin
  obj := TProspect.Create;
  try
    obj.LocalizarCodigoEmail(QProspectEmail, AIdProspect);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.EmailProspectEditarEmail(Programa,
  IdUsuario: Integer): Boolean;
var
  obj: TProspect;
begin
  obj := TProspect.Create;
  try
    Result := obj.Editar(Programa, IdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.EmailProspectExcluirEmail(APrograma, AIdUsuario,
  AId: Integer);
var
  obj: TProspect;
begin
  obj := TProspect.Create;
  try
    obj.Excluir(APrograma, AIdUsuario, AId);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.EmailProspectNovo(Programa, IdUsuario: Integer);
var
  obj: TProspect;
begin
  obj := TProspect.Create;
  try
    obj.Novo(Programa, IdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.EscalaBuscarUltimaData: string;
var
  obj: TEscala;
begin
  obj := TEscala.Create;
  try
    Result := obj.BuscarUltimaData();
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.EscalaFiltrar(Filtro: TJSONValue; ACampo,
  ATexto: string; AIdUsuario: Integer; AContem: Boolean): string;
var
  obj: TEscala;
//  UnMarshal : TJSONUnMarshal;
  oFiltro: TEscalaFiltro;
begin
  try
    oFiltro := TConverte.JSONToObject<TEscalaFiltro>(Filtro);
    QEscalaCons.SQL.Text := obj.Filtrar(oFiltro, ACampo, ATexto, AIdUsuario, AContem);
  finally
    FreeAndNil(oFiltro);
  end;


//  FreeAndNil(obj);

//  if Filtro is TJSONNull then
//    Exit;
//
//  UnMarshal := TJSONUnMarshal.Create;
//  obj := TAgendamento.Create;
//  try
//    oFiltro := TFiltroAgendamento(UnMarshal.Unmarshal(Filtro));
//    QAgendamentoCons.Close;
//    QAgendamentoCons.SQL.Text := obj.Filtrar(oFiltro, ACampo, ATexto, AIdUsuario, AContem);
//  finally
//    FreeAndNil(UnMarshal);
//    FreeAndNil(oFiltro);
//    FreeAndNil(obj);
//  end;
end;

procedure TServerModule2.EscalaRelatorios(AFiltro: TJSONValue;
  AModelo: Integer);
var
  obj: TEscala;
  Filtro: TEscalaFiltro;
begin
  obj := TEscala.create;
  try
    Filtro := TConverte.JSONToObject<TEscalaFiltro>(AFiltro);
    QEscalaRelatorio1.SQL.Text := obj.Relatorio(AModelo, Filtro);
  finally
    FreeAndNil(obj);
    FreeAndNil(Filtro);
  end;
end;

function TServerModule2.EscalaSalvar(AEscalaVO: TJSONValue; AIdUsuario: integer): Integer;
var
  obj: TEscala;
  oObjVO: TEscalaVO;
begin
  oObjVO := TConverte.JSONToObject<TEscalaVO>(AEscalaVO);
  try
    Result := obj.Salvar(oObjVO, AIdUsuario);
  finally
    FreeAndNil(oObjVO);
  end;
end;

procedure TServerModule2.Excluir(Programa, IdUsuario, Id: Integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      obj.Excluir(Programa, IdUsuario, Id);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.Filtrar(Programa: Integer; Campo, Texto, Ativo: string;
  Contem: Boolean);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    case Programa of
        113: QProspectCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        114: QOrcamentoCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        115: QFormaPagtoCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        116: QObservacaoCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        117: QModeloRelatorioCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        118: QRamalCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        119: QRecadoCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        120: QEscalaCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        121: QCidadeCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        124: QCategoriaCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        125: QTabPrecoCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.FiltrarCodigo(Programa, Codigo: Integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    case Programa of
        113: QProspectCons.SQL.Text    := obj.FiltrarCodigo(Programa, Codigo);
        114: QOrcamentoCons.SQL.Text   := obj.FiltrarCodigo(Programa, Codigo);
        115: QFormaPagtoCons.SQL.Text   := obj.FiltrarCodigo(Programa, Codigo);
        116: QObservacaoCons.SQL.Text   := obj.FiltrarCodigo(Programa, Codigo);
        117: QModeloRelatorioCons.SQL.Text   := obj.FiltrarCodigo(Programa, Codigo);
        118: QRamalCons.SQL.Text   := obj.FiltrarCodigo(Programa, Codigo);
        120: QEscalaCons.SQL.Text := obj.FiltrarCodigo(Programa, Codigo);
        121: QCidadeCons.SQL.Text := obj.FiltrarCodigo(Programa, Codigo);
        124: QCategoriaCons.SQL.Text := obj.FiltrarCodigo(Programa, Codigo);
        125: QTabPrecoCons.SQL.Text := obj.FiltrarCodigo(Programa, Codigo);
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.FiltrarObservacaoPrograma(Campo, Texto, Ativo: string;
  StatusPrograma: Integer; Contem: Boolean);
var
  obj: TObservacao;
begin
  obj := TObservacao.Create;
  try
    QObservacaoCons.Close;
    QObservacaoCons.SQL.Text := obj.FiltrarPrograma(Campo, Texto, ativo,  StatusPrograma, Contem);
//    QObservacaoCons.Open();
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.FiltrarOrcamento(Filtro: TJSONValue; Campo,
  Texto: string; IdUsuario: Integer; Contem: Boolean);
var
  obj: TOrcamento;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroOrcamento;
begin
  if Filtro is TJSONNull then
    Exit;

  if not Assigned(oFiltro) then
    oFiltro := TFiltroOrcamento.Create;

  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroOrcamento(UnMarshal.Unmarshal(Filtro));

    QOrcamentoCons.Close;
    sComando := obj.Filtrar(oFiltro, Campo, Texto, IdUsuario, Contem);
    QOrcamentoCons.SQL.Text := sComando;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerModule2.FiltrarProspect(Filtro: TJSONValue; Programa,
  IdUsuario: Integer; Campo, Texto, Ativo: string; Contem: Boolean);
var
  obj: TProspect;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroProspect;
begin
  if Filtro is TJSONNull then
    Exit;

  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroProspect(UnMarshal.Unmarshal(Filtro));
    QProspectCons.Close;
    sComando := obj.FiltrarUsuario(oFiltro, Campo, Texto, Ativo, IdUsuario, Contem);
    QProspectCons.SQL.Text := sComando;

  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerModule2.FormaPagtoFiltroItem(AIdFormaPagto: Integer);
var
  obj: TFormaPagto;
begin
  obj := TFormaPagto.Create;
  try
    obj.FiltarItens(AIdFormaPagto, QFormaPagtoItemCons);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.FormaPagtoSalvar(AFormaPagtoVO: TJSONValue): Integer;
var
  obj: TFormaPagto;
  UnMarshal : TJSONUnMarshal;
  oObjVO: TFormaPagtoVO;
begin
  if AFormaPagtoVO is TJSONNull then
    Exit;

  UnMarshal := TJSONUnMarshal.Create;
  obj := TFormaPagto.Create;
  try
    oObjVO := TFormaPagtoVO(UnMarshal.Unmarshal(AFormaPagtoVO));
    Result := obj.Salvar(oObjVO);
  finally
    FreeAndNil(obj);
    FreeAndNil(UnMarshal);
    FreeAndNil(oObjVO);
  end;
end;

procedure TServerModule2.LicencaPermissaoAcessar(APrograma,
  AIdUsuario: Integer);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.PermissaoAcessar(APrograma, AIdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TServerModule2.LicencasImportar;
var
  obj: TLicenca;
begin
  obj := TLicenca.Create;
  try
    dm.StartTransacao;
    try
      obj.Importar();
      obj.ImportarItens();
      dm.Commit;
    except
      on E: Exception do
      begin
        dm.Roolback;
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.LicencasLimpar: string;
var
  obj: TLicenca;
begin
  obj := TLicenca.Create;
  try
    Result := obj.LimparLicencas();
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.LicencasListarTodos(AFiltro: TJSONValue): TJSONValue;
var
  obj: TLicenca;
  Lista: TObjectList<TLicencaVO>;
  objFiltro: TFiltroLicenca;
begin
  obj := TLicenca.create;
  try
    objFiltro := TConverte.JSONToObject<TFiltroLicenca>(AFiltro);
    Lista := obj.ListarTodos(objFiltro);
    Result := TConverte.ObjectToJSON(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
    FreeAndNil(objFiltro);
  end;
end;

function TServerModule2.LicencasListarTodosItens(AFiltro: TJSONValue): TJSONValue;
var
  obj: TLicenca;
  Lista: TObjectList<TLicencaItensVO>;
  objFiltro: TFiltroLicenca;
begin
  obj := TLicenca.create;
  try
    objFiltro := TConverte.JSONToObject<TFiltroLicenca>(AFiltro);
    Lista := obj.ListarTodosItens(objFiltro);
    Result := TConverte.ObjectToJSON(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
    FreeAndNil(objFiltro);
  end;
end;

function TServerModule2.LicencasSalvar(ALicenca, ALicencaItens: TJSONValue): string;
var
  obj: TLicenca;
  ListaLicenca: TObjectList<TLicencaVO>;
  ListaLicencaItens: TObjectList<TLicencaItensVO>;
  sResultLicenca: string;
  sResultLicencaItens: string;
begin
  sResultLicenca := '';
  sResultLicencaItens := '';

  obj := TLicenca.Create;
  try
    ListaLicencaItens := TConverte.JSONToObject<TObjectList<TLicencaItensVO>>(ALicencaItens);
    ListaLicenca := TConverte.JSONToObject<TObjectList<TLicencaVO>>(ALicenca);

    dm.StartTransacao();
    try
      sResultLicenca := obj.LicencaSalvar(ListaLicenca);
      sResultLicencaItens := obj.LicencaItensSalvar(ListaLicencaItens);
      dm.Commit();
      Result := sResultLicenca + sResultLicencaItens;
    except
      on E: Exception do
      begin
        dm.Roolback();
        Result := E.Message;
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(ListaLicenca);
    FreeAndNil(ListaLicencaItens);
  end;
end;

procedure TServerModule2.LocalizarCodigo(Programa, Codigo: integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    case Programa of
      113: obj.LocalizarCodigo(Programa, QProspectCad, Codigo);
      114: obj.LocalizarCodigo(Programa, QOrcamentoCad, Codigo);
      115: obj.LocalizarCodigo(Programa, QFormaPagtoCad, Codigo);
      116: obj.LocalizarCodigo(Programa, QObservacaoCad, Codigo);
      117: obj.LocalizarCodigo(Programa, QModeloRelatorioCad, Codigo);
      118: obj.LocalizarCodigo(Programa, QRamalCad, Codigo);
      121: obj.LocalizarCodigo(Programa, QCidadeCad, Codigo);
      124: obj.LocalizarCodigo(Programa, QCategoriaCad, Codigo);
      125: obj.LocalizarCodigo(Programa, QTabPrecoCad, Codigo);
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.LocalizarCodigoProspect(Codigo, IdUsuario: integer);
var
  obj: TProspect;
begin
  obj := TProspect.Create;
  try
    obj.LocalizarCodigoProspect(QProspectCad, Codigo, IdUsuario)
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.LocalizarId(Programa, Id: integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    case Programa of
        113: obj.LocalizarId(Programa, QProspectCad, Id);
        114: obj.LocalizarId(Programa, QOrcamentoCad, Id);
        115: obj.LocalizarId(Programa, QFormaPagtoCad, Id);
        116: obj.LocalizarId(Programa, QObservacaoCad, Id);
        117: obj.LocalizarId(Programa, QModeloRelatorioCad, Id);
        118: obj.LocalizarId(Programa, QRamalCad, Id);
        119: obj.LocalizarId(Programa, QRecadoCad, Id);
        120: obj.LocalizarId(Programa, QEscalaCad, Id);
        121: obj.LocalizarId(Programa, QCidadeCad, Id);
        124: obj.LocalizarId(Programa, QCategoriaCad, Id);
        125: obj.LocalizarId(Programa, QTabPrecoCad, Id);
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.ModeloRelatorioSalvar(
  AModeloRelatorioVO: TJSONValue): Integer;
var
  obj: TModeloRelatorio;
  UnMarshal : TJSONUnMarshal;
  oObjVO: TModeloRelatorioVO;
begin
  if AModeloRelatorioVO is TJSONNull then
    Exit;

  UnMarshal := TJSONUnMarshal.Create;
  obj := TModeloRelatorio.Create;
  try
    oObjVO := TModeloRelatorioVO(UnMarshal.Unmarshal(AModeloRelatorioVO));
    Result := obj.Salvar(oObjVO);
  finally
    FreeAndNil(obj);
    FreeAndNil(UnMarshal);
    FreeAndNil(oObjVO);
  end;
end;

procedure TServerModule2.ModeloRelatoriosFiltrar(Campo, Texto, Ativo: string;
  IdUsuario: Integer; Contem: Boolean);
var
  obj: TModeloRelatorio;
begin
  obj := TModeloRelatorio.Create;
  try
    QModeloRelatorioCons.SQL.Text := obj.Filtrar(Campo, Texto, Ativo, IdUsuario, Contem);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.Novo(Programa, IdUsuario: Integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      obj.Novo(Programa, IdUsuario);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.ObservacaoEmailPadrao(APrograma: Integer);
var
  obj: TObservacao;
begin
  obj := TObservacao.Create;
  try
    obj.LocalizarEmailPadrao(QObservacaoCad, APrograma);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.ObservacaoPadrao(APrograma: Integer);
var
  obj: TObservacao;
begin
  obj := TObservacao.Create;
  try
    obj.LocalizarPadrao(QObservacaoCad, APrograma);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.ObservacaoSalvar(AObservacaoVO: TJSONValue): Integer;
var
  obj: TObservacao;
  UnMarshal : TJSONUnMarshal;
  oObjVO: TObservacaoVO;
begin
  if AObservacaoVO is TJSONNull then
    Exit;

  UnMarshal := TJSONUnMarshal.Create;
  obj := TObservacao.Create;
  try
    oObjVO := TObservacaoVO(UnMarshal.Unmarshal(AObservacaoVO));
    Result := obj.Salvar(oObjVO, spObservacao);
  finally
    FreeAndNil(obj);
    FreeAndNil(UnMarshal);
    FreeAndNil(oObjVO);
  end;
end;

procedure TServerModule2.OrcamentoFiltrarId(AId: Integer);
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    try
      QOrcamentoCons.Close;
      QOrcamentoCons.SQL.Text := obj.FiltarId(AId);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.OrcamentoGerarParcela(AIdFormaPagto: Integer;
  ATotalOrcamento: Currency; out AValorPrimeira, AValorOutras: Currency);
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    obj.GerarParcelas(AIdFormaPagto, ATotalOrcamento, AValorPrimeira, AValorOutras);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.OrcamentoGerarParcelaDifUltima(AQtdeParcelas: Integer;
  ATotalOrcamento: Currency; out AValorUltima, AValorOutras: Currency);
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    obj.GerarParcelasDifUltima(AQtdeParcelas, ATotalOrcamento, AValorUltima, AValorOutras);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.OrcamentoImprimir(AIdOrcamento: Integer);
begin
  QOrcamentoImprimir.Close;
  QOrcamentoImprimir.Params[0].AsInteger := AIdOrcamento;
end;

procedure TServerModule2.OrcamentoItemLocalizar(AIdOrdem: integer);
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    obj.LocalizarItemOrcamento(AIdOrdem, QOrcamentoItemCons);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.OrcamentoItemModuloLocalizar(AIdOrdemItem: integer);
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    obj.LocalizarItemOrcamento(AIdOrdemItem, QOrcamentoItemModuloCons);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.OrcamentoListarEmail(AIdOrdem: Integer): TJSONValue;
var
  obj: TOrcamento;
  Lista: TObjectList<TOrcamentoEmailVO>;
begin
  obj := TOrcamento.create;
  try
    Lista := obj.ListarEmail(AIdOrdem);
    Result := TConverte.ObjectToJSON(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

function TServerModule2.OrcamentoListarEmailSeteDiasParaSupervisor(): TJSONValue;
var
  obj: TOrcamento;
  Lista: TObjectList<TOrcamentoVO>;
begin
  obj := TOrcamento.create;
  try
    Lista := obj.ListarEmailSeteDias();
    Result := TConverte.ObjectToJSON(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerModule2.OrcamentoNaoAprovadoExcluir(AId: integer);
var
  obj: TOrcamentoNAprovado;
begin
  obj := TOrcamentoNAprovado.create;
  try
    obj.Excluir(AId);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.OrcamentoNaoAprovadoLocalizarId(
  AId: integer): TJSONValue;
var
  obj: TOrcamentoNAprovado;
begin
  obj := TOrcamentoNAprovado.create;
  try
    Result := TConverte.ObjectToJSON<TOrcamentoNaoAprovadoVO>(obj.LocalizarId(AId));
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.OrcamentoNaoAprovadoLocalizarOrcamento(
  AIdOrcamento: integer): TJSONValue;
var
  obj: TOrcamentoNAprovado;
begin
  obj := TOrcamentoNAprovado.create;
  try
    Result := TConverte.ObjectToJSON<TOrcamentoNaoAprovadoVO>(obj.LocalizarOrcamento(AIdOrcamento));
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.OrcamentoNaoAprovadoSalvar(
  AOrcamentoNAprovado: TJSONValue);
var
  obj: TOrcamentoNAprovado;
  objValue: TOrcamentoNaoAprovadoVO;
begin
  obj := TOrcamentoNAprovado.create;
  try
    objValue := TConverte.JSONToObject<TOrcamentoNaoAprovadoVO>(AOrcamentoNAprovado);
    obj.Salvar(objValue);
  finally
    FreeAndNil(obj);
    FreeAndNil(objValue);
  end;
end;

procedure TServerModule2.OrcamentoOcorrenciaLocalizar(AIdOrdem: integer);
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    obj.LocalizarOcorrenciaOrcamento(AIdOrdem, QOrcamentoOcorrenciaCons);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerModule2.OrcamentoProximoNumero: TJSONNumber;
var
  iResultado: Integer;
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    try
      iResultado := obj.CodigoAtual();
      Result := TJSONNumber.Create(iResultado);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.OrcamentoRelatorios(AFiltro: TJSONValue;
  ATipo, AIdUsuario: Integer);
var
  obj: TOrcamento;
  FiltroVO: TFiltroOrcamento;
begin
  obj := TOrcamento.create;
  try
    FiltroVO := TConverte.JSONToObject<TFiltroOrcamento>(AFiltro);
    case ATipo of
      1: obj.RelatorioPorUsuarioTipo(QOrcamentoRelatorio1, FiltroVO, AIdUsuario);
      2: obj.RelatorioGraficoPorTipo(QOrcamentoGraficoTipo, FiltroVO, AIdUsuario);
      3..4:
      begin
        obj.RelatorioGraficoPorSituacao(QOrcamentoGraficoUsuario, FiltroVO, AIdUsuario);
        obj.RelatorioGraficoPorUsuario(QOrcamentoGraficoUsuarioQtde, FiltroVO, AIdUsuario);
      end;
      5..6:
      begin
        obj.RelatorioGraficoPorMotivoNaoAprovado(QOrcamentoGraficoNaoAprovado, FiltroVO, AIdUsuario);
        obj.RelatorioPorMotivoNaoAprovado(QOrcamentoRelatorio3, FiltroVO, AIdUsuario);
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(FiltroVO);
  end;
end;

function TServerModule2.OrcamentoSalvar(AOrcamento: TJSONValue): TJSONNumber;
var
  obj: TOrcamento;
  UnMarshal : TJSONUnMarshal;
  oObjVO: TOrcamentoVO;
  iResultado: Integer;
begin
  obj := TOrcamento.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oObjVO := TOrcamentoVO(UnMarshal.Unmarshal(AOrcamento));
    iResultado := obj.Salvar(oObjVO,
                             spOrcamento,
                             spOrcamentoItem,
                             spOrcamentoOcorrencia,
                             spOrcamentoVect,
                             spOrcamentoItemModulo);
    Result := TJSONNumber.Create(iResultado);

  finally
    FreeAndNil(obj);
    FreeAndNil(oObjVO);
    FreeAndNil(UnMarshal);
  end;
end;

procedure TServerModule2.OrcamentoVenctoLocalizar(AIdOrdem: integer);
var
  obj: TOrcamento;
begin
  obj := TOrcamento.Create;
  try
    obj.LocalizarVenctoOrcamento(AIdOrdem, QOrcamentoVectCons);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerModule2.AgendamentoQuadro(ADataInicial, ADataFinal: string;
  AIdUsuario, AIdRevenda: Integer);
var
  Agendamento: TAgendamento;
begin
  Agendamento := TAgendamento.Create;
  try
    QAgendaQuadro.Close;
    QAgendaQuadro.SQL.Text := Agendamento.Quadro(ADataInicial, ADataFinal, AIdUsuario, AIdRevenda);
  finally
    FreeAndNil(Agendamento);
  end;
end;

function TServerModule2.AgendamentoQuadroJSON(ADataInicial, ADataFinal: string;
  AIdUsuario, AIdRevenda: Integer): TJSONValue;
var
  obj: TAgendamento;
  Lista: TObjectList<TAgendamentoVO>;
begin
  obj := TAgendamento.Create;
  dm.AbrirConexao;
  try
    try
      QAgendaQuadro.Close;
      QAgendaQuadro.SQL.Text := obj.Quadro(ADataInicial, ADataFinal, AIdUsuario, AIdRevenda);
      QAgendaQuadro.Open();
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;

    Lista := obj.ListarQuadro(QAgendaQuadro);
    QAgendaQuadro.Close;

    Result := TConverte.ObjectToJSON<TListaAgendamentoVO>(Lista);
  finally
    dm.FecharConexao;
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

initialization
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

end.

