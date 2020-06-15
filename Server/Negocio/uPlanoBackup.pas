unit uPlanoBackup;

interface

uses
  Data.DBXJSON , Data.DBXJSONReflect, uDM, System.SysUtils, FireDAC.Stan.Param,
  Data.DB, FireDAC.Comp.Client, uPlanoBackupVO, System.Variants, System.Generics.Collections,
  System.DateUtils;

type
  TPlanoBackup = class
  private
    procedure SalvarItens(AIdPlano: Integer; APlanoBackupItens: TObjectList<TPlanoBackupItensVO>;
      var AStoredProcedureItens: TFDStoredProc);
    function SalvarPlano(APlanoBackup: TPlanoBackupVO;
      var AStoredProcedure: TFDStoredProc): Integer;
    procedure GravarBackup(var AQry: TFDQuery);
  public
    function Localizar(var AQry: TFDQuery): Boolean;
    procedure Excluir(AId: Integer);
    procedure ExcluirItem(AId: Integer);
    procedure Salvar(APlano: TPlanoBackupVO; AItens: TObjectList<TPlanoBackupItensVO>;
      var AStoredProcedure: TFDStoredProc; var AStoredItens: TFDStoredProc);

    procedure ExecutarPlano(var AQry: TFDQuery);
  end;

implementation

{ TPlanoBackup }

uses ServerMethodsUnit1;

procedure TPlanoBackup.Excluir(AId: Integer);
begin
  DM.ExecutarSQL('DELETE FROM PlanoBackup WHERE Plb_Id = ' + IntToStr(AId));
end;

procedure TPlanoBackup.ExcluirItem(AId: Integer);
begin
  DM.ExecutarSQL('DELETE FROM PlanoBackupItens WHERE PlbIte_Id = ' + IntToStr(AId));
end;

procedure TPlanoBackup.ExecutarPlano(var AQry: TFDQuery);
begin
  AQry.Close;
  AQry.Open();

  if AQry.RecordCount > 0 then
  begin
    if AQry.FieldByName('Plb_DataUltimoBackup').AsDateTime <> Date then
      dm.ExecutarSQL('UPDATE PlanoBackupItens SET PlbIte_Status = 0 WHERE PlbIte_Status = 1');

    while not AQry.Eof do
    begin
      case AQry.FieldByName('DiaHoje').AsInteger of
        1: // domingo
        begin
          if (AQry.FieldByName('Plb_Domingo').AsBoolean) then
            GravarBackup(AQry);
        end;
        2: // Segunda
        begin
          if (AQry.FieldByName('Plb_Segunda').AsBoolean) then
            GravarBackup(AQry);
        end;
        3: // Terça
        begin
          if (AQry.FieldByName('Plb_Terca').AsBoolean) then
            GravarBackup(AQry);
        end;
        4: // Quarta
        begin
          if (AQry.FieldByName('Plb_Quarta').AsBoolean) then
            GravarBackup(AQry);
        end;
        5: // Quinta
        begin
          if (AQry.FieldByName('Plb_Quinta').AsBoolean) then
            GravarBackup(AQry);
        end;
        6: // Sexta
        begin
          if (AQry.FieldByName('Plb_Sexta').AsBoolean) then
            GravarBackup(AQry);
        end;
        7: // Sábado
        begin
          if (AQry.FieldByName('Plb_Sabado').AsBoolean) then
            GravarBackup(AQry);
        end;
      end;

      AQry.Next;
    end;
  end;
  AQry.Close;
end;

procedure TPlanoBackup.GravarBackup(var AQry: TFDQuery);
var
  sNomeArquivo: string;
  sData: string;
  sHora: string;
  sCaminho: string;
begin
  sNomeArquivo := 'SIDomper-';
  sData := FormatDateTime('ddmmyyyy', Now);
  sHora := FormatDateTime('hhmm', Now);
  sNomeArquivo := sNomeArquivo + sData + '-' + sHora + '.bak';
  sCaminho := AQry.FieldByName('Plb_Destino').AsString + '\' + sNomeArquivo;

  if (AQry.FieldByName('PlbIte_Status').AsBoolean = False) then
  begin
    if Time >= AQry.FieldByName('PlbIte_Hora').AsDateTime then
    begin
      ServerMethods1.Backup(sCaminho);
      dm.ExecutarSQL('UPDATE PlanoBackup SET Plb_DataUltimoBackup = CAST(GETDATE() AS date)');
      dm.ExecutarSQL('UPDATE PlanoBackupItens SET PlbIte_Status = 1 WHERE PlbIte_Id = ' + IntToStr(AQry.FieldByName('PlbIte_Id').AsInteger));
    end;
  end;

