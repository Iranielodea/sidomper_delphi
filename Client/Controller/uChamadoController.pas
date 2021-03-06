unit uChamadoController;

interface

uses
  System.SysUtils, uDMChamado, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  Data.DBXJSON , Data.DBXJSONReflect, uFiltroChamado, uChamadoStatusVO, uDMRelChamado,
  Vcl.Dialogs, uParametrosController, uChamadoColaboradorVO, uChamadoColaboradorController,
  System.Generics.Collections, uChamadoVO, uTipoController, uTipoVO, uConverter,
  uChamadoQuadroViewModel, uPermissaoChamadoVO;

type
  TChamadoController = class
  private
    FModel: TDMChamado;
    FOperacao: TOperacao;
    FListaColaboradores: TObjectList<TChamadoColaboradorVO>;
    function RetornaIdOcorrencia(): Integer;
    procedure Post;
    procedure SalvarOcorrencia(AIdChamado: Integer);
    procedure SalvarColaborador(AIdOldOcorrencia, AIdProx: Integer);
    procedure Relatorio01(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer);
    procedure Relatorio02(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure Relatorio03(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure Relatorio04(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure Relatorio05(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure Relatorio06(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure Relatorio07(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure Relatorio08(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure Relatorio09(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);


    procedure RelatorioAtividade01(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer);
    procedure RelatorioAtividade02(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure RelatorioAtividade03(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure RelatorioAtividade04(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure RelatorioAtividade06(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer;
        AOrdem: string);
    procedure GravarOcorrencia(ObjVO: TChamadoVO);
    procedure GravarOcorrenciaColaborador(ObjVO: TChamadoVO);
    procedure PreencheQuadros(ADataSet: TDataSet);
    procedure PreencheQuadrosJSON(ADataSet: TDataSet; AItem: TChamadoQuadroViewModel);
    procedure PreencheQuadrosAtividades(ADataSet: TDataSet);
    procedure ObservacaoPadrao(ATipo: TEnumChamadoAtividade);
    procedure TipoUmRegistro(ATipo: TEnumChamadoAtividade);
    procedure AbrirChamadoOcorrencia;
  public
    function CodigoAtual: Integer;
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure Filtrar(APrograma: Integer; ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarChamado(AFiltro: TFiltroChamado; ACampo, ATexto: string;
        AIdUsuario: Integer; AContem: Boolean = False);

    procedure FiltrarAtividade(AFiltro: TFiltroChamado; ACampo, ATexto: string;
        AIdUsuario: Integer; AContem: Boolean = False);

    procedure FiltrarIdChamado(AIdChamado: integer);
    procedure LocalizarId(AId: Integer);
    procedure LocalizarChamadoStatus(AIdChamado: Integer);
    procedure Novo(AIdUsuario: Integer; ATipo: TEnumChamadoAtividade);
    procedure Editar(AId: Integer; AFormulario: TForm; ATipo: TEnumChamadoAtividade);
    procedure NovoOcorrencia;
    procedure LocalizarChamadoOcorrencia(AIdChamado: Integer);
    function Salvar(AIdUsuario: Integer; ATipo: TEnumChamadoAtividade = caChamado): Integer;
    procedure Excluir(AIdUsuario, AId: Integer; ATipo: TEnumChamadoAtividade);
    procedure ExcluirOcorrencia();
    procedure Cancelar();
    procedure CancelarOcorrencia();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function BuscarIdOcorrencia: Integer;
    procedure Pesquisar(AId: Integer);
    procedure ModoEdicaoInsercao;
    procedure ModoEdicaoInsercaoOcorrencia;
    function OcorrenciaEstadoEdicaoInsercao: Boolean;
    procedure PostOcorrencia;
    function RetornarEmails(AIdChamado, AIdUsuario, AIdStatus: Integer): string;
    function RetornarEmailsCliente(AIdChamado: Integer): string;
    function PermissaoEditar(AId: Integer; ATipo: TEnumChamadoAtividade = caChamado): Boolean;
    procedure UpdateHoraUsuarioAtual(AIdChamado: Integer; ATipo: TEnumChamadoAtividade);

    function PermissoesChamado(AIdUsuario: Integer): TPermissaoChamadoVO;
    function PermissaoChamadoAbertura(AIdUsuario: Integer): Boolean;
    function PermissaoChamadoOcorrencia(AIdUsuario: Integer): Boolean;
    function PermissaoChamadoStatus(AIdUsuario: Integer): Boolean;
    function PermissaoChamadoQuadro(AIdUsuario: Integer): Boolean;

    function PermissoesAtividade(AIdUsuario: Integer): TPermissaoAtividadeVO;
    function PermissaoAtividadeAbertura(AIdUsuario: Integer): Boolean;
    function PermissaoAtividadeOcorrencia(AIdUsuario: Integer): Boolean;
    function PermissaoAtividadeStatus(AIdUsuario: Integer): Boolean;
    function PermissaoAtividadeQuadro(AIdUsuario: Integer): Boolean;

    procedure AbrirQuadro(AIdUsuario, AIdRevenda: integer);
    function AbrirQuadroJSON(AIdUsuario, AIdRevenda: integer): TObjectList<TChamadoQuadroViewModel>;
    procedure AbrirQuadro1(AIdUsuario: integer);
    procedure AbrirQuadro2(AIdUsuario: integer);
    procedure AbrirQuadro3(AIdUsuario: integer);
    procedure AbrirQuadro4(AIdUsuario: integer);
    procedure AbrirQuadro5(AIdUsuario: integer);
    procedure AbrirQuadro6(AIdUsuario: integer);

    procedure PreencherTodosQuadros(AIdUsuario, AIdRevenda: integer);
    procedure PreencherTodosQuadrosJSON(AIdUsuario, AIdRevenda: integer);

    procedure PreencherTodosQuadrosAtividades(AIdUsuario, AIdRevenda: integer);
    function PreencherTodosQuadrosAtividadesJSON(AIdUsuario, AIdRevenda: integer): TObjectList<TChamadoQuadroViewModel>;

    procedure LimparQuadros(ADataSet: TDataSet);

    procedure AbrirAtividade(AIdUsuario, AIdRevenda: integer);
    function AbrirAtividadeJSON(AIdUsuario, AIdRevenda: integer): TObjectList<TChamadoQuadroViewModel>;

    procedure AbrirAtividadeQuadro1(AIdUsuario: integer);
    procedure AbrirAtividadeQuadro2(AIdUsuario: integer);
    procedure AbrirAtividadeQuadro3(AIdUsuario: integer);
    procedure AbrirAtividadeQuadro4(AIdUsuario: integer);
    procedure AbrirAtividadeQuadro5(AIdUsuario: integer);
    procedure AbrirAtividadeQuadro6(AIdUsuario: integer);

    function StatusAbertura: string;
    function StatusChamadoAtendimento: string;
    function StatusAberturaAtividade: string;
    function StatusAtendimentoAtividade: string;
    procedure ListarProblemaSolucao(AFiltro: TFiltroChamado; ATexto: string; AIdUsuario: Integer);
    procedure AtividadeListarProblemaSolucao(AFiltro: TFiltroChamado; ATexto: string; AIdUsuario: Integer);
    function RetornarCodigoStatusChamado(AIdChamado: integer): string;

    procedure Relatorio(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer; AOrdem:
        string);
    procedure RelatorioAtividade(AFiltro: TFiltroChamado; AModelo, AIdUsuario: Integer; AOrdem:
        string);
    procedure LocalizarChamadoColaborador(AIdChamado: Integer);
    procedure ChamadoAnexos(AIdChamado: integer);
    function BuscarTotalHorasDoChamado(AIdChamado: Integer): string;


    property Model: TDMChamado read FModel write FModel;
    property ListaColaboradores: TObjectList<TChamadoColaboradorVO>
      read FListaColaboradores write FListaColaboradores;


    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TSolicitacaoController }

uses uFuncoesSIDomper, uUsuarioController, uClienteController, uClienteModuloController,
  uStatusController, uDMRelAtividade, uChamadoGrafico1, uChamadoOcorrenciaVO,
  uObsevacaoController;

procedure TChamadoController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSConsulta.Close;
      Negocio.FiltrarCodigo(CChamadoPrograma, ACodigo);
      FModel.CDSConsulta.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.FiltrarCodigo');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.CodigoAtual: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.RetornaIdAtual('Chamado');
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.CodigoAtual');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirAtividade(AIdUsuario, AIdRevenda: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSAtividade.Close;
      Negocio.AtividadeQuadro(AIdUsuario, AIdRevenda);
      FModel.CDSAtividade.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirAtividade');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.AbrirAtividadeJSON(AIdUsuario,
  AIdRevenda: integer): TObjectList<TChamadoQuadroViewModel>;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := TConverte.JSONToObject<TListaChamadoQuadroViewModel>(Negocio.AtividadeQuadroJSON(AIdUsuario, AIdRevenda));
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirAtividadeJSON');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirAtividadeQuadro1(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSAtividadeQuadro1.Close;
      Negocio.FiltrarAtividadeQuadro1(AIdUsuario);
      FModel.CDSAtividadeQuadro1.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirAtividadeQuadro1');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirAtividadeQuadro2(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSAtividadeQuadro2.Close;
      Negocio.FiltrarAtividadeQuadro2(AIdUsuario);
      FModel.CDSAtividadeQuadro2.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirAtividadeQuadro2');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirAtividadeQuadro3(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSAtividadeQuadro3.Close;
      Negocio.FiltrarAtividadeQuadro3(AIdUsuario);
      FModel.CDSAtividadeQuadro3.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirAtividadeQuadro3');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirAtividadeQuadro4(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSAtividadeQuadro4.Close;
      Negocio.FiltrarAtividadeQuadro4(AIdUsuario);
      FModel.CDSAtividadeQuadro4.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirAtividadeQuadro4');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirAtividadeQuadro5(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSAtividadeQuadro5.Close;
      Negocio.FiltrarAtividadeQuadro5(AIdUsuario);
      FModel.CDSAtividadeQuadro5.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirAtividadeQuadro5');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirAtividadeQuadro6(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSAtividadeQuadro6.Close;
      Negocio.FiltrarAtividadeQuadro6(AIdUsuario);
      FModel.CDSAtividadeQuadro6.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirAtividadeQuadro6');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirChamadoOcorrencia;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
      FModel.CDSChamadoOcorrenciaCons.Close;
      Negocio.LocalizarChamadoOcorrencia(0);
      FModel.CDSChamadoOcorrenciaCons.Open;
      dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirQuadro(AIdUsuario, AIdRevenda: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSQuadro.Close;
      Negocio.ChamadoQuadro(AIdUsuario, AIdRevenda);
      FModel.CDSQuadro.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirQuadro');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirQuadro1(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSChamadoQuadro1.Close;
      Negocio.FiltrarChamadoQuadro1(AIdUsuario);
      FModel.CDSChamadoQuadro1.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirQuadro1');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirQuadro2(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSChamadoQuadro2.Close;
      Negocio.FiltrarChamadoQuadro2(AIdUsuario);
      FModel.CDSChamadoQuadro2.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirQuadro2');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirQuadro3(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSChamadoQuadro3.Close;
      Negocio.FiltrarChamadoQuadro3(AIdUsuario);
      FModel.CDSChamadoQuadro3.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirQuadro3');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirQuadro4(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSChamadoQuadro4.Close;
      Negocio.FiltrarChamadoQuadro4(AIdUsuario);
      FModel.CDSChamadoQuadro4.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirQuadro4');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirQuadro5(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSChamadoQuadro5.Close;
      Negocio.FiltrarChamadoQuadro5(AIdUsuario);
      FModel.CDSChamadoQuadro5.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirQuadro5');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.AbrirQuadro6(AIdUsuario: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSChamadoQuadro6.Close;
      Negocio.FiltrarChamadoQuadro6(AIdUsuario);
      FModel.CDSChamadoQuadro6.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirQuadro6');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.AbrirQuadroJSON(AIdUsuario,
  AIdRevenda: integer): TObjectList<TChamadoQuadroViewModel>;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := TConverte.JSONToObject<TListaChamadoQuadroViewModel>(Negocio.ChamadoQuadroJSON(AIdUsuario, AIdRevenda));
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AbrirQuadroJSON');
      end;
    end;
  finally
    FreeAndNil(Negocio);
//    dm.Desconectar;
  end;
end;

procedure TChamadoController.AtividadeListarProblemaSolucao(AFiltro: TFiltroChamado; ATexto: string;
  AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSListarProblemaSolucao.Close;
      Negocio.AtividadeListarProblemaSolucao(oObjetoJSON, ATexto, AIdUsuario);
      FModel.CDSListarProblemaSolucao.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.AtividadeListarProblemaSolucao');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.BuscarIdOcorrencia: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := StrToInt(Negocio.ProximoIdGeral('Chamado_Ocorrencia').ToString());
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.BuscarIdOcorrencia');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.BuscarTotalHorasDoChamado(
  AIdChamado: Integer): string;
var
  Negocio: TServerMethods1Client;
  cHoras: Double;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      cHoras := Negocio.ChamadoBuscarTotalHorasDoChamado(AIdChamado);
      Result :=  TFuncoes.DecimalToHora(cHoras);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.BuscarTotalHorasDoChamado');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;

  if FModel.CDSChamadoOcorrenciaCons.State in [dsEdit, dsInsert] then
    FModel.CDSChamadoOcorrenciaCons.Cancel;
end;

procedure TChamadoController.CancelarOcorrencia;
begin
  if FModel.CDSChamadoOcorrenciaCons.State in [dsEdit, dsInsert] then
    FModel.CDSChamadoOcorrenciaCons.Cancel;
end;

procedure TChamadoController.ChamadoAnexos(AIdChamado: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSChamadoAnexo.Close;
      Negocio.ChamadoAnexos(AIdChamado);
      FModel.CDSChamadoAnexo.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.ChamadoAnexos');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

constructor TChamadoController.Create;
begin
  inherited Create;
  try
    FModel := TDMChamado.Create(nil);
    FListaColaboradores := TObjectList<TChamadoColaboradorVO>.Create;
  except
    On E: Exception do
    begin
      TFuncoes.Excessao(E, 'TChamadoController.Create');
    end;
  end;
end;

destructor TChamadoController.Destroy;
begin
  try
    FreeAndNil(FModel);
    FreeAndNil(FListaColaboradores);
  except
    On E: Exception do
    begin
      TFuncoes.Excessao(E, 'TChamadoController.Destroy');
    end;
  end;
  inherited;
end;

procedure TChamadoController.Editar(AId: Integer; AFormulario: TForm; ATipo: TEnumChamadoAtividade);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;

      if ATipo = caChamado then
        Resultado := Negocio.Editar(CChamadoPrograma, dm.IdUsuario, AId)
      else
        Resultado := Negocio.AtividadeEditar(dm.IdUsuario, AId);

      FModel.CDSCadastro.Open;

      TFuncoes.HabilitarCampo(AFormulario, Resultado);

      LocalizarChamadoOcorrencia(AId);

      LocalizarChamadoColaborador(AId);

      LocalizarChamadoStatus(AId);

      FOperacao := opEditar;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        DM.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.Excluir(AIdUsuario, AId: Integer; ATipo: TEnumChamadoAtividade);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      if ATipo = caChamado then
        Negocio.Excluir(CChamadoPrograma, AIdUsuario, AId)
      else
        Negocio.AtividadeExcluir(AIdUsuario, AId);

      FModel.CDSConsulta.Delete;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.ExcluirOcorrencia;
begin
  FModel.CDSChamadoOcorrenciaCons.Delete;
end;

procedure TChamadoController.Filtrar(APrograma:Integer; ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSConsulta.Close;
      Negocio.Filtrar(APrograma, ACampo, ATexto,  AAtivo, AContem);
      FModel.CDSConsulta.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.FiltrarAtividade(AFiltro: TFiltroChamado; ACampo,
  ATexto: string; AIdUsuario: Integer; AContem: Boolean);
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
    try
      FModel.CDSConsulta.Close;
      Negocio.FiltrarAtividade(oObjetoJSON, ACampo, ATexto, AIdUsuario, AContem);
      FModel.CDSConsulta.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.FiltrarChamado(AFiltro: TFiltroChamado; ACampo,
    ATexto: string; AIdUsuario: Integer; AContem: Boolean = False);
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
    try
      FModel.CDSConsulta.Close;
      Negocio.FiltrarChamado(oObjetoJSON, ACampo, ATexto, AIdUsuario, AContem);
      FModel.CDSConsulta.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.FiltrarIdChamado(AIdChamado: integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      FModel.CDSConsulta.Close;
      Negocio.FiltrarIdChamado(AIdChamado);
      FModel.CDSConsulta.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.GravarOcorrencia(ObjVO: TChamadoVO);
var
  OcorrenciaVO: TChamadoOcorrenciaVO;
begin
  FModel.CDSChamadoOcorrenciaCons.DisableControls;
  FModel.CDSChamadoOcorrenciaCons.First;
  try
    while not FModel.CDSChamadoOcorrenciaCons.Eof do
    begin
      OcorrenciaVO := TChamadoOcorrenciaVO.Create;
      OcorrenciaVO.Id := FModel.CDSChamadoOcorrenciaConsChOco_Id.AsInteger;
      OcorrenciaVO.IdChamado := FModel.CDSChamadoOcorrenciaConsChOco_Chamado.AsInteger;
      OcorrenciaVO.Docto := FModel.CDSChamadoOcorrenciaConsChOco_Docto.AsString;
      OcorrenciaVO.Data := FModel.CDSChamadoOcorrenciaConsChOco_Data.AsDateTime;
      OcorrenciaVO.HoraInicio := FModel.CDSChamadoOcorrenciaConsChOco_HoraInicio.AsDateTime;
      OcorrenciaVO.HoraFim := FModel.CDSChamadoOcorrenciaConsChOco_HoraFim.AsDateTime;
      OcorrenciaVO.IdUsuario := FModel.CDSChamadoOcorrenciaConsChOco_Usuario.AsInteger;
      OcorrenciaVO.IdUsuarioColab1 := FModel.CDSChamadoOcorrenciaConsChOco_UsuarioColab1.AsInteger;
      OcorrenciaVO.IdUsuarioColab2 := FModel.CDSChamadoOcorrenciaConsChOco_UsuarioColab2.AsInteger;
      OcorrenciaVO.IdUsuarioColab3 := FModel.CDSChamadoOcorrenciaConsChOco_UsuarioColab3.AsInteger;
      OcorrenciaVO.DescricaoTecnica := FModel.CDSChamadoOcorrenciaConsChOco_DescricaoTecnica.AsString;
      OcorrenciaVO.DescricaoSolucao := FModel.CDSChamadoOcorrenciaConsChOco_DescricaoSolucao.AsString;
      OcorrenciaVO.Anexo := FModel.CDSChamadoOcorrenciaConsChOco_Anexo.AsString;
      OcorrenciaVO.TotalHoras := FModel.CDSChamadoOcorrenciaConsChOco_TotalHoras.AsFloat;
      OcorrenciaVO.Versao := FModel.CDSChamadoOcorrenciaConsChOco_Versao.AsString;
      ObjVO.ListaChamadoOcorrencia.Add(OcorrenciaVO);

      FModel.CDSChamadoOcorrenciaCons.Next;
    end;
  finally
    FModel.CDSChamadoOcorrenciaCons.EnableControls;
    FModel.CDSChamadoOcorrenciaCons.First;
  end;
end;

procedure TChamadoController.GravarOcorrenciaColaborador(ObjVO: TChamadoVO);
var
  VO: TChamadoColaboradorVO;
begin
  FModel.CDSChamadoOcorrColaborador.DisableControls;
  FModel.CDSChamadoOcorrColaborador.First;
  try
    while not FModel.CDSChamadoOcorrColaborador.Eof do
    begin
      VO := TChamadoColaboradorVO.Create;
      VO.Id := FModel.CDSChamadoOcorrColaboradorChaOCol_Id.AsInteger;
      VO.IdOcorrencia := FModel.CDSChamadoOcorrColaboradorChaOCol_ChamadoOcorrencia.AsInteger;
      VO.HoraInicial := FModel.CDSChamadoOcorrColaboradorChaOcol_HoraInicio.AsDateTime;
      VO.HoraFim := FModel.CDSChamadoOcorrColaboradorChaOCol_HoraFim.AsDateTime;
      VO.IdUsuario := FModel.CDSChamadoOcorrColaboradorChaOCol_Usuario.AsInteger;
      VO.TotalHoras := FModel.CDSChamadoOcorrColaboradorChaOcol_TotalHoras.AsFloat;
      ObjVO.ListaChamadoColaborador.Add(VO);

      FModel.CDSChamadoOcorrColaborador.Next;
    end;
  finally
    FModel.CDSChamadoOcorrColaborador.EnableControls;
    FModel.CDSChamadoOcorrColaborador.First;
  end;
end;

procedure TChamadoController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      Negocio.Relatorio(CChamadoPrograma, AIdUsuario);
      dm.Desconectar;
//    FModel.Rel.Print;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.Imprimir');
      end;
    end;

  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.LimparQuadros(ADataSet: TDataSet);
begin
  ADataSet.First;
  while not ADataSet.Eof do
    ADataSet.Delete;
end;

procedure TChamadoController.ListarProblemaSolucao(AFiltro: TFiltroChamado; ATexto: string; AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
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
    try
      FModel.CDSListarProblemaSolucao.Close;
      Negocio.ChamadoListarProblemaSolucao(oObjetoJSON, ATexto, AIdUsuario);
      FModel.CDSListarProblemaSolucao.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.ListarProblemaSolucao');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.LocalizarChamadoColaborador(AIdChamado: Integer);
begin
  FModel.CDSChamadoOcorrColaborador.Close;
  FModel.CDSChamadoOcorrColaborador.Params[0].AsInteger := AIdChamado;
  FModel.CDSChamadoOcorrColaborador.Open;
end;

procedure TChamadoController.LocalizarChamadoOcorrencia(AIdChamado: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSChamadoOcorrenciaCons.Close;
      Negocio.LocalizarChamadoOcorrencia(AIdChamado);
      FModel.CDSChamadoOcorrenciaCons.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.LocalizarChamadoStatus(AIdChamado: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSChamadoStatus.Close;
      Negocio.LocalizarChamadoStatus(AIdChamado);
      FModel.CDSChamadoStatus.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Negocio.LocalizarId(CChamadoPrograma, AId);
      FModel.CDSCadastro.Open;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.ModoEdicaoInsercao;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSCadastro);
end;

procedure TChamadoController.ModoEdicaoInsercaoOcorrencia;
begin
  TFuncoes.ModoEdicaoInsercao(FModel.CDSChamadoOcorrenciaCons);
end;

procedure TChamadoController.Novo(AIdUsuario: Integer; ATipo: TEnumChamadoAtividade);
var
  Negocio: TServerMethods1Client;
  Cliente: TClienteController;
  Usuario: TUsuarioController;
  IdCliente: Integer;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      if ATipo = caChamado then
        Negocio.Novo(CChamadoPrograma, AIdUsuario)
      else
        Negocio.AtividadeNovo(AIdUsuario);

      LocalizarId(0);

      FModel.CDSCadastro.Append;

      AbrirChamadoOcorrencia();

  //------------------------------------------------------------------------------
  // usuario logado
      Usuario := TUsuarioController.Create;
      try
        Usuario.LocalizarId(AIdUsuario);
        FModel.CDSCadastroCha_UsuarioAbertura.AsInteger := Usuario.Model.CDSCadastroUsu_Id.AsInteger;
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
          FModel.CDSCadastroCha_Cliente.AsInteger := IdCliente;
          FModel.CDSCadastroCli_Codigo.AsInteger := Cliente.Model.CDSCadastroCli_Codigo.AsInteger;
          FModel.CDSCadastroCli_Nome.AsString := Cliente.Model.CDSCadastroCli_Nome.AsString;
        finally
          FreeAndNil(Cliente);
        end;
      end;

      LocalizarChamadoStatus(0);
      LocalizarChamadoColaborador(0);

      ObservacaoPadrao(ATipo);

      TipoUmRegistro(ATipo);

      FOperacao := opIncluir;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    //dm.Desconectar;
  end;
end;

procedure TChamadoController.NovoOcorrencia;
var
  Usuario: TUsuarioController;
begin
  Usuario := TUsuarioController.Create;
  try
    try
      Usuario.LocalizarId(dm.IdUsuario);
      FModel.CDSChamadoOcorrenciaConsChOco_Usuario.AsInteger := Usuario.Model.CDSCadastroUsu_Id.AsInteger;
      FModel.CDSChamadoOcorrenciaConsUsu_Codigo.AsInteger := Usuario.Model.CDSCadastroUsu_Codigo.AsInteger;
      FModel.CDSChamadoOcorrenciaConsUsu_Nome.AsString := Usuario.Model.CDSCadastroUsu_Nome.AsString;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.NovaOcorrencia');
      end;
    end;
  finally
    FreeAndNil(Usuario);
  end;

end;

procedure TChamadoController.ObservacaoPadrao(ATipo: TEnumChamadoAtividade);
var
  Obs: TObservacaoController;
begin
  Obs := TObservacaoController.Create;
  try
    if ATipo = caChamado then
      Obs.LocalizarPadrao(prChamado)
    else
      Obs.LocalizarPadrao(prAtividade);
    FModel.CDSCadastroCha_Descricao.AsString := Obs.Model.CDSCadastroObs_Descricao.AsString;
  finally
    FreeAndNil(Obs);
  end;
end;

function TChamadoController.OcorrenciaEstadoEdicaoInsercao: Boolean;
begin
  Result := (FModel.CDSChamadoOcorrenciaCons.State in [dsEdit, dsInsert]);
end;

function TChamadoController.PermissaoAtividadeAbertura(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoAtividadeAbertura(AIdUsuario);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissaoAtividadeAbertura');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.PermissaoAtividadeOcorrencia(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoAtividadeOcorrencias(AIdUsuario);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissaoAtividadeOcorrencia');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.PermissaoAtividadeQuadro(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoAtividadeQuadro(AIdUsuario);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissaoAtividadeQuadro');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.PermissaoAtividadeStatus(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoAtividadeStatus(AIdUsuario);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissaoAtividadeStatus');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.PermissaoChamadoAbertura(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoChamadoAbertura(AIdUsuario);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissaoChamadoAbertura');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.PermissaoChamadoOcorrencia(
  AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoChamadoOcorrencia(AIdUsuario);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissaoChamadoOcorrencia');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.PermissaoChamadoQuadro(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoChamadoQuadro(AIdUsuario);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissaoChamadoQuadro');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.PermissaoChamadoStatus(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.PermissaoChamadoStatus(AIdUsuario);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissaoChamadoStatus');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.PermissaoEditar(AId: Integer; ATipo: TEnumChamadoAtividade = caChamado): Boolean;
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      if ATipo = caChamado then
        Resultado := Negocio.Editar(CChamadoPrograma, dm.IdUsuario, AId)
      else
        Resultado := Negocio.AtividadeEditar(dm.IdUsuario, AId);
      FModel.CDSCadastro.Open;

      Result := Resultado;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissaoEditar');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.PermissoesAtividade(
  AIdUsuario: Integer): TPermissaoAtividadeVO;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := TConverte.JSONToObject<TPermissaoAtividadeVO>(Negocio.PermissoesAtividade(AIdUsuario));
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissoesAtividade');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.PermissoesChamado(
  AIdUsuario: Integer): TPermissaoChamadoVO;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := TConverte.JSONToObject<TPermissaoChamadoVO>(Negocio.PermissoesChamado(AIdUsuario));
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.PermissoesChamado');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TChamadoController.Pesquisar(AId: Integer);
begin
  LocalizarId(AId);
end;

procedure TChamadoController.Post;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Post;
end;

procedure TChamadoController.PostOcorrencia;
begin
  if FModel.CDSChamadoOcorrenciaCons.State in [dsInsert, dsEdit] then
  begin
    FModel.CDSChamadoOcorrenciaCons.Post;
  end;
end;

procedure TChamadoController.PreencheQuadros(ADataSet: TDataSet);
begin
  ADataSet.Append;
  ADataSet.FieldByName('Cha_Id').AsInteger := FModel.CDSQuadroCha_Id.AsInteger;
  ADataSet.FieldByName('Cha_DataAbertura').AsDateTime := FModel.CDSQuadroCha_DataAbertura.AsDateTime;
  ADataSet.FieldByName('Cha_HoraAbertura').AsDateTime := FModel.CDSQuadroCha_HoraAbertura.AsDateTime;
  ADataSet.FieldByName('Cli_Nome').AsString := FModel.CDSQuadroCli_Nome.AsString;
  ADataSet.FieldByName('Nivel').AsString := FModel.CDSQuadroNivel.AsString;
  ADataSet.FieldByName('Tip_Nome').AsString := FModel.CDSQuadroTip_Nome.AsString;
  ADataSet.FieldByName('Usu_Nome').AsString := FModel.CDSQuadroUsu_Nome.AsString;
  ADataSet.FieldByName('Cha_UsuarioAtendeAtual').AsString := FModel.CDSQuadroCha_UsuarioAtendeAtual.AsString;
  ADataSet.FieldByName('Cha_HoraAtendeAtual').AsDateTime := FModel.CDSQuadrocha_HoraAtendeAtual.AsDateTime;
  ADataSet.FieldByName('UltimaData').AsDateTime := FModel.CDSQuadroUltimaData.AsDateTime;
  ADataSet.FieldByName('Sta_Codigo').AsInteger := FModel.CDSQuadroSta_Codigo.AsInteger;
  ADataSet.FieldByName('Cli_Codigo').AsInteger := FModel.CDSQuadroCli_Codigo.AsInteger;
  ADataSet.FieldByName('UltimaHora').AsDateTime := FModel.CDSQuadroUltimaHora.AsDateTime;
  ADataSet.Post;
end;

procedure TChamadoController.PreencheQuadrosAtividades(ADataSet: TDataSet);
begin
  ADataSet.Append;
  ADataSet.FieldByName('Cha_Id').AsInteger := FModel.CDSatividadeCha_Id.AsInteger;
  ADataSet.FieldByName('Cha_DataAbertura').AsDateTime := FModel.CDSatividadeCha_DataAbertura.AsDateTime;
  ADataSet.FieldByName('Cha_HoraAbertura').AsDateTime := FModel.CDSatividadeCha_HoraAbertura.AsDateTime;
  ADataSet.FieldByName('Cli_Nome').AsString := FModel.CDSatividadeCli_Nome.AsString;
  ADataSet.FieldByName('Nivel').AsString := FModel.CDSatividadeNivel.AsString;
  ADataSet.FieldByName('Tip_Nome').AsString := FModel.CDSatividadeTip_Nome.AsString;
  ADataSet.FieldByName('Usu_Nome').AsString := FModel.CDSatividadeUsu_Nome.AsString;
  ADataSet.FieldByName('Cha_UsuarioAtendeAtual').AsString := FModel.CDSatividadeCha_UsuarioAtendeAtual.AsString;
  ADataSet.FieldByName('Cha_HoraAtendeAtual').AsDateTime := FModel.CDSatividadecha_HoraAtendeAtual.AsDateTime;
  ADataSet.FieldByName('UltimaData').AsDateTime := FModel.CDSatividadeUltimaData.AsDateTime;
  ADataSet.FieldByName('Sta_Codigo').AsInteger := FModel.CDSatividadeSta_Codigo.AsInteger;
  ADataSet.FieldByName('Cli_Codigo').AsInteger := FModel.CDSatividadeCli_Codigo.AsInteger;
  ADataSet.FieldByName('UltimaHora').AsDateTime := FModel.CDSatividadeUltimaHora.AsDateTime;
  ADataSet.Post;
end;

procedure TChamadoController.PreencheQuadrosJSON(ADataSet: TDataSet;
  AItem: TChamadoQuadroViewModel);
begin
  ADataSet.Append;
  ADataSet.FieldByName('Cha_Id').AsInteger := AItem.IdChamado;
  ADataSet.FieldByName('Cha_DataAbertura').AsDateTime := AItem.DataAbertura;
  ADataSet.FieldByName('Cha_HoraAbertura').AsDateTime := AItem.HoraAbertura;
  ADataSet.FieldByName('Cli_Nome').AsString := AItem.Cliente.RazaoSocial;
  ADataSet.FieldByName('Cli_Perfil').AsString := AItem.Cliente.Perfil;
  ADataSet.FieldByName('Nivel').AsString := AItem.Nivel.ToString;
  ADataSet.FieldByName('Tip_Nome').AsString := AItem.Tipo.Nome;
  ADataSet.FieldByName('Usu_Nome').AsString := AItem.Usuario.Nome;
  ADataSet.FieldByName('Cha_UsuarioAtendeAtual').AsString := AItem.IdUsuarioAtendeAtual.ToString;
  ADataSet.FieldByName('Cha_HoraAtendeAtual').AsDateTime := AItem.HoraAtendeAtual;
  ADataSet.FieldByName('UltimaData').AsDateTime := AItem.UltimaData;
  ADataSet.FieldByName('Sta_Codigo').AsInteger := AItem.Status.Codigo;
  ADataSet.FieldByName('Cli_Codigo').AsInteger := AItem.Cliente.Codigo;
  ADataSet.FieldByName('UltimaHora').AsDateTime := AItem.UltimaHora;
  ADataSet.Post;
end;

procedure TChamadoController.PreencherTodosQuadros(AIdUsuario, AIdRevenda: integer);
var
  iQuadro: Integer;
begin

  AbrirQuadro(AIdUsuario, AIdRevenda);
  FModel.CDSQuadro.DisableControls;
  try
    LimparQuadros(FModel.CDSQuadro1);
    LimparQuadros(FModel.CDSQuadro2);
    LimparQuadros(FModel.CDSQuadro3);
    LimparQuadros(FModel.CDSQuadro4);
    LimparQuadros(FModel.CDSQuadro5);
    LimparQuadros(FModel.CDSQuadro6);

    FModel.CDSQuadro.First;
    while not FModel.CDSQuadro.Eof do
    begin
      iQuadro := StrToInt(Copy(FModel.CDSQuadroQuadro.AsString, 2, 3));
      case iQuadro of
        1: PreencheQuadros(FModel.CDSQuadro1);
        2: PreencheQuadros(FModel.CDSQuadro2);
        3: PreencheQuadros(FModel.CDSQuadro3);
        4: PreencheQuadros(FModel.CDSQuadro4);
        5: PreencheQuadros(FModel.CDSQuadro5);
        6: PreencheQuadros(FModel.CDSQuadro6);
      end;
      FModel.CDSQuadro.Next;
    end;
    FModel.CDSQuadro.First;
  finally
    FModel.CDSQuadro.EnableControls;
  end;
end;

procedure TChamadoController.PreencherTodosQuadrosAtividades(
  AIdUsuario, AIdRevenda: integer);
var
  iQuadro: Integer;
begin
  AbrirAtividade(AIdUsuario, AIdRevenda);
  FModel.CDSAtividade.DisableControls;
  try
    LimparQuadros(FModel.CDSAtividade1);
    LimparQuadros(FModel.CDSAtividade2);
    LimparQuadros(FModel.CDSAtividade3);
    LimparQuadros(FModel.CDSAtividade4);
    LimparQuadros(FModel.CDSAtividade5);
    LimparQuadros(FModel.CDSAtividade6);

    FModel.CDSAtividade.First;
    while not FModel.CDSAtividade.Eof do
    begin
      iQuadro := StrToInt(Copy(FModel.CDSAtividadeQuadro.AsString, 2, 1));
      case iQuadro of
        1: PreencheQuadrosAtividades(FModel.CDSAtividade1);
        2: PreencheQuadrosAtividades(FModel.CDSAtividade2);
        3: PreencheQuadrosAtividades(FModel.CDSAtividade3);
        4: PreencheQuadrosAtividades(FModel.CDSAtividade4);
        5: PreencheQuadrosAtividades(FModel.CDSAtividade5);
        6: PreencheQuadrosAtividades(FModel.CDSAtividade6);
      end;
      FModel.CDSAtividade.Next;
    end;
    FModel.CDSAtividade.First;
  finally
    FModel.CDSAtividade.EnableControls;
  end;
end;

function TChamadoController.PreencherTodosQuadrosAtividadesJSON(AIdUsuario,
  AIdRevenda: integer): TObjectList<TChamadoQuadroViewModel>;
var
  iQuadro: Integer;
  item: TChamadoQuadroViewModel;
  listaAtividade: TObjectList<TChamadoQuadroViewModel>;
begin
  listaAtividade := AbrirAtividadeJSON(AIdUsuario, AIdRevenda);
  try
    LimparQuadros(FModel.CDSAtividade1);
    LimparQuadros(FModel.CDSAtividade2);
    LimparQuadros(FModel.CDSAtividade3);
    LimparQuadros(FModel.CDSAtividade4);
    LimparQuadros(FModel.CDSAtividade5);
    LimparQuadros(FModel.CDSAtividade6);

    for item in listaAtividade do
    begin
      iQuadro := StrToInt(Copy(item.Quadro, 2, 3));
      case iQuadro of
        1:PreencheQuadrosJSON(FModel.CDSAtividade1, item);
        2:PreencheQuadrosJSON(FModel.CDSAtividade2, item);
        3:PreencheQuadrosJSON(FModel.CDSAtividade3, item);
        4:PreencheQuadrosJSON(FModel.CDSAtividade4, item);
        5:PreencheQuadrosJSON(FModel.CDSAtividade5, item);
        6:PreencheQuadrosJSON(FModel.CDSAtividade6, item);
      end;
    end;
  finally
    FreeAndNil(listaAtividade);
  end;
end;

procedure TChamadoController.PreencherTodosQuadrosJSON(AIdUsuario,
  AIdRevenda: integer);
var
  iQuadro: Integer;
  item: TChamadoQuadroViewModel;
  listaChamado: TObjectList<TChamadoQuadroViewModel>;
begin
  listaChamado := AbrirQuadroJSON(AIdUsuario, AIdRevenda);
  try
    LimparQuadros(FModel.CDSQuadro1);
    LimparQuadros(FModel.CDSQuadro2);
    LimparQuadros(FModel.CDSQuadro3);
    LimparQuadros(FModel.CDSQuadro4);
    LimparQuadros(FModel.CDSQuadro5);
    LimparQuadros(FModel.CDSQuadro6);

    for item in listaChamado do
    begin
      iQuadro := StrToInt(Copy(item.Quadro, 2, 3));
      case iQuadro of
        1:PreencheQuadrosJSON(FModel.CDSQuadro1, item);
        2:PreencheQuadrosJSON(FModel.CDSQuadro2, item);
        3:PreencheQuadrosJSON(FModel.CDSQuadro3, item);
        4:PreencheQuadrosJSON(FModel.CDSQuadro4, item);
        5:PreencheQuadrosJSON(FModel.CDSQuadro5, item);
        6:PreencheQuadrosJSON(FModel.CDSQuadro6, item);
      end;
    end;
  finally
    FreeAndNil(listaChamado);
  end;
end;

function TChamadoController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := StrToInt(Negocio.ProximoId(CChamadoPrograma).ToString);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.ProximoId');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.RetornaIdOcorrencia: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := StrToInt(Negocio.RetornaIdAtual('Chamado_Ocorrencia').ToString);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.RetornaIdOcorrencia');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

procedure TChamadoController.Relatorio(AFiltro: TFiltroChamado; AModelo,
    AIdUsuario: Integer; AOrdem: string);
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

  case AModelo of
    1: Relatorio01(AFiltro, AModelo, AIdUsuario);
    2: Relatorio02(AFiltro, AModelo, AIdUsuario, AOrdem);
    3: Relatorio03(AFiltro, AModelo, AIdUsuario, AOrdem);
    4: Relatorio04(AFiltro, AModelo, AIdUsuario, AOrdem);
    5: Relatorio05(AFiltro, AModelo, AIdUsuario, AOrdem);
    6: Relatorio06(AFiltro, AModelo, AIdUsuario, AOrdem);
    7: Relatorio07(AFiltro, AModelo, AIdUsuario, AOrdem);
    8: Relatorio08(AFiltro, AModelo, AIdUsuario, AOrdem);
    9: Relatorio09(AFiltro, AModelo, AIdUsuario, AOrdem);
  end;
end;

procedure TChamadoController.Relatorio01(AFiltro: TFiltroChamado; AModelo,
  AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
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
  rel := TDMRelChamado.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      rel.CDSRelChamadoDetModelo1.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, '', Integer(caChamado));
      rel.lblPeriodoModelo1.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
      rel.RelChamadoModelo1.Print;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.Relatorio02(AFiltro: TFiltroChamado; AModelo,
    AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
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
  rel := TDMRelChamado.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      rel.CDSRelChamadoModelo2.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caChamado));
      rel.lblPeriodoModelo2.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
      rel.RelChamadoModelo2.Print;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.Relatorio03(AFiltro: TFiltroChamado; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
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
  rel := TDMRelChamado.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      rel.CDSRelChamadoModelo3.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caChamado));
      rel.CDSRelChamadoModelo3.Open;

      rel.ImpressaoModelo3(AFiltro.DataInicial, AFiltro.DataFinal, AOrdem);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.Relatorio04(AFiltro: TFiltroChamado; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
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
  rel := TDMRelChamado.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      rel.CDSRelChamadoModelo4.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caChamado));
      rel.lblPeriodoModelo4.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
      rel.RelChamadoModelo4.Print;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.Relatorio05(AFiltro: TFiltroChamado; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
  Grafico: TfrmChamadoGrafico1;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

// serializa o objeto
  Marshal := TJSONMarshal.Create;
  try
    oObjetoJSON := Marshal.Marshal(AFiltro);
  finally
    FreeAndNil(Marshal);
  end;

  Grafico := TfrmChamadoGrafico1.Create(nil);

//  rel := TDMRelChamado.Create(nil);

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Grafico.CDSGrafico1.Close;
  //    rel.CDSRelChamadoModelo5.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caChamado));
  //    rel.lblPeriodoModelo5.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
  //    rel.RelChamadoModelo5.Print;
      Grafico.DBChart1.Title.Text.Clear;
      Grafico.DBChart1.Title.Text.Add('Chamados - Estat�stica de Chamados e Horas por Per�odo');
      Grafico.DBChart1.Title.Text.Add('Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal);
      Grafico.CDSGrafico1.Open;
      Grafico.ShowModal;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;

  finally
    FreeAndNil(Negocio);
    FreeAndNil(Grafico);
//    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.Relatorio06(AFiltro: TFiltroChamado; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
  sMesAnoInicial: string;
  sMesAnoFinal: string;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

  if (AFiltro.DataInicial.Trim = DataEmBranco) then
    raise Exception.Create('Informe a Data Inicial!');

  if (AFiltro.DataFinal.Trim = DataEmBranco) then
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
  oObjetoJSON := TConverte.ObjectToJSON<TFiltroChamado>(AFiltro);

  dm.Conectar;
  rel := TDMRelChamado.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caChamado));

      if AFiltro.TipoMovimento = 1 then
        rel.lblTitulo06.Caption := 'Chamados - Resumo por Tipo Mensal';

      if AFiltro.TipoMovimento = 2 then
        rel.lblTitulo06.Caption := 'Atividades - Resumo por Tipo Mensal';

      rel.CDSRelChamadoModelo6.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caChamado));
      rel.lblRelatorio06.Caption := 'Per�odo de ' + sMesAnoInicial + ' At� ' + sMesAnoFinal;
      rel.RelChamadoModelo6.Print;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.Relatorio07(AFiltro: TFiltroChamado; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
  sMesAnoInicial: string;
  sMesAnoFinal: string;
  iTipo: integer;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

  if (AFiltro.DataInicial = DataEmBranco) then
    raise Exception.Create('Informe a Data Inicial!');

  if (AFiltro.DataFinal = DataEmBranco) then
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
  oObjetoJSON := TConverte.ObjectToJSON<TFiltroChamado>(AFiltro);

  dm.Conectar;
  rel := TDMRelChamado.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caChamado));

      if AFiltro.TipoMovimento = 1 then
      begin
        rel.lblTituloRelatorio7.Caption := 'Chamados - Resumo de Ocorr�ncias por Usu�rio M�s';
        iTipo := Integer(caChamado);
      end;

      if AFiltro.TipoMovimento = 2 then
      begin
        rel.lblTituloRelatorio7.Caption := 'Atividades - Resumo de Ocorr�ncias por Usu�rio M�s';
        iTipo := Integer(caAtividade);
      end;

      rel.CDSRelChamadoModelo6.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, iTipo);
      rel.lblRelatorio07.Caption := 'Per�odo de ' + sMesAnoInicial + ' At� ' + sMesAnoFinal;
      rel.RelChamadoModelo7.Print;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.Relatorio08(AFiltro: TFiltroChamado; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
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
  rel := TDMRelChamado.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      rel.CDSRelChamadoModelo8.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caChamado));
      rel.CDSRelChamadoModelo8.Open;

      rel.ImpressaoModelo8(AFiltro.DataInicial, AFiltro.DataFinal, AOrdem);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.Relatorio09(AFiltro: TFiltroChamado; AModelo,
  AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
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
  rel := TDMRelChamado.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      rel.CDSRelChamadoModelo9.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caChamado));
      rel.CDSRelChamadoModelo9.Open;

      rel.ImpressaoModelo9(AFiltro.DataInicial, AFiltro.DataFinal, AOrdem);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.RelatorioAtividade(AFiltro: TFiltroChamado;
  AModelo, AIdUsuario: Integer; AOrdem: string);
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

  case AModelo of
    1: RelatorioAtividade01(AFiltro, AModelo, AIdUsuario);
    2: RelatorioAtividade02(AFiltro, AModelo, AIdUsuario, AOrdem);
    3: RelatorioAtividade03(AFiltro, AModelo, AIdUsuario, AOrdem);
    4: RelatorioAtividade04(AFiltro, AModelo, AIdUsuario, AOrdem);
    6: RelatorioAtividade06(AFiltro, AModelo, AIdUsuario, AOrdem);
    7: Relatorio07(AFiltro, AModelo, AIdUsuario, AOrdem);
  end;
end;

procedure TChamadoController.RelatorioAtividade01(AFiltro: TFiltroChamado;
  AModelo, AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelAtividade;
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
  rel := TDMRelAtividade.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      rel.CDSRelChamadoDetModelo1.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, '', Integer(caAtividade));
      rel.lblPeriodoModelo1.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
      rel.RelChamadoModelo1.Print;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.RelatorioAtividade02(AFiltro: TFiltroChamado;
  AModelo, AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelAtividade;
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
  rel := TDMRelAtividade.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      rel.CDSRelChamadoModelo2.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caAtividade));
      rel.lblPeriodoModelo2.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
      rel.RelChamadoModelo2.Print;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.RelatorioAtividade03(AFiltro: TFiltroChamado;
  AModelo, AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelAtividade;
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
  rel := TDMRelAtividade.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      rel.CDSRelChamadoModelo3.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caAtividade));
      rel.CDSRelChamadoModelo3.Open;

      rel.ImpressaoModelo3(AFiltro.DataInicial, AFiltro.DataFinal);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.RelatorioAtividade04(AFiltro: TFiltroChamado;
  AModelo, AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
//  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  rel: TDMRelAtividade;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

// serializa o objeto
  oObjetoJSON := TConverte.ObjectToJSON<TFiltroChamado>(AFiltro);
//  Marshal := TJSONMarshal.Create;
//  try
//    oObjetoJSON := Marshal.Marshal(AFiltro);
//  finally
//    FreeAndNil(Marshal);
//  end;

  dm.Conectar;
  rel := TDMRelAtividade.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      rel.CDSRelChamadoModelo4.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caAtividade));
      rel.lblPeriodoModelo4.Caption := 'Per�odo de ' + AFiltro.DataInicial + ' At� ' + AFiltro.DataFinal;
      rel.RelChamadoModelo4.Print;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TChamadoController.RelatorioAtividade06(AFiltro: TFiltroChamado;
  AModelo, AIdUsuario: Integer; AOrdem: string);
