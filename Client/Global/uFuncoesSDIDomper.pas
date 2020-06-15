unit uFuncoesSDIDomper;

interface

uses
   SysUtils,
   SqlExpr,
   Windows,
   Dialogs,
   StdCtrls,
   Forms,
   MaskUtils,
   Mask,
   uDM,
   FireDAC.Comp.Client,
   Data.DB,
   System.Generics.Collections,
   uRegras,
   uEnumerador,
   Vcl.DBCtrls,
   Vcl.Graphics,
   Vcl.Buttons,
   ShellAPI,
   System.Classes,
   Datasnap.DBClient,
   Vcl.Controls;

type
  TFuncoes = class
  private

  public
    class function Confirmar(Mensagem: PWideChar): boolean;
    class procedure CriarFormulario(Formulario: TForm);
    class procedure CriarFormularioModal(Formulario: TForm);
    class procedure ModoEdicaoInsercao(Tabela: TDataSet);
    class function SomenteNumeros(Texto: string): string;
    class procedure ValidaDatas(Sender: TField; const Text: string);
    class procedure DataValida(Data: string);
    class procedure ValidaIntervaloDatas(DataInicial, DataFinal: string);
    class function MensagemBanco(Mensagem: string): string;
    class procedure HabilitarCampo(Formulario: TForm; habilitar: Boolean);
    class function FormularioEstaCriado(Formulario: TClass): Boolean;
    class procedure VisualizarArquivo(NomeArquivo: string);
    class procedure ValidaHora(Sender: TField; const Text: string);
    class function DataEmBrancoNula(Data: string): Boolean;
    class function FormatarMascara(Mascara, Valor: string): string;
    class function HoraToDecimal(Hora: String): double;
    class function DecimalToHora(Hora: double): string;
    class function MostrarDescricaoPesquisaData(Campo: string): Boolean;
    class procedure VincularConexaoClientDataSet(var DataModulo: TDataModule);
    class procedure PosicaoCursorGrid(var DataSource: TDataSource; CampoId: string; IdValor: Integer);
    class procedure OrdenarCamposGrid(DataSet: TClientDataSet; Campo: string);
    class function FormatarMascaraCodigo4(Campo: double): string;
    class function SenhaInterna(Senha: string): Boolean;
    class procedure MensagemErroBanco(Mensagem: string);
    class function TelaSenha(Sigla: string): Boolean;

  end;


implementation

{ TFuncoes }

uses uErro, uUsuarioSenha;

class procedure TFuncoes.VincularConexaoClientDataSet(var DataModulo: TDataModule);
var
  i: Integer;
begin
  for I := 0 to DataModulo.ComponentCount-1 do
  begin
    if DataModulo.Components[i] is TClientDataSet then
      TClientDataSet(DataModulo.Components[i]).RemoteServer := dm.DSPConexao;
  end;
end;

class procedure TFuncoes.VisualizarArquivo(NomeArquivo: string);
begin
  if Trim(NomeArquivo) = '' then
    raise Exception.Create('Informe o Arquivo.');

  if not FileExists(NomeArquivo) then
    raise Exception.Create('Arquivo não Encontrado.');

  shellexecute(0, 'OPEN', PWideChar(NomeArquivo), nil, nil, SW_SHOWNORMAL);
end;

class function TFuncoes.Confirmar(Mensagem: PWideChar): boolean;
var
   iResult: integer;
begin
  iResult := application.MessageBox(Mensagem,'Confirmação',mb_YesNo + mb_IconQuestion + mb_DefButton2);
  if iResult = IDYES then
    result:=true
  else
    result:=false;
end;

class procedure TFuncoes.CriarFormulario(Formulario: TForm);
var
  iTag: Integer;
  Negocio: TServerMethods1Client;
begin
  dm.IdSelecionado := 0;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      iTag := Formulario.Tag;
      Negocio.PermissaoAcessar(iTag, dm.IdUsuario);
    except
      On E: Exception do
      begin
        FreeAndNil(Formulario);
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;

  Formulario.Show;
end;

class procedure TFuncoes.CriarFormularioModal(Formulario: TForm);
var
  iTag: Integer;
  Negocio: TServerMethods1Client;
begin
  dm.IdSelecionado := 0;
  Negocio := TServerMethods1Client.Create(dm.Conexao.DBXConnection);
  try
    try
      iTag := Formulario.Tag;
      Negocio.PermissaoAcessar(iTag, dm.IdUsuario);
    except
      On E: Exception do
      begin
        FreeAndNil(Formulario);
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Negocio);
  end;
  Formulario.ShowModal;
