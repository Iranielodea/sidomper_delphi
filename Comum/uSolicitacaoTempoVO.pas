unit uSolicitacaoTempoVO;

interface

uses
  uKeyField, uTableName, System.SysUtils, System.Generics.Collections, uUsuarioVO,
  uSolicitacaoVO, uStatusVO, uClienteVO;

type
  [TableName('Solicitacao_Tempo')]
  TSolicitacaoTempoVO = class
  private
    FIdUsuario: Integer;
    FId: Integer;
    FHoraFim: TTime;
    FIdSolicitacao: Integer;
    FHoraInicio: TTime;
    FData: TDate;
    FTotalHoras: Double;
    FUsuario: TUsuarioVO;
    FSolicitacao: TSolicitacaoVO;
    FIdStatus: Integer;
    FStatus: TStatusVO;
    FCliente: TClienteVO;
    FPrograma: string;
    procedure SetData(const Value: TDate);
    procedure SetHoraFim(const Value: TTime);
    procedure SetHoraInicio(const Value: TTime);
    procedure SetId(const Value: Integer);
    procedure SetIdSolicitacao(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetTotalHoras(const Value: Double);
    procedure SetUsuario(const Value: TUsuarioVO);
    procedure SetSolicitacao(const Value: TSolicitacaoVO);
    procedure SetIdStatus(const Value: Integer);
    procedure SetStatus(const Value: TStatusVO);
    procedure SetCliente(const Value: TClienteVO);
    procedure SetPrograma(const Value: string);
  public
    [KeyField('STemp_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('STemp_Solicitacao')]
    property IdSolicitacao: Integer read FIdSolicitacao write SetIdSolicitacao;
    [FieldName('STemp_UsuarioOperacional')]
    property IdUsuario: Integer read FIdUsuario write SetIdUsuario;
    [FieldDate('STemp_Data')]
    property Data: TDate read FData write SetData;
    [FieldTime('STemp_HoraInicio')]
    property HoraInicio: TTime read FHoraInicio write SetHoraInicio;
    [FieldTime('STemp_HoraFim')]
    property HoraFim: TTime read FHoraFim write SetHoraFim;
    [FieldName('STemp_TotalHoras')]
    property TotalHoras: Double read FTotalHoras write SetTotalHoras;
    [FieldNull('STemp_Status')]
    property IdStatus: Integer read FIdStatus write SetIdStatus;

    property Usuario: TUsuarioVO read FUsuario write SetUsuario;
    property Solicitacao: TSolicitacaoVO read FSolicitacao write SetSolicitacao;
    property Status: TStatusVO read FStatus write SetStatus;
    property Cliente: TClienteVO read FCliente write SetCliente;
    property Programa: string read FPrograma write SetPrograma;
    constructor create;
    destructor destroy; override;
  end;

  TListaSolicitacaoTempo = TObjectList<TSolicitacaoTempoVO>;

implementation

{ TSolicitacaoTempoVO }

constructor TSolicitacaoTempoVO.create;
begin
  inherited create;
  FUsuario := TUsuarioVO.Create;
  FSolicitacao := TSolicitacaoVO.Create;
  FStatus := TStatusVO.Create;
  FCliente := TClienteVO.create;
end;

destructor TSolicitacaoTempoVO.destroy;
begin
  FreeAndNil(FUsuario);
  FreeAndNil(FSolicitacao);
  FreeAndNil(FStatus);
  FreeAndNil(FCliente);
  inherited;
end;

procedure TSolicitacaoTempoVO.SetCliente(const Value: TClienteVO);
begin
  FCliente := Value;
end;

procedure TSolicitacaoTempoVO.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TSolicitacaoTempoVO.SetHoraFim(const Value: TTime);
begin
  FHoraFim := Value;
end;

procedure TSolicitacaoTempoVO.SetHoraInicio(const Value: TTime);
begin
  FHoraInicio := Value;
end;

procedure TSolicitacaoTempoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TSolicitacaoTempoVO.SetIdSolicitacao(const Value: Integer);
begin
  FIdSolicitacao := Value;
end;

procedure TSolicitacaoTempoVO.SetIdStatus(const Value: Integer);
begin
  FIdStatus := Value;
end;

procedure TSolicitacaoTempoVO.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TSolicitacaoTempoVO.SetPrograma(const Value: string);
begin
  FPrograma := Value;
end;

procedure TSolicitacaoTempoVO.SetSolicitacao(const Value: TSolicitacaoVO);
begin
  FSolicitacao := Value;
end;

procedure TSolicitacaoTempoVO.SetStatus(const Value: TStatusVO);
begin
  FStatus := Value;
end;

procedure TSolicitacaoTempoVO.SetTotalHoras(const Value: Double);
begin
  FTotalHoras := Value;
end;

procedure TSolicitacaoTempoVO.SetUsuario(const Value: TUsuarioVO);
begin
  FUsuario := Value;
end;

end.
