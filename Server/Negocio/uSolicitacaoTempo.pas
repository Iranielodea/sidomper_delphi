unit uSolicitacaoTempo;

interface

uses
  System.SysUtils, uGenericDAO, uSolicitacaoTempoVO, FireDAC.Stan.Param,
  Data.DB, FireDAC.Comp.Client, uFireDAC, Data.DBXJSONReflect, FireDAC.Comp.DataSet,
  Data.DBXJSON, System.Generics.Collections, uParametros, uStatus,
  uFuncoesServidor, uEnumerador, uUsuario, Vcl.Dialogs;

type
  TSolicitacaoTempo = class
  private
    function LocalizarSolicitacao(AIdSolicitacao: Integer): TSolicitacaoTempoVO;
    function CalcularTempo(AHoraInicial, AHoraFinal: TTime): Double;
    function BuscarStatus(ASolicitacaoTempoVO: TSolicitacaoTempoVO): Integer;
    function RetornarNomeStatus(ANomeStatus: string): string;
  public
    function LocalizarId(AId: Integer): TSolicitacaoTempoVO;
    procedure Excluir(AId: Integer);
    function LocalizarPorSolicitacao(AIdSolicitacao: Integer): TObjectList<TSolicitacaoTempoVO>;

    procedure Iniciar(AIdUsuario: Integer; ASolicitacaoTempoVO: TSolicitacaoTempoVO);
    procedure Finalizar(AIdUsuarioLogado: Integer; ASolicitacaoTempoVO: TSolicitacaoTempoVO; AValidarUsuario: Boolean=True);
    function ListarStatus: TJSONArray;
    procedure SolicitacaoAberta(AIdUsuario, AIdSolicitacao: Integer);
    function SolicitacaoAtualAberta(AIdSolicitacao: Integer): Boolean;
    function Salvar(ASolicitacaoTempoVO: TSolicitacaoTempoVO): Integer;
    function RetornarHorasAgrupadoPorStatus(AIdSolicitacao: Integer): TObjectList<TSolicitacaoTempoVO>;
    function RetornarPorData(AData: string; AId, AIdUsuario: Integer):TObjectList<TSolicitacaoTempoVO>;
    function ConferenciaPorData(AData: string; AIdUsuario: Integer):TObjectList<TSolicitacaoTempoVO>;
    function BuscarTotalHorasSolicitacao(AIdSolicitacao: Integer): Currency;
    function BuscarHorasEmAberto(AIdSolicitacao, AIdUsuario: Integer): TDateTime;
  end;

implementation

{ TSolicitacaoTempo }

function TSolicitacaoTempo.BuscarTotalHorasSolicitacao(
  AIdSolicitacao: Integer): Currency;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('   SUM(STemp_TotalHoras) AS Horas');
    obj.Lista.Add(' FROM Solicitacao_Tempo');
    obj.Lista.Add(' WHERE STemp_Solicitacao = ' + IntToStr(AIdSolicitacao));
    obj.OpenSQL();

    Result := obj.Model.FieldByName('Horas').AsCurrency;
  finally
    FreeAndNil(obj);
  end;
end;

function TSolicitacaoTempo.CalcularTempo(AHoraInicial, AHoraFinal: TTime): Double;
var
  HoraInicial: Double;
  HoraFinal: Double;
begin
  HoraInicial := TFuncoes.HoraToDecimal(FormatDateTime('hh:mm', AHoraInicial));
  HoraFinal := TFuncoes.HoraToDecimal(FormatDateTime('hh:mm', AHoraFinal));
  Result := (HoraFinal - HoraInicial);
end;

function TSolicitacaoTempo.ConferenciaPorData(
  AData: string; AIdUsuario: Integer): TObjectList<TSolicitacaoTempoVO>;
var
  obj: TFireDAC;
  Lista: TObjectList<TSolicitacaoTempoVO>;
  VO: TSolicitacaoTempoVO;
  sData: string;
  Usuario: TUsuario;
