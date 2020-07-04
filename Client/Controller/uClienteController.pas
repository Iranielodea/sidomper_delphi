unit uClienteController;

interface

uses
  System.SysUtils, uDMCliente, uRegras, uEnumerador, uDM, Data.DB, uClienteEmailController,
    uClienteEspecificacaoController, uClienteModuloController, Vcl.Forms, uFiltroCliente,
    Data.DBXJSON , Data.DBXJSONReflect, System.Generics.Collections, uClienteVO,
  uChamadoOcorrenciaVO, uConverter, uClassValidacao, uContatoController,
  uContatoVO, uDMRelCliente, Vcl.Dialogs;

type
  TClienteController = class
  private
    FModel: TDMCliente;
    FOperacao: TOperacao;
    FClienteEmail: TClienteEmailController;
    FClienteEspecificacao: TClienteEspecificacaoController;
    FClienteModulo: TClienteModuloController;
    procedure SalvarEmail(AIdCliente: integer); overload;
    procedure SalvarModulo(AIdCliente: integer);

    procedure SalvarEmail(ACliente: TClienteVO); overload;
    procedure Post;
    function IdAtual: Integer;
    procedure ImpressaoHistorico(AIdCliente: Integer);
    function CalcularMediaFloat(AValor, ADivisor: Double): Double;
    function CalcularMediaInteira(AValor, ADivisor: Integer): Integer;

    procedure HistoricoChamado(AIdCliente: Integer; ALista: TObjectList<TChamadoOcorrenciaVO>);
    procedure HistoricoAtividade(AIdCliente: Integer; ALista: TObjectList<TChamadoOcorrenciaVO>);
    procedure HistoricoVisita(AIdCliente: Integer; ALista: TObjectList<TChamadoOcorrenciaVO>);
    procedure HistoricoSolicitacao(AIdCliente: Integer; ALista: TObjectList<TChamadoOcorrenciaVO>);
    procedure SalvarContato(ACliente: TClienteVO);
  public
    procedure Filtrar(AFiltro: TFiltroCliente; ACampo, ATexto, AAtivo: string; AIdUsuario: Integer; AContem: Boolean = False);
    procedure LocalizarId(AId: Integer);
    procedure FiltrarCodigo(ACodigo: Integer);
    procedure LocalizarCodigo(ACodigo: integer);
    procedure LocalizarCodigoCliente(ACodigo, AIdUsuario: Integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    procedure Salvar(AIdUsuario: Integer);
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    function ProximoId(): Integer;
    function ProximoCodigo(): Integer;
    procedure APesquisar(AId, ACodigo: Integer);
    function SalvarCliente(AIdUsuario: Integer): Integer;
    function SalvarTeste(): TClienteVO;
    function Localizar(AId: Integer): TClienteVO;
    procedure Historico(AIdCliente: Integer);
    function MascaraCodigo(ACodigo: string): string;
    function ListarArquivosLog(): TList<string>;
    procedure ImportarXML(ACliente: TClienteVO);
    procedure Relatorios(AModelo: Integer; AFiltro: TFiltroCliente);

    property Model: TDMCliente read FModel write FModel;
    property ClienteEmail: TClienteEmailController read FClienteEmail write FClienteEmail;
    property ClienteEspecificacao: TClienteEspecificacaoController read FClienteEspecificacao write FClienteEspecificacao;
    property ClienteModulo: TClienteModuloController read FClienteModulo write FClienteModulo;

    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TClienteController }

uses uFuncoesSIDomper, uParametrosController, uClienteEmailVO;

function TClienteController.CalcularMediaFloat(AValor, ADivisor: Double): Double;
begin
  try
    Result := AValor / ADivisor;
  except
    Result := 0;
  end;
end;

function TClienteController.CalcularMediaInteira(AValor,
  ADivisor: Integer): Integer;
begin
  try
    Result := AValor div ADivisor;
  except
    Result := 0;
  end;
end;

procedure TClienteController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

function TClienteController.IdAtual: Integer;
var
  Negocio: TServerMethods1Client;
begin
  dm.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := Negocio.RetornaIdAtual('Cliente');
  finally
    FreeAndNil(Negocio);
    dm.Desconectar;
  end;
end;

constructor TClienteController.Create;
begin
  inherited Create;
  FModel := TDMCliente.Create(nil);
  FClienteEmail := TClienteEmailController.Create;
  FClienteEspecificacao := TClienteEspecificacaoController.Create;
  FClienteModulo := TClienteModuloController.Create;
end;

destructor TClienteController.Destroy;
begin
  FreeAndNil(FClienteEmail);
  FreeAndNil(FClienteEspecificacao);
  FreeAndNil(FClienteModulo);
  FreeAndNil(FModel);
  inherited;
end;

