unit uChamadoDetalhes2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, uEnumerador,
  uChamadoController, Data.DB, Datasnap.DBClient, uChamadoColaboradorVO, uChamadoVO,
  System.Generics.Collections, Vcl.ExtCtrls;

const
  COR_ABERTURA: Integer = clRed;
  COR_OCORR_GERAL: Integer = clPurple;
  COR_STATUS: Integer = clOlive;
  COR_PADRAO: Integer = clBlack;
  COR_TITULO: Integer = clRed;

  TAMANHO_DIVISAO:    Integer = 164;
  TRACO:              Char = '_';

type
  TfrmChamadoDetalhes2 = class(TForm)
    mmoGeral: TRichEdit;
    cdsDados: TClientDataSet;
    cdsDadosDocumento: TStringField;
    cdsDadosData: TDateField;
    cdsDadosHoraInicial: TStringField;
    cdsDadosHoraFinal: TStringField;
    cdsDadosUsuario: TStringField;
    cdsDadosColaborador1: TStringField;
    cdsDadosColaborador2: TStringField;
    cdsDadosColaborador3: TStringField;
    cdsDadosDescricaoProblema: TStringField;
    cdsDadosDescricaoSolucao: TStringField;
    cdsDadosAnexo: TStringField;
    cdsDadosNomeStatus: TStringField;
    cdsDadosTipo: TIntegerField;
    cdsDadosIdOcorrencia: TIntegerField;
    cdsStatus: TClientDataSet;
    cdsStatusData: TDateField;
    cdsStatusHora: TTimeField;
    cdsStatusNomeStatus: TStringField;
    cdsStatusNomeUsuario: TStringField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FIdChamado: Integer;
    FTipoMovimento: TEnumChamadoAtividade;
    FStatus: string;
    FListaColaboradores: TObjectList<TChamadoColaboradorVO>;
    procedure FormatarLinha(var AMemo: TRichEdit; ACor: Integer; ATexto: string; ANegrito: Boolean = False); overload;
    procedure ListarDados;
    procedure PreecherAbertura(AObj: TChamadoController);
    procedure PreecherOcorrencia(AObj: TChamadoController);
    procedure PreecherColaborador(AObj: TChamadoController);
    procedure PreencherStatus(AObj: TChamadoController);
    procedure ListarOcorrencia(AObj: TChamadoController);
    procedure ListarStatus(AObj: TChamadoController);
    procedure TracoDivisao();
    procedure DadosTempo();
  public
    { Public declarations }
    constructor create(AIdChamado: integer; ATipo: TEnumChamadoAtividade = caChamado);
  end;

var
  frmChamadoDetalhes2: TfrmChamadoDetalhes2;

implementation

{$R *.dfm}

uses uClienteController, uDM;

{ TfrmChamadoDetalhes2 }

constructor TfrmChamadoDetalhes2.create(AIdChamado: integer;
  ATipo: TEnumChamadoAtividade);
begin
  inherited create(nil);
  dm.ConexaoBanco;
  FIdChamado := AIdChamado;
  FTipoMovimento := ATipo;

  cdsStatus.CreateDataSet;
  cdsDados.CreateDataSet;

  cdsStatus.IndexFieldNames := 'Data;Hora';
  cdsDados.IndexFieldNames := 'Data';

  FListaColaboradores := TObjectList<TChamadoColaboradorVO>.Create;

  ListarDados();
end;

procedure TfrmChamadoDetalhes2.DadosTempo;
var
  obj: TChamadoController;
  sTempo: string;
begin
  obj := TChamadoController.Create;
  try
    sTempo := obj.BuscarTotalHorasDoChamado(FIdChamado);
    FormatarLinha(mmoGeral, COR_TITULO, 'TEMPO TOTAL:  ' + sTempo, True);
    FormatarLinha(mmoGeral, COR_PADRAO, StringOfChar(TRACO, TAMANHO_DIVISAO));
    mmoGeral.Lines.Add('');
  finally
    FreeAndNil(obj);
  end;
end;

procedure TfrmChamadoDetalhes2.FormatarLinha(var AMemo: TRichEdit;
  ACor: Integer; ATexto: string; ANegrito: Boolean);