begin
  sData := AData;
  if sData.Trim <> DataEmBranco then
    sData := FormatDateTime('yyyymmdd', StrToDate(AData));

  Usuario := TUsuario.Create;
  obj := TFireDAC.create;
  Lista := TObjectList<TSolicitacaoTempoVO>.Create();
  try
//  SOLICITACAO
    obj.Lista.Add('SELECT ');
    obj.Lista.Add('   ''Solicitação'' AS Programa, ');
    obj.Lista.Add('   Sol_Id AS Id, ');
    obj.Lista.Add('   Usu_Nome As NomeUsuario, ');
    obj.Lista.Add('   STemp_HoraInicio As HoraInicio, ');
    obj.Lista.Add('   STemp_HoraFim As HoraFim, ');
    obj.Lista.Add('   Sol_Titulo AS Titulo, ');
    obj.Lista.Add('   Cli_Nome AS Cliente, ');
    obj.Lista.Add('   Sta_Nome AS Status ');
    obj.Lista.Add(' FROM Solicitacao_Tempo');
    obj.Lista.Add('   INNER JOIN Solicitacao ON STemp_Solicitacao = Sol_Id');
    obj.Lista.Add('   INNER JOIN Usuario ON STemp_UsuarioOperacional = Usu_Id');
    obj.Lista.Add('   INNER JOIN Cliente ON Sol_Cliente = Cli_Id');
    obj.Lista.Add('   INNER JOIN Status ON STemp_Status = Sta_Id');
    obj.Lista.Add(' WHERE STemp_Data = ' + QuotedStr(sData));
    obj.Lista.Add( Usuario.RetornaPermissaoUsuarioDepartamento(AIdUsuario));

// CHAMADOS
    obj.Lista.Add(' UNION');
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('   ''Chamado'' AS Programa,');
    obj.Lista.Add('   Cha_Id AS Id,');
    obj.Lista.Add('   Usu_Nome As NomeUsuario,');
    obj.Lista.Add('   ChOco_HoraInicio As HoraInicio,');
    obj.Lista.Add('   ChOco_HoraFim As HoraFim,');
    obj.Lista.Add('   '''' AS Titulo,');
    obj.Lista.Add('   Cli_Nome AS Cliente,');
    obj.Lista.Add('   Sta_Nome AS Status');
    obj.Lista.Add(' FROM Chamado_Ocorrencia');
    obj.Lista.Add(' 	INNER JOIN Chamado ON ChOco_Chamado = Cha_Id');
    obj.Lista.Add(' 	INNER JOIN Usuario ON ChOco_Usuario = Usu_Id');
    obj.Lista.Add(' 	INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
    obj.Lista.Add(' 	INNER JOIN Status ON Cha_Status = Sta_Id');
    obj.Lista.Add(' WHERE ChOco_Data = ' + QuotedStr(sData));
    obj.Lista.Add(' AND Cha_TipoMovimento = 1');
    obj.Lista.Add( Usuario.RetornaPermissaoUsuarioDepartamento(AIdUsuario));

//    ATIVIDADES

    obj.Lista.Add(' UNION');
    obj.Lista.Add(' SELECT');
    obj.Lista.Add(' ''Atividade'' AS Programa,');
    obj.Lista.Add(' Cha_Id AS Id,');
    obj.Lista.Add(' Usu_Nome As NomeUsuario,');
    obj.Lista.Add(' ChOco_HoraInicio As HoraInicio,');
    obj.Lista.Add(' ChOco_HoraFim As HoraFim,');
    obj.Lista.Add(' '''' AS Titulo,');
    obj.Lista.Add(' Cli_Nome AS Cliente,');
    obj.Lista.Add(' Sta_Nome AS Status');
    obj.Lista.Add(' FROM Chamado_Ocorrencia');
    obj.Lista.Add(' 	INNER JOIN Chamado ON ChOco_Chamado = Cha_Id');
    obj.Lista.Add(' 	INNER JOIN Usuario ON ChOco_Usuario = Usu_Id');
    obj.Lista.Add(' 	INNER JOIN Cliente ON Cha_Cliente = Cli_Id');
    obj.Lista.Add(' 	INNER JOIN Status ON Cha_Status = Sta_Id');
    obj.Lista.Add(' WHERE ChOco_Data = ' + QuotedStr(sData));
    obj.Lista.Add(' AND Cha_TipoMovimento = 2');
    obj.Lista.Add( Usuario.RetornaPermissaoUsuarioDepartamento(AIdUsuario));

