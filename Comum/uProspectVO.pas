unit uProspectVO;

interface

type
  TProspectVO = class
  private
    FFantasia: string;
    FAtivo: Boolean;
    FIdUsuario: Integer;
    FCodigo: Integer;
    FId: Integer;
    FIdRevenda: Integer;
    FContato: string;
    FEnquadramento: string;
    FDocto: string;
    FNome: string;
    FEndereco: string;
    FTelefone: string;
    procedure SetAtivo(const Value: Boolean);
    procedure SetCodigo(const Value: Integer);
    procedure SetContato(const Value: string);
    procedure SetDocto(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetEnquadramento(const Value: string);
    procedure SetFantasia(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetIdRevenda(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetTelefone(const Value: string);
  public
    property Id: Integer read FId write SetId;
    property Nome: string read FNome write SetNome;
    property Fantasia: string read FFantasia write SetFantasia;
    property Docto: string read FDocto write SetDocto;
    property Enquadramento: string read FEnquadramento write SetEnquadramento;
    property Endereco: string read FEndereco write SetEndereco;
    property Telefone: string read FTelefone write SetTelefone;
    property Contato: string read FContato write SetContato;
    property IdUsuario: Integer read FIdUsuario write SetIdUsuario;
    property IdRevenda: Integer read FIdRevenda write SetIdRevenda;
    property Ativo: Boolean read FAtivo write SetAtivo;
    property Codigo: Integer read FCodigo write SetCodigo;
  end;

implementation

{ TProspectVO }

procedure TProspectVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TProspectVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TProspectVO.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TProspectVO.SetDocto(const Value: string);
begin
  FDocto := Value;
end;

procedure TProspectVO.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TProspectVO.SetEnquadramento(const Value: string);
begin
  FEnquadramento := Value;
end;

procedure TProspectVO.SetFantasia(const Value: string);
begin
  FFantasia := Value;
end;

procedure TProspectVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProspectVO.SetIdRevenda(const Value: Integer);
begin
  FIdRevenda := Value;
end;

procedure TProspectVO.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TProspectVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TProspectVO.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

end.
