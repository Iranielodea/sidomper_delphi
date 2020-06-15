unit uDMRelAtividade;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, ppDB, ppDBPipe, ppParameter,
  ppDesignLayer, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppComm, ppRelatv,
  ppProd, ppReport, Datasnap.DBClient, ppStrtch, ppSubRpt, ppVar, ppMemo,
  ppRichTx;

type
  TDMRelAtividade = class(TDataModule)
    CDSRelChamadoDetModelo1: TClientDataSet;
    RelChamadoModelo1: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand2: TppDetailBand;
    ppDBText4: TppDBText;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppParameterList2: TppParameterList;
    dbRelChamadoModelo1: TppDBPipeline;
    dsRelChamadoDetModelo1: TDataSource;
    dsRelChamadoModelo1: TDataSource;
    CDSRelChamadoModelo1: TClientDataSet;
    CDSRelChamadoModelo1Cha_Id: TAutoIncField;
    CDSRelChamadoModelo1Cha_DataAbertura: TDateField;
    CDSRelChamadoModelo1Cha_HoraAbertura: TTimeField;
    CDSRelChamadoModelo1Cha_Contato: TStringField;
    CDSRelChamadoModelo1Cha_Nivel: TIntegerField;
    CDSRelChamadoModelo1Nivel: TStringField;
    CDSRelChamadoModelo1Tip_Nome: TWideStringField;
    CDSRelChamadoModelo1Sta_Nome: TWideStringField;
    CDSRelChamadoModelo1QRelChamadoDetModelo1: TDataSetField;
    CDSRelChamadoModelo1Cli_Codigo: TIntegerField;
    CDSRelChamadoModelo1Cli_Nome: TWideStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    lblTitulo1: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLine1: TppLine;
    ppLabel11: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLine2: TppLine;
    ppDBCalc2: TppDBCalc;
    ppLabel12: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLine3: TppLine;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    dbRelChamadoDetModelo1: TppDBPipeline;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine4: TppLine;
    ppLabel17: TppLabel;
    ppLine5: TppLine;
    ppDBText13: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    CDSRelChamadoModelo1TotalHoraDecimal: TFloatField;
    CDSRelChamadoModelo1TotalHoras: TStringField;
    CDSRelChamadoDetModelo1ChOco_Data: TDateField;
    CDSRelChamadoDetModelo1ChOco_HoraInicio: TTimeField;
    CDSRelChamadoDetModelo1ChOco_HoraFim: TTimeField;
    CDSRelChamadoDetModelo1ChOco_DescricaoSolucao: TStringField;
    CDSRelChamadoDetModelo1Usu_UserName: TWideStringField;
    ppLabel18: TppLabel;
    lblTotalHorasModelo1: TppLabel;
    SumTotalHorasModelo1: TppDBCalc;
    ppLine6: TppLine;
    CDSRelChamadoDetModelo1ChOco_TotalHoras: TFloatField;
    ppLine7: TppLine;
    lblPeriodoModelo1: TppLabel;
    ppDBRichText1: TppDBRichText;
    CDSRelChamadoModelo2: TClientDataSet;
    dsRelChamadoDetModelo2: TDataSource;
    CDSRelChamadoModelo2Cli_Codigo: TIntegerField;
    CDSRelChamadoModelo2Cli_Nome: TWideStringField;
    CDSRelChamadoModelo2Rev_Codigo: TIntegerField;
    CDSRelChamadoModelo2Rev_Nome: TWideStringField;
    CDSRelChamadoModelo2QtdeChamados: TIntegerField;
    dbRelChamadoModelo2: TppDBPipeline;
    RelChamadoModelo2: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers3: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppLabel10: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    txtQtdeHorasModelo2: TppDBText;
    lblTotalHorasModelo2: TppLabel;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel23: TppLabel;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppLine8: TppLine;
    ppLabel24: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppLine9: TppLine;
    ppLabel25: TppLabel;
    sumTotalHorasModelo2: TppDBCalc;
    lblTotalHorasGeralModelo2: TppLabel;
    lblSubTotalHorasModelo2: TppLabel;
    sumSubTotalHorasModelo2: TppDBCalc;
    lblPeriodoModelo2: TppLabel;
    ppDBCalc5: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    CDSRelChamadoModelo3: TClientDataSet;
    dsRelChamadoModelo3: TDataSource;
    dbRelChamadoModelo3: TppDBPipeline;
    RelChamadoModelo3: TppReport;
    CDSRelChamadoModelo3Usu_Codigo: TIntegerField;
    CDSRelChamadoModelo3QtdeChamados: TIntegerField;
    CDSRelChamadoModelo3TotalHoras: TFloatField;
    ppParameterList3: TppParameterList;
    ppDesignLayers4: TppDesignLayers;
    ppDesignLayer4: TppDesignLayer;
    ppHeaderBand3: TppHeaderBand;
    ppDetailBand4: TppDetailBand;
    ppLabel26: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppSummaryBand4: TppSummaryBand;
    ppLine10: TppLine;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    txtQtdeHorasModelo3: TppDBText;
    lblTotalHorasModelo3: TppLabel;
    ppLabel33: TppLabel;
    ppDBCalc8: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    sumTotalHorasModelo3: TppDBCalc;
    lblTotalHorasGeralModelo3: TppLabel;
    lblPeriodoModelo3: TppLabel;
    CDSRelChamadoModelo4: TClientDataSet;
    dsRelChamadoModelo4: TDataSource;
    dbRelChamadoModelo4: TppDBPipeline;
    RelChamadoModelo4: TppReport;
    CDSRelChamadoModelo4Tip_Codigo: TIntegerField;
    CDSRelChamadoModelo4Tip_Nome: TWideStringField;
    CDSRelChamadoModelo4Rev_Codigo: TIntegerField;
    CDSRelChamadoModelo4Rev_Nome: TWideStringField;
    CDSRelChamadoModelo4QtdeChamados: TIntegerField;
    ppParameterList4: TppParameterList;
    ppDesignLayers5: TppDesignLayers;
    ppDesignLayer5: TppDesignLayer;
    ppHeaderBand4: TppHeaderBand;
    ppDetailBand5: TppDetailBand;
    ppSummaryBand5: TppSummaryBand;
    ppSystemVariable7: TppSystemVariable;
    ppSystemVariable8: TppSystemVariable;
    ppLabel19: TppLabel;
    ppLabel27: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLine12: TppLine;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppLabel36: TppLabel;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    txtQtdeHorasModelo4: TppDBText;
    lblTotalHorasModelo4: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppLine13: TppLine;
    lblPeriodoModelo4: TppLabel;
    sumSubTotalHorasModelo41: TppDBCalc;
    lblSubTotalHorasModelo4: TppLabel;
    sumTotalHorasModelo41: TppDBCalc;
    lblTotalHorasGeralModelo4: TppLabel;
    sumSubTotalHorasModelo4: TppDBCalc;
    sumTotalHorasModelo4: TppDBCalc;
    ppShape2: TppShape;
    ppGroup5: TppGroup;
    ppGroupHeaderBand5: TppGroupHeaderBand;
    ppGroupFooterBand5: TppGroupFooterBand;
    CDSRelChamadoModelo3Usu_Nome: TWideStringField;
    CDSRelChamadoModelo4TotalHoras: TFloatField;
    CDSRelChamadoModelo2TotalHoras: TFloatField;
    ppLine11: TppLine;
    CDSRelChamadoModelo3A: TClientDataSet;
    CDSRelChamadoModelo3TotalHorasDetalhes: TFloatField;
    CDSRelChamadoModelo3AUsu_Codigo: TIntegerField;
    CDSRelChamadoModelo3AQtdeChamados: TIntegerField;
    CDSRelChamadoModelo3ATotalHoras: TFloatField;
    CDSRelChamadoModelo3AUsu_Nome: TStringField;
    CDSRelChamadoModelo3ATotalHorasDetalhes: TFloatField;
    ppLabel2: TppLabel;
    txtQtdeHorasColabModelo3: TppDBText;
    lblTotalHorasColabModelo3: TppLabel;
    sumTotalHorasColabModelo3: TppDBCalc;
    lblTotalHorasGeralColabModelo3: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppSystemVariable10: TppSystemVariable;
    ppSystemVariable11: TppSystemVariable;
    ppSystemVariable12: TppSystemVariable;
    CDSRelChamadoModelo1TotalHorasGeral: TFloatField;
    ppLabel31: TppLabel;
    SumTotalHorasModelo1A: TppDBCalc;
    lblTotalHorasModelo1A: TppLabel;
    ppLabel32: TppLabel;
    SumTotalHorasModelo1B: TppDBCalc;
    lblTotalHorasModelo1B: TppLabel;
    procedure DataModuleCreate(Sender: TObject);
    procedure ppDetailBand3BeforePrint(Sender: TObject);
    procedure ppDetailBand4BeforePrint(Sender: TObject);
    procedure ppDetailBand5BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand4BeforePrint(Sender: TObject);
    procedure ppSummaryBand2BeforePrint(Sender: TObject);
    procedure ppSummaryBand3BeforePrint(Sender: TObject);
    procedure ppSummaryBand4BeforePrint(Sender: TObject);
    procedure ppSummaryBand5BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ImpressaoModelo3(ADataInicial, ADataFinal: string);
  end;

