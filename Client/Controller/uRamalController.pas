unit uRamalController;

interface

uses
  System.SysUtils, uDMRamal, uRegras, uEnumerador, uDM, Data.DB, Vcl.Forms, uFuncoesSIDomper,
  Data.DBXJSON, Data.DBXJSONReflect, uConverter, uGenericProperty, uRamalVO,
  uRamalItensVO;

type
  TRamalController = class
  private
    FModel: TdmRamal;
    FOperacao: TOperacao;
    procedure Post;
  public
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False);
    procedure FiltrarId(AId: Integer);
    procedure LocalizarId(AId: Integer);
    procedure Novo(AIdUsuario: Integer);
    procedure Editar(AId: Integer; AFormulario: TForm);
    function Salvar(AIdUsuario: Integer): Integer;
    procedure Excluir(AIdUsuario, AId: Integer);
    procedure Cancelar();
    procedure Imprimir(AIdUsuario: Integer);
    procedure ListarItens(AIdRamal: Integer);
    procedure ListarTudo();

    property Model: TdmRamal read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TObservacaoController }


procedure TRamalController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

constructor TRamalController.Create;
begin
  inherited Create;
  FModel := TdmRamal.Create(nil);
end;

destructor TRamalController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TRamalController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Editar!');

  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Resultado :=  Negocio.Editar(CRamal, dm.IdUsuario, AId);
    FModel.CDSCadastro.Open;

    ListarItens(AId);

    TFuncoes.HabilitarCampo(AFormulario, Resultado);

    FOperacao := opEditar;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TRamalController.Excluir(AIdUsuario, AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registro para Excluir!');

  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    Negocio.Excluir(CRamal, AIdUsuario, AId);
    FModel.CDSConsulta.Delete;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TRamalController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.Filtrar(CRamal, ACampo, ATexto, AAtivo, AContem);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TRamalController.FiltrarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.RamalFiltrarId(AId);
    FModel.CDSConsulta.Open;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TRamalController.Imprimir(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(dm.Conexao.DBXConnection);
  try
    Negocio.Relatorio(CRamal, AIdUsuario);
    FModel.Rel.Print;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;


procedure TRamalController.ListarItens(AIdRamal: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSItens.Close;
    Negocio.RamalListarItens(AIdRamal);
    FModel.CDSItens.Open;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TRamalController.ListarTudo;
begin
  FModel.CDSImpressao.Close;
  FModel.CDSImpressao.Open;
end;

procedure TRamalController.LocalizarId(AId: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(CRamal, AId);
    FModel.CDSCadastro.Open;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TRamalController.Novo(AIdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.Novo(CRamal, AIdUsuario);
    FModel.CDSCadastro.Open;

    ListarItens(0);

    FModel.CDSCadastro.Append;

    FOperacao := opIncluir;
  finally
    FreeAndNil(Negocio);
    DM.Desconectar;
  end;
end;

procedure TRamalController.Post;
begin
  if FModel.CDSConsulta.State in [dsEdit, dsInsert] then
    FModel.CDSConsulta.Post;
end;

function TRamalController.Salvar(AIdUsuario: Integer): Integer;
var
  Negocio: TServerModule2Client;
  ObjVO: TRamalVO;
  ItensVO: TRamalItensVO;
  oObjetoJSON : TJSONValue;
begin
  ObjVO := TRamalVO.Create;
  DM.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
//      ObjVO.Id := FModel.CDSCadastroRam_Id.AsInteger;
//      ObjVO.Departamento := FModel.CDSCadastroRam_Departamento.AsString;

      TGenericProperty.SetProperty<TRamalVO>(ObjVO, FModel.cdsCadastro);

      FModel.CDSItens.DisableControls;
      try
        FModel.CDSItens.First;
        while not FModel.CDSItens.Eof do
        begin
          ItensVO := TRamalItensVO.Create;
          ItensVO.Id      := FModel.CDSItensRamIt_Id.AsInteger;
          ItensVO.IdRamal := FModel.CDSItensRamIt_Ramal.AsInteger;
          ItensVO.Nome    := FModel.CDSItensRamIt_Nome.AsString;
          ItensVO.Numero  := FModel.CDSItensRamIt_Numero.AsInteger;
          ObjVO.Itens.Add(ItensVO);
          FModel.CDSItens.Next;
        end;
      finally
        FModel.CDSItens.First;
        FModel.CDSItens.EnableControls;
      end;

      oObjetoJSON := TConverte.ObjectToJSON(ObjVO);

      Result := StrToIntDef(Negocio.RamalSalvar(AIdUsuario, oObjetoJSON).ToString(),0);
      Post;
      FOperacao := opNavegar;
    except
      on E: Exception do
      begin
        TFuncoes.MensagemErroBanco(E.Message);
        Abort;
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(ObjVO);
    DM.Desconectar;
  end;
end;

end.

