unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth, uDM,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, uCadastroPadrao, Data.DBXJSON,
  Datasnap.DBClient, Vcl.Dialogs, uSolicitacaoStatusVO, Data.DBXJSONReflect,
  uFiltroSolicitacao, uFiltroVisita, uVisita, uBaseConhecimento, uFiltroBaseConhecimento,
  uEnumerador, uRevendaVO, System.Generics.Collections, uArquivos, uChamadoVO,
  uSolicitacaoTempo, uConverter, uSolicitacaoTempoVO, uTipoVO, uStatusVO,
  uChamadoOcorrenciaVO, uUsuarioVO, uLerXML, uExportarDepartamento,
  uExportarTipos, uExportarStatus, uDMVersao, uDMSolicitacao, uFiltroCliente,
  uSolicitacaoVO, uSolicitacaoViewModel, uChamadoQuadroViewModel, uUsuarioPermissaoVO,
  uPermissaoSolicitacaoVO, uPermissaoChamadoVO, uSolicitacaoOcorrenciaVO, uSolicitacaoCronogramaVO;

type
  TServerMethods1 = class(TDSServerModule)
    QRevendaCad: TFDQuery;
    QRevendaCadRev_Ativo: TBooleanField;
    QRevendaCadRev_Codigo: TIntegerField;
    QRevendaCadRev_Id: TFDAutoIncField;
    QRevendaCadRev_Nome: TWideStringField;
    dspRevendaCad: TDataSetProvider;
    QRevendaCons: TFDQuery;
    dspRevendaCons: TDataSetProvider;
    QUsuarioCad: TFDQuery;
    QUsuarioCons: TFDQuery;
    dspUsuarioCad: TDataSetProvider;
    QUsuarioCadUsu_Adm: TBooleanField;
    QUsuarioCadUsu_Ativo: TBooleanField;
    QUsuarioCadUsu_Cliente: TIntegerField;
    QUsuarioCadUsu_Codigo: TIntegerField;
    QUsuarioCadUsu_Departamento: TIntegerField;
    QUsuarioCadUsu_Email: TWideStringField;
    QUsuarioCadUsu_Id: TFDAutoIncField;
    QUsuarioCadUsu_Nome: TWideStringField;
    QUsuarioCadUsu_Notificar: TBooleanField;
    QUsuarioCadUsu_OnLine: TBooleanField;
    QUsuarioCadUsu_Password: TWideStringField;
    QUsuarioCadUsu_Revenda: TIntegerField;
    QUsuarioCadUsu_UserName: TWideStringField;
    QUsuarioCadCli_Codigo: TIntegerField;
    QUsuarioCadCli_Nome: TWideStringField;
    QUsuarioCadDep_Codigo: TIntegerField;
    QUsuarioCadDep_Nome: TWideStringField;
    dspUsuarioCons: TDataSetProvider;
    QUsuarioCadRev_Codigo: TIntegerField;
    QUsuarioCadRev_Nome: TWideStringField;
    QDepartamentoCad: TFDQuery;
    QDepartamentoCons: TFDQuery;
    QDepartamentoCadDep_Ativo: TBooleanField;
    QDepartamentoCadDep_Codigo: TIntegerField;
    QDepartamentoCadDep_Id: TFDAutoIncField;
    QDepartamentoCadDep_Nome: TWideStringField;
    dspDepartamentoCad: TDataSetProvider;
    dspDepartamentoCons: TDataSetProvider;
    QDepartamentoAcesso: TFDQuery;
    dspDepartamentoAcesso: TDataSetProvider;
    QProdutoCad: TFDQuery;
    QProdutoCadProd_Ativo: TBooleanField;
    QProdutoCadProd_Codigo: TIntegerField;
    QProdutoCadProd_Id: TFDAutoIncField;
    QProdutoCadProd_Nome: TWideStringField;
    QProdutoCons: TFDQuery;
    dspProdutoCad: TDataSetProvider;
    dspProdutoCons: TDataSetProvider;
    QModuloCad: TFDQuery;
    QModuloCons: TFDQuery;
    dspModuloCad: TDataSetProvider;
    dspModuloCons: TDataSetProvider;
    QModuloCadMod_Ativo: TBooleanField;
    QModuloCadMod_Codigo: TIntegerField;
    QModuloCadMod_Id: TFDAutoIncField;
    QModuloCadMod_Nome: TWideStringField;
    dspTipoCad: TDataSetProvider;
    dspTipoCons: TDataSetProvider;
    QTipoCad: TFDQuery;
    QTipoCadTip_Ativo: TBooleanField;
    QTipoCadTip_Codigo: TIntegerField;
    QTipoCadTip_Id: TFDAutoIncField;
    QTipoCadTip_Nome: TWideStringField;
    QTipoCadTip_Programa: TIntegerField;
    QTipoCons: TFDQuery;
    QStatusCad: TFDQuery;
    QStatusCadSta_Ativo: TBooleanField;
    QStatusCadSta_Codigo: TIntegerField;
    QStatusCadSta_Id: TFDAutoIncField;
    QStatusCadSta_Nome: TWideStringField;
    QStatusCadSta_Programa: TIntegerField;
    QStatusCons: TFDQuery;
    dspStatusCad: TDataSetProvider;
    dspStatusCons: TDataSetProvider;
    QClienteCad: TFDQuery;
    QClienteCons: TFDQuery;
    dspClienteCad: TDataSetProvider;
    dspClienteCons: TDataSetProvider;
    QClienteCadCli_Ativo: TBooleanField;
    QClienteCadCli_Codigo: TIntegerField;
    QClienteCadCli_Contato: TWideStringField;
    QClienteCadCli_Dcto: TStringField;
    QClienteCadCli_Endereco: TWideStringField;
    QClienteCadCli_Enquadramento: TStringField;
    QClienteCadCli_Fantasia: TWideStringField;
    QClienteCadCli_Id: TFDAutoIncField;
    QClienteCadCli_Nome: TWideStringField;
    QClienteCadCli_Restricao: TBooleanField;
    QClienteCadCli_Revenda: TIntegerField;
    QClienteCadCli_Telefone: TStringField;
    QClienteCadCli_Usuario: TIntegerField;
    QClienteCadRev_Codigo: TIntegerField;
    QClienteCadRev_Nome: TWideStringField;
    QClienteCadUsu_Codigo: TIntegerField;
    QClienteCadUsu_Nome: TWideStringField;
    QClienteEspCons: TFDQuery;
    QClienteEmailCons: TFDQuery;
    dspClienteEspCons: TDataSetProvider;
    dspClienteEmailCons: TDataSetProvider;
    QClienteModuloCons: TFDQuery;
    dspClienteModuloCons: TDataSetProvider;
    QClienteModuloConsCliMod_Cliente: TIntegerField;
    QClienteModuloConsCliMod_Id: TFDAutoIncField;
    QClienteModuloConsCliMod_Modulo: TIntegerField;
    QClienteModuloConsCliMod_Produto: TIntegerField;
    QClienteModuloConsMod_Codigo: TIntegerField;
    QClienteModuloConsMod_Nome: TWideStringField;
    QClienteModuloConsProd_Codigo: TIntegerField;
    QClienteModuloConsProd_Nome: TWideStringField;
    QClienteEspCad: TFDQuery;
    QClienteEspCadCliEsp_Cliente: TIntegerField;
    QClienteEspCadCliEsp_Data: TDateField;
    QClienteEspCadCliEsp_Descricao: TWideStringField;
    QClienteEspCadCliEsp_Id: TFDAutoIncField;
    QClienteEspCadCliEsp_Item: TIntegerField;
    QClienteEspCadCliEsp_Usuario: TIntegerField;
    dspClienteEspCad: TDataSetProvider;
    QClienteEspCadUsu_Codigo: TIntegerField;
    QClienteEspCadCliEsp_Anexo: TStringField;
    QDepartamentoCadDep_SolicitaAbertura: TBooleanField;
    QDepartamentoCadDep_SolicitaAnalise: TBooleanField;
    QDepartamentoCadDep_SolicitaOcorGeral: TBooleanField;
    QDepartamentoCadDep_SolicitaOcorTecnica: TBooleanField;
    QDepartamentoCadDep_SolicitaQuadro: TBooleanField;
    QDepartamentoCadDep_SolicitaStatus: TBooleanField;
    QSolicitaCad: TFDQuery;
    QSolicitaCadSol_Analista: TIntegerField;
    QSolicitaCadSol_Anexo: TStringField;
    QSolicitaCadSol_Cliente: TIntegerField;
    QSolicitaCadSol_Data: TDateField;
    QSolicitaCadSol_Desenvolvedor: TIntegerField;
    QSolicitaCadSol_Hora: TTimeField;
    QSolicitaCadSol_Id: TFDAutoIncField;
    QSolicitaCadSol_Modulo: TIntegerField;
    QSolicitaCadSol_Nivel: TIntegerField;
    QSolicitaCadSol_PrevisaoEntrega: TDateField;
    QSolicitaCadSol_Produto: TIntegerField;
    QSolicitaCadSol_Status: TIntegerField;
    QSolicitaCadSol_TempoPrevisto: TBCDField;
    QSolicitaCadSol_Tipo: TIntegerField;
    QSolicitaCadSol_Titulo: TStringField;
    QSolicitaCadSol_UsuarioAbertura: TIntegerField;
    QSolicitaCadSol_Versao: TStringField;
    QSolicitaCadSta_Codigo: TIntegerField;
    QSolicitaCadSta_Nome: TWideStringField;
    QSolicitaCadTip_Codigo: TIntegerField;
    QSolicitaCadTip_Nome: TWideStringField;
    QSolicitaCadUAb_Codigo: TIntegerField;
    QSolicitaCadAnal_Codigo: TIntegerField;
    QSolicitaCadCli_Codigo: TIntegerField;
    QSolicitaCadCli_Nome: TWideStringField;
    QSolicitaCadDesenv_Codigo: TIntegerField;
    QSolicitaCadMod_Codigo: TIntegerField;
    QSolicitaCadMod_Nome: TWideStringField;
    dspSolicitacaoCad: TDataSetProvider;
    dspSolicitacaoCons: TDataSetProvider;
    QSolicitaCons: TFDQuery;
    QSolicitaCadProd_Codigo: TIntegerField;
    QSolicitaCadProd_Nome: TWideStringField;
    QClienteModuloCad: TFDQuery;
    QClienteModuloCadCliMod_Id: TFDAutoIncField;
    QClienteModuloCadCliMod_Cliente: TIntegerField;
    QClienteModuloCadCliMod_Modulo: TIntegerField;
    QClienteModuloCadCliMod_Produto: TIntegerField;
    QClienteModuloCadProd_Codigo: TIntegerField;
    QClienteModuloCadProd_Nome: TWideStringField;
    dspClienteModuloCad: TDataSetProvider;
    QSolicitaCronogramaCad: TFDQuery;
    QSolicitaCronogramaCadSCro_Data: TDateField;
    QSolicitaCronogramaCadSCro_HoraFim: TTimeField;
    QSolicitaCronogramaCadSCro_HoraInicio: TTimeField;
    QSolicitaCronogramaCadSCro_Id: TFDAutoIncField;
    QSolicitaCronogramaCadSCro_Solicitacao: TIntegerField;
    QSolicitaCronogramaCadSCro_UsuarioOperacional: TIntegerField;
    QSolicitaCronogramaCadUsu_Codigo: TIntegerField;
    dspSolicitaCronogramaCad: TDataSetProvider;
    QSolicitaCronogramaCons: TFDQuery;
    dspSolicitaCronogramaCons: TDataSetProvider;
    QSolicitaCronogramaConsSCro_Data: TDateField;
    QSolicitaCronogramaConsSCro_HoraFim: TTimeField;
    QSolicitaCronogramaConsSCro_HoraInicio: TTimeField;
    QSolicitaCronogramaConsSCro_Id: TFDAutoIncField;
    QSolicitaCronogramaConsSCro_Solicitacao: TIntegerField;
    QSolicitaCronogramaConsSCro_UsuarioOperacional: TIntegerField;
    QSolicitaCronogramaConsUsu_Codigo: TIntegerField;
    QSolicitaOcorrenciaGeralCons: TFDQuery;
    QSolicitaOcorrenciaGeralConsSOcor_Anexo: TStringField;
    QSolicitaOcorrenciaGeralConsSOcor_Classificacao: TIntegerField;
    QSolicitaOcorrenciaGeralConsSOcor_Data: TDateField;
    QSolicitaOcorrenciaGeralConsSOcor_Hora: TTimeField;
    QSolicitaOcorrenciaGeralConsSOcor_Id: TFDAutoIncField;
    QSolicitaOcorrenciaGeralConsSOcor_Solicitacao: TIntegerField;
    QSolicitaOcorrenciaGeralConsSOcor_Tipo: TIntegerField;
    QSolicitaOcorrenciaGeralConsSOcor_UsuarioOperacional: TIntegerField;
    QSolicitaOcorrenciaGeralConsTip_Codigo: TIntegerField;
    QSolicitaOcorrenciaGeralConsTip_Nome: TWideStringField;
    QSolicitaOcorrenciaGeralConsUsu_Codigo: TIntegerField;
    dspSolicitaOcorrenciaGeralCons: TDataSetProvider;
    QSolicitaOcorrenciaTecnicaCons: TFDQuery;
    dspSolicitaOcorrenciaTecnicaCons: TDataSetProvider;
    QSolicitaOcorrenciaTecnicaConsSOcor_Anexo: TStringField;
    QSolicitaOcorrenciaTecnicaConsSOcor_Classificacao: TIntegerField;
    QSolicitaOcorrenciaTecnicaConsSOcor_Data: TDateField;
    QSolicitaOcorrenciaTecnicaConsSOcor_Hora: TTimeField;
    QSolicitaOcorrenciaTecnicaConsSOcor_Id: TFDAutoIncField;
    QSolicitaOcorrenciaTecnicaConsSOcor_Solicitacao: TIntegerField;
    QSolicitaOcorrenciaTecnicaConsSOcor_Tipo: TIntegerField;
    QSolicitaOcorrenciaTecnicaConsSOcor_UsuarioOperacional: TIntegerField;
    QSolicitaOcorrenciaTecnicaConsTip_Codigo: TIntegerField;
    QSolicitaOcorrenciaTecnicaConsTip_Nome: TWideStringField;
    QSolicitaOcorrenciaTecnicaConsUsu_Codigo: TIntegerField;
    QSolicitaStatusCons: TFDQuery;
    dspSolicitaStatusCons: TDataSetProvider;
    QVisitaCad: TFDQuery;
    QVisitaCadVis_Id: TFDAutoIncField;
    QVisitaCadVis_Dcto: TStringField;
    QVisitaCadVis_Data: TDateField;
    QVisitaCadVis_HoraInicio: TTimeField;
    QVisitaCadVis_HoraFim: TTimeField;
    QVisitaCadVis_Cliente: TIntegerField;
    QVisitaCadVis_Usuario: TIntegerField;
    QVisitaCadVis_Contato: TStringField;
    QVisitaCadVis_Tipo: TIntegerField;
    QVisitaCadVis_Status: TIntegerField;
    QVisitaCadVis_Descricao: TStringField;
    QVisitaCadVis_Anexo: TStringField;
    QVisitaCadCli_Codigo: TIntegerField;
    QVisitaCadCli_Nome: TWideStringField;
    QVisitaCadUsu_Codigo: TIntegerField;
    QVisitaCadTip_Codigo: TIntegerField;
    QVisitaCadTip_Nome: TWideStringField;
    QVisitaCadSta_Codigo: TIntegerField;
    QVisitaCadSta_Nome: TWideStringField;
    dspVisitaCad: TDataSetProvider;
    dspVisitaCons: TDataSetProvider;
    QVisitaCons: TFDQuery;
    QBaseCad: TFDQuery;
    QBaseCadBas_Id: TFDAutoIncField;
    QBaseCadBas_Data: TDateField;
    QBaseCadBas_Nome: TStringField;
    QBaseCadBas_Usuario: TIntegerField;
    QBaseCadBas_Produto: TIntegerField;
    QBaseCadBas_Modulo: TIntegerField;
    QBaseCadBas_Tipo: TIntegerField;
    QBaseCadBas_Status: TIntegerField;
    QBaseCadBas_Descricao: TStringField;
    QBaseCadBas_Anexo: TStringField;
    QBaseCadUsu_Codigo: TIntegerField;
    QBaseCadProd_Codigo: TIntegerField;
    QBaseCadProd_Nome: TWideStringField;
    QBaseCadMod_Codigo: TIntegerField;
    QBaseCadMod_Nome: TWideStringField;
    QBaseCadTip_Codigo: TIntegerField;
    QBaseCadTip_Nome: TWideStringField;
    QBaseCadSta_Codigo: TIntegerField;
    QBaseCadSta_Nome: TWideStringField;
    QBaseCons: TFDQuery;
    dspBaseCad: TDataSetProvider;
    dspBaseCons: TDataSetProvider;
    QParametrosCad: TFDQuery;
    QParametrosCadPar_Id: TFDAutoIncField;
    QParametrosCadPar_Codigo: TIntegerField;
    QParametrosCadPar_programa: TIntegerField;
    QParametrosCadPar_Nome: TStringField;
    QParametrosCadPar_Valor: TStringField;
    QParametrosCadPar_Obs: TStringField;
    QParametrosCons: TFDQuery;
    dspParametrosCad: TDataSetProvider;
    dspParametrosCons: TDataSetProvider;
    QVersaoCad: TFDQuery;
    QVersaoCons: TFDQuery;
    dspVersaoCad: TDataSetProvider;
    dspVersaoCons: TDataSetProvider;
    QVersaoCadVer_DataInicio: TDateField;
    QVersaoCadVer_DataLiberacao: TDateField;
    QVersaoCadVer_Descricao: TStringField;
    QVersaoCadVer_Id: TFDAutoIncField;
    QVersaoCadVer_Status: TIntegerField;
    QVersaoCadVer_Tipo: TIntegerField;
    QVersaoCadVer_Usuario: TIntegerField;
    QVersaoCadSta_Codigo: TIntegerField;
    QVersaoCadSta_Nome: TWideStringField;
    QVersaoCadTip_Codigo: TIntegerField;
    QVersaoCadTip_Nome: TWideStringField;
    QVersaoCadUsu_Codigo: TIntegerField;
    QChamadoCad: TFDQuery;
    QChamadoCons: TFDQuery;
    QChamadoCadCha_Id: TFDAutoIncField;
    QChamadoCadCha_DataAbertura: TDateField;
    QChamadoCadCha_HoraAbertura: TTimeField;
    QChamadoCadCha_Cliente: TIntegerField;
    QChamadoCadCha_UsuarioAbertura: TIntegerField;
    QChamadoCadCha_Contato: TStringField;
    QChamadoCadCha_Nivel: TIntegerField;
    QChamadoCadCha_Tipo: TIntegerField;
    QChamadoCadCha_Status: TIntegerField;
    QChamadoCadCha_Descricao: TStringField;
    QChamadoCadUsu_Codigo: TIntegerField;
    QChamadoCadCli_Codigo: TIntegerField;
    QChamadoCadCli_Nome: TWideStringField;
    QChamadoCadTip_Codigo: TIntegerField;
    QChamadoCadTip_Nome: TWideStringField;
    QChamadoCadSta_Codigo: TIntegerField;
    QChamadoCadSta_Nome: TWideStringField;
    dspChamadoCad: TDataSetProvider;
    dspChamadoCons: TDataSetProvider;
    QChamadoOcorrenciaCad: TFDQuery;
    QChamadoOcorrenciaCadChOco_Id: TFDAutoIncField;
    QChamadoOcorrenciaCadChOco_Chamado: TIntegerField;
    QChamadoOcorrenciaCadChOco_Docto: TStringField;
    QChamadoOcorrenciaCadChOco_Data: TDateField;
    QChamadoOcorrenciaCadChOco_HoraInicio: TTimeField;
    QChamadoOcorrenciaCadChOco_HoraFim: TTimeField;
    QChamadoOcorrenciaCadChOco_Usuario: TIntegerField;
    QChamadoOcorrenciaCadChOco_UsuarioColab1: TIntegerField;
    QChamadoOcorrenciaCadChOco_UsuarioColab2: TIntegerField;
    QChamadoOcorrenciaCadChOco_UsuarioColab3: TIntegerField;
    QChamadoOcorrenciaCadChOco_DescricaoTecnica: TStringField;
    QChamadoOcorrenciaCadChOco_DescricaoSolucao: TStringField;
    QChamadoOcorrenciaCadChOco_Anexo: TStringField;
    QChamadoOcorrenciaCadUsu_Codigo: TIntegerField;
    QChamadoOcorrenciaCadUsu_Codigo1: TIntegerField;
    QChamadoOcorrenciaCadUsu_Codigo2: TIntegerField;
    QChamadoOcorrenciaCadUsu_Codigo3: TIntegerField;
    dspChamadoOcorrenciaCad: TDataSetProvider;
    QChamadoOcorrenciaCons: TFDQuery;
    dspChamadoOcorrenciaCons: TDataSetProvider;
    QChamadoOcorrenciaConsChOco_Id: TFDAutoIncField;
    QChamadoOcorrenciaConsChOco_Chamado: TIntegerField;
    QChamadoOcorrenciaConsChOco_Docto: TStringField;
    QChamadoOcorrenciaConsChOco_Data: TDateField;
    QChamadoOcorrenciaConsChOco_HoraInicio: TTimeField;
    QChamadoOcorrenciaConsChOco_HoraFim: TTimeField;
    QChamadoOcorrenciaConsChOco_Usuario: TIntegerField;
    QChamadoOcorrenciaConsChOco_UsuarioColab1: TIntegerField;
    QChamadoOcorrenciaConsChOco_UsuarioColab2: TIntegerField;
    QChamadoOcorrenciaConsChOco_UsuarioColab3: TIntegerField;
    QChamadoOcorrenciaConsChOco_DescricaoTecnica: TStringField;
    QChamadoOcorrenciaConsChOco_DescricaoSolucao: TStringField;
    QChamadoOcorrenciaConsChOco_Anexo: TStringField;
    QChamadoOcorrenciaConsUsu_Codigo: TIntegerField;
    QChamadoOcorrenciaConsUsu_Codigo1: TIntegerField;
    QChamadoOcorrenciaConsUsu_Codigo2: TIntegerField;
    QChamadoOcorrenciaConsUsu_Codigo3: TIntegerField;
    QChamadoStatus: TFDQuery;
    QChamadoStatusChSta_Chamado: TIntegerField;
    QChamadoStatusChSta_Data: TDateField;
    QChamadoStatusChSta_Id: TFDAutoIncField;
    QChamadoStatusChSta_Status: TIntegerField;
    QChamadoStatusChSta_Usuario: TIntegerField;
    QChamadoStatusSta_Nome: TWideStringField;
    QChamadoStatusSta_Codigo: TIntegerField;
    QChamadoStatusUsu_Codigo: TIntegerField;
    dspChamadoStatus: TDataSetProvider;
    QDepartamentoCadDep_ChamadoAbertura: TBooleanField;
    QDepartamentoCadDep_ChamadoQuadro: TBooleanField;
    QDepartamentoCadDep_ChamadoStatus: TBooleanField;
    QDepartamentoCadDep_ChamadoOcor: TBooleanField;
    spBackup: TFDStoredProc;
    QRelChamadoModelo1: TFDQuery;
    QRelChamadoModelo1Cha_Id: TFDAutoIncField;
    QRelChamadoModelo1Cha_DataAbertura: TDateField;
    QRelChamadoModelo1Cha_HoraAbertura: TTimeField;
    QRelChamadoModelo1Cha_Contato: TStringField;
    QRelChamadoModelo1Cha_Nivel: TIntegerField;
    QRelChamadoModelo1Nivel: TStringField;
    QRelChamadoModelo1Tip_Nome: TWideStringField;
    QRelChamadoModelo1Sta_Nome: TWideStringField;
    QRelChamadoDetModelo1: TFDQuery;
    dsChamadoModelo1: TDataSource;
    dspRelChamadoModelo1: TDataSetProvider;
    dspRelChamadoDetModelo1: TDataSetProvider;
    QRelChamadoModelo1Cli_Codigo: TIntegerField;
    QRelChamadoModelo1Cli_Nome: TWideStringField;
    QRelChamadoDetModelo1ChOco_Data: TDateField;
    QRelChamadoDetModelo1ChOco_HoraInicio: TTimeField;
    QRelChamadoDetModelo1ChOco_HoraFim: TTimeField;
    QRelChamadoDetModelo1ChOco_DescricaoSolucao: TStringField;
    QRelChamadoDetModelo1Usu_UserName: TWideStringField;
    QChamadoOcorrenciaCadChOco_TotalHoras: TFloatField;
    QChamadoOcorrenciaConsChOco_TotalHoras: TFloatField;
    QRelChamadoDetModelo1ChOco_TotalHoras: TFloatField;
    QRelChamadoModelo2: TFDQuery;
    dspRelChamadoModelo2: TDataSetProvider;
    QRelChamadoModelo3: TFDQuery;
    dspRelChamadoModelo3: TDataSetProvider;
    QRelChamadoModelo4: TFDQuery;
    dspRelChamadoModelo4: TDataSetProvider;
    QVisitaCadVis_TotalHoras: TFloatField;
    QVisitaCadVis_FormaPagto: TStringField;
    QRelVisitaModelo1: TFDQuery;
    QRelVisitaModelo3: TFDQuery;
    QRelVisitaModelo4: TFDQuery;
    dspRelVisitaModelo1: TDataSetProvider;
    dspRelVisitaModelo3: TDataSetProvider;
    dspRelVisitaModelo4: TDataSetProvider;
    QRelVisitaModelo2: TFDQuery;
    dspRelVisitaModelo2: TDataSetProvider;
    QVisitaCadVis_Valor: TCurrencyField;
    QChamadoCadCha_Modulo: TIntegerField;
    QChamadoCadCha_Produto: TIntegerField;
    QChamadoCadCha_UsuarioAtendeAtual: TIntegerField;
    QChamadoCadMod_Codigo: TIntegerField;
    QChamadoCadMod_Nome: TWideStringField;
    QChamadoCadProd_Codigo: TIntegerField;
    QChamadoCadProd_Nome: TWideStringField;
    QParametrosTitulosChamados: TFDQuery;
    dspParametrosTitulosChamados: TDataSetProvider;
    QChamadoQuadro1: TFDQuery;
    dspChamadoQuadro1: TDataSetProvider;
    QChamadoQuadro2: TFDQuery;
    dspChamadoQuadro2: TDataSetProvider;
    QChamadoQuadro3: TFDQuery;
    dspChamadoQuadro3: TDataSetProvider;
    QChamadoQuadro4: TFDQuery;
    dspChamadoQuadro4: TDataSetProvider;
    QChamadoQuadro5: TFDQuery;
    dspChamadoQuadro5: TDataSetProvider;
    QChamadoQuadro6: TFDQuery;
    dspChamadoQuadro6: TDataSetProvider;
    QUsuarioAcessoMenu: TFDQuery;
    dspUsuarioAcessoMenu: TDataSetProvider;
    QListarTabelas: TFDQuery;
    QListarCampos: TFDQuery;
    dspListarTabelas: TDataSetProvider;
    dspListarCampos: TDataSetProvider;
    QInstrucaoSQL: TFDQuery;
    dspInstrucaoSQL: TDataSetProvider;
    QSolicitaCadSol_UsuarioAtendeAtual: TIntegerField;
    QSolicitacaoQuadro1: TFDQuery;
    dspSolicitacaoQuadro1: TDataSetProvider;
    QSolicitacaoQuadro2: TFDQuery;
    dspSolicitacaoQuadro2: TDataSetProvider;
    QSolicitacaoQuadro3: TFDQuery;
    dspSolicitacaoQuadro3: TDataSetProvider;
    QSolicitacaoQuadro4: TFDQuery;
    dspSolicitacaoQuadro4: TDataSetProvider;
    QSolicitacaoQuadro5: TFDQuery;
    dspSolicitacaoQuadro5: TDataSetProvider;
    QSolicitacaoQuadro6: TFDQuery;
    dspSolicitacaoQuadro6: TDataSetProvider;
    QChamadoProblemaSolucao: TFDQuery;
    dspChamadoProblemaSolucao: TDataSetProvider;
    dspUsuarioPermissaoListar: TDataSetProvider;
    QSolicitacaoQuadro7: TFDQuery;
    dspSolicitacaoQuadro7: TDataSetProvider;
    QSolicitacaoQuadro8: TFDQuery;
    dspSolicitacaoQuadro8: TDataSetProvider;
    QSolicitacaoQuadro9: TFDQuery;
    dspSolicitacaoQuadro9: TDataSetProvider;
    QSolicitacaoQuadro10: TFDQuery;
    dspSolicitacaoQuadro10: TDataSetProvider;
    QSolicitacaoQuadro11: TFDQuery;
    dspSolicitacaoQuadro11: TDataSetProvider;
    QSolicitacaoQuadro12: TFDQuery;
    dspSolicitacaoQuadro12: TDataSetProvider;
    QUsuarioPermissaoListar: TFDQuery;
    QUsuarioCadUsu_ContaEmail: TIntegerField;
    QUsuarioCadCtaEm_Codigo: TIntegerField;
    QUsuarioCadCtaEm_Nome: TStringField;
    QContaEmailCad: TFDQuery;
    QContaEmailCadCtaEm_Id: TFDAutoIncField;
    QContaEmailCadCtaEm_Codigo: TIntegerField;
    QContaEmailCadCtaEm_Nome: TStringField;
    QContaEmailCadCtaEm_Email: TStringField;
    QContaEmailCadCtaEm_Senha: TStringField;
    QContaEmailCadCtaEm_SMTP: TStringField;
    QContaEmailCadCtaEm_Porta: TIntegerField;
    QContaEmailCadCtaEm_Ativo: TBooleanField;
    QContaEmailCons: TFDQuery;
    dspContaEmailCad: TDataSetProvider;
    dspContaEmailCons: TDataSetProvider;
    QContaEmailCadCtaEm_Autenticar: TBooleanField;
    QContaEmailCadCtaEm_AutenticarSSL: TBooleanField;
    QClienteEspCadUsu_Nome: TWideStringField;
    QBaseCadUsu_Nome: TWideStringField;
    QChamadoCadUsu_Nome: TWideStringField;
    QChamadoOcorrenciaCadUsu_Nome: TWideStringField;
    QChamadoOcorrenciaCadUsu_Nome1: TWideStringField;
    QChamadoOcorrenciaCadUsu_Nome2: TWideStringField;
    QChamadoOcorrenciaCadUsu_Nome3: TWideStringField;
    QChamadoOcorrenciaConsUsu_Nome: TWideStringField;
    QChamadoOcorrenciaConsUsu_Nome1: TWideStringField;
    QChamadoOcorrenciaConsUsu_Nome2: TWideStringField;
    QChamadoOcorrenciaConsUsu_Nome3: TWideStringField;
    QChamadoStatusUsu_Nome: TWideStringField;
    QSolicitaCadUAb_Nome: TWideStringField;
    QSolicitaCadAnal_Nome: TWideStringField;
    QSolicitaCadDesenv_Nome: TWideStringField;
    QSolicitaCronogramaCadUsu_Nome: TWideStringField;
    QSolicitaCronogramaConsUsu_Nome: TWideStringField;
    QSolicitaOcorrenciaTecnicaConsUsu_Nome: TWideStringField;
    QSolicitaOcorrenciaGeralConsUsu_Nome: TWideStringField;
    QVisitaCadUsu_Nome: TWideStringField;
    QVersaoCadUsu_Nome: TWideStringField;
    QStatusCadSta_NotificarCliente: TBooleanField;
    QStatusCadSta_NotificarSupervisor: TBooleanField;
    QDepartamentoEmail: TFDQuery;
    QDepartamentoEmailDepEm_Departamento: TIntegerField;
    QDepartamentoEmailDepEm_Email: TStringField;
    QDepartamentoEmailDepEm_Id: TFDAutoIncField;
    dspDepartamentoEmail: TDataSetProvider;
    QStatusCadSta_NotificarConsultor: TBooleanField;
    QStatusCadSta_NotificarRevenda: TBooleanField;
    QRevendaEmail: TFDQuery;
    QRevendaEmailRevEm_Id: TFDAutoIncField;
    QRevendaEmailRevEm_Revenda: TIntegerField;
    QRevendaEmailRevEm_Email: TStringField;
    dspRevendaEmail: TDataSetProvider;
    QStatusCadSta_Conceito: TStringField;
    QTipoCadTip_Conceito: TStringField;
    QClienteCadCli_Versao: TStringField;
    QSolicitaCadSol_Contato: TStringField;
    QChamadoOcorrenciaCadChOco_Versao: TStringField;
    QChamadoOcorrenciaConsChOco_Versao: TStringField;
    QChamadoCadCha_HoraAtendeAtual: TTimeField;
    QChamadoStatusChSta_Hora: TTimeField;
    QClienteEspCadCliEsp_Nome: TStringField;
    QChamadoCadCha_TipoMovimento: TIntegerField;
    QDepartamentoCadDep_AtividadeAbertura: TBooleanField;
    QDepartamentoCadDep_AtividadeStatus: TBooleanField;
    QDepartamentoCadDep_AtividadeQuadro: TBooleanField;
    QDepartamentoCadDep_AtividadeOcor: TBooleanField;
    QAtividadeQuadro1: TFDQuery;
    dspAtividadeQuadro1: TDataSetProvider;
    QAtividadeQuadro2: TFDQuery;
    dspAtividadeQuadro2: TDataSetProvider;
    QAtividadeQuadro3: TFDQuery;
    dspAtividadeQuadro3: TDataSetProvider;
    QAtividadeQuadro4: TFDQuery;
    dspAtividadeQuadro4: TDataSetProvider;
    QAtividadeQuadro5: TFDQuery;
    dspAtividadeQuadro5: TDataSetProvider;
    QAtividadeQuadro6: TFDQuery;
    dspAtividadeQuadro6: TDataSetProvider;
    QChamado_Ocorr_Colaborador: TFDQuery;
    QChamado_Ocorr_ColaboradorChaOCol_Id: TFDAutoIncField;
    QChamado_Ocorr_ColaboradorChaOCol_ChamadoOcorrencia: TIntegerField;
    QChamado_Ocorr_ColaboradorChaOCol_Usuario: TIntegerField;
    QChamado_Ocorr_ColaboradorChaOcol_HoraInicio: TTimeField;
    QChamado_Ocorr_ColaboradorChaOCol_HoraFim: TTimeField;
    QChamado_Ocorr_ColaboradorUsu_Nome: TWideStringField;
    dspChamado_Ocorr_Colaborador: TDataSetProvider;
    QChamado_Ocorr_ColaboradorUsu_Codigo: TIntegerField;
    QChamadoAnexo: TFDQuery;
    QSolicitacaoAnexo: TFDQuery;
    dspChamadoAnexo: TDataSetProvider;
    dspSolicitacaoAnexo: TDataSetProvider;
    QChamado_Ocorr_ColaboradorChaOcol_TotalHoras: TFloatField;
    QRelChamadoModelo1TotalHorasGeral: TFloatField;
    QDepartamentoCadDep_AgendamentoQuadro: TBooleanField;
    QRelChamadoModelo5: TFDQuery;
    dspRelChamadoModelo5: TDataSetProvider;
    QSolicitaCadSol_Descricao: TMemoField;
    QSolicitaCadSol_DescricaoLiberacao: TMemoField;
    QSolicitaOcorrenciaGeralConsSOcor_Descricao: TMemoField;
    QSolicitaOcorrenciaTecnicaConsSOcor_Descricao: TMemoField;
    spChamado: TFDStoredProc;
    spChamadoOcorrencia: TFDStoredProc;
    QSolicitaCadSol_VersaoId: TIntegerField;
    QSolicitaCadVer_Versao: TStringField;
    QVersaoCadVer_Versao: TStringField;
    QVersaoVersao: TFDQuery;
    dspVersaoVersao: TDataSetProvider;
    QVersaoDocumento: TFDQuery;
    dspVersaoDocumento: TDataSetProvider;
    QChamadoQuadro: TFDQuery;
    dspChamadoQuadro: TDataSetProvider;
    QSolicitacaoQuadro: TFDQuery;
    dspSolicitacaoQuadro: TDataSetProvider;
    QAtividadeQuadro: TFDQuery;
    dspAtividadeQuadro: TDataSetProvider;
    QClienteEmailConsCliEm_Cliente: TIntegerField;
    QClienteEmailConsCliEm_Email: TWideStringField;
    QClienteEmailConsCliEm_Id: TFDAutoIncField;
    QClienteEmailConsCliEm_Notificar: TBooleanField;
    QSolicitacaoRelatorio1: TFDQuery;
    QSolicitacaoRelatorio1Sol_Id: TFDAutoIncField;
    QSolicitacaoRelatorio1Ver_Id: TFDAutoIncField;
    QSolicitacaoRelatorio1Ver_Versao: TStringField;
    QSolicitacaoRelatorio1Sol_Data: TDateField;
    QSolicitacaoRelatorio1Sol_Hora: TTimeField;
    QSolicitacaoRelatorio1Sol_Tipo: TIntegerField;
    QSolicitacaoRelatorio1Sol_Nivel: TIntegerField;
    QSolicitacaoRelatorio1Cli_Nome: TWideStringField;
    QSolicitacaoRelatorio1Cli_Fantasia: TWideStringField;
    QSolicitacaoRelatorio1Tip_Nome: TWideStringField;
    QSolicitacaoRelatorio1Sta_Nome: TWideStringField;
    QSolicitacaoRelatorio1Mod_Nome: TWideStringField;
    QSolicitacaoRelatorio1Prod_Nome: TWideStringField;
    QSolicitacaoRelatorio1Sol_TempoPrevisto: TBCDField;
    QSolicitacaoRelatorio1Sol_PrevisaoEntrega: TDateField;
    QSolicitacaoRelatorio1TotalTempo: TFloatField;
    QSolicitacaoRelatorio1Analista: TWideStringField;
    QSolicitacaoRelatorio1Desenvolvedor: TWideStringField;
    dspSolicitacaoRelatorio1: TDataSetProvider;
    dsSolicitacaoRelatorio1: TDataSource;
    QSolicitacaoRelTempo1: TFDQuery;
    QSolicitacaoRelatorio1Sol_Titulo: TStringField;
    dspSolicitacaoRelTempo1: TDataSetProvider;
    QSolicitacaoRelTempo1Usu_Nome: TWideStringField;
    QSolicitacaoRelTempo1STemp_HoraFim: TTimeField;
    QSolicitacaoRelTempo1STemp_HoraInicio: TTimeField;
    QSolicitacaoRelTempo1STemp_TotalHoras: TFloatField;
    QRelChamadoModelo06: TFDQuery;
    dspRelChamadoModelo06: TDataSetProvider;
    QSolicitacaoTipo: TFDQuery;
    dspSolicitacaoTipo: TDataSetProvider;
    QClienteCadCli_Logradouro: TStringField;
    QClienteCadCli_Bairro: TStringField;
    QClienteCadCli_CEP: TStringField;
    QClienteCadCli_Cidade: TIntegerField;
    QClienteCadCid_Codigo: TIntegerField;
    QClienteCadCid_Nome: TStringField;
    QClienteCadCid_UF: TStringField;
    QClienteCadCli_Fone1: TStringField;
    QClienteCadCli_Fone2: TStringField;
    QClienteCadCli_Celular: TStringField;
    QClienteCadCli_FoneOutro: TStringField;
    QClienteCadCli_ContatoFinanceiro: TStringField;
    QClienteCadCli_ContatoFinanceiroFone: TStringField;
    QClienteCadCli_ContatoCompraVenda: TStringField;
    QClienteCadCli_ContatoCompraVendaFone: TStringField;
    QClienteCadCli_IE: TStringField;
    QClienteCadCli_RepreLegal: TStringField;
    QClienteCadCli_RepreLegalCPF: TStringField;
    QDepartamentoCadDep_MostrarAnexos: TBooleanField;
    dspSolicitacaoStatus: TDataSetProvider;
    QSolicitacaoStatus: TFDQuery;
    QVisitaCadVis_Versao: TStringField;
    QClienteRelatorio2: TFDQuery;
    dspClienteRelatorio2: TDataSetProvider;
    QClienteCadCli_EmpresaVinculada: TIntegerField;
    QVisitaCadVis_Latitude: TStringField;
    QVisitaCadVis_Longitude: TStringField;
    QClienteCadCli_Latitude: TStringField;
    QClienteCadCli_Longitude: TStringField;
    QClienteCadCli_Perfil: TStringField;
    QRelVisitaModelo8: TFDQuery;
    dspRelVisitaModelo8: TDataSetProvider;
    QRelChamadoModelo8: TFDQuery;
    dspRelChamadoModelo8: TDataSetProvider;
    QVersaoCadVer_Produto: TIntegerField;
    QVersaoCadProd_Codigo: TIntegerField;
    QVersaoCadProd_Nome: TWideStringField;
    QSolicitaOcorrenciaRegraCons: TFDQuery;
    QSolicitaOcorrenciaRegraConsSOcor_Anexo: TStringField;
    QSolicitaOcorrenciaRegraConsSOcor_Classificacao: TIntegerField;
    QSolicitaOcorrenciaRegraConsSOcor_Data: TDateField;
    QSolicitaOcorrenciaRegraConsSOcor_Descricao: TMemoField;
    QSolicitaOcorrenciaRegraConsSOcor_Hora: TTimeField;
    QSolicitaOcorrenciaRegraConsSOcor_Id: TFDAutoIncField;
    QSolicitaOcorrenciaRegraConsSOcor_Solicitacao: TIntegerField;
    QSolicitaOcorrenciaRegraConsSOcor_Tipo: TIntegerField;
    QSolicitaOcorrenciaRegraConsSOcor_UsuarioOperacional: TIntegerField;
    QSolicitaOcorrenciaRegraConsTip_Codigo: TIntegerField;
    QSolicitaOcorrenciaRegraConsTip_Nome: TWideStringField;
    QSolicitaOcorrenciaRegraConsUsu_Codigo: TIntegerField;
    QSolicitaOcorrenciaRegraConsUsu_Nome: TWideStringField;
    dspSolicitaOcorrenciaRegraCons: TDataSetProvider;
    QDepartamentoCadDep_SolicitaOcorRegra: TBooleanField;
    QDepartamentoCadDep_HoraAtendeInicial: TTimeField;
    QDepartamentoCadDep_HoraAtendeFinal: TTimeField;
    QSolicitaCadSol_Categoria: TIntegerField;
    QSolicitaCadCat_Codigo: TIntegerField;
    QSolicitaCadCat_Nome: TStringField;
    QSolicitacaoCategoria: TFDQuery;
    QSolicitacaoCategoriaSol_Id: TFDAutoIncField;
    QSolicitacaoCategoriaSol_Data: TDateField;
    QSolicitacaoCategoriaSol_Hora: TTimeField;
    QSolicitacaoCategoriaSol_Cliente: TIntegerField;
    QSolicitacaoCategoriaSol_UsuarioAbertura: TIntegerField;
    QSolicitacaoCategoriaSol_Modulo: TIntegerField;
    QSolicitacaoCategoriaSol_Produto: TIntegerField;
    QSolicitacaoCategoriaSol_Titulo: TStringField;
    QSolicitacaoCategoriaSol_Descricao: TMemoField;
    QSolicitacaoCategoriaSol_Nivel: TIntegerField;
    QSolicitacaoCategoriaSol_Versao: TStringField;
    QSolicitacaoCategoriaSol_Anexo: TStringField;
    QSolicitacaoCategoriaSol_Analista: TIntegerField;
    QSolicitacaoCategoriaSol_Status: TIntegerField;
    QSolicitacaoCategoriaSol_Tipo: TIntegerField;
    QSolicitacaoCategoriaSol_TempoPrevisto: TBCDField;
    QSolicitacaoCategoriaSol_PrevisaoEntrega: TDateField;
    QSolicitacaoCategoriaSol_Desenvolvedor: TIntegerField;
    QSolicitacaoCategoriaSol_DescricaoLiberacao: TMemoField;
    QSolicitacaoCategoriaSol_UsuarioAtendeAtual: TIntegerField;
    QSolicitacaoCategoriaSol_Contato: TStringField;
    QSolicitacaoCategoriaSol_VersaoId: TIntegerField;
    QSolicitacaoCategoriaSol_Categoria: TIntegerField;
    QSolicitacaoCategoriaCli_Nome: TWideStringField;
    QSolicitacaoCategoriaSta_Nome: TWideStringField;
    QSolicitacaoCategoriaMod_Nome: TWideStringField;
    QSolicitacaoCategoriaProd_Nome: TWideStringField;
    QSolicitacaoCategoriaUsuAbertura: TWideStringField;
    QSolicitacaoCategoriaUsuDesenv: TWideStringField;
    QSolicitacaoCategoriaUsuAnalista: TWideStringField;
    QSolicitacaoProblemaSolucao: TFDQuery;
    dspSolicitacaoProblemaSolucao: TDataSetProvider;
    QSolicitacaoProblemaSolucaoSol_Id: TFDAutoIncField;
    QSolicitacaoProblemaSolucaoSol_Data: TDateField;
    QSolicitacaoProblemaSolucaoSol_Hora: TTimeField;
    QSolicitacaoProblemaSolucaoSol_Descricao: TMemoField;
    QSolicitacaoProblemaSolucaoSol_DescricaoLiberacao: TMemoField;
    QSolicitacaoProblemaSolucaoDescricaoOco: TMemoField;
    QSolicitacaoProblemaSolucaoSOcor_Classificacao: TIntegerField;
    QSolicitacaoProblemaSolucaoDataOco: TDateField;
    QSolicitacaoProblemaSolucaoHoraOco: TTimeField;
    QChamadoCadCha_Origem: TIntegerField;
    QRelChamadoModelo9: TFDQuery;
    dspRelChamadoModelo9: TDataSetProvider;
    QUsuarioCadUsu_Telefone: TStringField;
    procedure dspRevendaCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspDepartamentoCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspUsuarioCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspProdutoCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspModuloCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspTipoCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspStatusCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspClienteCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspSolicitacaoCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspClienteModuloCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspSolicitaCronogramaCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspVisitaCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspBaseCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspParametrosCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspVersaoCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspClienteModuloConsUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspSolicitaCronogramaConsUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspSolicitaOcorrenciaGeralConsUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspSolicitaOcorrenciaTecnicaConsUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspChamadoCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspChamadoOcorrenciaCadUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspChamadoOcorrenciaConsUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspProdutoCadAfterUpdateRecord(Sender: TObject;
      SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
      UpdateKind: TUpdateKind);
  private
    function RetornaProximoId(ATabela: string): Integer;
    function VersaoUsuarioMesmoCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;
    function BaseConhUsuarioMesmoCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;
    function VisitaUsuarioMesmoCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;
    function AgendamentoUsuarioMesmoCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;
    function SolicitacaoUsuarioMesmoCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;
    function ChamadoUsuarioMesmoCadastro(AId, AIdUsuario, ATipoOperacao: Integer): Boolean;

    function ValidarUsuarioMesmoCadastro(APrograma, AId, AIdUsuario,
      ATipoOperacao: Integer): Boolean;
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;

    procedure AbrirConexao;
    procedure FecharConexao;

    procedure DuplicacaoRegistro(CampoWhere, CampoValor, Tabela: string);
