unit uChamadoColaboradorController;

interface

uses
  System.SysUtils, System.Generics.Collections, uChamadoColaboradorVO, uRegras;

type
  TChamadoColaboradorController = class
  public
    procedure SalvarLista(obj: TObjectList<TChamadoColaboradorVO>);
  end;

implementation

{ TChamadoColaboradorController }

uses uDM, uFuncoesSIDomper;

procedure TChamadoColaboradorController.SalvarLista(
  obj: TObjectList<TChamadoColaboradorVO>);
var
  sb: TStringBuilder;
  i: Integer;
  Negocio: TServerMethods1Client;
  sHoraIni: string;
  sHoraFim: string;

  HoraInicial: Double;
  HoraFinal: Double;
  TotalHoras: Double;
  sTotalHoras: string;
begin
  sb := TStringBuilder.Create;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      for i := 0 to obj.Count -1 do
      begin
        sHoraIni := FormatDateTime('hh:mm', obj.Items[i].HoraInicial);
        sHoraFim := FormatDateTime('hh:mm', obj.Items[i].HoraFim);

        HoraInicial := TFuncoes.HoraToDecimal(sHoraIni);
        HoraFinal   := TFuncoes.HoraToDecimal(sHoraFim);
        TotalHoras  := HoraFinal - HoraInicial;
        sTotalHoras := TFuncoes.ValorAmericano(FloatToStr(TotalHoras));

        sb.Clear;
        sb.Append(' INSERT INTO Chamado_Ocorr_Colaborador(');
        sb.Append('   ChaOCol_ChamadoOcorrencia, ');
        sb.Append('   ChaOCol_Usuario,');
        sb.Append('   ChaOcol_HoraInicio,');
        sb.Append('   ChaOcol_TotalHoras,');
        sb.Append('   ChaOCol_HoraFim)');
        sb.Append(' VALUES(');
        sb.Append(  IntToStr(obj.Items[i].IdOcorrencia) + ',');
        sb.Append(  IntToStr(obj.Items[i].IdUsuario) + ',');
        sb.Append(  'CAST (' + QuotedStr(sHoraIni) + ' AS time),');
        sb.Append(  sTotalHoras + ',');
        sb.Append(  'CAST (' + QuotedStr(sHoraFim) + ' AS time))');
        Negocio.ExecutarSQL(sb.ToString);
      end;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.ClassName + ' - Método SalvarLista - ' + E.Message + ' - ' + sb.ToString);
      end;
    end;
  finally
    FreeAndNil(Negocio);
    FreeAndNil(sb);
  end;
end;

end.