var
  DMRelAtividade: TDMRelAtividade;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesSIDomper;

{$R *.dfm}

procedure TDMRelAtividade.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao;
  end;
  CDSRelChamadoModelo3A.CreateDataSet;
end;

procedure TDMRelAtividade.ImpressaoModelo3(ADataInicial, ADataFinal: string);
begin
  while not CDSRelChamadoModelo3.Eof do
  begin
    if CDSRelChamadoModelo3A.Locate('Usu_Codigo', CDSRelChamadoModelo3Usu_Codigo.AsInteger,[]) then
    begin
      CDSRelChamadoModelo3A.Edit;
      CDSRelChamadoModelo3AQtdeChamados.AsInteger     := CDSRelChamadoModelo3AQtdeChamados.AsInteger + CDSRelChamadoModelo3QtdeChamados.AsInteger;
      CDSRelChamadoModelo3ATotalHoras.AsFloat         := CDSRelChamadoModelo3ATotalHoras.AsFloat + CDSRelChamadoModelo3TotalHoras.AsFloat;
      CDSRelChamadoModelo3ATotalHorasDetalhes.AsFloat := CDSRelChamadoModelo3ATotalHorasDetalhes.AsFloat + CDSRelChamadoModelo3TotalHorasDetalhes.AsFloat;
    end
    else begin
      CDSRelChamadoModelo3A.Append;
      CDSRelChamadoModelo3AUsu_Codigo.AsInteger       := CDSRelChamadoModelo3Usu_Codigo.AsInteger;
      CDSRelChamadoModelo3AQtdeChamados.AsInteger     := CDSRelChamadoModelo3QtdeChamados.AsInteger;
      CDSRelChamadoModelo3ATotalHoras.AsFloat         := CDSRelChamadoModelo3TotalHoras.AsFloat;
      CDSRelChamadoModelo3AUsu_Nome.AsString          := CDSRelChamadoModelo3Usu_Nome.AsString;
      CDSRelChamadoModelo3ATotalHorasDetalhes.AsFloat := CDSRelChamadoModelo3TotalHorasDetalhes.AsFloat;
    end;

    CDSRelChamadoModelo3A.Post;
    CDSRelChamadoModelo3.Next;
  end;

