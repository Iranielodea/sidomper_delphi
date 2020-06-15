unit uUsuarioPermissaoVO;

interface

uses
  System.SysUtils, uKeyField, uTableName, System.Generics.Collections;

type
  [TableName('Usuario_Permissao')]
  TUsuarioPermissaoVO = class
  private
    FIdUsuario: Integer;
    FId: Integer;
    FSigla: string;
    procedure SetId(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetSigla(const Value: string);
  public
    [KeyField('UsuP_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('UsuP_Usuario')]
    property IdUsuario: Integer read FIdUsuario write SetIdUsuario;
    [FieldName('UsuP_Sigla')]
    property Sigla: string read FSigla write SetSigla;
  end;

  TListaUsuarioPermissao = TObjectList<TUsuarioPermissaoVO>;

implementation

{ TUsuarioPermissaoVO }

procedure TUsuarioPermissaoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TUsuarioPermissaoVO.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TUsuarioPermissaoVO.SetSigla(const Value: string);
begin
  FSigla := Value;
end;

end.
