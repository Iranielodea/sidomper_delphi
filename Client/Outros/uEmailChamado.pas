unit uEmailChamado;

interface

uses System.SysUtils, uChamadoController;

type
  TEmailChamado = class
  private
    FNumChamado: Double;
    FMensagemFinal: string;
    FMensagemFinalAtividade: string;
    FStatus: string;
    function TextoEmailCabecalho(AIdChamado: Integer): string;
    function TextoEmailAtividadeCabecalho(AIdChamado: Integer): string;
  public
    function TextoEmailChamado(AIdChamado: integer): string;
    function TextoEmailAtividade(AIdChamado: integer): string;

    function RetornarListaEmail(AIdChamado, AIdUsuario, AIdStatus: integer): string;
    function RetornarListaEmailCliente(AIdChamado: integer): string;
    function RetornarAssunto(AIdChamado: Integer): string;
    function RetornarAssuntoAtividade(AIdAtividade: Integer): string;
    constructor Create;
  end;

implementation

{ TEmailChamado }



constructor TEmailChamado.Create;
begin
  inherited Create;

  FMensagemFinal := 'Colocamo-nos a disposição para maiores esclarecimentos. <br><br>';
  FMensagemFinal := FMensagemFinal + 'Equipe Domper <br><br>';
  FMensagemFinal := FMensagemFinal + 'Esta mensagem é automática e foi gerada pelo Sistema Interno ' +
  ' de Atividades Domper. <br> Por favor não responda este email.';

  FMensagemFinalAtividade := 'Colocamo-nos a disposição para maiores esclarecimentos. <br><br>';
  FMensagemFinalAtividade := FMensagemFinalAtividade + 'Equipe Domper <br><br>';
  FMensagemFinalAtividade := FMensagemFinalAtividade + 'Esta mensagem é automática e foi gerada pelo Sistema Interno ' +
  ' de Atividades Domper. <br> Por favor não responda este email.';

end;

function TEmailChamado.RetornarAssunto(AIdChamado: Integer): string;
var
  cNumChamado: Double;
begin
  cNumChamado := AIdChamado;
  Result := 'Chamado: ' + FormatFloat('000000', cNumChamado) + ' DOMPER Consultoria e Sistemas Ltda.';
end;

function TEmailChamado.RetornarAssuntoAtividade(AIdAtividade: Integer): string;
var
  cNumAtividade: Double;
begin
  cNumAtividade := AIdAtividade;
  Result := 'Atividade: ' + FormatFloat('000000', cNumAtividade) + ' DOMPER Consultoria e Sistemas Ltda.';
end;

function TEmailChamado.RetornarListaEmail(AIdChamado, AIdUsuario, AIdStatus: integer): string;
var
  obj: TChamadoController;
begin
  obj := TChamadoController.Create;
  try
    Result := obj.RetornarEmails(AIdChamado, AIdUsuario, AIdStatus);
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailChamado.RetornarListaEmailCliente(AIdChamado: integer): string;
var
  obj: TChamadoController;
begin
  obj := TChamadoController.Create;
  try
    Result := obj.RetornarEmailsCliente(AIdChamado);
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailChamado.TextoEmailAtividade(AIdChamado: integer): string;
var
  obj: TChamadoController;
  stexto: string;
  sTitulo: string;
begin
  obj := TChamadoController.Create;
  try
    sTexto := '<html>';
    stexto := stexto + TextoEmailAtividadeCabecalho(AIdChamado);
    sTitulo := '';

    obj.LocalizarChamadoOcorrencia(AIdChamado);
    while not obj.Model.CDSChamadoOcorrenciaCons.Eof do
    begin
      if sTitulo = '' then
      begin
        sTitulo := 'Dados do Atendimento (' + FStatus + ')<br><br>';
        stexto := stexto + sTitulo;
      end;

      stexto := stexto + 'Usuário : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome.AsString + '<br>';
//      if obj.Model.CDSChamadoOcorrenciaConsUsu_Nome1.AsString <> '' then
//        stexto := stexto + 'Colaborador 1 : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome1.AsString + '<br>';
//
//      if obj.Model.CDSChamadoOcorrenciaConsUsu_Nome2.AsString <> '' then
//        stexto := stexto + 'Colaborador 2 : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome2.AsString + '<br>';
//
//      if obj.Model.CDSChamadoOcorrenciaConsUsu_Nome3.AsString <> '' then
//        stexto := stexto + 'Colaborador 3 : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome3.AsString + '<br>';

      stexto := stexto + 'Data Ocorrência: ' + obj.Model.CDSChamadoOcorrenciaConsChOco_Data.AsString + '<br>';
      stexto := stexto + 'Hora Inicial : ' + obj.Model.CDSChamadoOcorrenciaConsChOco_HoraInicio.AsString + '<br>';
      stexto := stexto + 'Hora Final : ' + obj.Model.CDSChamadoOcorrenciaConsChOco_HoraFim.AsString + '<br>';
      stexto := stexto + 'Solução : ' + obj.Model.CDSChamadoOcorrenciaConsChOco_DescricaoSolucao.AsString + '<br><br>';
      obj.Model.CDSChamadoOcorrenciaCons.Next;
    end;
    stexto := stexto + FMensagemFinalAtividade + '</html>';
    Result := stexto;
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailChamado.TextoEmailAtividadeCabecalho(
  AIdChamado: Integer): string;