var
  Negocio: TServerMethods1Client;
  oObjetoJSON : TJSONValue;
  rel: TDMRelChamado;
  sMesAnoInicial: string;
  sMesAnoFinal: string;
begin
  TFuncoes.ValidaIntervaloDatas(AFiltro.DataInicial, AFiltro.DataFinal);

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
  oObjetoJSON := TConverte.ObjectToJSON<TFiltroChamado>(AFiltro);

  dm.Conectar;
  rel := TDMRelChamado.Create(nil);

  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caAtividade));

      if AFiltro.TipoMovimento = 1 then
        rel.lblTitulo06.Caption := 'Chamados - Resumo por Tipo Mensal'
      else
        rel.lblTitulo06.Caption := 'Atividades - Resumo por Tipo Mensal';

      rel.CDSRelChamadoModelo6.Close;
      Negocio.RelatorioChamado(AModelo, AIdUsuario, oObjetoJSON, AOrdem, Integer(caChamado));
      rel.lblRelatorio06.Caption := 'Per�odo de ' + sMesAnoInicial + ' At� ' + sMesAnoFinal;
      rel.RelChamadoModelo6.Print;
      dm.Desconectar;
    except
      On E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

function TChamadoController.RetornarEmails(AIdChamado, AIdUsuario, AIdStatus: Integer): string;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.RetornarChamadoEmails(AIdChamado, AIdUsuario, AIdStatus);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.RetornarEmails');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.RetornarEmailsCliente(AIdChamado: Integer): string;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.RetornarChamadoEmailCliente(AIdChamado, dm.IdUsuario);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.RetornarEmailsCliente');
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TChamadoController.RetornarCodigoStatusChamado(AIdChamado: integer): string;
var
  Negocio: TServerMethods1Client;
  sb: TStringBuilder;
