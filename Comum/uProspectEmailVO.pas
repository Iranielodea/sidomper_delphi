unit uProspectEmailVO;

interface

uses
  System.Generics.Collections;

type
  TProspectEmailVO = class
  private
    FEmail: string;
    FIdProspect: Integer;
    FDescricao: string;
    FId: Integer;
    procedure SetDescricao(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdProspect(const Value: Integer);
  public
    property Id: Integer read FId write SetId;
    property IdProspect: Integer read FIdProspect write SetIdProspect;
    property Email: string read FEmail write SetEmail;
    property Descricao: string read FDescricao write SetDescricao;
  end;

  TListaProspectEmail = TObjectList<TProspectEmailVO>;

implementation

{ TProspectEmailVO }

procedure TProspectEmailVO.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProspectEmailVO.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TProspectEmailVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProspectEmailVO.SetIdProspect(const Value: Integer);
begin
  FIdProspect := Value;
end;

end.
