unit uFiltroLicenca;

interface

uses
  System.SysUtils, uFiltroCliente;

type
  TFiltroLicenca = class
  private
    FCliente: TFiltroCliente;
    FIdCliente: integer;
    FDataUtilizacaoInicial: string;
    FDataUtilizacaoFinal: string;
    FTipo: string;
    FUtilizadas: string;
    FSituacao: string;
    procedure SetSituacao(const Value: string);
    procedure SetUtilizadas(const Value: string);
  public
    property IdCliente: integer read FIdCliente write FIdCliente;
    property Cliente: TFiltroCliente read FCliente write FCliente;
    property DataUtilizacaoInicial: string read FDataUtilizacaoInicial write FDataUtilizacaoInicial;
    property DataUtilizacaoFinal: string read FDataUtilizacaoFinal write FDataUtilizacaoFinal;
    property Tipo: string read FTipo write FTipo;
    property Situacao: string read FSituacao write SetSituacao;
    property Utilizadas: string read FUtilizadas write SetUtilizadas;

    constructor Create(); overload;
    destructor destroy; override;
  end;
implementation

{ TFiltroLicenca }

constructor TFiltroLicenca.Create;
begin
  inherited Create;
  FCliente := TFiltroCliente.Create;
end;

destructor TFiltroLicenca.destroy;
begin
  FreeAndNil(FCliente);
  inherited;
end;

procedure TFiltroLicenca.SetSituacao(const Value: string);
begin
  FSituacao := Value;
end;

procedure TFiltroLicenca.SetUtilizadas(const Value: string);
begin
  FUtilizadas := Value;
end;

end.
