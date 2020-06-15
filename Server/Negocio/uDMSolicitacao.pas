unit uDMSolicitacao;

interface

uses
  System.SysUtils, System.Classes, uDM, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uFiltroSolicitacao;

type
  TDMSolicitacao = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  DMSolicitacao: TDMSolicitacao;
// ainda não utilizado

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
