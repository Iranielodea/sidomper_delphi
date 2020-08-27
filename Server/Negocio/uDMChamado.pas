unit uDMChamado;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDM;

type
  TDMChamado = class(TDataModule)
    QRelChamadoModelo01: TFDQuery;
    QRelChamadoModelo02: TFDQuery;
    QRelChamadoModelo03: TFDQuery;
    QRelChamadoModelo04: TFDQuery;
    QRelChamadoModelo03A: TFDQuery;
    QRelChamadoModelo05: TFDQuery;
    QRelChamadoModelo08: TFDQuery;
    QRelChamadoModelo08A: TFDQuery;
    QRelChamadoModelo09: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMChamado: TDMChamado;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
