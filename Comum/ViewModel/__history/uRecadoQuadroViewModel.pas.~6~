unit uRecadoQuadroViewModel;

interface

uses
  System.SysUtils, System.Generics.Collections;

type
  TRecadoQuadroViewModel = class
  private
    FHora: TTime;
    FUsuarioLcto: string;
    FRec_UsuarioLcto: Integer;
    FTipoLan: string;
    FId: Integer;
    FRazaoSocial: string;
    FNivel: Integer;
    FUsuarioDestino: string;
    FRec_UsuarioDestino: Integer;
    FTelefone: string;
    FData: TDate;
    procedure SetData(const Value: TDate);
    procedure SetHora(const Value: TTime);
    procedure SetId(const Value: Integer);
    procedure SetNivel(const Value: Integer);
    procedure SetRazaoSocial(const Value: string);
    procedure SetRec_UsuarioDestino(const Value: Integer);
    procedure SetRec_UsuarioLcto(const Value: Integer);
    procedure SetTelefone(const Value: string);
    procedure SetTipoLan(const Value: string);
    procedure SetUsuarioDestino(const Value: string);
    procedure SetUsuarioLcto(const Value: string);
  public
    property TipoLan: string read FTipoLan write SetTipoLan;
    property Id: Integer read FId write SetId;
    property Data: TDate read FData write SetData;
    property Nivel: Integer read FNivel write SetNivel;
    property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
    property Telefone: string read FTelefone write SetTelefone;
    property Hora: TTime read FHora write SetHora;
    property UsuarioLcto: string read FUsuarioLcto write SetUsuarioLcto;
    property UsuarioDestino: string read FUsuarioDestino write SetUsuarioDestino;
    property Rec_UsuarioLcto: Integer read FRec_UsuarioLcto write SetRec_UsuarioLcto;
    property Rec_UsuarioDestino: Integer read FRec_UsuarioDestino write SetRec_UsuarioDestino;
  end;

  TListaRecadoQuadroViewModel = TObjectList<TRecadoQuadroViewModel>;

implementation

{ TRecadoQuadroViewModel }

procedure TRecadoQuadroViewModel.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TRecadoQuadroViewModel.SetHora(const Value: TTime);
begin
  FHora := Value;
end;

procedure TRecadoQuadroViewModel.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TRecadoQuadroViewModel.SetNivel(const Value: Integer);
begin
  FNivel := Value;
end;

procedure TRecadoQuadroViewModel.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TRecadoQuadroViewModel.SetRec_UsuarioDestino(const Value: Integer);
begin
  FRec_UsuarioDestino := Value;
end;

procedure TRecadoQuadroViewModel.SetRec_UsuarioLcto(const Value: Integer);
begin
  FRec_UsuarioLcto := Value;
end;

procedure TRecadoQuadroViewModel.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TRecadoQuadroViewModel.SetTipoLan(const Value: string);
begin
  FTipoLan := Value;
end;

procedure TRecadoQuadroViewModel.SetUsuarioDestino(const Value: string);
begin
  FUsuarioDestino := Value;
end;

procedure TRecadoQuadroViewModel.SetUsuarioLcto(const Value: string);
begin
  FUsuarioLcto := Value;
end;

end.
