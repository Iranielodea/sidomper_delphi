unit uChamadoDetalhes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  uChamadoController, Data.DB, Datasnap.DBClient, uEnumerador;

const
  COR_ABERTURA: Integer = clRed;
  COR_OCORR_GERAL: Integer = clPurple;
  COR_STATUS: Integer = clOlive;

type
  TfrmChamadoDetalhes = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    shpAbertura: TShape;
    Label4: TLabel;
    shpOcorrGeral: TShape;
    shpOcorrStatus: TShape;
    Label6: TLabel;
    CategoryPanelGroup1: TCategoryPanelGroup;
    ctpOcorrencias: TCategoryPanel;
    mmoGeral: TRichEdit;
    ctpAbertura: TCategoryPanel;
    mmoObs: TRichEdit;
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
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    FStatus: string;
    FIdChamado: Integer;
    FTipoMovimento: TEnumChamadoAtividade;
    procedure Legendas;
    procedure PreencherDados;
    procedure PreecherAbertura(AObj: TChamadoController);
    procedure PreecherOcorrencia(AObjChamado: TChamadoController);
    procedure PreencherStatus(AObjChamado: TChamadoController);
    procedure ListarOcorrenciaStatus(AObj: TChamadoController);
    procedure FormatarLinha(var AMemo: TRichEdit; ACor: Integer; ATexto: string; ANegrito: Boolean = False); overload;
  public
    { Public declarations }
    constructor create(AIdChamado: integer; ATipo: TEnumChamadoAtividade = caChamado);
  end;

var
  frmChamadoDetalhes: TfrmChamadoDetalhes;

implementation

{$R *.dfm}

uses uDM, uClienteController;

{ TfrmChamadoDetalhes }

constructor TfrmChamadoDetalhes.create(AIdChamado: integer; ATipo: TEnumChamadoAtividade);
begin
  inherited create(nil);
  FIdChamado := AIdChamado;
  FTipoMovimento := ATipo;
end;

procedure TfrmChamadoDetalhes.Legendas;
begin
  shpAbertura.Brush.Color     := COR_ABERTURA;
  shpOcorrGeral.Brush.Color   := COR_OCORR_GERAL;
  shpOcorrStatus.Brush.Color  := COR_STATUS;
end;


procedure TfrmChamadoDetalhes.ListarOcorrenciaStatus(AObj: TChamadoController);
var
  iColaborador: Integer;
begin
  iColaborador := 1;
  cdsDados.First;
  while not cdsDados.Eof do
  begin
    case cdsDadosTipo.AsInteger of
      1:
      begin
        if cdsDadosHoraInicial.AsString <> '' then
        begin
          FormatarLinha(mmoGeral,COR_OCORR_GERAL, 'Documento: ' + cdsDadosDocumento.AsString);
          FormatarLinha(mmoGeral,COR_OCORR_GERAL, 'Data: ' + cdsDadosData.AsString);
          FormatarLinha(mmoGeral,COR_OCORR_GERAL, 'Hora Inicial: ' + cdsDadosHoraInicial.AsString);
          FormatarLinha(mmoGeral,COR_OCORR_GERAL, 'Hora Final: ' + cdsDadosHoraFinal.AsString);
          FormatarLinha(mmoGeral,COR_OCORR_GERAL, 'Usuário: ' + cdsDadosUsuario.AsString);

          // buscar colaboradores
          if cdsDadosIdOcorrencia.AsInteger > 0 then
          begin
            AObj.LocalizarChamadoColaborador(cdsDadosIdOcorrencia.AsInteger);
            while not AObj.Model.CDSChamadoOcorrColaborador.Eof do
            begin
              AObj.Model.CDSChamadoOcorrColaboradorUsu_Nome.AsString;
              FormatarLinha(mmoGeral,COR_OCORR_GERAL, 'Colaborador ' + IntToStr(iColaborador) + ': ' +  AObj.Model.CDSChamadoOcorrColaboradorUsu_Nome.AsString);
              AObj.Model.CDSChamadoOcorrColaborador.Next;
              Inc(iColaborador);
            end;
          end;

          FormatarLinha(mmoGeral,COR_OCORR_GERAL, 'Anexo: ' + cdsDadosAnexo.AsString);
          FormatarLinha(mmoGeral,COR_OCORR_GERAL, 'Descrição Problema: ' + cdsDadosDescricaoProblema.AsString);
          FormatarLinha(mmoGeral,COR_OCORR_GERAL, 'Descrição Solução: ' + cdsDadosDescricaoSolucao.AsString);
          FormatarLinha(mmoGeral,COR_OCORR_GERAL, StringOfChar('=', 100));
          mmoGeral.Lines.Add('');
        end;
      end;
      2:
      begin
        if cdsDadosNomeStatus.AsString <> '' then
        begin
          FormatarLinha(mmoGeral,COR_STATUS, 'Data Status: ' + cdsDadosData.AsString);
          FormatarLinha(mmoGeral,COR_STATUS, 'Hora Status: ' + cdsDadosHoraInicial.AsString);
          FormatarLinha(mmoGeral,COR_STATUS, 'Status: ' + cdsDadosNomeStatus.AsString);
          FormatarLinha(mmoGeral,COR_STATUS, 'Usuário Status: ' + cdsDadosUsuario.AsString);
          mmoGeral.Lines.Add('');
        end;
      end;
    end;
    cdsDados.Next;
  end;
  FormatarLinha(mmoGeral,COR_STATUS, 'Status: ' + FStatus);
