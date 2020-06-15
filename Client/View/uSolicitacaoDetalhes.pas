unit uSolicitacaoDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uSolicitacaoController,
  Vcl.ComCtrls, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient;

const
  COR_ABERTURA:       Integer = clRed;
  COR_ANALISE:        Integer = clGreen;
  COR_CRONOGRAMA:     Integer = clBlue;
  COR_OCORR_GERAL:    Integer = clPurple;
  COR_OCORR_TECNICA:  Integer = clBlack;
  COR_STATUS:         Integer = clOlive;

  TAMANHO_DIVISAO:    Integer = 100;

type
  TfrmSolicitacaoDetalhes = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    shpAbertura: TShape;
    Label2: TLabel;
    shpAnalista: TShape;
    Label3: TLabel;
    shpCronograma: TShape;
    Label4: TLabel;
    shpOcorrGeral: TShape;
    shpOcorrTecnica: TShape;
    Label5: TLabel;
    shpOcorrStatus: TShape;
    Label6: TLabel;
    cdsDados: TClientDataSet;
    cdsDadosTipo: TIntegerField;
    cdsDadosData: TDateField;
    cdsDadosHora: TStringField;
    cdsDadosOperador: TStringField;
    cdsDadosAnexo: TStringField;
    cdsDadosDescricao: TStringField;
    cdsDadosStatus: TStringField;
    CategoryPanelGroup1: TCategoryPanelGroup;
    ctpAbertura: TCategoryPanel;
    ctpAnalise: TCategoryPanel;
    ctpCronograma: TCategoryPanel;
    ctpOcorrencias: TCategoryPanel;
    mmoGeral: TRichEdit;
    mmoCronograma: TRichEdit;
    mmoAnalise: TRichEdit;
    mmoObs: TRichEdit;
    cdsDadosDescricaoMemo: TMemoField;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    FIdSolicitacao: Integer;
    FTracoNovaAba: string;
    FTracoNovoItem: string;
    FStatus: string;

    procedure DadosAbertura();
    procedure DadosCronograma(ASol: TSolicitacaoController);
    procedure DadosOcorrenciaGeral(ASol: TSolicitacaoController);
    procedure DadosOcorrenciaTecnica(ASol: TSolicitacaoController);
    procedure DadosStatus(ASol: TSolicitacaoController);
    procedure FormatarLinha(ACor: Integer; ATexto: string; ANegrito: Boolean = False); overload;
    procedure FormatarLinha(var AMemo: TRichEdit; ACor: Integer; ATexto: string; ANegrito: Boolean = False); overload;
    procedure PreencherDados(ASol: TSolicitacaoController);

    procedure Legendas;
  public
    constructor Create(IdSolicitacao: Integer);

  end;

var
  frmSolicitacaoDetalhes: TfrmSolicitacaoDetalhes;

implementation

{$R *.dfm}

uses uDM;


procedure TfrmSolicitacaoDetalhes.FormatarLinha(ACor: Integer; ATexto: string;
  ANegrito: Boolean = False);
begin
  mmoObs.SelAttributes.Color := ACor;
  if ANegrito then
    mmoObs.SelAttributes.Style:=[fsBold];

  mmoObs.Lines.Add(ATexto);
  mmoObs.SelAttributes.Color:=Color;
end;


constructor TfrmSolicitacaoDetalhes.Create(IdSolicitacao: Integer);
begin
  inherited Create(nil);
  FIdSolicitacao := IdSolicitacao;
  FTracoNovaAba  := StringOfChar('=', 108);
  FTracoNovoItem := StringOfChar('-', 108);
end;

procedure TfrmSolicitacaoDetalhes.DadosAbertura;
var
  obj: TSolicitacaoController;
  sNivel: string;
  sUsuario: string;
  sAnexo: string;
  PermissaoOcorrenciaGeral: Boolean;
  PermissaoOcorrenciaTecnica: Boolean;
  PermissaoStatus: Boolean;
