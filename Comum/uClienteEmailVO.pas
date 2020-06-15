unit uClienteEmailVO;

interface

uses
  System.SysUtils, uTableName, uKeyField;

type
  [TableName('Cliente_Email')]
  TClienteEmailVO = class
  private
    FEmail: string;
    FId: Integer;
    FIdCliente: Integer;
    FNotificar: Boolean;
    procedure SetEmail(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdCliente(const Value: Integer);
    procedure SetNotificar(const Value: Boolean);
  public
    [KeyField('CliEm_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('CliEm_Cliente')]
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    [FieldName('CliEm_Email')]
    property Email: string read FEmail write SetEmail;
    [FieldName('CliEm_Notificar')]
    property Notificar: Boolean read FNotificar write SetNotificar;
  end;

implementation

{ TClienteEmailVO }

procedure TClienteEmailVO.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TClienteEmailVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TClienteEmailVO.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TClienteEmailVO.SetNotificar(const Value: Boolean);
begin
  FNotificar := Value;
end;

end.
