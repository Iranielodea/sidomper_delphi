unit uDMRelSolicitacao;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppBands, ppCtrls,
  ppVar, ppPrnabl, ppCache, ppDesignLayer, ppParameter, ppStrtch, ppSubRpt;

type
  TDMRelSolicitacao = class(TDataModule)
    CDSRelatorio1: TClientDataSet;
    CDSRelatorio1Sol_Id: TAutoIncField;
    CDSRelatorio1Ver_Id: TAutoIncField;
    CDSRelatorio1Ver_Versao: TStringField;
    CDSRelatorio1Sol_Data: TDateField;
    CDSRelatorio1Sol_Hora: TTimeField;
    CDSRelatorio1Sol_Tipo: TIntegerField;
    CDSRelatorio1Sol_Nivel: TIntegerField;
    CDSRelatorio1Cli_Nome: TWideStringField;
    CDSRelatorio1Cli_Fantasia: TWideStringField;
    CDSRelatorio1Tip_Nome: TWideStringField;
    CDSRelatorio1Sta_Nome: TWideStringField;
    CDSRelatorio1Mod_Nome: TWideStringField;
    CDSRelatorio1Prod_Nome: TWideStringField;
    CDSRelatorio1Sol_TempoPrevisto: TBCDField;
    CDSRelatorio1Sol_PrevisaoEntrega: TDateField;
    CDSRelatorio1TotalTempo: TFloatField;
    CDSRelatorio1Analista: TWideStringField;
    CDSRelatorio1Desenvolvedor: TWideStringField;
    CDSRelatorio1QSolicitacaoTempo1: TDataSetField;
    CDSTempo1: TClientDataSet;
    dsPonte: TDataSource;
    CDSTempo1Usu_Nome: TWideStringField;
    CDSTempo1STemp_HoraFim: TTimeField;
    CDSTempo1STemp_HoraInicio: TTimeField;
    CDSTempo1STemp_TotalHoras: TFloatField;
    dbRelatorio1: TppDBPipeline;
    dsRelatorio1: TDataSource;
    dbTempo1: TppDBPipeline;
    dsTempo1: TDataSource;
    Rep01: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel12: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    lblPeriodoRelatorio1: TppLabel;
    CDSRelatorio1Sol_Titulo: TStringField;
    ppDBText17: TppDBText;
    subRelTempo1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel18: TppLabel;
    ppLine2: TppLine;
    ppLabel19: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMRelSolicitacao: TDMRelSolicitacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMRelSolicitacao.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao;
  end;
end;

end.
