unit uOrcamentoNAprovado;

interface

uses
  System.SysUtils, uOrcamentoNaoAprovadoVO, uGenericDAO, uFireDAC;

type
  TOrcamentoNAprovado = class
  private
    procedure ExcluirOrcamentoNAprovado(AIdOrcamento: Integer);
  public
    procedure Salvar(AOrcamentoNAprovadoVO: TOrcamentoNaoAprovadoVO);
    function LocalizarId(AId: Integer): TOrcamentoNaoAprovadoVO;
    function LocalizarOrcamento(AIdOrcamento: Integer): TOrcamentoNaoAprovadoVO;
    procedure Excluir(AId: Integer);
  end;

implementation

{ TOrcamentoNAprovado }

procedure TOrcamentoNAprovado.Excluir(AId: Integer);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.ExecutarSQL('DELETE FROM Orcamento_NaoAprovado WHERE OrcNAp_Id = ' + IntToStr(AId));
  finally
    FreeAndNil(obj);
  end;
end;

procedure TOrcamentoNAprovado.ExcluirOrcamentoNAprovado(AIdOrcamento: Integer);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.ExecutarSQL('DELETE FROM Orcamento_NaoAprovado WHERE OrcNAp_Orcamento = ' + IntToStr(AIdOrcamento));
  finally
    FreeAndNil(obj);
  end;
end;

function TOrcamentoNAprovado.LocalizarId(AId: Integer): TOrcamentoNaoAprovadoVO;
var
  orc: TOrcamentoNaoAprovadoVO;
  obj: TFireDAC;
begin
  Orc := TOrcamentoNaoAprovadoVO.create;
  obj := TFireDAC.create;
  try
    obj.Lista.Add('SELECT');
    obj.Lista.Add(' OrcNAp_Id, OrcNAp_Tipo, OrcNAp_Descricao, OrcNAp_Orcamento,');
    obj.Lista.Add(' Tip_Codigo, Tip_Nome');
    obj.Lista.Add(' FROM Orcamento_NaoAprovado');
    obj.Lista.Add(' INNER JOIN Tipo On OrcNAp_Tipo = Tip_Id');
    obj.Lista.Add(' WHERE OrcNAp_Id = ' + IntToStr(AId));
    obj.OpenSQL();

    Orc.Id          := obj.Model.FieldByName('OrcNAp_Id').AsInteger;
    Orc.IdTipo      := obj.Model.FieldByName('OrcNAp_Tipo').AsInteger;
    Orc.IdOrcamento := obj.Model.FieldByName('OrcNAp_Orcamento').AsInteger;
    Orc.Descricao   := obj.Model.FieldByName('OrcNAp_Descricao').AsString;
    orc.Tipo.Nome   := obj.Model.FieldByName('Tip_Nome').AsString;
    Orc.Tipo.Codigo := obj.Model.FieldByName('Tip_Codigo').AsInteger;

    Result := orc;
  finally
    FreeAndNil(obj);
  end;
end;

function TOrcamentoNAprovado.LocalizarOrcamento(
  AIdOrcamento: Integer): TOrcamentoNaoAprovadoVO;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('   OrcNAp_Id');
    obj.Lista.Add(' FROM Orcamento_NaoAprovado');
    obj.Lista.Add(' WHERE OrcNAp_Orcamento = ' + IntToStr(AIdOrcamento));
    obj.OpenSQL();

    Result := LocalizarId(obj.Model.FieldByName('OrcNAp_Id').AsInteger);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TOrcamentoNAprovado.Salvar(
  AOrcamentoNAprovadoVO: TOrcamentoNaoAprovadoVO);
begin
  if AOrcamentoNAprovadoVO.IdTipo = 0 then
    raise Exception.Create('Informe o Tipo!');

  if AOrcamentoNAprovadoVO.Descricao.Trim() = '' then
    raise Exception.Create('Informe a Descrição!');

  ExcluirOrcamentoNAprovado(AOrcamentoNAprovadoVO.IdOrcamento);

  TGenericDAO.Save<TOrcamentoNaoAprovadoVO>(AOrcamentoNAprovadoVO);
end;

end.
