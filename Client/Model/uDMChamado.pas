unit uDMChamado;

interface

uses
  System.SysUtils, System.Classes, uDM, Data.DB, Datasnap.DBClient,
  uRegras, uEnumerador, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppBands, ppVar, ppPrnabl, ppCache, ppDesignLayer,
  ppParameter, System.DateUtils;

type
  TDMChamado = class(TDataModule)
    CDSConsulta: TClientDataSet;
    CDSCadastro: TClientDataSet;
    dbConsulta: TppDBPipeline;
    Rel: TppReport;
    DSConsulta: TDataSource;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLine1: TppLine;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppSystemVariable3: TppSystemVariable;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLine2: TppLine;
    ppLabel4: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppLabel5: TppLabel;
    ppDBText3: TppDBText;
    CDSConsultaCha_Id: TAutoIncField;
    CDSConsultaCha_DataAbertura: TDateField;
    CDSConsultaCha_HoraAbertura: TTimeField;
    CDSConsultaCha_Descricao: TStringField;
    CDSConsultaCli_Nome: TWideStringField;
    CDSConsultaTip_Nome: TWideStringField;
    CDSConsultaSta_Nome: TWideStringField;
    CDSCadastroCha_Id: TAutoIncField;
    CDSCadastroCha_DataAbertura: TDateField;
    CDSCadastroCha_HoraAbertura: TTimeField;
    CDSCadastroCha_Cliente: TIntegerField;
    CDSCadastroCha_UsuarioAbertura: TIntegerField;
    CDSCadastroCha_Contato: TStringField;
    CDSCadastroCha_Nivel: TIntegerField;
    CDSCadastroCha_Tipo: TIntegerField;
    CDSCadastroCha_Status: TIntegerField;
    CDSCadastroCha_Descricao: TStringField;
    CDSCadastroUsu_Codigo: TIntegerField;
    CDSCadastroCli_Codigo: TIntegerField;
    CDSCadastroCli_Nome: TWideStringField;
    CDSCadastroTip_Codigo: TIntegerField;
    CDSCadastroTip_Nome: TWideStringField;
    CDSCadastroSta_Codigo: TIntegerField;
    CDSCadastroSta_Nome: TWideStringField;
    CDSConsultaCha_Nivel: TStringField;
    CDSChamadoOcorrenciaCons: TClientDataSet;
    CDSChamadoOcorrenciaConsChOco_Id: TAutoIncField;
    CDSChamadoOcorrenciaConsChOco_Chamado: TIntegerField;
    CDSChamadoOcorrenciaConsChOco_Docto: TStringField;
    CDSChamadoOcorrenciaConsChOco_Data: TDateField;
    CDSChamadoOcorrenciaConsChOco_HoraInicio: TTimeField;
    CDSChamadoOcorrenciaConsChOco_HoraFim: TTimeField;
    CDSChamadoOcorrenciaConsChOco_Usuario: TIntegerField;
    CDSChamadoOcorrenciaConsChOco_UsuarioColab1: TIntegerField;
    CDSChamadoOcorrenciaConsChOco_UsuarioColab2: TIntegerField;
    CDSChamadoOcorrenciaConsChOco_UsuarioColab3: TIntegerField;
    CDSChamadoOcorrenciaConsChOco_DescricaoTecnica: TStringField;
    CDSChamadoOcorrenciaConsChOco_DescricaoSolucao: TStringField;
    CDSChamadoOcorrenciaConsChOco_Anexo: TStringField;
    CDSChamadoOcorrenciaConsUsu_Codigo: TIntegerField;
    CDSChamadoOcorrenciaConsUsu_Codigo1: TIntegerField;
    CDSChamadoOcorrenciaConsUsu_Codigo2: TIntegerField;
    CDSChamadoOcorrenciaConsUsu_Codigo3: TIntegerField;
    CDSChamadoStatus: TClientDataSet;
    CDSChamadoStatusChSta_Id: TAutoIncField;
    CDSChamadoStatusChSta_Chamado: TIntegerField;
    CDSChamadoStatusChSta_Data: TDateField;
    CDSChamadoStatusChSta_Status: TIntegerField;
    CDSChamadoStatusChSta_Usuario: TIntegerField;
    CDSChamadoStatusSta_Nome: TWideStringField;
    CDSChamadoStatusSta_Codigo: TIntegerField;
    CDSChamadoStatusUsu_Codigo: TIntegerField;
    CDSChamadoOcorrenciaConsChOco_TotalHoras: TFloatField;
    CDSCadastroCha_Modulo: TIntegerField;
    CDSCadastroCha_Produto: TIntegerField;
    CDSCadastroCha_UsuarioAtendeAtual: TIntegerField;
    CDSCadastroMod_Codigo: TIntegerField;
    CDSCadastroMod_Nome: TWideStringField;
    CDSCadastroProd_Codigo: TIntegerField;
    CDSCadastroProd_Nome: TWideStringField;
    CDSChamadoQuadro1: TClientDataSet;
    CDSChamadoQuadro1Cha_Id: TAutoIncField;
    CDSChamadoQuadro1Cha_DataAbertura: TDateField;
    CDSChamadoQuadro1Cha_HoraAbertura: TTimeField;
    CDSChamadoQuadro1Cli_Nome: TWideStringField;
    CDSChamadoQuadro1Cha_Nivel: TStringField;
    CDSChamadoQuadro1Tip_Nome: TWideStringField;
    CDSChamadoQuadro2: TClientDataSet;
    CDSChamadoQuadro2Cha_Id: TAutoIncField;
    CDSChamadoQuadro2Cha_DataAbertura: TDateField;
    CDSChamadoQuadro2Cha_HoraAbertura: TTimeField;
    CDSChamadoQuadro2Cli_Nome: TWideStringField;
    CDSChamadoQuadro2Cha_Nivel: TStringField;
    CDSChamadoQuadro2Tip_Nome: TWideStringField;
    CDSChamadoQuadro3: TClientDataSet;
    CDSChamadoQuadro3Cha_Id: TAutoIncField;
    CDSChamadoQuadro3Cha_DataAbertura: TDateField;
    CDSChamadoQuadro3Cha_HoraAbertura: TTimeField;
    CDSChamadoQuadro3Cli_Nome: TWideStringField;
    CDSChamadoQuadro3Cha_Nivel: TStringField;
    CDSChamadoQuadro3Tip_Nome: TWideStringField;
    CDSChamadoQuadro4: TClientDataSet;
    CDSChamadoQuadro4Cha_Id: TAutoIncField;
    CDSChamadoQuadro4Cha_DataAbertura: TDateField;
    CDSChamadoQuadro4Cha_HoraAbertura: TTimeField;
    CDSChamadoQuadro4Cli_Nome: TWideStringField;
    CDSChamadoQuadro4Cha_Nivel: TStringField;
    CDSChamadoQuadro4Tip_Nome: TWideStringField;
    CDSChamadoQuadro5: TClientDataSet;
    CDSChamadoQuadro6: TClientDataSet;
    CDSChamadoQuadro5Cha_Id: TAutoIncField;
    CDSChamadoQuadro5Cha_DataAbertura: TDateField;
    CDSChamadoQuadro5Cha_HoraAbertura: TTimeField;
    CDSChamadoQuadro5Cli_Nome: TWideStringField;
    CDSChamadoQuadro5Cha_Nivel: TStringField;
    CDSChamadoQuadro5Tip_Nome: TWideStringField;
    CDSChamadoQuadro6Cha_Id: TAutoIncField;
    CDSChamadoQuadro6Cha_DataAbertura: TDateField;
    CDSChamadoQuadro6Cha_HoraAbertura: TTimeField;
    CDSChamadoQuadro6Cli_Nome: TWideStringField;
    CDSChamadoQuadro6Cha_Nivel: TStringField;
    CDSChamadoQuadro6Tip_Nome: TWideStringField;
    CDSListarProblemaSolucao: TClientDataSet;
    CDSListarProblemaSolucaoChOco_Chamado: TIntegerField;
    CDSListarProblemaSolucaoChOco_Data: TDateField;
    CDSListarProblemaSolucaoChOco_HoraInicio: TTimeField;
    CDSListarProblemaSolucaoChOco_HoraFim: TTimeField;
    CDSListarProblemaSolucaoChOco_DescricaoSolucao: TStringField;
    CDSListarProblemaSolucaoChOco_DescricaoTecnica: TStringField;
    CDSChamadoQuadro1CTempo: TStringField;
    CDSChamadoQuadro2CTempo: TStringField;
    CDSChamadoQuadro3CTempo: TStringField;
    CDSChamadoQuadro4CTempo: TStringField;
    CDSChamadoQuadro5CTempo: TStringField;
    CDSChamadoQuadro6CTempo: TStringField;
    CDSListarProblemaSolucaoCTempo: TStringField;
    CDSConsultaUsu_nome: TWideStringField;
    CDSCadastroUsu_Nome: TWideStringField;
    CDSChamadoOcorrenciaConsUsu_Nome: TWideStringField;
    CDSChamadoOcorrenciaConsUsu_Nome1: TWideStringField;
    CDSChamadoOcorrenciaConsUsu_Nome2: TWideStringField;
    CDSChamadoOcorrenciaConsUsu_Nome3: TWideStringField;
    CDSChamadoStatusUsu_Nome: TWideStringField;
    CDSChamadoQuadro1Usu_Nome: TWideStringField;
    CDSChamadoQuadro2Usu_Nome: TWideStringField;
    CDSChamadoQuadro3Usu_Nome: TWideStringField;
    CDSChamadoQuadro4Usu_Nome: TWideStringField;
    CDSChamadoQuadro5Usu_Nome: TWideStringField;
    CDSChamadoQuadro6Usu_Nome: TWideStringField;
    CDSListarProblemaSolucaoUsu_Nome: TWideStringField;
    CDSChamadoOcorrenciaConsChOco_Versao: TStringField;
    CDSChamadoQuadro1Nivel: TIntegerField;
    CDSChamadoQuadro1Cha_UsuarioAtendeAtual: TIntegerField;
    CDSChamadoQuadro1Sta_Codigo: TIntegerField;
    CDSChamadoQuadro2Nivel: TIntegerField;
    CDSChamadoQuadro2Cha_UsuarioAtendeAtual: TIntegerField;
    CDSChamadoQuadro2Sta_Codigo: TIntegerField;
    CDSChamadoQuadro3Nivel: TIntegerField;
    CDSChamadoQuadro3Cha_UsuarioAtendeAtual: TIntegerField;
    CDSChamadoQuadro3Sta_Codigo: TIntegerField;
    CDSChamadoQuadro4Nivel: TIntegerField;
    CDSChamadoQuadro4Cha_UsuarioAtendeAtual: TIntegerField;
    CDSChamadoQuadro4Sta_Codigo: TIntegerField;
    CDSChamadoQuadro5Nivel: TIntegerField;
    CDSChamadoQuadro5Cha_UsuarioAtendeAtual: TIntegerField;
    CDSChamadoQuadro5Sta_Codigo: TIntegerField;
    CDSChamadoQuadro6Nivel: TIntegerField;
    CDSChamadoQuadro6Cha_UsuarioAtendeAtual: TIntegerField;
    CDSChamadoQuadro6Sta_Codigo: TIntegerField;
    CDSCadastroCha_HoraAtendeAtual: TTimeField;
    CDSChamadoQuadro1Cli_Codigo: TIntegerField;
    CDSChamadoQuadro2Cli_Codigo: TIntegerField;
    CDSChamadoQuadro3Cli_Codigo: TIntegerField;
    CDSChamadoQuadro4Cli_Codigo: TIntegerField;
    CDSChamadoQuadro5Cli_Codigo: TIntegerField;
    CDSChamadoQuadro6Cli_Codigo: TIntegerField;
    CDSChamadoQuadro1cha_HoraAtendeAtual: TTimeField;
    CDSChamadoQuadro2cha_HoraAtendeAtual: TTimeField;
    CDSChamadoQuadro3cha_HoraAtendeAtual: TTimeField;
    CDSChamadoQuadro4cha_HoraAtendeAtual: TTimeField;
    CDSChamadoQuadro5cha_HoraAtendeAtual: TTimeField;
    CDSChamadoQuadro6cha_HoraAtendeAtual: TTimeField;
    CDSChamadoQuadro1CTempoPar10: TStringField;
    CDSChamadoQuadro1CTempoParOutro: TStringField;
    CDSChamadoQuadro2CTempoPar10: TStringField;
    CDSChamadoQuadro2CTempoParOutro: TStringField;
    CDSChamadoQuadro3CTempoPar10: TStringField;
    CDSChamadoQuadro3CTempoParOutro: TStringField;
    CDSChamadoQuadro4CTempoPar10: TStringField;
    CDSChamadoQuadro4CTempoParOutro: TStringField;
    CDSChamadoQuadro5CTempoPar10: TStringField;
    CDSChamadoQuadro5CTempoParOutro: TStringField;
    CDSChamadoQuadro6CTempoPar10: TStringField;
    CDSChamadoQuadro6CTempoParOutro: TStringField;
    CDSConsultaCli_Fantasia: TWideStringField;
    CDSConsultaCha_Status: TIntegerField;
    CDSChamadoStatusChSta_Hora: TTimeField;
    CDSCadastroCha_TipoMovimento: TIntegerField;
    CDSAtividadeQuadro1: TClientDataSet;
    CDSAtividadeQuadro2: TClientDataSet;
    CDSAtividadeQuadro3: TClientDataSet;
    CDSAtividadeQuadro4: TClientDataSet;
    CDSAtividadeQuadro5: TClientDataSet;
    CDSAtividadeQuadro6: TClientDataSet;
    CDSAtividadeQuadro1Cha_Id: TAutoIncField;
    CDSAtividadeQuadro1Cha_DataAbertura: TDateField;
    CDSAtividadeQuadro1Cha_HoraAbertura: TTimeField;
    CDSAtividadeQuadro1Cli_Nome: TWideStringField;
    CDSAtividadeQuadro1Cha_Nivel: TStringField;
    CDSAtividadeQuadro1Nivel: TIntegerField;
    CDSAtividadeQuadro1Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividadeQuadro1Sta_Codigo: TIntegerField;
    CDSAtividadeQuadro1Cli_Codigo: TIntegerField;
    CDSAtividadeQuadro1Tip_Nome: TWideStringField;
    CDSAtividadeQuadro1Usu_Nome: TWideStringField;
    CDSAtividadeQuadro1cha_HoraAtendeAtual: TTimeField;
    CDSAtividadeQuadro2Cha_Id: TAutoIncField;
    CDSAtividadeQuadro2Cha_DataAbertura: TDateField;
    CDSAtividadeQuadro2Cha_HoraAbertura: TTimeField;
    CDSAtividadeQuadro2Cli_Nome: TWideStringField;
    CDSAtividadeQuadro2Cha_Nivel: TStringField;
    CDSAtividadeQuadro2Nivel: TIntegerField;
    CDSAtividadeQuadro2Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividadeQuadro2Sta_Codigo: TIntegerField;
    CDSAtividadeQuadro2Cli_Codigo: TIntegerField;
    CDSAtividadeQuadro2Tip_Nome: TWideStringField;
    CDSAtividadeQuadro2Usu_Nome: TWideStringField;
    CDSAtividadeQuadro2cha_HoraAtendeAtual: TTimeField;
    CDSAtividadeQuadro3Cha_Id: TAutoIncField;
    CDSAtividadeQuadro3Cha_DataAbertura: TDateField;
    CDSAtividadeQuadro3Cha_HoraAbertura: TTimeField;
    CDSAtividadeQuadro3Cli_Nome: TWideStringField;
    CDSAtividadeQuadro3Cha_Nivel: TStringField;
    CDSAtividadeQuadro3Nivel: TIntegerField;
    CDSAtividadeQuadro3Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividadeQuadro3Sta_Codigo: TIntegerField;
    CDSAtividadeQuadro3Cli_Codigo: TIntegerField;
    CDSAtividadeQuadro3Tip_Nome: TWideStringField;
    CDSAtividadeQuadro3Usu_Nome: TWideStringField;
    CDSAtividadeQuadro3cha_HoraAtendeAtual: TTimeField;
    CDSAtividadeQuadro4Cha_Id: TAutoIncField;
    CDSAtividadeQuadro4Cha_DataAbertura: TDateField;
    CDSAtividadeQuadro4Cha_HoraAbertura: TTimeField;
    CDSAtividadeQuadro4Cli_Nome: TWideStringField;
    CDSAtividadeQuadro4Cha_Nivel: TStringField;
    CDSAtividadeQuadro4Nivel: TIntegerField;
    CDSAtividadeQuadro4Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividadeQuadro4Sta_Codigo: TIntegerField;
    CDSAtividadeQuadro4Cli_Codigo: TIntegerField;
    CDSAtividadeQuadro4Tip_Nome: TWideStringField;
    CDSAtividadeQuadro4Usu_Nome: TWideStringField;
    CDSAtividadeQuadro4cha_HoraAtendeAtual: TTimeField;
    CDSAtividadeQuadro5Cha_Id: TAutoIncField;
    CDSAtividadeQuadro5Cha_DataAbertura: TDateField;
    CDSAtividadeQuadro5Cha_HoraAbertura: TTimeField;
    CDSAtividadeQuadro5Cli_Nome: TWideStringField;
    CDSAtividadeQuadro5Cha_Nivel: TStringField;
    CDSAtividadeQuadro5Nivel: TIntegerField;
    CDSAtividadeQuadro5Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividadeQuadro5Sta_Codigo: TIntegerField;
    CDSAtividadeQuadro5Cli_Codigo: TIntegerField;
    CDSAtividadeQuadro5Tip_Nome: TWideStringField;
    CDSAtividadeQuadro5Usu_Nome: TWideStringField;
    CDSAtividadeQuadro5cha_HoraAtendeAtual: TTimeField;
    CDSAtividadeQuadro6Cha_Id: TAutoIncField;
    CDSAtividadeQuadro6Cha_DataAbertura: TDateField;
    CDSAtividadeQuadro6Cha_HoraAbertura: TTimeField;
    CDSAtividadeQuadro6Cli_Nome: TWideStringField;
    CDSAtividadeQuadro6Cha_Nivel: TStringField;
    CDSAtividadeQuadro6Nivel: TIntegerField;
    CDSAtividadeQuadro6Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividadeQuadro6Sta_Codigo: TIntegerField;
    CDSAtividadeQuadro6Cli_Codigo: TIntegerField;
    CDSAtividadeQuadro6Tip_Nome: TWideStringField;
    CDSAtividadeQuadro6Usu_Nome: TWideStringField;
    CDSAtividadeQuadro6cha_HoraAtendeAtual: TTimeField;
    CDSAtividadeQuadro1CTempo: TStringField;
    CDSChamadoQuadro2UltimaData: TDateField;
    CDSChamadoQuadro1UltimaData: TDateField;
    CDSChamadoQuadro3UltimaData: TDateField;
    CDSChamadoQuadro4UltimaData: TDateField;
    CDSChamadoQuadro5UltimaData: TDateField;
    CDSChamadoQuadro6UltimaData: TDateField;
    CDSAtividadeQuadro1CTempoPar10: TStringField;
    CDSAtividadeQuadro1CTempoParOutro: TStringField;
    CDSAtividadeQuadro2CTempo: TStringField;
    CDSAtividadeQuadro2CTempoPar10: TStringField;
    CDSAtividadeQuadro2CTempoParOutro: TStringField;
    CDSAtividadeQuadro3CTempo: TStringField;
    CDSAtividadeQuadro3CTempoPar10: TStringField;
    CDSAtividadeQuadro3CTempoParOutro: TStringField;
    CDSAtividadeQuadro4CTempo: TStringField;
    CDSAtividadeQuadro4CTempoPar10: TStringField;
    CDSAtividadeQuadro4CTempoParOutro: TStringField;
    CDSAtividadeQuadro5CTempo: TStringField;
    CDSAtividadeQuadro5CTempoPar10: TStringField;
    CDSAtividadeQuadro5CTempoParOutro: TStringField;
    CDSAtividadeQuadro6CTempo: TStringField;
    CDSAtividadeQuadro6CTempoPar10: TStringField;
    CDSAtividadeQuadro6CTempoParOutro: TStringField;
    CDSAtividadeQuadro1UltimaData: TDateField;
    CDSAtividadeQuadro2UltimaData: TDateField;
    CDSAtividadeQuadro3UltimaData: TDateField;
    CDSAtividadeQuadro4UltimaData: TDateField;
    CDSAtividadeQuadro5UltimaData: TDateField;
    CDSAtividadeQuadro6UltimaData: TDateField;
    CDSAtividadeQuadro1Par_Codigo: TIntegerField;
    CDSAtividadeQuadro3Par_Codigo: TIntegerField;
    CDSAtividadeQuadro4Par_Codigo: TIntegerField;
    CDSAtividadeQuadro5Par_Codigo: TIntegerField;
    CDSAtividadeQuadro6Par_Codigo: TIntegerField;
    CDSChamadoQuadro1Par_Codigo: TIntegerField;
    CDSChamadoQuadro2Par_Codigo: TIntegerField;
    CDSChamadoQuadro3Par_Codigo: TIntegerField;
    CDSChamadoQuadro4Par_Codigo: TIntegerField;
    CDSChamadoQuadro5Par_Codigo: TIntegerField;
    CDSChamadoQuadro6Par_Codigo: TIntegerField;
    CDSChamadoQuadro2UltimaHora: TTimeField;
    CDSChamadoQuadro1UltimaHora: TTimeField;
    CDSChamadoQuadro3UltimaHora: TTimeField;
    CDSChamadoQuadro4UltimaHora: TTimeField;
    CDSChamadoQuadro5UltimaHora: TTimeField;
    CDSChamadoQuadro6UltimaHora: TTimeField;
    CDSAtividadeQuadro1UltimaHora: TTimeField;
    CDSAtividadeQuadro2UltimaHora: TTimeField;
    CDSAtividadeQuadro2Par_Codigo: TIntegerField;
    CDSAtividadeQuadro3UltimaHora: TTimeField;
    CDSAtividadeQuadro4UltimaHora: TTimeField;
    CDSAtividadeQuadro5UltimaHora: TTimeField;
    CDSAtividadeQuadro6UltimaHora: TTimeField;
    CDSChamadoOcorrColaborador: TClientDataSet;
    CDSChamadoOcorrColaboradorChaOCol_Id: TAutoIncField;
    CDSChamadoOcorrColaboradorChaOCol_ChamadoOcorrencia: TIntegerField;
    CDSChamadoOcorrColaboradorChaOCol_Usuario: TIntegerField;
    CDSChamadoOcorrColaboradorChaOcol_HoraInicio: TTimeField;
    CDSChamadoOcorrColaboradorChaOCol_HoraFim: TTimeField;
    CDSChamadoOcorrColaboradorUsu_Nome: TWideStringField;
    CDSChamadoOcorrColaboradorUsu_Codigo: TIntegerField;
    CDSChamadoAnexo: TClientDataSet;
    CDSChamadoAnexoCha_Id: TAutoIncField;
    CDSChamadoAnexoCha_DataAbertura: TDateField;
    CDSChamadoAnexoCha_HoraAbertura: TTimeField;
    CDSChamadoAnexoCha_Contato: TStringField;
    CDSChamadoAnexoCli_Nome: TWideStringField;
    CDSChamadoAnexoChOco_Docto: TStringField;
    CDSChamadoAnexoChOco_Data: TDateField;
    CDSChamadoAnexoChOco_Anexo: TStringField;
    CDSChamadoOcorrColaboradorChaOcol_TotalHoras: TFloatField;
    CDSQuadro: TClientDataSet;
    CDSQuadroQuadro: TStringField;
    CDSQuadroCha_Id: TIntegerField;
    CDSQuadroCha_DataAbertura: TDateField;
    CDSQuadroCha_HoraAbertura: TTimeField;
    CDSQuadroCli_Nome: TWideStringField;
    CDSQuadroCha_Nivel: TStringField;
    CDSQuadroNivel: TIntegerField;
    CDSQuadroCha_UsuarioAtendeAtual: TIntegerField;
    CDSQuadroSta_Codigo: TIntegerField;
    CDSQuadroCli_Codigo: TIntegerField;
    CDSQuadroTip_Nome: TWideStringField;
    CDSQuadroUltimaHora: TTimeField;
    CDSQuadrocha_HoraAtendeAtual: TTimeField;
    CDSQuadroUltimaData: TDateField;
    CDSQuadroPar_Codigo: TIntegerField;
    CDSQuadroUsu_Nome: TWideStringField;
    CDSQuadroCTempo: TStringField;
    CDSQuadroCTempoPar10: TStringField;
    CDSQuadroCTempoParOutro: TStringField;
    CDSQuadro1: TClientDataSet;
    CDSQuadro1Cha_Id: TIntegerField;
    CDSQuadro1Cha_DataAbertura: TDateField;
    CDSQuadro1Cha_horaAbertura: TTimeField;
    CDSQuadro1Cli_Nome: TStringField;
    CDSQuadro1Nivel: TStringField;
    CDSQuadro1Tip_Nome: TStringField;
    CDSQuadro1Usu_Nome: TStringField;
    CDSQuadro1CTempo: TStringField;
    CDSQuadro1CTempoParOutro: TStringField;
    CDSQuadro1Cha_UsuarioAtendeAtual: TIntegerField;
    CDSQuadro1Cha_HoraAtendeAtual: TTimeField;
    CDSQuadro1UltimaData: TDateField;
    CDSQuadro1Sta_Codigo: TIntegerField;
    CDSQuadro1Cli_Codigo: TIntegerField;
    CDSQuadro1UltimaHora: TTimeField;
    CDSQuadro1CTempoPar10: TStringField;
    CDSQuadro2: TClientDataSet;
    CDSQuadro2Cha_Id: TIntegerField;
    CDSQuadro2Cha_DataAbertura: TDateField;
    CDSQuadro2Cha_HoraAbertura: TTimeField;
    CDSQuadro2Cli_Nome: TStringField;
    CDSQuadro2Nivel: TStringField;
    CDSQuadro2Tip_Nome: TStringField;
    CDSQuadro2Usu_Nome: TStringField;
    CDSQuadro2CTempo: TStringField;
    CDSQuadro2CTempoParOutro: TStringField;
    CDSQuadro2CTempoPar10: TStringField;
    CDSQuadro2Cha_UsuarioAtendeAtual: TIntegerField;
    CDSQuadro2Cha_HoraAtendeAtual: TTimeField;
    CDSQuadro2UltimaData: TDateField;
    CDSQuadro2Sta_Codigo: TIntegerField;
    CDSQuadro2Cli_Codigo: TIntegerField;
    CDSQuadro2UltimaHora: TTimeField;
    CDSQuadro3: TClientDataSet;
    CDSQuadro3Cha_Id: TIntegerField;
    CDSQuadro3Cha_DataAbertura: TDateField;
    CDSQuadro3Cha_HoraAbertura: TTimeField;
    CDSQuadro3Cli_Nome: TStringField;
    CDSQuadro3Nivel: TStringField;
    CDSQuadro3Tip_Nome: TStringField;
    CDSQuadro3Usu_Nome: TStringField;
    CDSQuadro3CTempo: TStringField;
    CDSQuadro3CTempoParOutro: TStringField;
    CDSQuadro3CTempoPar10: TStringField;
    CDSQuadro3Cha_UsuarioAtendeAtual: TIntegerField;
    CDSQuadro3Cha_HoraAtendeAtual: TTimeField;
    CDSQuadro3UltimaData: TDateField;
    CDSQuadro3Sta_Codigo: TIntegerField;
    CDSQuadro3Cli_Codigo: TIntegerField;
    CDSQuadro3UltimaHora: TTimeField;
    CDSQuadro4: TClientDataSet;
    CDSQuadro4Cha_Id: TIntegerField;
    CDSQuadro4Cha_DataAbertura: TDateField;
    CDSQuadro4Cha_HoraAbertura: TTimeField;
    CDSQuadro4Cli_Nome: TStringField;
    CDSQuadro4Nivel: TStringField;
    CDSQuadro4Tip_Nome: TStringField;
    CDSQuadro4Usu_Nome: TStringField;
    CDSQuadro4CTempo: TStringField;
    CDSQuadro4CTempoParOutro: TStringField;
    CDSQuadro4CTempoPar10: TStringField;
    CDSQuadro4Cha_UsuarioAtendeAtual: TIntegerField;
    CDSQuadro4Cha_HoraAtendeAtual: TTimeField;
    CDSQuadro4UltimaData: TDateField;
    CDSQuadro4Cha_Codigo: TIntegerField;
    CDSQuadro4Cli_Codigo: TIntegerField;
    CDSQuadro4UltimaHora: TTimeField;
    CDSQuadro5: TClientDataSet;
    CDSQuadro5Cha_Id: TIntegerField;
    CDSQuadro5Cha_DataAbertura: TDateField;
    CDSQuadro5Cha_HoraAbertura: TTimeField;
    CDSQuadro5Cli_Nome: TStringField;
    CDSQuadro5Nivel: TStringField;
    CDSQuadro5Tip_Nome: TStringField;
    CDSQuadro5Usu_Nome: TStringField;
    CDSQuadro5CTempo: TStringField;
    CDSQuadro5CTempoParOutro: TStringField;
    CDSQuadro5CTempoPar10: TStringField;
    CDSQuadro5Cha_UsuarioAtendeAtual: TIntegerField;
    CDSQuadro5Cha_HoraAtendeAtual: TTimeField;
    CDSQuadro5UltimaData: TDateField;
    CDSQuadro5Sta_Codigo: TIntegerField;
    CDSQuadro5Cli_Codigo: TIntegerField;
    CDSQuadro5UltimaHora: TTimeField;
    CDSQuadro6: TClientDataSet;
    CDSQuadro6Cha_Id: TIntegerField;
    CDSQuadro6Cha_DataAbertura: TDateField;
    CDSQuadro6Cha_HoraAbertura: TTimeField;
    CDSQuadro6Cli_Nome: TStringField;
    CDSQuadro6Nivel: TStringField;
    CDSQuadro6Tip_Nome: TStringField;
    CDSQuadro6Usu_Nome: TStringField;
    CDSQuadro6CTempo: TStringField;
    CDSQuadro6CTempoParOutro: TStringField;
    CDSQuadro6CTempoPar10: TStringField;
    CDSQuadro6Cha_UsuarioAtendeAtual: TIntegerField;
    CDSQuadro6Cha_HoraAtendeAtual: TTimeField;
    CDSQuadro6UltimaData: TDateField;
    CDSQuadro6Sta_Codigo: TIntegerField;
    CDSQuadro6Cli_Codigo: TIntegerField;
    CDSQuadro6UltimaHora: TTimeField;
    CDSAtividade: TClientDataSet;
    CDSAtividadeQuadro: TStringField;
    CDSAtividadeCha_Id: TIntegerField;
    CDSAtividadeCha_DataAbertura: TDateField;
    CDSAtividadeCha_HoraAbertura: TTimeField;
    CDSAtividadeCli_Nome: TWideStringField;
    CDSAtividadeCha_Nivel: TStringField;
    CDSAtividadeNivel: TIntegerField;
    CDSAtividadeCha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividadeSta_Codigo: TIntegerField;
    CDSAtividadeCli_Codigo: TIntegerField;
    CDSAtividadeTip_Nome: TWideStringField;
    CDSAtividadeUltimaHora: TTimeField;
    CDSAtividadecha_HoraAtendeAtual: TTimeField;
    CDSAtividadeUltimaData: TDateField;
    CDSAtividadePar_Codigo: TIntegerField;
    CDSAtividadeUsu_Nome: TWideStringField;
    CDSAtividade1: TClientDataSet;
    CDSAtividade1Cha_Id: TIntegerField;
    CDSAtividade1Cha_DataAbertura: TDateField;
    CDSAtividade1Cha_HoraAbertura: TTimeField;
    CDSAtividade1Cli_Nome: TStringField;
    CDSAtividade1Nivel: TStringField;
    CDSAtividade1Tip_Nome: TStringField;
    CDSAtividade1Usu_Nome: TStringField;
    CDSAtividade1CTempo: TStringField;
    CDSAtividade1CTempoParOutro: TStringField;
    CDSAtividade1CTempoPar10: TStringField;
    CDSAtividade1Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividade1Cha_HoraAtendeAtual: TTimeField;
    CDSAtividade1Sta_Codigo: TIntegerField;
    CDSAtividade1Cli_Codigo: TIntegerField;
    CDSAtividade1UltimaData: TDateField;
    CDSAtividade1UltimaHora: TTimeField;
    CDSAtividade2: TClientDataSet;
    CDSAtividade2Cha_Id: TIntegerField;
    CDSAtividade2Cha_DataAbertura: TDateField;
    CDSAtividade2Cha_HoraAbertura: TTimeField;
    CDSAtividade2Nivel: TStringField;
    CDSAtividade2Tip_Nome: TStringField;
    CDSAtividade2Usu_Nome: TStringField;
    CDSAtividade2CTempo: TStringField;
    CDSAtividade2CTempoParOutro: TStringField;
    CDSAtividade2CTempoPar10: TStringField;
    CDSAtividade2Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividade2Cha_HoraAtendeAtual: TTimeField;
    CDSAtividade2Sta_Codigo: TIntegerField;
    CDSAtividade2Cli_Codigo: TIntegerField;
    CDSAtividade2UltimaData: TDateField;
    CDSAtividade2UltimaHora: TTimeField;
    CDSAtividade3: TClientDataSet;
    CDSAtividade3Cha_Id: TIntegerField;
    CDSAtividade3Cha_DataAbertura: TDateField;
    CDSAtividade3Cha_HoraAbertura: TTimeField;
    CDSAtividade3Cli_Nome: TStringField;
    CDSAtividade3Nivel: TStringField;
    CDSAtividade3Tip_Nome: TStringField;
    CDSAtividade3Usu_Nome: TStringField;
    CDSAtividade3CTempo: TStringField;
    CDSAtividade3CTempoParOutro: TStringField;
    CDSAtividade3CTempoPar10: TStringField;
    CDSAtividade3Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividade3Cha_HoraAtendeAtual: TTimeField;
    CDSAtividade3UltimaData: TDateField;
    CDSAtividade3Sta_Codigo: TIntegerField;
    CDSAtividade3Cli_Codigo: TIntegerField;
    CDSAtividade3UltimaHora: TTimeField;
    CDSAtividade4: TClientDataSet;
    CDSAtividade4Cha_Id: TIntegerField;
    CDSAtividade4Cha_DataAbertura: TDateField;
    CDSAtividade4Cha_HoraAbertura: TTimeField;
    CDSAtividade4Cli_Nome: TStringField;
    CDSAtividade4Nivel: TStringField;
    CDSAtividade4Tip_Nome: TStringField;
    CDSAtividade4Usu_Nome: TStringField;
    CDSAtividade4CTempo: TStringField;
    CDSAtividade4CTempoParOutro: TStringField;
    CDSAtividade4CTempoPar10: TStringField;
    CDSAtividade4Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividade4Cha_HoraAtendeAtual: TTimeField;
    CDSAtividade4Sta_Codigo: TIntegerField;
    CDSAtividade4Cli_Codigo: TIntegerField;
    CDSAtividade4UltimaData: TDateField;
    CDSAtividade4UltimaHora: TTimeField;
    CDSAtividade5: TClientDataSet;
    CDSAtividade5Cha_Id: TIntegerField;
    CDSAtividade5Cha_DataAbertura: TDateField;
    CDSAtividade5Cha_HoraAbertura: TTimeField;
    CDSAtividade5Cli_Nome: TStringField;
    CDSAtividade5Nivel: TStringField;
    CDSAtividade5Tip_Nome: TStringField;
    CDSAtividade5Usu_Nome: TStringField;
    CDSAtividade5CTempo: TStringField;
    CDSAtividade5CTempoParOutro: TStringField;
    CDSAtividade5CTempoPar10: TStringField;
    CDSAtividade5Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividade5Cha_HoraAtendeAtual: TTimeField;
    CDSAtividade5Sta_Codigo: TIntegerField;
    CDSAtividade5Cli_Codigo: TIntegerField;
    CDSAtividade5UltimaData: TDateField;
    CDSAtividade5UltimaHora: TTimeField;
    CDSAtividade6: TClientDataSet;
    CDSAtividade6Cha_Id: TIntegerField;
    CDSAtividade6Cha_DataAbertura: TDateField;
    CDSAtividade6Cha_HoraAbertura: TTimeField;
    CDSAtividade6Cli_Nome: TStringField;
    CDSAtividade6Nivel: TStringField;
    CDSAtividade6Tip_Nome: TStringField;
    CDSAtividade6Usu_Nome: TStringField;
    CDSAtividade6CTempo: TStringField;
    CDSAtividade6CTempoParOutro: TStringField;
    CDSAtividade6CTempoPar10: TStringField;
    CDSAtividade6Cha_UsuarioAtendeAtual: TIntegerField;
    CDSAtividade6Cha_HoraAtendeAtual: TTimeField;
    CDSAtividade6Sta_Codigo: TIntegerField;
    CDSAtividade6Cli_Codigo: TIntegerField;
    CDSAtividade6UltimaData: TDateField;
    CDSAtividade6UltimaHora: TTimeField;
    CDSAtividade2Cli_Nome: TStringField;
    CDSQuadroCli_Perfil: TStringField;
    CDSQuadro1Cli_Perfil: TStringField;
    CDSQuadro2Cli_Perfil: TStringField;
    CDSQuadro3Cli_Perfil: TStringField;
    CDSQuadro4Cli_Perfil: TStringField;
    CDSQuadro5Cli_Perfil: TStringField;
    CDSQuadro6Cli_Perfil: TStringField;
    CDSAtividadeCli_Perfil: TStringField;
    CDSAtividade1Cli_Perfil: TStringField;
    CDSAtividade2Cli_Perfil: TStringField;
    CDSAtividade3Cli_Perfil: TStringField;
    CDSAtividade4Cli_Perfil: TStringField;
    CDSAtividade5Cli_Perfil: TStringField;
    CDSAtividade6Cli_Perfil: TStringField;
    CDSCadastroCha_Origem: TIntegerField;
    procedure CDSCadastroBeforePost(DataSet: TDataSet);
    procedure CDSCadastroCha_DataAberturaSetText(Sender: TField; const Text:
        string);
    procedure CDSCadastroCha_HoraAberturaSetText(Sender: TField; const Text:
        string);
    procedure CDSCadastroNewRecord(DataSet: TDataSet);
    procedure CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure CDSChamadoOcorrenciaConsBeforePost(DataSet: TDataSet);
    procedure CDSChamadoOcorrenciaConsChOco_DataSetText(Sender: TField; const Text:
        string);
    procedure CDSChamadoOcorrenciaConsChOco_HoraFimSetText(Sender: TField; const
        Text: string);
    procedure CDSChamadoOcorrenciaConsChOco_HoraInicioSetText(Sender: TField; const
        Text: string);
    procedure CDSChamadoOcorrenciaConsNewRecord(DataSet: TDataSet);
    procedure CDSChamadoOcorrenciaConsReconcileError(DataSet: TCustomClientDataSet;
        E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure DataModuleCreate(Sender: TObject);
    procedure CDSChamadoQuadro1CalcFields(DataSet: TDataSet);
    procedure CDSChamadoQuadro2CalcFields(DataSet: TDataSet);
    procedure CDSChamadoQuadro3CalcFields(DataSet: TDataSet);
    procedure CDSChamadoQuadro4CalcFields(DataSet: TDataSet);
    procedure CDSChamadoQuadro5CalcFields(DataSet: TDataSet);
    procedure CDSChamadoQuadro6CalcFields(DataSet: TDataSet);
    procedure CDSAtividadeQuadro1CalcFields(DataSet: TDataSet);
    procedure CDSAtividadeQuadro2CalcFields(DataSet: TDataSet);
    procedure CDSAtividadeQuadro3CalcFields(DataSet: TDataSet);
    procedure CDSAtividadeQuadro4CalcFields(DataSet: TDataSet);
    procedure CDSAtividadeQuadro5CalcFields(DataSet: TDataSet);
    procedure CDSAtividadeQuadro6CalcFields(DataSet: TDataSet);
    procedure CDSChamadoOcorrColaboradorBeforePost(DataSet: TDataSet);
    procedure CDSChamadoOcorrColaboradorReconcileError(
      DataSet: TCustomClientDataSet; E: EReconcileError;
      UpdateKind: TUpdateKind; var Action: TReconcileAction);
    procedure CDSQuadroCalcFields(DataSet: TDataSet);
    procedure CDSQuadro1CalcFields(DataSet: TDataSet);
    procedure CDSQuadro2CalcFields(DataSet: TDataSet);
    procedure CDSQuadro3CalcFields(DataSet: TDataSet);
    procedure CDSQuadro4CalcFields(DataSet: TDataSet);
    procedure CDSQuadro5CalcFields(DataSet: TDataSet);
    procedure CDSQuadro6CalcFields(DataSet: TDataSet);
    procedure CDSAtividade1CalcFields(DataSet: TDataSet);
    procedure CDSAtividade2CalcFields(DataSet: TDataSet);
    procedure CDSAtividade3CalcFields(DataSet: TDataSet);
    procedure CDSAtividade4CalcFields(DataSet: TDataSet);
    procedure CDSAtividade5CalcFields(DataSet: TDataSet);
    procedure CDSAtividade6CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FId: integer;
    FIdColaborador: Integer;
    function CalcularTempo(DataChamado, HoraChamado: TDateTime): string;
    function CalcularTempoOutros(DataChamado: TDateTime; HoraFim: TDateTime): string;
    function CalculaTempoPar10(AHoraAtendimento: TDateTime): string;
    function RetornarCalculoTempo(ADataSet: TDataSet): string;
    procedure CriarIndicesChamados();
    procedure CriarIndicesAtividades();
    procedure CriarIndices(AClientDataSet: TClientDataSet);
  public
    { Public declarations }
  end;

var
  DMChamado: TDMChamado;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFuncoesSIDomper, Vcl.Dialogs, uChamadoController;

{$R *.dfm}


function TDMChamado.CalcularTempo(DataChamado, HoraChamado: TDateTime): string;
begin
  try
    if Date = DataChamado then
      Result := FormatDateTime('hh:mm', Time - HoraChamado)
    else
      Result := FloatToStr(TFuncoes.DiferencaEntreDatas(DataChamado, Date));
  except
    Result := '00:00';
  end;
end;

function TDMChamado.CalcularTempoOutros(DataChamado, HoraFim: TDateTime): string;
begin
  try
    if DataChamado = Date then
      Result := FormatDateTime('hh:mm', Time - HoraFim)
    else
      Result := FloatToStr(TFuncoes.DiferencaEntreDatas(DataChamado, Date));
  except
    Result := '00:00';
  end;
end;

function TDMChamado.CalculaTempoPar10(AHoraAtendimento: TDateTime): string;
begin
  try
    Result := FormatDateTime('hh:mm', Time - AHoraAtendimento);
  except
    Result := '00:00';
  end;
end;

procedure TDMChamado.CDSAtividade1CalcFields(DataSet: TDataSet);
begin
  if CDSAtividade1.State = dsInternalCalc then
  begin
    CDSAtividade1CTempo.AsString := RetornarCalculoTempo(CDSAtividade1);
//    CDSAtividade1CTempo.AsString := CalcularTempo(CDSAtividade1Cha_DataAbertura.AsDateTime, CDSAtividade1Cha_HoraAbertura.AsDateTime);
    CDSAtividade1CTempoPar10.AsString := CalculaTempoPar10(CDSAtividade1cha_HoraAtendeAtual.AsDateTime);
    CDSAtividade1CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividade1UltimaData.AsDateTime, CDSAtividade1UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividade2CalcFields(DataSet: TDataSet);
begin
  if CDSAtividade2.State = dsInternalCalc then
  begin
    CDSAtividade2CTempo.AsString := RetornarCalculoTempo(CDSAtividade2);
//    CDSAtividade2CTempo.AsString := CalcularTempo(CDSAtividade2Cha_DataAbertura.AsDateTime, CDSAtividade2Cha_HoraAbertura.AsDateTime);
    CDSAtividade2CTempoPar10.AsString := CalculaTempoPar10(CDSAtividade2cha_HoraAtendeAtual.AsDateTime);
    CDSAtividade2CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividade2UltimaData.AsDateTime, CDSAtividade2UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividade3CalcFields(DataSet: TDataSet);
begin
  if CDSAtividade3.State = dsInternalCalc then
  begin
    CDSAtividade3CTempo.AsString := RetornarCalculoTempo(CDSAtividade3);
//    CDSAtividade3CTempo.AsString := CalcularTempo(CDSAtividade3Cha_DataAbertura.AsDateTime, CDSAtividade3Cha_HoraAbertura.AsDateTime);
    CDSAtividade3CTempoPar10.AsString := CalculaTempoPar10(CDSAtividade3cha_HoraAtendeAtual.AsDateTime);
    CDSAtividade3CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividade3UltimaData.AsDateTime, CDSAtividade3UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividade4CalcFields(DataSet: TDataSet);
begin
  if CDSAtividade4.State = dsInternalCalc then
  begin
    CDSAtividade4CTempo.AsString := RetornarCalculoTempo(CDSAtividade4);
//    CDSAtividade4CTempo.AsString := CalcularTempo(CDSAtividade4Cha_DataAbertura.AsDateTime, CDSAtividade4Cha_HoraAbertura.AsDateTime);
    CDSAtividade4CTempoPar10.AsString := CalculaTempoPar10(CDSAtividade4cha_HoraAtendeAtual.AsDateTime);
    CDSAtividade4CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividade4UltimaData.AsDateTime, CDSAtividade4UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividade5CalcFields(DataSet: TDataSet);
begin
  if CDSAtividade5.State = dsInternalCalc then
  begin
    CDSAtividade5CTempo.AsString := RetornarCalculoTempo(CDSAtividade5);
//    CDSAtividade5CTempo.AsString := CalcularTempo(CDSAtividade5Cha_DataAbertura.AsDateTime, CDSAtividade5Cha_HoraAbertura.AsDateTime);
    CDSAtividade5CTempoPar10.AsString := CalculaTempoPar10(CDSAtividade5cha_HoraAtendeAtual.AsDateTime);
    CDSAtividade5CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividade5UltimaData.AsDateTime, CDSAtividade5UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividade6CalcFields(DataSet: TDataSet);
begin
  if CDSAtividade6.State = dsInternalCalc then
  begin
    CDSAtividade6CTempo.AsString := RetornarCalculoTempo(CDSAtividade6);
//    CDSAtividade6CTempo.AsString := CalcularTempo(CDSAtividade6Cha_DataAbertura.AsDateTime, CDSAtividade6Cha_HoraAbertura.AsDateTime);
    CDSAtividade6CTempoPar10.AsString := CalculaTempoPar10(CDSAtividade6cha_HoraAtendeAtual.AsDateTime);
    CDSAtividade6CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividade6UltimaData.AsDateTime, CDSAtividade6UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividadeQuadro1CalcFields(DataSet: TDataSet);
begin
  if CDSAtividadeQuadro1.State = dsInternalCalc then
  begin
//    CDSAtividadeQuadro1CTempo.AsString := CalcularTempo(CDSAtividadeQuadro1UltimaData.AsDateTime, CDSAtividadeQuadro1Cha_HoraAbertura.AsDateTime);
    CDSAtividadeQuadro1CTempo.AsString := CalcularTempo(CDSAtividadeQuadro1Cha_DataAbertura.AsDateTime, CDSAtividadeQuadro1Cha_HoraAbertura.AsDateTime);
//    CDSAtividadeQuadro1CTempoPar10.AsString := CalcularTempo(CDSAtividadeQuadro1Cha_DataAbertura.AsDateTime, CDSAtividadeQuadro1cha_HoraAtendeAtual.AsDateTime);
    CDSAtividadeQuadro1CTempoPar10.AsString := CalculaTempoPar10(CDSAtividadeQuadro1cha_HoraAtendeAtual.AsDateTime);
    CDSAtividadeQuadro1CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividadeQuadro1UltimaData.AsDateTime, CDSAtividadeQuadro1cha_HoraAtendeAtual.AsDateTime);
