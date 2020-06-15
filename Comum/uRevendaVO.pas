unit uRevendaVO;

interface

type
  TRevendaVO = class
  private
    FAtivo: Boolean;
    FCodigo: Integer;
    FId: Integer;
    FIdStr: string;
    FNome: string;
  public
    property Ativo: Boolean read FAtivo write FAtivo;
    property Codigo: Integer read FCodigo write FCodigo;
    property Id: Integer read FId write FId;
    property IdStr: string read FIdStr write FIdStr;
    property Nome: string read FNome write FNome;

  end;

implementation

end.