procedure TClienteController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerMethods1Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Editar!');


  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado := Negocio.Editar(CClientePrograma, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    FClienteEmail.LocalizarCodigo(AId);
    FClienteEspecificacao.LocalizarCodigo(AId);
    FClienteModulo.LocalizarCodigo(AId);

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TClienteController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  if AId = 0 then
    raise Exception.Create('N�o h� Registro para Excluir!');

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CClientePrograma, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TClienteController.Filtrar(AFiltro: TFiltroCliente; ACampo, ATexto, AAtivo: string; AIdUsuario: Integer;
  AContem: Boolean);
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

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCliente(oObjetoJSON, CClientePrograma, AIdUsuario, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TClienteController.FiltrarCodigo(ACodigo: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.FiltrarCodigo(CClientePrograma, ACodigo);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TClienteController.Historico(
  AIdCliente: Integer);
var
  Negocio: TServerMethods1Client;
  Lista: TObjectList<TChamadoOcorrenciaVO>;
  Item: TChamadoOcorrenciaVO;
  bAchou: Boolean;

  iChamadoQtdeMeses: Integer;
  sChamadoMaiorMes: string;
  iChamadoMaiorQtde: Integer;
  iChamadoMaiorHoras: Double;

  sChamadoMenorMes: string;
  iChamadoMenorQtde: Integer;
  iChamadoMenorHoras: Double;

  iChamadoMediaQtde: Double;
  iChamadoTotalQtde: Integer;
  bChamadoTotalHoras: Double;

  iAtividadeQtdeMeses: Integer;
  bAtividadeTotalHoras: Double;
  iAtividadeTotalQtde: Integer;
  iAtividadeMaiorQtde: Integer;
  sAtividadeMaiorMes: string;
  iAtividadeMaiorHoras: Double;
  sAtividadeMenorMes: string;
  iAtividadeMenorQtde: Integer;
  iAtividadeMenorHoras: Double;

  iVisitaQtdeMeses: Integer;
  bVisitaTotalHoras: Double;
  iVisitaTotalQtde: Integer;
  iVisitaMaiorQtde: Integer;
  sVisitaMaiorMes: string;
  iVisitaMaiorHoras: Double;
  sVisitaMenorMes: string;
  iVisitaMenorQtde: Integer;
  iVisitaMenorHoras: Double;
  cVisitaMaiorValor: Currency;
  cVisitaMenorValor: Currency;
  cVisitaTotalValor: Currency;

  iSolicitacaoQtdeMeses: Integer;
  bSolicitacaoTotalHoras: Double;
  iSolicitacaoTotalQtde: Integer;
  iSolicitacaoMaiorQtde: Integer;
  sSolicitacaoMaiorMes: string;
  iSolicitacaoMaiorHoras: Double;
  sSolicitacaoMenorMes: string;
  iSolicitacaoMenorQtde: Integer;
  iSolicitacaoMenorHoras: Double;
begin
  FModel.cdsHistorico.First;
  while not FModel.cdsHistorico.Eof do
    FModel.cdsHistorico.Delete;

  FModel.cdsHistorico.IndexFieldNames := 'Tipo';

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Lista := TConverte.JSONToObject<TListaChamadoOcorrencia>(Negocio.ClienteHistorico(AIdCliente));
    HistoricoChamado(AIdCliente, Lista);
    HistoricoAtividade(AIdCliente, Lista);
    HistoricoVisita(AIdCliente, Lista);
    HistoricoSolicitacao(AIdCliente, Lista);

    ImpressaoHistorico(AIdCliente);

    FModel.RelHistorico.Print;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Lista);
  end;

//    iChamadoQtdeMeses := 0;
//    sChamadoMaiorMes := '';
//    iChamadoMaiorQtde := 0;
//    iChamadoMaiorHoras := 0;
//
//    sChamadoMenorMes := '';
//    iChamadoMenorQtde := 99999;
//    iChamadoMenorHoras := 0;
//
//    iChamadoMediaQtde := 0;
//    iChamadoTotalQtde := 0;
//    bChamadoTotalHoras := 0;
//
//    iAtividadeMaiorQtde := 0;
//    iAtividadeQtdeMeses := 0;
//    bAtividadeTotalHoras := 0;
//    iAtividadeTotalQtde := 0;
//    iAtividadeMaiorQtde := 0;
//    sAtividadeMaiorMes := '';
//    iAtividadeMaiorHoras := 0;
//    sAtividadeMenorMes := '';
//    iAtividadeMenorQtde := 99999;
//    iAtividadeMenorHoras := 0;
//
//    iVisitaMaiorQtde := 0;
//    iVisitaQtdeMeses := 0;
//    bVisitaTotalHoras := 0;
//    iVisitaTotalQtde := 0;
//    iVisitaMaiorQtde := 0;
//    sVisitaMaiorMes := '';
//    iVisitaMaiorHoras := 0;
//    sVisitaMenorMes := '';
//    iVisitaMenorQtde := 99999;
//    iVisitaMenorHoras := 0;
//    cVisitaMaiorValor := 0;
//    cVisitaMenorValor := 0;
//    cVisitaTotalValor := 0;
//
//    iSolicitacaoMaiorQtde := 0;
//    iSolicitacaoQtdeMeses := 0;
//    bSolicitacaoTotalHoras := 0;
//    iSolicitacaoTotalQtde := 0;
//    iSolicitacaoMaiorQtde := 0;
//    sSolicitacaoMaiorMes := '';
//    iSolicitacaoMaiorHoras := 0;
//    sSolicitacaoMenorMes := '';
//    iSolicitacaoMenorQtde := 99999;
//    iSolicitacaoMenorHoras := 0;
//
//
//    for Item in Lista do
//    begin
//      bAchou := False;
//      if (Item.Docto = 'CHA') then
//      begin
//        if FModel.cdsHistorico.Locate('TIPO', '1',[]) then
//          bAchou := True;
//      end;
//
//      if (Item.Docto = 'CCO') then
//      begin
//        if FModel.cdsHistorico.Locate('TIPO', '1',[]) then
//          bAchou := True;
//      end;
//
//      if (Item.Docto = 'ATI') then
//      begin
//        if FModel.cdsHistorico.Locate('TIPO', '2',[]) then
//          bAchou := True;
//      end;
//
//      if (Item.Docto = 'CAT') then
//      begin
//        if FModel.cdsHistorico.Locate('TIPO', '2',[]) then
//          bAchou := True;
//      end;
//
//      if (Item.Docto = 'VIS') then
//      begin
//        if FModel.cdsHistorico.Locate('TIPO', '3',[]) then
//          bAchou := True;
//      end;
//
//      if (Item.Docto = 'SOL') then
//      begin
//        if FModel.cdsHistorico.Locate('TIPO', '4',[]) then
//          bAchou := True;
//      end;
//
//      if bAchou then
//        FModel.cdsHistorico.Edit
//      else
//        FModel.cdsHistorico.Append;
//
//      if Item.Docto = 'CCO' then
//        bChamadoTotalHoras := bChamadoTotalHoras + Item.TotalHoras;
//
//      if Item.Docto = 'CAT' then
//        bAtividadeTotalHoras := bAtividadeTotalHoras + Item.TotalHoras;
//
//      if (Item.Docto = 'CHA') then
//      begin
//        Inc(iChamadoQtdeMeses);
//        bChamadoTotalHoras := bChamadoTotalHoras + Item.TotalHoras;
//        iChamadoTotalQtde  := iChamadoTotalQtde + Item.Qtde;
//
//        FModel.cdsHistoricoTipo.AsInteger := 1;
//        FModel.cdsHistoricoOpcao.AsString := 'CHAMADO';
//        FModel.cdsHistoricoDescricao.AsString := 'Qtde Meses: ' + IntToStr(iChamadoQtdeMeses);
//
//        if Item.Qtde > iChamadoMaiorQtde then
//        begin
//          sChamadoMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
//          iChamadoMaiorQtde := Item.Qtde;
//          iChamadoMaiorHoras:= Item.TotalHoras;
//        end;
//
//        if Item.Qtde < iChamadoMenorQtde then
//        begin
//          sChamadoMenorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
//          iChamadoMenorQtde := Item.Qtde;
//          iChamadoMenorHoras := Item.TotalHoras;
//        end;
//
//      end;
//      if (Item.Docto = 'ATI') then
//      begin
//
//        Inc(iAtividadeQtdeMeses);
//        bAtividadeTotalHoras := bAtividadeTotalHoras + Item.TotalHoras;
//        iAtividadeTotalQtde  := iAtividadeTotalQtde + Item.Qtde;
//
//        FModel.cdsHistoricoTipo.AsInteger := 2;
//        FModel.cdsHistoricoOpcao.AsString := 'ATIVIDADE';
//        FModel.cdsHistoricoDescricao.AsString := 'Qtde Meses: ' + IntToStr(iAtividadeQtdeMeses);
//
//        if Item.Qtde > iAtividadeMaiorQtde then
//        begin
//          sAtividadeMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
//          iAtividadeMaiorQtde := Item.Qtde;
//          iAtividadeMaiorHoras:= Item.TotalHoras;
//        end;
//
//        if Item.Qtde < iAtividadeMenorQtde then
//        begin
//          sAtividadeMenorMes    :=  FormatDateTime('mm/yyyy',Item.Data);
//          iAtividadeMenorQtde   := Item.Qtde;
//          iAtividadeMenorHoras  := Item.TotalHoras;
//        end;
//
//      end;
//
//      if Item.Docto = 'VIS' then
//      begin
//        Inc(iVisitaQtdeMeses);
//        bVisitaTotalHoras := bVisitaTotalHoras + Item.TotalHoras;
//        iVisitaTotalQtde  := iVisitaTotalQtde + Item.Qtde;
//        cVisitaTotalValor := cVisitaTotalValor + Item.Valor;
//
//        FModel.cdsHistoricoTipo.AsInteger := 3;
//        FModel.cdsHistoricoOpcao.AsString := 'VISITA';
//        FModel.cdsHistoricoDescricao.AsString := 'Qtde Meses: ' + IntToStr(iVisitaQtdeMeses);
//
//        if Item.Qtde > iVisitaMaiorQtde then
//        begin
//          sVisitaMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
//          iVisitaMaiorQtde := Item.Qtde;
//          iVisitaMaiorHoras:= Item.TotalHoras;
//          cVisitaMaiorValor := Item.Valor;
//        end;
//
//        if Item.Qtde < iVisitaMenorQtde then
//        begin
//          sVisitaMenorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
//          iVisitaMenorQtde := Item.Qtde;
//          iVisitaMenorHoras := Item.TotalHoras;
//          cVisitaMenorValor := Item.Valor;
//        end;
//
//      end;
//
//      if Item.Docto = 'SOL' then
//      begin
//        Inc(iSolicitacaoQtdeMeses);
//        bSolicitacaoTotalHoras := bSolicitacaoTotalHoras + Item.TotalHoras;
//        iSolicitacaoTotalQtde  := iSolicitacaoTotalQtde + Item.Qtde;
//
//        FModel.cdsHistoricoTipo.AsInteger := 4;
//        FModel.cdsHistoricoOpcao.AsString := 'SOLICITA��O';
//        FModel.cdsHistoricoDescricao.AsString := 'Qtde Meses: ' + IntToStr(iSolicitacaoQtdeMeses);
//
//        if Item.Qtde > iSolicitacaoMaiorQtde then
//        begin
//          sSolicitacaoMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
//          iSolicitacaoMaiorQtde := Item.Qtde;
//          iSolicitacaoMaiorHoras:= Item.TotalHoras;
//        end;
//
//        if Item.Qtde < iSolicitacaoMenorQtde then
//        begin
//          sSolicitacaoMenorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
//          iSolicitacaoMenorQtde := Item.Qtde;
//          iSolicitacaoMenorHoras := Item.TotalHoras;
//        end;
//      end;
//
//      if bAchou then
//      begin
//        FModel.cdsHistoricoQtde.AsInteger     := FModel.cdsHistoricoQtde.AsInteger + Item.Qtde;
//        FModel.cdsHistoricoTotalHoras.AsFloat := FModel.cdsHistoricoTotalHoras.AsFloat + Item.TotalHoras;
//        FModel.cdsHistoricoValor.AsFloat      := FModel.cdsHistoricoValor.AsFloat + Item.Valor;
//      end
//      else begin
//        FModel.cdsHistoricoQtde.AsInteger     := Item.Qtde;
//        FModel.cdsHistoricoTotalHoras.AsFloat := Item.TotalHoras;
//        FModel.cdsHistoricoValor.AsFloat      := Item.Valor;
//      end;
//
//      FModel.cdsHistorico.Post;
//    end;
//  finally
//    FreeAndNil(Negocio);
//  end;
//
//  if iChamadoMaiorQtde > 0 then
//  begin
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 1;
//    FModel.cdsHistoricoMes.AsString := sChamadoMaiorMes;
//    FModel.cdsHistoricoQtde.AsInteger := iChamadoMaiorQtde;
//    FModel.cdsHistoricoTotalHoras.AsFloat := iChamadoMaiorHoras;
//    FModel.cdsHistoricoOpcao.AsString := 'CHAMADO';
//    FModel.cdsHistoricoDescricao.AsString := 'Maior M�s:  ' + sChamadoMaiorMes;
//    FModel.cdsHistorico.Post;
//  end;
//
//  if (iChamadoMenorQtde > 0) and (sChamadoMenorMes.Trim <> '') then
//  begin
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 1;
//    FModel.cdsHistoricoMes.AsString := sChamadoMenorMes;
//    FModel.cdsHistoricoQtde.AsInteger := iChamadoMenorQtde;
//    FModel.cdsHistoricoTotalHoras.AsFloat := iChamadoMenorHoras;
//    FModel.cdsHistoricoOpcao.AsString := 'CHAMADO';
//    FModel.cdsHistoricoDescricao.AsString := 'Menor M�s:  ' + sChamadoMenorMes;
//    FModel.cdsHistorico.Post;
//
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 1;
//    FModel.cdsHistoricoMes.AsString := sChamadoMenorMes;
//
//    FModel.cdsHistoricoQtde.AsInteger := CalcularMediaInteira(iChamadoTotalQtde, iChamadoQtdeMeses);
//    FModel.cdsHistoricoTotalHoras.AsFloat := CalcularMediaFloat(bChamadoTotalHoras, iChamadoQtdeMeses);
//    FModel.cdsHistoricoOpcao.AsString := 'CHAMADO';
//    FModel.cdsHistoricoDescricao.AsString := 'M�dia:  ';
//    FModel.cdsHistorico.Post;
//  end;
//
//  if iAtividadeMaiorQtde > 0 then
//  begin
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 2;
//    FModel.cdsHistoricoMes.AsString := sAtividadeMaiorMes;
//    FModel.cdsHistoricoQtde.AsInteger := iAtividadeMaiorQtde;
//    FModel.cdsHistoricoTotalHoras.AsFloat := iAtividadeMaiorHoras;
//    FModel.cdsHistoricoOpcao.AsString := 'ATIVIDADE';
//    FModel.cdsHistoricoDescricao.AsString := 'Maior M�s:  ' + sAtividadeMaiorMes;
//    FModel.cdsHistorico.Post;
//  end;
//
//  if (iAtividadeMenorQtde > 0) and (sAtividadeMenorMes.Trim <> '') then
//  begin
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 2;
//    FModel.cdsHistoricoMes.AsString := sAtividadeMenorMes;
//    FModel.cdsHistoricoQtde.AsInteger := iAtividadeMenorQtde;
//    FModel.cdsHistoricoTotalHoras.AsFloat := iAtividadeMenorHoras;
//    FModel.cdsHistoricoOpcao.AsString := 'ATIVIDADE';
//    FModel.cdsHistoricoDescricao.AsString := 'Menor M�s:  ' + sAtividadeMenorMes;
//    FModel.cdsHistorico.Post;
//
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 2;
//    FModel.cdsHistoricoMes.AsString := sAtividadeMenorMes;
//    FModel.cdsHistoricoQtde.AsInteger := CalcularMediaInteira(iAtividadeTotalQtde, iAtividadeQtdeMeses);
//    FModel.cdsHistoricoTotalHoras.AsFloat := CalcularMediaFloat(bAtividadeTotalHoras, iAtividadeQtdeMeses);
//    FModel.cdsHistoricoOpcao.AsString := 'ATIVIDADE';
//    FModel.cdsHistoricoDescricao.AsString := 'M�dia:  ';
//    FModel.cdsHistorico.Post;
//  end;
//
//  if iVisitaMaiorQtde > 0 then
//  begin
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 3;
//    FModel.cdsHistoricoMes.AsString := sVisitaMaiorMes;
//    FModel.cdsHistoricoQtde.AsInteger := iVisitaMaiorQtde;
//    FModel.cdsHistoricoTotalHoras.AsFloat := iVisitaMaiorHoras;
//    FModel.cdsHistoricoValor.AsFloat := cVisitaMaiorValor;
//    FModel.cdsHistoricoOpcao.AsString := 'VISITA';
//    FModel.cdsHistoricoDescricao.AsString := 'Maior M�s:  ' + sVisitaMaiorMes;
//    FModel.cdsHistorico.Post;
//  end;
//
//  if (iVisitaMenorQtde > 0) and (sVisitaMenorMes.Trim <> '') then
//  begin
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 3;
//    FModel.cdsHistoricoMes.AsString := sVisitaMenorMes;
//    FModel.cdsHistoricoQtde.AsInteger := iVisitaMenorQtde;
//    FModel.cdsHistoricoTotalHoras.AsFloat := iVisitaMenorHoras;
//    FModel.cdsHistoricoValor.AsFloat := cVisitaMenorValor;
//    FModel.cdsHistoricoOpcao.AsString := 'VISITA';
//    FModel.cdsHistoricoDescricao.AsString := 'Menor M�s:  ' + sVisitaMenorMes;
//    FModel.cdsHistorico.Post;
//
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 3;
//    FModel.cdsHistoricoMes.AsString := sVisitaMenorMes;
//    FModel.cdsHistoricoQtde.AsInteger := CalcularMediaInteira(iVisitaTotalQtde, iVisitaQtdeMeses);
//    FModel.cdsHistoricoTotalHoras.AsFloat := CalcularMediaFloat(bVisitaTotalHoras, iVisitaQtdeMeses);
//    FModel.cdsHistoricoValor.AsFloat := CalcularMediaFloat(cVisitaTotalValor, iVisitaQtdeMeses);
//    FModel.cdsHistoricoOpcao.AsString := 'VISITA';
//    FModel.cdsHistoricoDescricao.AsString := 'M�dia:  ';
//    FModel.cdsHistorico.Post;
//  end;
//
//  if iSolicitacaoMaiorQtde > 0 then
//  begin
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 4;
//    FModel.cdsHistoricoMes.AsString := sSolicitacaoMaiorMes;
//    FModel.cdsHistoricoQtde.AsInteger := iSolicitacaoMaiorQtde;
//    FModel.cdsHistoricoTotalHoras.AsFloat := iSolicitacaoMaiorHoras;
//    FModel.cdsHistoricoOpcao.AsString := 'SOLICITA��O';
//    FModel.cdsHistoricoDescricao.AsString := 'Maior M�s:  ' + sSolicitacaoMaiorMes;
//    FModel.cdsHistorico.Post;
//  end;
//
//  if (iSolicitacaoMenorQtde > 0) and (sSolicitacaoMenorMes.Trim <> '') then
//  begin
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 4;
//    FModel.cdsHistoricoMes.AsString := sSolicitacaoMenorMes;
//    FModel.cdsHistoricoQtde.AsInteger := iSolicitacaoMenorQtde;
//    FModel.cdsHistoricoTotalHoras.AsFloat := iSolicitacaoMenorHoras;
//    FModel.cdsHistoricoOpcao.AsString := 'SOLICITA��O';
//    FModel.cdsHistoricoDescricao.AsString := 'Menor M�s:  ' + sSolicitacaoMenorMes;
//    FModel.cdsHistorico.Post;
//
//    FModel.cdsHistorico.Append;
//    FModel.cdsHistoricoTipo.AsInteger := 4;
//    FModel.cdsHistoricoMes.AsString := sSolicitacaoMenorMes;
//    FModel.cdsHistoricoQtde.AsInteger := CalcularMediaInteira(iSolicitacaoTotalQtde, iSolicitacaoQtdeMeses);
//    FModel.cdsHistoricoTotalHoras.AsFloat := CalcularMediaFloat(bSolicitacaoTotalHoras, iSolicitacaoQtdeMeses);
//    FModel.cdsHistoricoOpcao.AsString := 'SOLICITA��O';
//    FModel.cdsHistoricoDescricao.AsString := 'M�dia: ';
//    FModel.cdsHistorico.Post;
//  end;

//  ImpressaoHistorico(AIdCliente);
//
//
//  FModel.RelHistorico.Print;
end;

procedure TClienteController.HistoricoAtividade(AIdCliente: Integer;
  ALista: TObjectList<TChamadoOcorrenciaVO>);
var
  Item: TChamadoOcorrenciaVO;

  bAchou: Boolean;
  iQtdeMeses: Integer;
  cTotalHoras: Double;
  iTotalQtde: Integer;
  dDataAtual: TDate;

  iMaiorQtde: Integer;
  sMaiorMes: string;
  iMaiorHoras: Double;

  iMenorQtde: Integer;
  sMenorMes: string;
  iMenorHoras: Double;

  iAtualQtde: Integer;
  cAtualHoras: Double;

begin
  dDataAtual := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));
