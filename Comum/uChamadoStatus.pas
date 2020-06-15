unit uChamadoStatus;

interface

uses
  uDM, System.SysUtils, FireDAC.Stan.Param, uFiltroChamado, uUsuario,
  Data.DB, System.Variants,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uChamadoStatusVO,
  uDMChamado, uChamadoVO, System.Generics.Collections;

type
  TChamadoStatus = class
  public
    procedure Salvar(AIdUsuario: Integer; AChamadoStatus: TChamadoStatusVO);
  end;

implementation

{ TChamadoStatus }

procedure TChamadoStatus.Salvar(AIdUsuario: Integer; AChamadoStatus: TChamadoStatusVO);
var
  lQry: TFDQuery;
begin
  // se tiver usuario, será usado a trigger da tabela Chamado
  // não será feito por aqui
  if AChamadoStatus.IdUsuarioAtendeAtual > 0 then
    Exit;

  if AChamadoStatus.IdStatus > 0 then
  begin
    lQry := TFDQuery.Create(Nil);
    try
      lQry.Connection := DM.Conexao;

      lQry.SQL.Text := 'SELECT Cha_Status FROM Chamado WHERE Cha_Id = ' + IntToStr(AChamadoStatus.IdChamado);
      lQry.Open();

      if AChamadoStatus.IdStatus <> lQry.Fields[0].AsInteger then
      begin
//        ShowMessage(ChamadoStatus.IdChamado.ToString() + ' - ' + lQry.Fields[0].AsString);
        lQry.SQL.Clear;
        lQry.SQL.Add('INSERT INTO Chamado_Status(');
        lQry.SQL.Add(' ChSta_Chamado,');
        lQry.SQL.Add(' ChSta_Data,');
        lQry.SQL.Add(' ChSta_Usuario,');
        lQry.SQL.Add(' ChSta_Status)');
        lQry.SQL.Add(' VALUES(');
        lQry.SQL.Add(' :Chamado,');
        lQry.SQL.Add(' :Data,');
        lQry.SQL.Add(' :Usuario,');
        lQry.SQL.Add(' :Status)');


        lQry.Params.ParamByName('Chamado').AsInteger := AChamadoStatus.IdChamado;
        lQry.Params.ParamByName('Data').AsDateTime := AChamadoStatus.Data;
        lQry.Params.ParamByName('Usuario').AsInteger := AIdUsuario;
        lQry.Params.ParamByName('Status').AsInteger := AChamadoStatus.IdStatus;

        lQry.ExecSQL();
      end;
    finally
      FreeAndNil(lQry);
    end;
  end;
end;

end.
