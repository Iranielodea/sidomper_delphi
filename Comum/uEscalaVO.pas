unit uEscalaVO;

interface

uses
  System.SysUtils, uTableName, uKeyField;

type
  [TableName('Escala')]
  TEscalaVO = class
  private
    FIdUsuario: Integer;
    FTotalHoras: Currency;
    FId: Integer;
    FHoraFim: string;
    FData: string;
    FHoraInicio: string;
    procedure SetData(const Value: string);
    procedure SetHoraFim(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetTotalHoras(const Value: Currency);
    procedure SetHoraInicio(const Value: string);
  public
    [KeyField('Esc_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('Esc_Data')]
    property Data: string read FData write SetData;
    [FieldName('Esc_HoraInicio')]
    property HoraInicio: string read FHoraInicio write SetHoraInicio;
    [FieldName('Esc_HoraFim')]
    property HoraFim: string read FHoraFim write SetHoraFim;
    [FieldName('Esc_Usuario')]
    property IdUsuario: Integer read FIdUsuario write SetIdUsuario;
    [FieldName('Esc_TotalHoras')]
    property TotalHoras: Currency read FTotalHoras write SetTotalHoras;

  end;

  TEscalaFiltro = class
  private
    FIdUsuario: string;
    FId: Integer;
    FDataFinal: string;
    FDataInicial: string;
    procedure SetDataFinal(const Value: string);
    procedure SetDataInicial(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdUsuario(const Value: string);
  public
    property Id: Integer read FId write SetId;
    property IdUsuario: string read FIdUsuario write SetIdUsuario;
    property DataInicial: string read FDataInicial write SetDataInicial;
    property DataFinal: string read FDataFinal write SetDataFinal;
  end;

implementation

{ TEscalaVO }

procedure TEscalaVO.SetData(const Value: string);
begin
  FData := Value;
end;

procedure TEscalaVO.SetHoraFim(const Value: string);
begin
  FHoraFim := Value;
end;

procedure TEscalaVO.SetHoraInicio(const Value: string);
begin
  FHoraInicio := Value;
end;

procedure TEscalaVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TEscalaVO.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TEscalaVO.SetTotalHoras(const Value: Currency);
begin
  FTotalHoras := Value;
end;

{ TEscalaFiltro }

procedure TEscalaFiltro.SetDataFinal(const Value: string);
begin
  FDataFinal := Value;
end;

procedure TEscalaFiltro.SetDataInicial(const Value: string);
begin
  FDataInicial := Value;
end;

procedure TEscalaFiltro.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TEscalaFiltro.SetIdUsuario(const Value: string);
begin
  FIdUsuario := Value;
end;

end.