//  dDataAtual := StrToDate('01/09/2016');
  bAchou := False;
  iQtdeMeses  := 0;
  cTotalHoras := 0;
  iTotalQtde  := 0;

  iMaiorQtde  := 0;
  sMaiorMes := '';
  iMaiorHoras := 0;

  iMenorQtde  := 99999;
  sMenorMes   := '';
  iMenorHoras := 999999;

  iAtualQtde  := 0;
  cAtualHoras := 0;

  for Item in ALista do
  begin
    if (Item.Docto = 'ATI') or (Item.Docto = 'CAT') then
    begin
      if Item.Data = dDataAtual then
      begin
        cAtualHoras := cAtualHoras + Item.TotalHoras;

        if Item.Docto = 'ATI' then
          iAtualQtde := iAtualQtde + Item.Qtde;
      end;

      if FModel.cdsHistorico.Locate('TIPO', '2',[]) then
      begin
        bAchou := True;
        FModel.cdsHistorico.Edit;
      end
      else begin
        bAchou := False;
        FModel.cdsHistorico.Append;
        FModel.cdsHistoricoTipo.AsInteger := 2;
        FModel.cdsHistoricoOpcao.AsString := 'ATIVIDADE';
      end;

      if (Item.Docto = 'ATI') then
      begin
        Inc(iQtdeMeses);
        cTotalHoras := cTotalHoras + Item.TotalHoras;
        iTotalQtde  := iTotalQtde + Item.Qtde;

        FModel.cdsHistoricoDescricao.AsString := 'Qtde Meses: ' + IntToStr(iQtdeMeses);

        if (Item.Qtde > iMaiorQtde) then
        begin
          sMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
          iMaiorQtde := Item.Qtde;
          iMaiorHoras:= Item.TotalHoras;
        end
        else begin
          if (Item.Qtde = iMaiorQtde) and (Item.TotalHoras >= iMaiorHoras) then
          begin
            sMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
            iMaiorQtde := Item.Qtde;
            iMaiorHoras:= Item.TotalHoras;
          end;
        end;

        if (Item.Qtde <= iMenorQtde) and (Item.TotalHoras <= iMenorHoras) then
        begin
          sMenorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
          iMenorQtde := Item.Qtde;
          iMenorHoras := Item.TotalHoras;
        end
      end;

      if bAchou then
      begin
        FModel.cdsHistoricoQtde.AsInteger     := FModel.cdsHistoricoQtde.AsInteger + Item.Qtde;
        FModel.cdsHistoricoTotalHoras.AsFloat := FModel.cdsHistoricoTotalHoras.AsFloat + Item.TotalHoras;
        FModel.cdsHistoricoValor.AsFloat      := FModel.cdsHistoricoValor.AsFloat + Item.Valor;
      end
      else begin
        FModel.cdsHistoricoQtde.AsInteger     := Item.Qtde;
        FModel.cdsHistoricoTotalHoras.AsFloat := Item.TotalHoras;
        FModel.cdsHistoricoValor.AsFloat      := Item.Valor;
      end;
      FModel.cdsHistorico.Post;
    end;
  end;

  if iMaiorQtde > 0 then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 2;
    FModel.cdsHistoricoMes.AsString := sMaiorMes;
    FModel.cdsHistoricoQtde.AsInteger := iMaiorQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := iMaiorHoras;
    FModel.cdsHistoricoOpcao.AsString := 'ATIVIDADE';
    FModel.cdsHistoricoDescricao.AsString := 'Maior M�s:  ' + sMaiorMes;
    FModel.cdsHistorico.Post;
  end;

  if (iMenorQtde > 0) and (sMenorMes.Trim <> '') then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 2;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsInteger := iMenorQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := iMenorHoras;
    FModel.cdsHistoricoOpcao.AsString := 'ATIVIDADE';
    FModel.cdsHistoricoDescricao.AsString := 'Menor M�s:  ' + sMenorMes;
    FModel.cdsHistorico.Post;