//    CDSAtividadeQuadro1CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividadeQuadro1Cha_DataAbertura.AsDateTime, CDSAtividadeQuadro1UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividadeQuadro2CalcFields(DataSet: TDataSet);
begin
  if CDSAtividadeQuadro2.State = dsInternalCalc then
  begin
    CDSAtividadeQuadro2CTempo.AsString := CalcularTempo(CDSAtividadeQuadro2Cha_DataAbertura.AsDateTime, CDSAtividadeQuadro2Cha_HoraAbertura.AsDateTime);
    CDSAtividadeQuadro2CTempoPar10.AsString := CalculaTempoPar10(CDSAtividadeQuadro2cha_HoraAtendeAtual.AsDateTime);
    CDSAtividadeQuadro2CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividadeQuadro2UltimaData.AsDateTime, CDSAtividadeQuadro2UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividadeQuadro3CalcFields(DataSet: TDataSet);
begin
  if CDSAtividadeQuadro3.State = dsInternalCalc then
  begin
    CDSAtividadeQuadro3CTempo.AsString := CalcularTempo(CDSAtividadeQuadro3Cha_DataAbertura.AsDateTime, CDSAtividadeQuadro3Cha_HoraAbertura.AsDateTime);
    CDSAtividadeQuadro3CTempoPar10.AsString := CalculaTempoPar10(CDSAtividadeQuadro3cha_HoraAtendeAtual.AsDateTime);
    CDSAtividadeQuadro3CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividadeQuadro3UltimaData.AsDateTime, CDSAtividadeQuadro3UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividadeQuadro4CalcFields(DataSet: TDataSet);
