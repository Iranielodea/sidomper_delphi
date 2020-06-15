unit uFiltroCliente;

interface

uses
  System.SysUtils;

type
  TFiltroCliente = class
  private
    FRestricao: integer;
    FIdUsuario: string;
    FIdRevenda: string;
    FId: string;
    FIdModulo: string;
    FIdProduto: string;
    FEnquadramento: string;
    FIdCidade: string;
    FAtivo: string;
    FVersao: string;
    FsEmpresaVinculada: string;
    FPerfil: string;
  public
    property IdUsuario: string read FIdUsuario write FIdUsuario;
    property IdRevenda: string read FIdRevenda write FIdRevenda;
    property Restricao: integer read FRestricao write FRestricao;
    property Id: string read FId write FId;
    property IdModulo: string read FIdModulo write FIdModulo;
    property IdProduto: string read FIdProduto write FIdProduto;
    property Enquadramento: string read FEnquadramento write FEnquadramento;
    property IdCidade: string read FIdCidade write FIdCidade;
    property Ativo: string read FAtivo write FAtivo;
    property Versao: string read FVersao write FVersao;
    property sEmpresaVinculada: string read FsEmpresaVinculada write FsEmpresaVinculada;
    property Perfil: string read FPerfil write FPerfil;
  end;

implementation

end.