// m�dia
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 2;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsString := FormatFloat(',##0.00',CalcularMediaFloat(iTotalQtde, iQtdeMeses));
    FModel.cdsHistoricoTotalHoras.AsFloat := CalcularMediaFloat(cTotalHoras, iQtdeMeses);
    FModel.cdsHistoricoOpcao.AsString := 'ATIVIDADE';
    FModel.cdsHistoricoDescricao.AsString := 'M�dia:  ';
    FModel.cdsHistorico.Post;
  end;

  if iAtualQtde > 0 then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 2;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsInteger := iAtualQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := cAtualHoras;
    FModel.cdsHistoricoOpcao.AsString := 'ATIVIDADE';
    FModel.cdsHistoricoDescricao.AsString := 'M�s Atual:  ' + FormatDateTime('mm/yyyy', Date);
    FModel.cdsHistorico.Post;
  end;
end;

procedure TClienteController.HistoricoChamado(AIdCliente: Integer;
  ALista: TObjectList<TChamadoOcorrenciaVO>);
var
  Item: TChamadoOcorrenciaVO;

  bAchou: Boolean;
  iQtdeMeses: Integer;
  cTotalHoras: Double;
  iTotalQtde: Integer;
  dDataAtual: TDate;

  iMaiorQtde: Integer;
  sMaiorMes: string;
  iMaiorHoras: Double;

  iMenorQtde: Integer;
  sMenorMes: string;
  iMenorHoras: Double;

  iAtualQtde: Integer;
  cAtualHoras: Double;

begin
  dDataAtual := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));
