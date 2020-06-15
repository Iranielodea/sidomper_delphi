unit uLicencaItensVO;

interface

uses
  uTableName, uKeyField, System.SysUtils, System.Generics.Collections;

type
  [TableName('Licenca_Itens')]
  TLicencaItensVO = class
  private
    FDataLcto: TDate;
    FCNPJCPF: string;
    FId: Integer;
    FDataUtilizacao: TDate;
    FLicenca: string;
    FSituacao: string;
    FLicencaUtilizada: string;
    FCodigo: Integer;
    FIdCliente: Integer;
    FRazaoSocial: string;
    FUtilizadaTela: string;
    FSituacaoTela: string;
    procedure SetCNPJCPF(const Value: string);
    procedure SetDataLcto(const Value: TDate);
    procedure SetDataUtilizacao(const Value: TDate);
    procedure SetId(const Value: Integer);
    procedure SetLicenca(const Value: string);
    procedure SetSituacao(const Value: string);
    procedure SetLicencaUtilizada(const Value: string);
    procedure SetCodigo(const Value: Integer);
    function GetSituacao: string;
    function GetLicencaUtilizada: string;
    procedure SetIdCliente(const Value: Integer);
    procedure SetRazaoSocial(const Value: string);
    function GetSituacaoTela: string;
    function GetUtilizadaTela: string;
    procedure SetSituacaoTela(const Value: string);
    procedure SetUtilizadaTela(const Value: string);
  public
    [KeyField('LicIte_Id')]
    property Id: Integer read FId write SetId;
    [FieldName('LicIte_Codigo')]
    property Codigo: Integer read FCodigo write SetCodigo;
    [FieldName('LicIte_CNPJCPF')]
    property CNPJCPF: string read FCNPJCPF write SetCNPJCPF;
    [FieldDate('LicIte_DataLcto')]
    property DataLcto: TDate read FDataLcto write SetDataLcto;
    [FieldName('LicIte_Licenca')]
    property Licenca: string read FLicenca write SetLicenca;
    [FieldDate('LicIte_DataUtilizacao')]
    property DataUtilizacao: TDate read FDataUtilizacao write SetDataUtilizacao;
    [FieldName('LicIte_Situacao')]
    property Situacao: string read GetSituacao write SetSituacao;
    [FieldName('LicIte_Utilizada')]
    property  LicencaUtilizada: string read GetLicencaUtilizada write SetLicencaUtilizada;
    [FieldNull('LicIte_Cliente')]
    property IdCliente: Integer read FIdCliente write SetIdCliente;
    property RazaoSocial: string read FRazaoSocial write SetRazaoSocial;
    property SituacaoTela: string read GetSituacaoTela write SetSituacaoTela;
    property UtilizadaTela: string read GetUtilizadaTela write SetUtilizadaTela;
  end;

  TListaLicencaItens = TObjectList<TLicencaItensVO>;

implementation

{ TLicencaItensVO }

function TLicencaItensVO.GetLicencaUtilizada: string;
begin
  Result := FLicencaUtilizada;
//  if FLicencaUtilizada = 'S' then
//    Result := 'Sim'
//  else if FLicencaUtilizada = 'N' then
//    Result := 'N�o'
//  else
//    Result := FLicencaUtilizada;
end;

function TLicencaItensVO.GetSituacao: string;
begin
  Result := FSituacao;
//  if FSituacao = '1' then
//    Result := 'Normal'
//  else if FSituacao = '2' then
//    Result := 'Inutiliz.'
//  else
//    Result := FSituacao;
end;

function TLicencaItensVO.GetSituacaoTela: string;
begin
  if FSituacaoTela = '1' then
    Result := 'Normal'
  else if FSituacaoTela = '2' then
    Result := 'Inutiliz.'
  else
    Result := FSituacaoTela;
end;

function TLicencaItensVO.GetUtilizadaTela: string;
begin

end;

procedure TLicencaItensVO.SetCNPJCPF(const Value: string);
begin
  FCNPJCPF := Value;
end;

procedure TLicencaItensVO.SetCodigo(const Value: Integer);
begin
  FCodigo := Value;
end;

procedure TLicencaItensVO.SetDataLcto(const Value: TDate);
begin
  FDataLcto := Value;
end;

procedure TLicencaItensVO.SetDataUtilizacao(const Value: TDate);
begin
  FDataUtilizacao := Value;
end;

procedure TLicencaItensVO.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TLicencaItensVO.SetIdCliente(const Value: Integer);
begin
  FIdCliente := Value;
end;

procedure TLicencaItensVO.SetLicenca(const Value: string);
begin
  FLicenca := Value;
end;

procedure TLicencaItensVO.SetLicencaUtilizada(const Value: string);
begin
  FLicencaUtilizada := Value;
end;

procedure TLicencaItensVO.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

procedure TLicencaItensVO.SetSituacao(const Value: string);
begin
  FSituacao := Value;
end;

procedure TLicencaItensVO.SetSituacaoTela(const Value: string);
begin

end;

procedure TLicencaItensVO.SetUtilizadaTela(const Value: string);
begin

end;

end.
