unit uDMSolicitacao;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient, uRegras,
  uSolicitacaoVO, uConverter, uSolicitacaoViewModel, Data.DBXJSON;

const
  PROGRAMA_SOLICITACAO: Integer = 3;

type
  TdmSolicitacao = class(TDataModule)
    cdsCadastro: TClientDataSet;
    cdsCadastroSol_Id: TAutoIncField;
    cdsCadastroSol_Analista: TIntegerField;
    cdsCadastroSol_Anexo: TStringField;
    cdsCadastroSol_Cliente: TIntegerField;
    cdsCadastroSol_Data: TDateField;
    cdsCadastroSol_Desenvolvedor: TIntegerField;
    cdsCadastroSol_Hora: TTimeField;
    cdsCadastroSol_Modulo: TIntegerField;
    cdsCadastroSol_Nivel: TIntegerField;
    cdsCadastroSol_PrevisaoEntrega: TDateField;
    cdsCadastroSol_Produto: TIntegerField;
    cdsCadastroSol_Status: TIntegerField;
    cdsCadastroSol_TempoPrevisto: TBCDField;
    cdsCadastroSol_Tipo: TIntegerField;
    cdsCadastroSol_Titulo: TStringField;
    cdsCadastroSol_UsuarioAbertura: TIntegerField;
    cdsCadastroSol_Versao: TStringField;
    cdsCadastroSol_UsuarioAtendeAtual: TIntegerField;
    cdsCadastroSol_Contato: TStringField;
    cdsCadastroSol_Descricao: TMemoField;
    cdsCadastroSol_DescricaoLiberacao: TMemoField;
    cdsCadastroSol_VersaoId: TIntegerField;
    cdsCadastroProd_Codigo: TIntegerField;
    cdsCadastroProd_Nome: TWideStringField;
    cdsCadastroSta_Codigo: TIntegerField;
    cdsCadastroSta_Nome: TWideStringField;
    cdsCadastroTip_Codigo: TIntegerField;
    cdsCadastroTip_Nome: TWideStringField;
    cdsCadastroUAb_Codigo: TIntegerField;
    cdsCadastroAnal_Codigo: TIntegerField;
    cdsCadastroCli_Codigo: TIntegerField;
    cdsCadastroCli_Nome: TWideStringField;
    cdsCadastroDesenv_Codigo: TIntegerField;
    cdsCadastroMod_Codigo: TIntegerField;
    cdsCadastroMod_Nome: TWideStringField;
    cdsCadastroUAb_Nome: TWideStringField;
    cdsCadastroAnal_Nome: TWideStringField;
    cdsCadastroDesenv_Nome: TWideStringField;
    cdsCadastroVer_Versao: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ObterPorId(id: Integer): TSolicitacaoViewModel;
    procedure IniciarTempo(AIdUsuarioLogado: Integer; ASolicitacaoViewModel: TSolicitacaoViewModel);
    procedure FinalizarTempo(AIdUsuarioLogado: Integer; ASolicitacaoViewModel: TSolicitacaoViewModel;
      AValidarUsuario: Boolean=True);
  end;

var
  dmSolicitacao: TdmSolicitacao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmSolicitacao }

procedure TdmSolicitacao.DataModuleCreate(Sender: TObject);
begin
  cdsCadastro.RemoteServer := dm.DSPConexao;
end;

procedure TdmSolicitacao.FinalizarTempo(AIdUsuarioLogado: Integer;
  ASolicitacaoViewModel: TSolicitacaoViewModel; AValidarUsuario: Boolean);
var
  proxy: TServerMethods1Client;
  objJson: TJSONValue;
begin
  proxy := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
       objJson := TConverte.ObjectToJSON(ASolicitacaoViewModel);
       proxy.SolicitacaoFinalizarTempo(AIdUsuarioLogado, objJson, AValidarUsuario);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message + ' TdmSolicitacao.FinalizarTempo');
      end;
    end;
  finally
    FreeAndNil(proxy);
  end;
end;

procedure TdmSolicitacao.IniciarTempo(AIdUsuarioLogado: Integer; ASolicitacaoViewModel: TSolicitacaoViewModel);
var
  proxy: TServerMethods1Client;
  objJson: TJSONValue;
begin
  proxy := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
       objJson := TConverte.ObjectToJSON(ASolicitacaoViewModel);
       proxy.SolicitacaoIniciarTempo(AIdUsuarioLogado, objJson);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message + ' TdmSolicitacao.IniciarTempo');
      end;
    end;
  finally
    FreeAndNil(proxy);
  end;
end;

function TdmSolicitacao.ObterPorId(id: Integer): TSolicitacaoViewModel;
var
  proxy: TServerMethods1Client;
begin
  proxy := TServerMethods1Client.Create(DM.Conexao.DBXConnection);
  try
    try
      Result := TConverte.JSONToObject<TSolicitacaoViewModel>(proxy.SolicitacaoObterPorId(id));
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message + ' TdmSolicitacao.ObterPorId');
      end;
    end;
  finally
    FreeAndNil(proxy);
  end;
end;

end.