end;

class function TFuncoes.DataEmBrancoNula(Data: string): Boolean;
begin
  Result := False;
  if Trim(Data) = DataEmBranco then
    Result := True;

  if Data = '' then
    Result := True;
end;

class procedure TFuncoes.DataValida(Data: string);
begin
  if Trim(Data) <> DataEmBranco then
  begin
    try
      StrToDate(Data);
      if StrToDate(Data) < StrToDate('01/01/1900') then
        raise Exception.Create('Data Inválida');

      if StrToDate(Data) > StrToDate('01/01/2090') then
        raise Exception.Create('Data Inválida');

    except
      raise Exception.Create('Data Inválida.');
    end;
  end;
end;

class function TFuncoes.DecimalToHora(Hora: double): string;
var
  a,b,c: double;
  d,e,f: string;
begin
  try
    a := frac(Hora);
    b := int(hora);
    c := (a * 60);
    d := formatfloat('00', b);
    e := formatfloat('00', c);
    f := d + ':' + e;
  except
    f := '00:00';
  end;
  result := f;
end;

class function TFuncoes.FormatarMascara(Mascara, Valor: string): string;
var
  i: Integer;
  sValor: string;
  sMascara: string;
  sVal: string;
begin
  sValor := SomenteNumeros(Valor);
  sMascara := FormatMaskText(Mascara + ';0;_', sValor);
  sVal := '';

  for I := 1 to Length(sMascara) do
    sVal := sVal + Copy(sMascara, i, 1);

  Result := sVal;
end;

class function TFuncoes.FormatarMascaraCodigo4(Campo: double): string;
begin
  if Campo > 0 then
    Result := FormatFloat('0000', Campo)
  else
    Result := '';
end;

class function TFuncoes.FormularioEstaCriado(Formulario: TClass): Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := 0 to Screen.FormCount -1 do
  begin
    if Screen.Forms[i] is Formulario then
    begin
      Result := True;
      Break;
    end;
  end;
end;

class procedure TFuncoes.HabilitarCampo(Formulario: TForm; habilitar: Boolean);
var
  i: Integer;
begin
  if Formulario = nil then
    Exit;

  for I := 0 to Formulario.ComponentCount -1 do
  begin
    if Formulario.Components[i] is TDBEdit then
    begin
      if habilitar then
      begin
        TDBEdit(Formulario.Components[i]).Enabled := True;
//        TDBEdit(Formulario.Components[i]).Color := clWindow;
//        TDBEdit(Formulario.Components[i]).ReadOnly := False;
      end
      else begin
        TDBEdit(Formulario.Components[i]).Enabled := False;
//        TDBEdit(Formulario.Components[i]).Color := clSilver;
//        TDBEdit(Formulario.Components[i]).ReadOnly := True;
      end;
    end;

    if Formulario.Components[i] is TSpeedButton then
    begin
      if habilitar then
        TSpeedButton(Formulario.Components[i]).Enabled := True
      else
        TSpeedButton(Formulario.Components[i]).Enabled := False;
    end;

    if Formulario.Components[i] is TDBCheckBox then
    begin
      if habilitar then
        TDBCheckBox(Formulario.Components[i]).Enabled := True
      else
        TDBCheckBox(Formulario.Components[i]).Enabled := False;
    end;

    if Formulario.Components[i] is TDBMemo then
    begin
      if habilitar then
        TDBMemo(Formulario.Components[i]).Enabled := True
      else
        TDBMemo(Formulario.Components[i]).Enabled := False;
    end;

    if Formulario.Components[i] is TDBRadioGroup then
    begin
      if habilitar then
        TDBRadioGroup(Formulario.Components[i]).Enabled := True
      else
        TDBRadioGroup(Formulario.Components[i]).Enabled := False;
    end;

//    if Formulario.Components[i] is TBitBtn then
//    begin
//      if habilitar then
//        TBitBtn(Formulario.Components[i]).Enabled := True
//      else
//        TBitBtn(Formulario.Components[i]).Enabled := False;
//    end;

  end;
end;

class function TFuncoes.HoraToDecimal(Hora: String): double;
var a,b,c,d: double;
begin
  try
    a := StrToFloat(copy(Hora, 4, 2));
    b := a / 60;
    c := int(StrToFloat(copy(Hora, 1, 2)));
    d := c + b;
  except
    d := 0;
  end;
  result := d;
