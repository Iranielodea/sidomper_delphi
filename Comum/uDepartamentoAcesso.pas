unit uDepartamentoAcesso;

interface

uses System.Generics.Collections, System.SysUtils;

type
  TDepartamentoAcesso = class
  private
    FExcluir: Boolean;
    FIncluir: Boolean;
    FTabela: string;
    FPrograma: Integer;
    FRelatorio: Boolean;
    FAcesso: Boolean;
    FEditar: Boolean;
  public
    property Programa: Integer read FPrograma write FPrograma;
    property Tabela: string read FTabela write FTabela;
    property Acesso: Boolean read FAcesso write FAcesso;
    property Incluir: Boolean read FIncluir write FIncluir;
    property Editar: Boolean read FEditar write FEditar;
    property Excluir: Boolean read FExcluir write FExcluir;
    property Relatorio: Boolean read FRelatorio write FRelatorio;
  end;

  TDepartamentoAcessoNegocio = class
  private
    function PopularDados(APrograma: Integer; ATabela: string): TDepartamentoAcesso;
  public
    function Listar: TObjectList<TDepartamentoAcesso>;
  end;

implementation

{ TDepartamentoAcessoNegocio }

function TDepartamentoAcessoNegocio.Listar: TObjectList<TDepartamentoAcesso>;
var
  Lista: TObjectList<TDepartamentoAcesso>;
begin
  Lista := TObjectList<TDepartamentoAcesso>.Create();
  Lista.Add(PopularDados(001, 'Chamados'));
  Lista.Add(PopularDados(002, 'Visitas'));
  Lista.Add(PopularDados(003, 'Solicitações'));
  Lista.Add(PopularDados(004, 'Versao'));
  Lista.Add(PopularDados(006, 'Base Conh.'));
  Lista.Add(PopularDados(100, 'Revenda'));
  Lista.Add(PopularDados(101, 'Produto'));
  Lista.Add(PopularDados(102, 'Modulo'));
  Lista.Add(PopularDados(103, 'Cliente'));
  Lista.Add(PopularDados(104, 'Usuario'));
  Lista.Add(PopularDados(105, 'Departamento'));
  Lista.Add(PopularDados(106, 'Tipo'));
  Lista.Add(PopularDados(107, 'Status'));
  Lista.Add(PopularDados(108, 'Especificações'));
  Lista.Add(PopularDados(109, 'Parâmetros'));
  Lista.Add(PopularDados(110, 'Contas Email'));
  Lista.Add(PopularDados(111, 'Atividades'));
  Lista.Add(PopularDados(112, 'Agendamento'));
  Lista.Add(PopularDados(114, 'Orçamento'));
  Lista.Add(PopularDados(115, 'FormaPagto'));
  Lista.Add(PopularDados(116, 'Observação'));
  Lista.Add(PopularDados(117, 'Mod.Relatório'));
  Lista.Add(PopularDados(118, 'Ramais'));
  Lista.Add(PopularDados(119, 'Recados'));
  Lista.Add(PopularDados(120, 'Escalas'));
  Lista.Add(PopularDados(121, 'Cidades'));
  Lista.Add(PopularDados(122, 'Licencas'));
  Lista.Add(PopularDados(123, 'Feriados'));
  Lista.Add(PopularDados(124, 'Categorias'));
  Lista.Add(PopularDados(125, 'Tab.Preços'));
  Result := Lista;
end;

function TDepartamentoAcessoNegocio.PopularDados(
  APrograma: Integer; ATabela: string): TDepartamentoAcesso;
var
  obj: TDepartamentoAcesso;
begin
  obj := TDepartamentoAcesso.Create;
  obj.Programa := APrograma;
  obj.Tabela := ATabela;
  obj.Acesso := False;
  obj.Incluir := True;
  obj.Editar := True;
  obj.Excluir := True;
  obj.Relatorio := True;

  Result := obj;
end;

end.
