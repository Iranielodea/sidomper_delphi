unit uRamal;

interface
  uses uDM, System.SysUtils, FireDAC.Stan.Param,

  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uRamalVO,
  uGenericDAO, uFireDAC, uRamalItensVO;

  const CConsulta: string =
    'SELECT Ram_Id, Ram_Departamento FROM Ramal ';

type
  TRamal = class(TInterfacedObject, ICadastroInterface)
  private
    procedure ExcluirItem(AIdRamal: Integer; ARamal: TRamalVO);
  public
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarId(AId: Integer): string;
    function FiltrarCodigo(Codigo: integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer); overload;
    function Salvar(ARamal: TRamalVO): Integer; overload;
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
    function ProximoId: Integer;
  end;

implementation

{ TProduto }

uses uUsuario;

function TRamal.Editar(Programa, IdUsuario: Integer): Boolean;
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    Result := usuario.PermissaoEditar(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

procedure TRamal.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
  obj: TFireDAC;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  obj := TFireDAC.create;
  try
    obj.ExecutarSQL('DELETE FROM Ramal WHERE Ram_Id = ' + IntToStr(Id));
  finally
    FreeAndNil(obj);
  end;
end;

procedure TRamal.ExcluirItem(AIdRamal: Integer; ARamal: TRamalVO);
var
  obj: TFireDAC;
  Id: Integer;
  Item: TRamalItensVO;
  achou: Boolean;
begin
// se na lista de objetos não tiver registro e no banco de dados sim
// então excluir do banco de dados o registro da lista de objectos

  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT RamIt_Id FROM Ramal_Itens WHERE RamIt_Ramal = ' + IntToStr(AIdRamal));

    while not obj.Model.Eof do
    begin
      id := obj.Model.Fields[0].AsInteger;
      achou := False;

      for Item in ARamal.Itens do
      begin
        if Item.Id = id then
          achou := True;
      end;

      if achou = False then
        obj.ExecutarSQL('DELETE FROM Ramal_Itens WHERE RamIt_Id = ' + Id.ToString());

      obj.Model.Next;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TRamal.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;

  Result := sConsulta;
end;

function TRamal.FiltrarCodigo(Codigo: integer): string;
begin
  Result := '';
end;

function TRamal.FiltrarId(AId: Integer): string;
begin
  Result := CConsulta + ' WHERE Ram_Id = ' + IntToStr(AId);
end;

procedure TRamal.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
begin
//
end;

function TRamal.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TRamal.Novo(Programa, IdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoIncluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

function TRamal.ProximoCodigo: Integer;
begin
  Result := 0;
end;

function TRamal.ProximoId: Integer;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT IDENT_CURRENT(''Ramal'')');
    Result := obj.Model.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TRamal.Relatorio(Programa, IdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoRelatorio(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;


function TRamal.Salvar(ARamal: TRamalVO): Integer;
var
  Id: Integer;
  Item: TRamalItensVO;
begin
  if ARamal.Departamento.Trim = '' then
    raise Exception.Create('Informe o Departamento!');

  dm.StartTransacao();
  try
    Id := TGenericDAO.Save<TRamalVO>(ARamal);

  // excluir item
    ExcluirItem(Id, ARamal);

  // Salvar Item
    for Item in ARamal.Itens do
    begin
      if Item.Nome.Trim() = '' then
        raise Exception.Create('Informe o Nome nos Itens do Ramal!');

      if Item.Numero <= 0 then
        raise Exception.Create('Informe o Número do Ramal!');

      Item.IdRamal := Id;
      TGenericDAO.Save<TRamalItensVO>(Item);
    end;
    Result := Id;
    dm.Commit();
  except
    on E: Exception do
    begin
      DM.Roolback();
      raise Exception.Create(E.Message);
    end;
  end;
end;


procedure TRamal.Salvar(Programa, IdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoEditar(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

end.
