unit uPlanoBackupController;

interface

uses
  System.SysUtils, uRegras, uDM, Data.DB, Vcl.Forms, Data.DBXJSON,
  Data.DBXJSONReflect, Vcl.Dialogs, System.Generics.Collections,uPlanoBackupVO,
  uDMPlanoBackup;

type
  TPlanoBackupController = class
  private
    FModel: TdmPlanoBackup;
  public
    procedure Novo;
    procedure Localizar;
    procedure Excluir(AId: Integer);
    procedure ExcluirItem(AId: Integer);
    procedure Salvar();
    function RegistroExiste(): Boolean;

    property Model: TdmPlanoBackup read FModel write FModel;
    constructor create;
    destructor destroy; override;
  end;

implementation

{ TPlanoBackupController }

uses uFuncoesSIDomper;

constructor TPlanoBackupController.create;
begin
  FModel := TdmPlanoBackup.Create(nil);
end;

destructor TPlanoBackupController.destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TPlanoBackupController.Excluir(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.PlanoBackupExcluir(AId);
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TPlanoBackupController.ExcluirItem(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.PlanoBackupExcluirItem(AId);
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TPlanoBackupController.Localizar;
var
  Negocio: TServerModule2Client;
begin
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.PlanoBackupLocalizar();
    FModel.CDSCadastro.Open;

    FModel.CDSItens.Close;
    Negocio.PlanoBackupLocalizarItem(FModel.CDSCadastroPlb_Id.AsInteger);
    FModel.CDSItens.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TPlanoBackupController.Novo;
begin
  FModel.CDSCadastro.Append;
end;

function TPlanoBackupController.RegistroExiste: Boolean;
begin
  Result := not FModel.CDSCadastro.IsEmpty;
end;

procedure TPlanoBackupController.Salvar;
var
  ListaHoras: TListaHoras;
  Horas : TPlanoBackupItensVO;
  Plano: TPlanoBackupVO;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  oObjetoItemJSON : TJSONValue;
  Negocio: TServerModule2Client;
  Transacao: TServerMethods1Client;
begin
  if Trim(FModel.CDSCadastroPlb_Destino.AsString) = '' then
    raise Exception.Create('Informe o Destino do Backup!');

  Plano := TPlanoBackupVO.Create;
  Plano.Id      := FModel.CDSCadastroPlb_Id.AsInteger;
  Plano.Destino := FModel.CDSCadastroPlb_Destino.AsString;
  Plano.Domingo := FModel.CDSCadastroPlb_Domingo.AsBoolean;
  Plano.Segunda := FModel.CDSCadastroPlb_Segunda.AsBoolean;
  Plano.Terca   := FModel.CDSCadastroPlb_Terca.AsBoolean;
  Plano.Quarta  := FModel.CDSCadastroPlb_Quarta.AsBoolean;
  Plano.Quinta  := FModel.CDSCadastroPlb_Quinta.AsBoolean;
  Plano.Sexta   := FModel.CDSCadastroPlb_Sexta.AsBoolean;
  Plano.Sabado  := FModel.CDSCadastroPlb_Sabado.AsBoolean;
  Plano.Ativo   := FModel.CDSCadastroPlb_Ativo.AsBoolean;
  Plano.DataUltimoBackup := FModel.CDSCadastroPlb_DataUltimoBackup.AsDateTime;

  try
    if FModel.CDSItens.State in [dsEdit, dsInsert] then
      FModel.CDSItens.Post;

    FModel.CDSItens.DisableControls;
    FModel.CDSItens.First;
    ListaHoras := TListaHoras.Create(True);
    while not FModel.CDSItens.Eof do
    begin
      Horas             := TPlanoBackupItensVO.Create;
      Horas.Id          := FModel.CDSItensPlbIte_Id.AsInteger;
      Horas.PlanoBackup := FModel.CDSItensPlbIte_PlanoBackup.AsInteger;
      Horas.Hora        := FModel.CDSItensPlbIte_Hora.AsDateTime;
      Horas.Status      := FModel.CDSItensPlbIte_Status.AsBoolean;
      ListaHoras.Add(Horas);
      FModel.CDSItens.Next;
    end;
    FModel.CDSItens.First;
  finally
    FModel.CDSItens.EnableControls;
  end;

  Marshal := TJSONMarshal.Create;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  Transacao := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    oObjetoItemJSON := Marshal.Marshal(ListaHoras);
    oObjetoJSON     := Marshal.Marshal(Plano);
    try
      Transacao.StartTransacao();
      Negocio.PlanoBackupSalvar(oObjetoJSON, oObjetoItemJSON);
      Transacao.Commit();
    except
      On E: Exception do
      begin
        Transacao.Roolback();
        TFuncoes.MensagemErroBanco(E.Message);
      end;
    end;
  finally
    FreeAndNil(Marshal);
    FreeAndNil(Negocio);
    FreeAndNil(Transacao);
    FreeAndNil(ListaHoras);
  end;
end;

end.
