unit uFiltroOrcamento;

interface

uses
  uFiltroProspect, System.SysUtils, uFiltroUsuario, uFiltroCliente;

type
  TFiltroOrcamento = class
  private
    FProspect: TFiltroProspect;
    FUsuario: TFiltroUsuario;
    FData: string;
    FDataFinal: string;
    FDataInicial: string;
    FCliente: TFiltroCliente;
    FSituacao: string;
    FIdTipo: string;
    FSubTipo: Integer;
    FEmailEnviado: string;
    FDataSituacaoFinal: string;
    FDataSituacaoInicial: string;
    FId: Integer;
    FNumero: Integer;
    procedure SetProspect(const Value: TFiltroProspect);
    procedure SetUsuario(const Value: TFiltroUsuario);
    procedure SetDataFinal(const Value: string);
    procedure SetDataInicial(const Value: string);
    procedure SetCliente(const Value: TFiltroCliente);
    procedure SetSituacao(const Value: string);
    procedure SetIdTipo(const Value: string);
    procedure SetSubTipo(const Value: Integer);
    procedure SetEmailEnviado(const Value: string);
    procedure SetDataSituacaoFinal(const Value: string);
    procedure SetDataSituacaoInicial(const Value: string);
    procedure SetNumero(const Value: Integer);
  public
    property DataInicial: string read FDataInicial write SetDataInicial;
    property DataFinal: string read FDataFinal write SetDataFinal;
    property Usuario: TFiltroUsuario read FUsuario write SetUsuario;
    property Prospect: TFiltroProspect read FProspect write SetProspect;
    property Cliente: TFiltroCliente read FCliente write SetCliente;
    property Situacao: string read FSituacao write SetSituacao;
    property IdTipo: string read FIdTipo write SetIdTipo;
    property SubTipo: Integer read FSubTipo write SetSubTipo;
    property EmailEnviado: string read FEmailEnviado write SetEmailEnviado;
    property DataSituacaoInicial: string read FDataSituacaoInicial write SetDataSituacaoInicial;
    property DataSituacaoFinal: string read FDataSituacaoFinal write SetDataSituacaoFinal;
    property Id: Integer read FId write FId;
    property Numero: Integer read FNumero write SetNumero;

    constructor Create;
    destructor Destroy; override;
  end;

implementation

{ TFiltroOrcamento }

constructor TFiltroOrcamento.Create;
begin
  inherited Create;
  FUsuario := TFiltroUsuario.Create;
  FProspect := TFiltroProspect.Create;
  FCliente := TFiltroCliente.Create;
end;

destructor TFiltroOrcamento.Destroy;
begin
  FreeAndNil(FUsuario);
  FreeAndNil(FProspect);
  FreeAndNil(FCliente);
  inherited;
end;

procedure TFiltroOrcamento.SetCliente(const Value: TFiltroCliente);
begin
  FCliente := Value;
end;

procedure TFiltroOrcamento.SetDataFinal(const Value: string);
begin
  FDataFinal := Value;
end;

procedure TFiltroOrcamento.SetDataInicial(const Value: string);
begin
  FDataInicial := Value;
end;

procedure TFiltroOrcamento.SetDataSituacaoFinal(const Value: string);
begin
  FDataSituacaoFinal := Value;
end;

procedure TFiltroOrcamento.SetDataSituacaoInicial(const Value: string);
begin
  FDataSituacaoInicial := Value;
end;

procedure TFiltroOrcamento.SetEmailEnviado(const Value: string);
begin
  FEmailEnviado := Value;
end;

procedure TFiltroOrcamento.SetIdTipo(const Value: string);
begin
  FIdTipo := Value;
end;

procedure TFiltroOrcamento.SetNumero(const Value: Integer);
begin
  FNumero := Value;
end;

procedure TFiltroOrcamento.SetProspect(const Value: TFiltroProspect);
begin
  FProspect := Value;
end;

procedure TFiltroOrcamento.SetSituacao(const Value: string);
begin
  FSituacao := Value;
end;

procedure TFiltroOrcamento.SetSubTipo(const Value: Integer);
begin
  FSubTipo := Value;
end;

procedure TFiltroOrcamento.SetUsuario(const Value: TFiltroUsuario);
begin
  FUsuario := Value;
end;

end.
