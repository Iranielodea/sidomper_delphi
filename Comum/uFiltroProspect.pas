unit uFiltroProspect;

interface

uses
  System.SysUtils;

type
  TFiltroProspect = class
  private
    FIdUsuario: string;
    FId: string;
    FIdRevenda: string;
    FEnquadramento: string;
  public
    property IdUsuario: string read FIdUsuario write FIdUsuario;
    property IdRevenda: string read FIdRevenda write FIdRevenda;
    property Id: string read FId write FId;
    property Enquadramento: string read FEnquadramento write FEnquadramento;
  end;

implementation

end.