end;

class function TFuncoes.MensagemBanco(Mensagem: string): string;
var
  iPosicao: Integer;
begin
  iPosicao := Pos('[SQL Server]', Mensagem);

  if iPosicao > 0 then
  begin
    Mensagem := Copy(Mensagem, iPosicao + 12, Length(Mensagem));
    Result := Mensagem;
  end
  else
    Result := Mensagem;
end;

class procedure TFuncoes.MensagemErroBanco(Mensagem: string);
begin
  frmErro := TfrmErro.Create(Mensagem);
  frmErro.ShowModal;
  FreeAndNil(frmErro);
end;

class procedure TFuncoes.ModoEdicaoInsercao(Tabela: TDataSet);
begin
  if not (Tabela.State in [dsEdit, dsInsert]) then
    Tabela.Edit;
end;

class function TFuncoes.MostrarDescricaoPesquisaData(Campo: string): Boolean;
begin
  Result := (Pos('DATA', UpperCase(Campo)) > 0);
end;

class procedure TFuncoes.OrdenarCamposGrid(DataSet: TClientDataSet; Campo: string);
begin
  DataSet.IndexFieldNames := Campo;
end;

class procedure TFuncoes.PosicaoCursorGrid(var DataSource: TDataSource;
  CampoId: string; IdValor: Integer);
var
  iRegistro: Integer;
  iId: Integer;
begin
  iId := 0;
  iRegistro := 0;
  DataSource.DataSet.DisableControls;
  try
    DataSource.DataSet.First;
    while not DataSource.DataSet.Eof do
    begin

      if IdValor = 0 then
      begin
        if DataSource.DataSet.FieldByName(CampoId).AsInteger > iId then
        begin
          iRegistro := DataSource.DataSet.RecNo;
          iId := DataSource.DataSet.FieldByName(CampoId).AsInteger;
        end;
      end
      else begin
        if DataSource.DataSet.FieldByName(CampoId).AsInteger = IdValor then
        begin
          iRegistro := DataSource.DataSet.RecNo;
          Break;
        end;
      end;
      DataSource.DataSet.Next;
    end;

    if iRegistro > 0 then
      DataSource.DataSet.RecNo := iRegistro;

  finally
    DataSource.DataSet.EnableControls;
  end;
end;

class function TFuncoes.SenhaInterna(Senha: string): Boolean;
var
  sDia: string;
  sMes: string;
  sHora: string;
  sResultado: string;
begin
  sDia := FormatDateTime('dd', Now);
  sHora := FormatDateTime('hh', Now);
  sMes := FormatDateTime('mm', Now);
  sResultado := 'sa' + sDia + sHora + (IntToStr(StrToInt(sMes) + StrToInt(sHora)));

  if Senha = sResultado then
    Result := True
  else
    Result := False;
end;

class function TFuncoes.SomenteNumeros(Texto: string): string;
var
  i: Integer;
  schar: string;
begin
  schar := '';
  for I := 1 to Length(Texto) do
  begin
    try
      StrToInt(Copy(Texto, i, 1));
      schar := schar + Copy(Texto, i, 1);
    except
      //
    end;
  end;
  Result := schar;
end;

class function TFuncoes.TelaSenha(Sigla: string): Boolean;
var
  Formulario: TfrmUsuarioSenha;
begin
  Formulario := TfrmUsuarioSenha.Create(Sigla);
  try
    Result := (Formulario.ShowModal = mrOk);
  finally
    FreeAndNil(Formulario);
  end;
end;

class procedure TFuncoes.ValidaDatas(Sender: TField; const Text: string);
begin
  if Trim(Text) = DataEmBranco then
    Sender.Clear
  else begin
    DataValida(Text);
    Sender.AsString := Text;
  end;
end;

class procedure TFuncoes.ValidaHora(Sender: TField; const Text: string);
begin
  if Text = '  :  ' then
    Sender.Clear
  else
    Sender.Value := FormatDateTime('hh:mm', StrToDateTime(Text));
end;

class procedure TFuncoes.ValidaIntervaloDatas(DataInicial, DataFinal: string);
begin

  DataValida(DataInicial);
  DataValida(DataFinal);

  if (Trim(DataInicial) <> DataEmBranco) and (Trim(DataFinal) <> DataEmBranco) then
  begin
    if StrToDate(DataInicial) > StrToDate(DataFinal) then
      raise Exception.Create('Data Inicial Maior que Data Final.');
  end;
end;

end.