begin
  sb := TStringBuilder.Create;
  sb.AppendLine(' SELECT');
  sb.AppendLine('   Sta_Codigo');
  sb.AppendLine('FROM Chamado');
  sb.AppendLine('	  INNER JOIN Status ON Cha_Status = Sta_Id');
  sb.AppendLine(' WHERE Cha_Id = '  + IntToStr(AIdChamado));

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.SelectSQL(sb.ToString);
      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.RetornarCodigoStatusChamado');
      end;
    end;
  finally
    FreeAndNil(sb);
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

function TChamadoController.Salvar(AIdUsuario: Integer; ATipo: TEnumChamadoAtividade): Integer;
var
  Negocio: TServerMethods1Client;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  ChamadoStatus: TChamadoStatusVO;
  IdChamado: Integer;
  iTipo: Integer;
  ChamadoVO: TChamadoVO;
  hora: TTime;
begin
//  if TFuncoes.DataEmBrancoNula(FModel.CDSCadastroCha_DataAbertura.AsString) then
//    raise Exception.Create('Informe a Data da Abertura!');
//
//  if FModel.CDSCadastroCha_HoraAbertura.AsString = '' then
//    raise Exception.Create('Informe a Hora da Abertura!');
//
//  if FModel.CDSCadastroCha_UsuarioAbertura.AsInteger = 0 then
//    raise Exception.Create('Informe o Usu�rio de Abertura!');
//
//  if FModel.CDSCadastroCha_Cliente.AsInteger = 0 then
//    raise Exception.Create('Informe o Cliente na Abertura!');
//
//  if FModel.CDSCadastroCha_Tipo.AsInteger = 0 then
//    raise Exception.Create('Informe o Tipo na Abertura!');
//
//  if FModel.CDSCadastroCha_Status.AsInteger = 0 then
//    raise Exception.Create('Informe o Status na Abertura!');
//
//  if Trim(FModel.CDSCadastroCha_Descricao.AsString) = '' then
//    raise Exception.Create('Informe a Descri��o na Abertura!');

