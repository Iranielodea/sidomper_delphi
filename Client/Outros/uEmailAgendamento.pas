unit uEmailAgendamento;

interface

uses
  System.SysUtils, uAgendamentoController;

type
  TEmailAgendamento = class
  private
    FNumAgenda: Double;
    FMensagemFinal: string;
  public
    function TextoEmail(AIdAgenda: Integer): string;
    function RetornarListaEmail(AIdAgenda, AIdUsuario, AIdStatus: integer): string;
    function RetornarListaEmailCliente(AIdVisita: integer): string;
    function RetornarAssunto(AIdAgenda: Integer): string;
    constructor Create;
  end;


implementation

{ TEmailVisita }

constructor TEmailAgendamento.Create;
begin
  inherited Create;

  FMensagemFinal := 'Colocamo-nos a disposição para maiores esclarecimentos. <br><br>';
  FMensagemFinal := FMensagemFinal + 'Equipe Domper <br><br>';
  FMensagemFinal := FMensagemFinal + 'Esta mensagem é automática e foi gerada pelo Sistema Interno ' +
  ' de Agendamentos Domper. <br> Por favor não responda este email.';
end;

function TEmailAgendamento.RetornarAssunto(AIdAgenda: Integer): string;
var
  cNumAgenda: Double;
begin
  cNumAgenda := AIdAgenda;
  Result := 'Agendamento: ' + FormatFloat('000000', cNumAgenda) + ' DOMPER Consultoria e Sistemas Ltda.';
end;

function TEmailAgendamento.RetornarListaEmail(AIdAgenda, AIdUsuario,
  AIdStatus: integer): string;
var
  obj: TAgendamentoController;
begin
  obj := TAgendamentoController.Create;
  try
    Result := obj.RetornarEmails(AIdAgenda, AIdUsuario, AIdStatus);
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailAgendamento.RetornarListaEmailCliente(AIdVisita: integer): string;
var
  obj: TAgendamentoController;
begin
  obj := TAgendamentoController.Create;
  try
    Result := obj.RetornarEmailsCliente(AIdVisita);
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailAgendamento.TextoEmail(AIdAgenda: Integer): string;
var
  sTexto: string;
  obj: TAgendamentoController;
begin
  FNumAgenda := AIdAgenda;
  obj := TAgendamentoController.Create;
  try
    obj.LocalizarId(AIdAgenda);

    sTexto := '';
    sTexto := sTexto + 'Caro(a) : ' + obj.Model.CDSCadastroAge_NomeCliente.AsString +
    ', seguem abaixo informações referente ao Agendamento da Domper Consultoria e Sistemas: <br><br>';
    sTexto := sTexto + 'Nº Agendamento : ' + FormatFloat('000000', obj.Model.CDSCadastroAge_Id.AsFloat) + '<br>';
    sTexto := sTexto + 'Data : ' + obj.Model.CDSCadastroAge_Data.AsString +
      ' - Hora : ' + obj.Model.CDSCadastroAge_Hora.AsString +' <br>';
    sTexto := sTexto + 'Usuário : ' + obj.Model.CDSCadastroUsu_Nome.AsString + '<br>';
    sTexto := sTexto + 'Contato : ' + obj.Model.CDSCadastroAge_Contato.AsString + '<br>';
    sTexto := sTexto + 'Tipo : ' + obj.Model.CDSCadastroTip_Nome.AsString + '<br>';
    sTexto := sTexto + 'Status : ' + obj.Model.CDSCadastroSta_Nome.AsString + '<br>';
    sTexto := sTexto + 'Descrição : ' + obj.Model.CDSCadastroAge_Descricao.AsString + '<br>';
    sTexto := sTexto + '<br>';
    sTexto := sTexto + FMensagemFinal;
    Result := sTexto;
  finally
    FreeAndNil(obj);
  end;
end;

end.
