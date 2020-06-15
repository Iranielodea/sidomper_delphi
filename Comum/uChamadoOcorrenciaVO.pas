unit uChamadoOcorrenciaVO;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TChamadoOcorrenciaVO = class
  private
    FIdUsuarioColab2: Integer;
    FIdChamado: Integer;
    FIdUsuarioColab3: Integer;
    FVersao: string;
    FIdUsuarioColab1: Integer;
    FIdUsuario: Integer;
    FTotalHoras: Double;
    FId: Integer;
    FAnexo: string;
    FDescricaoTecnica: string;
    FHoraFim: TTime;
    FDocto: string;
    FHoraInicio: TTime;
    FData: TDate;
    FDescricaoSolucao: string;
    FQtde: Integer;
    FValor: Currency;
    procedure SetAnexo(const Value: string);
    procedure SetData(const Value: TDate);
    procedure SetDescricaoSolucao(const Value: string);
    procedure SetDescricaoTecnica(const Value: string);
    procedure SetDocto(const Value: string);
    procedure SetHoraFim(const Value: TTime);
    procedure SetHoraInicio(const Value: TTime);
    procedure SetId(const Value: Integer);
    procedure SetIdChamado(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetIdUsuarioColab1(const Value: Integer);
    procedure SetIdUsuarioColab2(const Value: Integer);
    procedure SetIdUsuarioColab3(const Value: Integer);
    procedure SetTotalHoras(const Value: Double);
    procedure SetVersao(const Value: string);
    procedure SetQtde(const Value: Integer);
    procedure SetValor(const Value: Currency);
  public
    property Id: Integer read FId write SetId;
    property IdChamado: Integer read FIdChamado write SetIdChamado;
    property Docto: string read FDocto write SetDocto;
    property Data: TDate read FData write SetData;
    property HoraInicio: TTime read FHoraInicio write SetHoraInicio;
    property HoraFim: TTime read FHoraFim write SetHoraFim;
    property IdUsuario: Integer read FIdUsuario write SetIdUsuario;
    property IdUsuarioColab1: Integer read FIdUsuarioColab1 write SetIdUsuarioColab1;
    property IdUsuarioColab2: Integer read FIdUsuarioColab2 write SetIdUsuarioColab2;
    property IdUsuarioColab3: Integer read FIdUsuarioColab3 write SetIdUsuarioColab3;
    property DescricaoTecnica: string read FDescricaoTecnica write SetDescricaoTecnica;
    property DescricaoSolucao: string read FDescricaoSolucao write SetDescricaoSolucao;
    property Anexo: string read FAnexo write SetAnexo;
    property TotalHoras: Double read FTotalHoras write SetTotalHoras;
    property Versao: string read FVersao write SetVersao;
    property Qtde: Integer read FQtde write SetQtde;
    property Valor: Currency read FValor write SetValor;
  end;

  TListaChamadoOcorrencia = TObjectList<TChamadoOcorrenciaVO>;

implementation

{ TChamadoOcorrenciaVO }

procedure TChamadoOcorrenciaVO.SetAnexo(const Value: string);
begin
  FAnexo := Value;
end;

procedure TChamadoOcorrenciaVO.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TChamadoOcorrenciaVO.SetDescricaoSolucao(const Value: string);
begin
  FDescricaoSolucao := Value;
end;

procedure TChamadoOcorrenciaVO.SetDescricaoTecnica(const Value: string);
begin
  FDescricaoTecnica := Value;
end;

procedure TChamadoOcorrenciaVO.SetDocto(const Value: string);
begin
  FDocto := Value;
end;

procedure TChamadoOcorrenciaVO.SetHoraFim(const Value: TTime);
begin
  FHoraFim := Value;
end;

procedure TChamadoOcorrenciaVO.SetHoraInicio(const Value: TTime);
begin
  FHoraInicio := Value;
end;

procedure TChamadoOcorrenciaVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TChamadoOcorrenciaVO.SetIdChamado(const Value: Integer);
begin
  FIdChamado := Value;
end;

procedure TChamadoOcorrenciaVO.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TChamadoOcorrenciaVO.SetIdUsuarioColab1(const Value: Integer);
begin
  FIdUsuarioColab1 := Value;
end;

procedure TChamadoOcorrenciaVO.SetIdUsuarioColab2(const Value: Integer);
begin
  FIdUsuarioColab2 := Value;
end;

procedure TChamadoOcorrenciaVO.SetIdUsuarioColab3(const Value: Integer);
begin
  FIdUsuarioColab3 := Value;
end;

procedure TChamadoOcorrenciaVO.SetQtde(const Value: Integer);
begin
  FQtde := Value;
end;

procedure TChamadoOcorrenciaVO.SetTotalHoras(const Value: Double);
begin
  FTotalHoras := Value;
end;

procedure TChamadoOcorrenciaVO.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

procedure TChamadoOcorrenciaVO.SetVersao(const Value: string);
begin
  FVersao := Value;
end;

end.
