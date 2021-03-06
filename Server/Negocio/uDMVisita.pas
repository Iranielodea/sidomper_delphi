unit uDMVisita;

interface

uses
  System.SysUtils, System.Classes, uDM, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMVisita = class(TDataModule)
    QRelVisitaModelo01: TFDQuery;
    QRelVisitaModelo02: TFDQuery;
    QRelVisitaModelo03: TFDQuery;
    QRelVisitaModelo04: TFDQuery;
    QRelVisitaModelo08: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVisita: TDMVisita;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
