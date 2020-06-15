unit uClienteVO;

interface

uses
  System.SysUtils, uRevendaVO, uUsuarioVO;

type
  TClienteVO = class
  private
    FBairro: string;
    FCEP: String;
    FCidade: string;
    FCNPJ: string;
    FCodigo: Integer;
    FContatoFinanceiro: string;
    FContatoCompraVenda: string;
    FEnquadramento: string;
    FNomeFantasia: string;
    FPendenciaFinanceira: string;
    FRazaoSocial: string;
    FRevenda: Integer;
    FRua: string;
    FSituacao: string;
    FTelefone: string;
    FUsuario: Integer;
    FVersao: string;
    FRevendaVO: TRevendaVO;
    FAtivo: Boolean;
    FRestricao: Boolean;
    FId: Integer;
    FUsuarioVO: TUsuarioVO;
    FEndereco: string;
    procedure SetAtivo(const Value: Boolean);
    procedure SetEndereco(const Value: string);
    procedure SetId(const Value: Integer);
    procedure SetRestricao(const Value: Boolean);
    procedure SetRevendaVO(const Value: TRevendaVO);
    procedure SetUsuarioVO(const Value: TUsuarioVO);
    procedure SetVersao(const Value: string);
  public
    property Id: Integer read FId write SetId;
    property Endereco: string read FEndereco write SetEndereco;
    property RevendaVO: TRevendaVO read FRevendaVO write SetRevendaVO;
    property Ativo: Boolean read FAtivo write SetAtivo;
    property Restricao: Boolean read FRestricao write SetRestricao;
    property UsuarioVO: TUsuarioVO read FUsuarioVO write SetUsuarioVO;
    property Versao: string read FVersao write SetVersao;
    property Bairro: string read FBairro write FBairro;
    property CEP: String read FCEP write FCEP;
    property Cidade: string read FCidade write FCidade;
    property CNPJ: string read FCNPJ write FCNPJ;
    property Codigo: Integer read FCodigo write FCodigo;
    property ContatoFinanceiro: string read FContatoFinanceiro write FContatoFinanceiro;
    property ContatoCompraVenda: string read FContatoCompraVenda write
        FContatoCompraVenda;
    property Enquadramento: string read FEnquadramento write FEnquadramento;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property PendenciaFinanceira: string read FPendenciaFinanceira write
        FPendenciaFinanceira;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property Revenda: Integer read FRevenda write FRevenda;
    property Rua: string read FRua write FRua;
    property Situacao: string read FSituacao write FSituacao;
    property Telefone: string read FTelefone write FTelefone;
    property Usuario: Integer read FUsuario write FUsuario;

    constructor create;
    destructor destroy; override;
  end;

  TEmailVO = class
  private
    FEmail: string;
  public
    property Email: string read FEmail write FEmail;
  end;

  TModuloVO = class
  private
    FCodigoModulo: Integer;
    FCodigoProduto: integer;
    FNomeModulo: string;
    FNomeProduto: string;

  public
    property CodigoModulo: Integer read FCodigoModulo write FCodigoModulo;
    property CodigoProduto: integer read FCodigoProduto write FCodigoProduto;
    property NomeModulo: string read FNomeModulo write FNomeModulo;
    property NomeProduto: string read FNomeProduto write FNomeProduto;
  end;

implementation

{ TClienteVO }

constructor TClienteVO.create;
begin
  FRevendaVO := TRevendaVO.Create;
  FUsuarioVO := TUsuarioVO.Create;
end;

destructor TClienteVO.destroy;
begin
  FreeAndNil(FRevendaVO);
  FreeAndNil(FUsuarioVO);
  inherited;
end;

procedure TClienteVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TClienteVO.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TClienteVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TClienteVO.SetRestricao(const Value: Boolean);
begin
  FRestricao := Value;
end;

procedure TClienteVO.SetRevendaVO(const Value: TRevendaVO);
begin
  FRevendaVO := Value;
end;

procedure TClienteVO.SetUsuarioVO(const Value: TUsuarioVO);
begin
  FUsuarioVO := Value;
end;

procedure TClienteVO.SetVersao(const Value: string);
begin
  FVersao := Value;
end;

end.