end;

procedure TfrmChamadoDetalhes.PreecherOcorrencia(AObjChamado: TChamadoController);
begin
  while not AObjChamado.Model.CDSChamadoOcorrenciaCons.Eof do
  begin
    cdsDados.Append;
    cdsDadosTipo.AsInteger              := 1;
    cdsDadosDocumento.AsString          := AObjChamado.Model.CDSChamadoOcorrenciaConsChOco_Docto.AsString;
    cdsDadosData.AsDateTime             := AObjChamado.Model.CDSChamadoOcorrenciaConsChOco_Data.AsDateTime;
    cdsDadosHoraInicial.AsString        := FormatDateTime('hh:mm', AObjChamado.Model.CDSChamadoOcorrenciaConsChOco_HoraInicio.AsDateTime);
    cdsDadosHoraFinal.AsString          := FormatDateTime('hh:mm', AObjChamado.Model.CDSChamadoOcorrenciaConsChOco_HoraFim.AsDateTime);
    cdsDadosUsuario.AsString            := AObjChamado.Model.CDSChamadoOcorrenciaConsUsu_Nome.AsString;

//    cdsDadosColaborador1.AsString       := AObjChamado.Model.CDSChamadoOcorrenciaConsUsu_Nome1.AsString;
//    cdsDadosColaborador2.AsString       := AObjChamado.Model.CDSChamadoOcorrenciaConsUsu_Nome2.AsString;
//    cdsDadosColaborador3.AsString       := AObjChamado.Model.CDSChamadoOcorrenciaConsUsu_Nome3.AsString;

    cdsDadosDescricaoProblema.AsString  := AObjChamado.Model.CDSChamadoOcorrenciaConsChOco_DescricaoTecnica.AsString;
    cdsDadosDescricaoSolucao.AsString   := AObjChamado.Model.CDSChamadoOcorrenciaConsChOco_DescricaoSolucao.AsString;
    cdsDadosAnexo.AsString              := AObjChamado.Model.CDSChamadoOcorrenciaConsChOco_Anexo.AsString;
    cdsDadosIdOcorrencia.AsInteger      := AObjChamado.Model.CDSChamadoOcorrenciaConsChOco_Id.AsInteger;
    cdsDados.Post;
    AObjChamado.Model.CDSChamadoOcorrenciaCons.Next;
  end;
end;

procedure TfrmChamadoDetalhes.FormatarLinha(var AMemo: TRichEdit; ACor: Integer;
  ATexto: string; ANegrito: Boolean);
begin
  AMemo.SelAttributes.Color := ACor;
  if ANegrito then
    AMemo.SelAttributes.Style:=[fsBold];

  AMemo.Lines.Add(ATexto);
  AMemo.SelAttributes.Color:=Color;
end;

procedure TfrmChamadoDetalhes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmChamadoDetalhes.FormShow(Sender: TObject);
begin
  Legendas();
  PreencherDados();
  try
    mmoObs.SetFocus;
  except
    // nada
  end;
end;

procedure TfrmChamadoDetalhes.PreecherAbertura(AObj: TChamadoController);
var
  sNivel: string;
  Cliente: TClienteController;
  sRevenda: string;
  sConsultor: string;
