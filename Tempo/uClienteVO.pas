unit uClienteVO;

interface

uses
  System.SysUtils;

type
  TClienteVO = class
  private
    FCodigo: Integer;
    FId: Integer;
    FNome: string;
    FEmpresaVinculada: Integer;
    FLogradouro: string;
    FCNPJ: string;
    FBairro: string;
    FContatoCompraVendaFone: string;
    FContatoCompraVenda: string;
    FVersao: string;
    FFoneContatoFinanceiro: string;
    FContatoFinanceiroFone: string;
    FContatoFinanceiro: string;
    FRevenda: Integer;
    FAtivo: Boolean;
    FRestricao: Boolean;
    FIdCidade: Integer;
    FRepresentanteLegal: string;
    FCEP: String;
    FIE: string;
    FPendenciaFinanceira: string;
    FRazaoSocial: string;
    FSituacao: string;
    FFone2: string;
    FContato: string;
    FIdRevenda: Integer;
    FOutroTelefone: string;
    FEnquadramento: string;
    FFone1: string;
    FRepresentanteLegalCPF: string;
    FUsuario: Integer;
    FCidade: string;
    FEndereco: string;
    FTelefone: string;
    FNomeFantasia: string;
    FCelular: string;
    FRua: string;
    FLatitude: string;
    FLongitude: string;
    procedure SetCodigo(const Value: Integer);
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: string);
    procedure SetAtivo(const Value: Boolean);
    procedure SetCelular(const Value: string);
    procedure SetCEP(const Value: String);
    procedure SetContato(const Value: string);
    procedure SetContatoCompraVendaFone(const Value: string);
    procedure SetContatoFinanceiroFone(const Value: string);
    procedure SetEmpresaVinculada(const Value: Integer);
    procedure SetEndereco(const Value: string);
    procedure SetFone1(const Value: string);
    procedure SetFone2(const Value: string);
    procedure SetFoneContatoFinanceiro(const Value: string);
    procedure SetIdCidade(const Value: Integer);
    procedure SetIdRevenda(const Value: Integer);
    procedure SetIE(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetOutroTelefone(const Value: string);
    procedure SetRepresentanteLegal(const Value: string);
    procedure SetRepresentanteLegalCPF(const Value: string);
    procedure SetRestricao(const Value: Boolean);
    procedure SetVersao(const Value: string);
    procedure SetLatitude(const Value: string);
    procedure SetLongitude(const Value: string);

  public
    property Id: Integer read FId write SetId;
    property Ativo: Boolean read FAtivo write SetAtivo;
    property Restricao: Boolean read FRestricao write SetRestricao;
    property IdRevenda: Integer read FIdRevenda write SetIdRevenda;
    property Versao: string read FVersao write SetVersao;
    property Bairro: string read FBairro write FBairro;
    property CEP: String read FCEP write SetCEP;
    property IdCidade: Integer read FIdCidade write SetIdCidade;
    property CNPJ: string read FCNPJ write FCNPJ;
    property Codigo: Integer read FCodigo write FCodigo;
    property ContatoFinanceiro: string read FContatoFinanceiro write FContatoFinanceiro;
    property ContatoCompraVenda: string read FContatoCompraVenda write
        FContatoCompraVenda;
    property Enquadramento: string read FEnquadramento write FEnquadramento;
    property NomeFantasia: string read FNomeFantasia write FNomeFantasia;
    property RazaoSocial: string read FRazaoSocial write FRazaoSocial;
    property Rua: string read FRua write FRua;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Telefone: string read FTelefone write FTelefone;
    property Usuario: Integer read FUsuario write FUsuario;
    property Contato: string read FContato write SetContato;
    property Fone1: string read FFone1 write SetFone1;
    property Fone2: string read FFone2 write SetFone2;
    property Celular: string read FCelular write SetCelular;
    property OutroTelefone: string read FOutroTelefone write SetOutroTelefone;
    property ContatoFinanceiroFone: string read FContatoFinanceiroFone write SetContatoFinanceiroFone;
    property ContatoCompraVendaFone: string read FContatoCompraVendaFone write SetContatoCompraVendaFone;
    property IE: string read FIE write SetIE;
    property RepresentanteLegal: string read FRepresentanteLegal write SetRepresentanteLegal;
    property RepresentanteLegalCPF: string read FRepresentanteLegalCPF write SetRepresentanteLegalCPF;
    property EmpresaVinculada: Integer read FEmpresaVinculada write SetEmpresaVinculada;
    property Latitude: string read FLatitude write SetLatitude;
    property Longitude: string read FLongitude write SetLongitude;

    property Cidade: string read FCidade write FCidade;
    property Revenda: Integer read FRevenda write FRevenda;
    property Endereco: string read FEndereco write SetEndereco;
    property PendenciaFinanceira: string read FPendenciaFinanceira write
        FPendenciaFinanceira;
    property Situacao: string read FSituacao write FSituacao;

    property FoneContatoFinanceiro: string read FFoneContatoFinanceiro write SetFoneContatoFinanceiro;
//    property ClienteEmail: TObjectList<TClienteEmailVO> read FClienteEmail write SetClienteEmail;
//    property ClienteModulo: TObjectList<TClienteModuloVO> read FClienteModulo write SetClienteModulo;
//    property CidadeVO: TCidadeVO read FCidadeVO write SetCidadeVO;
//    property RevendaVO: TRevendaVO read FRevendaVO write SetRevendaVO;
//    property UsuarioVO: TUsuarioVO read FUsuarioVO write SetUsuarioVO;
//    property ListaContatoVO: TObjectList<TContatoVO> read FListaContatoVO write SetListaContatoVO;
  end;

implementation

{ TClienteVO }

procedure TClienteVO.SetAtivo(const Value: Boolean);
begin
  FAtivo := Value;
end;

procedure TClienteVO.SetCelular(const Value: string);
begin
  FCelular := Value;
end;

procedure TClienteVO.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TClienteVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TClienteVO.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TClienteVO.SetContatoCompraVendaFone(const Value: string);
begin
  FContatoCompraVendaFone := Value;
end;

procedure TClienteVO.SetContatoFinanceiroFone(const Value: string);
begin
  FContatoFinanceiroFone := Value;
end;

procedure TClienteVO.SetEmpresaVinculada(const Value: Integer);
begin
  FEmpresaVinculada := Value;
end;

procedure TClienteVO.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TClienteVO.SetFone1(const Value: string);
begin
  FFone1 := Value;
end;

procedure TClienteVO.SetFone2(const Value: string);
begin
  FFone2 := Value;
end;

procedure TClienteVO.SetFoneContatoFinanceiro(const Value: string);
begin
  FFoneContatoFinanceiro := Value;
end;

procedure TClienteVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TClienteVO.SetIdCidade(const Value: Integer);
begin
  FIdCidade := Value;
end;

procedure TClienteVO.SetIdRevenda(const Value: Integer);
begin
  FIdRevenda := Value;
end;

procedure TClienteVO.SetIE(const Value: string);
begin
  FIE := Value;
end;

procedure TClienteVO.SetLatitude(const Value: string);
begin
  FLatitude := Value;
end;

procedure TClienteVO.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TClienteVO.SetLongitude(const Value: string);
begin
  FLongitude := Value;
end;

procedure TClienteVO.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TClienteVO.SetOutroTelefone(const Value: string);
begin
  FOutroTelefone := Value;
end;

procedure TClienteVO.SetRepresentanteLegal(const Value: string);
begin
  FRepresentanteLegal := Value;
end;

procedure TClienteVO.SetRepresentanteLegalCPF(const Value: string);
begin
  FRepresentanteLegalCPF := Value;
end;

procedure TClienteVO.SetRestricao(const Value: Boolean);
begin
  FRestricao := Value;
end;

procedure TClienteVO.SetVersao(const Value: string);
begin
  FVersao := Value;
end;

end.
