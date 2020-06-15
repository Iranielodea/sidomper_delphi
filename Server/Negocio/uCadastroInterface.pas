unit uCadastroInterface;

interface
  uses System.SysUtils, System.Classes, FireDAC.Comp.Client;

type
  ICadastroInterface = interface
  ['{F5D013E3-84EE-4D5A-A11F-B960155C8BD4}']
    procedure Novo(Programa, IdUsuario: Integer);
    function Editar(Programa, IdUsuario: Integer): Boolean;
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Filtrar(Campo, Texto, Ativo: string; Contem: Boolean = True): string;
    function FiltrarCodigo(Codigo: integer): string;
    function LocalizarId(var Qry: TFDQuery; Id: integer): Boolean;
    procedure LocalizarCodigo(var Qry: TFDQuery; Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoCodigo: Integer;
    function ProximoId: Integer;
    procedure Relatorio(Programa, IdUsuario: Integer);
  end;

implementation

end.
