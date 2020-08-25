unit uDMVersao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uFiltroVersao, uEnumerador,
  uFuncoesServidor, Vcl.Dialogs;

type
  TDMVersao = class(TDataModule)
    QVersaoVersao: TFDQuery;
    QVersaoQtde: TFDQuery;
    QVersaoModelo3: TFDQuery;
  private

    { Private declarations }
  public
    { Public declarations }
    function SqlModel3(AFiltro: TFiltroVersao): string;
  end;

var
  DMVersao: TDMVersao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMVersao }

function TDMVersao.SqlModel3(AFiltro: TFiltroVersao): string;
var
  InstrucaoSQL: string;
begin
  InstrucaoSQL := '';
  InstrucaoSQL := InstrucaoSQL + ' SELECT';
  InstrucaoSQL := InstrucaoSQL + '	Ver_Id,';
  InstrucaoSQL := InstrucaoSQL + '	Ver_Versao,';
  InstrucaoSQL := InstrucaoSQL + '	Sol_Tipo,';
  InstrucaoSQL := InstrucaoSQL + '	Prod_Nome,';
  InstrucaoSQL := InstrucaoSQL + '	Mod_Nome,';
  InstrucaoSQL := InstrucaoSQL + '	Prod_Id,';
  InstrucaoSQL := InstrucaoSQL + '	Prod_Codigo,';
  InstrucaoSQL := InstrucaoSQL + '	Sol_DescricaoLiberacao, ';
  InstrucaoSQL := InstrucaoSQL + '	(SELECT SUM(STemp_TotalHoras) FROM Solicitacao_Tempo ';
  InstrucaoSQL := InstrucaoSQL + '			WHERE STemp_Solicitacao = sol_id ';
  InstrucaoSQL := InstrucaoSQL + '		) as TotalHoras';
  InstrucaoSQL := InstrucaoSQL + ' FROM Versao ';
  InstrucaoSQL := InstrucaoSQL + '	LEFT JOIN Solicitacao On Ver_Id = Sol_VersaoId ';
  InstrucaoSQL := InstrucaoSQL + '	LEFT JOIN Produto On Ver_Produto = Prod_Id ';
  InstrucaoSQL := InstrucaoSQL + '	LEFT JOIN Modulo On Sol_Modulo = Mod_Id ';
  InstrucaoSQL := InstrucaoSQL + '	WHERE Ver_Id IS NOT NULL';
  if AFiltro.DataInicial.Trim <> DataEmBranco then
    InstrucaoSQL := InstrucaoSQL + ' AND Ver_DataInicio >= ' + TFuncoes.DataIngles(AFiltro.DataInicial);
  if AFiltro.DataFinal.Trim <> DataEmBranco then
    InstrucaoSQL := InstrucaoSQL + ' AND Ver_DataInicio <= ' + TFuncoes.DataIngles(AFiltro.DataFinal);

  if AFiltro.DataLiberacaoInicial.Trim <> DataEmBranco then
    InstrucaoSQL := InstrucaoSQL + ' AND Ver_DataLiberacao >= ' + TFuncoes.DataIngles(AFiltro.DataLiberacaoInicial);
  if AFiltro.DataLiberacaoFinal.Trim <> DataEmBranco then
    InstrucaoSQL := InstrucaoSQL + ' AND Ver_DataLiberacao <= ' + TFuncoes.DataIngles(AFiltro.DataLiberacaoFinal);

  if AFiltro.IdCliente <> '' then
    InstrucaoSQL := InstrucaoSQL + ' AND Sol_Cliente = ' + AFiltro.IdCliente;
  if AFiltro.IdTipo <> '' then
    InstrucaoSQL := InstrucaoSQL + ' AND Ver_Tipo in ' + AFiltro.IdTipo;
  if AFiltro.IdStatus <> '' then
    InstrucaoSQL := InstrucaoSQL + ' AND Ver_Status in ' + AFiltro.IdStatus;
  if AFiltro.IdUsuario <> '' then
    InstrucaoSQL := InstrucaoSQL + ' AND Ver_Usuario in (' + AFiltro.IdUsuario + ')';
  if AFiltro.IdProduto <> '' then
    InstrucaoSQL := InstrucaoSQL + ' AND Prod_Id in ' + AFiltro.IdProduto;
  if AFiltro.IdVersao > 0 then
    InstrucaoSQL := InstrucaoSQL + ' AND Ver_Id = ' + IntToStr(AFiltro.IdVersao);

  InstrucaoSQL := InstrucaoSQL + '	ORDER BY Prod_Nome, Prod_Codigo, Ver_id, Mod_Nome';
  Result := InstrucaoSQL;
end;

end.