//  CDSRelChamadoModelo3A.IndexFieldNames := 'Usu_Nome';

  lblPeriodoModelo3.Caption := 'Período de ' + ADataInicial + ' Até ' + ADataFinal;
  RelChamadoModelo3.Print;
end;

procedure TDMRelAtividade.ppDetailBand3BeforePrint(Sender: TObject);
begin
    lblTotalHorasModelo2.Caption := TFuncoes.DecimalToHora(StrToFloatDef(txtQtdeHorasModelo2.Text,0));
end;

procedure TDMRelAtividade.ppDetailBand4BeforePrint(Sender: TObject);
begin
  lblTotalHorasModelo3.Caption := TFuncoes.DecimalToHora(StrToFloatDef(txtQtdeHorasModelo3.Text,0));
  lblTotalHorasColabModelo3.Caption := TFuncoes.DecimalToHora(StrToFloatDef(txtQtdeHorasColabModelo3.Text,0));
end;

procedure TDMRelAtividade.ppDetailBand5BeforePrint(Sender: TObject);
begin
  lblTotalHorasModelo4.Caption := TFuncoes.DecimalToHora(StrToFloatDef(txtQtdeHorasModelo4.Text,0));
end;

procedure TDMRelAtividade.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
  lblTotalHorasModelo1A.Caption := TFuncoes.DecimalToHora(SumTotalHorasModelo1A.Value);
end;

procedure TDMRelAtividade.ppGroupFooterBand2BeforePrint(Sender: TObject);
begin
  lblSubTotalHorasModelo2.Caption := TFuncoes.DecimalToHora(sumSubTotalHorasModelo2.Value);
end;

procedure TDMRelAtividade.ppGroupFooterBand4BeforePrint(Sender: TObject);
begin
  lblSubTotalHorasModelo4.Caption := TFuncoes.DecimalToHora(sumSubTotalHorasModelo4.Value);
end;

procedure TDMRelAtividade.ppSummaryBand1BeforePrint(Sender: TObject);
begin
  lblTotalHorasModelo1B.Caption := TFuncoes.DecimalToHora(SumTotalHorasModelo1B.Value);
end;

procedure TDMRelAtividade.ppSummaryBand2BeforePrint(Sender: TObject);
begin
  lblTotalHorasModelo1.Caption := TFuncoes.DecimalToHora(SumTotalHorasModelo1.Value);
end;

procedure TDMRelAtividade.ppSummaryBand3BeforePrint(Sender: TObject);
begin
  lblTotalHorasGeralModelo2.Caption := TFuncoes.DecimalToHora(sumTotalHorasModelo2.Value);
end;

procedure TDMRelAtividade.ppSummaryBand4BeforePrint(Sender: TObject);
begin
  lblTotalHorasGeralModelo3.Caption := TFuncoes.DecimalToHora(sumTotalHorasModelo3.Value);
  lblTotalHorasGeralColabModelo3.Caption := TFuncoes.DecimalToHora(sumTotalHorasColabModelo3.Value);
end;

procedure TDMRelAtividade.ppSummaryBand5BeforePrint(Sender: TObject);
begin
  lblTotalHorasGeralModelo4.Caption := TFuncoes.DecimalToHora(sumTotalHorasModelo4.Value);
end;

end.