begin
  AMemo.SelAttributes.Color := ACor;
  if ANegrito then
    AMemo.SelAttributes.Style:=[fsBold];

  AMemo.Lines.Add(ATexto);
  AMemo.SelAttributes.Color:=Color;
end;

procedure TfrmChamadoDetalhes2.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListaColaboradores);
end;

procedure TfrmChamadoDetalhes2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmChamadoDetalhes2.ListarDados;
var
  Obj: TChamadoController;
begin
  Obj := TChamadoController.Create;
  try
    Obj.Editar(FIdChamado, Self, FTipoMovimento);

    PreecherAbertura(Obj);
    PreecherOcorrencia(Obj);
    PreencherStatus(Obj);

    ListarOcorrencia(Obj);
    DadosTempo();
    ListarStatus(Obj);
  finally
    FreeAndNil(Obj);
  end;
end;

procedure TfrmChamadoDetalhes2.ListarOcorrencia(AObj: TChamadoController);
var
  Item: TChamadoColaboradorVO;
  iColaborador: Integer;
begin
  cdsDados.First;
  while not cdsDados.Eof do
  begin
    if cdsDadosHoraInicial.AsString <> '' then
    begin
      FormatarLinha(mmoGeral,COR_TITULO, 'OCORRÊNCIA', True);
      FormatarLinha(mmoGeral,COR_PADRAO, 'Documento: ' + cdsDadosDocumento.AsString);
      FormatarLinha(mmoGeral,COR_PADRAO, 'Data: ' + cdsDadosData.AsString);
      FormatarLinha(mmoGeral,COR_PADRAO, 'Hora Inicial: ' + cdsDadosHoraInicial.AsString);
      FormatarLinha(mmoGeral,COR_PADRAO, 'Hora Final: ' + cdsDadosHoraFinal.AsString);
      FormatarLinha(mmoGeral,COR_PADRAO, 'Usuário: ' + cdsDadosUsuario.AsString);

      // buscar colaboradores
      iColaborador := 1;
      if cdsDadosIdOcorrencia.AsInteger > 0 then
      begin
        for Item in FListaColaboradores do
        begin
          if Item.IdOcorrencia = cdsDadosIdOcorrencia.AsInteger then
          begin
            FormatarLinha(mmoGeral,COR_PADRAO, 'Colaborador : ' + IntToStr(iColaborador) + ' - ' + Item.UsuarioVO.Nome);
            Inc(iColaborador);
          end;

//          AObj.LocalizarChamadoColaborador(cdsDadosIdOcorrencia.AsInteger);
//          while not AObj.Model.CDSChamadoOcorrColaborador.Eof do
//          begin
//            AObj.Model.CDSChamadoOcorrColaboradorUsu_Nome.AsString;
//            FormatarLinha(mmoGeral,COR_PADRAO, 'Colaborador ' + IntToStr(iColaborador) + ': ' +  AObj.Model.CDSChamadoOcorrColaboradorUsu_Nome.AsString);
//            AObj.Model.CDSChamadoOcorrColaborador.Next;
//            Inc(iColaborador);
//          end;
        end;
      end;

      FormatarLinha(mmoGeral,COR_PADRAO, 'Anexo: ' + cdsDadosAnexo.AsString);
      FormatarLinha(mmoGeral,COR_PADRAO, 'Descrição Problema: ' + cdsDadosDescricaoProblema.AsString);
      FormatarLinha(mmoGeral,COR_PADRAO, 'Descrição Solução: ' + cdsDadosDescricaoSolucao.AsString);
      mmoGeral.Lines.Add('');
      TracoDivisao();
      mmoGeral.Lines.Add('');
    end;
    cdsDados.Next;
  end;
end;

