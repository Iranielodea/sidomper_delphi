unit uEmailSolicitacao;

interface

uses System.SysUtils, uSolicitacaoController, Datasnap.DBClient, Data.DB;

type
  TEmailSolicitacao = class
  private
    FDados: TClientDataSet;
    FNumSolicitacao: Double;
    FMensagemFinal: string;
    function TextoEmailCabecalho(AIdSolicitacao: Integer): string;
    function TextoEmailOcorrenciaGeral(AIdSolicitacao: Integer): string;
    function TextoEmailOcorrenciaTecnica(AIdSolicitacao: Integer): string;

    function ListarOcorrencia: string;
  public
    function TextoEmailSolicitacao(AIdSolicitacao: integer): string;
    function RetornarListaEmail(AIdSolicitacao, AIdUsuario, AIdStatus: integer): string;
    function RetornarListaEmailCliente(AIdSolicitacao: integer): string;
    function RetornarAssunto(AIdSolicitacao: Integer): string;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TEmailSolicitacao }

constructor TEmailSolicitacao.Create;
begin
  inherited Create;

  FDados := TClientDataSet.Create(nil);
  FDados.Close;
  FDados.FieldDefs.Clear;
  FDados.FieldDefs.Add('Tipo', ftinteger);
  FDados.FieldDefs.Add('Operador', ftString, 50);
  FDados.FieldDefs.Add('Data', ftDate);
  FDados.FieldDefs.Add('Hora', ftString, 20);
  FDados.FieldDefs.Add('Descricao', ftString, 1000);
  FDados.FieldDefs.Add('DescricaoBlob', ftBlob);

  FDados.CreateDataSet;
  FDados.IndexFieldNames := 'Tipo;Data';

  FMensagemFinal := 'Colocamo-nos a disposi��o para maiores esclarecimentos. <br><br>';
  FMensagemFinal := FMensagemFinal + 'Equipe Domper <br><br>';
  FMensagemFinal := FMensagemFinal + 'Esta mensagem � autom�tica e foi gerada pelo Sistema Interno ' +
  ' de Solicita��es Domper. <br> Por favor n�o responda este email.';
end;

destructor TEmailSolicitacao.Destroy;
begin
  FreeAndNil(FDados);
  inherited;
end;

function TEmailSolicitacao.ListarOcorrencia: string;
var
  sTexto: string;
begin
  sTexto := '';
  FDados.First;
  while not Fdados.Eof do
  begin
    case FDados.FieldByName('Tipo').AsInteger of
      1:
      begin
        sTexto := sTexto + 'Ocorr�ncia Geral<br>';
        sTexto := sTexto + 'Operador : ' + FDados.FieldByName('Operador').AsString + '<br>';
        sTexto := sTexto + 'Data : ' + FDados.FieldByName('Data').AsString + ' - Hora : ' + FDados.FieldByName('Hora').AsString + '<br>';
        sTexto := sTexto + 'Descri��o : ' + FDados.FieldByName('DescricaoBlob').AsString + '<br><br>';
      end;
//      2:
//      begin
//        sTexto := sTexto + 'Ocorr�ncia T�cnica <br>';
//        sTexto := sTexto + 'Operador : ' + FDados.FieldByName('Operador').AsString + '<br>';
//        sTexto := sTexto + 'Data : ' + FDados.FieldByName('Data').AsString + ' - Hora : ' + FDados.FieldByName('Hora').AsString + '<br>';
//        sTexto := sTexto + 'Descri��o : ' + FDados.FieldByName('Descricao').AsString + '<br><br>';
//      end;
    end;
    FDados.Next;
  end;
  Result := sTexto;
end;

function TEmailSolicitacao.RetornarAssunto(AIdSolicitacao: Integer): string;
begin
  FNumSolicitacao := AIdSolicitacao;
  Result := 'Solicita��o: ' + FormatFloat('000000', FNumSolicitacao) + ' DOMPER Consultoria e Sistemas Ltda.';
end;

function TEmailSolicitacao.RetornarListaEmail(AIdSolicitacao, AIdUsuario, AIdStatus: integer): string;
var
  obj: TSolicitacaoController;
begin
  obj := TSolicitacaoController.Create;
  try
    Result := obj.RetornarEmails(AIdSolicitacao, AIdUsuario, AIdStatus);
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailSolicitacao.RetornarListaEmailCliente(
  AIdSolicitacao: integer): string;
var
  obj: TSolicitacaoController;
begin
  obj := TSolicitacaoController.Create;
  try
    Result := obj.RetornarEmailsCliente(AIdSolicitacao);
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailSolicitacao.TextoEmailCabecalho(AIdSolicitacao: Integer): string;
var
  sTexto: string;
  obj: TSolicitacaoController;
