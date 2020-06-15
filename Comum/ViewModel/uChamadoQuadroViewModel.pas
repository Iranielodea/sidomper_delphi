unit uChamadoQuadroViewModel;

interface

uses
  System.Classes, uClienteVO, uStatusVO, uTipoVo, uUsuarioVO, System.SysUtils,
  System.Generics.Collections;

type
  TChamadoQuadroViewModel = class
  private
    FIdChamado: Integer;
    FParCodigo: Integer;
    FQuadro: string;
    FCliente: TClienteVO;
    FHoraAtendeAtual: TTime;
    FUltimaData: TDate;
    FDataAbertura: TDateTime;
    FIdUsuarioAtendeAtual: Integer;
    FStatus: TStatusVO;
    FNivel: Integer;
    FHoraAbertura: TTime;
    FCha_Nivel: string;
    FUsuario: TUsuarioVO;
    FTipo: TTipoVO;
    FUltimaHora: TDateTime;
    procedure SetCha_Nivel(const Value: string);
    procedure SetCliente(const Value: TClienteVO);
    procedure SetDataAbertura(const Value: TDateTime);
    procedure SetHoraAbertura(const Value: TTime);
    procedure SetHoraAtendeAtual(const Value: TTime);
    procedure SetIdChamado(const Value: Integer);
    procedure SetIdUsuarioAtendeAtual(const Value: Integer);
    procedure SetNivel(const Value: Integer);
    procedure SetParCodigo(const Value: Integer);
    procedure SetQuadro(const Value: string);
    procedure SetStatus(const Value: TStatusVO);
    procedure SetTipo(const Value: TTipoVO);
    procedure SetUltimaData(const Value: TDate);
    procedure SetUsuario(const Value: TUsuarioVO);
    procedure SetUltimaHora(const Value: TDateTime);
  public
    property Quadro: string read FQuadro write SetQuadro;
    property IdChamado: Integer read FIdChamado write SetIdChamado;
    property DataAbertura: TDateTime read FDataAbertura write SetDataAbertura;
    property HoraAbertura: TTime read FHoraAbertura write SetHoraAbertura;
    property Nivel: Integer read FNivel write SetNivel;
    property Cha_Nivel: string read FCha_Nivel write SetCha_Nivel;
    property IdUsuarioAtendeAtual: Integer read FIdUsuarioAtendeAtual write SetIdUsuarioAtendeAtual;
    property UltimaData: TDate read FUltimaData write SetUltimaData;
    property HoraAtendeAtual: TTime read FHoraAtendeAtual write SetHoraAtendeAtual;
    property ParCodigo: Integer read FParCodigo write SetParCodigo;
    property UltimaHora: TDateTime read FUltimaHora write SetUltimaHora;
    property Cliente: TClienteVO read FCliente write SetCliente;
    property Status: TStatusVO read FStatus write SetStatus;
    property Tipo: TTipoVO read FTipo write SetTipo;
    property Usuario: TUsuarioVO read FUsuario write SetUsuario;

    constructor Create(); overload;
    destructor destroy; override;

  end;

  TListaChamadoQuadroViewModel = TObjectList<TChamadoQuadroViewModel>;

implementation

{ TChamadoQuadroViewModel }

constructor TChamadoQuadroViewModel.Create;
begin
  inherited Create;
  FCliente := TClienteVO.create;
  FStatus := TStatusVO.Create;
  FTipo := TTipoVO.Create;
  FUsuario := TUsuarioVO.Create;
end;

destructor TChamadoQuadroViewModel.destroy;
begin
  FreeAndNil(FCliente);
  FreeAndNil(FStatus);
  FreeAndNil(FTipo);
  FreeAndNil(FUsuario);
  inherited;
end;

procedure TChamadoQuadroViewModel.SetCha_Nivel(const Value: string);
begin
  FCha_Nivel := Value;
end;

procedure TChamadoQuadroViewModel.SetCliente(const Value: TClienteVO);
begin
  FCliente := Value;
end;

procedure TChamadoQuadroViewModel.SetDataAbertura(const Value: TDateTime);
begin
  FDataAbertura := Value;
end;

procedure TChamadoQuadroViewModel.SetHoraAbertura(const Value: TTime);
begin
  FHoraAbertura := Value;
end;

procedure TChamadoQuadroViewModel.SetHoraAtendeAtual(const Value: TTime);
begin
  FHoraAtendeAtual := Value;
end;

procedure TChamadoQuadroViewModel.SetIdChamado(const Value: Integer);
begin
  FIdChamado := Value;
end;

procedure TChamadoQuadroViewModel.SetIdUsuarioAtendeAtual(const Value: Integer);
begin
  FIdUsuarioAtendeAtual := Value;
end;

procedure TChamadoQuadroViewModel.SetNivel(const Value: Integer);
begin
  FNivel := Value;
end;

procedure TChamadoQuadroViewModel.SetParCodigo(const Value: Integer);
begin
  FParCodigo := Value;
end;

procedure TChamadoQuadroViewModel.SetQuadro(const Value: string);
begin
  FQuadro := Value;
end;

procedure TChamadoQuadroViewModel.SetStatus(const Value: TStatusVO);
begin
  FStatus := Value;
end;

procedure TChamadoQuadroViewModel.SetTipo(const Value: TTipoVO);
begin
  FTipo := Value;
end;

procedure TChamadoQuadroViewModel.SetUltimaData(const Value: TDate);
begin
  FUltimaData := Value;
end;

procedure TChamadoQuadroViewModel.SetUltimaHora(const Value: TDateTime);
begin
  FUltimaHora := Value;
end;

procedure TChamadoQuadroViewModel.SetUsuario(const Value: TUsuarioVO);
begin
  FUsuario := Value;
end;

end.
