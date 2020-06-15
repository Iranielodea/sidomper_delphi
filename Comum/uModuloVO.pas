unit uModuloVO;

interface

uses System.SysUtils, uKeyField, uTableName;

type
  [TableName('Modulo')]
  TModuloVO = class
  private
    FId: Integer;
    FCodigo: Integer;
    FNome: string;
    FAtivo: Boolean;
    FIdStr: string;
  public
    [KeyField('Mod_Id')]
    property Id: Integer read FId write FId;
    [FieldName('Mod_Codigo')]
    property Codigo: Integer read FCodigo write FCodigo;
    [FieldName('Mod_Nome')]
    property Nome: string read FNome write FNome;
    [FieldName('Mod_Ativo')]
    property Ativo: Boolean read FAtivo write FAtivo;

    property IdStr: string read FIdStr write FIdStr;
  end;

implementation

end.
