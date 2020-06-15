unit uDMBase;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, ppComm, ppRelatv,
  ppDB, ppDBPipe;

type
  TDMBase = class(TDataModule)
    CDSConsulta: TClientDataSet;
    CDSCadastro: TClientDataSet;
    DSConsulta: TDataSource;
    DBConsulta: TppDBPipeline;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBase: TDMBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
