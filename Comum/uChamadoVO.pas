unit uChamadoVO;

interface

uses
  System.SysUtils, uChamadoStatusVO, System.Generics.Collections, uChamadoOcorrenciaVO,
  uChamadoColaboradorVO, uKeyField, uTableName;

type
  [TableName('Chamado')]
  TChamadoVO = class
  private
    FIdStatus: Integer;
    FDescricao: string;
    FIdTipo: Integer;
    FHoraAtendeAtual: TTime;
    FIdModulo: Integer;
    FIdProduto: Integer;
    FId: Integer;
    FDataAbertura: TDate;
    FIdUsuarioAtendeAtual: Integer;
    FNivel: Integer;
    FContato: string;
    FHoraAbertura: TTime;
    FIdCliente: Integer;
    FTipoMovimento: Integer;
    FIdUsuarioAbertura: Integer;
    FListaStatus: TObjectList<TChamadoStatusVO>;
    FChamadoOcorrencia: TChamadoOcorrenciaVO;
    FListaChamadoOcorrencia: TObjectList<TChamadoOcorrenciaVO>;
    FChamadoStatusVO: TChamadoStatusVO;
    FListaChamadoColaborador: TObjectList<TChamadoColaboradorVO>;
    FOrigem: Integer;
    procedure SetContato(const Value: string);
    procedure SetDataAbertura(const Value: TDate);
    procedure SetDescricao(const Value: string);
    procedure SetHoraAbertura(const Value: TTime);
    procedure SetHoraAtendeAtual(const Value: TTime);
    procedure SetId(const Value: Integer);
    procedure SetIdCliente(const Value: Integer);
    procedure SetIdModulo(const Value: Integer);
    procedure SetIdProduto(const Value: Integer);
    procedure SetIdStatus(const Value: Integer);
    procedure SetIdTipo(const Value: Integer);
    procedure SetIdUsuarioAbertura(const Value: Integer);
    procedure SetIdUsuarioAtendeAtual(const Value: Integer);
    procedure SetNivel(const Value: Integer);
    procedure SetTipoMovimento(const Value: Integer);
    procedure SetListaStatus(const Value: TObjectList<TChamadoStatusVO>);
    procedure SetListaChamadoOcorrencia(
      const Value: TObjectList<TChamadoOcorrenciaVO>);
    procedure SetChamadoStatusVO(const Value: TChamadoStatusVO);
    procedure SetListaChamadoColaborador(
      const Value: TObjectList<TChamadoColaboradorVO>);
    procedure SetOrigem(const Value: Integer);
  public
    [KeyField('Cha_Id')]
    property Id: Integer read FId write SetId;
    [FieldDate('Cha_DataAbertura')]
    property DataAbertura: TDate read FDataAbertura write SetDataAbertura;
    [FieldTime('Cha_HoraAbertura')]
    property HoraAbertura: TTime read FHoraAbertura write SetHoraAbertura;
    [FieldName('Cha_Cliente')]
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    [FieldName('Cha_UsuarioAbertura')]
    property IdUsuarioAbertura: Integer read FIdUsuarioAbertura write SetIdUsuarioAbertura;
    [FieldName('Cha_Contato')]
    property Contato: string read FContato write SetContato;
    [FieldName('Cha_Nivel')]
    property Nivel: Integer read FNivel write SetNivel;
    [FieldNull('Cha_Tipo')]
    property IdTipo: Integer read FIdTipo write SetIdTipo;
    [FieldNull('Cha_Status')]
    property IdStatus: Integer read FIdStatus write SetIdStatus;
    [FieldName('Cha_Descricao')]
    property Descricao: string read FDescricao write SetDescricao;
    [FieldNull('Cha_Modulo')]
    property IdModulo: Integer read FIdModulo write SetIdModulo;
    [FieldNull('Cha_Produto')]
    property IdProduto: Integer read FIdProduto write SetIdProduto;
    [FieldNull('Cha_UsuarioAtendeAtual')]
    property IdUsuarioAtendeAtual: Integer read FIdUsuarioAtendeAtual write SetIdUsuarioAtendeAtual;
    [FieldTime('Cha_HoraAtendeAtual')]
    property HoraAtendeAtual: TTime read FHoraAtendeAtual write SetHoraAtendeAtual;
    [FieldNull('Cha_TipoMovimento')]
    property TipoMovimento: Integer read FTipoMovimento write SetTipoMovimento;
    [FieldName('Cha_Origem')]
    property Origem: Integer read FOrigem write SetOrigem;

    property ListaStatus: TObjectList<TChamadoStatusVO> read FListaStatus write SetListaStatus;
    property ListaChamadoOcorrencia: TObjectList<TChamadoOcorrenciaVO> read FListaChamadoOcorrencia write SetListaChamadoOcorrencia;
    property ListaChamadoColaborador: TObjectList<TChamadoColaboradorVO> read FListaChamadoColaborador write SetListaChamadoColaborador;
    property ChamadoStatusVO: TChamadoStatusVO read FChamadoStatusVO write SetChamadoStatusVO;
    constructor Create;
    destructor Destroy; override;
  end;

  TListaChamado = TObjectList<TChamadoVO>;

  TRelChamadoVO = class
  private
    FRevendaCodigo: Integer;
    FRevendaNome: string;
    FClienteCodigo: Integer;
    FClienteNome: string;
    FQtdeDiasSemVisita: Integer;
    FQtdeDiasSemChamado: Integer;
    FDataUltChamado: string;
    FUsuNome: string;
    FUsuCodigo: Integer;
    FPerfil: string;
    FNomeCidade: string;
  public
    property RevendaCodigo: Integer read FRevendaCodigo write FRevendaCodigo;
    property RevendaNome: string read FRevendaNome write FRevendaNome;
    property ClienteCodigo: Integer  read  FClienteCodigo write FClienteCodigo;
    property ClienteNome: string read FClienteNome write FClienteNome;
    property UsuCodigo: Integer read FUsuCodigo write FUsuCodigo;
    property UsuNome: string read FUsuNome write FUsuNome;
    property QtdeDiasSemVisita: Integer read FQtdeDiasSemVisita write FQtdeDiasSemVisita;
    property QtdeDiasSemChamado: Integer read FQtdeDiasSemChamado write FQtdeDiasSemChamado;
    property DataUltChamado: string read FDataUltChamado write FDataUltChamado;
    property Perfil: string read FPerfil write FPerfil;
    property NomeCidade: string read FNomeCidade write FNomeCidade;
  end;

  TListaRelChamado = TObjectList<TRelChamadoVO>;


