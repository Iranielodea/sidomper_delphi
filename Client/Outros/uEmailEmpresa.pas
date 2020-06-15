unit uEmailEmpresa;

interface

uses System.SysUtils, uEnumerador, uChamadoController;

type TTipoEntrada = (teChamado, teOcorrencia);

type
  TEmailEmpresa = class
  private
    FTipoEntrada: TTipoEntrada;
    FNumChamado: Double;
    FMensagemFinal: string;
    function GetAssunto: string;
  public
    function TextoEmailChamado(IdChamado: Integer): string;
    function TextoEmailChamadoOcorrencia(IdChamado: integer): string;
    function RetornarListaEmailClientes(IdStatus, IdUsuario, IdCliente: integer; out IdContaEmail: integer): string;
    property Assunto: string read GetAssunto;
    constructor Create(TipoEntrada: TTipoEntrada);

  end;

implementation

{ TEmailEmpresa }

uses uStatusController, uUsuarioController, uClienteEmailController;

constructor TEmailEmpresa.Create(TipoEntrada: TTipoEntrada);
begin
  inherited Create;
  FTipoEntrada := TipoEntrada;

  FMensagemFinal := 'Colocamo-nos a disposição para maiores esclarecimentos. <br><br>';
  FMensagemFinal := FMensagemFinal + 'Equipe Domper <br><br>';
  FMensagemFinal := FMensagemFinal + 'Esta mensagem é automática e foi gerada pelo sistema interno ' +
  ' de Chamados Domper. <br> Por favor não responda este email.';
end;

function TEmailEmpresa.GetAssunto: string;
begin
  Result := 'Chamado: ' + FormatFloat('000000', FNumChamado) + ' DOMPER Consultoria e Sistemas Ltda.';
end;

function TEmailEmpresa.RetornarListaEmailClientes(IdStatus, IdUsuario,
  IdCliente: integer; out IdContaEmail: integer): string;
var
  Status: TStatusController;
  Usuario: TUsuarioController;
  ClienteEmail: TClienteEmailController;
  sEmail: string;
  iContador: Integer;
begin
  sEmail := '';
  iContador := 1;
  IdContaEmail := 0;

  Status := TStatusController.Create;
  Usuario := TUsuarioController.Create;
  ClienteEmail := TClienteEmailController.Create;
  try
    Status.LocalizarId(IdStatus);
    if Status.Model.CDSCadastroSta_NotificarCliente.AsBoolean then
    begin
      Usuario.LocalizarId(IdUsuario);
      if Usuario.Model.CDSCadastroUsu_ContaEmail.AsInteger > 0 then
      begin

        IdContaEmail := Usuario.Model.CDSCadastroUsu_ContaEmail.AsInteger;

        ClienteEmail.LocalizarCodigo(IdCliente);
        while not ClienteEmail.Model.CDSConsulta.Eof do
        begin
          if iContador = 1 then
            sEmail := sEmail + ClienteEmail.Model.CDSConsultaCliEm_Email.AsString
          else
            sEmail := sEmail + ';' + ClienteEmail.Model.CDSConsultaCliEm_Email.AsString;
          Inc(iContador);
          ClienteEmail.Model.CDSConsulta.Next;
        end;
      end;
    end;
  finally
    FreeAndNil(Status);
    FreeAndNil(Usuario);
    FreeAndNil(ClienteEmail);
  end;
  Result := sEmail;
end;

function TEmailEmpresa.TextoEmailChamado(IdChamado: Integer): string;
var
  sTexto: string;
  obj: TChamadoController;
begin
  FNumChamado := IdChamado;
  obj := TChamadoController.Create;
  try
    obj.LocalizarId(IdChamado);

    sTexto := '<html>';
    sTexto := sTexto + 'Caro(a) : ' + obj.Model.CDSCadastroCli_Nome.AsString +
    ', segue abaixo informações referente ao chamado realizado na Domper Consultoria e Sistemas: <br><br>';
    sTexto := sTexto + 'Nº Chamado : ' + FormatFloat('000000', obj.Model.CDSCadastroCha_Id.AsFloat) + '<br>';
    sTexto := sTexto + 'Data Abertura : ' + obj.Model.CDSCadastroCha_DataAbertura.AsString + ' - Hora : ' + obj.Model.CDSCadastroCha_HoraAbertura.AsString + '<br>';
    sTexto := sTexto + 'Aberto por : ' + obj.Model.CDSCadastroUsu_Nome.AsString + '<br>';
    sTexto := sTexto + 'Descrição : ' + obj.Model.CDSCadastroCha_Descricao.AsString + '<br>';
    sTexto := sTexto + '<br>';

    if FTipoEntrada = teChamado then
      sTexto := sTexto + FMensagemFinal;

    sTexto := sTexto + '</html>';
    Result := sTexto;
  finally
    FreeAndNil(obj);
  end;
end;

function TEmailEmpresa.TextoEmailChamadoOcorrencia(IdChamado: integer): string;
var
  obj: TChamadoController;
  stexto: string;
begin
  obj := TChamadoController.Create;
  try
    stexto := TextoEmailChamado(IdChamado);

    obj.LocalizarChamadoOcorrencia(IdChamado);
    while not obj.Model.CDSChamadoOcorrenciaCons.Eof do
    begin
      stexto := stexto + 'Usuário : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome1.AsString + '<br>';
      if obj.Model.CDSChamadoOcorrenciaConsUsu_Nome1.AsString <> '' then
        stexto := stexto + 'Colaborador 1 : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome1.AsString + '<br>';

      if obj.Model.CDSChamadoOcorrenciaConsUsu_Nome2.AsString <> '' then
        stexto := stexto + 'Colaborador 2 : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome2.AsString + '<br>';

      if obj.Model.CDSChamadoOcorrenciaConsUsu_Nome3.AsString <> '' then
        stexto := stexto + 'Colaborador 3 : ' + obj.Model.CDSChamadoOcorrenciaConsUsu_Nome3.AsString + '<br>';

      stexto := stexto + 'Data : ' + obj.Model.CDSChamadoOcorrenciaConsChOco_Data.AsString + '<br>';
      stexto := stexto + 'Hora Inicial : ' + obj.Model.CDSChamadoOcorrenciaConsChOco_HoraInicio.AsString + '<br>';
      stexto := stexto + 'Hora Final : ' + obj.Model.CDSChamadoOcorrenciaConsChOco_HoraFim.AsString + '<br>';
      stexto := stexto + 'Solução : ' + obj.Model.CDSChamadoOcorrenciaConsChOco_DescricaoSolucao.AsString + '<br><br>';
      obj.Model.CDSChamadoOcorrenciaCons.Next;
    end;

    if FTipoEntrada = teOcorrencia then
      stexto := stexto + FMensagemFinal;

    Result := stexto;
  finally
    FreeAndNil(obj);
  end;
end;

end.