begin
  FStatus := '';
  obj := TSolicitacaoController.Create;
  try
    obj.LocalizarId(FIdSolicitacao);

    if obj.PermissaoAbertura(dm.IdUsuario) then
    begin
      if obj.Model.CDSCadastroSol_Nivel.AsInteger = 1 then
        sNivel := 'Baixo'
      else if obj.Model.CDSCadastroSol_Nivel.AsInteger = 2 then
        sNivel := 'Normal'
      else if obj.Model.CDSCadastroSol_Nivel.AsInteger = 3 then
        sNivel := 'Alto'
      else if obj.Model.CDSCadastroSol_Nivel.AsInteger = 4 then
        sNivel := 'Crítico';

      sUsuario := ' - Usuário Abertura: ' + obj.Model.CDSCadastroUAb_Nome.AsString;
      sAnexo := ' - Anexo: ' + obj.Model.CDSCadastroSol_Anexo.AsString;

      FormatarLinha(mmoObs,COR_ABERTURA, 'Id: ' + FormatFloat('000000',obj.Model.CDSCadastroSol_Id.AsFloat) + ' - Data: ' + obj.Model.CDSCadastroSol_Data.AsString + ' - Hora: ' + FormatDateTime('hh:mm',obj.Model.CDSCadastroSol_Hora.AsDateTime) + sUsuario + ' - Nível: ' + sNivel);
      FormatarLinha(mmoObs,COR_ABERTURA, 'Cliente: ' + obj.Model.CDSCadastroCli_Nome.AsString);
      FormatarLinha(mmoObs,COR_ABERTURA, 'Título: ' + obj.Model.CDSCadastroSol_Titulo.AsString);
      FormatarLinha(mmoObs,COR_ABERTURA, 'Status: ' + obj.Model.CDSCadastroSta_Nome.AsString);
      FormatarLinha(mmoObs,COR_ABERTURA, 'Versão: ' + obj.Model.CDSCadastroSol_Versao.AsString + sAnexo);
      FormatarLinha(mmoObs,COR_ABERTURA, 'Módulo: ' + obj.Model.CDSCadastroMod_Nome.AsString);
      FormatarLinha(mmoObs,COR_ABERTURA, 'Produto: ' + obj.Model.CDSCadastroProd_Nome.AsString);
      FormatarLinha(mmoObs,COR_ABERTURA, 'Descrição: ' + obj.Model.CDSCadastroSol_Descricao.AsString);
      FStatus := 'Status: ' + obj.Model.CDSCadastroSta_Nome.AsString;
    end
    else
      ctpAbertura.Visible := False;

    if obj.PermissaoAnalise(dm.IdUsuario) then
    begin
      FormatarLinha(mmoAnalise,COR_ANALISE, 'Analista: ' + obj.Model.CDSCadastroAnal_Nome.AsString + ' - ' +
        'Desenvolvedor: ' + obj.Model.CDSCadastroDesenv_Nome.AsString + ' - ' +
        'Tempo Previsto: ' + obj.Model.CDSCadastroSol_TempoPrevisto.AsString);

      FormatarLinha(mmoAnalise,COR_ANALISE, 'Previsão de Entrega: ' + obj.Model.CDSCadastroSol_PrevisaoEntrega.AsString);
      FormatarLinha(mmoAnalise,COR_ANALISE, 'Descrição: ' + obj.Model.CDSCadastroSol_DescricaoLiberacao.AsString);
    end
    else
      ctpAnalise.Visible := False;

    PermissaoOcorrenciaGeral   := obj.PermissaoOcorrenciaGeral(dm.IdUsuario);
    PermissaoOcorrenciaTecnica := obj.PermissaoOcorrenciaTecnica(dm.IdUsuario);
    PermissaoStatus            := obj.PermissaoStatus(dm.IdUsuario);

    if (PermissaoOcorrenciaGeral = false) and (PermissaoOcorrenciaTecnica = false) and (PermissaoStatus = false) then
      ctpOcorrencias.Visible := False;

    DadosCronograma(obj);

    PreencherDados(obj);

    cdsDados.First;
    while not cdsDados.Eof do
    begin
      case cdsDadosTipo.AsInteger of
        1:
        begin
          if PermissaoOcorrenciaGeral then
            DadosOcorrenciaGeral(obj);
        end;
        2:
        begin
          if PermissaoOcorrenciaTecnica then
            DadosOcorrenciaTecnica(obj);
        end;
        3:
        begin
          if PermissaoStatus then
            DadosStatus(obj);
        end;
      end;
      cdsDados.Next;
    end;

    FormatarLinha(mmoGeral, COR_STATUS, FStatus);

    // posiciona cursor na primeira linha
    with mmoGeral do
      SelStart := Perform(EM_LINEINDEX, 0, 0);

  finally
    FreeAndNil(obj);
  end;