//  FModel.CDSCadastroCha_HoraAbertura.AsString := FormatDateTime('hh:mm', FModel.CDSCadastroCha_HoraAbertura.AsDateTime);

  case ATipo of
    caChamado  : iTipo := Integer(caChamado);
    caAtividade: iTipo := Integer(caAtividade);
  end;

  hora := FModel.CDSCadastroCha_HoraAtendeAtual.AsDateTime;
  if FModel.CDSCadastro.State = dsInsert then
    hora := Time;

  FModel.CDSCadastroCha_TipoMovimento.AsInteger := iTipo;

  ChamadoVO := TChamadoVO.Create;
  ChamadoVO.Id                    := FModel.CDSCadastroCha_Id.AsInteger;
  ChamadoVO.DataAbertura          := FModel.CDSCadastroCha_DataAbertura.AsDateTime;
  ChamadoVO.HoraAbertura          := FModel.CDSCadastroCha_HoraAbertura.AsDateTime;
  ChamadoVO.IdCliente             := FModel.CDSCadastroCha_Cliente.AsInteger;
  ChamadoVO.IdUsuarioAbertura     := FModel.CDSCadastroCha_UsuarioAbertura.AsInteger;
  ChamadoVO.Contato               := FModel.CDSCadastroCha_Contato.AsString;
  ChamadoVO.Nivel                 := FModel.CDSCadastroCha_Nivel.AsInteger;
  ChamadoVO.IdTipo                := FModel.CDSCadastroCha_Tipo.AsInteger;
  ChamadoVO.IdStatus              := FModel.CDSCadastroCha_Status.AsInteger;
  ChamadoVO.Descricao             := FModel.CDSCadastroCha_Descricao.AsString;
  ChamadoVO.IdModulo              := FModel.CDSCadastroCha_Modulo.AsInteger;
  ChamadoVO.IdProduto             := FModel.CDSCadastroCha_Produto.AsInteger;
  ChamadoVO.IdUsuarioAtendeAtual  := FModel.CDSCadastroCha_UsuarioAtendeAtual.AsInteger;
  ChamadoVO.HoraAtendeAtual       := hora; // FModel.CDSCadastroCha_HoraAtendeAtual.AsDateTime;
  ChamadoVO.TipoMovimento         := FModel.CDSCadastroCha_TipoMovimento.AsInteger;
  ChamadoVO.Origem                := FModel.CDSCadastroCha_Origem.AsInteger;

  GravarOcorrencia(ChamadoVO);
  GravarOcorrenciaColaborador(ChamadoVO);

  Marshal := TJSONMarshal.Create;

  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      oObjetoJSON := Marshal.Marshal(ChamadoVO);
      Result := StrToIntDef(Negocio.SalvarChamadoObj(AIdUsuario, oObjetoJSON).ToString(),0);
      Post;
      FOperacao := opNavegar;
      dm.Desconectar;
    except
      on E: Exception do
      begin
        dm.ErroConexao(E.Message);
