unit uDMRelUsuario;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient, ppDB,
  ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDBPipe, ppCtrls, ppPrnabl,
  ppVar, ppBands, ppCache, ppDesignLayer, ppParameter, uFuncoesSIDomper,
  uUsuarioVO, System.Generics.Collections;

type
  TDMRelUsuario = class(TDataModule)
    CDSRendimento: TClientDataSet;
    CDSRendimentoTipo: TStringField;
    CDSRendimentoUsu_Codigo: TIntegerField;
    CDSRendimentoUsu_Nome: TWideStringField;
    CDSRendimentoRev_Codigo: TIntegerField;
    CDSRendimentoRev_Nome: TWideStringField;
    CDSRendimentoQtde: TIntegerField;
    CDSRendimentoHoras: TFloatField;
    CDSRelRendimento: TClientDataSet;
    CDSRelRendimentoRev_Codigo: TIntegerField;
    CDSRelRendimentoUsu_Codigo: TIntegerField;
    CDSRelRendimentoUsu_Nome: TStringField;
    CDSRelRendimentoCha_Qtde: TFloatField;
    CDSRelRendimentoCha_Horas: TFloatField;
    CDSRelRendimentoAti_Qtde: TFloatField;
    CDSRelRendimentoAti_Horas: TFloatField;
    CDSRelRendimentoVis_Qtde: TFloatField;
    CDSRelRendimentoVis_Horas: TFloatField;
    CDSRelRendimentoSol_Horas: TFloatField;
    CDSRelRendimentoTotalHoras: TFloatField;
    CDSRelRendimentoDias: TIntegerField;
    CDSRelRendimentoMedia: TFloatField;
    CDSRendimentoValor: TCurrencyField;
    CDSRelRendimentoVis_Valor: TFloatField;
    CDSRelRendimentoRev_Nome: TStringField;
    dsRendimento: TDataSource;
    RelRendimento: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    plbl1: TppLabel;
    lblPeriodo01: TppLabel;
    ppSystemVariable9: TppSystemVariable;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLine1: TppLine;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLine2: TppLine;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLine3: TppLine;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine4: TppLine;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLine5: TppLine;
    ppLabel20: TppLabel;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel21: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    CDSRelRendimentoCha_HorasStr: TStringField;
    CDSRelRendimentoAti_HorasStr: TStringField;
    CDSRelRendimentoVis_HorasStr: TStringField;
    CDSRelRendimentoSol_HorasStr: TStringField;
    CDSRelRendimentoTotalHorasStr: TStringField;
    CDSRelRendimentoMeiaHorasStr: TStringField;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    CalcMedia: TppDBCalc;
    lblChaHora: TppLabel;
    lblAtiHora: TppLabel;
    lblVisHora: TppLabel;
    lblSolHora: TppLabel;
    lblTotalHora: TppLabel;
    CalChaHora: TppDBCalc;
    CalcAtiHora: TppDBCalc;
    CalcVisHora: TppDBCalc;
    CalcSolHora: TppDBCalc;
    CalcTotalHora: TppDBCalc;
    CDSRendimentoDep_Codigo: TIntegerField;
    CDSRendimentoDep_Nome: TWideStringField;
    CDSRelRendimentoDep_Codigo: TIntegerField;
    CDSRelRendimentoDep_Nome: TStringField;
    dbRendimento: TppDBPipeline;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    plbl2: TppLabel;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppLine8: TppLine;
    plbl3: TppLabel;
    CalcMedia1: TppDBCalc;
    plbl4: TppLabel;
    CalcMedia2: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppDBCalc14: TppDBCalc;
    ppDBCalc15: TppDBCalc;
    lblChaHora1: TppLabel;
    lblAtiHora1: TppLabel;
    lblVisHora1: TppLabel;
    lblSolHora1: TppLabel;
    lblTotalHora1: TppLabel;
    lblChaHora2: TppLabel;
    lblAtiHora2: TppLabel;
    lblVisHora2: TppLabel;
    lblSolHora2: TppLabel;
    lblTotalHora2: TppLabel;
    CalChaHora2: TppDBCalc;
    CalcAtiHora2: TppDBCalc;
    CalcVisHora2: TppDBCalc;
    CalcSolHora2: TppDBCalc;
    CalcTotalHora2: TppDBCalc;
    CalChaHora1: TppDBCalc;
    CalcAtiHora1: TppDBCalc;
    CalcVisHora1: TppDBCalc;
    CalcSolHora1: TppDBCalc;
    CalcTotalHora1: TppDBCalc;
    lblMedia2: TppLabel;
    lblMedia1: TppLabel;
    lblMedia: TppLabel;
    CDSRendimentoUsu_Id: TIntegerField;
    CDSRelRendimentoUsu_Id: TIntegerField;
    sumTotalDias2: TppDBCalc;
    sumTotalDias1: TppDBCalc;
    sumTotalDias: TppDBCalc;
    ppLabel6: TppLabel;
    ppLabel14: TppLabel;
    ppLine9: TppLine;
    CDSRelRendimentoDiasUteis: TIntegerField;
    ppDBText18: TppDBText;
    CDSRelRendimentoMediaHorasDiasUteis: TStringField;
    lblMediaHoraUtil: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    lblSubMediaUtil: TppLabel;
    CalcSubMediaHoraUtil: TppDBCalc;
    lblSubMediaUtil2: TppLabel;
    CalcSubMediaHoraUtil2: TppDBCalc;
    CalcMediaHoraUtil2: TppDBCalc;
    lblMediaUtil2: TppLabel;
    procedure DataModuleCreate(Sender: TObject);
    procedure ppSummaryBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand2BeforePrint(Sender: TObject);
    procedure CDSRelRendimentoCalcFields(DataSet: TDataSet);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
    FDiasUteis: Integer;
    procedure FormatarHoras;
    function RetornarDias(AIdUsuario: Integer; ALista: TObjectList<TUsuarioVO>): Integer;
    function CalculoMediaDiasUtil(ATotalHoras: double): string;
  public
    { Public declarations }
    procedure ListarRendimento(ADias: Integer; ADataInicial, ADataFinal: string);
  end;

