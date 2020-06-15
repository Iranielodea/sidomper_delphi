unit uPlanoBackupVO;

interface

uses
  System.Generics.Collections;

type
  TPlanoBackupItensVO = class
  private
    FHora: TTime;
    FId: Integer;
    FStatus: Boolean;
    FPlanoBackup: Integer;
    procedure SetHora(const Value: TTime);
    procedure SetId(const Value: Integer);
    procedure SetPlanoBackup(const Value: Integer);
    procedure SetStatus(const Value: Boolean);
  public
    property Id: Integer read FId write SetId;
    property PlanoBackup: Integer read FPlanoBackup write SetPlanoBackup;
    property Hora: TTime read FHora write SetHora;
    property Status: Boolean read FStatus write SetStatus;
  end;

  TPlanoBackupVO = class
  private
    FQuarta: Boolean;
    FSabado: Boolean;
    FQuinta: Boolean;
    FAtivo: Boolean;
    FSegunda: Boolean;
    FDomingo: Boolean;
    FId: Integer;
    FTerca: Boolean;
    FDestino: string;
    FDataUltimoBackup: TDate;
    FSexta: Boolean;
    procedure SetAtivo(const Value: Boolean);
    procedure SetDataUltimoBackup(const Value: TDate);
    procedure SetDestino(const Value: string);
    procedure SetDomingo(const Value: Boolean);
    procedure SetId(const Value: Integer);
    procedure SetQuarta(const Value: Boolean);
    procedure SetQuinta(const Value: Boolean);
    procedure SetSabado(const Value: Boolean);
    procedure SetSegunda(const Value: Boolean);
    procedure SetSexta(const Value: Boolean);
    procedure SetTerca(const Value: Boolean);
  public
    property Id: Integer read FId write SetId;
    property Destino: string read FDestino write SetDestino;
    property Domingo: Boolean read FDomingo write SetDomingo;
    property Segunda: Boolean read FSegunda write SetSegunda;
    property Terca: Boolean read FTerca write SetTerca;
    property Quarta: Boolean read FQuarta write SetQuarta;
    property Quinta: Boolean read FQuinta write SetQuinta;
    property Sexta: Boolean read FSexta write SetSexta;
    property Sabado: Boolean read FSabado write SetSabado;
    property Ativo: Boolean read FAtivo write SetAtivo;
    property DataUltimoBackup: TDate read FDataUltimoBackup write SetDataUltimoBackup;
  end;

  TListaHoras = TObjectList<TPlanoBackupItensVO>;

implementation

{ TPlanoBackupVO }

procedure TPlanoBackupVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TPlanoBackupVO.SetDataUltimoBackup(const Value: TDate);
begin
  FDataUltimoBackup := Value;
end;

procedure TPlanoBackupVO.SetDestino(const Value: string);
begin
  FDestino := Value;
end;

procedure TPlanoBackupVO.SetDomingo(const Value: Boolean);
begin
  FDomingo := Value;
end;

procedure TPlanoBackupVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPlanoBackupVO.SetQuarta(const Value: Boolean);
begin
  FQuarta := Value;
end;

procedure TPlanoBackupVO.SetQuinta(const Value: Boolean);
begin
  FQuinta := Value;
end;

procedure TPlanoBackupVO.SetSabado(const Value: Boolean);
begin
  FSabado := Value;
end;

procedure TPlanoBackupVO.SetSegunda(const Value: Boolean);
begin
  FSegunda := Value;
end;

procedure TPlanoBackupVO.SetSexta(const Value: Boolean);
begin
  FSexta := Value;
end;

procedure TPlanoBackupVO.SetTerca(const Value: Boolean);
begin
  FTerca := Value;
end;

{ TPlanoBackupItensVO }

procedure TPlanoBackupItensVO.SetHora(const Value: TTime);
begin
  FHora := Value;
end;

procedure TPlanoBackupItensVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TPlanoBackupItensVO.SetPlanoBackup(const Value: Integer);
begin
  FPlanoBackup := Value;
end;

procedure TPlanoBackupItensVO.SetStatus(const Value: Boolean);
begin
  FStatus := Value;
end;

end.
