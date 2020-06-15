unit uUsuarioVO;

interface

uses
  System.SysUtils, uContaEmailVO, System.Generics.Collections, uDepartamentoVO,
  uKeyField, uTableName;

type
  [TableName('Usuario')]
  TUsuarioVO = class
  private
    FEmail: string;
    FAtivo: Boolean;
    FCodigo: Integer;
    Fid: Integer;
    FPassword: string;
    FNome: string;
    FNotificar: Boolean;
    FUserName: string;
    FAdm: Boolean;
    FOnLine: Boolean;
    FContaEmail: TContaEmailVO;
    FDepartamento: TDepartamentoVO;
    FQtdeDias: Integer;
    FIdRevenda: Integer;
    FIdDepartamento: Integer;
    FIdContaEmail: Integer;
    FIdCliente: Integer;
    procedure SetAdm(const Value: Boolean);
    procedure SetAtivo(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetEmail(const Value: string);
    procedure Setid(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetNotificar(const Value: Boolean);
    procedure SetOnLine(const Value: Boolean);
    procedure SetPassword(const Value: string);
    procedure SetUserName(const Value: string);
    procedure SetContaEmail(const Value: TContaEmailVO);
    procedure SetDepartamento(const Value: TDepartamentoVO);
    procedure SetQtdeDias(const Value: Integer);
    procedure SetIdRevenda(const Value: Integer);
    procedure SetIdContaEmail(const Value: Integer);
    procedure SetIdDepartamento(const Value: Integer);
    procedure SetIdCliente(const Value: Integer);
  public
    [KeyField('Usu_Id')]
    property Id: Integer read Fid write Setid;
    [FieldName('Usu_Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('Usu_UserName')]
    property UserName: string read FUserName write SetUserName;
    [FieldName('Usu_Nome')]
    property Nome: string read FNome write SetNome;
    [FieldName('Usu_Password')]
    property Password: string read FPassword write SetPassword;
    [FieldName('Usu_Email')]
    property Email: string read FEmail write SetEmail;
    [FieldNull('Usu_Revenda')]
    property IdRevenda: Integer read FIdRevenda write SetIdRevenda;
    [FieldNull('Usu_Cliente')]
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    [FieldName('Usu_OnLine')]
    property OnLine: Boolean read FOnLine write SetOnLine;
    [FieldName('Usu_Adm')]
    property Adm: Boolean read FAdm write SetAdm;
    [FieldName('Usu_Ativo')]
    property Ativo: Boolean read FAtivo write SetAtivo;
    [FieldName('Usu_Notificar')]
    property Notificar: Boolean read FNotificar write SetNotificar;
    [FieldName('Usu_Departamento')]
    property IdDepartamento: Integer read FIdDepartamento write SetIdDepartamento;
    [FieldNull('Usu_ContaEmail')]
    property IdContaEmail: Integer read FIdContaEmail write SetIdContaEmail;

    property QtdeDias: Integer read FQtdeDias write SetQtdeDias;

    property ContaEmail: TContaEmailVO read FContaEmail write SetContaEmail;

    property Departamento: TDepartamentoVO read FDepartamento write SetDepartamento;

    constructor Create();
    destructor destroy; override;
  end;

  TListaUsuario = TObjectList<TUsuarioVO>;

implementation

{ TUsuarioVO }

constructor TUsuarioVO.Create;
begin
  inherited Create;
  FContaEmail := TContaEmailVO.Create;
  FDepartamento := TDepartamentoVO.Create;
end;

destructor TUsuarioVO.destroy;
begin
  FreeAndNil(FContaEmail);
  FreeAndNil(FDepartamento);
  inherited;
end;

procedure TUsuarioVO.SetAdm(const Value: Boolean);
begin
  FAdm := Value;
end;

procedure TUsuarioVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TUsuarioVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TUsuarioVO.SetContaEmail(const Value: TContaEmailVO);
begin
  FContaEmail := Value;
end;

procedure TUsuarioVO.SetDepartamento(const Value: TDepartamentoVO);
begin
  FDepartamento := Value;
end;

procedure TUsuarioVO.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TUsuarioVO.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TUsuarioVO.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TUsuarioVO.SetIdContaEmail(const Value: Integer);
begin
  FIdContaEmail := Value;
end;

procedure TUsuarioVO.SetIdDepartamento(const Value: Integer);
begin
  FIdDepartamento := Value;
end;

procedure TUsuarioVO.SetIdRevenda(const Value: Integer);
begin
  FIdRevenda := Value;
end;

procedure TUsuarioVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TUsuarioVO.SetNotificar(const Value: Boolean);
begin
  FNotificar := Value;
end;

procedure TUsuarioVO.SetOnLine(const Value: Boolean);
begin
  FOnLine := Value;
end;

procedure TUsuarioVO.SetPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TUsuarioVO.SetQtdeDias(const Value: Integer);
begin
  FQtdeDias := Value;
end;

procedure TUsuarioVO.SetUserName(const Value: string);
begin
  FUserName := Value;
end;

end.
