unit uUsuarioPermissaoController;

interface

uses
  System.SysUtils, uDMModulo, uRegras, uEnumerador, uDM, Data.DB,
    System.Generics.Collections, uDMUsuario, Data.DBXJSON , Data.DBXJSONReflect,
    uUsuarioPermissaoVO, uConverter, System.Variants;

type
  TUsuarioPermissaoController = class
  private
    FModel: TDMUsuario;

  public
    function PreencherLista: TList<string>;
    procedure LocalizarUsuario(IdUsuario: Integer);
    procedure Exportar();
    function PermissaoSigla(ASigla: string): Boolean;
    function ObterPorSigla(AIdUsuario: Integer; ASigla: string): Boolean;

    property Model: TDMUsuario read FModel write FModel;
    constructor Create();
    destructor Destroy; override;
  end;

implementation

{ TUsuarioPermissaoController }

constructor TUsuarioPermissaoController.Create;
begin
  inherited Create;
  FModel := TDMUsuario.Create(nil);
end;

destructor TUsuarioPermissaoController.Destroy;
begin
  FreeAndNil(FModel);
  inherited;
end;

procedure TUsuarioPermissaoController.Exportar();
var
  Negocio: TServerMethods1Client;
  oObjetoJSON : TJSONValue;
  lista: TObjectList<TUsuarioPermissaoVO>;
  model: TUsuarioPermissaoVO;
begin
  Negocio := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    lista := TConverte.JSONToObject<TListaUsuarioPermissao>(Negocio.UsuarioPermissaoExportar());
    for model in lista do
    begin
      dm.cdsUsuarioPermissao.Append;
      dm.cdsUsuarioPermissaoId.AsInteger := model.Id;
      dm.cdsUsuarioPermissaoIdUsuario.AsInteger := model.IdUsuario;
      dm.cdsUsuarioPermissaoSigla.AsString := model.Sigla;
      dm.cdsUsuarioPermissao.Post;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(lista);
  end;
end;

procedure TUsuarioPermissaoController.LocalizarUsuario(IdUsuario: Integer);
begin
  FModel.CDSListarPermissaoListar.Close;
  FModel.CDSListarPermissaoListar.Params[0].AsInteger := IdUsuario;
  FModel.CDSListarPermissaoListar.Open;
end;

function TUsuarioPermissaoController.ObterPorSigla(AIdUsuario: Integer;
  ASigla: string): Boolean;
begin
  Result := dm.cdsUsuarioPermissao.Locate('UsuP_Id; UsuP_Sigla', VarArrayOf([IntToStr(AIdUsuario), ASigla]), []);
end;

function TUsuarioPermissaoController.PermissaoSigla(ASigla: string): Boolean;
begin
  Result := dm.cdsUsuarioPermissao.Locate('Sigla', ASigla, []);
end;

function TUsuarioPermissaoController.PreencherLista: TList<string>;
var
  lista: TList<string>;
//  Negocio: TServerMethods1Client;
begin
  lista := TList<string>.Create;
  lista.Add('Lib_Chamado_Ocorr_Alt_Data_Hora');
  lista.Add('Lib_Chamado_Ocorr_Alt');
  lista.Add('Lib_Chamado_Ocorr_Exc');
  Result := lista;
end;

end.
