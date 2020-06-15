unit uProdutoVO;

interface

uses System.SysUtils, uKeyField, uTableName;

type
  [TableName('Produto')]
  TProduto = class
  private
    FId: Integer;
    FCodigo: Integer;
    FNome: string;
    FAtivo: Boolean;
  public
    [KeyField('Prod_Id')]
    property Id: Integer read FId write FId;
    [FieldName('Prod_Codigo')]
    property Codigo: Integer read FCodigo write FCodigo;
    [FieldName('Prod_Nome')]
    property Nome: string read FNome write FNome;
    [FieldName('Prod_Ativo')]
    property Ativo: Boolean read FAtivo write FAtivo;
  end;

implementation

end.
