unit uDMRelVersao;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient, ppProd,
  ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppCtrls, ppBands,
  ppPrnabl, ppCache, ppDesignLayer, ppParameter, ppVar, ppStrtch, ppRichTx,
  ppMemo, Vcl.Imaging.jpeg, uFuncoesSIDomper, ppSubRpt;

type
  TDMRelVersao = class(TDataModule)
    CDSRelVersao: TClientDataSet;
    CDSRelVersaoVer_Id: TAutoIncField;
    CDSRelVersaoVer_Versao: TStringField;
    CDSRelVersaoSol_Tipo: TIntegerField;
    CDSRelVersaoTip_Nome: TWideStringField;
    CDSRelVersaoQuantidade: TIntegerField;
    dsRelVersao: TDataSource;
    dbRelVersao: TppDBPipeline;
    RelVersao: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel5: TppLabel;
    CalcTotal: TppDBCalc;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppLabel6: TppLabel;
    CDSRelVersaoPercentual: TFloatField;
    ppDBText4: TppDBText;
    ppDBCalc1: TppDBCalc;
    CDSRelVersaoDoc: TClientDataSet;
    CDSRelVersaoDocVer_Id: TAutoIncField;
    CDSRelVersaoDocVer_Versao: TStringField;
    CDSRelVersaoDocSol_Tipo: TIntegerField;
    CDSRelVersaoDocProd_Nome: TWideStringField;
    CDSRelVersaoDocMod_Nome: TWideStringField;
    CDSRelVersaoDocSol_DescricaoLiberacao: TMemoField;
    dsRelVersaoDoc: TDataSource;
    dbRelVersaoDoc: TppDBPipeline;
    relVersaoDoc: TppReport;
    ppParameterList2: TppParameterList;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand2: TppSummaryBand;
    ppLabel7: TppLabel;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppLabel12: TppLabel;
    ppDBRichText1: TppDBRichText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine8: TppLine;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppLabel8: TppLabel;
    ppFooterBand1: TppFooterBand;
    ppLabel9: TppLabel;
    ppImage2: TppImage;
    CDSRelVersaoDocProd_Codigo: TIntegerField;
    CDSRelVersaoDocProd_Id: TAutoIncField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine3: TppLine;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppDBText10: TppDBText;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    lblPeriodoVersao: TppLabel;
    CDSRelVersaoDocTotalHoras: TFloatField;
    CDSRelVersaoDocC_TotalHoras: TStringField;
    ppLabel11: TppLabel;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppTitleBand1: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppLine7: TppLine;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLine9: TppLine;
    ppLabel16: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppLabel17: TppLabel;
    ppDBText15: TppDBText;
    lblTotalHoras: TppLabel;
    dbCalcHoras: TppDBCalc;
    ppLabel18: TppLabel;
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSRelVersaoCalcFields(DataSet: TDataSet);
    procedure CDSRelVersaoDocCalcFields(DataSet: TDataSet);
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
  private
    { Private declarations }
    FQtdeTotal: Integer;
  public
    { Public declarations }
    procedure ImpressaoRelatorio1(AQtdeTotal: Integer);
    procedure ImpressaoRelatorioEstatistica(AQtdeTotal: Integer);
    procedure ImpressaoRelatorio2;
    procedure ImpressaoRelatorio3(APeriodo: string);
  end;

var
  DMRelVersao: TDMRelVersao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMRelVersao.CDSRelVersaoCalcFields(DataSet: TDataSet);
var
  percentual: Double;
begin
  if CDSRelVersao.State = dsInternalCalc then
  begin
    try
      percentual := (CDSRelVersaoQuantidade.AsInteger / FQtdeTotal) * 100;
    except
      percentual := 0;
    end;
    CDSRelVersaoPercentual.AsFloat := percentual;
  end;
end;

procedure TDMRelVersao.CDSRelVersaoDocCalcFields(DataSet: TDataSet);
begin
  CDSRelVersaoDocC_TotalHoras.AsString := TFuncoes.DecimalToHora(CDSRelVersaoDocTotalHoras.AsFloat);
end;

procedure TDMRelVersao.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao;
  end;
end;

procedure TDMRelVersao.ImpressaoRelatorio1(AQtdeTotal: Integer);
begin
  FQtdeTotal    := AQtdeTotal;

  RelVersao.Print;
  CDSRelVersao.Close;
end;

procedure TDMRelVersao.ImpressaoRelatorio2;
begin
  lblPeriodoVersao.Caption := '';
  CDSRelVersaoDoc.Close;
  CDSRelVersaoDoc.Open;
  relVersaoDoc.Print;
  CDSRelVersaoDoc.Close;
end;

procedure TDMRelVersao.ImpressaoRelatorio3(APeriodo: string);
begin
  lblPeriodoVersao.Caption := APeriodo;
  relVersaoDoc.Print;
  CDSRelVersaoDoc.Close;
end;

procedure TDMRelVersao.ImpressaoRelatorioEstatistica(AQtdeTotal: Integer);
begin
  FQtdeTotal    := AQtdeTotal;
  CDSRelVersao.Close;
  CDSRelVersao.Open;
end;

procedure TDMRelVersao.ppGroupFooterBand3BeforePrint(Sender: TObject);
begin
  lblTotalHoras.Caption := TFuncoes.DecimalToHora(dbCalcHoras.Value);
end;

end.