begin
  FNumSolicitacao := AIdSolicitacao;
  obj := TSolicitacaoController.Create;
  try
    obj.LocalizarId(AIdSolicitacao);

    sTexto := '';
    sTexto := sTexto + 'Caro(a) : ' + obj.Model.CDSCadastroCli_Nome.AsString +
    ', segue abaixo informa��es referente a Solicita��o realizada na Domper Consultoria e Sistemas: <br><br>';
    sTexto := sTexto + 'Dados da Solicita��o (' + obj.Model.CDSCadastroSta_Nome.AsString + ')<br><br>';
    sTexto := sTexto + 'N� Solicita��o : ' + FormatFloat('000000', obj.Model.CDSCadastroSol_Id.AsFloat) + '<br>';
    sTexto := sTexto + 'Aberto por : ' + obj.Model.CDSCadastroUAb_Nome.AsString + '<br>';
    sTexto := sTexto + 'Data Abertura : ' + obj.Model.CDSCadastroSol_Data.AsString + ' - Hora : ' + obj.Model.CDSCadastroSol_Hora.AsString + '<br>';
    sTexto := sTexto + 'Contato : ' + obj.Model.CDSCadastroSol_Contato.AsString + '<br>';
    sTexto := sTexto + 'T�tulo : ' + obj.Model.CDSCadastroSol_Titulo.AsString + '<br>';
    sTexto := sTexto + 'Vers�o em uso : ' + obj.Model.CDSCadastroSol_Versao.AsString + '<br>';
    sTexto := sTexto + 'Analista : ' + obj.Model.CDSCadastroAnal_Nome.AsString + '<br>';
    sTexto := sTexto + 'Tempo Previsto : ' + obj.Model.CDSCadastroSol_TempoPrevisto.AsString + '<br>';
    sTexto := sTexto + 'Previs�o de Entrega : ' + obj.Model.CDSCadastroSol_PrevisaoEntrega.AsString + '<br>';
    sTexto := sTexto + 'Desenvolvedor : ' + obj.Model.CDSCadastroDesenv_Nome.AsString + '<br>';
    sTexto := sTexto + 'Vers�o : ' + obj.Model.CDSCadastroVer_Versao.AsString + '<br>';
    sTexto := sTexto + 'Descri��o : ' + '<br>' + obj.Model.CDSCadastroSol_Descricao.AsString + '<br><br>';
//    sTexto := sTexto + '<br><br>';
    Result := sTexto;
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailSolicitacao.TextoEmailOcorrenciaGeral(
  AIdSolicitacao: Integer): string;
var
  obj: TSolicitacaoController;
  sTexto: string;
begin
  sTexto := '';
  obj := TSolicitacaoController.Create;
  try
    obj.LocalizarOcorrenciaGeral(AIdSolicitacao);
    while not obj.Model.CDSOcorrenciaGeralConsulta.Eof do
    begin
      FDados.Append;
      FDados.FieldByName('Tipo').AsInteger      := 1;
      FDados.FieldByName('Operador').AsString   := obj.Model.CDSOcorrenciaGeralConsultaUsu_Nome.AsString;
      FDados.FieldByName('Data').AsDateTime     := obj.Model.CDSOcorrenciaGeralConsultaSOcor_Data.AsDateTime;
      FDados.FieldByName('Hora').AsString       := obj.Model.CDSOcorrenciaGeralConsultaSOcor_Hora.AsString;
      FDados.FieldByName('DescricaoBlob').AsString  := obj.Model.CDSOcorrenciaGeralConsultaSOcor_Descricao.AsString;
      FDados.Post;
      obj.Model.CDSOcorrenciaGeralConsulta.Next;
    end;
  finally
    FreeAndNil(obj);
  end;
  Result := sTexto;
end;

function TEmailSolicitacao.TextoEmailOcorrenciaTecnica(
  AIdSolicitacao: Integer): string;
var
  obj: TSolicitacaoController;
  sTexto: string;
begin
  sTexto := '';
//  obj := TSolicitacaoController.Create;
//  try
//    obj.LocalizarOcorrenciaTecnica(AIdSolicitacao);
//    while not obj.Model.CDSOcorrenciaTecnicaConsulta.Eof do
//    begin
//      FDados.Append;
//      FDados.FieldByName('Tipo').AsInteger      := 2;
//      FDados.FieldByName('Operador').AsString   := obj.Model.CDSOcorrenciaTecnicaConsultaUsu_Nome.AsString;
//      FDados.FieldByName('Data').AsDateTime     := obj.Model.CDSOcorrenciaTecnicaConsultaSOcor_Data.AsDateTime;
//      FDados.FieldByName('Hora').AsString       := obj.Model.CDSOcorrenciaTecnicaConsultaSOcor_Hora.AsString;
//      FDados.FieldByName('Descricao').AsString  := obj.Model.CDSOcorrenciaTecnicaConsultaSOcor_Descricao.AsString;
//      FDados.Post;
//      obj.Model.CDSOcorrenciaTecnicaConsulta.Next;
//    end;
//  finally
//    FreeAndNil(obj);
//  end;
  Result := sTexto;
end;

function TEmailSolicitacao.TextoEmailSolicitacao(
  AIdSolicitacao: integer): string;
var
  sTexto: string;
begin
  sTexto := '<html>';
  sTexto := sTexto + TextoEmailCabecalho(AIdSolicitacao);
  TextoEmailOcorrenciaGeral(AIdSolicitacao);
//  TextoEmailOcorrenciaTecnica(AIdSolicitacao);

  sTexto := sTexto + ListarOcorrencia;
  stexto := stexto + FMensagemFinal + '</html>';
  Result := sTexto;
end;

end.