begin
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

  FormatarLinha(mmoObs,COR_ABERTURA, 'Id: ' + FormatFloat('000000',AObj.Model.CDSCadastroCha_Id.AsFloat) +
    ' - Data Abertura: ' + AObj.Model.CDSCadastroCha_DataAbertura.AsString +
    ' - Hora: ' + FormatDateTime('hh:mm',AObj.Model.CDSCadastroCha_HoraAbertura.AsDateTime) +
    ' - Usuário Abertura: ' + AObj.Model.CDSCadastroUsu_Nome.AsString);

  FormatarLinha(mmoObs,COR_ABERTURA, 'Cliente: ' + AObj.Model.CDSCadastroCli_Nome.AsString);
  FormatarLinha(mmoObs,COR_ABERTURA, 'Contato: ' + AObj.Model.CDSCadastroCha_Contato.AsString);
  FormatarLinha(mmoObs,COR_ABERTURA, 'Nivel: ' + sNivel);
  FormatarLinha(mmoObs,COR_ABERTURA, 'Módulo: ' + AObj.Model.CDSCadastroMod_Nome.AsString);
  FormatarLinha(mmoObs,COR_ABERTURA, 'Produto: ' + AObj.Model.CDSCadastroProd_Nome.AsString);
  FormatarLinha(mmoObs,COR_ABERTURA, 'Tipo: ' + AObj.Model.CDSCadastroTip_Nome.AsString);
  FormatarLinha(mmoObs,COR_ABERTURA, 'Status: ' + AObj.Model.CDSCadastroSta_Nome.AsString);
  FormatarLinha(mmoObs,COR_ABERTURA, 'Revenda: ' + sRevenda);
  FormatarLinha(mmoObs,COR_ABERTURA, 'Consultor: ' + sConsultor);
  FormatarLinha(mmoObs,COR_ABERTURA, 'Descrição: ' + AObj.Model.CDSCadastroCha_Descricao.AsString);

  FStatus := AObj.Model.CDSCadastroSta_Nome.AsString;
end;

procedure TfrmChamadoDetalhes.PreencherDados;
var
  Obj: TChamadoController;
  PermissaoAbertura: Boolean;
  PermissaoOcorrencia: Boolean;
  PermissaoStatus: Boolean;
begin
  cdsDados.CreateDataSet;
  cdsDados.IndexFieldNames := 'Tipo;Data';

  Obj := TChamadoController.Create;
  try
    if FTipoMovimento = caChamado then
    begin
      PermissaoAbertura := Obj.PermissaoChamadoAbertura(dm.IdUsuario);
      PermissaoOcorrencia := Obj.PermissaoChamadoOcorrencia(dm.IdUsuario);
      PermissaoStatus := Obj.PermissaoChamadoStatus(dm.IdUsuario);
    end
    else begin
      PermissaoAbertura := Obj.PermissaoAtividadeAbertura(dm.IdUsuario);
      PermissaoOcorrencia := Obj.PermissaoAtividadeOcorrencia(dm.IdUsuario);
      PermissaoStatus := Obj.PermissaoAtividadeStatus(dm.IdUsuario);
    end;

    ctpAbertura.Visible := PermissaoAbertura;

    if (PermissaoOcorrencia = False) and (PermissaoStatus = False) then
      ctpOcorrencias.Visible := False;

    Obj.Editar(FIdChamado, Self, FTipoMovimento);

    PreecherAbertura(Obj);

    if PermissaoOcorrencia then
      PreecherOcorrencia(Obj);

    if PermissaoStatus then
      PreencherStatus(obj);

    ListarOcorrenciaStatus(obj);

  finally
    FreeAndNil(Obj);
  end;
end;

procedure TfrmChamadoDetalhes.PreencherStatus(AObjChamado: TChamadoController);
begin
  while not AObjChamado.Model.CDSChamadoStatus.Eof do
  begin
    cdsDados.Append;
    cdsDadosTipo.AsInteger      := 2;
    cdsDadosData.AsDateTime     := AObjChamado.Model.CDSChamadoStatusChSta_Data.AsDateTime;
    cdsDadosHoraInicial.AsString:= AObjChamado.Model.CDSChamadoStatusChSta_Hora.AsString;
    cdsDadosNomeStatus.AsString := AObjChamado.Model.CDSChamadoStatusSta_Nome.AsString;
    cdsDadosUsuario.AsString    := AObjChamado.Model.CDSChamadoStatusUsu_Nome.AsString;
    cdsDados.Post;
    AObjChamado.Model.CDSChamadoStatus.Next;
  end;
end;

end.