begin
  if CDSAtividadeQuadro4.State = dsInternalCalc then
  begin
    CDSAtividadeQuadro4CTempo.AsString := CalcularTempo(CDSAtividadeQuadro4Cha_DataAbertura.AsDateTime, CDSAtividadeQuadro4Cha_HoraAbertura.AsDateTime);
    CDSAtividadeQuadro4CTempoPar10.AsString := CalculaTempoPar10(CDSAtividadeQuadro4cha_HoraAtendeAtual.AsDateTime);
    CDSAtividadeQuadro4CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividadeQuadro4UltimaData.AsDateTime, CDSAtividadeQuadro4UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividadeQuadro5CalcFields(DataSet: TDataSet);
begin
  if CDSAtividadeQuadro5.State = dsInternalCalc then
  begin
    CDSAtividadeQuadro5CTempo.AsString := CalcularTempo(CDSAtividadeQuadro5Cha_DataAbertura.AsDateTime, CDSAtividadeQuadro5Cha_HoraAbertura.AsDateTime);
    CDSAtividadeQuadro5CTempoPar10.AsString := CalculaTempoPar10(CDSAtividadeQuadro5cha_HoraAtendeAtual.AsDateTime);
    CDSAtividadeQuadro5CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividadeQuadro5UltimaData.AsDateTime, CDSAtividadeQuadro5UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSAtividadeQuadro6CalcFields(DataSet: TDataSet);
