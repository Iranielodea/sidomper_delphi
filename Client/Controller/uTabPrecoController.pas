unit uTabPrecoController;

interface

uses
  System.SysUtils, uTabelaPrecoVO, Data.DBXJSON, Data.DBXJSONReflect, uConverter,
  System.Generics.Collections, uRegras, uDM, uFuncoesSIDomper, uDMTabPreco,
  uEnumerador, Vcl.Dialogs, Vcl.Forms, Data.DB;

type
  TTabPrecoController = class
  private
    FModel: TDMTabPreco;
    FOperacao: TOperacao;
    function FiltrarTemp(Campo, Texto, Ativo: string; Contem: Boolean; Id: Integer=0): TObjectList<TTabPrecoConsulta>;
    procedure Post();
  public
    procedure ModoEdicaoInsercao;
    procedure Editar(AId: Integer; AFormulario: TForm);
    function Salvar(IdUsuario: Integer): Integer;
    procedure ObterPorId(Id: integer);
    procedure Cancelar();
    procedure FiltrarDados(Campo, Texto, Ativo: string; Contem: Boolean; Id: Integer=0);
    procedure Excluir(IdUsuario, Id: Integer);
    procedure Novo(IdUsuario: Integer);
    procedure Relatorio(IdUsuario: Integer);
    property Model: TDMTabPreco read FModel write FModel;

    procedure Filtrar(ACampo, ATexto, AAtivo: string; AContem: Boolean = False); overload;
    procedure Filtrar(ACampo, ATexto, AAtivo: string; AFiltro: TTabPrecoFiltro; AContem: Boolean = False; AId: Integer = 0); overload;

    constructor Create();
    destructor Destroy; override;

  end;

implementation

{ TTabPrecoController }

procedure TTabPrecoController.Cancelar;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Cancel;
end;

constructor TTabPrecoController.Create;
begin
  inherited create;
  FModel := TDMTabPreco.Create(nil);
end;

