unit uEmailVisita;

interface

uses
  System.SysUtils, uVisitaController;

type

  TEmailVisita = class
  private
    FNumVisita: Double;
    FMensagemFinal: string;
  public
    function TextoEmail(IdVisita: Integer): string;
    function RetornarListaEmail(IdVisita, IdUsuario, IdStatus: integer): string;
    function RetornarListaEmailCliente(IdVisita: integer): string;
    function RetornarAssunto(AIdVisita: Integer): string;
    constructor Create;
  end;


implementation

{ TEmailVisita }

constructor TEmailVisita.Create;
begin
  inherited Create;

//  FMensagemFinal := 'Colocamo-nos a disposição para maiores esclarecimentos. <br><br>';
//  FMensagemFinal := FMensagemFinal + 'Equipe Domper <br><br>';
  FMensagemFinal := 'Esta mensagem é automática e foi gerada pelo Sistema Interno ' +
  ' Domper. <br> Caso o que foi relatado não esteja em conformidade com o que foi realizado, favor entrar em contato com o seu consultor.';
end;

function TEmailVisita.RetornarAssunto(AIdVisita: Integer): string;
begin
  FNumVisita := AIdVisita;
  Result := 'Visita: ' + FormatFloat('000000', FNumVisita) + ' DOMPER Consultoria e Sistemas Ltda.';
end;

function TEmailVisita.RetornarListaEmail(IdVisita, IdUsuario,
  IdStatus: integer): string;
var
  obj: TVisitaController;
begin
  obj := TVisitaController.Create;
  try
    Result := obj.RetornarEmails(IdVisita, IdUsuario, IdStatus);
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailVisita.RetornarListaEmailCliente(IdVisita: integer): string;
var
  obj: TVisitaController;
begin
  obj := TVisitaController.Create;
  try
    Result := obj.RetornarEmailsCliente(IdVisita);
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailVisita.TextoEmail(IdVisita: Integer): string;
var
  sTexto: string;
  obj: TVisitaController;
begin
  FNumVisita := IdVisita;
  obj := TVisitaController.Create;
  try
    obj.LocalizarId(IdVisita);

    sTexto := '';
    sTexto := sTexto + 'Caro(a) : ' + obj.Model.CDSCadastroCli_Nome.AsString +
    ', seguem abaixo informações referente à visita realizada pela Domper Consultoria e Sistemas: <br><br>';
    sTexto := sTexto + 'Nº Visita : ' + FormatFloat('000000', obj.Model.CDSCadastroVis_Id.AsFloat) + '<br>';
    sTexto := sTexto + 'Data : ' + obj.Model.CDSCadastroVis_Data.AsString +
      ' - Hora Inicial : ' + obj.Model.CDSCadastroVis_HoraInicio.AsString +
      ' - Hora Final : ' + obj.Model.CDSCadastroVis_HoraFim.AsString +' <br>';

    sTexto := sTexto + 'Documento : ' + obj.Model.CDSCadastroVis_Dcto.AsString  + '<br>';
    sTexto := sTexto + 'Consultor : ' + obj.Model.CDSCadastroUsu_Nome.AsString + '<br>';
    sTexto := sTexto + 'Tipo : ' + obj.Model.CDSCadastroTip_Nome.AsString + '<br>';
    sTexto := sTexto + 'Status : ' + obj.Model.CDSCadastroSta_Nome.AsString + '<br>';
    sTexto := sTexto + 'Contato : ' + obj.Model.CDSCadastroVis_Contato.AsString + '<br>';
    sTexto := sTexto + 'Descrição : ' + obj.Model.CDSCadastroVis_Descricao.AsString + '<br>';
    sTexto := sTexto + 'Valor : ' + FormatFloat(',##0.00', obj.Model.CDSCadastroVis_Valor.AsFloat) + '<br>';
    sTexto := sTexto + 'Forma de Pagamento : ' + obj.Model.CDSCadastroVis_FormaPagto.AsString + '<br>';
    sTexto := sTexto + '<br>';
    sTexto := sTexto + FMensagemFinal;
    Result := sTexto;
  finally
    FreeAndNil(obj);
  end;
end;

end.
