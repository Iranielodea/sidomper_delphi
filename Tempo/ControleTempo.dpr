program ControleTempo;

uses
  Vcl.Forms,
  uTelaPrincipal in 'uTelaPrincipal.pas' {frmTelaPrincipal},
  uDM in 'uDM.pas' {DM: TDataModule},
  uRegras in 'uRegras.pas',
  uDMSolicitacao in 'uDMSolicitacao.pas' {dmSolicitacao: TDataModule},
  uSolicitacaoVO in '..\Comum\uSolicitacaoVO.pas',
  uConverter in '..\Remoto\Comum\uConverter.pas',
  uStatusVO in 'uStatusVO.pas',
  uClienteVO in 'uClienteVO.pas',
  uSolicitacaoViewModel in '..\Comum\ViewModel\uSolicitacaoViewModel.pas',
  uConfig in '..\Comum\uConfig.pas',
  uKeyField in '..\Comum\DAO\uKeyField.pas',
  uTableName in '..\Comum\DAO\uTableName.pas',
  uUsuarioVO in '..\Comum\uUsuarioVO.pas',
  uDepartamentoVO in '..\Comum\uDepartamentoVO.pas',
  uDepartamentoAcessoVO in '..\Comum\uDepartamentoAcessoVO.pas',
  uDepartamentoEmailVO in '..\Comum\uDepartamentoEmailVO.pas',
  uContaEmailVO in '..\Comum\uContaEmailVO.pas',
  uModuloVO in '..\Comum\uModuloVO.pas',
  uProdutoVO in '..\Comum\uProdutoVO.pas',
  uCategoriaVO in '..\Comum\uCategoriaVO.pas',
  uTipoVO in '..\Comum\uTipoVO.pas',
  uSolicitacaoOcorrenciaVO in '..\Comum\uSolicitacaoOcorrenciaVO.pas',
  uSolicitacaoStatusVO in '..\Comum\uSolicitacaoStatusVO.pas',
  uSolicitacaoCronogramaVO in '..\Comum\uSolicitacaoCronogramaVO.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTelaPrincipal, frmTelaPrincipal);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TdmSolicitacao, dmSolicitacao);
  Application.Run;
end.
