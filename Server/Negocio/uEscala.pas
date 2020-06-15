unit uEscala;

interface

uses uDM, System.SysUtils, FireDAC.Stan.Param,
  Data.DB,
  FireDAC.Comp.Client, uEnumerador, Vcl.Dialogs, uCadastroInterface, uEscalaVO,
  uGenericDAO, uFireDAC, uFuncoesServidor, uDMEscala;

  const CConsulta: string =
  'SELECT ' +
	' Esc_Id, ' +
	' Esc_Data,  ' +
	' Esc_Usuario, ' +
	' Esc_HoraInicio, ' +
	' Esc_HoraFim, ' +
	' Usu_Codigo, ' +
	' Usu_Nome '+
'FROM Escala '+
' INNER JOIN Usuario ON Esc_Usuario = Usu_Id ';

type
  TEscala = class(TInterfacedObject, ICadastroInterface)
  private
    function Filtro(AFiltro: TEscalaFiltro): string;
  public
    procedure Novo(Programa, IdUsuario: Integer);
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string; overload;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer); overload;
    procedure Salvar(Programa, IdUsuario: Integer); overload;
    function Salvar(AEscalaVO: TEscalaVO; AIdUsuario: integer): Integer; overload;
    function ProximoCodigo: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer); overload;
    function ProximoId: Integer;
    function FiltrarCodigo(Codigo: Integer): string;
    function Filtrar(AFiltro: TEscalaFiltro; ACampo, ATexto: string; AIdUsuario: Integer; AContem: Boolean = True): string; overload;
    function Relatorio(AModel: Integer; AFiltro: TEscalaFiltro): string; overload;
    function BuscarUltimaData(): string;
  end;

implementation

{ TRevenda }

uses uUsuario;

function TEscala.BuscarUltimaData: string;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT DATEADD(day,1, MAX(Esc_Data)) AS Data FROM Escala');
    Result := obj.Model.Fields[0].AsString;
  finally
    FreeAndNil(obj);
  end;
end;