//    VISITAS
    obj.Lista.Add(' UNION');
    obj.Lista.Add(' SELECT');
    obj.Lista.Add(' ''Visita'' AS Programa,');
    obj.Lista.Add(' Vis_Id AS Id,');
    obj.Lista.Add(' Usu_Nome As NomeUsuario,');
    obj.Lista.Add(' Vis_HoraInicio As HoraInicio,');
    obj.Lista.Add(' Vis_HoraFim As HoraFim,');
    obj.Lista.Add(' '''' AS Titulo,');
    obj.Lista.Add(' Cli_Nome AS Cliente,');
    obj.Lista.Add(' Sta_Nome AS Status');
    obj.Lista.Add(' FROM Visita');
    obj.Lista.Add(' 	INNER JOIN Usuario ON Vis_Usuario = Usu_Id');
    obj.Lista.Add(' 	INNER JOIN Cliente ON Vis_Cliente = Cli_Id');
    obj.Lista.Add(' 	INNER JOIN Status ON Vis_Status = Sta_Id');
    obj.Lista.Add(' WHERE Vis_Data = ' + QuotedStr(sData));
    obj.Lista.Add( Usuario.RetornaPermissaoUsuarioDepartamento(AIdUsuario));

    obj.OpenSQL();

    while not obj.Model.Eof do
    begin
      VO := TSolicitacaoTempoVO.Create;
      VO.Programa               := obj.Model.FieldByName('Programa').AsString;
//      VO.Solicitacao.Id         := obj.Model.FieldByName('Id').AsInteger;
      VO.Solicitacao.Titulo     := obj.Model.FieldByName('Titulo').AsString;
//      VO.Solicitacao.Cliente.Id := obj.Model.FieldByName('Sol_Cliente').AsInteger;
      VO.Cliente.RazaoSocial    := obj.Model.FieldByName('Cliente').AsString;
//      VO.Usuario.Id             := obj.Model.FieldByName('Usu_Id').AsInteger;
//      VO.Usuario.Codigo         := obj.Model.FieldByName('Usu_Codigo').AsInteger;
      VO.Usuario.Nome           := obj.Model.FieldByName('NomeUsuario').AsString;
      VO.Id                     := obj.Model.FieldByName('Id').AsInteger;
      VO.HoraInicio             := obj.Model.FieldByName('HoraInicio').AsDateTime;
      VO.HoraFim                := obj.Model.FieldByName('HoraFim').AsDateTime;
//      VO.TotalHoras             := obj.Model.FieldByName('STemp_TotalHoras').AsFloat;
//      VO.Status.Id              := obj.Model.FieldByName('Sta_Id').AsInteger;
//      VO.Status.Codigo          := obj.Model.FieldByName('Sta_Codigo').AsInteger;
      VO.Status.Nome            := obj.Model.FieldByName('Status').AsString;

      Lista.Add(VO);
      obj.Model.Next;
    end;

    Result := Lista;
  finally
    FreeAndNil(obj);
    FreeAndNil(Usuario);
  end;
end;

procedure TSolicitacaoTempo.Excluir(AId: Integer);
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.ExecutarSQL('DELETE FROM Solicitacao_Tempo WHERE STemp_Id = ' + IntToStr(AId));
  finally
    FreeAndNil(obj);
  end;
end;

procedure TSolicitacaoTempo.Finalizar(AIdUsuarioLogado: Integer;
  ASolicitacaoTempoVO: TSolicitacaoTempoVO; AValidarUsuario: Boolean);
var
  obj: TFireDAC;
  VO: TSolicitacaoTempoVO;
  TotalHoras: Double;
  sTotalHoras: string;
begin
  obj := TFireDAC.create;
  try
    VO := LocalizarSolicitacao(ASolicitacaoTempoVO.IdSolicitacao);

    if ASolicitacaoTempoVO.Solicitacao.Status.Id <> VO.Solicitacao.Status.Id then
    begin
      if VO.Id > 0 then
      begin
        SolicitacaoAberta(AIdUsuarioLogado, ASolicitacaoTempoVO.IdSolicitacao);

        if VO.Id = 0 then
          raise Exception.Create('Não há registro!');

        if AValidarUsuario then
        begin
  //        if AIdUsuarioLogado <> VO.IdUsuario then
          if AIdUsuarioLogado <> VO.Solicitacao.UsuarioAtendeAtual then
            raise Exception.Create('Para Finalizar o Tempo deve ser o mesmo usuário que Iniciou!');
        end;

        if VO.Data <> Date then
          raise Exception.Create('Data de Encerramento não pode ser diferente da Data Inicial!');

        if VO.HoraInicio > Time then
          raise Exception.Create('Hora Inicial maior que Hora Final!');

        TotalHoras := CalcularTempo(VO.HoraInicio, Time);
        sTotalHoras := StringReplace(FloatToStr(TotalHoras), ',','.',[rfReplaceAll]);

        obj.Lista.Add('UPDATE Solicitacao_Tempo SET');
        obj.Lista.Add('   STemp_TotalHoras = ' + sTotalHoras);
        obj.Lista.Add('   ,STemp_HoraFim = ' + QuotedStr(FormatDateTime('hh:mm', Time)) );
        obj.Lista.Add(' WHERE STemp_Id = ' + IntToStr(VO.Id));
        obj.ExecutarSQL();
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(VO);
  end;
end;

function TSolicitacaoTempo.BuscarHorasEmAberto(AIdSolicitacao,
  AIdUsuario: Integer): TDateTime;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('   STemp_HoraInicio as Hora');
    obj.Lista.Add(' FROM Solicitacao_Tempo');
    obj.Lista.Add(' WHERE STemp_Solicitacao = ' + IntToStr(AIdSolicitacao));
    obj.Lista.Add(' AND STemp_UsuarioOperacional = ' + IntToStr(AIdUsuario));
    obj.Lista.Add(' AND STemp_HoraFim IS NULL');
    obj.OpenSQL();

    Result := obj.Model.FieldByName('Hora').AsDateTime;
  finally
    FreeAndNil(obj);
  end;
end;

function TSolicitacaoTempo.BuscarStatus(
  ASolicitacaoTempoVO: TSolicitacaoTempoVO): Integer;
var
  obj: TFireDAC;
  sNome: string;
begin
  sNome := RetornarNomeStatus(ASolicitacaoTempoVO.Status.Nome);
  obj := TFireDAC.create;
  try
    obj.OpenSQL('SELECT Sta_Id FROM Status WHERE Sta_Nome = ' + QuotedStr(sNome));
    Result := obj.Model.Fields[0].AsInteger;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TSolicitacaoTempo.Iniciar(AIdUsuario: Integer; ASolicitacaoTempoVO: TSolicitacaoTempoVO);
var
  sHoraInicial: string;
begin
  if ASolicitacaoTempoVO.IdUsuario <> AIdUsuario then
    raise Exception.Create('Usuário diferente da Solicitação!');

  if ASolicitacaoTempoVO.IdSolicitacao = 0 then
    raise Exception.Create('Não Solicitação!');

  SolicitacaoAberta(AIdUsuario, ASolicitacaoTempoVO.IdSolicitacao);

  if SolicitacaoAtualAberta(ASolicitacaoTempoVO.IdSolicitacao) then
    raise Exception.Create('Solicitação já está Aberta!');

  if ASolicitacaoTempoVO.Status.Nome.Trim() <> '' then
    ASolicitacaoTempoVO.IdStatus := BuscarStatus(ASolicitacaoTempoVO);

  sHoraInicial := FormatDateTime('hh:mm', Time);
  ASolicitacaoTempoVO.Id := 0;
  ASolicitacaoTempoVO.Data := Date;
  ASolicitacaoTempoVO.HoraInicio := StrToTime(sHoraInicial);
  ASolicitacaoTempoVO.HoraFim := 0;

  TGenericDAO.Save<TSolicitacaoTempoVO>(ASolicitacaoTempoVO);
end;

function TSolicitacaoTempo.ListarStatus: TJSONArray;
var
  parametro: TParametros;
  sCodigos: string;
  i: Integer;
  iTamanho: Integer;
  sResult: string;
  Lista: TJSONArray;
  Status: TStatus;
  sNome: string;
begin
  parametro := TParametros.Create;
  try
    sCodigos := parametro.LocalizarParametro(45, 3);
  finally
    FreeAndNil(parametro);
  end;

  Lista := TJSONArray.Create;

  sResult := '';
  iTamanho := Length(sCodigos);

  Status := TStatus.Create;
  try
    for I := 1 to iTamanho do
    begin
      if sCodigos[i] = '/' then
      begin
        sNome := Status.BuscarDescricao(StrToIntDef(sResult, 0));
        Lista.Add(sNome);
        sResult := '';
      end
      else
        sResult := sResult + sCodigos[i];
    end;
  finally
    FreeAndNil(Status);
  end;

  Result := Lista;
end;

function TSolicitacaoTempo.LocalizarId(AId: Integer): TSolicitacaoTempoVO;
var
  obj: TFireDAC;
  VO: TSolicitacaoTempoVO;
  sInstrucaoSQL: string;
begin
  obj := TFireDAC.create;
  VO := TSolicitacaoTempoVO.Create;
  try
    sInstrucaoSQL := TGenericDAO.Select<TSolicitacaoTempoVO>(VO);
    sInstrucaoSQL := sInstrucaoSQL + ' Usu_Codigo, Usu_Nome, Sol_UsuarioAtendeAtual, Sol_Status,';
    sInstrucaoSQL := sInstrucaoSQL + ' Sta_Codigo, Sta_Nome';
    sInstrucaoSQL := sInstrucaoSQL + ' FROM Solicitacao_Tempo';
    sInstrucaoSQL := sInstrucaoSQL + ' INNER JOIN Usuario ON STemp_UsuarioOperacional = Usu_Id';
    sInstrucaoSQL := sInstrucaoSQL + ' INNER JOIN Solicitacao ON STemp_Solicitacao = Sol_Id';
    sInstrucaoSQL := sInstrucaoSQL + ' LEFT JOIN Status ON STemp_Status = Sta_Id';
    sInstrucaoSQL := sInstrucaoSQL + ' WHERE STemp_Id = ' + IntToStr(AId);

    obj.OpenSQL(sInstrucaoSQL);

    VO.Id             := obj.Model.FieldByName('STemp_Id').AsInteger;
    VO.IdSolicitacao  := obj.Model.FieldByName('STemp_Solicitacao').AsInteger;
    VO.IdUsuario      := obj.Model.FieldByName('STemp_UsuarioOperacional').AsInteger;
    VO.Usuario.Codigo := obj.Model.FieldByName('Usu_Codigo').AsInteger;
    VO.Usuario.Nome   := obj.Model.FieldByName('Usu_Nome').AsString;
    VO.IdStatus       := obj.Model.FieldByName('STemp_Status').AsInteger;
    VO.Status.Codigo  := obj.Model.FieldByName('Sta_Codigo').AsInteger;
    VO.Status.Nome    := obj.Model.FieldByName('Sta_Nome').AsString;
    VO.Data           := obj.Model.FieldByName('STemp_Data').AsDateTime;
    VO.HoraInicio     := obj.Model.FieldByName('STemp_HoraInicio').AsDateTime;
    VO.HoraFim        := obj.Model.FieldByName('STemp_HoraFim').AsDateTime;
    VO.TotalHoras     := obj.Model.FieldByName('STemp_TotalHoras').AsFloat;
    VO.Solicitacao.UsuarioAtendeAtual := obj.Model.FieldByName('Sol_UsuarioAtendeAtual').AsInteger;
    VO.Solicitacao.Status.Id := obj.Model.FieldByName('Sol_Status').AsInteger;
    Result := VO;
  finally
    FreeAndNil(obj);
  end;
end;

function TSolicitacaoTempo.LocalizarPorSolicitacao(AIdSolicitacao: Integer):
  TObjectList<TSolicitacaoTempoVO>;
var
  Lista: TObjectList<TSolicitacaoTempoVO>;
  VO: TSolicitacaoTempoVO;
  obj: TFireDAC;
begin
  Lista := TObjectList<TSolicitacaoTempoVO>.Create();
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add(' STemp_Id, STemp_Data, STemp_HoraInicio, STemp_HoraFim, STemp_TotalHoras, STemp_Solicitacao, STemp_UsuarioOperacional, Usu_Codigo, Usu_Nome,');
    obj.Lista.Add(' STemp_Status, Sta_Codigo, Sta_Nome');
    obj.Lista.Add(' FROM Solicitacao_Tempo ');
    obj.Lista.Add(' INNER JOIN Usuario ON STemp_UsuarioOperacional = Usu_Id');
    obj.Lista.Add(' LEFT JOIN Status ON STemp_Status = Sta_Id');
    obj.Lista.Add(' WHERE STemp_Solicitacao = ' + IntToStr(AIdSolicitacao));
    obj.OpenSQL();
    while not obj.Model.Eof do
    begin
      VO := TSolicitacaoTempoVO.Create;
      VO.Id := obj.Model.FieldByName('STemp_Id').AsInteger;
      VO.Data := obj.Model.FieldByName('STemp_Data').AsDateTime;
      VO.HoraInicio := obj.Model.FieldByName('STemp_HoraInicio').AsDateTime;
      VO.HoraFim := obj.Model.FieldByName('STemp_HoraFim').AsDateTime;
      VO.TotalHoras := obj.Model.FieldByName('STemp_TotalHoras').AsFloat;
      VO.IdSolicitacao := obj.Model.FieldByName('STemp_Solicitacao').AsInteger;
      VO.IdUsuario := obj.Model.FieldByName('STemp_UsuarioOperacional').AsInteger;
      VO.IdStatus := obj.Model.FieldByName('STemp_Status').AsInteger;
      VO.Status.Codigo := obj.Model.FieldByName('Sta_Codigo').AsInteger;
      VO.Status.Nome := obj.Model.FieldByName('Sta_Nome').AsString;
      VO.Usuario.Codigo := obj.Model.FieldByName('Usu_Codigo').AsInteger;
      VO.Usuario.Nome := obj.Model.FieldByName('Usu_Nome').AsString;
      Lista.Add(VO);
      obj.Model.Next;
    end;
  finally
    FreeAndNil(obj);
  end;
  Result := Lista;
end;

function TSolicitacaoTempo.LocalizarSolicitacao(
  AIdSolicitacao: Integer): TSolicitacaoTempoVO;
var
  obj: TFireDAC;
  VO: TSolicitacaoTempoVO;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('   STemp_Id');
    obj.Lista.Add(' FROM Solicitacao_Tempo');
    obj.Lista.Add(' WHERE STemp_Solicitacao = ' + IntToStr(AIdSolicitacao));
    obj.Lista.Add(' AND STemp_Data IS NOT NULL');
    obj.Lista.Add(' AND STemp_HoraFim IS NULL');
    obj.OpenSQL();

    VO := LocalizarId(obj.Model.Fields[0].AsInteger);
    Result := VO;
  finally
    FreeAndNil(obj);
  end;
end;

function TSolicitacaoTempo.RetornarHorasAgrupadoPorStatus(
  AIdSolicitacao: Integer): TObjectList<TSolicitacaoTempoVO>;
var
  obj: TFireDAC;
  Lista: TObjectList<TSolicitacaoTempoVO>;
  VO: TSolicitacaoTempoVO;
begin
  obj := TFireDAC.create;
  Lista := TObjectList<TSolicitacaoTempoVO>.Create();
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('   Sta_Nome,');
    obj.Lista.Add('   SUM(STemp_TotalHoras) AS Horas');
    obj.Lista.Add(' FROM Solicitacao_Tempo');
    obj.Lista.Add(' INNER JOIN Status ON STemp_Status = Sta_Id');
    obj.Lista.Add(' WHERE STemp_Solicitacao = ' + IntToStr(AIdSolicitacao));
    obj.Lista.Add(' GROUP BY Sta_Nome');
    obj.OpenSQL();

    while not obj.Model.Eof do
    begin
      VO := TSolicitacaoTempoVO.Create;
      VO.TotalHoras := obj.Model.FieldByName('Horas').AsFloat;
      VO.Status.Nome := obj.Model.FieldByName('Sta_Nome').AsString;
      Lista.Add(VO);
      obj.Model.Next;
    end;

    Result := Lista;
  finally
    FreeAndNil(obj);
  end;
end;

function TSolicitacaoTempo.RetornarNomeStatus(ANomeStatus: string): string;
var
  iPos: Integer;
begin
  iPos := Pos('(', ANomeStatus);
  if iPos > 0 then
    Result := Trim(Copy(ANomeStatus, 1, iPos-1))
  else
    Result := Trim(ANomeStatus);
end;

function TSolicitacaoTempo.RetornarPorData(
  AData: string; AId, AIdUsuario: Integer): TObjectList<TSolicitacaoTempoVO>;
var
  obj: TFireDAC;
  Lista: TObjectList<TSolicitacaoTempoVO>;
  VO: TSolicitacaoTempoVO;
  sData: string;
  Usuario: TUsuario;
begin
  sData := AData;
  if sData.Trim <> DataEmBranco then
    sData := FormatDateTime('yyyymmdd', StrToDate(AData));

  Usuario := TUsuario.Create;
  obj := TFireDAC.create;
  Lista := TObjectList<TSolicitacaoTempoVO>.Create();
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('   Sol_Id,');
    obj.Lista.Add('   Sol_Titulo,');
    obj.Lista.Add('   Sol_Cliente,');
    obj.Lista.Add('   Cli_Nome,');
    obj.Lista.Add('   Usu_Nome,');
    obj.Lista.Add('   Usu_Codigo,');
    obj.Lista.Add('   Usu_Id,');
    obj.Lista.Add('   STemp_Id,');
    obj.Lista.Add('   STemp_HoraInicio,');
    obj.Lista.Add('   STemp_HoraFim,');
    obj.Lista.Add('   STemp_TotalHoras,');
    obj.Lista.Add('   STemp_Data,');
    obj.Lista.Add('   STemp_Status,');
    obj.Lista.Add('   Sta_Codigo,');
    obj.Lista.Add('   Sta_Nome');
    obj.Lista.Add(' FROM Solicitacao_Tempo');
    obj.Lista.Add(' INNER JOIN Solicitacao ON STemp_Solicitacao = Sol_Id');
    obj.Lista.Add(' INNER JOIN Usuario ON STemp_UsuarioOperacional = Usu_Id');
    obj.Lista.Add(' INNER JOIN Status ON STemp_Status = Sta_Id');
    obj.Lista.Add(' INNER JOIN Cliente ON Sol_Cliente = Cli_Id');
    obj.Lista.Add(' WHERE Sol_Id > 0');

    if sData.Trim <> DataEmBranco then
      obj.Lista.Add(' AND STemp_Data = ' + QuotedStr(sData));

    if AId > 0 then
      obj.Lista.Add(' AND Sol_Id = ' + IntToStr(AId));

    obj.Lista.Add(Usuario.RetornaPermissaoUsuarioDepartamento(AIdUsuario));


    obj.OpenSQL();

    while not obj.Model.Eof do
    begin
      VO := TSolicitacaoTempoVO.Create;
      VO.Solicitacao.Id         := obj.Model.FieldByName('Sol_Id').AsInteger;
      VO.Solicitacao.Titulo     := obj.Model.FieldByName('Sol_Titulo').AsString;
      VO.Solicitacao.Cliente.Id := obj.Model.FieldByName('Sol_Cliente').AsInteger;
      VO.Solicitacao.Cliente.RazaoSocial := obj.Model.FieldByName('Cli_Nome').AsString;
      VO.Usuario.Id             := obj.Model.FieldByName('Usu_Id').AsInteger;
      VO.Usuario.Codigo         := obj.Model.FieldByName('Usu_Codigo').AsInteger;
      VO.Usuario.Nome           := obj.Model.FieldByName('Usu_Nome').AsString;
      VO.Id                     := obj.Model.FieldByName('STemp_Id').AsInteger;
      VO.HoraInicio             := obj.Model.FieldByName('STemp_HoraInicio').AsDateTime;
      VO.HoraFim                := obj.Model.FieldByName('STemp_HoraFim').AsDateTime;
      VO.TotalHoras             := obj.Model.FieldByName('STemp_TotalHoras').AsFloat;
      VO.Status.Id              := obj.Model.FieldByName('STemp_Status').AsInteger;
      VO.Status.Codigo          := obj.Model.FieldByName('Sta_Codigo').AsInteger;
      VO.Status.Nome            := obj.Model.FieldByName('Sta_Nome').AsString;
      VO.Data                   := obj.Model.FieldByName('STemp_Data').AsDateTime;

      Lista.Add(VO);
      obj.Model.Next;
    end;

    Result := Lista;
  finally
    FreeAndNil(obj);
    FreeAndNil(Usuario);
  end;
end;

function TSolicitacaoTempo.Salvar(ASolicitacaoTempoVO: TSolicitacaoTempoVO): Integer;
var
  TotalHoras: Double;
  sTotalHoras: string;
begin
  TotalHoras := 0;

  if ASolicitacaoTempoVO.HoraFim > 0 then
  begin
    if ASolicitacaoTempoVO.HoraInicio > ASolicitacaoTempoVO.HoraFim then
      raise Exception.Create('Hora Inicial maior que Hora Final!');

    TotalHoras := CalcularTempo(ASolicitacaoTempoVO.HoraInicio, ASolicitacaoTempoVO.HoraFim);
  end;

  ASolicitacaoTempoVO.TotalHoras := TotalHoras;

  Result := TGenericDAO.Save<TSolicitacaoTempoVO>(ASolicitacaoTempoVO);
end;

procedure TSolicitacaoTempo.SolicitacaoAberta(AIdUsuario, AIdSolicitacao: Integer);
var
  obj: TFireDAC;
  Id: Integer;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT TOP(1)');
    obj.Lista.Add('   STemp_Solicitacao');
    obj.Lista.Add(' FROM Solicitacao_Tempo');
    obj.Lista.Add('   INNER JOIN Solicitacao_Ocorrencia ON STemp_Solicitacao = SOcor_Solicitacao');
    obj.Lista.Add(' WHERE STemp_UsuarioOperacional = ' + IntToStr(AIdUsuario));
    obj.Lista.Add(' AND STemp_Solicitacao <> ' + IntToStr(AIdSolicitacao));
    obj.Lista.Add(' AND STemp_HoraFim IS NULL');
    obj.OpenSQL();

    Id := obj.Model.Fields[0].AsInteger;

    if (Id > 0) then
      raise Exception.Create('Há uma Solicitação em Aberto Nº: ' + FormatFloat('000000', Id) +
        sLineBreak +
        'Finalize o Tempo da Solicitação para Trabalhar em Outra!');
  finally
    FreeAndNil(obj);
  end;
end;

function TSolicitacaoTempo.SolicitacaoAtualAberta(
  AIdSolicitacao: Integer): Boolean;
var
  obj: TFireDAC;
begin
  obj := TFireDAC.create;
  try
    obj.Lista.Add(' SELECT');
    obj.Lista.Add('   Count(STemp_Id)');
    obj.Lista.Add(' FROM Solicitacao_Tempo');
    obj.Lista.Add(' WHERE STemp_Solicitacao = ' + IntToStr(AIdSolicitacao));
    obj.Lista.Add(' AND STemp_HoraFim IS NULL');
    obj.OpenSQL();

    Result := obj.Model.Fields[0].AsInteger > 0;
  finally
    FreeAndNil(obj);
  end;
end;

end.