implementation

{ TChamadoVO }

constructor TChamadoVO.Create;
begin
  inherited Create;
  FListaStatus := TObjectList<TChamadoStatusVO>.Create();
  FListaChamadoOcorrencia := TObjectList<TChamadoOcorrenciaVO>.Create;
  FListaChamadoColaborador := TObjectList<TChamadoColaboradorVO>.Create();
  FChamadoStatusVO := TChamadoStatusVO.Create;
end;

destructor TChamadoVO.Destroy;
begin
  FreeAndNil(FListaStatus);
  FreeAndNil(FListaChamadoOcorrencia);
  FreeAndNil(FChamadoStatusVO);
  FreeAndNil(FListaChamadoColaborador);
  inherited;
end;

procedure TChamadoVO.SetChamadoStatusVO(const Value: TChamadoStatusVO);
begin
  FChamadoStatusVO := Value;
end;

procedure TChamadoVO.SetContato(const Value: string);
begin
  FContato := Value;
end;

procedure TChamadoVO.SetDataAbertura(const Value: TDate);
begin
  FDataAbertura := Value;
end;

procedure TChamadoVO.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TChamadoVO.SetHoraAbertura(const Value: TTime);
begin
  FHoraAbertura := Value;
end;

procedure TChamadoVO.SetHoraAtendeAtual(const Value: TTime);
begin
  FHoraAtendeAtual := Value;
end;

procedure TChamadoVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TChamadoVO.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TChamadoVO.SetIdModulo(const Value: Integer);
begin
  FIdModulo := Value;
end;

procedure TChamadoVO.SetIdProduto(const Value: Integer);
begin
  FIdProduto := Value;
end;

procedure TChamadoVO.SetIdStatus(const Value: Integer);
begin
  FIdStatus := Value;
end;

procedure TChamadoVO.SetIdTipo(const Value: Integer);
begin
  FIdTipo := Value;
end;

procedure TChamadoVO.SetIdUsuarioAbertura(const Value: Integer);
begin
  FIdUsuarioAbertura := Value;
end;

procedure TChamadoVO.SetIdUsuarioAtendeAtual(const Value: Integer);
begin
  FIdUsuarioAtendeAtual := Value;
end;

procedure TChamadoVO.SetListaChamadoColaborador(
  const Value: TObjectList<TChamadoColaboradorVO>);
begin
  FListaChamadoColaborador := Value;
end;

procedure TChamadoVO.SetListaChamadoOcorrencia(
  const Value: TObjectList<TChamadoOcorrenciaVO>);
begin
  FListaChamadoOcorrencia := Value;
end;

procedure TChamadoVO.SetListaStatus(const Value: TObjectList<TChamadoStatusVO>);
begin
  FListaStatus := Value;
end;

procedure TChamadoVO.SetNivel(const Value: Integer);
begin
  FNivel := Value;
end;

procedure TChamadoVO.SetOrigem(const Value: Integer);
begin
  FOrigem := Value;
end;

procedure TChamadoVO.SetTipoMovimento(const Value: Integer);
begin
  FTipoMovimento := Value;
end;

end.
