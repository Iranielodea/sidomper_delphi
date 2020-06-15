unit uRecadoVO;

interface

uses
  System.SysUtils, uKeyField, uTableName, uClienteVO, uUsuarioVO, uTipoVO,
  uStatusVO, System.Generics.Collections;

type
  [TableName('Recado')]
  TRecadoVO = class
  private
    FIdStatus: Integer;
    FIdUsuarioDestino: Integer;
    FFantasia: string;
    FHoraFinal: TTime;
    FHora: TTime;
    FDescricaoFinal: string;
    FDescricaoInicial: string;
    FIdTipo: Integer;
    FId: Integer;
    FRazaoSocial: string;
    FNivel: Integer;
    FContato: string;
    FIdUsuarioLcto: Integer;
    FIdCliente: Integer;
    FDataFinal: TDate;
    FEndereco: string;
    FTelefone: string;
    FData: TDate;
    FTipoRecado: Integer;
    FCliente: TClienteVO;
    FStatus: TStatusVO;
    FUsuarioDestino: TUsuarioVO;
    FUsuario: TUsuarioVO;
    FTipo: TTipoVO;
    FOperacao: string;
    procedure SetContato(const Value: string);
    procedure SetData(const Value: TDate);
    procedure SetDataFinal(const Value: TDate);
    procedure SetDescricaoFinal(const Value: string);
    procedure SetDescricaoInicial(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetFantasia(const Value: string);
    procedure SetHora(const Value: TTime);
    procedure SetHoraFinal(const Value: TTime);
    procedure SetId(const Value: Integer);
    procedure SetIdCliente(const Value: Integer);
    procedure SetIdStatus(const Value: Integer);
    procedure SetIdTipo(const Value: Integer);
    procedure SetIdUsuarioDestino(const Value: Integer);
    procedure SetIdUsuarioLcto(const Value: Integer);
    procedure SetNivel(const Value: Integer);
    procedure SetRazaoSocial(const Value: string);
    procedure SetTelefone(const Value: string);
    procedure SetCliente(const Value: TClienteVO);
    procedure SetStatus(const Value: TStatusVO);
    procedure SetTipo(const Value: TTipoVO);
    procedure SetTipoRecado(const Value: Integer);
    procedure SetUsuario(const Value: TUsuarioVO);
    procedure SetUsuarioDestino(const Value: TUsuarioVO);
    procedure SetOperacao(const Value: string);
  public
    [KeyField('Rec_Id')]
    property Id: Integer read FId write SetId;
    [FieldDate('Rec_Data')]
    property Data: TDate read FData write SetData;
    [FieldTime('Rec_Hora')]
    property Hora: TTime read FHora write SetHora;
    [FieldName('Rec_UsuarioLcto')]
    property IdUsuarioLcto: Integer read FIdUsuarioLcto write SetIdUsuarioLcto;
    [FieldName('Rec_Nivel')]
    property Nivel: Integer read FNivel write SetNivel;
    [FieldNull('Rec_Cliente')]
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    [FieldName('Rec_RazaoSocial')]
    property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
    [FieldName('Rec_Fantasia')]
    property Fantasia: string read FFantasia write SetFantasia;
    [FieldName('Rec_Endereco')]
    property Endereco: string read FEndereco write SetEndereco;
    [FieldName('Rec_Telefone')]
    property Telefone: string read FTelefone write SetTelefone;
    [FieldName('Rec_Contato')]
    property Contato: string read FContato write SetContato;
    [FieldNull('Rec_UsuarioDestino')]
    property IdUsuarioDestino: Integer read FIdUsuarioDestino write SetIdUsuarioDestino;
    [FieldNull('Rec_Tipo')]
    property IdTipo: Integer read FIdTipo write SetIdTipo;
    [FieldNull('Rec_Status')]
    property IdStatus: Integer read FIdStatus write SetIdStatus;
    [FieldName('Rec_DescricaoInicial')]
    property DescricaoInicial: string read FDescricaoInicial write SetDescricaoInicial;
    [FieldDate('Rec_DataFinal')]
    property DataFinal: TDate read FDataFinal write SetDataFinal;
    [FieldTime('Rec_HoraFinal')]
    property HoraFinal: TTime read FHoraFinal write SetHoraFinal;
    [FieldTime('Rec_DescricaoFinal')]
    property DescricaoFinal: string read FDescricaoFinal write SetDescricaoFinal;
    [ForeingKey('Rec_Cliente')]
    property Cliente: TClienteVO read FCliente write SetCliente;
    [ForeingKey('Rec_UsuarioLcto')]
    property Usuario: TUsuarioVO read FUsuario write SetUsuario;
    [ForeingKey('Rec_UsuarioDestino')]
    property UsuarioDestino: TUsuarioVO read FUsuarioDestino write SetUsuarioDestino;
    [ForeingKey('Rec_Tipo')]
    property Tipo: TTipoVO read FTipo write SetTipo;
    [ForeingKey('Rec_Status')]
    property Status: TStatusVO read FStatus write SetStatus;

    property TipoRecado: Integer read FTipoRecado write SetTipoRecado;

    property Operacao: string read FOperacao write SetOperacao;

    constructor create;
    destructor destroy; override;
  end;

implementation

{ TRecadoVO }

constructor TRecadoVO.create;
begin
  inherited create;
  FCliente := TClienteVO.create;
  FUsuario := TUsuarioVO.Create;
  FUsuarioDestino := TUsuarioVO.Create;
  FTipo := TTipoVO.Create;
  FStatus := TStatusVO.Create;
end;

destructor TRecadoVO.destroy;
begin
  FreeAndNil(FCliente);
  FreeAndNil(FUsuario);
  FreeAndNil(FUsuarioDestino);
  FreeAndNil(FTipo);
  FreeAndNil(FStatus);
  inherited;
end;

procedure TRecadoVO.SetCliente(const Value: TClienteVO);
begin
  FCliente := Value;
end;

procedure TRecadoVO.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TRecadoVO.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TRecadoVO.SetDataFinal(const Value: TDate);
begin
  FDataFinal := Value;
end;

procedure TRecadoVO.SetDescricaoFinal(const Value: string);
begin
  FDescricaoFinal := Value;
end;

procedure TRecadoVO.SetDescricaoInicial(const Value: string);
begin
  FDescricaoInicial := Value;
end;

procedure TRecadoVO.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TRecadoVO.SetFantasia(const Value: string);
begin
  FFantasia := Value;
end;

procedure TRecadoVO.SetHora(const Value: TTime);
begin
  FHora := Value;
end;

procedure TRecadoVO.SetHoraFinal(const Value: TTime);
begin
  FHoraFinal := Value;
end;

procedure TRecadoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TRecadoVO.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TRecadoVO.SetIdStatus(const Value: Integer);
begin
  FIdStatus := Value;
end;

procedure TRecadoVO.SetIdTipo(const Value: Integer);
begin
  FIdTipo := Value;
end;

procedure TRecadoVO.SetIdUsuarioDestino(const Value: Integer);
begin
  FIdUsuarioDestino := Value;
end;

procedure TRecadoVO.SetIdUsuarioLcto(const Value: Integer);
begin
  FIdUsuarioLcto := Value;
end;

procedure TRecadoVO.SetNivel(const Value: Integer);
begin
  FNivel := Value;
end;

procedure TRecadoVO.SetOperacao(const Value: string);
begin
  if (Value <> 'A') and (Value <> 'E') then
    raise Exception.Create('Informe o Tipo de Operação A-Abertura  ou E-Encerrado!');

  FOperacao := Value;
end;

procedure TRecadoVO.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TRecadoVO.SetStatus(const Value: TStatusVO);
begin
  FStatus := Value;
end;

procedure TRecadoVO.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

procedure TRecadoVO.SetTipo(const Value: TTipoVO);
begin
  FTipo := Value;
end;

procedure TRecadoVO.SetTipoRecado(const Value: Integer);
begin
  FTipoRecado := Value;
end;

procedure TRecadoVO.SetUsuario(const Value: TUsuarioVO);
begin
  FUsuario := Value;
end;

procedure TRecadoVO.SetUsuarioDestino(const Value: TUsuarioVO);
begin
  FUsuarioDestino := Value;
end;

end.