//  dDataAtual := StrToDate('01/09/2016');

  bAchou := False;
  iQtdeMeses  := 0;
  cTotalHoras := 0;
  iTotalQtde  := 0;

  iMaiorQtde  := 0;
  sMaiorMes := '';
  iMaiorHoras := 0;

  iMenorQtde  := 99999;
  sMenorMes   := '';
  iMenorHoras := 999999;

  iAtualQtde  := 0;
  cAtualHoras := 0;

  for Item in ALista do
  begin
    if (Item.Docto = 'CHA') or (Item.Docto = 'CCO') then
    begin
      if Item.Data = dDataAtual then
      begin
        cAtualHoras := cAtualHoras + Item.TotalHoras;

        if Item.Docto = 'CHA' then
          iAtualQtde := iAtualQtde + Item.Qtde;
      end;

      if FModel.cdsHistorico.Locate('TIPO', '1',[]) then
      begin
        bAchou := True;
        FModel.cdsHistorico.Edit;
      end
      else begin
        bAchou := False;
        FModel.cdsHistorico.Append;
        FModel.cdsHistoricoTipo.AsInteger := 1;
        FModel.cdsHistoricoOpcao.AsString := 'CHAMADO';
      end;

      if (Item.Docto = 'CHA') then
      begin
        Inc(iQtdeMeses);
        cTotalHoras := cTotalHoras + Item.TotalHoras;
        iTotalQtde  := iTotalQtde + Item.Qtde;

        FModel.cdsHistoricoDescricao.AsString := 'Qtde Meses: ' + IntToStr(iQtdeMeses);

        if (Item.Qtde > iMaiorQtde) then
        begin
          sMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
          iMaiorQtde := Item.Qtde;
          iMaiorHoras:= Item.TotalHoras;
        end
        else begin
          if (Item.Qtde = iMaiorQtde) and (Item.TotalHoras >= iMaiorHoras) then
          begin
            sMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
            iMaiorQtde := Item.Qtde;
            iMaiorHoras:= Item.TotalHoras;
          end;
        end;

        if (Item.Qtde <= iMenorQtde) and (Item.TotalHoras <= iMenorHoras) then
        begin
          sMenorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
          iMenorQtde := Item.Qtde;
          iMenorHoras := Item.TotalHoras;
        end
      end;

      if bAchou then
      begin
        FModel.cdsHistoricoQtde.AsInteger     := FModel.cdsHistoricoQtde.AsInteger + Item.Qtde;
        FModel.cdsHistoricoTotalHoras.AsFloat := FModel.cdsHistoricoTotalHoras.AsFloat + Item.TotalHoras;
        FModel.cdsHistoricoValor.AsFloat      := FModel.cdsHistoricoValor.AsFloat + Item.Valor;
      end
      else begin
        FModel.cdsHistoricoQtde.AsInteger     := Item.Qtde;
        FModel.cdsHistoricoTotalHoras.AsFloat := Item.TotalHoras;
        FModel.cdsHistoricoValor.AsFloat      := Item.Valor;
      end;
      FModel.cdsHistorico.Post;
    end;
  end;

  if iMaiorQtde > 0 then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 1;
    FModel.cdsHistoricoMes.AsString := sMaiorMes;
    FModel.cdsHistoricoQtde.AsInteger := iMaiorQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := iMaiorHoras;
    FModel.cdsHistoricoOpcao.AsString := 'CHAMADO';
    FModel.cdsHistoricoDescricao.AsString := 'Maior M�s:  ' + sMaiorMes;
    FModel.cdsHistorico.Post;
  end;

  if (iMenorQtde > 0) and (sMenorMes.Trim <> '') then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 1;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsInteger := iMenorQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := iMenorHoras;
    FModel.cdsHistoricoOpcao.AsString := 'CHAMADO';
    FModel.cdsHistoricoDescricao.AsString := 'Menor M�s:  ' + sMenorMes;
    FModel.cdsHistorico.Post;
// m�dia
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 1;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsString := FormatFloat(',##0.00',CalcularMediaFloat(iTotalQtde, iQtdeMeses));
    FModel.cdsHistoricoTotalHoras.AsFloat := CalcularMediaFloat(cTotalHoras, iQtdeMeses);
    FModel.cdsHistoricoOpcao.AsString := 'CHAMADO';
    FModel.cdsHistoricoDescricao.AsString := 'M�dia:  ';
    FModel.cdsHistorico.Post;
  end;

  if iAtualQtde > 0 then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 1;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsInteger := iAtualQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := cAtualHoras;
    FModel.cdsHistoricoOpcao.AsString := 'CHAMADO';
    FModel.cdsHistoricoDescricao.AsString := 'M�s Atual:  ' + FormatDateTime('mm/yyyy', Date);
    FModel.cdsHistorico.Post;
  end;
end;

procedure TClienteController.HistoricoSolicitacao(AIdCliente: Integer;
  ALista: TObjectList<TChamadoOcorrenciaVO>);
var
  Item: TChamadoOcorrenciaVO;

  bAchou: Boolean;
  iQtdeMeses: Integer;
  cTotalHoras: Double;
  iTotalQtde: Integer;
  dDataAtual: TDate;

  iMaiorQtde: Integer;
  sMaiorMes: string;
  iMaiorHoras: Double;

  iMenorQtde: Integer;
  sMenorMes: string;
  iMenorHoras: Double;

  iAtualQtde: Integer;
  cAtualHoras: Double;

begin
  dDataAtual := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));
//  dDataAtual := StrToDate('01/09/2016');

  bAchou := False;
  iQtdeMeses  := 0;
  cTotalHoras := 0;
  iTotalQtde  := 0;

  iMaiorQtde  := 0;
  sMaiorMes := '';
  iMaiorHoras := 0;

  iMenorQtde  := 99999;
  sMenorMes   := '';
  iMenorHoras := 999999;

  iAtualQtde  := 0;
  cAtualHoras := 0;

  for Item in ALista do
  begin
    if (Item.Docto = 'SOL') or (Item.Docto = 'CSO') then
    begin
      if Item.Data = dDataAtual then
      begin
        cAtualHoras := cAtualHoras + Item.TotalHoras;

        if Item.Docto = 'SOL' then
          iAtualQtde := iAtualQtde + Item.Qtde;
      end;

      if FModel.cdsHistorico.Locate('TIPO', '4',[]) then
      begin
        bAchou := True;
        FModel.cdsHistorico.Edit;
      end
      else begin
        bAchou := False;
        FModel.cdsHistorico.Append;
        FModel.cdsHistoricoTipo.AsInteger := 4;
        FModel.cdsHistoricoOpcao.AsString := 'SOLICITA��O';
      end;

      if (Item.Docto = 'SOL') then
      begin
        Inc(iQtdeMeses);
        cTotalHoras := cTotalHoras + Item.TotalHoras;
        iTotalQtde  := iTotalQtde + Item.Qtde;

        FModel.cdsHistoricoDescricao.AsString := 'Qtde Meses: ' + IntToStr(iQtdeMeses);

        if (Item.Qtde > iMaiorQtde) then
        begin
          sMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
          iMaiorQtde := Item.Qtde;
          iMaiorHoras:= Item.TotalHoras;
        end
        else begin
          if (Item.Qtde = iMaiorQtde) and (Item.TotalHoras >= iMaiorHoras) then
          begin
            sMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
            iMaiorQtde := Item.Qtde;
            iMaiorHoras:= Item.TotalHoras;
          end;
        end;

        if (Item.Qtde <= iMenorQtde) and (Item.TotalHoras <= iMenorHoras) then
        begin
          sMenorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
          iMenorQtde := Item.Qtde;
          iMenorHoras := Item.TotalHoras;
        end
      end;

      if bAchou then
      begin
        FModel.cdsHistoricoQtde.AsInteger     := FModel.cdsHistoricoQtde.AsInteger + Item.Qtde;
        FModel.cdsHistoricoTotalHoras.AsFloat := FModel.cdsHistoricoTotalHoras.AsFloat + Item.TotalHoras;
        FModel.cdsHistoricoValor.AsFloat      := FModel.cdsHistoricoValor.AsFloat + Item.Valor;
      end
      else begin
        FModel.cdsHistoricoQtde.AsInteger     := Item.Qtde;
        FModel.cdsHistoricoTotalHoras.AsFloat := Item.TotalHoras;
        FModel.cdsHistoricoValor.AsFloat      := Item.Valor;
      end;
      FModel.cdsHistorico.Post;
    end;
  end;

  if iMaiorQtde > 0 then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 4;
    FModel.cdsHistoricoMes.AsString := sMaiorMes;
    FModel.cdsHistoricoQtde.AsInteger := iMaiorQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := iMaiorHoras;
    FModel.cdsHistoricoOpcao.AsString := 'SOLICITA��O';
    FModel.cdsHistoricoDescricao.AsString := 'Maior M�s:  ' + sMaiorMes;
    FModel.cdsHistorico.Post;
  end;

  if (iMenorQtde > 0) and (sMenorMes.Trim <> '') then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 4;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsInteger := iMenorQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := iMenorHoras;
    FModel.cdsHistoricoOpcao.AsString := 'SOLICITA��O';
    FModel.cdsHistoricoDescricao.AsString := 'Menor M�s:  ' + sMenorMes;
    FModel.cdsHistorico.Post;