var
  DMRelUsuario: TDMRelUsuario;

implementation

  uses uUsuarioController;
{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

function TDMRelUsuario.CalculoMediaDiasUtil(ATotalHoras: double): string;
var
  cMedia: double;
begin
  if FDiasUteis > 0 then
  begin
    cMedia := ATotalHoras / FDiasUteis;
    result := TFuncoes.DecimalToHora(cMedia);
  end
  else
    Result := '00:00';
end;

procedure TDMRelUsuario.CDSRelRendimentoCalcFields(DataSet: TDataSet);
begin
  if CDSRelRendimento.State = dsInternalCalc then
  begin
    CDSRelRendimentoDiasUteis.AsInteger := FDiasUteis;
  end;
end;

procedure TDMRelUsuario.DataModuleCreate(Sender: TObject);
begin
  CDSRendimento.RemoteServer := dm.DSPConexao2;
  CDSRelRendimento.CreateDataSet();
end;

procedure TDMRelUsuario.FormatarHoras;
begin
  CDSRelRendimento.First;
  while not CDSRelRendimento.Eof do
  begin
    CDSRelRendimento.Edit;
    if CDSRelRendimentoVis_Valor.AsInteger = 0 then
      CDSRelRendimentoVis_Valor.AsInteger := 0;

    CDSRelRendimentoCha_HorasStr.AsString := TFuncoes.DecimalToHora(CDSRelRendimentoCha_Horas.AsFloat);
    CDSRelRendimentoAti_HorasStr.AsString := TFuncoes.DecimalToHora(CDSRelRendimentoAti_Horas.AsFloat);
    CDSRelRendimentoVis_HorasStr.AsString := TFuncoes.DecimalToHora(CDSRelRendimentoVis_Horas.AsFloat);
    CDSRelRendimentoSol_HorasStr.AsString := TFuncoes.DecimalToHora(CDSRelRendimentoSol_Horas.AsFloat);
    CDSRelRendimentoTotalHorasStr.AsString := TFuncoes.DecimalToHora(CDSRelRendimentoTotalHoras.AsFloat);
    CDSRelRendimentoMeiaHorasStr.AsString := TFuncoes.DecimalToHora(CDSRelRendimentoMedia.AsFloat);

    CDSRelRendimento.Post;
    CDSRelRendimento.Next;
  end;

end;

procedure TDMRelUsuario.ListarRendimento(ADias: Integer; ADataInicial, ADataFinal: string);
var
  bAchou: Boolean;
  ListaUsuario: TObjectList<TUsuarioVO>;
  UsuarioController: TUsuarioController;
  MediaDiasUteis: Double;
begin
  FDiasUteis := ADias;
  UsuarioController := TUsuarioController.Create;
  try
    ListaUsuario := UsuarioController.DiasTrabalhados(ADataInicial, ADataFinal);
  finally
    FreeAndNil(UsuarioController);
  end;

  CDSRelRendimento.First;
  while not CDSRelRendimento.Eof do
    CDSRelRendimento.Delete;

  while not CDSRendimento.Eof do
  begin
    bAchou := False;
    CDSRelRendimento.First;

    while not CDSRelRendimento.Eof do
    begin
      if (CDSRelRendimentoUsu_Codigo.AsInteger = CDSRendimentoUsu_Codigo.AsInteger) and
         (CDSRelRendimentoRev_Codigo.AsInteger = CDSRendimentoRev_Codigo.AsInteger) and
         (CDSRelRendimentoDep_Codigo.AsInteger = CDSRendimentoDep_Codigo.AsInteger) then
      begin
        bAchou := True;
        Break;
      end;

      CDSRelRendimento.Next;
    end;

    ADias := RetornarDias(CDSRendimentoUsu_Id.AsInteger, ListaUsuario);

    if bAchou then
      CDSRelRendimento.Edit
    else begin
      CDSRelRendimento.Insert;
      CDSRelRendimentoCha_Qtde.AsFloat := 0;
      CDSRelRendimentoAti_Qtde.AsFloat := 0;
      CDSRelRendimentoVis_Qtde.AsFloat := 0;
    end;

    CDSRelRendimentoUsu_Id.AsInteger := CDSRendimentoUsu_Id.AsInteger;
    CDSRelRendimentoUsu_Codigo.AsInteger := CDSRendimentoUsu_Codigo.AsInteger;
    CDSRelRendimentoUsu_Nome.AsString := CDSRendimentoUsu_Nome.AsString;

    CDSRelRendimentoRev_Codigo.AsString := CDSRendimentoRev_Codigo.AsString;
    CDSRelRendimentoRev_Nome.AsString := CDSRendimentoRev_Nome.AsString;

    CDSRelRendimentoDep_Codigo.AsString := CDSRendimentoDep_Codigo.AsString;
    CDSRelRendimentoDep_Nome.AsString := CDSRendimentoDep_Nome.AsString;


    if ADias <= 0 then
      ADias := 1;

    CDSRelRendimentoDias.AsInteger := ADias;

    if (CDSRendimentoTipo.AsString = 'CHAM') or (CDSRendimentoTipo.AsString = 'CHAC') then // chamado ou colobaroador
    begin
      CDSRelRendimentoCha_Qtde.AsFloat := CDSRelRendimentoCha_Qtde.AsFloat + CDSRendimentoQtde.AsFloat;
      CDSRelRendimentoCha_Horas.AsFloat := CDSRelRendimentoCha_Horas.AsFloat + CDSRendimentoHoras.AsFloat;
    end;

    if (CDSRendimentoTipo.AsString = 'ATIV') or (CDSRendimentoTipo.AsString = 'ATIC') then // ATIVIDADES
    begin
      CDSRelRendimentoAti_Qtde.AsFloat := CDSRelRendimentoAti_Qtde.AsFloat + CDSRendimentoQtde.AsFloat;
      CDSRelRendimentoAti_Horas.AsFloat := CDSRelRendimentoAti_Horas.AsFloat + CDSRendimentoHoras.AsFloat;
    end;

    if (CDSRendimentoTipo.AsString = 'VISI') then // VISITAS
    begin
      CDSRelRendimentoVis_Qtde.AsFloat := CDSRelRendimentoVis_Qtde.AsFloat + CDSRendimentoQtde.AsFloat;
      CDSRelRendimentoVis_Horas.AsFloat := CDSRelRendimentoVis_Horas.AsFloat + CDSRendimentoHoras.AsFloat;
      CDSRelRendimentoVis_Valor.AsFloat := CDSRelRendimentoVis_Valor.AsFloat + CDSRendimentoValor.AsFloat;
    end;

    if (CDSRendimentoTipo.AsString = 'TEMP') then // Tempo do chamado
      CDSRelRendimentoSol_Horas.AsFloat := CDSRelRendimentoSol_Horas.AsFloat + CDSRendimentoHoras.AsFloat;

    // totais
    CDSRelRendimentoTotalHoras.AsFloat := CDSRelRendimentoCha_Horas.AsFloat +
                                          CDSRelRendimentoAti_Horas.AsFloat +
                                          CDSRelRendimentoVis_Horas.AsFloat +
                                          CDSRelRendimentoSol_Horas.AsFloat;
    // m�dia
    try
      CDSRelRendimentoMedia.AsFloat := (CDSRelRendimentoTotalHoras.AsFloat / ADias);
      MediaDiasUteis := CDSRelRendimentoTotalHoras.AsFloat / FDiasUteis;
      CDSRelRendimentoMediaHorasDiasUteis.AsString := TFuncoes.DecimalToHora(MediaDiasUteis);
    except
      CDSRelRendimentoMedia.AsFloat := 1;
    end;

    CDSRelRendimento.Post;

    CDSRendimento.Next;
  end;
  FormatarHoras();

  if Assigned(ListaUsuario) then
    FreeAndNil(ListaUsuario);

  CDSRelRendimento.IndexFieldNames := 'Rev_Nome;Dep_Nome;Usu_Nome';

  lblPeriodo01.Caption := 'Per�odo de: ' + ADataInicial + ' At�: ' + ADataFinal;
  RelRendimento.Print;

end;

procedure TDMRelUsuario.ppDetailBand1BeforePrint(Sender: TObject);
var
  vMedia: Double;
begin
  lblMediaHoraUtil.Caption := CDSRelRendimentoMediaHorasDiasUteis.AsString;
  lblMediaHoraUtil.Caption := CalculoMediaDiasUtil(CDSRelRendimentoTotalHoras.AsFloat);
end;

procedure TDMRelUsuario.ppGroupFooterBand1BeforePrint(Sender: TObject);
var
  vMedia: Double;
begin
  lblChaHora2.Caption := TFuncoes.DecimalToHora(CalChaHora2.Value);
  lblAtiHora2.Caption := TFuncoes.DecimalToHora(CalcAtiHora2.Value);
  lblVisHora2.Caption := TFuncoes.DecimalToHora(CalcVisHora2.Value);
  lblSolHora2.Caption := TFuncoes.DecimalToHora(CalcSolHora2.Value);
  lblTotalHora2.Caption := TFuncoes.DecimalToHora(CalcTotalHora2.Value);
  try
//    vMedia := (CalcTotalHora2.Value / FDiasUteis) / CalcMedia2.Value;
    vMedia := (CalcTotalHora2.Value / sumTotalDias2.Value);
  except
    vMedia := 1;
  end;
  lblMedia2.Caption := TFuncoes.DecimalToHora(vMedia);
  lblSubMediaUtil.Caption := CalculoMediaDiasUtil(CalcSubMediaHoraUtil.Value);
end;

procedure TDMRelUsuario.ppGroupFooterBand2BeforePrint(Sender: TObject);
var
  vMedia: Double;
begin
  lblChaHora1.Caption := TFuncoes.DecimalToHora(CalChaHora1.Value);
  lblAtiHora1.Caption := TFuncoes.DecimalToHora(CalcAtiHora1.Value);
  lblVisHora1.Caption := TFuncoes.DecimalToHora(CalcVisHora1.Value);
  lblSolHora1.Caption := TFuncoes.DecimalToHora(CalcSolHora1.Value);
  lblTotalHora1.Caption := TFuncoes.DecimalToHora(CalcTotalHora1.Value);
  try
//    vMedia := (CalcTotalHora1.Value / FDiasUteis) / CalcMedia1.Value;
    vMedia := (CalcTotalHora1.Value / sumTotalDias1.Value);
  except
    vMedia := 1;
  end;
  lblMedia1.Caption := TFuncoes.DecimalToHora(vMedia);
  lblSubMediaUtil2.Caption := CalculoMediaDiasUtil(CalcSubMediaHoraUtil2.Value);
end;

procedure TDMRelUsuario.ppSummaryBand1BeforePrint(Sender: TObject);
var
  vMedia: Double;
begin
  lblChaHora.Caption := TFuncoes.DecimalToHora(CalChaHora.Value);
  lblAtiHora.Caption := TFuncoes.DecimalToHora(CalcAtiHora.Value);
  lblVisHora.Caption := TFuncoes.DecimalToHora(CalcVisHora.Value);
  lblSolHora.Caption := TFuncoes.DecimalToHora(CalcSolHora.Value);
  lblTotalHora.Caption := TFuncoes.DecimalToHora(CalcTotalHora.Value);
  try
//    vMedia := (CalcTotalHora.Value / FDiasUteis) / CalcMedia.Value;
    vMedia := (CalcTotalHora.Value / sumTotalDias.Value);
  except
    vMedia := 1;
  end;
  lblMedia.Caption := TFuncoes.DecimalToHora(vMedia);
  lblMediaUtil2.Caption := CalculoMediaDiasUtil(CalcMediaHoraUtil2.Value);
end;

function TDMRelUsuario.RetornarDias(AIdUsuario: Integer;
  ALista: TObjectList<TUsuarioVO>): Integer;
var
  Item: TUsuarioVO;
  iResult: Integer;
begin
  iResult := 0;
  for Item In ALista do
  begin
    if Item.Id = AIdUsuario then
    begin
      iResult := Item.QtdeDias;
      Break;
    end;
  end;
  Result := iResult;
end;

end.