begin
  if CDSAtividadeQuadro6.State = dsInternalCalc then
  begin
    CDSAtividadeQuadro6CTempo.AsString := CalcularTempo(CDSAtividadeQuadro6Cha_DataAbertura.AsDateTime, CDSAtividadeQuadro6Cha_HoraAbertura.AsDateTime);
    CDSAtividadeQuadro6CTempoPar10.AsString := CalculaTempoPar10(CDSAtividadeQuadro6cha_HoraAtendeAtual.AsDateTime);
    CDSAtividadeQuadro6CTempoParOutro.AsString := CalcularTempoOutros(CDSAtividadeQuadro6UltimaData.AsDateTime, CDSAtividadeQuadro6UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSCadastroBeforePost(DataSet: TDataSet);
begin
  CDSCadastroCha_HoraAbertura.AsString := FormatDateTime('hh:mm', CDSCadastroCha_HoraAbertura.AsDateTime);
end;

procedure TDMChamado.CDSCadastroCha_DataAberturaSetText(Sender: TField; const
    Text: string);
begin
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMChamado.CDSCadastroCha_HoraAberturaSetText(Sender: TField; const
    Text: string);
begin
  TFuncoes.ValidaHora(Sender, Text);
end;

{ TDMRevenda }

procedure TDMChamado.CDSCadastroNewRecord(DataSet: TDataSet);
begin
  CDSCadastroCha_DataAbertura.AsDateTime := Date;
  CDSCadastroCha_HoraAbertura.AsDateTime := Time;
  CDSCadastroCha_HoraAtendeAtual.AsDateTime := Time;
  CDSCadastroCha_Nivel.AsInteger := 2;
  CDSCadastroCha_Origem.AsInteger := 1;
end;

procedure TDMChamado.CDSCadastroReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  raise Exception.Create(E.Message);
end;

procedure TDMChamado.CDSChamadoOcorrColaboradorBeforePost(DataSet: TDataSet);
var
  HoraInicial: Double;
  HoraFinal: Double;
  TotalHoras: Double;
begin
  if CDSChamadoOcorrColaboradorChaOCol_Usuario.AsInteger <= 0 then
    raise Exception.Create('Informe o Colabobador!');

  if CDSChamadoOcorrColaboradorChaOcol_HoraInicio.AsString = '' then
    raise Exception.Create('Informe a Hora Inicial!');

  if CDSChamadoOcorrColaboradorChaOCol_HoraFim.AsString = '' then
    raise Exception.Create('Informe a Hora Final!');

  if CDSChamadoOcorrColaboradorChaOcol_HoraInicio.AsDateTime > CDSChamadoOcorrColaboradorChaOCol_HoraFim.AsDateTime then
    raise Exception.Create('Hora Inicial maior que Hora Final!');

  CDSChamadoOcorrColaboradorChaOcol_HoraInicio.AsString := FormatDateTime('hh:mm', CDSChamadoOcorrColaboradorChaOcol_HoraInicio.AsDateTime);
  CDSChamadoOcorrColaboradorChaOCol_HoraFim.AsString := FormatDateTime('hh:mm', CDSChamadoOcorrColaboradorChaOCol_HoraFim.AsDateTime);

  if CDSChamadoOcorrColaborador.State = dsInsert then
  begin
    CDSChamadoOcorrColaboradorChaOCol_Id.AsInteger := FIdColaborador;
    Dec(FIdColaborador);
  end;

  HoraInicial := TFuncoes.HoraToDecimal(CDSChamadoOcorrColaboradorChaOcol_HoraInicio.AsString);
  HoraFinal   := TFuncoes.HoraToDecimal(CDSChamadoOcorrColaboradorChaOCol_HoraFim.AsString);
  TotalHoras  := HoraFinal - HoraInicial;

  CDSChamadoOcorrColaboradorChaOcol_TotalHoras.AsFloat := TotalHoras;
end;

procedure TDMChamado.CDSChamadoOcorrColaboradorReconcileError(
  DataSet: TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind;
  var Action: TReconcileAction);
begin
  raise Exception.Create(E.Message);
end;

procedure TDMChamado.CDSChamadoOcorrenciaConsBeforePost(DataSet: TDataSet);
var
  HoraInicial: Double;
  HoraFinal: Double;
  TotalHoras: Double;
begin
  if CDSChamadoOcorrenciaConsChOco_HoraFim.AsString = '' then
    CDSChamadoOcorrenciaConsChOco_HoraFim.AsDateTime := Time;
  CDSChamadoOcorrenciaConsChOco_HoraInicio.AsString := FormatDateTime('hh:mm', CDSChamadoOcorrenciaConsChOco_HoraInicio.AsDateTime);

  if TFuncoes.DataEmBrancoNula(CDSChamadoOcorrenciaConsChOco_Data.AsString) then
    raise Exception.Create('Informe a Data na Ocorr�ncia!');
  if CDSChamadoOcorrenciaConsChOco_HoraInicio.AsString = '' then
    raise Exception.Create('Informe o Hor�rio Inicial na Ocorr�ncia!');
  if CDSChamadoOcorrenciaConsChOco_HoraFim.AsString = '' then
    raise Exception.Create('Informe o Hor�rio Final na Ocorr�ncia!');

  if CDSChamadoOcorrenciaCons.State = dsInsert then
  begin
    if CDSChamadoOcorrenciaConsChOco_HoraInicio.AsDateTime > CDSChamadoOcorrenciaConsChOco_HoraFim.AsDateTime then
      raise Exception.Create('Hora Inicial maior que Hora Final na Ocorr�ncia!');
  end;
  CDSChamadoOcorrenciaConsChOco_HoraFim.AsString := FormatDateTime('hh:mm', CDSChamadoOcorrenciaConsChOco_HoraFim.AsDateTime);

  HoraInicial := TFuncoes.HoraToDecimal(CDSChamadoOcorrenciaConsChOco_HoraInicio.AsString);
  HoraFinal := TFuncoes.HoraToDecimal(CDSChamadoOcorrenciaConsChOco_HoraFim.AsString);

  TotalHoras := HoraFinal - HoraInicial;

  CDSChamadoOcorrenciaConsChOco_TotalHoras.AsFloat := TotalHoras;


  if CDSChamadoOcorrenciaCons.State = dsInsert then
  begin
    if CDSChamadoOcorrenciaConsChOco_Usuario.AsInteger = 0 then
      CDSChamadoOcorrenciaConsChOco_Usuario.AsInteger := dm.IdUsuario;
  end;
end;

procedure TDMChamado.CDSChamadoOcorrenciaConsChOco_DataSetText(Sender: TField;
    const Text: string);
begin
  TFuncoes.ValidaDatas(Sender, Text);
end;

procedure TDMChamado.CDSChamadoOcorrenciaConsChOco_HoraFimSetText(Sender:
    TField; const Text: string);
begin
  TFuncoes.ValidaHora(Sender, Text);
end;

procedure TDMChamado.CDSChamadoOcorrenciaConsChOco_HoraInicioSetText(Sender:
    TField; const Text: string);
begin
  TFuncoes.ValidaHora(Sender, Text);
end;

procedure TDMChamado.CDSChamadoOcorrenciaConsNewRecord(DataSet: TDataSet);
begin
  CDSChamadoOcorrenciaConsChOco_Data.AsDateTime := Date;

  if CDSCadastroCha_HoraAtendeAtual.AsString <> '' then
    CDSChamadoOcorrenciaConsChOco_HoraInicio.AsDateTime := CDSCadastroCha_HoraAtendeAtual.AsDateTime
  else
    CDSChamadoOcorrenciaConsChOco_HoraInicio.AsDateTime := Time;

  CDSChamadoOcorrenciaConsChOco_Chamado.AsInteger := -1;

  CDSChamadoOcorrenciaConsChOco_Id.AsInteger := FId;
  Dec(FId);

end;

procedure TDMChamado.CDSChamadoOcorrenciaConsReconcileError(DataSet:
    TCustomClientDataSet; E: EReconcileError; UpdateKind: TUpdateKind; var
    Action: TReconcileAction);
begin
//  raise Exception.Create(E.Message);
end;


procedure TDMChamado.CDSChamadoQuadro1CalcFields(DataSet: TDataSet);
begin
  if CDSChamadoQuadro1.State = dsInternalCalc then
  begin
    CDSChamadoQuadro1CTempo.AsString := CalcularTempo(CDSChamadoQuadro1Cha_DataAbertura.AsDateTime, CDSChamadoQuadro1Cha_HoraAbertura.AsDateTime);
    CDSChamadoQuadro1CTempoPar10.AsString := CalculaTempoPar10(CDSChamadoQuadro1cha_HoraAtendeAtual.AsDateTime);
    CDSChamadoQuadro1CTempoParOutro.AsString := CalcularTempoOutros(CDSChamadoQuadro1UltimaData.AsDateTime, CDSChamadoQuadro1UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSChamadoQuadro2CalcFields(DataSet: TDataSet);
begin
  if CDSChamadoQuadro2.State = dsInternalCalc then
  begin
    CDSChamadoQuadro2CTempo.AsString := CalcularTempo(CDSChamadoQuadro2Cha_DataAbertura.AsDateTime, CDSChamadoQuadro2Cha_HoraAbertura.AsDateTime);
    CDSChamadoQuadro2CTempoPar10.AsString := CalculaTempoPar10(CDSChamadoQuadro2cha_HoraAtendeAtual.AsDateTime);
    CDSChamadoQuadro2CTempoParOutro.AsString := CalcularTempoOutros(CDSChamadoQuadro2UltimaData.AsDateTime, CDSChamadoQuadro2UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSChamadoQuadro3CalcFields(DataSet: TDataSet);
begin
  if CDSChamadoQuadro3.State = dsInternalCalc then
  begin
    CDSChamadoQuadro3CTempo.AsString := CalcularTempo(CDSChamadoQuadro3Cha_DataAbertura.AsDateTime, CDSChamadoQuadro3Cha_HoraAbertura.AsDateTime);
    CDSChamadoQuadro3CTempoPar10.AsString := CalcularTempo(CDSChamadoQuadro3Cha_DataAbertura.AsDateTime, CDSChamadoQuadro3cha_HoraAtendeAtual.AsDateTime);
    CDSChamadoQuadro3CTempoPar10.AsString := CalculaTempoPar10(CDSChamadoQuadro3cha_HoraAtendeAtual.AsDateTime);
    CDSChamadoQuadro3CTempoParOutro.AsString := CalcularTempoOutros(CDSChamadoQuadro3UltimaData.AsDateTime, CDSChamadoQuadro3UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSChamadoQuadro4CalcFields(DataSet: TDataSet);
begin
  if CDSChamadoQuadro4.State = dsInternalCalc then
  begin
    CDSChamadoQuadro4CTempo.AsString := CalcularTempo(CDSChamadoQuadro4Cha_DataAbertura.AsDateTime, CDSChamadoQuadro4Cha_HoraAbertura.AsDateTime);
    CDSChamadoQuadro4CTempoParOutro.AsString := CalcularTempoOutros(CDSChamadoQuadro4UltimaData.AsDateTime, CDSChamadoQuadro4UltimaHora.AsDateTime);
    CDSChamadoQuadro4CTempoPar10.AsString := CalculaTempoPar10(CDSChamadoQuadro4cha_HoraAtendeAtual.AsDateTime);
  end;
end;

procedure TDMChamado.CDSChamadoQuadro5CalcFields(DataSet: TDataSet);
begin
  if CDSChamadoQuadro5.State = dsInternalCalc then
  begin
    CDSChamadoQuadro5CTempo.AsString := CalcularTempo(CDSChamadoQuadro5Cha_DataAbertura.AsDateTime, CDSChamadoQuadro5Cha_HoraAbertura.AsDateTime);
    CDSChamadoQuadro5CTempoPar10.AsString := CalculaTempoPar10(CDSChamadoQuadro5cha_HoraAtendeAtual.AsDateTime);
    CDSChamadoQuadro5CTempoParOutro.AsString := CalcularTempoOutros(CDSChamadoQuadro5UltimaData.AsDateTime, CDSChamadoQuadro5UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSChamadoQuadro6CalcFields(DataSet: TDataSet);
begin
  if CDSChamadoQuadro6.State = dsInternalCalc then
  begin
    CDSChamadoQuadro6CTempo.AsString := CalcularTempo(CDSChamadoQuadro6Cha_DataAbertura.AsDateTime, CDSChamadoQuadro6Cha_HoraAbertura.AsDateTime);
    CDSChamadoQuadro6CTempoPar10.AsString := CalculaTempoPar10(CDSChamadoQuadro6cha_HoraAtendeAtual.AsDateTime);
    CDSChamadoQuadro6CTempoParOutro.AsString := CalcularTempoOutros(CDSChamadoQuadro6UltimaData.AsDateTime, CDSChamadoQuadro6UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSQuadro1CalcFields(DataSet: TDataSet);
begin
  if CDSQuadro1.State = dsInternalCalc then
  begin
    CDSQuadro1CTempo.AsString := CalcularTempo(CDSQuadro1Cha_DataAbertura.AsDateTime, CDSQuadro1Cha_HoraAbertura.AsDateTime);
    CDSQuadro1CTempoPar10.AsString := CalculaTempoPar10(CDSQuadro1Cha_HoraAtendeAtual.AsDateTime);
    CDSQuadro1CTempoParOutro.AsString := CalcularTempoOutros(CDSQuadro1UltimaData.AsDateTime, CDSQuadro1UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSQuadro2CalcFields(DataSet: TDataSet);
begin
  if CDSQuadro2.State = dsInternalCalc then
  begin
    CDSQuadro2CTempo.AsString := CalcularTempo(CDSQuadro2Cha_DataAbertura.AsDateTime, CDSQuadro2Cha_HoraAbertura.AsDateTime);
    CDSQuadro2CTempoPar10.AsString := CalculaTempoPar10(CDSQuadro2Cha_HoraAtendeAtual.AsDateTime);
    CDSQuadro2CTempoParOutro.AsString := CalcularTempoOutros(CDSQuadro2UltimaData.AsDateTime, CDSQuadro2UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSQuadro3CalcFields(DataSet: TDataSet);
begin
  if CDSQuadro3.State = dsInternalCalc then
  begin
    CDSQuadro3CTempo.AsString := CalcularTempo(CDSQuadro3Cha_DataAbertura.AsDateTime, CDSQuadro3Cha_HoraAbertura.AsDateTime);
    CDSQuadro3CTempoPar10.AsString := CalculaTempoPar10(CDSQuadro3Cha_HoraAtendeAtual.AsDateTime);
    CDSQuadro3CTempoParOutro.AsString := CalcularTempoOutros(CDSQuadro3UltimaData.AsDateTime, CDSQuadro3UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSQuadro4CalcFields(DataSet: TDataSet);
begin
  if CDSQuadro4.State = dsInternalCalc then
  begin
    CDSQuadro4CTempo.AsString := CalcularTempo(CDSQuadro4Cha_DataAbertura.AsDateTime, CDSQuadro4Cha_HoraAbertura.AsDateTime);
    CDSQuadro4CTempoPar10.AsString := CalculaTempoPar10(CDSQuadro4Cha_HoraAtendeAtual.AsDateTime);
    CDSQuadro4CTempoParOutro.AsString := CalcularTempoOutros(CDSQuadro4UltimaData.AsDateTime, CDSQuadro4UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSQuadro5CalcFields(DataSet: TDataSet);
begin
  if CDSQuadro5.State = dsInternalCalc then
  begin
    CDSQuadro5CTempo.AsString := CalcularTempo(CDSQuadro5Cha_DataAbertura.AsDateTime, CDSQuadro5Cha_HoraAbertura.AsDateTime);
    CDSQuadro5CTempoPar10.AsString := CalculaTempoPar10(CDSQuadro5Cha_HoraAtendeAtual.AsDateTime);
    CDSQuadro5CTempoParOutro.AsString := CalcularTempoOutros(CDSQuadro5UltimaData.AsDateTime, CDSQuadro5UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSQuadro6CalcFields(DataSet: TDataSet);
begin
  if CDSQuadro6.State = dsInternalCalc then
  begin
    CDSQuadro6CTempo.AsString := CalcularTempo(CDSQuadro6Cha_DataAbertura.AsDateTime, CDSQuadro6Cha_HoraAbertura.AsDateTime);
    CDSQuadro6CTempoPar10.AsString := CalculaTempoPar10(CDSQuadro6Cha_HoraAtendeAtual.AsDateTime);
    CDSQuadro6CTempoParOutro.AsString := CalcularTempoOutros(CDSQuadro6UltimaData.AsDateTime, CDSQuadro6UltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CDSQuadroCalcFields(DataSet: TDataSet);
begin
  if CDSQuadro.State = dsInternalCalc then
  begin
    CDSQuadroCTempo.AsString := CalcularTempo(CDSQuadroCha_DataAbertura.AsDateTime, CDSQuadroCha_HoraAbertura.AsDateTime);
    CDSQuadroCTempoPar10.AsString := CalculaTempoPar10(CDSQuadroCha_HoraAtendeAtual.AsDateTime);
    CDSQuadroCTempoParOutro.AsString := CalcularTempoOutros(CDSQuadroUltimaData.AsDateTime, CDSQuadroUltimaHora.AsDateTime);
  end;
end;

procedure TDMChamado.CriarIndicesChamados();
begin
  CriarIndices(CDSQuadro1);
  CriarIndices(CDSQuadro2);
  CriarIndices(CDSQuadro3);
  CriarIndices(CDSQuadro4);
  CriarIndices(CDSQuadro5);
  CriarIndices(CDSQuadro6);
end;

procedure TDMChamado.CriarIndices(AClientDataSet: TClientDataSet);
begin
  AClientDataSet.IndexDefs.Add('IndexPerfil', 'Cli_Perfil', [ixDescending]);
  AClientDataSet.IndexDefs.Add('IndexNivel', 'Nivel', [ixDescending]);

  AClientDataSet.IndexDefs.Add('IndexPerfilNivel', 'Cli_Perfil;Nivel', [ixDescending]);
  AClientDataSet.IndexName := 'IndexPerfilNivel';
end;

procedure TDMChamado.CriarIndicesAtividades;
begin
  CriarIndices(CDSAtividade1);
  CriarIndices(CDSAtividade2);
  CriarIndices(CDSAtividade3);
  CriarIndices(CDSAtividade4);
  CriarIndices(CDSAtividade5);
  CriarIndices(CDSAtividade6);
end;

procedure TDMChamado.DataModuleCreate(Sender: TObject);
var
  i: Integer;
begin
  for I := 0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TClientDataSet then
      TClientDataSet(Components[i]).RemoteServer := dm.DSPConexao;
  end;
  FId := -1;
  FIdColaborador := -1;

  CDSQuadro1.CreateDataSet;
  CDSQuadro2.CreateDataSet;
  CDSQuadro3.CreateDataSet;
  CDSQuadro4.CreateDataSet;
  CDSQuadro5.CreateDataSet;
  CDSQuadro6.CreateDataSet;

  CDSAtividade1.CreateDataSet;
  CDSAtividade2.CreateDataSet;
  CDSAtividade3.CreateDataSet;
  CDSAtividade4.CreateDataSet;
  CDSAtividade5.CreateDataSet;
  CDSAtividade6.CreateDataSet;

  CriarIndicesChamados();
  CriarIndicesAtividades();

end;

function TDMChamado.RetornarCalculoTempo(ADataSet: TDataSet): string;
begin
  if ADataSet.FieldByName('UltimaHora').AsDateTime > 0 then
    Result := CalcularTempo(ADataSet.FieldByName('UltimaData').AsDateTime, ADataSet.FieldByName('UltimaHora').AsDateTime)
  else
    Result := CalcularTempo(ADataSet.FieldByName('Cha_DataAbertura').AsDateTime, ADataSet.FieldByName('Cha_HoraAbertura').AsDateTime);
end;

end.