// m�dia
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 4;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsString := FormatFloat(',##0.00',CalcularMediaFloat(iTotalQtde, iQtdeMeses));
    FModel.cdsHistoricoTotalHoras.AsFloat := CalcularMediaFloat(cTotalHoras, iQtdeMeses);
    FModel.cdsHistoricoOpcao.AsString := 'SOLICITA��O';
    FModel.cdsHistoricoDescricao.AsString := 'M�dia:  ';
    FModel.cdsHistorico.Post;
  end;

  if iAtualQtde > 0 then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 4;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsInteger := iAtualQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := cAtualHoras;
    FModel.cdsHistoricoOpcao.AsString := 'SOLICITA��O';
    FModel.cdsHistoricoDescricao.AsString := 'M�s Atual:  ' + FormatDateTime('mm/yyyy', Date);
    FModel.cdsHistorico.Post;
  end;
end;

procedure TClienteController.HistoricoVisita(AIdCliente: Integer;
  ALista: TObjectList<TChamadoOcorrenciaVO>);
var
  Item: TChamadoOcorrenciaVO;

  bAchou: Boolean;
  iQtdeMeses: Integer;
  cTotalHoras: Double;
  iTotalQtde: Integer;
  dDataAtual: TDate;

  iMaiorQtde: Integer;
  sMaiorMes: string;
  iMaiorHoras: Double;

  iMenorQtde: Integer;
  sMenorMes: string;
  iMenorHoras: Double;

  iAtualQtde: Integer;
  cAtualHoras: Double;
  cValor: Currency;

begin
  dDataAtual := StrToDate('01/' + FormatDateTime('mm/yyyy', Date));
//  dDataAtual := StrToDate('01/08/2016');

  bAchou := False;
  iQtdeMeses  := 0;
  cTotalHoras := 0;
  iTotalQtde  := 0;

  iMaiorQtde  := 0;
  sMaiorMes := '';
  iMaiorHoras := 0;

  iMenorQtde  := 99999;
  sMenorMes   := '';
  iMenorHoras := 9999999;

  iAtualQtde  := 0;
  cAtualHoras := 0;
  cValor := 0;

  for Item in ALista do
  begin
    if (Item.Docto = 'VIS') then
    begin
      if Item.Data = dDataAtual then
      begin
        cAtualHoras := cAtualHoras + Item.TotalHoras;
        iAtualQtde := iAtualQtde + Item.Qtde;
      end;

      if FModel.cdsHistorico.Locate('TIPO', '3',[]) then
      begin
        bAchou := True;
        FModel.cdsHistorico.Edit;
      end
      else begin
        bAchou := False;
        FModel.cdsHistorico.Append;
        FModel.cdsHistoricoTipo.AsInteger := 3;
        FModel.cdsHistoricoOpcao.AsString := 'VISITA';
      end;

      Inc(iQtdeMeses);
      cTotalHoras := cTotalHoras + Item.TotalHoras;
      iTotalQtde  := iTotalQtde + Item.Qtde;

      FModel.cdsHistoricoDescricao.AsString := 'Qtde Meses: ' + IntToStr(iQtdeMeses);

      if (Item.Qtde > iMaiorQtde) then
      begin
        sMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
        iMaiorQtde := Item.Qtde;
        iMaiorHoras:= Item.TotalHoras;
      end
      else begin
        if (Item.Qtde = iMaiorQtde) and (Item.TotalHoras >= iMaiorHoras) then
        begin
          sMaiorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
          iMaiorQtde := Item.Qtde;
          iMaiorHoras:= Item.TotalHoras;
        end;
      end;

      if (Item.Qtde <= iMenorQtde) and (Item.TotalHoras <= iMenorHoras) then
      begin
        sMenorMes  :=  FormatDateTime('mm/yyyy',Item.Data);
        iMenorQtde := Item.Qtde;
        iMenorHoras := Item.TotalHoras;
      end;

      if bAchou then
      begin
        FModel.cdsHistoricoQtde.AsInteger     := FModel.cdsHistoricoQtde.AsInteger + Item.Qtde;
        FModel.cdsHistoricoTotalHoras.AsFloat := FModel.cdsHistoricoTotalHoras.AsFloat + Item.TotalHoras;
        FModel.cdsHistoricoValor.AsFloat      := FModel.cdsHistoricoValor.AsFloat + Item.Valor;
      end
      else begin
        FModel.cdsHistoricoQtde.AsInteger     := Item.Qtde;
        FModel.cdsHistoricoTotalHoras.AsFloat := Item.TotalHoras;
        FModel.cdsHistoricoValor.AsFloat      := Item.Valor;
      end;
      FModel.cdsHistorico.Post;
    end;
  end;

  if iMaiorQtde > 0 then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 3;
    FModel.cdsHistoricoMes.AsString := sMaiorMes;
    FModel.cdsHistoricoQtde.AsInteger := iMaiorQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := iMaiorHoras;
    FModel.cdsHistoricoOpcao.AsString := 'VISITA';
    FModel.cdsHistoricoDescricao.AsString := 'Maior M�s:  ' + sMaiorMes;
    FModel.cdsHistorico.Post;
  end;

  if (iMenorQtde > 0) and (sMenorMes.Trim <> '') then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 3;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsInteger := iMenorQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := iMenorHoras;
    FModel.cdsHistoricoOpcao.AsString := 'VISITA';
    FModel.cdsHistoricoDescricao.AsString := 'Menor M�s:  ' + sMenorMes;
    FModel.cdsHistorico.Post;
// m�dia
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 3;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsString := FormatFloat(',##0.00',CalcularMediaFloat(iTotalQtde, iQtdeMeses));
    FModel.cdsHistoricoTotalHoras.AsFloat := CalcularMediaFloat(cTotalHoras, iQtdeMeses);
    FModel.cdsHistoricoOpcao.AsString := 'VISITA';
    FModel.cdsHistoricoDescricao.AsString := 'M�dia:  ';
    FModel.cdsHistorico.Post;
  end;

  if iAtualQtde > 0 then
  begin
    FModel.cdsHistorico.Append;
    FModel.cdsHistoricoTipo.AsInteger := 3;
    FModel.cdsHistoricoMes.AsString := sMenorMes;
    FModel.cdsHistoricoQtde.AsInteger := iAtualQtde;
    FModel.cdsHistoricoTotalHoras.AsFloat := cAtualHoras;
    FModel.cdsHistoricoOpcao.AsString := 'VISITA';
    FModel.cdsHistoricoDescricao.AsString := 'M�s Atual:  ' + FormatDateTime('mm/yyyy', Date);
    FModel.cdsHistorico.Post;
  end;
end;

procedure TClienteController.ImportarXML(ACliente: TClienteVO);
var
  Negocio: TServerMethods1Client;
  oObjetoJSON : TJSONValue;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    oObjetoJSON := TConverte.ObjectToJSON(ACliente);
    Negocio.ClienteImportar(oObjetoJSON);
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TClienteController.ImpressaoHistorico(AIdCliente: Integer);
var
  sCliente: string;
  sConsultor: string;
  sRevenda: string;