function TEscala.Editar(Programa, IdUsuario: Integer): Boolean;
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    Result := usuario.PermissaoEditar(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

procedure TEscala.Excluir(Programa, IdUsuario, Id: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;

  DM.ExecutarSQL('DELETE FROM Escala WHERE Esc_Id = ' + IntToStr(Id));
end;

function TEscala.Filtrar(Campo, Texto, Ativo: string;
  Contem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + Texto + '%''';
  if Contem then
    sTexto := '''%' + Texto + '%''';

  sConsulta := CConsulta + ' WHERE ' + Campo + ' LIKE ' + sTexto;

  sConsulta := sConsulta + ' ORDER BY ' + Campo;

  Result := sConsulta;
end;

function TEscala.Filtrar(AFiltro: TEscalaFiltro; ACampo, ATexto: string;
  AIdUsuario: Integer; AContem: Boolean): string;
var
  sConsulta: string;
  sTexto: string;
begin
  sTexto := '''' + ATexto + '%''';
  if AContem then
    sTexto := '''%' + ATexto + '%''';

  sConsulta := CConsulta + ' WHERE ' + ACampo + ' LIKE ' + sTexto;

  sConsulta := sConsulta + Filtro(AFiltro);

  sConsulta := sConsulta + ' ORDER BY ' + ACampo;

  Result := sConsulta;
end;

function TEscala.FiltrarCodigo(Codigo: Integer): string;
var
  sConsulta: string;
begin
  sConsulta := CConsulta + ' WHERE Esc_Id = ' + IntToStr(Codigo);
  Result := sConsulta;
end;

function TEscala.Filtro(AFiltro: TEscalaFiltro): string;
var
  sConsulta: string;
begin
  sConsulta := '';
  if AFiltro.DataInicial.Trim <> DataEmBranco then
    sConsulta := sConsulta + ' AND Esc_Data >= ' + TFuncoes.DataIngles(AFiltro.DataInicial);

  if AFiltro.DataFinal.Trim <> DataEmBranco then
    sConsulta := sConsulta + ' AND Esc_Data <= ' + TFuncoes.DataIngles(AFiltro.DataFinal);

  if AFiltro.IdUsuario <> '' then
    sConsulta := sConsulta + ' AND Esc_Usuario in (' + AFiltro.IdUsuario + ')';

  Result := sConsulta;
end;

procedure TEscala.LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT Rev_Id, Rev_Ativo FROM Revenda WHERE Rev_Codigo = ' + IntToStr(Codigo);
    lQry.Open();

    if Codigo > 0 then
    begin
      if (lQry.IsEmpty) then
        raise Exception.Create(CRegistroNaoEncontrado);

      LocalizarId(Qry, lQry.Fields[0].AsInteger);
      if lQry.FieldByName('Rev_Ativo').AsBoolean = False then
      begin
        LocalizarId(Qry, 0);
        raise Exception.Create(CRegistroInativo);
      end;
    end
    else
      LocalizarId(Qry, 0);
  finally
    FreeAndNil(lQry);
  end;
end;

function TEscala.LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
begin
  Qry.Close;
  Qry.Params[0].AsInteger := Id;
  Qry.Open();

  Result := (not Qry.IsEmpty);
end;

procedure TEscala.Novo(Programa, IdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoIncluir(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

function TEscala.ProximoCodigo: Integer;
begin
  Result := 1;
end;

function TEscala.ProximoId: Integer;
begin
  Result := 1;
end;

function TEscala.Relatorio(AModel: Integer; AFiltro: TEscalaFiltro): string;
var
  lObj: TDMEscala;
  sConsulta: string;
begin
  sConsulta := Filtro(AFiltro);

  sConsulta := sConsulta + ' ORDER BY Usu_Nome, Esc_Data';

  lObj := TDMEscala.Create(nil);
  try
    if AModel = 1 then
      Result := lObj.QRellatorio1.SQL.Text + sConsulta;
  finally
    FreeAndNil(lObj);
  end;
end;

procedure TEscala.Relatorio(Programa, IdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoRelatorio(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

function TEscala.Salvar(AEscalaVO: TEscalaVO; AIdUsuario: integer): Integer;
var
  sData: string;
  cHoraIni: Double;
  cHoraFim: Double;
begin
  if AEscalaVO.Data.Trim = DataEmBranco then
    raise Exception.Create('Informe a Data!');

  if AEscalaVO.HoraInicio.Trim = HoraEmBranco then
    raise Exception.Create('Informe a Hora Inicial!');


  if AEscalaVO.HoraFim.Trim = HoraEmBranco then
    raise Exception.Create('Informe a Hora Final!');

  if StrToTime(AEscalaVO.HoraInicio) > StrToTime(AEscalaVO.HoraFim) then
    raise Exception.Create('Hora Inicial maior que Hora Final!');

  if AEscalaVO.IdUsuario = 0 then
    raise Exception.Create('Informe o Usuário!');

  try
    StrToTime(AEscalaVO.HoraInicio);
    StrToTime(AEscalaVO.HoraFim);
  except
    raise Exception.Create('Hora Inválida!');
  end;

  Salvar(CEscala, AIdUsuario);

  // implmentar
  cHoraIni := TFuncoes.HoraToDecimal(AEscalaVO.HoraInicio);
  cHoraFim := TFuncoes.HoraToDecimal(AEscalaVO.HoraFim);

  AEscalaVO.TotalHoras := cHoraFim - cHoraIni;

  AEscalaVO.Data        := FormatDateTime('yyyy-mm-dd', StrToDate(AEscalaVO.Data));
  AEscalaVO.HoraInicio  := FormatDateTime('hh:mm', StrToTime(AEscalaVO.HoraInicio));
  AEscalaVO.HoraFim     := FormatDateTime('hh:mm', StrToTime(AEscalaVO.HoraFim));

  Result := TGenericDAO.Save<TEscalaVO>(AEscalaVO);

end;

procedure TEscala.Salvar(Programa, IdUsuario: Integer);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.PermissaoEditar(Programa, IdUsuario);
  finally
    FreeAndNil(usuario);
  end;
end;

end.