destructor TTabPrecoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TTabPrecoController.Editar(AId: Integer; AFormulario: TForm);
var
  Negocio: TServerModule2Client;
  Resultado: Boolean;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Resultado :=  Negocio.Editar(cTabelaPreco, dm.IdUsuario, AId);
      FModel.CDSCadastro.Open;

      FModel.CDSItens.Close;
      FModel.CDSItens.Params[0].AsInteger := AId;
      FModel.CDSItens.Open;

      TFuncoes.HabilitarCampo(AFormulario, Resultado);

      FOperacao := opEditar;
      dm.Desconectar;
    except
      on E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTabPrecoController.Excluir(IdUsuario, Id: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.TabPrecoExcluir(cTabelaPreco, IdUsuario, Id);
      FModel.CDSConsulta.Delete;
      dm.Desconectar;
    except
      on E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TTabPrecoController.FiltrarTemp(Campo, Texto, Ativo: string;
  Contem: Boolean; Id: Integer=0): TObjectList<TTabPrecoConsulta>;
var
//  Item: TTabPrecoConsulta;
  Negocio: TServerModule2Client;
//  Lista: TObjectList<TTabPrecoConsulta>;
begin
//  Lista := TObjectList<TTabPrecoConsulta>.Create();
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      //Result := TConverte.JSONToObject<TListaTabPrecoConsulta>(Negocio.TabPrecoFiltrar(Campo, Texto, Ativo, Contem, Id));
//      Result := Lista;
//      result := TConverte.JSONToObject<TListaTabPrecoConsulta>(Negocio.TabPrecoFiltrar(Campo, Texto, Ativo, Contem, Id));
    except
      on E: Exception do
      begin
        TFuncoes.Excessao(E, 'TTabPrecoController.Filtrar');
      end;
    end;
  finally
    FreeAndNil(Negocio);
//    FreeAndNil(Lista);
  end;

//  try
//    try
//      for Item in Lista do
//      begin
//        FModel.CDSConsulta.Append;
//        FModel.CDSConsultaTab_Id.AsInteger := Item.Id;
//        FModel.CDSConsultaTab_Nome.AsString := Item.Nome;
//        FModel.CDSConsulta.Post;
//      end;
//    except
//      on E: Exception do
//      begin
//        TFuncoes.Excessao(E, 'TTabPrecoController.Filtrar');
//      end;
//    end;
//  finally
//    FreeAndNil(Lista);
//  end;
end;

procedure TTabPrecoController.ModoEdicaoInsercao;
begin
  if FModel.CDSCadastro.State = dsBrowse then
    FModel.CDSCadastro.Edit;
end;

procedure TTabPrecoController.Filtrar(ACampo, ATexto, AAtivo: string;
AFiltro: TTabPrecoFiltro; AContem: Boolean = False; AId: Integer = 0);
var
  Negocio: TServerModule2Client;
  oObjetoJSON : TJSONValue;
begin
  dm.Conectar;
  oObjetoJSON := TConverte.ObjectToJSON<TTabPrecoFiltro>(AFiltro);
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSConsulta.Close;
    Negocio.TabPrecoFiltrar(ACampo, ATexto, AAtivo, AContem, oObjetoJSON, AId);
    FModel.CDSConsulta.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTabPrecoController.Filtrar(ACampo, ATexto, AAtivo: string;
  AContem: Boolean);
begin
// nada
end;

procedure TTabPrecoController.FiltrarDados(Campo, Texto, Ativo: string;
  Contem: Boolean; Id: Integer);
var
  Item: TTabPrecoConsulta;
  Lista: TObjectList<TTabPrecoConsulta>;
begin
  Lista := FiltrarTemp(Campo, Texto, Ativo, Contem, Id);
  try
    try
      for Item in Lista do
      begin
        FModel.CDSConsulta.Append;
        FModel.CDSConsultaTab_Id.AsInteger := Item.Id;
        FModel.CDSConsultaTab_Nome.AsString := Item.Nome;
        FModel.CDSConsulta.Post;
      end;
    except
      on E: Exception do
      begin
        TFuncoes.Excessao(E, 'TTabPrecoController.Filtrar');
      end;
    end;
  finally
    FreeAndNil(Lista);
  end;
end;

procedure TTabPrecoController.Novo(IdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      FModel.CDSCadastro.Close;
      Negocio.Novo(cTabelaPreco, IdUsuario);
      FModel.CDSCadastro.Open;

      FModel.CDSCadastro.Append;

      FModel.CDSItens.Close;
      FModel.CDSItens.Params[0].AsInteger := -1;
      FModel.CDSItens.Open;

      FOperacao := opIncluir;
      dm.Desconectar;
    except
      on E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTabPrecoController.ObterPorId(Id: integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    FModel.CDSCadastro.Close;
    Negocio.LocalizarId(cTabelaPreco, Id);
    FModel.CDSCadastro.Open;
    dm.Desconectar;
  finally
    FreeAndNil(Negocio);
  end;
end;

procedure TTabPrecoController.Post;
begin
  if FModel.CDSCadastro.State in [dsEdit, dsInsert] then
    FModel.CDSCadastro.Post;
end;

procedure TTabPrecoController.Relatorio(IdUsuario: Integer);
var
  Negocio: TServerModule2Client;
begin
  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Negocio.TabPrecoRelatorio(cTabelaPreco, IdUsuario);
      dm.Desconectar;
    except
      on E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
end;

function TTabPrecoController.Salvar(IdUsuario: Integer): Integer;
var
  Negocio: TServerModule2Client;
  ConsultaSQL: string;
  model: TTabelaPrecoVO;
  modulo: TTabPrecoModuloVO;
  id: Integer;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
  if FModel.CDSCadastroTab_Data.AsDateTime = 0 then
    raise Exception.Create('Informe a Data!');

  if Trim(FModel.CDSCadastroTab_Nome.AsString) = '' then
    raise Exception.Create('Informe o Nome!');

  dm.Conectar;
  Negocio := TServerModule2Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Post();

      model := TTabelaPrecoVO.Create;
      model.Id := FModel.CDSCadastroTab_Id.AsInteger;
      model.Data := FModel.CDSCadastroTab_Data.AsDateTime;
      model.Referencia := FModel.CDSCadastroTab_Referencia.AsString;
      model.Nome := FModel.CDSCadastroTab_Nome.AsString;
      model.IdProduto := FModel.CDSCadastroTab_Produto.AsInteger;
      model.IdStatus := FModel.CDSCadastroTab_Status.AsInteger;
      model.IdTipo := FModel.CDSCadastroTab_Tipo.AsInteger;
      model.Ativo := FModel.CDSCadastroTab_Ativo.AsBoolean;
      model.ValorImplSimples := FModel.CDSCadastroTab_ValorImplSimples.AsCurrency;
      model.ValorMensalSimples := FModel.CDSCadastroTab_ValorMensalSimples.AsCurrency;
      model.ValorImplRegNormal := FModel.CDSCadastroTab_ValorImplRegNormal.AsCurrency;
      model.ValorMensalRegNormal := FModel.CDSCadastroTab_ValorMensalRegNormal.AsCurrency;
      model.Observacao := FModel.CDSCadastroTab_Observacao.AsString;

      FModel.CDSItens.First;
      while not FModel.CDSItens.Eof do
      begin
        if FModel.CDSItensTabM_Modulo.AsInteger > 0 then
        begin
          modulo := TTabPrecoModuloVO.Create;
          modulo.Id := FModel.CDSItensTabM_Id.AsInteger;
          modulo.IdTabPreco := FModel.CDSItensTabM_TabPreco.AsInteger;
          modulo.IdModulo := FModel.CDSItensTabM_Modulo.AsInteger;

          model.ItensTabela.Add(modulo);
        end;

        FModel.CDSItens.Next;
      end;

      Marshal := TJSONMarshal.Create;
      oObjetoJSON := Marshal.Marshal(model);

      Result := StrToIntDef(Negocio.TabPrecoSalvar(cTabelaPreco, dm.IdUsuario, oObjetoJSON).ToString(),0);

      //Salvar(cTabelaPreco, IdUsuario);
//      FModel.CDSCadastro.ApplyUpdates(0);
      FOperacao := opNavegar;
      dm.Desconectar;
//      FModel.CDSCadastro.Refresh;
    except
      on E: Exception do
      begin
        dm.ErroConexao(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(Marshal);
    FreeAndNil(model);
  end;
end;

end.