begin
  LocalizarId(AIdCliente);
  sCliente := FormatFloat('000000', FModel.CDSCadastroCli_Codigo.AsInteger);
  sConsultor := FormatFloat('0000', FModel.CDSCadastroUsu_Codigo.AsInteger);
  sRevenda := FormatFloat('0000', FModel.CDSCadastroRev_Codigo.AsInteger);

  FModel.ppMemoCliente.Lines.Clear;

  FModel.lblCliente.Caption := sCliente + '-' + FModel.CDSCadastroCli_Nome.AsString;
  FModel.lblConsultor.Caption := sConsultor + '-' + FModel.CDSCadastroUsu_Nome.AsString;
  FModel.lblRevenda.Caption := sRevenda + '-' + FModel.CDSCadastroRev_Nome.AsString;

  FModel.ppMemoCliente.Lines.Add(FModel.CDSCadastroCli_Fantasia.AsString);
  FModel.ppMemoCliente.Lines.Add(FModel.CDSCadastroCli_Dcto.AsString);
  FModel.ppMemoCliente.Lines.Add(FModel.CDSCadastroCli_Endereco.AsString);
  FModel.ppMemoCliente.Lines.Add(FModel.CDSCadastroCli_Telefone.AsString);
  FModel.ppMemoCliente.Lines.Add(FModel.CDSCadastroCli_Contato.AsString);
end;

procedure TClienteController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CClientePrograma, AIdUsuario);
    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

function TClienteController.ListarArquivosLog: TList<string>;
var
  Negocio: TServerMethods1Client;
  ListaJSon: TJSONArray;
  i: Integer;
  Lista: TList<string>;
  Parametro: TParametrosController;
  sCaminhoArquivo: string;
begin
  Parametro := TParametrosController.Create();
  try
    sCaminhoArquivo := Parametro.BuscarCaminhoImportacaoXML();
  finally
    FreeAndNil(Parametro);
  end;

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      ListaJSon := Negocio.ListaArquivosDiretorio(sCaminhoArquivo, 'log');
      Lista := TList<string>.Create;

      for I := 0 to ListaJSon.Size -1 do
        Lista.Add(ListaJSon.Get(i).Value);
    except
      // nada
    end;
  finally
    FreeAndNil(Negocio);
  end;
  Result := Lista;
end;

function TClienteController.Localizar(AId: Integer): TClienteVO;
var
  UnMarshal : TJSONUnMarshal;
  oObjVO: TClienteVO;
  Negocio: TServerMethods1Client;
begin
  {
    Desserializa objecto
  }
  UnMarshal := TJSONUnMarshal.Create;
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      oObjVO := TClienteVO(UnMarshal.Unmarshal(Negocio.ClienteLocaliarIdObj(AId, True)));
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
  Result := oObjVO;
end;