var
  sTexto: string;
  obj: TChamadoController;
begin
  FNumChamado := AIdChamado;
  obj := TChamadoController.Create;
  try
    obj.LocalizarId(AIdChamado);
    FStatus := obj.Model.CDSCadastroSta_Nome.AsString;

    sTexto := '';
    sTexto := sTexto + 'Caro(a) : ' + obj.Model.CDSCadastroCli_Nome.AsString +
    ', seguem abaixo informações referente a Atividade realizada na Domper Consultoria e Sistemas: <br><br>';
    sTexto := sTexto + 'Nº Atividade : ' + FormatFloat('000000', obj.Model.CDSCadastroCha_Id.AsFloat) + '<br>';
    sTexto := sTexto + 'Data Abertura : ' + obj.Model.CDSCadastroCha_DataAbertura.AsString + ' - Hora : ' + obj.Model.CDSCadastroCha_HoraAbertura.AsString + '<br>';
    sTexto := sTexto + 'Aberto por : ' + obj.Model.CDSCadastroUsu_Nome.AsString + '<br>';
    sTexto := sTexto + 'Contato : ' + obj.Model.CDSCadastroCha_Contato.AsString + '<br>';
    sTexto := sTexto + 'Descrição : ' + obj.Model.CDSCadastroCha_Descricao.AsString + '<br>';
    sTexto := sTexto + '<br>';
    Result := sTexto;
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailChamado.TextoEmailCabecalho(AIdChamado: Integer): string;
var
  sTexto: string;
  obj: TChamadoController;
begin
  FNumChamado := AIdChamado;
  obj := TChamadoController.Create;
  try
    obj.LocalizarId(AIdChamado);
    FStatus := obj.Model.CDSCadastroSta_Nome.AsString;

    sTexto := '';
    sTexto := sTexto + 'Caro(a) : ' + obj.Model.CDSCadastroCli_Nome.AsString +
    ', seguem abaixo informações referente ao chamado realizado na Domper Consultoria e Sistemas: <br><br>';
    sTexto := sTexto + 'Nº Chamado : ' + FormatFloat('000000', obj.Model.CDSCadastroCha_Id.AsFloat) + '<br>';
    sTexto := sTexto + 'Data Abertura : ' + obj.Model.CDSCadastroCha_DataAbertura.AsString + ' - Hora : ' + obj.Model.CDSCadastroCha_HoraAbertura.AsString + '<br>';
    sTexto := sTexto + 'Aberto por : ' + obj.Model.CDSCadastroUsu_Nome.AsString + '<br>';
    sTexto := sTexto + 'Contato : ' + obj.Model.CDSCadastroCha_Contato.AsString + '<br>';
    sTexto := sTexto + 'Descrição : ' + obj.Model.CDSCadastroCha_Descricao.AsString + '<br>';
    sTexto := sTexto + '<br>';
    Result := sTexto;
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailChamado.TextoEmailChamado(AIdChamado: integer): string;
var
  obj: TChamadoController;
  stexto: string;
  sTitulo: string;
begin
  obj := TChamadoController.Create;
  try
    sTexto := '<html>';
    stexto := stexto + TextoEmailCabecalho(AIdChamado);
    sTitulo := '';

    obj.LocalizarChamadoOcorrencia(AIdChamado);
    while not obj.Model.CDSChamadoOcorrenciaCons.Eof do
    begin
      if sTitulo = '' then
      begin
        sTitulo := 'Dados do Atendimento (' + FStatus + ')<br><br>';
        stexto := stexto + sTitulo;
      end;

      stexto := stexto + 'Usuário : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome.AsString + '<br>';
//      if obj.Model.CDSChamadoOcorrenciaConsUsu_Nome1.AsString <> '' then
//        stexto := stexto + 'Colaborador 1 : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome1.AsString + '<br>';
//
//      if obj.Model.CDSChamadoOcorrenciaConsUsu_Nome2.AsString <> '' then
//        stexto := stexto + 'Colaborador 2 : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome2.AsString + '<br>';
//
//      if obj.Model.CDSChamadoOcorrenciaConsUsu_Nome3.AsString <> '' then
//        stexto := stexto + 'Colaborador 3 : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome3.AsString + '<br>';

      stexto := stexto + 'Data Ocorrência: ' + obj.Model.CDSChamadoOcorrenciaConsChOco_Data.AsString + '<br>';
      stexto := stexto + 'Hora Inicial : ' + obj.Model.CDSChamadoOcorrenciaConsChOco_HoraInicio.AsString + '<br>';
      stexto := stexto + 'Hora Final : ' + obj.Model.CDSChamadoOcorrenciaConsChOco_HoraFim.AsString + '<br>';
      stexto := stexto + 'Solução : ' + obj.Model.CDSChamadoOcorrenciaConsChOco_DescricaoSolucao.AsString + '<br><br>';
      obj.Model.CDSChamadoOcorrenciaCons.Next;
    end;
    stexto := stexto + FMensagemFinal + '</html>';
    Result := stexto;
  finally
    FreeAndNil(obj);
  end;
end;

end.
