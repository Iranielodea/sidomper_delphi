unit uObservacaoVO;

interface

uses
  System.SysUtils, uTableName, uKeyField;

type
  [TableName('Observacao')]
  TObservacaoVO = class
  private
    FAtivo: Boolean;
    FCodigo: Integer;
    FId: Integer;
    FNome: string;
    FDescricao: string;
    FPrograma: Integer;
    FPadrao: Boolean;
    FObsEmail: string;
    FEmailPadrao: Boolean;
    procedure SetAtivo(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetPadrao(const Value: Boolean);
    procedure SetPrograma(const Value: Integer);
    procedure SetEmailPadrao(const Value: Boolean);
    procedure SetObsEmail(const Value: string);
  public
    [KeyField('Obs_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('Obs_Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('Obs_Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('Obs_Ativo')]
    property Ativo: Boolean read FAtivo write SetAtivo;
    [FieldName('Obs_Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldName('Obs_Padrao')]
    property Padrao: Boolean read FPadrao write SetPadrao;
    [FieldName('Obs_Programa')]
    property Programa: Integer read FPrograma write SetPrograma;
    [FieldName('Obs_EmailPadrao')]
    property EmailPadrao: Boolean read FEmailPadrao write SetEmailPadrao;
    [FieldName('Obs_ObsEmail')]
    property ObsEmail: string read FObsEmail write SetObsEmail;
  end;

implementation

{ TObservacaoVO }

procedure TObservacaoVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TObservacaoVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TObservacaoVO.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TObservacaoVO.SetEmailPadrao(const Value: Boolean);
begin
  FEmailPadrao := Value;
end;

procedure TObservacaoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TObservacaoVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TObservacaoVO.SetObsEmail(const Value: string);
begin
  FObsEmail := Value;
end;

procedure TObservacaoVO.SetPadrao(const Value: Boolean);
begin
  FPadrao := Value;
end;

procedure TObservacaoVO.SetPrograma(const Value: Integer);
begin
  FPrograma := Value;
end;

end.
