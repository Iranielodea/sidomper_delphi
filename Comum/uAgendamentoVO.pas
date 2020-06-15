unit uAgendamentoVO;

interface

uses
  System.SysUtils, System.Generics.Collections, uStatusVO, uUsuarioVO;

type
  TAgendamentoVO = class
  private
    FIdStatus: Integer;
    FHora: TDateTime;
    FIdAtividade: Integer;
    FMotivo: string;
    FDescricao: string;
    FIdUsuario: Integer;
    FIdTipo: Integer;
    FIdVisita: Integer;
    FId: Integer;
    FPrograma: Integer;
    FContato: string;
    FIdCliente: Integer;
    FData: TDate;
    FNomeCliente: string;
    FStatus: TStatusVO;
    FUsuario: TUsuarioVO;
    procedure SetContato(const Value: string);
    procedure SetData(const Value: TDate);
    procedure SetDescricao(const Value: string);
    procedure SetHora(const Value: TDateTime);
    procedure SetId(const Value: Integer);
    procedure SetIdAtividade(const Value: Integer);
    procedure SetIdCliente(const Value: Integer);
    procedure SetIdStatus(const Value: Integer);
    procedure SetIdTipo(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetIdVisita(const Value: Integer);
    procedure SetMotivo(const Value: string);
    procedure SetPrograma(const Value: Integer);
    procedure SetNomeCliente(const Value: string);
    procedure SetStatus(const Value: TStatusVO);
    procedure SetUsuario(const Value: TUsuarioVO);
  public
    property Id: Integer read FId write SetId;
    property Data: TDate read FData write SetData;
    property Hora: TDateTime read FHora write SetHora;
    property IdUsuario: Integer read FIdUsuario write SetIdUsuario;
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    property Contato: string read FContato write SetContato;
    property Programa: Integer read FPrograma write SetPrograma;
    property IdTipo: Integer read FIdTipo write SetIdTipo;
    property IdStatus: Integer read FIdStatus write SetIdStatus;
    property Descricao: string read FDescricao write SetDescricao;
    property Motivo: string read FMotivo write SetMotivo;
    property IdVisita: Integer read FIdVisita write SetIdVisita;
    property IdAtividade: Integer read FIdAtividade write SetIdAtividade;
    property NomeCliente: string read FNomeCliente write SetNomeCliente;
    property Usuario: TUsuarioVO read FUsuario write SetUsuario;
    property Status: TStatusVO read FStatus write SetStatus;

    constructor Create(); overload;
    destructor destroy; override;
  end;

  TListaAgendamentoVO = TObjectList<TAgendamentoVO>;

implementation

{ TAgenciamentoVO }

constructor TAgendamentoVO.Create;
begin
  inherited Create;
  FStatus := TStatusVO.Create;
  FUsuario := TUsuarioVO.Create;
end;

destructor TAgendamentoVO.destroy;
begin
  FreeAndNil(FStatus);
  FreeAndNil(FUsuario);
  inherited;
end;

procedure TAgendamentoVO.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TAgendamentoVO.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TAgendamentoVO.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TAgendamentoVO.SetHora(const Value: TDateTime);
begin
  FHora := Value;
end;

procedure TAgendamentoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TAgendamentoVO.SetIdAtividade(const Value: Integer);
begin
  FIdAtividade := Value;
end;

procedure TAgendamentoVO.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TAgendamentoVO.SetIdStatus(const Value: Integer);
begin
  FIdStatus := Value;
end;

procedure TAgendamentoVO.SetIdTipo(const Value: Integer);
begin
  FIdTipo := Value;
end;

procedure TAgendamentoVO.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TAgendamentoVO.SetIdVisita(const Value: Integer);
begin
  FIdVisita := Value;
end;

procedure TAgendamentoVO.SetMotivo(const Value: string);
begin
  FMotivo := Value;
end;

procedure TAgendamentoVO.SetNomeCliente(const Value: string);
begin
  FNomeCliente := Value;
end;

procedure TAgendamentoVO.SetPrograma(const Value: Integer);
begin
  FPrograma := Value;
end;

procedure TAgendamentoVO.SetStatus(const Value: TStatusVO);
begin
  FStatus := Value;
end;

procedure TAgendamentoVO.SetUsuario(const Value: TUsuarioVO);
begin
  FUsuario := Value;
end;

end.