end;

procedure TfrmSolicitacaoDetalhes.DadosCronograma(ASol: TSolicitacaoController);
var
  sHoraInicial: string;
  sHoraFinal: string;
  sOperador: string;
begin
  ASol.LocalizarCronograma(FIdSolicitacao);
  while not ASol.Model.CDSCronogramaConsulta.Eof do
  begin
    sHoraInicial := FormatDateTime('hh:mm', ASol.Model.CDSCronogramaConsultaSCro_HoraInicio.AsDateTime);
    sHoraFinal := FormatDateTime('hh:mm', ASol.Model.CDSCronogramaConsultaSCro_HoraFim.AsDateTime);
    sOperador := ASol.Model.CDSCronogramaConsultaUsu_Nome.AsString;

    FormatarLinha(mmoCronograma,COR_CRONOGRAMA,'Previsão Início: ' + ASol.Model.CDSCronogramaConsultaSCro_Data.AsString + ' - Hora Início: ' + sHoraInicial + ' - Hora Fim: ' + sHoraFinal + ' - Operador: ' + sOperador);
    ASol.Model.CDSCronogramaConsulta.Next;
  end;
end;

procedure TfrmSolicitacaoDetalhes.DadosOcorrenciaGeral(
  ASol: TSolicitacaoController);
var
  sHora: string;
begin
  sHora :=  cdsDadosHora.AsString;
  FormatarLinha(mmoGeral, COR_OCORR_GERAL, 'Data: ' + cdsDadosData.AsString + ' - Hora: ' + sHora + ' - Operador: ' + cdsDadosOperador.AsString);
  FormatarLinha(mmoGeral, COR_OCORR_GERAL, 'Descricao: ' + cdsDadosDescricao.AsString);
  FormatarLinha(mmoGeral, COR_OCORR_GERAL, 'Anexo: ' + cdsDadosAnexo.AsString);
  FormatarLinha(mmoGeral,COR_OCORR_GERAL, StringOfChar('=', TAMANHO_DIVISAO));
  mmoGeral.Lines.Add('');
end;

procedure TfrmSolicitacaoDetalhes.DadosOcorrenciaTecnica(
  ASol: TSolicitacaoController);
var
  sHora: string;
begin
  sHora := cdsDadosHora.AsString;
  FormatarLinha(mmoGeral, COR_OCORR_TECNICA, 'Data: ' + cdsDadosData.AsString + ' - Hora: ' + sHora + ' - Operador: ' + cdsDadosOperador.AsString);
  FormatarLinha(mmoGeral, COR_OCORR_TECNICA, 'Descricao: ' + cdsDadosDescricao.AsString);
  FormatarLinha(mmoGeral, COR_OCORR_TECNICA, 'Anexo: ' + cdsDadosAnexo.AsString);
  FormatarLinha(mmoGeral, COR_OCORR_TECNICA, StringOfChar('=', TAMANHO_DIVISAO));
  mmoGeral.Lines.Add('');
end;

procedure TfrmSolicitacaoDetalhes.DadosStatus(ASol: TSolicitacaoController);
begin
  if cdsDadosStatus.AsString <> '' then
  begin
    FormatarLinha(mmoGeral, COR_STATUS, 'Data: ' + cdsDadosData.AsString + ' - Status: ' + cdsDadosStatus.AsString);
    FormatarLinha(mmoGeral, COR_STATUS, 'Operador: ' + cdsDadosOperador.AsString);
    mmoGeral.Lines.Add('');
  end;
end;

procedure TfrmSolicitacaoDetalhes.FormatarLinha(var AMemo: TRichEdit;
  ACor: Integer; ATexto: string; ANegrito: Boolean);
begin
  AMemo.SelAttributes.Color := ACor;
  if ANegrito then
    AMemo.SelAttributes.Style:=[fsBold];

  AMemo.Lines.Add(ATexto);
  AMemo.SelAttributes.Color:=Color;
end;

procedure TfrmSolicitacaoDetalhes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmSolicitacaoDetalhes.FormShow(Sender: TObject);
begin
  cdsDados.CreateDataSet;
  cdsDados.IndexFieldNames := 'Tipo;Data';
  Legendas();
  DadosAbertura();
  mmoObs.SetFocus;