//        TFuncoes.MensagemErroBanco(E.Message);
//        Abort;
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Marshal);
    FreeAndNil(ChamadoVO);
  end;


//  try
//    Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
//    try
//      Negocio.StartTransacao;
//
//      FModel.CDSCadastroCha_HoraAbertura.AsString := FormatDateTime('hh:mm', FModel.CDSCadastroCha_HoraAbertura.AsDateTime);
//
//      case ATipo of
//        caChamado  : iTipo := Integer(caChamado);
//        caAtividade: iTipo := Integer(caAtividade);
//      end;
//
//      FModel.CDSCadastroCha_TipoMovimento.AsInteger := iTipo;
//
//      Post();
//
//      if FModel.CDSCadastro.ChangeCount > 0 then
//        FModel.CDSCadastro.ApplyUpdates(0);
//
//      if FOperacao = opIncluir then
//        IdChamado := Negocio.RetornaIdAtual('Chamado')
//      else
//        IdChamado := FModel.CDSCadastroCha_Id.AsInteger;
//
//      obj := TChamadoStatusVO.Create;
//      obj.Id := 0;
//      obj.IdChamado := IdChamado;
//      obj.Data := Date;
//      obj.IdStatus := FModel.CDSCadastroCha_Status.OldValue;
//      obj.IdUsuarioAtendeAtual := FModel.CDSCadastroCha_UsuarioAtendeAtual.AsInteger;
//
//    // serializa o objeto
//      Marshal := TJSONMarshal.Create;
//      try
//        oObjetoJSON := Marshal.Marshal(obj);
//      finally
//        FreeAndNil(Marshal);
//        FreeAndNil(obj);
//      end;
//
//
//      Negocio.SalvarChamado(CChamadoPrograma, DM.IdUsuario, oObjetoJSON);
//      SalvarOcorrencia(IdChamado);
////      SalvarOcorrenciaQuadro;
//      Negocio.Commit;
//
//      dm.IdCadastro := IdChamado;
//
//      FOperacao := opNavegar;
//    except
//      ON E: Exception do
//      begin
//        FOperacao := lOperacao;
//        Negocio.Roolback;
////          raise Exception.Create(E.Message);
//        TFuncoes.Excessao(E, 'TChamadoController.Salvar');
//      end;
//    end;
//  finally
//    FreeAndNil(Negocio);
//  end;
end;

