unit uContato;

interface

uses
  System.SysUtils, uContatoVO, uGenericDAO, System.Generics.Collections,
  uFireDAC;

type
  TContato = class
  public
    function Salvar(AContato: TContatoVO): Integer;
    procedure Excluir(AId: Integer);
    function LocalizarPorId(AId: Integer): TContatoVO;
    function LocalizarPorCliente(AIdCliente: Integer): TObjectList<TContatoVO>;
    function LocalizarPorOrcamento(AIdOrcamento: Integer): TObjectList<TContatoVO>;
    procedure ExcluirPorCliente(AIdCliente: Integer);
  end;

implementation

{ TContato }

procedure TContato.Excluir(AId: Integer);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create();
  try
    obj.ExecutarSQL('DELETE FROM Contato WHERE Cont_Id = ' + IntToStr(AId) );
  finally
    FreeAndNil(obj);
  end;
end;

procedure TContato.ExcluirPorCliente(AIdCliente: Integer);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.ExecutarSQL('DELETE FROM Contato WHERE Cont_Cliente = ' + IntToStr(AIdCliente));
  finally
    FreeAndNil(obj);
  end;
end;

function TContato.LocalizarPorCliente(AIdCliente: Integer): TObjectList<TContatoVO>;
var
  obj: TFireDAC;
  Id: Integer;
  Lista: TObjectList<TContatoVO>;
  model: TContatoVO;
begin
  Lista := TObjectList<TContatoVO>.create;
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT Cont_Id, Cont_Nome, Cont_Fone1, Cont_Fone2, Cont_Depto, Cont_Email FROM Contato WHERE Cont_Cliente = ' + IntToStr(AIdCliente));
    while not obj.Model.Eof do
    begin
      model := TContatoVO.Create;
      model.Id := obj.Model.FieldByName('Cont_Id').AsInteger;
      model.Nome := obj.Model.FieldByName('Cont_Nome').AsString;
      model.Fone1 := obj.Model.FieldByName('Cont_Fone1').AsString;
      model.Fone2 := obj.Model.FieldByName('Cont_Fone2').AsString;
      model.Departamento := obj.Model.FieldByName('Cont_Depto').AsString;
      model.Email := obj.Model.FieldByName('Cont_Email').AsString;
      Lista.Add(model);

      obj.Model.Next;
    end;

    Result := Lista;
  finally
    FreeAndNil(obj);
  end;
end;

function TContato.LocalizarPorId(AId: Integer): TContatoVO;
var
  obj: TFireDAC;
  model: TContatoVO;
  Lista: TObjectList<TContatoVO>;
begin
  Lista := TObjectList<TContatoVO>.Create();
  model := TContatoVO.Create;
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add(' Cont_Id');
    obj.Lista.Add(' Cont_Cliente');
    obj.Lista.Add(' Cont_Orcamento');
    obj.Lista.Add(' Cont_Nome');
    obj.Lista.Add(' Cont_Fone1');
    obj.Lista.Add(' Cont_Fone2');
    obj.Lista.Add(' Cont_Depto');
    obj.Lista.Add(' Cont_Email');
    obj.OpenSQL();

    model.Id          := obj.Model.FieldByName('Cont_Id').AsInteger;
    model.IdCliente   := obj.Model.FieldByName('Cont_Cliente').AsInteger;
    model.IdOrcamento := obj.Model.FieldByName('Cont_Corcamento').AsInteger;
    model.Nome        := obj.Model.FieldByName('Cont_Nome').AsString;
    model.Fone1       := obj.Model.FieldByName('Cont_Fone1').AsString;
    model.Fone2       := obj.Model.FieldByName('Cont_Fone2').AsString;
    model.Departamento:= obj.Model.FieldByName('Cont_Depto').AsString;
    model.Email       := obj.Model.FieldByName('Cont_Email').AsString;

    Result := model;
  finally
    FreeAndNil(obj);
  end;
end;

function TContato.LocalizarPorOrcamento(AIdOrcamento: Integer): TObjectList<TContatoVO>;
var
  obj: TFireDAC;
  Id: Integer;
  Lista: TObjectList<TContatoVO>;
  model: TContatoVO;
begin
  Lista := TObjectList<TContatoVO>.create;
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT Cont_Id, Cont_Nome, Cont_Fone1, Cont_Fone2, Cont_Depto, Cont_Email FROM Contato WHERE Cont_Orcamento = ' + IntToStr(AIdOrcamento));
    while not obj.Model.Eof do
    begin
      model := TContatoVO.Create;
      model.Id := obj.Model.FieldByName('Cont_Id').AsInteger;
      model.Nome := obj.Model.FieldByName('Cont_Nome').AsString;
      model.Fone1 := obj.Model.FieldByName('Cont_Fone1').AsString;
      model.Fone2 := obj.Model.FieldByName('Cont_Fone2').AsString;
      model.Departamento := obj.Model.FieldByName('Cont_Depto').AsString;
      model.Email := obj.Model.FieldByName('Cont_Email').AsString;
      Lista.Add(model);

      obj.Model.Next;
    end;

    Result := Lista;
  finally
    FreeAndNil(obj);
  end;
end;

function TContato.Salvar(AContato: TContatoVO): Integer;
begin
  if (AContato.Nome.Trim = '') and
    (AContato.Fone1.Trim = '') and
    (AContato.Fone2.Trim = '') and
    (AContato.Departamento.Trim = '') and
    (AContato.Email.Trim = '') then
      raise Exception.Create('Preencha as Informações!');

    TGenericDAO.Save<TContatoVO>(AContato);
end;

end.