procedure TfrmChamadoDetalhes2.ListarStatus(AObj: TChamadoController);
begin
  cdsStatus.First;
  while not cdsStatus.Eof do
  begin
    if cdsStatusNomeStatus.AsString <> '' then
    begin
      FormatarLinha(mmoGeral,COR_TITULO, 'STATUS', True);

      FormatarLinha(mmoGeral,COR_PADRAO, 'Data: ' + cdsStatusData.AsString);
      FormatarLinha(mmoGeral,COR_PADRAO, 'Hora: ' + cdsStatusHora.AsString);
      FormatarLinha(mmoGeral,COR_PADRAO, 'Status: ' + cdsStatusNomeStatus.AsString);
      FormatarLinha(mmoGeral,COR_PADRAO, 'Usuário: ' + cdsStatusNomeUsuario.AsString);
      mmoGeral.Lines.Add('');
      TracoDivisao();
      mmoGeral.Lines.Add('');
    end;
    cdsStatus.Next;
  end;
  FormatarLinha(mmoGeral,COR_TITULO, FStatus, True);
  mmoGeral.SelStart := Perform(EM_LINEINDEX, 0, 0);
end;

procedure TfrmChamadoDetalhes2.PreecherAbertura(AObj: TChamadoController);
var
  sNivel: string;
  Cliente: TClienteController;
  sRevenda: string;
  sConsultor: string;
begin
  if AObj.PermissaoChamadoAbertura(dm.IdUsuario) = False then
    Exit;

  Cliente := TClienteController.Create;
  try
    Cliente.LocalizarId(AObj.Model.CDSCadastroCha_Cliente.AsInteger);
    sRevenda := Cliente.Model.CDSCadastroRev_Nome.AsString;
    sConsultor := Cliente.Model.CDSCadastroUsu_Nome.AsString;
  finally
    FreeAndNil(Cliente);
  end;

  if AObj.Model.CDSCadastroCha_Nivel.AsInteger = 1 then
    sNivel := 'Baixo'
  else if AObj.Model.CDSCadastroCha_Nivel.AsInteger = 2 then
    sNivel := 'Normal'
  else if AObj.Model.CDSCadastroCha_Nivel.AsInteger = 3 then
    sNivel := 'Alto'
  else if AObj.Model.CDSCadastroCha_Nivel.AsInteger = 4 then
    sNivel := 'Crítico';

  mmoGeral.Lines.Add('');
  FormatarLinha(mmoGeral,COR_TITULO, 'ABERTURA', True);

  FormatarLinha(mmoGeral,COR_PADRAO, 'Id: ' + FormatFloat('000000',AObj.Model.CDSCadastroCha_Id.AsFloat) +
    ' - Data Abertura: ' + AObj.Model.CDSCadastroCha_DataAbertura.AsString +
    ' - Hora: ' + FormatDateTime('hh:mm',AObj.Model.CDSCadastroCha_HoraAbertura.AsDateTime) +
    ' - Usuário Abertura: ' + AObj.Model.CDSCadastroUsu_Nome.AsString);

  FormatarLinha(mmoGeral,COR_PADRAO, 'Cliente: ' + AObj.Model.CDSCadastroCli_Nome.AsString);
  FormatarLinha(mmoGeral,COR_PADRAO, 'Contato: ' + AObj.Model.CDSCadastroCha_Contato.AsString);
  FormatarLinha(mmoGeral,COR_PADRAO, 'Nivel: ' + sNivel);
  FormatarLinha(mmoGeral,COR_PADRAO, 'Módulo: ' + AObj.Model.CDSCadastroMod_Nome.AsString);
  FormatarLinha(mmoGeral,COR_PADRAO, 'Produto: ' + AObj.Model.CDSCadastroProd_Nome.AsString);
  FormatarLinha(mmoGeral,COR_PADRAO, 'Tipo: ' + AObj.Model.CDSCadastroTip_Nome.AsString);
  FormatarLinha(mmoGeral,COR_PADRAO, 'Status: ' + AObj.Model.CDSCadastroSta_Nome.AsString);
  FormatarLinha(mmoGeral,COR_PADRAO, 'Revenda: ' + sRevenda);
  FormatarLinha(mmoGeral,COR_PADRAO, 'Consultor: ' + sConsultor);
  FormatarLinha(mmoGeral,COR_PADRAO, 'Descrição: ' + AObj.Model.CDSCadastroCha_Descricao.AsString);
  mmoGeral.Lines.Add('');
  TracoDivisao();
  mmoGeral.Lines.Add('');

  FStatus := 'Status Atual: ' + AObj.Model.CDSCadastroSta_Nome.AsString;

  PreecherColaborador(AObj);