procedure TChamadoController.SalvarColaborador(AIdOldOcorrencia, AIdProx: Integer);
var
  ColaboradorController: TChamadoColaboradorController;
  Colaborador: TChamadoColaboradorVO;
begin
  for Colaborador in ListaColaboradores do
    Colaborador.IdOcorrencia := AIdProx;

  ColaboradorController.SalvarLista(FListaColaboradores);
end;

procedure TChamadoController.SalvarOcorrencia(AIdChamado: Integer);
var
  obj: TUsuarioController;
  IdUsuario: Integer;
  IdOld: integer;
  IdProximo: Integer;
begin
  FModel.CDSChamadoOcorrenciaCons.DisableControls;
  try
    try
      if FModel.CDSChamadoOcorrenciaCons.Active then
      begin
        if FModel.CDSChamadoOcorrenciaCons.State in [dsInsert] then
          CancelarOcorrencia;

  //      FModel.CDSChamadoOcorrenciaCons.First;
        while not FModel.CDSChamadoOcorrenciaCons.Eof do
        begin
          IdOld := FModel.CDSChamadoOcorrenciaConsChOco_Id.AsInteger;

          FModel.CDSChamadoOcorrenciaCons.Edit;
          FModel.CDSChamadoOcorrenciaConsChOco_Chamado.AsInteger := AIdChamado; //FModel.CDSCadastroCha_Id.AsInteger;
          FModel.CDSChamadoOcorrenciaCons.Post;

          if FModel.CDSChamadoOcorrenciaCons.ChangeCount > 0 then
            FModel.CDSChamadoOcorrenciaCons.ApplyUpdates(0);

          IdProximo := RetornaIdOcorrencia();

  //        IdProximo := FModel.CDSChamadoOcorrenciaConsChOco_Id.AsInteger;
          if IdOld < 0 then
          begin
            // grava colaboradores
            SalvarColaborador(IdOld, IdProximo);
          end;

  //        if FModel.CDSChamadoOcorrColaborador.ChangeCount > 0 then
  //          FModel.CDSChamadoOcorrColaborador.ApplyUpdates(0);

          FModel.CDSChamadoOcorrenciaCons.Next;
        end;
      end;

      if FModel.CDSChamadoOcorrenciaCons.ChangeCount > 0 then
        FModel.CDSChamadoOcorrenciaCons.ApplyUpdates(0);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.SalvarOcorrencia');
      end;
    end;
  finally
    FModel.CDSChamadoOcorrenciaCons.EnableControls;
  end;