procedure TClienteController.LocalizarCodigo(ACodigo: integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarCodigo(CClientePrograma, ACodigo);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TClienteController.LocalizarCodigoCliente(ACodigo, AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Negocio.LocalizarCodigoCliente(ACodigo, AIdUsuario);
      FModel.CDSCadastro.Open;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TClienteController.LocalizarId(AId: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CClientePrograma, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

function TClienteController.MascaraCodigo(ACodigo: string): string;
begin
  if StrToIntDef(ACodigo, 0) > 0 then
    Result := FormatFloat('000000', StrToFloat(ACodigo))
  else
    Result := '';
end;

procedure TClienteController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CClientePrograma, AIdUsuario);
    FModel.CDSCadastro.Open;
    FModel.CDSCadastro.Append;

    FModel.CDSCadastroCli_Codigo.AsInteger := ProximoCodigo();

    FClienteEmail.LocalizarCodigo(0);
    FClienteEspecificacao.LocalizarCodigo(0);
    FClienteModulo.LocalizarCodigo(0);

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
//    DM.Desconectar;
  end;
end;

procedure TClienteController.APesquisar(AId, ACodigo: Integer);
begin
  if AId > 0 then
    LocalizarId(AId)
  else
    LocalizarCodigoCliente(ACodigo, dm.IdUsuario);
end;

procedure TClienteController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TClienteController.ProximoCodigo: Integer;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoCodigo(CClientePrograma).ToString);
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

function TClienteController.ProximoId: Integer;
var
  Negocio: TServerMethods1Client;
begin
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    Result := StrToInt(Negocio.ProximoId(CClientePrograma).ToString);
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TClienteController.Relatorios(AModelo: Integer;
  AFiltro: TFiltroCliente);
var
  Negocio: TServerMethods1Client;
  sResultado: string;
  objJSON: TJSONValue;
  rel: TDMRelCliente;
begin
  rel := TDMRelCliente.Create(nil);
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      objJSON := TConverte.ObjectToJSON(AFiltro);
      sResultado := Negocio.ClienteRelatorios(AModelo, dm.IdUsuario, objJSON);
      if sResultado <> '' then
        raise Exception.Create(sResultado);
      rel.Impressao(AModelo);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(rel);
  end;
end;

procedure TClienteController.Salvar(AIdUsuario: Integer);
var
  Negocio: TServerMethods1Client;
  IdCliente: Integer;
  sCPF: string;
  model: TClienteVO;
  objJSON: TJSONValue;
begin
  if FModel.CDSCadastroCli_Codigo.AsInteger <= 0 then
    raise Exception.Create('Informe o C�digo!');

  if Trim(FModel.CDSCadastroCli_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');

  if FModel.CDSCadastroCli_Revenda.AsInteger = 0 then
    raise Exception.Create('Informe a Revenda.');

  if Trim(FModel.CDSCadastroCli_Dcto.AsString) = '' then
    raise Exception.Create('Informe o CNPJ/CPF.');

  sCPF := TFuncoes.SomenteNumeros(FModel.CDSCadastroCli_RepreLegalCPF.AsString);

  if Trim(sCPF) <> '' then
    TValidacao.ValidaCPF(sCPF);

  DM.Conectar;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      if FModel.CDSCadastroCli_Codigo.OldValue <> FModel.CDSCadastroCli_Codigo.NewValue then
      begin
        if FModel.CDSCadastroCli_Codigo.AsInteger > 0 then
          Negocio.DuplicacaoRegistro('Cli_Codigo', FModel.CDSCadastroCli_Codigo.AsString, 'Cliente');
      end;
      Negocio.StartTransacao;

      Post();

//      FModel.CDSCadastro.ApplyUpdates(0);

      model := TClienteVO.create;
      model.Id := FModel.CDSCadastroCli_Id.AsInteger;
      model.Ativo := FModel.CDSCadastroCli_Ativo.AsBoolean;
      model.Restricao := FModel.CDSCadastroCli_Restricao.AsBoolean;
      model.IdRevenda := FModel.CDSCadastroCli_Revenda.AsInteger;
      model.Versao := FModel.CDSCadastroCli_Versao.AsString;
      model.Logradouro := FModel.CDSCadastroCli_Logradouro.AsString;
      model.Bairro := FModel.CDSCadastroCli_Bairro.AsString;
      model.CEP := FModel.CDSCadastroCli_CEP.AsString;
      model.IdCidade := FModel.CDSCadastroCli_Cidade.AsInteger;
      model.CNPJ := FModel.CDSCadastroCli_Dcto.AsString;
      model.Codigo := FModel.CDSCadastroCli_Codigo.AsInteger;
      model.ContatoFinanceiro := FModel.CDSCadastroCli_ContatoFinanceiro.AsString;
      model.ContatoCompraVenda := FModel.CDSCadastroCli_ContatoCompraVenda.AsString;
      model.Enquadramento := FModel.CDSCadastroCli_Enquadramento.AsString;
      model.NomeFantasia := FModel.CDSCadastroCli_Fantasia.AsString;
      model.RazaoSocial := FModel.CDSCadastroCli_Nome.AsString;
      model.Rua := FModel.CDSCadastroCli_Logradouro.AsString;
      model.Telefone := FModel.CDSCadastroCli_Telefone.AsString;
      model.Usuario := FModel.CDSCadastroCli_Usuario.AsInteger;
      model.Contato := FModel.CDSCadastroCli_Contato.AsString;
      model.Fone1 := FModel.CDSCadastroCli_Fone1.AsString;
      model.Fone2 := FModel.CDSCadastroCli_Fone2.AsString;
      model.Celular := FModel.CDSCadastroCli_Celular.AsString;
      model.OutroTelefone := FModel.CDSCadastroCli_FoneOutro.AsString;
      model.ContatoFinanceiroFone := FModel.CDSCadastroCli_ContatoFinanceiroFone.AsString;
      model.ContatoCompraVendaFone := FModel.CDSCadastroCli_ContatoCompraVendaFone.AsString;
      model.IE := FModel.CDSCadastroCli_IE.AsString;
      model.RepresentanteLegal := FModel.CDSCadastroCli_RepreLegal.AsString;
      model.RepresentanteLegalCPF := FModel.CDSCadastroCli_RepreLegalCPF.AsString;
      model.Revenda := FModel.CDSCadastroCli_Revenda.AsInteger;
      model.Endereco := FModel.CDSCadastroCli_Endereco.AsString;
      model.Restricao := FModel.CDSCadastroCli_Restricao.AsBoolean;
      model.Ativo := FModel.CDSCadastroCli_Ativo.AsBoolean;
      model.FoneContatoFinanceiro := FModel.CDSCadastroCli_ContatoFinanceiroFone.AsString;
      model.EmpresaVinculada := FModel.CDSCadastroCli_EmpresaVinculada.AsInteger;
      model.Perfil := FModel.CDSCadastroCli_Perfil.AsString;

      SalvarEmail(model);

      SalvarContato(model);

      objJSON := TConverte.ObjectToJSON(model);
      IdCliente := StrToIntDef(Negocio.ClienteSalvar(objJSON).ToString,0);

      model.Id := IdCliente;

      SalvarModulo(IdCliente);

      Negocio.Commit;
      FOperacao := opNavegar;
    except
      ON E: Exception do
      begin
        Negocio.Roolback;
        raise Exception.Create(TFuncoes.MensagemBanco(E.Message));
      end;
    end;
  finally
    FreeAndNil(model);
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

function TClienteController.SalvarCliente(AIdUsuario: Integer): Integer;
var
  Negocio: TServerMethods1Client;
  ObjVO: TClienteVO;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
  Marshal := TJSONMarshal.Create;
  ObjVO := TClienteVO.create;
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      ObjVO.Id := FModel.CDSCadastroCli_Id.AsInteger;
      ObjVO.Codigo := FModel.CDSCadastroCli_Codigo.AsInteger;
      ObjVO.RazaoSocial := FModel.CDSCadastroCli_Nome.AsString;
      ObjVO.NomeFantasia := FModel.CDSCadastroCli_Fantasia.AsString;
      ObjVO.CNPJ := FModel.CDSCadastroCli_Dcto.AsString;
      ObjVO.Enquadramento := FModel.CDSCadastroCli_Enquadramento.AsString;
      ObjVO.Endereco := FModel.CDSCadastroCli_Endereco.AsString;
      ObjVO.Telefone := FModel.CDSCadastroCli_Telefone.AsString;
      ObjVO.ContatoFinanceiro := FModel.CDSCadastroCli_Contato.AsString;
      ObjVO.RevendaVO.Id := FModel.CDSCadastroCli_Revenda.AsInteger;
      ObjVO.Ativo := FModel.CDSCadastroCli_Ativo.AsBoolean;
      ObjVO.Restricao := FModel.CDSCadastroCli_Restricao.AsBoolean;
      ObjVO.UsuarioVO.id := FModel.CDSCadastroCli_Usuario.AsInteger;
      ObjVO.Versao := FModel.CDSCadastroCli_Versao.AsString;

      SalvarEmail(ObjVO);

      oObjetoJSON := Marshal.Marshal(ObjVO);
      Result := StrToIntDef(Negocio.ClienteSalvar(oObjetoJSON).ToString(),0);
      FOperacao := opNavegar;
    except
      ON E: Exception do
      begin
        TFuncoes.MensagemErroBanco(E.Message);
        Abort;
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Marshal);
    FreeAndNil(ObjVO);
    DM.Desconectar;
  end;
end;

procedure TClienteController.SalvarContato(ACliente: TClienteVO);
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
      model.IdCliente := FModel.CDSContatoCont_Cliente.AsInteger;
      model.IdOrcamento := 0;
      model.Nome := FModel.CDSContatoCont_Nome.AsString;
      model.Fone1 := FModel.CDSContatoCont_Fone1.AsString;
      model.Fone2 := FModel.CDSContatoCont_Fone2.AsString;
      model.Email := FModel.CDSContatoCont_Email.AsString;
      model.Departamento := FModel.CDSContatoCont_Depto.AsString;
      ACliente.ListaContatoVO.Add(model);

      FModel.CDSContato.Next;
    end;
  finally
    FModel.CDSContato.EnableControls;
  end;
end;

procedure TClienteController.SalvarEmail(ACliente: TClienteVO);
var
  Email: TClienteEmailVO;
begin
  if FClienteEmail.Model.CDSConsulta.State = dsInsert then
    FClienteEmail.Model.CDSConsulta.Cancel;

  FClienteEmail.Model.CDSConsulta.DisableControls;
  try
    FClienteEmail.Model.CDSConsulta.First;
    while not FClienteEmail.Model.CDSConsulta.Eof do
    begin
//      FClienteEmail.Model.CDSConsulta.Edit;
//      FClienteEmail.Model.CDSConsultaCliEm_Id.AsInteger := 0;

      Email := TClienteEmailVO.Create;
      Email.Id := FClienteEmail.Model.CDSConsultaCliEm_Id.AsInteger;
      Email.IdCliente := FClienteEmail.Model.CDSConsultaCliEm_Cliente.AsInteger;
      Email.Email := FClienteEmail.Model.CDSConsultaCliEm_Email.AsString;
      Email.Notificar := FClienteEmail.Model.CDSConsultaCliEm_Notificar.AsBoolean;
      ACliente.ClienteEmail.Add(Email);
      FClienteEmail.Model.CDSConsulta.Next;
    end;
//    FClienteEmail.Model.CDSConsulta.ApplyUpdates(0);
  finally
    FClienteEmail.Model.CDSConsulta.EnableControls;
  end;
end;

procedure TClienteController.SalvarEmail(AIdCliente: integer);
begin

  if FClienteEmail.Model.CDSConsulta.State = dsInsert then
    FClienteEmail.Model.CDSConsulta.Cancel;

  FClienteEmail.Model.CDSConsulta.DisableControls;
  try
    FClienteEmail.Model.CDSConsulta.First;
    while not FClienteEmail.Model.CDSConsulta.Eof do
    begin
      FClienteEmail.Model.CDSConsulta.Edit;
      FClienteEmail.Model.CDSConsultaCliEm_Cliente.AsInteger := AIdCliente; // FModel.CDSCadastroCli_Id.AsInteger;
      FClienteEmail.Model.CDSConsulta.Post;
      FClienteEmail.Model.CDSConsulta.Next;
    end;
    FClienteEmail.Model.CDSConsulta.ApplyUpdates(0);
  finally
    FClienteEmail.Model.CDSConsulta.EnableControls;
  end;
end;

procedure TClienteController.SalvarModulo(AIdCliente: integer);
begin
  if FClienteModulo.Model.CDSConsulta.State = dsInsert then
    FClienteModulo.Model.CDSConsulta.Cancel;

  FClienteModulo.Model.CDSConsulta.DisableControls;
  try
    FClienteModulo.Model.CDSConsulta.First;
    while not FClienteModulo.Model.CDSConsulta.Eof do
    begin
      FClienteModulo.Model.CDSConsulta.Edit;
      FClienteModulo.Model.CDSConsultaCliMod_Cliente.AsInteger := AIdCliente; // FModel.CDSCadastroCli_Id.AsInteger;
      FClienteModulo.Model.CDSConsulta.Post;
      FClienteModulo.Model.CDSConsulta.Next;
    end;
    FClienteModulo.Model.CDSConsulta.ApplyUpdates(0);
  finally
    FClienteModulo.Model.CDSConsulta.EnableControls;
  end;
end;

function TClienteController.SalvarTeste: TClienteVO;
var
  UnMarshal : TJSONUnMarshal;
  oObjVO: TClienteVO;
  Negocio: TServerMethods1Client;
begin
  {
    Desserializa objecto
  }
  UnMarshal := TJSONUnMarshal.Create;
  DM.Conectar;
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    oObjVO := TClienteVO(UnMarshal.Unmarshal(Negocio.ClienteSalvarTeste));
    Result := oObjVO;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(Negocio);
  end;
end;

end.