end;

procedure TfrmChamadoDetalhes2.PreecherColaborador(AObj: TChamadoController);
var
  VO: TChamadoColaboradorVO;
begin
  AObj.LocalizarChamadoColaborador(AObj.Model.CDSCadastroCha_Id.AsInteger);
  while not AObj.Model.CDSChamadoOcorrColaborador.Eof do
  begin
    VO := TChamadoColaboradorVO.Create;
    VO.UsuarioVO.Nome := AObj.Model.CDSChamadoOcorrColaboradorUsu_Nome.AsString;
    VO.IdOcorrencia := AObj.Model.CDSChamadoOcorrColaboradorChaOCol_ChamadoOcorrencia.AsInteger;
    FListaColaboradores.Add(VO);
    AObj.Model.CDSChamadoOcorrColaborador.Next;
  end;
end;

procedure TfrmChamadoDetalhes2.PreecherOcorrencia(AObj: TChamadoController);
begin
  if AObj.PermissaoChamadoOcorrencia(dm.IdUsuario) = False then
    Exit;

  while not AObj.Model.CDSChamadoOcorrenciaCons.Eof do
  begin
    cdsDados.Append;
    cdsDadosTipo.AsInteger              := 1;
    cdsDadosDocumento.AsString          := AObj.Model.CDSChamadoOcorrenciaConsChOco_Docto.AsString;
    cdsDadosData.AsDateTime             := AObj.Model.CDSChamadoOcorrenciaConsChOco_Data.AsDateTime;
    cdsDadosHoraInicial.AsString        := FormatDateTime('hh:mm', AObj.Model.CDSChamadoOcorrenciaConsChOco_HoraInicio.AsDateTime);
    cdsDadosHoraFinal.AsString          := FormatDateTime('hh:mm', AObj.Model.CDSChamadoOcorrenciaConsChOco_HoraFim.AsDateTime);
    cdsDadosUsuario.AsString            := AObj.Model.CDSChamadoOcorrenciaConsUsu_Nome.AsString;

    cdsDadosDescricaoProblema.AsString  := AObj.Model.CDSChamadoOcorrenciaConsChOco_DescricaoTecnica.AsString;
    cdsDadosDescricaoSolucao.AsString   := AObj.Model.CDSChamadoOcorrenciaConsChOco_DescricaoSolucao.AsString;
    cdsDadosAnexo.AsString              := AObj.Model.CDSChamadoOcorrenciaConsChOco_Anexo.AsString;
    cdsDadosIdOcorrencia.AsInteger      := AObj.Model.CDSChamadoOcorrenciaConsChOco_Id.AsInteger;
    cdsDados.Post;
    AObj.Model.CDSChamadoOcorrenciaCons.Next;
  end;
end;

procedure TfrmChamadoDetalhes2.PreencherStatus(AObj: TChamadoController);
begin
  if AObj.PermissaoChamadoStatus(dm.IdUsuario) = False then
    Exit;

  while not AObj.Model.CDSChamadoStatus.Eof do
  begin
    cdsStatus.Append;
    cdsStatusData.AsDateTime      := AObj.Model.CDSChamadoStatusChSta_Data.AsDateTime;
    cdsStatusHora.AsDateTime      := AObj.Model.CDSChamadoStatusChSta_Hora.AsDateTime;
    cdsStatusNomeStatus.AsString  := AObj.Model.CDSChamadoStatusSta_Nome.AsString;
    cdsStatusNomeUsuario.AsString := AObj.Model.CDSChamadoStatusUsu_Nome.AsString;
    cdsStatus.Post;
    AObj.Model.CDSChamadoStatus.Next;
  end;
end;

procedure TfrmChamadoDetalhes2.TracoDivisao;
begin
  FormatarLinha(mmoGeral, COR_PADRAO, StringOfChar(TRACO, TAMANHO_DIVISAO));
end;

end.