end;

procedure TfrmSolicitacaoDetalhes.Legendas;
begin
  shpAbertura.Brush.Color     := COR_ABERTURA;
  shpAnalista.Brush.Color     := COR_ANALISE;
  shpCronograma.Brush.Color   := COR_CRONOGRAMA;
  shpOcorrGeral.Brush.Color   := COR_OCORR_GERAL;
  shpOcorrTecnica.Brush.Color := COR_OCORR_TECNICA;
  shpOcorrStatus.Brush.Color  := COR_STATUS;
end;

procedure TfrmSolicitacaoDetalhes.PreencherDados(ASol: TSolicitacaoController);
var
  sHora: string;
begin
// dados ocorrencia geral
  ASol.LocalizarOcorrenciaGeral(FIdSolicitacao);
  while not ASol.Model.CDSOcorrenciaGeralConsulta.Eof do
  begin
    sHora := FormatDateTime('hh:mm', ASol.Model.CDSOcorrenciaGeralConsultaSOcor_Hora.AsDateTime);
    cdsDados.Append;
    cdsDadosTipo.AsInteger := 1;

    if ASol.Model.CDSOcorrenciaGeralConsultaSOcor_Hora.AsString <> '' then
      cdsDadosHora.AsString := sHora;

    if ASol.Model.CDSOcorrenciaGeralConsultaSOcor_Data.AsString <> '' then
      cdsDadosData.AsDateTime := ASol.Model.CDSOcorrenciaGeralConsultaSOcor_Data.AsDateTime;

    cdsDadosOperador.AsString := ASol.Model.CDSOcorrenciaGeralConsultaUsu_Nome.AsString;
    cdsDadosDescricao.AsString := ASol.Model.CDSOcorrenciaGeralConsultaSOcor_Descricao.AsString;
    cdsDadosAnexo.AsString := ASol.Model.CDSOcorrenciaGeralConsultaSOcor_Anexo.AsString;
    cdsDados.Post;

    ASol.Model.CDSOcorrenciaGeralConsulta.Next;
  end;

// dados da ocorrencia tecnica
  ASol.LocalizarOcorrenciaTecnica(FIdSolicitacao);
  while not ASol.Model.CDSOcorrenciaTecnicaConsulta.Eof do
  begin
    sHora := FormatDateTime('hh:mm', ASol.Model.CDSOcorrenciaTecnicaConsultaSOcor_Hora.AsDateTime);
    cdsDados.Append;
    cdsDadosTipo.AsInteger := 2;

    if ASol.Model.CDSOcorrenciaTecnicaConsultaSOcor_Hora.AsString <> '' then
      cdsDadosHora.AsString := sHora;

    if ASol.Model.CDSOcorrenciaTecnicaConsultaSOcor_Data.AsString <> '' then
      cdsDadosData.AsDateTime := ASol.Model.CDSOcorrenciaTecnicaConsultaSOcor_Data.AsDateTime;

    cdsDadosOperador.AsString := ASol.Model.CDSOcorrenciaTecnicaConsultaUsu_Nome.AsString;
    cdsDadosDescricao.AsString := ASol.Model.CDSOcorrenciaTecnicaConsultaSOcor_Descricao.AsString;
    cdsDadosAnexo.AsString := ASol.Model.CDSOcorrenciaTecnicaConsultaSOcor_Anexo.AsString;
    cdsDados.Post;

    ASol.Model.CDSOcorrenciaTecnicaConsulta.Next;
  end;

// Dados do Status
  ASol.LocalizarStatus(FIdSolicitacao);
  while not ASol.Model.CDSStatusConsulta.Eof do
  begin
    cdsDados.Append;
    cdsDadosTipo.AsInteger := 3;
    cdsDadosData.AsDateTime := ASol.Model.CDSStatusConsultaSSta_Data.AsDateTime;
    cdsDadosStatus.AsString := ASol.Model.CDSStatusConsultaSta_Nome.AsString;
    cdsDadosOperador.AsString := ASol.Model.CDSStatusConsultaUsu_nome.AsString;
    cdsDados.Post;
    ASol.Model.CDSStatusConsulta.Next;
  end;
end;

end.