end;

function TChamadoController.StatusAbertura: string;
var
  Parametro: TParametrosController;
begin
  Parametro := TParametrosController.Create;
  try
    try
    Result := Parametro.StatusAbertura();
//    Result := Parametro.LocalizarParametro(9, 1);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.StatusAbertura');
      end;
    end;
  finally
    FreeAndNil(Parametro);
  end;
end;

function TChamadoController.StatusAberturaAtividade: string;
var
  Parametro: TParametrosController;
begin
  Parametro := TParametrosController.Create;
  try
    try
      Result := Parametro.StatusAberturaAtividade();
//    Result := Parametro.LocalizarParametro(31, 111);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.StatusAberturaAtividade');
      end;
    end;

  finally
    FreeAndNil(Parametro);
  end;
end;

function TChamadoController.StatusAtendimentoAtividade: string;
var
  Parametro: TParametrosController;
begin
  Parametro := TParametrosController.Create;
  try
    try
      Result := Parametro.StatusAtendimentoAtividade();
//    Result := Parametro.LocalizarParametro(32, 111);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.StatusAtendimentoAtividade');
      end;
    end;

  finally
    FreeAndNil(Parametro);
  end;
end;

function TChamadoController.StatusChamadoAtendimento: string;
var
  Parametro: TParametrosController;
