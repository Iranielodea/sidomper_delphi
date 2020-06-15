unit uDMEscala;

interface

uses
  System.SysUtils, System.Classes, uDM, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdmEscala = class(TDataModule)
    QRellatorio1: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEscala: TdmEscala;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