//------------------------------------------------------------------------------
// Cadastro Padrao
//------------------------------------------------------------------------------
    procedure Novo(Programa, IdUsuario: Integer);
    procedure Excluir(Programa, IdUsuario, Id: Integer);
    function Editar(programa, Idusuario, Id: Integer): Boolean;
    procedure Filtrar(Programa: Integer; Campo, Texto, Ativo: string; Contem: Boolean = True);
    procedure FiltrarCodigo(Programa, Codigo: Integer);
    procedure LocalizarId(Programa, Id: integer);
    procedure LocalizarCodigo(Programa, Codigo: integer);
    procedure Salvar(Programa, IdUsuario: Integer);
    function ProximoId(Programa: Integer): TJSONNumber;
    function ProximoIdGeral(ATabela: string): Integer;
    function ProximoCodigo(Programa: Integer): TJSONNumber;
    procedure Relatorio(Programa, IdUsuario: integer);
//------------------------------------------------------------------------------
// Chamados
//------------------------------------------------------------------------------
    procedure FiltrarChamado(Filtro: TJSONValue; Campo, Texto: string;
      IdUsuario: Integer; Contem: Boolean);
    procedure FiltrarIdChamado(IdChamado: Integer);
    procedure LocalizarChamadoOcorrencia(IdChamado: Integer);
    procedure LocalizarChamadoStatus(idChamado: integer);
    procedure SalvarChamado(Programa, IdUsuario: Integer; ChamadoStatus: TJSONValue); overload;
    function  SalvarChamadoObj(IdUsuario: Integer; ChamadoVO: TJSONValue): TJSONNumber;

    procedure FiltrarChamadoQuadro1(IdUsuario: integer);
    procedure FiltrarChamadoQuadro2(IdUsuario: integer);
    procedure FiltrarChamadoQuadro3(IdUsuario: integer);
    procedure FiltrarChamadoQuadro4(IdUsuario: integer);
    procedure FiltrarChamadoQuadro5(IdUsuario: integer);
    procedure FiltrarChamadoQuadro6(IdUsuario: integer);
    function RetornaIdScope: Integer;
    function RetornaIdAtual(ATabela: string): Integer;
    procedure ChamadoAnexos(AIdChamado: Integer);
    procedure ChamadoQuadro(AIdUsuario, AIdRevenda: Integer);
    function ChamadoBuscarTotalHorasDoChamado(AIdChamado: Integer): Double;
    function ChamadoQuadroJSON(AIdUsuario, AIdRevenda: Integer): TJSONValue;
