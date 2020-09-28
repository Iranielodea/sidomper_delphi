unit uQuadroController;

interface

uses
  System.SysUtils, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms,
  Data.DBXJSON, Data.DBXJSONReflect;

type
  TQuadroController = class
  private
    function VerificarChamadoEmAberto(AIdUsuario: Integer): Boolean;
    function VerificarAtividadeEmAberto(AIdUsuario: Integer): Boolean;
    function VerificarSolicitacaoEmAberto(AIdUsuario: Integer): Boolean;
  public
    procedure VerificarTarefaEmAberto(AIdUsuario, APrograma: Integer);
  end;

implementation

{ TQuadroController }

function TQuadroController.VerificarAtividadeEmAberto(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.VerificarQuadroTarefasEmAberto(AIdUsuario, CAtividadePrograma);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TQuadroController.VerificarChamadoEmAberto(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.VerificarQuadroTarefasEmAberto(AIdUsuario, CChamadoPrograma);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TQuadroController.VerificarSolicitacaoEmAberto(AIdUsuario: Integer): Boolean;
var
  Negocio: TServerMethods1Client;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := Negocio.VerificarQuadroTarefasEmAberto(AIdUsuario, CSolicitacaoPrograma);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TQuadroController.VerificarTarefaEmAberto(AIdUsuario,
  APrograma: Integer);
begin

//  Em desenvolvimento = 12 id=14
//	Em Teste Desenvolvimento = 14  id=16
//	Em Teste Final = 16 id=18

  try
    if APrograma = CChamadoPrograma then // chamado
    begin
      if VerificarChamadoEmAberto(AIdUsuario) then
        raise Exception.Create('Usuário com Atividades ou Solicitações em Aberto!');
    end;

    if APrograma = CAtividadePrograma then // atividade
    begin
      if VerificarAtividadeEmAberto(AIdUsuario) then
        raise Exception.Create('Usuário com Chamados ou Solicitações em Aberto!');
    end;

    if APrograma = CSolicitacaoPrograma then // Solicitacao
    begin
      if VerificarSolicitacaoEmAberto(AIdUsuario) then
        raise Exception.Create('Usuário com Chamado ou Atividade em Aberto!');
    end;
  except
    on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

end.