begin
  Parametro := TParametrosController.Create;
  try
    try
      Result := Parametro.StatusChamadoAtendimento();
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.StatusChamadoAtendimento');
      end;
    end;
//    Result := Parametro.LocalizarParametro(10, 1);
  finally
    FreeAndNil(Parametro);
  end;
end;

procedure TChamadoController.TipoUmRegistro(ATipo: TEnumChamadoAtividade);
var
  obj: TTipoController;
  Model: TTipoVO;
begin
  obj := TTipoController.Create;
  try
    if ATipo = caChamado then
      Model := obj.RetornoUmRegistro(prChamado)
    else
      Model := obj.RetornoUmRegistro(prAtividade);

    if Model.Id > 0 then
    begin
      FModel.CDSCadastroCha_Tipo.AsInteger := Model.Id;
      FModel.CDSCadastroTip_Codigo.AsInteger := Model.Codigo;
      FModel.CDSCadastroTip_Nome.AsString := Model.Nome;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Model);
  end;
end;

procedure TChamadoController.UpdateHoraUsuarioAtual(AIdChamado: Integer;
  ATipo: TEnumChamadoAtividade);
var
  Negocio: TServerMethods1Client;
  sCodigoStatus: string;
  objStatus: TStatusController;
  IdStatus: string;
  sb: TStringBuilder;
  sHora: string;
begin
  if ATipo = caChamado then
    sCodigoStatus := StatusChamadoAtendimento()
  else
    sCodigoStatus := StatusAtendimentoAtividade();

  objStatus := TStatusController.Create;
  try
    try
      objStatus.LocalizarCodigo(StrToIntDef(sCodigoStatus, 0));
      IdStatus := IntToStr(objStatus.Model.CDSCadastroSta_Id.AsInteger);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.UpdateHoraUsuarioAtual');
      end;
    end;
  finally
    FreeAndNil(objStatus);
  end;

  if StrToIntDef(IdStatus, 0) = 0 then
    raise Exception.Create('Informe o Status Atendimento na Tabela de Par�metros !');

  sb := TStringBuilder.Create;

//  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      sHora := FormatDateTime('hh:mm', Time);
      sb.AppendLine(' UPDATE Chamado SET ');
//      sb.AppendLine('   Cha_HoraAtendeAtual = CAST(GETDATE() AS time)');
      sb.AppendLine('   Cha_HoraAtendeAtual = CAST(''' + sHora + ''' AS time)');
      sb.AppendLine('   ,Cha_Status = ' + IdStatus);
      sb.AppendLine('   ,Cha_UsuarioAtendeAtual = ' + IntToStr(dm.IdUsuario));
      sb.AppendLine(' WHERE Cha_Id = ' + IntToStr(AIdChamado));

      Negocio.ExecutarSQL(sb.ToString);
//      dm.Desconectar;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'TChamadoController.UpdateHoraUsuarioAtual_01');
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(sb);
  end;
end;

end.
