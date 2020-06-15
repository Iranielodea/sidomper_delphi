unit uSolicitacaoViewModel;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TSolicitacaoViewModel = class
  private
    FTitulo: string;
    FTempoAberto: Boolean;
    FNomeCliente: string;
    FNomeStatus: string;
    FId: Integer;
    FNivel: string;
    FIdUsuarioAtendeAtual: Integer;
    FIdStatus: Integer;
    FTempoPrevisto: Currency;
    FTempoDecorrido: string;
    FQuadro: string;
    FAberta: Integer;
    FUsuarioNome: string;
    FPerfil: string;
    procedure SetId(const Value: Integer);
    procedure SetNivel(const Value: string);
    procedure SetNomeCliente(const Value: string);
    procedure SetNomeStatus(const Value: string);
    procedure SetTempoAberto(const Value: Boolean);
    procedure SetTitulo(const Value: string);
    procedure SetIdUsuarioAtendeAtual(const Value: Integer);
    procedure SetIdStatus(const Value: Integer);
    procedure SetTempoPrevisto(const Value: Currency);
    procedure SetTempoDecorrido(const Value: string);
    procedure SetQuadro(const Value: string);
    procedure SetAberta(const Value: Integer);
    procedure SetUsuarioNome(const Value: string);
    procedure SetPerfil(const Value: string);
  public
    property Quadro: string read FQuadro write SetQuadro;
    property Id: Integer read FId write SetId;
    property NomeCliente: string read FNomeCliente write SetNomeCliente;
    property Titulo: string read FTitulo write SetTitulo;
    property Nivel: string read FNivel write SetNivel;
    property NomeStatus: string read FNomeStatus write SetNomeStatus;
    property TempoAberto: Boolean read FTempoAberto write SetTempoAberto;
    property IdUsuarioAtendeAtual: Integer read FIdUsuarioAtendeAtual write SetIdUsuarioAtendeAtual;
    property IdStatus: Integer read FIdStatus write SetIdStatus;
    property TempoPrevisto: Currency read FTempoPrevisto write SetTempoPrevisto;
    property TempoDecorrido: string read FTempoDecorrido write SetTempoDecorrido;
    property UsuarioNome: string read FUsuarioNome write SetUsuarioNome;
    property Aberta: Integer read FAberta write SetAberta;
    property Perfil: string read FPerfil write SetPerfil;
  end;

  TListaSolicitacaoViewModel = TObjectList<TSolicitacaoViewModel>;

implementation

{ TSolicitacaoViewModel }

procedure TSolicitacaoViewModel.SetAberta(const Value: Integer);
begin
  FAberta := Value;
end;

procedure TSolicitacaoViewModel.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TSolicitacaoViewModel.SetIdStatus(const Value: Integer);
begin
  FIdStatus := Value;
end;

procedure TSolicitacaoViewModel.SetIdUsuarioAtendeAtual(const Value: Integer);
begin
  FIdUsuarioAtendeAtual := Value;
end;

procedure TSolicitacaoViewModel.SetNivel(const Value: string);
begin
  FNivel := Value;
end;

procedure TSolicitacaoViewModel.SetNomeCliente(const Value: string);
begin
  FNomeCliente := Value;
end;

procedure TSolicitacaoViewModel.SetNomeStatus(const Value: string);
begin
  FNomeStatus := Value;
end;

procedure TSolicitacaoViewModel.SetPerfil(const Value: string);
begin
  FPerfil := Value;
end;

procedure TSolicitacaoViewModel.SetQuadro(const Value: string);
begin
  FQuadro := Value;
end;

procedure TSolicitacaoViewModel.SetTempoAberto(const Value: Boolean);
begin
  FTempoAberto := Value;
end;

procedure TSolicitacaoViewModel.SetTempoDecorrido(const Value: string);
begin
  FTempoDecorrido := Value;
end;

procedure TSolicitacaoViewModel.SetTempoPrevisto(const Value: Currency);
begin
  FTempoPrevisto := Value;
end;

procedure TSolicitacaoViewModel.SetTitulo(const Value: string);
begin
  FTitulo := Value;
end;

procedure TSolicitacaoViewModel.SetUsuarioNome(const Value: string);
begin
  FUsuarioNome := Value;
end;

end.