//------------------------------------------------------------------------------
// Atividades
//------------------------------------------------------------------------------
    procedure FiltrarAtividade(Filtro: TJSONValue; Campo, Texto: string;
      IdUsuario: Integer; Contem: Boolean);

    procedure FiltrarAtividadeQuadro1(IdUsuario: integer);
    procedure FiltrarAtividadeQuadro2(IdUsuario: integer);
    procedure FiltrarAtividadeQuadro3(IdUsuario: integer);
    procedure FiltrarAtividadeQuadro4(IdUsuario: integer);
    procedure FiltrarAtividadeQuadro5(IdUsuario: integer);
    procedure FiltrarAtividadeQuadro6(IdUsuario: integer);

//------------------------------------------------------------------------------
// Solicitacao
//------------------------------------------------------------------------------
    procedure FiltrarSolicitacaoId(IdSolicitacao: Integer);
    procedure FiltrarSolicitacaoQuadro1(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro2(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro3(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro4(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro5(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro6(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro7(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro8(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro9(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro10(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro11(IdUsuario: integer);
    procedure FiltrarSolicitacaoQuadro12(IdUsuario: integer);

    procedure FiltrarSolicitacao(Filtro: TJSONValue; Campo, Texto: string;
      IdUsuario: Integer; Contem: Boolean);
    procedure SalvarSolicitacao(Programa, IdUsuario: Integer; SolicitacaoStatus: TJSONValue);
    procedure LocalizarCronogramaIdSolicitacao(IdSolicitacao: Integer);
    procedure LocalizarCronogramaId(Id: Integer);
    procedure LocalizarOcorrenciaGeralIdSolicitacao(IdSolicitacao: Integer);
    procedure LocalizarOcorrenciaTecnicaIdSolicitacao(IdSolicitacao: Integer);
    procedure LocalizarOcorrenciaRegraIdSolicitacao(IdSolicitacao: Integer);
    procedure LocalizarSolicitacaoStatus(IdSolicitacao: integer);
    procedure SolicitacaoAnexos(AIdSolicitacao: Integer);
    procedure SolicitracaoQuadro(AIdUsuario: Integer);
    function SolicitacaoQuadroJSON(AIdUsuario: Integer): TJSONValue;
    function SolicitacaoPorCategoria(AIdCategoria, AIdUsuario: Integer) : TJSONValue;

    procedure SolicitacaoRelatorio(AModelo, AIdUsuario: Integer; AFiltro: TJSONValue;
      var AQtdeSolicitacao: Integer);
    function SolicitacaoObterPorId(Id: Integer): TJSONValue;
    procedure SolicitacaoListarProblemaSolucao(Filtro: TJSONValue; Texto: string; IdUsuario: Integer);
//------------------------------------------------------------------------------
// Solicitacao_Tempo
//------------------------------------------------------------------------------
    function  SolicitacaoTempoLocalizarId(AId: Integer): TJSONValue;
    procedure SolicitacaoTempoExcluir(AId: Integer);
    function  SolicitacaoTempoLocalizarPorSolicitacao(AIdSolicitacao: Integer): TJSONValue;
    procedure SolicitacaoTempoIniciar(AIdUsuarioLogado: Integer;
      ASolicitacaoTempoVO: TJSONValue);
    procedure SolicitacaoTempoFinalizar(AIdUsuarioLogado: Integer; ASolicitacaoTempoVO: TJSONValue;
      AValidarUsuario: Boolean=True);
    function  SolicitacaoTempoListarStatus: TJSONArray;
    function SolicitacaoTempoAtualAberta(AIdSolicitacao: Integer): Boolean;
    function SolicitacaoTempoSalvar(ASolicitacaoTempoVO: TJSONValue): TJSONNumber;
    function SolicitacaoPermissaoSolicitacaoTempo(IdUsuario: Integer): Boolean;
    function PermissaoConferenciaTempoGeral(IdUsuario: Integer): Boolean;

    function SolicitacaoTempoRetornarHorasAgrupadoPorStatus(AIdSolicitacao: Integer): TJSONValue;
    function SolicitacaoTempoFiltrarPorData(AData: string; AId, AIdUsuario: Integer): TJSONValue;
    procedure SolicitacaoIniciarTempo(AIdUsuarioLogado: Integer; ASolicitacaoViewModel: TJSONValue);
    procedure SolicitacaoFinalizarTempo(AIdUsuarioLogado: Integer; ASolicitacaoViewModel: TJSONValue; AValidarUsuario: Boolean=True);
//------------------------------------------------------------------------------
// Atividades
//------------------------------------------------------------------------------
    procedure AtividadeNovo(AIdUsuario: Integer);
    procedure AtividadeExcluir(AIdUsuario, AId: Integer);
    function AtividadeEditar(AIdUsuario, AId: Integer): Boolean;
    procedure AtividadeQuadro(AIdUsuario, AIdRevenda: Integer);
    function AtividadeQuadroJSON(AIdUsuario, AIdRevenda: Integer): TJSONValue;
//------------------------------------------------------------------------------
// Versao
//------------------------------------------------------------------------------
    procedure LocalizarVersao(AVersao: string);
//------------------------------------------------------------------------------
// Cliente
//------------------------------------------------------------------------------
    procedure FiltrarCliente(Filtro: TJSONValue; Programa, IdUsuario: Integer; Campo, Texto, Ativo: string; Contem: Boolean = True);
    procedure LocalizarCodigoCliente(Codigo, IdUsuario: integer);
    procedure LocalizarClienteModuloProduto(IdCliente, IdModulo: integer);
    function ClienteSalvar(ACliente: TJSONValue): TJSONNumber;
    function ClienteSalvarTeste(): TJSONValue;
    function ClienteLocaliarIdObj(AId: Integer; ADetalhes: Boolean = True): TJSONValue;
    function ClienteHistorico(AIdCliente: Integer): TJSONValue;
    procedure ClienteImportar(ACliente: TJSONValue);
    function ClienteRelatorios(AModelo, AIdUsuario: Integer; AFiltro: TJSONValue): string;
//------------------------------------------------------------------------------
// Usu�rios
//------------------------------------------------------------------------------
    function UsuarioUsuarioADM(AIdUsuario: Integer): Boolean;
    function ExisteUsuario(): Boolean;
    function ExportarUsuario(): TJSONValue;
//------------------------------------------------------------------------------
// outros
//------------------------------------------------------------------------------
    procedure UsuarioHorarioAcessoSistema(AUserName, APassword: string; AIdUsuario: Integer=0);
    procedure LocalizarUsuario(UserName, Password: string);
    procedure FiltrarUsuario(Filtro: TJSONValue; Campo, Texto, Ativo: string; Contem: Boolean = True);
    function RetornaNumeroSolicitacao(IdSolicitacao: Integer): TJSONNumber;
    procedure FiltrarVisita(Filtro: TJSONValue; Campo, Texto: string;
      IdUsuario: Integer; Contem: Boolean);
    procedure FiltrarVersao(Filtro: TJSONValue; Campo, Texto: string; Contem:
        Boolean);
    procedure FiltrarBaseConh(Filtro: TJSONValue; Campo, Texto: string;
      IdUsuario: Integer; Contem: Boolean);
    procedure FiltrarStatusPrograma(Campo, Texto, Ativo: string; StatusPrograma: Integer; Contem: Boolean = True);
    procedure LocalizarCodigoStatusPrograma(StatusPrograma, Codigo: integer);
    function ConferenciaFiltrarPorData(AData: string; AIdUsuario: Integer): TJSONValue;
    function VerificarQuadroTarefasEmAberto(AIdUsuario, APrograma: Integer): Boolean;
//------------------------------------------------------------------------------
// tipo
    procedure FiltrarTipoPrograma(Campo, Texto, Ativo: string; TipoPrograma: Integer; Contem: Boolean = True);
    procedure LocalizarCodigoTipoPrograma(TipoPrograma, Codigo: integer);
    function TipoRetornoUmRegistro(APrograma: Integer): TJSONValue;
//------------------------------------------------------------------------------
// Status
    function Status_LocalizarPorPrograma(ATipo: Integer): TJSONValue;
//------------------------------------------------------------------------------
    function LocalizarParametro(Codigo, Programa: Integer): string;
    procedure ListarTabelasBancoDados;
    procedure ListarTabelasCamposBancoDados(Tabela: string);
    procedure InstrucaoSQL(ComandoSQL: string; Tipo: integer);

    procedure ChamadoListarProblemaSolucao(Filtro: TJSONValue; Texto: string; IdUsuario: Integer);
    procedure AtividadeListarProblemaSolucao(Filtro: TJSONValue; Texto: string;
      IdUsuario: Integer);

    function ListaArquivosDiretorio(Diretorio, Extensao: string): TJSONArray;
    function BuscarCaminhoImportacaoXML: string;

    function RetornarChamadoEmails(IdChamado, IdUsuario, IdStatus: integer): string;
    function RetornarChamadoEmailCliente(idChamado, IdUsuario: integer): string;

    function RetornarVisitaEmails(IdVisita, IdUsuario, IdStatus: integer): string;
    function RetornarVisitaEmailCliente(idVisita, IdUsuario: integer): string;

    function RetornarSolicitacaoEmails(IdSolicitacao, IdUsuario, IdStatus: integer): string;
    function RetornarSolicitacaoEmailCliente(IdSolicitacao, IdUsuario: integer): string;

    procedure FiltrarRevenda(Campo, Texto, Ativo: string; IdUsuario: Integer; Contem: Boolean = True);
    procedure LocalizarCodigoRevenda(Codigo, IdUsuario: integer; AMensagem: Boolean = True);
    procedure FiltrarModuloCliente(IdCliente: Integer; Campo, Texto, Ativo: string; Contem: Boolean = True);
    procedure LocalizarModuloClienteCodigo(IdCliente, Codigo: integer);
    procedure FiltrarUsuarioRevenda(Filtro: TJSONValue; IdUsuario: Integer; Campo, Texto, Ativo: string; Contem: Boolean = True);
    procedure LocalizarCodigoUsuario(Codigo, IdUsuario: Integer; AMensagem: Boolean = True);
    procedure FiltrarRevendaEmail(IdRevenda: Integer);
    procedure UsuarioLocalizarNome(Nome: string);

    procedure ExecutarSQL(InstrucaoSQL: string);
    function SelectSQL(InstrucaoSQL: string): string;
//------------------------------------------------------------------------------
// Departamentos
//------------------------------------------------------------------------------
    function DepartamentoSalvar(ADepartamento: TJSONValue): TJSONNumber;
    procedure DepartamentoFiltrarId(AId: Integer);
    function DepartamentoMostrarAnexos(AIdUsuario: Integer): Boolean;
    function DepartamentoDuplicar(AId: Integer): TJSONNumber;
//------------------------------------------------------------------------------
// Usuario Permissoes
//------------------------------------------------------------------------------
    function UsuarioRetornaListaPermissao: TJSONArray;

//------------------------------------------------------------------------------
// parametros
//------------------------------------------------------------------------------
    procedure BuscarTitulosQuadrosChamados;
    procedure ParametrosAtualizarParametro(ACodigo, APrograma: Integer; AValor: string);
    function parametrosCaminhoAnexos(): string;
    function ParametrosCaminhoXMLClientes(): string;
    function ParametrosRevendaPadrao(AIdUsuario: Integer): TJSONNumber;
    procedure ParametrosExportarDadosBaseNova();
    procedure ParametrosImportarDadosBaseNova();
    function ListarParametros(): TJSONValue;
    function ValidarSIDomperClient(ADataHora: string): Boolean;
//------------------------------------------------------------------------------
// transacoes
//------------------------------------------------------------------------------
    procedure StartTransacao;
    procedure Commit;
    procedure Roolback;
//------------------------------------------------------------------------------
// Permissoes
//------------------------------------------------------------------------------
    procedure PermissaoAcessar(Programa, IdUsuario: integer);
    procedure PermissaoIncluir(Programa, IdUsuario: integer);
    procedure PermissaoEditar(Programa, IdUsuario: integer);
    procedure PermissaoExcluir(Programa, IdUsuario: integer);
    procedure PermissaoRelatorio(Programa, IdUsuario: integer);

    function PermissaoSolicitacoes(AIdUsuario: Integer): TJSONValue;
    function PermissaoSolicitacaoAbertura(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoAnalise(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaGeral(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnica(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoOcorrenciaRegra(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoStatus(IdUsuario: integer): Boolean;
    function PermissaoSolicitacaoQuadro(IdUsuario: integer): Boolean;
    function PermissaoRecadoQuadro(IdUsuario: integer): Boolean;

    function PermissoesChamado(AIdUsuario: Integer): TJSONValue;
    function PermissaoChamadoAbertura(IdUsuario: integer): Boolean;
    function PermissaoChamadoOcorrencia(IdUsuario: integer): Boolean;
    function PermissaoChamadoStatus(IdUsuario: integer): Boolean;
    function PermissaoChamadoQuadro(IdUsuario: integer): Boolean;
    function PermissaoChamadoOcorrenciaDataHora(IdUsuario: Integer; out MesmoUsuario: Boolean; Id: Integer=0): Boolean;
    function PermissaoChamadoOcorrenciaAlterar(IdUsuario: Integer; out Perfil: Integer; Id: Integer=0): Boolean;
    function PermissaoChamadoOcorrenciaExcluir(IdUsuario: Integer; Id: Integer=0): Boolean;

    function PermissoesAtividade(AIdUsuario: Integer): TJSONValue;
    function PermissaoAtividadeAbertura(IdUsuario: integer): Boolean;
    function PermissaoAtividadeOcorrencias(IdUsuario: integer): Boolean;
    function PermissaoAtividadeStatus(IdUsuario: integer): Boolean;
    function PermissaoAtividadeQuadro(IdUsuario: integer): Boolean;
    function PermissaoAtividadeOcorrencia(AIdUsuario: Integer; ATipo: Integer; AId: Integer): Boolean;
    function PermissaoAtividadeOcorrenciaDataHora(IdUsuario: Integer; out MesmoUsuario: Boolean; Id: Integer=0): Boolean;
    function PermissaoAtividadeOcorrenciaAlterar(IdUsuario: Integer; out Perfil: Integer; Id: Integer=0): Boolean;
    function PermissaoAtividadeOcorrenciaExcluir(IdUsuario: Integer; Id: Integer=0): Boolean;

    procedure UsuarioAcessoMenu(IdUsuario: integer);

    procedure ExcluirPermissaoUsuario(IdUsuario: Integer);

    function PermissaoSolicitacaoOcorrenciaGeralAlterar(IdUsuario: Integer; Id: Integer=0): Boolean;
    function PermissaoSolicitacaoOcorrenciaGeralExcluir(IdUsuario: Integer; Id: Integer=0): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnicaAlterar(IdUsuario: Integer; Id: Integer=0): Boolean;
    function PermissaoSolicitacaoOcorrenciaTecnicaExcluir(IdUsuario: Integer; Id: Integer=0): Boolean;
    function PermissaoSolicitacaoOcorrenciaRegraAlterar(IdUsuario: Integer; Id: Integer=0): Boolean;
    function PermissaoSolicitacaoOcorrenciaRegraExcluir(IdUsuario: Integer; Id: Integer=0): Boolean;


    function PermissaoOrcamentoAlteracaoSituacao(IdUsuario: Integer): Boolean;
    function PermissaoOrcamentoUsuario(IdUsuario: Integer): Boolean;

    procedure UsuarioPermissaoSalvar(IdUsuario: Integer; Sigla: string);
    function UsuarioPermissaoExportar(): TJSONValue;
//------------------------------------------------------------------------------
// Visitas
    function VisitaAtualizacaoVersao(AIdCliente, AIdTipo: Integer; AVersao: string): string;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Backup
//------------------------------------------------------------------------------
    procedure Backup(Destino: string);
//------------------------------------------------------------------------------
// Relat�rios de Chamados
//------------------------------------------------------------------------------
    procedure RelatorioChamado(Modelo, IdUsuario: Integer; Filtro: TJSONValue;
        Ordem: string; ATipo: Integer);

//------------------------------------------------------------------------------
// Relat�rios de Visitas
//------------------------------------------------------------------------------
    procedure RelatorioVisita(Modelo, IdUsuario: Integer; Filtro: TJSONValue;
        Ordem: string);
    function RelatorioVisita2(AModelo, AIdUsuario: Integer; AFiltro: TJSONValue): TJSONValue;
//------------------------------------------------------------------------------
// Relat�rios de Versoes
//------------------------------------------------------------------------------
    procedure RelatorioVersao(AModelo, AIdVersao: Integer; out AQtdeRetorno: Integer;
      AFiltro: TJSONValue);
    function VersaoBuscarStatusDesenvolvimento(): Integer;

  end;

var
  ServerMethods1: TServerMethods1;

implementation

{$R *.dfm}

uses System.StrUtils, uUsuario, uCliente, uSolicitacao,
  uClienteModulo, uSolicitacaoCronograma, uSolicitacaoOcorrencia,
  uSolicitacaoStatus, uStatus, uTipo, uVersao, uFiltroVersao,
  uChamado, uFiltroChamado, uChamadoOcorrencia, uChamadoStatusVO, uDMVisita,
  uParametros, uDepartamento, uFiltroUsuario, uUsuarioPermissao, uChamadoEmail,
  uSolicitacaoEmail, uRevenda, uModulo, uVisitaEmail, uDepartamentoVO,
  uClienteVO, uClienteEmailVO, uClienteEmail, uAgendamento, uParametroVO;

procedure TServerMethods1.AbrirConexao;
begin
  dm.AbrirConexao;
end;

function TServerMethods1.AgendamentoUsuarioMesmoCadastro(AId, AIdUsuario,
  ATipoOperacao: Integer): Boolean;
var
  obj: TAgendamento;
begin
  obj := TAgendamento.Create;
  try
    Result := obj.UsuarioIgualCadastro(AId, AIdUsuario, ATipoOperacao)
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.AtividadeEditar(AIdUsuario, AId: Integer): Boolean;
var
  bPermissao: Boolean;
begin
  try
    LocalizarId(CAtividadePrograma, AId);
    bPermissao := Editar(CAtividadePrograma, AIdUsuario, AId);

    if not bPermissao then
      bPermissao := ValidarUsuarioMesmoCadastro(CAtividadePrograma, AId, AIdusuario, 2);

    Result := bPermissao;
  except
    On E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
//  Result := Editar(CAtividadePrograma, AIdUsuario, AId);
end;

procedure TServerMethods1.AtividadeExcluir(AIdUsuario, AId: Integer);
begin
  Excluir(CAtividadePrograma, AIdUsuario, AId);
end;

procedure TServerMethods1.AtividadeListarProblemaSolucao(Filtro: TJSONValue;
Texto: string;  IdUsuario: Integer);
var
  obj: TChamado;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroChamado;
begin
  if Filtro is TJSONNull then
    Exit;

  if not Assigned(oFiltro) then
    oFiltro := TFiltroChamado.Create;

  UnMarshal := TJSONUnMarshal.Create;

  obj := TChamado.Create;
  try
    oFiltro := TFiltroChamado(UnMarshal.Unmarshal(Filtro));
    QChamadoProblemaSolucao.Close;
    QChamadoProblemaSolucao.SQL.Text := obj.ListarProblemaSolucao(oFiltro, Texto, IdUsuario, caAtividade);
  finally
    FreeAndNil(obj);
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.AtividadeNovo(AIdUsuario: Integer);
begin
  Novo(CAtividadePrograma, AIdUsuario);
end;

procedure TServerMethods1.AtividadeQuadro(AIdUsuario, AIdRevenda: Integer);
var
  objChamado: TChamado;
begin
  objChamado := TChamado.Create;
  try
    QAtividadeQuadro.Close;
    QAtividadeQuadro.SQL.Text := objChamado.RetornarAtividadeQuadro(AIdUsuario, AIdRevenda);
  finally
    FreeAndNil(objChamado);
  end;



//  QAtividadeQuadro.Close;
//  QAtividadeQuadro.Params[0].AsInteger := AIdUsuario;
//  QAtividadeQuadro.Params[1].AsInteger := AIdRevenda;
end;

function TServerMethods1.AtividadeQuadroJSON(AIdUsuario,
  AIdRevenda: Integer): TJSONValue;
var
  obj: TChamado;
  Lista: TObjectList<TChamadoQuadroViewModel>;
begin
  obj := TChamado.Create;
  AbrirConexao;
  try
    try
      QAtividadeQuadro.Close;
      QAtividadeQuadro.SQL.Text := obj.RetornarAtividadeQuadro(AIdUsuario, AIdRevenda);
      QAtividadeQuadro.Open();
    except on E: Exception do
      begin
        raise Exception.Create('AtividadeQuadroJson' + sLineBreak + E.Message);
      end;
    end;

    Lista := obj.ListarQuadro(QAtividadeQuadro);

    QChamadoQuadro.Close;
    Result := TConverte.ObjectToJSON<TListaChamadoQuadroViewModel>(Lista);
  finally
    FecharConexao;
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerMethods1.Backup(Destino: string);
begin
//  if not DirectoryExists(Destino) then
//    raise Exception.Create('Diret�rio n�o Encontrado');

  try
    spBackup.Close;
    spBackup.ParamByName('@Destino').AsString := Destino;
    spBackup.ExecProc();
  except
    On E: Exception do
    begin
      ShowMessage('Erro Backup. ' + E.ClassName + ' - ' + sLineBreak + E.Message);
    end;
  end;
end;

function TServerMethods1.BaseConhUsuarioMesmoCadastro(AId, AIdUsuario,
  ATipoOperacao: Integer): Boolean;
var
  obj: TBaseConhecimento;
begin
  obj := TBaseConhecimento.Create;
  try
    Result := obj.UsuarioIgualCadastro(AId, AIdUsuario, ATipoOperacao)
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.BuscarCaminhoImportacaoXML: string;
var
  obj: TParametros;
begin
  obj := TParametros.Create;
  try
    Result := obj.BuscarCaminhoImportacaoXML();
    if Result = '' then
      raise Exception.Create('Caminho dos Arquivos para Importa��o n�o Informado!');
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.BuscarTitulosQuadrosChamados;
var
  obj: TParametros;
begin
  obj := TParametros.Create;
  try
    obj.BuscarTitulosQuadrosChamados(QParametrosTitulosChamados);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.ChamadoAnexos(AIdChamado: Integer);
begin
  QChamadoAnexo.Close;
  QChamadoAnexo.Params[0].AsInteger := AIdChamado;
end;

function TServerMethods1.ChamadoBuscarTotalHorasDoChamado(
  AIdChamado: Integer): Double;
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    Result := obj.BuscarTotalHorasDoChamado(AIdChamado);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.ChamadoListarProblemaSolucao(Filtro: TJSONValue; Texto: string; IdUsuario: Integer);
var
  obj: TChamado;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroChamado;
begin
  if Filtro is TJSONNull then
    Exit;

  if not Assigned(oFiltro) then
    oFiltro := TFiltroChamado.Create;

  UnMarshal := TJSONUnMarshal.Create;
  obj := TChamado.Create;
  try
    oFiltro := TFiltroChamado(UnMarshal.Unmarshal(Filtro));

    QChamadoProblemaSolucao.Close;
    QChamadoProblemaSolucao.SQL.Text := obj.ListarProblemaSolucao(oFiltro, Texto, IdUsuario, caChamado);
  finally
    FreeAndNil(obj);
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.ChamadoQuadro(AIdUsuario, AIdRevenda: Integer);
var
  objChamado: TChamado;
begin
  objChamado := TChamado.Create;
  try
    QChamadoQuadro.Close;
    QChamadoQuadro.SQL.Text := objChamado.RetornarChamadoQuadro(AIdUsuario, AIdRevenda);
  finally
    FreeAndNil(objChamado);
  end;

//
//    QChamadoQuadro.Params[0].AsInteger := AIdUsuario;
//    QChamadoQuadro.Params[1].AsInteger := AIdRevenda;
end;

function TServerMethods1.ChamadoQuadroJSON(AIdUsuario,
  AIdRevenda: Integer): TJSONValue;
var
  obj: TChamado;
  Lista: TObjectList<TChamadoQuadroViewModel>;
begin
  FecharConexao;
  AbrirConexao;
  obj := TChamado.Create;
  try
    try
      QChamadoQuadro.Close;
      QChamadoQuadro.SQL.Text := obj.RetornarChamadoQuadro(AIdUsuario, AIdRevenda);
      QChamadoQuadro.Open();
    except
      ON E: Exception do
      begin
        raise Exception.Create('Erro ao Consultar Chamado Quadro.' + sLineBreak + E.Message);
      end;
    end;

    Lista := obj.ListarQuadro(QChamadoQuadro);

    QChamadoQuadro.Close;
    Result := TConverte.ObjectToJSON<TListaChamadoQuadroViewModel>(Lista);
  finally
    FecharConexao;
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;

//  obj := TChamado.Create;
//  try
//    try
//      bDestruir :=  False;
//      QChamadoQuadro.Close;
//      QChamadoQuadro.SQL.Text := obj.RetornarChamadoQuadro(AIdUsuario, AIdRevenda);
//      QChamadoQuadro.Open();
//
//      Lista := obj.ListarQuadro(QChamadoQuadro);
//      bDestruir := True;
//
//      QChamadoQuadro.Close;
//      Result := TConverte.ObjectToJSON<TListaChamadoQuadroViewModel>(Lista);
//
//    except
//      ON E: Exception do
//      begin
//        raise Exception.Create('Erro ao Consultar Chamado Quadro.' + sLineBreak + E.Message);
//      end;
//    end;
//  finally
//    FreeAndNil(obj);
//    if bDestruir then
//      FreeAndNil(Lista);
//  end;
end;

function TServerMethods1.ChamadoUsuarioMesmoCadastro(AId, AIdUsuario,
  ATipoOperacao: Integer): Boolean;
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    Result := obj.ChamadoUsduarioIgualCadastro(AId, AIdUsuario, ATipoOperacao)
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.ClienteHistorico(AIdCliente: Integer): TJSONValue;
var
  obj: TCliente;
  Lista: TObjectList<TChamadoOcorrenciaVO>;
begin
  obj := TCliente.create;
  try
    Lista := obj.HistoricoCliente(AIdCliente);
    Result := TConverte.ObjectToJSON(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerMethods1.ClienteImportar(ACliente: TJSONValue);
var
  obj: TLerXML;
  oObjVO: TClienteVO;
begin
  obj := TLerXML.Create;
  try
    oObjVO := TConverte.JSONToObject<TClienteVO>(ACliente);
    obj.GravarDadosClientes(oObjVO);
  finally
    FreeAndNil(obj);
    if Assigned(oObjVO) then
      FreeAndNil(oObjVO);
  end;
end;

function TServerMethods1.ClienteLocaliarIdObj(AId: Integer; ADetalhes: Boolean): TJSONValue;
var
  ObjVO: TClienteVO;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
  objCliente: TCliente;
  objEmail: TClienteEmail;
  ObjModulo: TClienteModulo;
begin
  // serializa objeto
  Marshal := TJSONMarshal.Create;
  objCliente := TCliente.Create;
  objEmail := TClienteEmail.Create;
  ObjModulo := TClienteModulo.Create;
  try
    try
      ObjVO := objCliente.LocalizarIdObj(QClienteCad, AId);

      if ADetalhes then
      begin
        objEmail.ListarDoCliente(ObjVO);
        ObjModulo.ListarDoCliente(ObjVO);
      end;

      oObjetoJSON := Marshal.Marshal(ObjVO);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;

    end;
    Result := oObjetoJSON;
  finally
    FreeAndNil(Marshal);
    FreeAndNil(ObjVO);
    FreeAndNil(objCliente);
    FreeAndNil(objEmail);
    FreeAndNil(ObjModulo);
  end;
end;

function TServerMethods1.ClienteRelatorios(AModelo, AIdUsuario: Integer;
  AFiltro: TJSONValue): string;
var
  obj: TCliente;
  Filtro: TFiltroCliente;
  sResultado: string;
begin
  obj := TCliente.Create;
  try
    try
      Filtro := TConverte.JSONToObject<TFiltroCliente>(AFiltro);
      QClienteRelatorio2.Close;
      QClienteRelatorio2.SQL.Text := obj.Relatorios(AModelo, AIdUsuario, Filtro);
//      raise Exception.Create(QClienteRelatorio2.SQL.Text);
      Result := '';
    except
      On E: Exception do
      begin
        Result := E.Message;
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(Filtro);
  end;
end;

function TServerMethods1.ClienteSalvar(ACliente: TJSONValue): TJSONNumber;
var
  obj: TCliente;
  oObjVO: TClienteVO;
  iResultado: Integer;
begin
  obj := TCliente.Create;
  try
    oObjVO := TConverte.JSONToObject<TClienteVO>(ACliente);
    iResultado := obj.Salvar(oObjVO);
    Result := TJSONNumber.Create(iResultado);
  finally
    FreeAndNil(obj);
    if Assigned(oObjVO) then
      FreeAndNil(oObjVO);
  end;
end;

function TServerMethods1.ClienteSalvarTeste: TJSONValue;
var
  ObjVO: TClienteVO;
  Marshal : TJSONMarshal;
  oObjetoJSON : TJSONValue;
begin
  // serializa objeto
  Marshal := TJSONMarshal.Create;
  ObjVO := TClienteVO.create;
  try
    ObjVO.Id := 1;
    ObjVO.RazaoSocial := 'teste';

    oObjetoJSON := Marshal.Marshal(ObjVO);
    Result := oObjetoJSON;
  finally
    FreeAndNil(Marshal);
    FreeAndNil(ObjVO);
  end;
end;

procedure TServerMethods1.Commit;
begin
  dm.Commit();
end;

function TServerMethods1.ConferenciaFiltrarPorData(AData: string;
  AIdUsuario: Integer): TJSONValue;
var
  obj: TSolicitacaoTempo;
  Lista: TObjectList<TSolicitacaoTempoVO>;
begin
  obj := TSolicitacaoTempo.Create;
  try
    Lista := obj.ConferenciaPorData(AData, AIdUsuario);
    Result := TConverte.ObjectToJSON<TListaSolicitacaoTempo>(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

function TServerMethods1.DepartamentoDuplicar(AId: Integer): TJSONNumber;
var
  obj: TDepartamento;
  iResultado: Integer;
begin
  obj := TDepartamento.Create;
  try
    iResultado := obj.Duplicar(AId);
    Result := TJSONNumber.Create(iResultado);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.DepartamentoFiltrarId(AId: Integer);
var
  obj: TDepartamento;
begin
  obj := TDepartamento.Create;
  try
    try
      QDepartamentoCons.Close;
      QDepartamentoCons.SQL.Text := obj.FiltarId(AId);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.DepartamentoMostrarAnexos(
  AIdUsuario: Integer): Boolean;
var
  Departamento: TDepartamento;
begin
  Departamento := TDepartamento.Create;
  try
    Result := Departamento.MostrarAnexos(AIdUsuario);
  finally
    FreeAndNil(Departamento);
  end;
end;

function TServerMethods1.DepartamentoSalvar(
  ADepartamento: TJSONValue): TJSONNumber;
var
  obj: TDepartamento;
  UnMarshal : TJSONUnMarshal;
  oObjVO: TDepartamentoVO;
  iResultado: Integer;
begin
  obj := TDepartamento.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oObjVO := TDepartamentoVO(UnMarshal.Unmarshal(ADepartamento));
    iResultado := obj.Salvar(oObjVO);
    Result := TJSONNumber.Create(iResultado);
  finally
    FreeAndNil(obj);
    FreeAndNil(oObjVO);
    FreeAndNil(UnMarshal);
  end;
end;

procedure TServerMethods1.dspBaseCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspChamadoCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspChamadoOcorrenciaCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspChamadoOcorrenciaConsUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspClienteCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspClienteModuloCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspClienteModuloConsUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspDepartamentoCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspModuloCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspParametrosCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspProdutoCadAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
begin
//  if UpdateKind = ukInsert then
//    DeltaDS.FieldByName('Prod_Id').NewValue := RetornaIdScope();

end;

procedure TServerMethods1.dspProdutoCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspRevendaCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspSolicitacaoCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspSolicitaCronogramaCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspSolicitaCronogramaConsUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspSolicitaOcorrenciaGeralConsUpdateError(
  Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError;
  UpdateKind: TUpdateKind; var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspSolicitaOcorrenciaTecnicaConsUpdateError(
  Sender: TObject; DataSet: TCustomClientDataSet; E: EUpdateError;
  UpdateKind: TUpdateKind; var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspStatusCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspTipoCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspUsuarioCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspVersaoCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.dspVisitaCadUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(E.Message);
end;

procedure TServerMethods1.DuplicacaoRegistro(CampoWhere, CampoValor, Tabela: string);
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := dm.Conexao;
    qry.SQL.Add('SELECT count(' + CampoWhere + ') FROM ' + Tabela +' WHERE ' + CampoWhere + ' = ''' + CampoValor + '''');
    qry.Open();

    if qry.Fields[0].AsInteger > 0 then
      raise Exception.Create('Duplica��o de Registro!');
  finally
    FreeAndNil(qry);
  end;
end;

function TServerMethods1.EchoString(Value: string): string;
begin
  Result := Value;
end;

function TServerMethods1.Editar(programa, Idusuario, Id: Integer): Boolean;
var
  obj: TCadastroPadrao;
  bPermissao: Boolean;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      LocalizarId(programa, Id);
      bPermissao := obj.Editar(Programa, IdUsuario);

      if bPermissao then
        bPermissao := ValidarUsuarioMesmoCadastro(programa, Id, Idusuario, 2);

      Result := bPermissao;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.Excluir(Programa, IdUsuario, Id: Integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      obj.Excluir(Programa, IdUsuario, Id);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.ExcluirPermissaoUsuario(IdUsuario: Integer);
var
  obj: TUsuarioPermissao;
begin
  obj := TUsuarioPermissao.Create;
  try
    obj.ExcluirLista(IdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.ExecutarSQL(InstrucaoSQL: string);
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(Self);
  try
    Qry.Connection := dm.Conexao;
    Qry.SQL.Text := InstrucaoSQL;
    Qry.ExecSQL();
  finally
    FreeAndNil(Qry);
  end;
end;

function TServerMethods1.ExisteUsuario: Boolean;
var
  obj: TUsuario;
begin
  obj := TUsuario.Create;
  try
    Result := obj.ExisteUsuario();
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.ExportarUsuario(): TJSONValue;
var
  obj: TUsuario;
  lista: TObjectList<TUsuarioVO>;
begin
  obj := TUsuario.Create;
  try
    lista := obj.Exportar();
    Result := TConverte.ObjectToJSON<TListaUsuario>(lista);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FecharConexao;
begin
  dm.FecharConexao;
end;

procedure TServerMethods1.Filtrar(Programa: Integer; Campo, Texto, Ativo: string; Contem: Boolean = True);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    case Programa of
        1: QChamadoCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        2: QVisitaCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        3: QSolicitaCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
        4: QVersaoCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
//        6: Result := TBaseConhecimento.Create;
      100: QRevendaCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
      101: QProdutoCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
      102: QModuloCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
      103: QClienteCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
      104: QUsuarioCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
      105: QDepartamentoCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
      106: QTipoCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
      107: QStatusCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
      109: QParametrosCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
      110: QContaEmailCons.SQL.Text := obj.Filtrar(Programa, Campo, Texto, Ativo, Contem);
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarAtividade(Filtro: TJSONValue; Campo,
  Texto: string; IdUsuario: Integer; Contem: Boolean);
var
  obj: TChamado;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroChamado;
begin
  if Filtro is TJSONNull then
    Exit;

//  oFiltro := TFiltroChamado.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroChamado(UnMarshal.Unmarshal(Filtro));

    QChamadoCons.Close;
    sComando := obj.FiltrarChamado(oFiltro, Campo, Texto, IdUsuario, Contem, caAtividade);
    QChamadoCons.SQL.Text := sComando;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
//    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarAtividadeQuadro1(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QAtividadeQuadro1.Close;
    QAtividadeQuadro1.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 25);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarAtividadeQuadro2(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QAtividadeQuadro1.Close;
    QAtividadeQuadro1.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 26);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarAtividadeQuadro3(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QAtividadeQuadro1.Close;
    QAtividadeQuadro1.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 27);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarAtividadeQuadro4(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QAtividadeQuadro1.Close;
    QAtividadeQuadro1.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 28);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarAtividadeQuadro5(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QAtividadeQuadro1.Close;
    QAtividadeQuadro1.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 29);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarAtividadeQuadro6(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QAtividadeQuadro1.Close;
    QAtividadeQuadro1.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 30);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarBaseConh(Filtro: TJSONValue; Campo,
  Texto: string; IdUsuario: Integer; Contem: Boolean);
var
  obj: TBaseConhecimento;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroBaseConhecimento;
begin
  if Filtro is TJSONNull then
    Exit;

  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroBaseConhecimento(UnMarshal.Unmarshal(Filtro));

    QBaseCons.Close;
    sComando := obj.FiltrarUsuario(oFiltro, Campo, Texto, IdUsuario, Contem);
    QBaseCons.SQL.Text := sComando;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.FiltrarChamado(Filtro: TJSONValue; Campo,
  Texto: string; IdUsuario: Integer; Contem: Boolean);
var
  obj: TChamado;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroChamado;
begin
  if Filtro is TJSONNull then
    Exit;

  if not Assigned(oFiltro) then
    oFiltro := TFiltroChamado.Create;

  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroChamado(UnMarshal.Unmarshal(Filtro));

    QChamadoCons.Close;
    sComando := obj.FiltrarChamado(oFiltro, Campo, Texto, IdUsuario, Contem, caChamado);
    QChamadoCons.SQL.Text := sComando;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.FiltrarChamadoQuadro1(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QChamadoQuadro1.Close;
    QChamadoQuadro1.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 3);
  finally
    FreeAndNil(obj);
  end;

//  QChamadoQuadro1.ParamByName('IdUsuario').AsInteger := IdUsuario;
end;

procedure TServerMethods1.FiltrarChamadoQuadro2(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QChamadoQuadro2.Close;
    QChamadoQuadro2.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 4);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarChamadoQuadro3(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QChamadoQuadro3.Close;
    QChamadoQuadro3.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 5);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarChamadoQuadro4(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QChamadoQuadro4.Close;
    QChamadoQuadro4.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 6);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarChamadoQuadro5(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QChamadoQuadro5.Close;
    QChamadoQuadro5.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 7);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarChamadoQuadro6(IdUsuario: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QChamadoQuadro6.Close;
    QChamadoQuadro6.SQL.Text := obj.RetornaSQLQuadro(IdUsuario, 8);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarCliente(Filtro: TJSONValue; Programa, IdUsuario: Integer; Campo,
  Texto, Ativo: string; Contem: Boolean);
var
  obj: TCliente;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroCliente;
begin
  if Filtro is TJSONNull then
    Exit;

  UnMarshal := TJSONUnMarshal.Create;
  try
//    oFiltro := (UnMarshal.Unmarshal(Filtro) as TFiltroCliente); // TFiltroCliente(UnMarshal.Unmarshal(Filtro));
    oFiltro := TFiltroCliente(UnMarshal.Unmarshal(Filtro));
    QClienteCons.Close;
    sComando := obj.FiltrarUsuario(oFiltro, Campo, Texto, Ativo, IdUsuario, Contem);
    QClienteCons.SQL.Text := sComando;

  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.FiltrarCodigo(Programa, Codigo: Integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    case Programa of
        1: QChamadoCons.SQL.Text    := obj.FiltrarCodigo(Programa, Codigo);
        2: QVisitaCons.SQL.Text     := obj.FiltrarCodigo(Programa, Codigo);
        3: QSolicitaCons.SQL.Text   := obj.FiltrarCodigo(Programa, Codigo);
        4: QVersaoCons.SQL.Text     := obj.FiltrarCodigo(Programa, Codigo);
        6: QBaseCons.SQL.Text       := obj.FiltrarCodigo(Programa, Codigo);
      100: QRevendaCons.SQL.Text    := obj.FiltrarCodigo(Programa, Codigo);
      101: QProdutoCons.SQL.Text    := obj.FiltrarCodigo(Programa, Codigo);
      102: QModuloCons.SQL.Text     := obj.FiltrarCodigo(Programa, Codigo);
      103: QClienteCons.SQL.Text    := obj.FiltrarCodigo(Programa, Codigo);
      104: QUsuarioCons.SQL.Text    := obj.FiltrarCodigo(Programa, Codigo);
      105: QDepartamentoCons.SQL.Text := obj.FiltrarCodigo(Programa, Codigo);
      106: QTipoCons.SQL.Text       := obj.FiltrarCodigo(Programa, Codigo);
      107: QStatusCons.SQL.Text     := obj.FiltrarCodigo(Programa, Codigo);
      109: QParametrosCons.SQL.Text := obj.FiltrarCodigo(Programa, Codigo);
      110: QContaEmailCons.SQL.Text := obj.FiltrarCodigo(Programa, Codigo);
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarIdChamado(IdChamado: Integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    QChamadoCons.Close;
    QChamadoCons.SQL.Text := obj.FiltrarId(IdChamado);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarModuloCliente(IdCliente: Integer; Campo, Texto,
  Ativo: string; Contem: Boolean);
var
  obj: TModulo;
begin
  obj := TModulo.Create;
  try
    QModuloCons.Close;
    QModuloCons.SQL.Text := obj.FiltrarCliente(IdCliente, Campo, Texto, Ativo, Contem);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarRevenda(Campo, Texto, Ativo: string;
  IdUsuario: Integer; Contem: Boolean);
var
  obj: TRevenda;
begin
  obj := TRevenda.Create;
  try
    QRevendaCons.Close;
    QRevendaCons.SQL.Text := obj.Filtrar(Campo, Texto, Ativo, IdUsuario, Contem);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarRevendaEmail(IdRevenda: Integer);
begin
  QRevendaEmail.Close;
  QRevendaEmail.Params[0].AsInteger := IdRevenda;
end;

procedure TServerMethods1.FiltrarSolicitacao(Filtro: TJSONValue; Campo, Texto: string;
  IdUsuario: Integer; Contem: Boolean);
var
  obj: TSolicitacao;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroSolicitacao;
begin
  if Filtro is TJSONNull then
    Exit;

    obj := TSolicitacao.Create;
//  oFiltro := TFiltroSolicitacao.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroSolicitacao(UnMarshal.Unmarshal(Filtro));

    QSolicitaCons.Close;
    sComando := obj.FiltrarUsuario(oFiltro, Campo, Texto, IdUsuario, Contem);
    QSolicitaCons.SQL.Text := sComando;
  finally
    FreeAndNil(obj);
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoId(IdSolicitacao: Integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitaCons.Close;
    QSolicitaCons.SQL.Text := obj.FiltrarId(IdSolicitacao);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro1(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro1.Close;
    QSolicitacaoQuadro1.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 12);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro10(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro10.Close;
    QSolicitacaoQuadro10.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 22);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro11(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro11.Close;
    QSolicitacaoQuadro11.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 23);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro12(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro12.Close;
    QSolicitacaoQuadro12.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 24);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro2(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro2.Close;
    QSolicitacaoQuadro2.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 13);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro3(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro3.Close;
    QSolicitacaoQuadro3.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 14);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro4(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro4.Close;
    QSolicitacaoQuadro4.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 15);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro5(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro5.Close;
    QSolicitacaoQuadro5.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 16);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro6(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro6.Close;
    QSolicitacaoQuadro6.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 17);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro7(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro7.Close;
    QSolicitacaoQuadro7.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 19);
  finally
    FreeAndNil(obj);
  end;
end;
procedure TServerMethods1.FiltrarSolicitacaoQuadro8(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro8.Close;
    QSolicitacaoQuadro8.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 20);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarSolicitacaoQuadro9(IdUsuario: integer);
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    QSolicitacaoQuadro9.Close;
    QSolicitacaoQuadro9.SQL.Text := obj.RetornarSQLQuadro(IdUsuario, 21);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarStatusPrograma(Campo, Texto, Ativo: string;
  StatusPrograma: Integer; Contem: Boolean);
var
  obj: TStatus;
begin
  obj := TStatus.Create;
  try
    QStatusCons.Close;
    QStatusCons.SQL.Text := obj.FiltrarPrograma(Campo, Texto, ativo,  StatusPrograma, Contem);
    QStatusCons.Open();
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarTipoPrograma(Campo, Texto, Ativo: string;
  TipoPrograma: Integer; Contem: Boolean);
var
  obj: TTipo;
begin
  obj := TTipo.Create;
  try
    QTipoCons.Close;
    QTipoCons.SQL.Text := obj.FiltrarPrograma(Campo, Texto, Ativo, TipoPrograma, Contem);
    QTipoCons.Open();
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.FiltrarUsuario(Filtro: TJSONValue; Campo, Texto,
  Ativo: string; Contem: Boolean);
var
  obj: TUsuario;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroUsuario;
begin
  if Filtro is TJSONNull then
    Exit;

//  oFiltro := TFiltroUsuario.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroUsuario(UnMarshal.Unmarshal(Filtro));
    QUsuarioCons.Close;
    sComando := obj.Filtrar(oFiltro, Campo, Texto, Ativo, Contem);
    QUsuarioCons.SQL.Text := sComando;

  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.FiltrarUsuarioRevenda(Filtro: TJSONValue; IdUsuario: Integer;
Campo, Texto, Ativo: string; Contem: Boolean);
var
  obj: TUsuario;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroUsuario;
begin
  if Filtro is TJSONNull then
    Exit;

//  oFiltro := TFiltroUsuario.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroUsuario(UnMarshal.Unmarshal(Filtro));
    QUsuarioCons.Close;
    sComando := obj.Filtrar(oFiltro, IdUsuario, Campo, Texto, Ativo, Contem);
    QUsuarioCons.SQL.Text := sComando;

  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.FiltrarVersao(Filtro: TJSONValue; Campo, Texto:
    string; Contem: Boolean);
var
  obj: TVersao;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroVersao;
begin
  if Filtro is TJSONNull then
    Exit;

//  oFiltro := TFiltroVersao.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroVersao(UnMarshal.Unmarshal(Filtro));

    QVersaoCons.Close;
    sComando := obj.FiltrarVersao(oFiltro, Campo, Texto, Contem);
    QVersaoCons.SQL.Text := sComando;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.FiltrarVisita(Filtro: TJSONValue; Campo,
  Texto: string; IdUsuario: Integer; Contem: Boolean);
var
  obj: TVisita;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroVisita;
begin
  if Filtro is TJSONNull then
    Exit;

//  oFiltro := TFiltroVisita.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroVisita(UnMarshal.Unmarshal(Filtro));

    QVisitaCons.Close;
    sComando := obj.FiltrarUsuario(oFiltro, Campo, Texto, IdUsuario, Contem);
    QVisitaCons.SQL.Text := sComando;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.InstrucaoSQL(ComandoSQL: string; Tipo: integer);
begin
  QInstrucaoSQL.Close;
  QInstrucaoSQL.SQL.Text := ComandoSQL;

  if Tipo = 1 then
    QInstrucaoSQL.ExecSQL();
end;

function TServerMethods1.ListaArquivosDiretorio(Diretorio,
  Extensao: string): TJSONArray;
var
  ListaArray: TJSONArray;
  obj: TArquivos;
begin
  obj := TArquivos.Create;
  try
    Result := obj.ListarArquivosDiretorio(Diretorio, Extensao);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.ListarParametros: TJSONValue;
var
  obj: TParametros;
  Lista: TObjectList<TParametroVO>;
begin
  obj := TParametros.Create;
  try
    Lista := obj.ListarParametros();
    Result := TConverte.ObjectToJSON<TListaParametros>(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerMethods1.ListarTabelasBancoDados;
begin
  QListarTabelas.Close;
end;

procedure TServerMethods1.ListarTabelasCamposBancoDados(Tabela: string);
begin
  QListarCampos.Close;
  QListarCampos.Params[0].AsString := Tabela;
end;

procedure TServerMethods1.LocalizarChamadoOcorrencia(IdChamado: Integer);
var
  obj: TChamadoOcorrencia;
begin
  obj := TChamadoOcorrencia.Create;
  try
    obj.LocalizarIdChamado(QChamadoOcorrenciaCons, IdChamado);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarChamadoStatus(idChamado: integer);
var
  obj: TChamado;
begin
  obj := TChamado.Create;
  try
    obj.LocalizarChamadoStatus(QChamadoStatus, idChamado);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarClienteModuloProduto(IdCliente,
  IdModulo: integer);
var
  obj: TClienteModulo;
  Id: Integer;
begin
  obj := TClienteModulo.Create;
  try
    Id := obj.LocalizarModuloProduto(IdCliente, IdModulo);
    LocalizarId(CClienteModuloPrograma, Id);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarCodigo(Programa, Codigo: integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    case Programa of
//        2: obj.LocalizarId(Programa, QVisitaCad, Id);
//        3: obj.LocalizarId(Programa, QSolicitaCad, Id);
//        4: obj.LocalizarId(Programa, QVersaoCad, Id);
//        6: obj.LocalizarId(Programa, QBaseCad, Id);
      100: obj.LocalizarCodigo(Programa, QRevendaCad, Codigo);
      101: obj.LocalizarCodigo(Programa, QProdutoCad, Codigo);
      102: obj.LocalizarCodigo(Programa, QModuloCad, Codigo);
      103: obj.LocalizarCodigo(Programa, QClienteCad, Codigo);
     1031: obj.LocalizarCodigo(Programa, QClienteEmailCons, Codigo);
     1033: obj.LocalizarCodigo(Programa, QClienteModuloCons, Codigo);
     1051: obj.LocalizarCodigo(Programa, QDepartamentoAcesso, Codigo);
      104: obj.LocalizarCodigo(Programa, QUsuarioCad, Codigo);
      105: obj.LocalizarCodigo(Programa, QDepartamentoCad, Codigo);
      106: obj.LocalizarCodigo(Programa, QTipoCad, Codigo);
      107: obj.LocalizarCodigo(Programa, QStatusCad, Codigo);
      108: obj.LocalizarCodigo(Programa, QClienteEspCons, Codigo);
      109: obj.LocalizarCodigo(Programa, QParametrosCad, Codigo);
      110: obj.LocalizarCodigo(Programa, QContaEmailCad, Codigo);
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarCodigoCliente(Codigo, IdUsuario: integer);
var
  obj: TCliente;
begin
  obj := TCliente.Create;
  try
    obj.LocalizarCodigoCliente(QClienteCad, Codigo, IdUsuario)
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarCodigoRevenda(Codigo, IdUsuario: integer; AMensagem: Boolean = True);
var
  obj: TRevenda;
begin
  obj := TRevenda.Create;
  try
    obj.LocalizarCodigo(QRevendaCad, Codigo, IdUsuario, AMensagem);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarCodigoStatusPrograma(StatusPrograma,
  Codigo: integer);
var
  obj: TStatus;
begin
  obj := TStatus.Create;
  try
    obj.LocalizarCodigo(QStatusCad, Codigo, StatusPrograma);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarCodigoTipoPrograma(TipoPrograma,
  Codigo: integer);
var
  obj: TTipo;
begin
  obj := TTipo.Create;
  try
    obj.LocalizarCodigo(QTipoCad, Codigo, TipoPrograma);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarCodigoUsuario(Codigo, IdUsuario: Integer; AMensagem: Boolean = True);
var
  obj: TUsuario;
begin
  obj := TUsuario.Create;
  try
    obj.LocalizarCodigo(QUsuarioCad, Codigo, IdUsuario, AMensagem);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarCronogramaId(Id: Integer);
var
  obj: TSolicitacaoCronograma;
begin
  obj := TSolicitacaoCronograma.Create;
  try
    obj.LocalizarId(QSolicitaCronogramaCad, Id);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarCronogramaIdSolicitacao(
  IdSolicitacao: Integer);
var
  obj: TSolicitacaoCronograma;
begin
  obj := TSolicitacaoCronograma.Create;
  try
    obj.LocalizarIdSolicitacao(QSolicitaCronogramaCons, IdSolicitacao);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarId(Programa, Id: integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    case Programa of
        1: obj.LocalizarId(Programa, QChamadoCad, Id);
        2: obj.LocalizarId(Programa, QVisitaCad, Id);
        3: obj.LocalizarId(Programa, QSolicitaCad, Id);
        4: obj.LocalizarId(Programa, QVersaoCad, Id);
        6: obj.LocalizarId(Programa, QBaseCad, Id);
      100: obj.LocalizarId(Programa, QRevendaCad, Id);
      101: obj.LocalizarId(Programa, QProdutoCad, Id);
      102: obj.LocalizarId(Programa, QModuloCad, Id);
      103: obj.LocalizarId(Programa, QClienteCad, Id);
     1031: obj.LocalizarId(Programa, QClienteEmailCons, Id);
     1033: obj.LocalizarId(Programa, QClienteModuloCad, Id);
      104: obj.LocalizarId(Programa, QUsuarioCad, Id);
      105: obj.LocalizarId(Programa, QDepartamentoCad, Id);
      106: obj.LocalizarId(Programa, QTipoCad, Id);
      107: obj.LocalizarId(Programa, QStatusCad, Id);
      108: obj.LocalizarId(Programa, QClienteEspCad, Id);
      109: obj.LocalizarId(Programa, QParametrosCad, Id);
      110: obj.LocalizarId(Programa, QContaEmailCad, Id);
      111: obj.LocalizarId(Programa, QChamadoCad, Id);
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarModuloClienteCodigo(IdCliente,
  Codigo: integer);
var
  obj: TModulo;
begin
  obj := TModulo.Create;
  try
    obj.LocalizarClienteCodigo(QModuloCad, IdCliente, Codigo);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarOcorrenciaGeralIdSolicitacao(
  IdSolicitacao: Integer);
var
  obj: TSolicitacaoOcorrencia;
begin
  obj := TSolicitacaoOcorrencia.Create;
  try
    obj.LocalizarIdSolicitacao(QSolicitaOcorrenciaGeralCons, IdSolicitacao);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarOcorrenciaRegraIdSolicitacao(
  IdSolicitacao: Integer);
var
  obj: TSolicitacaoOcorrencia;
begin
  obj := TSolicitacaoOcorrencia.Create;
  try
    obj.LocalizarIdSolicitacao(QSolicitaOcorrenciaRegraCons, IdSolicitacao);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarOcorrenciaTecnicaIdSolicitacao(
  IdSolicitacao: Integer);
var
  obj: TSolicitacaoOcorrencia;
begin
  obj := TSolicitacaoOcorrencia.Create;
  try
    obj.LocalizarIdSolicitacao(QSolicitaOcorrenciaTecnicaCons, IdSolicitacao);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.LocalizarParametro(Codigo, Programa: Integer): string;
var
  obj: TParametros;
begin
  obj := TParametros.Create;
  try
    Result := obj.LocalizarParametro(Codigo, Programa);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarSolicitacaoStatus(IdSolicitacao: integer);
var
  obj: TSolicitacaoStatusNegocio;
begin
  obj := TSolicitacaoStatusNegocio.Create;
  try
    obj.LocalizarIdSolicitacao(QSolicitaStatusCons, IdSolicitacao);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.LocalizarUsuario(UserName, Password: string);
var
  usuario: TUsuario;
begin
  usuario := TUsuario.Create;
  try
    usuario.LocalizarUsuario(QUsuariocad, UserName, Password);
  finally
    FreeAndNil(usuario);
  end;
end;

procedure TServerMethods1.LocalizarVersao(AVersao: string);
var
  obj: TVersao;
  Id: Integer;
begin
  obj := TVersao.Create;
  try
    Id := obj.LocalizarVersao(AVersao);
    obj.LocalizarId(QVersaoCad, Id);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.Novo(Programa, IdUsuario: Integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      obj.Novo(Programa, IdUsuario);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.ParametrosAtualizarParametro(ACodigo,
  APrograma: Integer; AValor: string);
var
  obj: TParametros;
begin
  obj := TParametros.Create;
  try
    obj.AtualizarParametro(ACodigo, APrograma, AValor);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.parametrosCaminhoAnexos: string;
var
  parametros: TParametros;
begin
  parametros := TParametros.Create;
  try
    Result := parametros.CaminhoAnexos();
  finally
    FreeAndNil(parametros);
  end;
end;

function TServerMethods1.ParametrosCaminhoXMLClientes: string;
var
  parametros: TParametros;
begin
  parametros := TParametros.Create;
  try
    Result := parametros.BuscarCaminhoImportacaoXML();
  finally
    FreeAndNil(parametros);
  end;
end;

procedure TServerMethods1.ParametrosExportarDadosBaseNova;
var
  Param: TParametros;
  Dep: TDepartamento;
  Tipo: TTipo;
  Status: TStatus;
begin
  Param := TParametros.Create;
  Dep := TDepartamento.Create;
  Tipo := TTipo.Create;
  Status := TStatus.Create;
  try
    Param.Exportar();
    Dep.Exportar();
    Tipo.Exportar();
    Status.Exportar();
  finally
    FreeAndNil(Param);
    FreeAndNil(Dep);
    FreeAndNil(Tipo);
    FreeAndNil(Status);
  end;
end;

procedure TServerMethods1.ParametrosImportarDadosBaseNova;
var
  Dep: TDepartamento;
  Param: TParametros;
  usuario: TUsuario;
  bUsuarioExiste: Boolean;
  Tipo: TTipo;
  Status: TStatus;
begin
  Dep := TDepartamento.Create;
  Param := TParametros.Create;
  usuario := TUsuario.Create;
  Tipo := TTipo.Create;
  Status := TStatus.Create;
  try
    StartTransacao();
    try
      Dep.Importar();
      Param.Importar();
      Tipo.Importar();
      Status.Importar();
      bUsuarioExiste := usuario.ExisteUsuario();
      if bUsuarioExiste = False then
        usuario.IncluirManualmente();
      Commit();
    except
      On E: Exception do
      begin
        Roolback();
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Dep);
    FreeAndNil(Param);
    FreeAndNil(usuario);
    FreeAndNil(Tipo);
    FreeAndNil(Status);
  end;
end;

function TServerMethods1.ParametrosRevendaPadrao(AIdUsuario: Integer): TJSONNumber;
var
  parametros: TParametros;
  Usuario: TUsuario;
  iResultado: Integer;
  model: TUsuarioVO;
begin
{
  se o usuario tiver revenda no cadastro de usuarios, ent�o retorna zero
  se o usuario nao tiver revenda no cadastro de usuario, ent�o pega a revenda padrao nos parametros
}
  parametros := TParametros.Create;
  Usuario := TUsuario.Create;
  try
    model := Usuario.LocalizarId(AIdUsuario);

    if model.IdRevenda = 0 then
      iResultado := StrToIntDef(parametros.RevendaPadrao(),0)
    else
      iResultado := 0;

    Result := TJSONNumber.Create(iResultado);
  finally
    FreeAndNil(parametros);
    FreeAndNil(Usuario);
    FreeAndNil(model);
  end;
end;

procedure TServerMethods1.PermissaoAcessar(Programa, IdUsuario: integer);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.PermissaoAcessar(Programa, IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoAtividadeAbertura(
  IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoAtividadeAbertura(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoAtividadeOcorrencias(
  IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoAtividadeOcorrencia(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoAtividadeOcorrencia(
  AIdUsuario: Integer; ATipo: Integer; AId: Integer): Boolean;
var
  Usuario: TUsuario;
  Chamado: TChamado;
  bPermissao: Boolean;
begin
  Chamado := TChamado.Create;
  try
    bPermissao := Chamado.OcorrenciaUsuarioIgualCadastro(AId, AIdUsuario, 2);
  finally
    FreeAndNil(Chamado);
  end;

  Result := bPermissao;

  if bPermissao then
    Exit;

  Usuario := TUsuario.Create;
  try
    case ATipo of
      1: Result := Usuario.PermissaoAtividadeOcorrenciaDataHora(AIdUsuario);
      2: Result := Usuario.PermissaoAtividadeOcorrenciaAlterar(AIdUsuario);
      3: Result := Usuario.PermissaoAtividadeOcorrenciaExcluir(AIdUsuario);
    end;
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoAtividadeOcorrenciaAlterar(IdUsuario: Integer;
  out Perfil: Integer; Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Chamado: TChamado;
  bPermissao: Boolean;
  bUsuarioADM: Boolean;
  bUsuarioIgualChamado: Boolean;
begin
{
  Parametro Perfil:
  0 - Sem permissao
  1 - Libera todos os campos
  2 - Libera todos, menos data e hora
  3 - libera s� data e hora
}


  Result := True;
  Usuario := TUsuario.Create;
  Chamado := TChamado.Create;
  try
    Result := Usuario.PermissaoAtividadeOcorrenciaAlterar(IdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(IdUsuario);

      if Result = False then
      begin
        Result := True;
        if Id > 0 then
          Result := Chamado.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 2);
      end;
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Chamado);
  end;


//  Usuario := TUsuario.Create;
//  try
//    bUsuarioADM := Usuario.UsuarioADM(IdUsuario);
//    bPermissao  := Usuario.PermissaoAtividadeOcorrenciaAlterar(IdUsuario);
//  finally
//    FreeAndNil(Usuario);
//  end;
//
//  if bUsuarioADM then
//  begin
//    Result := True;
//    Perfil := 1;
//  end
//  else begin
//    Chamado := TChamado.Create;
//    try
//      bUsuarioIgualChamado  := Chamado.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 2);
//      bPermissao            := PermissaoAtividadeOcorrenciaDataHora(IdUsuario, Id);
//
//      if bUsuarioIgualChamado then
//      begin
//        if bPermissao then
//          Perfil := 1
//        else
//          Perfil := 2;
//      end
//      else begin
//        if bPermissao then
//          Perfil := 2
//        else
//          Perfil := 0;
//      end;
//
//      Result := bUsuarioIgualChamado;
//    finally
//      FreeAndNil(Chamado);
//    end;
//  end;
end;

function TServerMethods1.PermissaoAtividadeOcorrenciaDataHora(IdUsuario: Integer;
  out MesmoUsuario: Boolean; Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Chamado: TChamado;
//  bUsuarioADM: Boolean;
//  bUsuarioIgualAtividade: Boolean;
//  MesmoUsuario: Boolean;
begin
  Usuario := TUsuario.Create;
  Chamado := TChamado.Create;
  try
    MesmoUsuario  := Chamado.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 2);
    Result := Usuario.UsuarioADM(IdUsuario);

    if Result = False then
      Result := Usuario.PermissaoAtividadeOcorrenciaDataHora(IdUsuario)
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Chamado);
  end;



//  Usuario := TUsuario.Create;
//  Chamado := TChamado.Create;
//  try
//    MesmoUsuario  := Chamado.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 2);
//    Result := Usuario.UsuarioADM(IdUsuario);
//
//    if Result = False then
//      Result := Usuario.PermissaoAtividadeOcorrenciaDataHora(IdUsuario)
//  finally
//    FreeAndNil(Usuario);
//    FreeAndNil(Chamado);
//  end;



//  Chamado := TChamado.Create;
//  Usuario := TUsuario.Create;
//  try
//    bUsuarioADM := Usuario.UsuarioADM(IdUsuario);
//
//    if bUsuarioADM then
//      Result := True
//    else begin
//      bUsuarioIgualAtividade  := Chamado.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 2);
//      if bUsuarioIgualAtividade then
//        Result := Usuario.PermissaoAtividadeOcorrenciaDataHora(IdUsuario)
//      else
//        Result := False;
//    end;
//  finally
//    FreeAndNil(Usuario);
//    FreeAndNil(Chamado);
//  end;
end;

function TServerMethods1.PermissaoAtividadeOcorrenciaExcluir(IdUsuario,
  Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Chamado: TChamado;
//  bPermissao: Boolean;
//  bUsuarioADM: Boolean;
//  bUsuarioIgual: Boolean;
begin
  Result := True;

  Usuario := TUsuario.Create;
  Chamado := TChamado.Create;
  try
    Result := Usuario.PermissaoAtividadeOcorrenciaExcluir(IdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(IdUsuario);

      if Result = False then
        Result := Chamado.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 3);
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Chamado);
  end;




//  Usuario := TUsuario.Create;
//  try
//    bUsuarioADM := Usuario.UsuarioADM(IdUsuario);
//    bPermissao := Usuario.PermissaoAtividadeOcorrenciaExcluir(IdUsuario);
//  finally
//    FreeAndNil(Usuario);
//  end;
//
//  if bUsuarioADM then
//  begin
//    Result := True;
//    Exit;
//  end;
//
//  Chamado := TChamado.Create;
//  try
//    bUsuarioIgual := Chamado.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 3);
//  finally
//    FreeAndNil(Chamado);
//  end;
//
//  if (bUsuarioIgual) then
//  begin
//    if bPermissao then
//      Result := True
//    else
//      Result := False;
//  end
//  else
//    Result := False;
end;

function TServerMethods1.PermissaoAtividadeQuadro(IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoAtividadeQuadro(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoAtividadeStatus(IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoAtividadeStatus(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoChamadoAbertura(IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoChamadoAbertura(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoChamadoOcorrencia(
  IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoChamadoOcorrencia(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoChamadoOcorrenciaAlterar(
  IdUsuario: Integer; out Perfil: Integer; Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Chamado: TChamado;
begin
{
  Parametro Perfil:
  0 - Sem permissao
  1 - Libera todos os campos
  2 - Libera todos, menos data e hora
  3 - libera s� data e hora
}

  Result := True;
  Usuario := TUsuario.Create;
  Chamado := TChamado.Create;
  try
    Result := Usuario.PermissaoChamadoOcorrenciaAlterar(IdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(IdUsuario);

      if Result = False then
      begin
        Result := True;
        if Id > 0 then
          Result := Chamado.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 2);
      end;
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Chamado);
  end;
end;

function TServerMethods1.PermissaoChamadoOcorrenciaDataHora(
  IdUsuario: Integer; out MesmoUsuario: Boolean; Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Chamado: TChamado;
begin
  Usuario := TUsuario.Create;
  Chamado := TChamado.Create;
  try
    MesmoUsuario  := Chamado.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 2);
    Result := Usuario.UsuarioADM(IdUsuario);

    if Result = False then
      Result := Usuario.PermissaoChamadoOcorrenciaDataHora(IdUsuario)
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Chamado);
  end;
end;

function TServerMethods1.PermissaoChamadoOcorrenciaExcluir(
  IdUsuario: Integer; Id: Integer=0): Boolean;
var
  Usuario: TUsuario;
  Chamado: TChamado;
begin
  Result := True;

  Usuario := TUsuario.Create;
  Chamado := TChamado.Create;
  try
    Result := Usuario.PermissaoChamadoOcorrenciaExcluir(IdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(IdUsuario);

      if Result = False then
        Result := Chamado.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 3);
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Chamado);
  end;
end;

function TServerMethods1.PermissaoChamadoQuadro(IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoChamadoQuadro(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoChamadoStatus(IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoChamadoStatus(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoConferenciaTempoGeral(
  IdUsuario: Integer): Boolean;
var
  obj: TUsuario;
begin
  obj := TUsuario.Create;
  try
    Result := obj.PermissaoConferenciaTempoGeral(IdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.PermissaoEditar(Programa, IdUsuario: integer);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.PermissaoEditar(Programa, IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TServerMethods1.PermissaoExcluir(Programa, IdUsuario: integer);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.PermissaoExcluir(Programa, IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TServerMethods1.PermissaoIncluir(Programa, IdUsuario: integer);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.PermissaoIncluir(Programa, IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoOrcamentoAlteracaoSituacao(IdUsuario: Integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.UsuarioADM(IdUsuario);

    if Result = False then
      Result := Usuario.PermissaoOrcamentoAlteracaoSituacao(IdUsuario);

  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoOrcamentoUsuario(IdUsuario: Integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.UsuarioADM(IdUsuario);

    if Result = False then
      Result := Usuario.PermissaoOrcamentoUsuario(IdUsuario);

  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoRecadoQuadro(IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoRecadoQuadro(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TServerMethods1.PermissaoRelatorio(Programa, IdUsuario: integer);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.PermissaoRelatorio(Programa, IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoSolicitacoes(AIdUsuario: Integer): TJSONValue;
var
  Usuario: TUsuario;
  PermissaoSolicitacaoVO: TPermissaoSolicitacaoVO;
begin

  PermissaoSolicitacaoVO := TPermissaoSolicitacaoVO.Create;
  Usuario := TUsuario.Create;
  try
    PermissaoSolicitacaoVO.Abertura := Usuario.PermissaoSolicitacaoAbertura(AIdUsuario);
    PermissaoSolicitacaoVO.Analise := Usuario.PermissaoSolicitacaoAnalise(AIdUsuario);
    PermissaoSolicitacaoVO.OcorrenciaGeral := Usuario.PermissaoSolicitacaoOcorrenciaGeral(AIdUsuario);
    PermissaoSolicitacaoVO.OcorrenciaTecnica := Usuario.PermissaoSolicitacaoOcorrenciaTecnica(AIdUsuario);
    PermissaoSolicitacaoVO.OcorrenciaRegra := Usuario.PermissaoSolicitacaoOcorrenciaRegra(AIdUsuario);
    PermissaoSolicitacaoVO.StatusSolicitacao := Usuario.PermissaoSolicitacaoStatus(AIdUsuario);
    PermissaoSolicitacaoVO.Tempo :=  Usuario.PermissaoSolicitacaoTempo(AIdUsuario);
    PermissaoSolicitacaoVO.ConfTempoGeral := Usuario.PermissaoConferenciaTempoGeral(AIdUsuario);

    Result := TConverte.ObjectToJSON<TPermissaoSolicitacaoVO>(PermissaoSolicitacaoVO);
 finally
    FreeAndNil(Usuario);
    FreeAndNil(PermissaoSolicitacaoVO);
  end;
end;

function TServerMethods1.PermissoesAtividade(AIdUsuario: Integer): TJSONValue;
var
  Usuario: TUsuario;
  PermissaoAtividadeVO: TPermissaoAtividadeVO;
begin
  PermissaoAtividadeVO := TPermissaoAtividadeVO.Create;
  Usuario := TUsuario.Create;
  try
    PermissaoAtividadeVO.Abertura := Usuario.PermissaoAtividadeAbertura(AIdUsuario);
    PermissaoAtividadeVO.Ocorrencia := Usuario.PermissaoAtividadeOcorrencia(AIdUsuario);
    PermissaoAtividadeVO.Status := Usuario.PermissaoAtividadeStatus(AIdUsuario);
    Result := TConverte.ObjectToJSON<TPermissaoAtividadeVO>(PermissaoAtividadeVO);
 finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissoesChamado(AIdUsuario: Integer): TJSONValue;
var
  Usuario: TUsuario;
  PermissaoChamadoVO: TPermissaoChamadoVO;
begin
  PermissaoChamadoVO := TPermissaoChamadoVO.Create;
  Usuario := TUsuario.Create;
  try
    PermissaoChamadoVO.Abertura := Usuario.PermissaoChamadoAbertura(AIdUsuario);
    PermissaoChamadoVO.Ocorrencia := Usuario.PermissaoChamadoOcorrencia(AIdUsuario);
    PermissaoChamadoVO.Status := Usuario.PermissaoChamadoStatus(AIdUsuario);
    Result := TConverte.ObjectToJSON<TPermissaoChamadoVO>(PermissaoChamadoVO);
 finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoAbertura(
  IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoSolicitacaoAbertura(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoAnalise(
  IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoSolicitacaoAnalise(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoOcorrenciaGeral(
  IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoSolicitacaoOcorrenciaGeral(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoOcorrenciaGeralAlterar(
  IdUsuario: Integer; Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Solicitacao: TSolicitacao;
begin
  Result := True;

  Usuario := TUsuario.Create;
  Solicitacao := TSolicitacao.Create;
  try
    Result := Usuario.PermissaoSolicitacaoOcorrenciaGeralAlterar(IdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(IdUsuario);

      if Result = False then
      begin
        Result := True;
        if Id > 0 then
          Result := Solicitacao.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 2);
      end;
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Solicitacao);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoOcorrenciaGeralExcluir(
  IdUsuario: Integer; Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Solicitacao: TSolicitacao;
begin
  Result := True;

  Usuario := TUsuario.Create;
  Solicitacao := TSolicitacao.Create;
  try
    Result := Usuario.PermissaoSolicitacaoOcorrenciaGeralExcluir(IdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(IdUsuario);

      if Result = False then
        Result := Solicitacao.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 3);
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Solicitacao);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoOcorrenciaRegra(
  IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoSolicitacaoOcorrenciaRegra(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoOcorrenciaRegraAlterar(IdUsuario,
  Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Solicitacao: TSolicitacao;
begin
  Result := True;

  Usuario := TUsuario.Create;
  Solicitacao := TSolicitacao.Create;
  try
    Result := Usuario.PermissaoSolicitacaoOcorrenciaRegraAlterar(IdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(IdUsuario);

      if Result = False then
        Result := Solicitacao.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 2);
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Solicitacao);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoOcorrenciaRegraExcluir(IdUsuario,
  Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Solicitacao: TSolicitacao;
begin
  Result := True;

  Usuario := TUsuario.Create;
  Solicitacao := TSolicitacao.Create;
  try
    Result := Usuario.PermissaoSolicitacaoOcorrenciaRegraExcluir(IdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(IdUsuario);

      if Result = False then
        Result := Solicitacao.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 3);
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Solicitacao);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoOcorrenciaTecnica(
  IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoSolicitacaoOcorrenciaTecnica(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoOcorrenciaTecnicaAlterar(
  IdUsuario: Integer; Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Solicitacao: TSolicitacao;
begin
  Result := True;

  Usuario := TUsuario.Create;
  Solicitacao := TSolicitacao.Create;
  try
    Result := Usuario.PermissaoSolicitacaoOcorrenciaTecnicaAlterar(IdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(IdUsuario);
      if Result = False then
      begin
        Result := True;
        if Id > 0 then
          Result := Solicitacao.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 2);
      end;
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Solicitacao);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoOcorrenciaTecnicaExcluir(
  IdUsuario: Integer; Id: Integer): Boolean;
var
  Usuario: TUsuario;
  Solicitacao: TSolicitacao;
begin
  Result := True;

  Usuario := TUsuario.Create;
  Solicitacao := TSolicitacao.Create;
  try
    Result := Usuario.PermissaoSolicitacaoOcorrenciaTecnicaExcluir(IdUsuario);
    if Result then
    begin
      Result := Usuario.UsuarioADM(IdUsuario);

      if Result = False then
        Result := Solicitacao.OcorrenciaUsuarioIgualCadastro(Id, IdUsuario, 3);
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Solicitacao);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoQuadro(
  IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoSolicitacaoQuadro(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.PermissaoSolicitacaoStatus(
  IdUsuario: integer): Boolean;
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Result := Usuario.PermissaoSolicitacaoStatus(IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

function TServerMethods1.UsuarioPermissaoExportar(): TJSONValue;
var
  obj: TUsuarioPermissao;
  Lista: TObjectList<TUsuarioPermissaoVO>;
begin
  obj := TUsuarioPermissao.Create;
  try
    Lista := obj.Exportar();
    Result := TConverte.ObjectToJSON<TListaUsuarioPermissao>(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerMethods1.UsuarioPermissaoSalvar(IdUsuario: Integer;
  Sigla: string);
var
  obj: TUsuarioPermissao;
begin
  obj := TUsuarioPermissao.Create;
  try
    obj.Salvar(IdUsuario, Sigla);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.UsuarioRetornaListaPermissao: TJSONArray;
var
  obj: TUsuarioPermissao;
begin
  obj := TUsuarioPermissao.Create;
  try
    Result := obj.PreencherLista();
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.UsuarioUsuarioADM(AIdUsuario: Integer): Boolean;
var
  obj: TUsuario;
begin
  obj := TUsuario.Create;
  try
    Result := obj.UsuarioADM(AIdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.ValidarSIDomperClient(ADataHora: string): Boolean;
var
  parametro: TParametros;
begin
  // parametro para validar a data hora do SIDomper.exe
  parametro := TParametros.Create;
  try
    Result := parametro.ValidarSIDomperCliente(ADataHora);
  finally
    FreeAndNil(parametro);
  end;
end;

function TServerMethods1.ValidarUsuarioMesmoCadastro(APrograma, AId, AIdUsuario,
  ATipoOperacao: Integer): Boolean;
var
  bPermissao: Boolean;
  Usuario: TUsuario;
  bResult: Boolean;
begin
  Usuario := TUsuario.Create;
  try
    bResult := Usuario.UsuarioADM(AIdUsuario);
  finally
    FreeAndNil(Usuario);
  end;

  Result := bResult;

  if bResult then
    Exit;

  bPermissao := True;
  if APrograma = CBaseConhPrograma then
    bPermissao := BaseConhUsuarioMesmoCadastro(AId, AIdusuario, 2)
  else if APrograma = CVersaoPrograma then
    bPermissao := VersaoUsuarioMesmoCadastro(AId, AIdusuario, 2)
  else if (APrograma = CVisitaPrograma) then
    bPermissao := VisitaUsuarioMesmoCadastro(AId, AIdusuario, 2)
  else if (APrograma = CAgendamentoPrograma) then
    bPermissao := AgendamentoUsuarioMesmoCadastro(AId, AIdusuario, 2)
  else if (APrograma = CSolicitacaoPrograma) then
    bPermissao := SolicitacaoUsuarioMesmoCadastro(AId, AIdusuario, 2)
  else if (APrograma = CChamadoPrograma) then
    bPermissao := ChamadoUsuarioMesmoCadastro(AId, AIdusuario, 2)
  else if (APrograma = CAtividadePrograma) then
    bPermissao := ChamadoUsuarioMesmoCadastro(AId, AIdusuario, 2);

  Result := bPermissao;
end;

function TServerMethods1.VerificarQuadroTarefasEmAberto(AIdUsuario, APrograma: Integer): Boolean;
var
  bResult: Boolean;
  obj: TChamado;
begin
  bResult := False;
  obj := TChamado.Create;
  try
    try

      if APrograma = CChamadoPrograma then // chamado 1
      begin
        bResult := obj.VerificarAtividadeAberto(AIdUsuario);
        if bResult = False then
          bResult := obj.VerificarSolicitacaoAberto(AIdUsuario);
//        bResult := False;
      end;

      if APrograma = CAtividadePrograma then // Atividade 111
      begin
        bResult := obj.VerificarChamadoAberto(AIdUsuario);
        if bResult = False then
          bResult := obj.VerificarSolicitacaoAberto(AIdUsuario);
      end;

      if APrograma = CSolicitacaoPrograma then // Solicitacao 3
      begin
        bResult := obj.VerificarChamadoAberto(AIdUsuario);
        if bResult = False then
          bResult := obj.VerificarAtividadeAberto(AIdUsuario);
      end;
      Result := bResult;
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.VersaoBuscarStatusDesenvolvimento: Integer;
var
  obj: TVersao;
begin
  obj := TVersao.Create;
  try
    Result := obj.BuscarVersaoDesenvolvimento();
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.VersaoUsuarioMesmoCadastro(AId, AIdUsuario,
  ATipoOperacao: Integer): Boolean;
var
  obj: TVersao;
begin
  obj := TVersao.Create;
  try
    Result := obj.UsuarioIgualCadastro(AId, AIdUsuario, ATipoOperacao)
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.VisitaAtualizacaoVersao(AIdCliente, AIdTipo: Integer;
  AVersao: string): string;
var
  obj: TVisita;
begin
  obj := TVisita.Create;
  try
    try
      Result := obj.AtualizaVersao(AIdCliente, AIdTipo, AVersao);
    except
      On E: Exception do
      begin
        Result := E.Message;
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.VisitaUsuarioMesmoCadastro(AId, AIdUsuario,
  ATipoOperacao: Integer): Boolean;
var
  obj: TVisita;
begin
  obj := TVisita.Create;
  try
    Result := obj.UsuarioIgualCadastro(AId, AIdUsuario, ATipoOperacao)
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.ProximoCodigo(Programa: Integer): TJSONNumber;
var
  iResultado: Integer;
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      iResultado := obj.ProximoCodigo(Programa);
      Result := TJSONNumber.Create(iResultado);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.ProximoIdGeral(ATabela: string): Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(' + QuotedStr(ATabela) + ')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

function TServerMethods1.ProximoId(Programa: Integer): TJSONNumber;
var
  obj: TCadastroPadrao;
  iResultado: Integer;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      iResultado := obj.ProximoId(Programa);
      Result := TJSONNumber.Create(iResultado);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.Salvar(Programa, IdUsuario: Integer);
var
  obj: TCadastroPadrao;
begin
  obj := TCadastroPadrao.Create;
  try
    try
      obj.Salvar(Programa, IdUsuario);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.SalvarChamadoObj(IdUsuario: Integer;
  ChamadoVO: TJSONValue): TJSONNumber;
var
  obj: TChamado;
  UnMarshal : TJSONUnMarshal;
  oObjVO: TChamadoVO;
  iResultado: Integer;
begin
  obj := TChamado.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try

    oObjVO := TChamadoVO(UnMarshal.Unmarshal(ChamadoVO));

//    if oObjVO.TipoMovimento = 1 then  // chamado
//    begin
//      if oObjVO.IdStatus = 2 then // Em Atendimento
//      begin
//        if VerificarQuadroTarefasEmAberto(IdUsuario, 111) then //atividade
//          raise Exception.Create('J� Existe Chamado ou Solicita��o em Aberto!');
//      end;
//    end
//    else begin // atividade
//      if oObjVO.IdStatus = 28 then // Em Execucao
//      begin
//        if VerificarQuadroTarefasEmAberto(IdUsuario, 1) then
//          raise Exception.Create('J� Existe Atividade ou Solicita��o em Aberto!');
//      end;
//    end;


    iResultado := obj.Salvar(oObjVO,
                            spChamado,
                            spChamadoOcorrencia);
    Result := TJSONNumber.Create(iResultado);

  finally
    FreeAndNil(obj);
    FreeAndNil(oObjVO);
    FreeAndNil(UnMarshal);
  end;
end;

procedure TServerMethods1.SalvarChamado(Programa, IdUsuario: Integer;
  ChamadoStatus: TJSONValue);
var
  UnMarshal : TJSONUnMarshal;
  obj : TChamadoStatusVO;
  Cha: TChamado;
begin

  if ChamadoStatus is TJSONNull then
    Exit;

  raise Exception.Create('N�o Salvo');

//  Cha := TChamado.Create;
//  UnMarshal := TJSONUnMarshal.Create;
//  try
//    obj := TChamadoStatusVO(UnMarshal.Unmarshal(ChamadoStatus));
//    cha.Salvar(IdUsuario, obj);
//    Salvar(CChamadoPrograma, IdUsuario);
//  finally
//    FreeAndNil(UnMarshal);
//    FreeAndNil(Cha);
//    FreeAndNil(obj);
//  end;
end;

procedure TServerMethods1.SalvarSolicitacao(Programa, IdUsuario: Integer;
  SolicitacaoStatus: TJSONValue);
var
  UnMarshal : TJSONUnMarshal;
  obj : TSolicitacaoStatusVO;
  Sol: TSolicitacao;
begin

  if SolicitacaoStatus is TJSONNull then
    Exit;

  Sol := TSolicitacao.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    obj := TSolicitacaoStatusVO(UnMarshal.Unmarshal(SolicitacaoStatus));
    Sol.Salvar(IdUsuario, obj);
    Salvar(CSolicitacaoPrograma, IdUsuario);
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(Sol);
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.SelectSQL(InstrucaoSQL: string): string;
var
  Qry: TFDQuery;
begin
  Qry := TFDQuery.Create(Self);
  try
    Qry.Connection := dm.Conexao;
    Qry.SQL.Text := InstrucaoSQL;
    Qry.Open();

//    ShowMessage(IntToStr(Qry.Fields.Count));

    Result := Qry.Fields[0].AsString;
    Qry.Close;
  finally
    FreeAndNil(Qry);
  end;
end;

procedure TServerMethods1.SolicitacaoAnexos(AIdSolicitacao: Integer);
begin
  QSolicitacaoAnexo.Close;
  QSolicitacaoAnexo.Params[0].AsInteger := AIdSolicitacao;
end;

procedure TServerMethods1.SolicitacaoFinalizarTempo(AIdUsuarioLogado: Integer;
  ASolicitacaoViewModel: TJSONValue; AValidarUsuario: Boolean);
var
  obj: TSolicitacaoTempo;
  objVO: TSolicitacaoViewModel;
  SolicitacaoTempoVO: TSolicitacaoTempoVO;
begin
  obj := TSolicitacaoTempo.Create;
  SolicitacaoTempoVO := TSolicitacaoTempoVO.create;
  try
    objVO := TConverte.JSONToObject<TSolicitacaoViewModel>(ASolicitacaoViewModel);
    SolicitacaoTempoVO.IdSolicitacao := objVO.Id;
    SolicitacaoTempoVO.IdUsuario := objVO.IdUsuarioAtendeAtual;
    SolicitacaoTempoVO.Status.Id := objVO.IdStatus;

    obj.Finalizar(AIdUsuarioLogado, SolicitacaoTempoVO, AValidarUsuario);
  finally
    FreeAndNil(obj);
    FreeAndNil(SolicitacaoTempoVO);
    FreeAndNil(objVO);
  end;

end;

procedure TServerMethods1.SolicitacaoIniciarTempo(AIdUsuarioLogado: Integer;
  ASolicitacaoViewModel: TJSONValue);
var
  obj: TSolicitacaoTempo;
  objVO: TSolicitacaoViewModel;
  SolicitacaoTempoVO: TSolicitacaoTempoVO;
begin

  obj := TSolicitacaoTempo.Create;
  SolicitacaoTempoVO := TSolicitacaoTempoVO.create;
  try
    try
      objVO := TConverte.JSONToObject<TSolicitacaoViewModel>(ASolicitacaoViewModel);

      SolicitacaoTempoVO.IdUsuario := objVO.IdUsuarioAtendeAtual;
      SolicitacaoTempoVO.IdSolicitacao := objVO.Id;
      SolicitacaoTempoVO.Status.Nome := objVO.NomeStatus;

      obj.Iniciar(AIdUsuarioLogado, SolicitacaoTempoVO);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(objVO);
    FreeAndNil(SolicitacaoTempoVO);
  end;
end;

procedure TServerMethods1.SolicitacaoListarProblemaSolucao(Filtro: TJSONValue;
  Texto: string; IdUsuario: Integer);
var
  obj: TSolicitacao;
  sComando: string;
//  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroSolicitacao;
begin

  oFiltro := TConverte.JSONToObject<TFiltroSolicitacao>(Filtro);
  obj := TSolicitacao.Create;
  try
    QSolicitacaoProblemaSolucao.Close;
    QSolicitacaoProblemaSolucao.SQL.Text := obj.ListarProblemaSolucao(oFiltro, Texto, IdUsuario);
  finally
    FreeAndNil(obj);
    FreeAndNil(oFiltro);
  end;


//  if Filtro is TJSONNull then
//    Exit;
//
//  if not Assigned(oFiltro) then
//    oFiltro := TFiltroSolicitacao.Create;
//
//  UnMarshal := TJSONUnMarshal.Create;
//  obj := TSolicitacao.Create;
//  try
//    oFiltro := TFiltroSolicitacao(UnMarshal.Unmarshal(Filtro));
//
//    QChamadoProblemaSolucao.Close;
//    QChamadoProblemaSolucao.SQL.Text := obj.ListarProblemaSolucao(oFiltro, Texto, IdUsuario);
//  finally
//    FreeAndNil(obj);
//    FreeAndNil(UnMarshal);
//    FreeAndNil(oFiltro);
//  end;
end;

function TServerMethods1.SolicitacaoObterPorId(Id: Integer): TJSONValue;
var
  obj: TSolicitacao;
  SolicitacaoViewModel: TSolicitacaoViewModel;
  SolicitacaoTempo: TSolicitacaoTempo;
begin
  SolicitacaoTempo := TSolicitacaoTempo.Create;
  obj := TSolicitacao.Create;
  try
    SolicitacaoViewModel := obj.ObterPorId(Id);
    SolicitacaoViewModel.TempoAberto := SolicitacaoTempo.SolicitacaoAtualAberta(Id);

    Result := TConverte.ObjectToJSON<TSolicitacaoViewModel>(SolicitacaoViewModel);
  finally
    FreeAndNil(obj);
    FreeAndNil(SolicitacaoViewModel);
    FreeAndNil(SolicitacaoTempo);
  end;
end;

function TServerMethods1.SolicitacaoPermissaoSolicitacaoTempo(
  IdUsuario: Integer): Boolean;
var
  obj: TUsuario;
begin
  obj := TUsuario.Create;
  try
    Result := obj.PermissaoSolicitacaoTempo(IdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.SolicitacaoPorCategoria(
  AIdCategoria, AIdUsuario: Integer): TJSONValue;
var
  model: TSolicitacaoVO;
  Lista: TObjectList<TSolicitacaoVO>;
  Ocorrencia: TSolicitacaoOcorrenciaVO;
  Usuario: TUsuario;
  bPermissaoAnalise: Boolean;
  bPermissaoRegra: Boolean;
//  cronograma: TSolicitacaoCronogramaVO;
//  status: TSolicitacaoStatusVO;
begin
  Usuario := TUsuario.Create;
  Lista := TObjectList<TSolicitacaoVO>.Create();
  try
    try
      if Usuario.PermissaoSolicitacaoAbertura(AIdUsuario) then
      begin
        QSolicitacaoCategoria.Close;
        QSolicitacaoCategoria.Params[0].AsInteger := AIdCategoria;
        QSolicitacaoCategoria.Open;

        bPermissaoAnalise := Usuario.PermissaoSolicitacaoAnalise(AIdUsuario);
        bPermissaoRegra := Usuario.PermissaoSolicitacaoOcorrenciaRegra(AIdUsuario);
        while not QSolicitacaoCategoria.Eof do
        begin
//==============================================================================
// Abertura
          model := TSolicitacaoVO.create;
          model.Id := QSolicitacaoCategoriaSol_Id.AsInteger;
          model.Data := QSolicitacaoCategoriaSol_Data.AsDateTime;
          model.Hora := QSolicitacaoCategoriaSol_Hora.AsString;
          model.IdCliente := QSolicitacaoCategoriaSol_Cliente.AsInteger;
          model.Titulo := QSolicitacaoCategoriaSol_Titulo.AsString;
          model.Descricao := QSolicitacaoCategoriaSol_Descricao.AsString;
          model.Nivel := QSolicitacaoCategoriaSol_Nivel.AsString;
          model.Versao := QSolicitacaoCategoriaSol_Versao.AsString;
          model.Anexo := QSolicitacaoCategoriaSol_Anexo.AsString;
          model.TempoPrevisto := QSolicitacaoCategoriaSol_TempoPrevisto.AsCurrency;
          model.PrevisaoEntrega := QSolicitacaoCategoriaSol_PrevisaoEntrega.AsDateTime;
          model.DescricaoLiberacao := QSolicitacaoCategoriaSol_DescricaoLiberacao.AsString;
          model.Contato := QSolicitacaoCategoriaSol_Contato.AsString;
          model.Cliente.RazaoSocial := QSolicitacaoCategoriaCli_Nome.AsString;
          model.UsuarioAberturaVO.Nome := QSolicitacaoCategoriaUsuAbertura.AsString;
          model.Modulo.Nome := QSolicitacaoCategoriaMod_Nome.AsString;
          model.Produto.Nome := QSolicitacaoCategoriaProd_Nome.AsString;
          model.Status.Nome := QSolicitacaoCategoriaSta_Nome.AsString;
//==============================================================================
// Analise
          if bPermissaoAnalise then
          begin
            model.Analista.Nome := QSolicitacaoCategoriaUsuAnalista.AsString;
            model.Desenvolvedor.Nome := QSolicitacaoCategoriaUsuDesenv.AsString;
            model.TempoPrevisto := QSolicitacaoCategoriaSol_TempoPrevisto.AsCurrency;
            model.PrevisaoEntrega := QSolicitacaoCategoriaSol_PrevisaoEntrega.AsCurrency;
            model.DescricaoLiberacao := QSolicitacaoCategoriaSol_DescricaoLiberacao.AsString;
            model.Versao := QSolicitacaoCategoriaSol_Versao.AsString;
          end;
//==============================================================================
// Ocorrencia Regras
          if bPermissaoRegra then
          begin
            QSolicitaOcorrenciaRegraCons.Close;
            QSolicitaOcorrenciaRegraCons.Params[0].AsInteger := model.Id;
            QSolicitaOcorrenciaRegraCons.Open;
            while not QSolicitaOcorrenciaRegraCons.Eof do
            begin
              Ocorrencia := TSolicitacaoOcorrenciaVO.Create;
              Ocorrencia.Id := QSolicitaOcorrenciaRegraConsSOcor_Id.AsInteger;
              Ocorrencia.Classificacao := 3;
              Ocorrencia.IdSolicitacao := model.Id;
              Ocorrencia.Usuario.Nome := QSolicitaOcorrenciaRegraConsUsu_Nome.AsString;
              Ocorrencia.Data := QSolicitaOcorrenciaRegraConsSOcor_Data.AsDateTime;
              Ocorrencia.Hora := QSolicitaOcorrenciaRegraConsSOcor_Hora.AsString;
              Ocorrencia.Descricao := QSolicitaOcorrenciaRegraConsSOcor_Descricao.AsString;
              Ocorrencia.Anexo := QSolicitaOcorrenciaRegraConsSOcor_Anexo.AsString;

              model.SolicitacoesOcorrencias.Add(Ocorrencia);
              QSolicitaOcorrenciaRegraCons.Next;
            end;
          end;                    
//==============================================================================
// Ocorrencia Geral
    //      QSolicitaOcorrenciaGeralCons.Close;
    //      QSolicitaOcorrenciaGeralCons.Params[0].AsInteger := model.Id;
    //      QSolicitaOcorrenciaGeralCons.Open();
    //      while not QSolicitaOcorrenciaGeralCons.Eof do
    //      begin
    //        Ocorrencia := TSolicitacaoOcorrenciaVO.Create;
    //        Ocorrencia.Classificacao := 1;
    //        Ocorrencia.IdSolicitacao := model.Id;
    //        Ocorrencia.Id := QSolicitaOcorrenciaGeralConsSOcor_Id.AsInteger;
    //        Ocorrencia.Usuario.Nome := QSolicitaOcorrenciaGeralConsUsu_Nome.AsString;
    //        Ocorrencia.Data := QSolicitaOcorrenciaGeralConsSOcor_Data.AsDateTime;
    //        Ocorrencia.Hora := QSolicitaOcorrenciaGeralConsSOcor_Hora.AsString;
    //        Ocorrencia.Descricao := QSolicitaOcorrenciaGeralConsSOcor_Descricao.AsString;
    //        Ocorrencia.Anexo := QSolicitaOcorrenciaGeralConsSOcor_Anexo.AsString;
    //
    //        model.SolicitacoesOcorrencias.Add(Ocorrencia);
    //        QSolicitaOcorrenciaGeralCons.Next
    //      end;
//==============================================================================
// Ocorrencia Tecnica
    //      QSolicitaOcorrenciaTecnicaCons.Close;
    //      QSolicitaOcorrenciaTecnicaCons.Params[0].AsInteger := model.Id;
    //      QSolicitaOcorrenciaTecnicaCons.Open();
    //      while not QSolicitaOcorrenciaTecnicaCons.Eof do
    //      begin
    //        Ocorrencia := TSolicitacaoOcorrenciaVO.Create;
    //        Ocorrencia.Classificacao := 2;
    //        Ocorrencia.IdSolicitacao := model.Id;
    //        Ocorrencia.Id := QSolicitaOcorrenciaTecnicaConsSOcor_Id.AsInteger;
    //        Ocorrencia.Usuario.Nome := QSolicitaOcorrenciaTecnicaConsUsu_Nome.AsString;
    //        Ocorrencia.Data := QSolicitaOcorrenciaTecnicaConsSOcor_Data.AsDateTime;
    //        Ocorrencia.Hora := QSolicitaOcorrenciaTecnicaConsSOcor_Hora.AsString;
    //        Ocorrencia.Descricao := QSolicitaOcorrenciaTecnicaConsSOcor_Descricao.AsString;
    //        Ocorrencia.Anexo := QSolicitaOcorrenciaTecnicaConsSOcor_Anexo.AsString;
    //
    //        model.SolicitacoesOcorrencias.Add(Ocorrencia);
    //        QSolicitaOcorrenciaTecnicaCons.Next;
    //      end;
//==============================================================================
// Status
    //      QSolicitaStatusCons.Close;
    //      QSolicitaStatusCons.Params[0].AsInteger := model.Id;
    //      QSolicitaStatusCons.Open();
    //      while not QSolicitaStatusCons.Eof do
    //      begin
    //        status := TSolicitacaoStatusVO.Create;
    //        status.IdSolicitacao := model.Id;
    //        status.Id := 0;
    //        status.Data := 0;
    //        status.DescricaoLiberacao := '';
    //        model.SolicitacoesStatus.Add(status);
    //        QSolicitaStatusCons.Next;
    //      end;
//==============================================================================
// Cronograma
    //      QSolicitaCronogramaCons.Close;
    //      QSolicitaCronogramaCons.Params[0].AsInteger := model.Id;
    //      QSolicitaCronogramaCons.Open();
    //      while not QSolicitaCronogramaCons.Eof do
    //      begin
    //        cronograma := TSolicitacaoCronogramaVO.Create;
    //        cronograma.IdSolicitacao := model.Id;
    //        model.SolicitacoesCronogramas.Add(Cronograma);
    //        QSolicitaCronogramaCons.Next;
    //      end;
//==============================================================================
// Tempos

          Lista.Add(model);

          QSolicitacaoCategoria.Next;
        end;
      end;

      QSolicitacaoCategoria.Close;
      Result := TConverte.ObjectToJSON<TListaSolicitacao>(Lista);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(Usuario);
    FreeAndNil(Lista);
  end;
end;

function TServerMethods1.SolicitacaoQuadroJSON(AIdUsuario: Integer): TJSONValue;
var
  obj: TSolicitacao;
  Lista: TObjectList<TSolicitacaoViewModel>;
begin
  obj := TSolicitacao.Create;
  AbrirConexao;
  try
    try
      QSolicitacaoQuadro.Close;
      QSolicitacaoQuadro.Params[0].AsInteger := AIdUsuario;
      QSolicitacaoQuadro.Open();
    except on E: Exception do
      begin
        raise Exception.Create('SolicitacaoQuadroJSON ' + sLineBreak + E.Message);
      end;
    end;

    Lista := obj.ListarQuadro(QSolicitacaoQuadro, AIdUsuario);

    QChamadoQuadro.Close;

    Result := TConverte.ObjectToJSON<TListaSolicitacaoViewModel>(Lista);
  finally
    FecharConexao;
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerMethods1.SolicitacaoRelatorio(AModelo, AIdUsuario: Integer;
  AFiltro: TJSONValue; var AQtdeSolicitacao: Integer);
var
  obj: TSolicitacao;
  objFiltro: TFiltroSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    objFiltro := TConverte.JSONToObject<TFiltroSolicitacao>(AFiltro);

    if AModelo = 1 then
    begin
      QSolicitacaoRelatorio1.Close;
      QSolicitacaoRelatorio1.SQL.Text := obj.Relatorios(AModelo, AIdUsuario, objFiltro, AQtdeSolicitacao);
    end;

    if AModelo = 2 then
    begin
      QSolicitacaoTipo.Close;
      QSolicitacaoTipo.SQL.Text := obj.Relatorios(AModelo, AIdUsuario, objFiltro, AQtdeSolicitacao);
    end;

    if AModelo = 3 then
    begin
      QSolicitacaoStatus.Close;
      QSolicitacaoStatus.SQL.Text := obj.Relatorios(AModelo, AIdUsuario, objFiltro, AQtdeSolicitacao);
    end;

  finally
    TConverte.DestroiObj<TSolicitacao>(obj);
    TConverte.DestroiObj<TFiltroSolicitacao>(objFiltro);
  end;
end;

function TServerMethods1.SolicitacaoTempoAtualAberta(
  AIdSolicitacao: Integer): Boolean;
var
  obj: TSolicitacaoTempo;
begin
  obj := TSolicitacaoTempo.Create;
  try
    Result := obj.SolicitacaoAtualAberta(AIdSolicitacao);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.SolicitacaoTempoExcluir(AId: Integer);
var
  obj: TSolicitacaoTempo;
begin
  obj := TSolicitacaoTempo.Create;
  try
    obj.Excluir(AId);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.SolicitacaoTempoFiltrarPorData(
  AData: string; AId, AIdUsuario: Integer): TJSONValue;
var
  obj: TSolicitacaoTempo;
  Lista: TObjectList<TSolicitacaoTempoVO>;
begin
  obj := TSolicitacaoTempo.Create;
  try
    Lista := obj.RetornarPorData(AData, AId, AIdUsuario);
    Result := TConverte.ObjectToJSON<TListaSolicitacaoTempo>(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

procedure TServerMethods1.SolicitacaoTempoFinalizar(AIdUsuarioLogado: Integer;
  ASolicitacaoTempoVO: TJSONValue; AValidarUsuario: Boolean);
var
  obj: TSolicitacaoTempo;
  objVO: TSolicitacaoTempoVO;
begin
  obj := TSolicitacaoTempo.Create;
  try
    objVO := TConverte.JSONToObject<TSolicitacaoTempoVO>(ASolicitacaoTempoVO);
    obj.Finalizar(AIdUsuarioLogado, objVO, AValidarUsuario);
  finally
    FreeAndNil(obj);
    FreeAndNil(objVO);
  end;
end;

procedure TServerMethods1.SolicitacaoTempoIniciar(AIdUsuarioLogado: Integer;
  ASolicitacaoTempoVO: TJSONValue);
var
  obj: TSolicitacaoTempo;
  objVO: TSolicitacaoTempoVO;
begin
  obj := TSolicitacaoTempo.Create;
  try
    objVO := TConverte.JSONToObject<TSolicitacaoTempoVO>(ASolicitacaoTempoVO);
    obj.Iniciar(AIdUsuarioLogado, objVO);
  finally
    FreeAndNil(obj);
    FreeAndNil(objVO);
  end;
end;

function TServerMethods1.SolicitacaoTempoListarStatus: TJSONArray;
var
  obj: TSolicitacaoTempo;
begin
  obj := TSolicitacaoTempo.Create;
  try
    Result := obj.ListarStatus();
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.SolicitacaoTempoLocalizarId(AId: Integer): TJSONValue;
var
  obj: TSolicitacaoTempo;
  objVO: TSolicitacaoTempoVO;
begin
  obj := TSolicitacaoTempo.Create;
  try
    objVO := obj.LocalizarId(AId);
    Result := TConverte.ObjectToJSON<TSolicitacaoTempoVO>(objVO);
  finally
    FreeAndNil(obj);
    FreeAndNil(objVO);
  end;
end;

function TServerMethods1.SolicitacaoTempoLocalizarPorSolicitacao(
  AIdSolicitacao: Integer): TJSONValue;
var
  obj: TSolicitacaoTempo;
  Lista: TObjectList<TSolicitacaoTempoVO>;
begin
  obj := TSolicitacaoTempo.Create;
  try
    Lista := obj.LocalizarPorSolicitacao(AIdSolicitacao);
    Result := TConverte.ObjectToJSON<TListaSolicitacaoTempo>(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

function TServerMethods1.SolicitacaoTempoRetornarHorasAgrupadoPorStatus(
  AIdSolicitacao: Integer): TJSONValue;
var
  obj: TSolicitacaoTempo;
  Lista: TObjectList<TSolicitacaoTempoVO>;
begin
  obj := TSolicitacaoTempo.Create;
  try
    Lista := obj.RetornarHorasAgrupadoPorStatus(AIdSolicitacao);
    Result := TConverte.ObjectToJSON<TListaSolicitacaoTempo>(Lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(Lista);
  end;
end;

function TServerMethods1.SolicitacaoTempoSalvar(
  ASolicitacaoTempoVO: TJSONValue): TJSONNumber;
var
  obj: TSolicitacaoTempo;
  objVO: TSolicitacaoTempoVO;
  iResult: Integer;
begin
  obj := TSolicitacaoTempo.Create;
  try
    objVO := TConverte.JSONToObject<TSolicitacaoTempoVO>(ASolicitacaoTempoVO);
    iResult := obj.Salvar(objVO);
    Result := TJSONNumber.Create(iResult);
  finally
    FreeAndNil(obj);
    FreeAndNil(objVO);
  end;
end;

function TServerMethods1.SolicitacaoUsuarioMesmoCadastro(AId, AIdUsuario,
  ATipoOperacao: Integer): Boolean;
var
  obj: TSolicitacao;
begin
  obj := TSolicitacao.Create;
  try
    Result := obj.SolicitacaoUsuarioIgualCadastro(AId, AIdUsuario, ATipoOperacao)
  finally
    FreeAndNil(obj);
  end;
end;

procedure TServerMethods1.SolicitracaoQuadro(AIdUsuario: Integer);
begin
  QSolicitacaoQuadro.Close;
  QSolicitacaoQuadro.Params[0].AsInteger := AIdUsuario;

end;

procedure TServerMethods1.StartTransacao;
begin
  dm.StartTransacao();
end;

function TServerMethods1.Status_LocalizarPorPrograma(
  ATipo: Integer): TJSONValue;
var
  obj: TStatus;
  lista: TObjectList<TStatusVO>;
begin
  obj := TStatus.Create;
  try
    lista := obj.LocalizarPorPrograma(ATipo);
    Result := TConverte.ObjectToJSON<TListaStatus>(lista);
  finally
    FreeAndNil(obj);
    FreeAndNil(lista)
  end;
end;

function TServerMethods1.TipoRetornoUmRegistro(APrograma: Integer): TJSONValue;
var
  Model: TTipoVO;
  obj: TTipo;
begin
  obj := TTipo.Create;
  try
    Model := obj.RetornoUmRegistro(APrograma);
    Result := TConverte.ObjectToJSON<TTipoVO>(Model);
  finally
    FreeAndNil(obj);
    FreeAndNil(Model);
  end;
end;

procedure TServerMethods1.UsuarioAcessoMenu(IdUsuario: integer);
begin
  QUsuarioAcessoMenu.Close;
  QUsuarioAcessoMenu.ParamByName('IdUsuario').AsInteger := IdUsuario;
end;

procedure TServerMethods1.UsuarioHorarioAcessoSistema(AUserName,
  APassword: string; AIdUsuario: Integer);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    if Usuario.HorarioAcessoSistema(AUserName, APassword, AIdUsuario) = False then
      raise Exception.Create('Hor�rio n�o dispon�vel para usar o SIDomper!');

  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TServerMethods1.UsuarioLocalizarNome(Nome: string);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.LocalizarNome(QUsuarioCad, Nome);
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TServerMethods1.Relatorio(Programa, IdUsuario: integer);
var
  Usuario: TUsuario;
begin
  Usuario := TUsuario.Create;
  try
    Usuario.PermissaoRelatorio(Programa, IdUsuario);
  finally
    FreeAndNil(Usuario);
  end;
end;

procedure TServerMethods1.RelatorioChamado(Modelo, IdUsuario: Integer; Filtro:
    TJSONValue; Ordem: string; ATipo: Integer);
var
  obj: TChamado;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroChamado;
  eTipo: TEnumChamadoAtividade;
begin
  if Filtro is TJSONNull then
    Exit;

  case ATipo of
    1: eTipo := caChamado;
    2: eTipo := caAtividade;
  end;

  if eTipo = caChamado then
    Relatorio(CChamadoPrograma, IdUsuario)
  else
    Relatorio(CAtividadePrograma, IdUsuario);

//  oFiltro := TFiltroChamado.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TConverte.JSONToObject<TFiltroChamado>(Filtro);
//    oFiltro := TFiltroChamado(UnMarshal.Unmarshal(Filtro));

    case Modelo of
      1:
      begin
        QRelChamadoModelo1.Close;
        sComando := obj.RelatorioModelo_01(oFiltro, IdUsuario, eTipo);
        QRelChamadoModelo1.SQL.Text := sComando;
      end;
      2:
      begin
        QRelChamadoModelo2.Close;
        sComando := obj.RelatorioModelo_02(oFiltro, IdUsuario, Ordem, eTipo);
        QRelChamadoModelo2.SQL.Text := sComando;
      end;
      3:
      begin
        QRelChamadoModelo3.Close;
        sComando := obj.RelatorioModelo_03(oFiltro, IdUsuario, Ordem, eTipo);
        QRelChamadoModelo3.SQL.Text := sComando;
      end;

      4:
      begin
        QRelChamadoModelo4.Close;
        sComando := obj.RelatorioModelo_04(oFiltro, IdUsuario, Ordem, eTipo);
        QRelChamadoModelo4.SQL.Text := sComando;
      end;

      5:
      begin
        QRelChamadoModelo5.Close;
        sComando := obj.RelatorioModelo_05(oFiltro, IdUsuario, Ordem, eTipo);
        QRelChamadoModelo5.SQL.Text := sComando;
      end;

      6:
      begin
        QRelChamadoModelo06.Close;
        obj.RelatorioModelo_06(oFiltro, IdUsuario, eTipo);
      end;

      7:
      begin
        QRelChamadoModelo06.Close;
        obj.RelatorioModelo_07(oFiltro, IdUsuario, eTipo);
      end;

      8:
      begin
        QRelChamadoModelo8.Close;
        QRelChamadoModelo8.SQL.Text := obj.RelatorioModelo_08(oFiltro, IdUsuario, Ordem, eTipo);
      end;
      9:
      begin
        QRelChamadoModelo9.Close;
        QRelChamadoModelo9.SQL.Text := obj.RelatorioModelo_09(oFiltro, IdUsuario, Ordem, eTipo);
      end;

    end;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

procedure TServerMethods1.RelatorioVersao(AModelo, AIdVersao: Integer;
  out AQtdeRetorno: Integer; AFiltro: TJSONValue);
var
  obj: TVersao;
  Rel: TDMVersao;
  Filtro: TFiltroVersao;
begin
  AQtdeRetorno := 0;
  case AModelo of
    1:
    begin
      QVersaoVersao.Close;
      QVersaoVersao.Params[0].AsInteger := AIdVersao;

      obj := TVersao.Create;
      try
        AQtdeRetorno := obj.RetornarQtdeVersao(AIdVersao);
      finally
        FreeAndNil(obj);
      end;
    end;

    2..3:
    begin
      Filtro := TConverte.JSONToObject<TFiltroVersao>(AFiltro);
      Rel := TDMVersao.Create(nil);
      try
        Filtro.IdVersao := AIdVersao;
        QVersaoDocumento.Close;
        QVersaoDocumento.SQL.Text := Rel.SqlModel3(Filtro);
      finally
        FreeAndNil(Rel);
        FreeAndNil(Filtro);
      end;
    end;
  end;
end;

procedure TServerMethods1.RelatorioVisita(Modelo, IdUsuario: Integer;
  Filtro: TJSONValue; Ordem: string);
var
  obj: TVisita;
  sComando: string;
  UnMarshal : TJSONUnMarshal;
  oFiltro: TFiltroVisita;
begin


  if Filtro is TJSONNull then
    Exit;

//  oFiltro := TFiltroVisita.Create;
  UnMarshal := TJSONUnMarshal.Create;
  try
    oFiltro := TFiltroVisita(UnMarshal.Unmarshal(Filtro));

    case Modelo of
      1:
      begin
        QRelVisitaModelo1.Close;
        sComando := obj.RelatorioModelo_01(oFiltro, IdUsuario);
        QRelVisitaModelo1.SQL.Text := sComando;
      end;
      2:
      begin
        QRelVisitaModelo2.Close;
        sComando := obj.RelatorioModelo_02(oFiltro, IdUsuario, Ordem);
        QRelVisitaModelo2.SQL.Text := sComando;
      end;
      3:
      begin
        QRelVisitaModelo3.Close;
        sComando := obj.RelatorioModelo_03(oFiltro, IdUsuario, Ordem);
        QRelVisitaModelo3.SQL.Text := sComando;
//        ShowMessage(sComando);
      end;

      4:
      begin
        QRelVisitaModelo4.Close;
        sComando := obj.RelatorioModelo_04(oFiltro, IdUsuario, Ordem);
        QRelVisitaModelo4.SQL.Text := sComando;
      end;

      5:
      begin
        obj.RelatorioModelo_05(oFiltro, IdUsuario, Ordem);
      end;

      6:
      begin
        obj.RelatorioModelo_06(oFiltro, IdUsuario, Ordem);
      end;

      8:
      begin
        QRelVisitaModelo8.Close;
        sComando := obj.RelatorioModelo_08(oFiltro, IdUsuario, Ordem);
        QRelVisitaModelo8.SQL.Text := sComando;
      end;
    end;
  finally
    FreeAndNil(UnMarshal);
    FreeAndNil(oFiltro);
  end;
end;

function TServerMethods1.RelatorioVisita2(AModelo, AIdUsuario: Integer;
  AFiltro: TJSONValue): TJSONValue;
var
  oVisita: TVisita;
  objFiltro: TFiltroVisita;
  listaObj: TObjectList<TRelChamadoVO>;
begin
  oVisita := TVisita.Create;
  try
    objFiltro := TConverte.JSONToObject<TFiltroVisita>(AFiltro);

    if AModelo = 7 then
      listaObj := oVisita.RelatorioModelo_07(objFiltro, AIdUsuario);

    Result := TConverte.ObjectToJSON<TListaRelChamado>(listaObj);
  finally
    FreeAndNil(oVisita);
    FreeAndNil(objFiltro);
    FreeAndNil(listaObj);
  end;
end;

function TServerMethods1.RetornaIdAtual(ATabela: string): Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(' + QuotedStr(ATabela) + ')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger;
  finally
    FreeAndNil(lQry);
  end;
end;

function TServerMethods1.RetornaIdScope: Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT SCOPE_IDENTITY() AS ID';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger;
  finally
    FreeAndNil(lQry);
  end;
end;

function TServerMethods1.RetornaNumeroSolicitacao(
  IdSolicitacao: Integer): TJSONNumber;
var
  obj: TSolicitacao;
  Id: Integer;
begin
  obj := TSolicitacao.Create;
  try
    Id := obj.RetornaNumeroSolicitacao(IdSolicitacao);
    Result := TJSONNumber.Create(Id);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.RetornaProximoId(ATabela: string): Integer;
var
  lQry: TFDQuery;
begin
  lQry := TFDQuery.Create(Nil);
  try
    lQry.Connection := DM.Conexao;
    lQry.SQL.Text := 'SELECT IDENT_CURRENT(' + QuotedStr(ATabela) + ')';
    lQry.Open();

    Result := lQry.Fields[0].AsInteger + 1;
  finally
    FreeAndNil(lQry);
  end;
end;

function TServerMethods1.RetornarChamadoEmailCliente(
  idChamado, IdUsuario: integer): string;
var
  obj: TChamadoEmail;
begin
  obj := TChamadoEmail.Create;
  try
    Result := obj.RetornaEmailCliente(IdChamado, IdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.RetornarChamadoEmails(IdChamado, IdUsuario, IdStatus: integer): string;
var
  obj: TChamadoEmail;
begin
  obj := TChamadoEmail.Create;
  try
    Result := obj.RetornaEmails(IdChamado, IdUsuario, IdStatus);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.RetornarSolicitacaoEmailCliente(IdSolicitacao,
  IdUsuario: integer): string;
var
  obj: TSolicitacaoEmail;
begin
  obj := TSolicitacaoEmail.Create;
  try
    Result := obj.RetornaEmailCliente(IdSolicitacao, IdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.RetornarSolicitacaoEmails(
  IdSolicitacao, IdUsuario, IdStatus: integer): string;
var
  obj: TSolicitacaoEmail;
begin
  obj := TSolicitacaoEmail.Create;
  try
    Result := obj.RetornaEmails(IdSolicitacao, IdUsuario, IdStatus);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.RetornarVisitaEmailCliente(idVisita,
  IdUsuario: integer): string;
var
  obj: TVisitaEmail;
begin
  obj := TVisitaEmail.Create;
  try
    Result := obj.RetornaEmailCliente(idVisita, IdUsuario);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.RetornarVisitaEmails(IdVisita, IdUsuario,
  IdStatus: integer): string;
var
  obj: TVisitaEmail;
begin
  obj := TVisitaEmail.Create;
  try
    Result := obj.RetornaEmails(IdVisita, IdUsuario, IdStatus);
  finally
    FreeAndNil(obj);
  end;
end;

function TServerMethods1.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

procedure TServerMethods1.Roolback;
begin
  dm.Roolback();
end;

initialization
//  ReportMemoryLeaksOnShutdown := True;
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

end.