end;

function TPlanoBackup.Localizar(var AQry: TFDQuery): Boolean;
begin
  AQry.Close;
  AQry.Open();

  Result := (not AQry.IsEmpty);
end;

function TPlanoBackup.SalvarPlano(APlanoBackup: TPlanoBackupVO;
  var AStoredProcedure: TFDStoredProc): Integer;
var
  sIU: string;
begin
  if Trim(APlanoBackup.Destino) = '' then
    raise Exception.Create('Informe o Destino do Backup!');

  sIU := 'U';
  if APlanoBackup.Id = 0 then
    sIU := 'I';

  AStoredProcedure.Close;
  AStoredProcedure.ParamByName('@IU').AsString            := sIU;
  AStoredProcedure.ParamByName('@Id').AsInteger           := APlanoBackup.Id;
  AStoredProcedure.ParamByName('@Destino').AsString       := APlanoBackup.Destino;
  AStoredProcedure.ParamByName('@Domingo').AsBoolean      := APlanoBackup.Domingo;
  AStoredProcedure.ParamByName('@Segunda').AsBoolean      := APlanoBackup.Segunda;
  AStoredProcedure.ParamByName('@Terca').AsBoolean        := APlanoBackup.Terca;
  AStoredProcedure.ParamByName('@Quarta').AsBoolean       := APlanoBackup.Quarta;
  AStoredProcedure.ParamByName('@Quinta').AsBoolean       := APlanoBackup.Quinta;
  AStoredProcedure.ParamByName('@Sexta').AsBoolean        := APlanoBackup.Sexta;
  AStoredProcedure.ParamByName('@Sabado').AsBoolean       := APlanoBackup.Sabado;
  AStoredProcedure.ParamByName('@Ativo').AsBoolean        := APlanoBackup.Ativo;

  if APlanoBackup.DataUltimoBackup <> 0 then
    AStoredProcedure.ParamByName('@DataUltimoBackup').AsDate:= APlanoBackup.DataUltimoBackup
  else
    AStoredProcedure.ParamByName('@DataUltimoBackup').Value := null;

  AStoredProcedure.ExecProc;

  Result := AStoredProcedure.ParamByName('@RetornoId').AsInteger;

  AStoredProcedure.Close;
end;

procedure TPlanoBackup.Salvar(APlano: TPlanoBackupVO;
  AItens: TObjectList<TPlanoBackupItensVO>; var AStoredProcedure,
  AStoredItens: TFDStoredProc);
var
  Id: Integer;
begin
  Id := SalvarPlano(APlano, AStoredProcedure);
  SalvarItens(Id, AItens, AStoredItens);
end;

procedure TPlanoBackup.SalvarItens(AIdPlano: Integer;  APlanoBackupItens: TObjectList<TPlanoBackupItensVO>;
  var AStoredProcedureItens: TFDStoredProc);
var
  sIU: string;
  Item: TPlanoBackupItensVO;
begin
  for Item in APlanoBackupItens do
  begin
    sIU := 'U';
    if Item.Id <= 0 then
      sIU := 'I';

    Item.PlanoBackup := AIdPlano;

    AStoredProcedureItens.Close;
    AStoredProcedureItens.ParamByName('@IU').AsString           := sIU;
    AStoredProcedureItens.ParamByName('@Id').AsInteger          := Item.Id;
    AStoredProcedureItens.ParamByName('@PlanoBackup').AsInteger := Item.PlanoBackup;
    AStoredProcedureItens.ParamByName('@Status').AsBoolean      := Item.Status;

    if Item.Hora <> 0 then
      AStoredProcedureItens.ParamByName('@Hora').AsTime := Item.Hora
    else
      AStoredProcedureItens.ParamByName('@Hora').Value := null;

    AStoredProcedureItens.ExecProc;
  end;
end;

end.
