unit uQuadro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, uParametrosController, uEnumerador,
  Data.DB, uDMChamado, uDMSolicitacao, uChamadoController, uSolicitacaoController, uDM,
  Vcl.Menus, Datasnap.DBClient, Vcl.Mask, uAgendamentoController;

type
  TfrmQuadro = class(TForm)
    PageControl1: TPageControl;
    tsChamados: TTabSheet;
    dsQuadro1: TDataSource;
    dsQuadro2: TDataSource;
    dsQuadro3: TDataSource;
    dsQuadro4: TDataSource;
    dsQuadro5: TDataSource;
    dsQuadro6: TDataSource;
    tsSolicitacao: TTabSheet;
    dsQuadroSol1: TDataSource;
    dsQuadroSol2: TDataSource;
    dsQuadroSol3: TDataSource;
    dsQuadroSol4: TDataSource;
    dsQuadroSol5: TDataSource;
    dsQuadroSol6: TDataSource;
    Timer1: TTimer;
    pmSolicitacao1: TPopupMenu;
    pmGeral1: TMenuItem;
    pmTecnica1: TMenuItem;
    pmAnalise1: TMenuItem;
    pmSolicitacao2: TPopupMenu;
    pmGeral2: TMenuItem;
    pmTecnica2: TMenuItem;
    pmAnalise2: TMenuItem;
    dsQuadroSol7: TDataSource;
    dsQuadroSol8: TDataSource;
    dsQuadroSol9: TDataSource;
    dsQuadroSol10: TDataSource;
    dsQuadroSol11: TDataSource;
    dsQuadroSol12: TDataSource;
    Panel13: TPanel;
    btnSolucoes: TBitBtn;
    pmSolicitacao3: TPopupMenu;
    pmGeral3: TMenuItem;
    pmTecnica3: TMenuItem;
    pmAnalise3: TMenuItem;
    pmSolicitacao4: TPopupMenu;
    pmAnalise4: TMenuItem;
    pmGeral4: TMenuItem;
    pmTecnica4: TMenuItem;
    pmSolicitacao5: TPopupMenu;
    pmAnalise5: TMenuItem;
    pmGeral5: TMenuItem;
    pmTecnica5: TMenuItem;
    pmSolicitacao6: TPopupMenu;
    pmAnalise6: TMenuItem;
    pmGeral6: TMenuItem;
    pmTecnica6: TMenuItem;
    pmSolicitacao7: TPopupMenu;
    pmAnalise7: TMenuItem;
    pmGeral7: TMenuItem;
    pmTecnica7: TMenuItem;
    pmSolicitacao8: TPopupMenu;
    pmAnalise8: TMenuItem;
    pmGeral8: TMenuItem;
    pmTecnica8: TMenuItem;
    pmSolicitacao9: TPopupMenu;
    pmAnalise9: TMenuItem;
    pmGeral9: TMenuItem;
    pmTecnica9: TMenuItem;
    pmSolicitacao10: TPopupMenu;
    pmAnalise10: TMenuItem;
    pmGeral10: TMenuItem;
    pmTecnica10: TMenuItem;
    pmSolicitacao11: TPopupMenu;
    pmAnalise11: TMenuItem;
    pmGeral11: TMenuItem;
    pmTecnica11: TMenuItem;
    pmSolicitacao12: TPopupMenu;
    pmAnalise12: TMenuItem;
    pmGeral12: TMenuItem;
    pmTecnica12: TMenuItem;
    Panel1: TPanel;
    pnlCha1: TPanel;
    lblTitulo1: TLabel;
    dbQuadro1: TDBGrid;
    btnAbrirChamado: TBitBtn;
    pnlCha3: TPanel;
    lblTitulo3: TLabel;
    dbQuadro3: TDBGrid;
    pnlCha5: TPanel;
    lblTitulo5: TLabel;
    dbQuadro5: TDBGrid;
    Panel3: TPanel;
    pnlCha2: TPanel;
    lblTitulo2: TLabel;
    dbQuadro2: TDBGrid;
    pnlCha4: TPanel;
    lblTitulo4: TLabel;
    dbQuadro4: TDBGrid;
    pnlCha6: TPanel;
    lblTitulo6: TLabel;
    dbQuadro6: TDBGrid;
    Panel7: TPanel;
    pnlSol1: TPanel;
    dbQuadroSol1: TDBGrid;
    pnlSol4: TPanel;
    lblTitSolicitacao4: TLabel;
    dbQuadroSol4: TDBGrid;
    pnlSol7: TPanel;
    lblTitSolicitacao7: TLabel;
    dbQuadroSol7: TDBGrid;
    pnlSol10: TPanel;
    lblTitSolicitacao10: TLabel;
    dbQuadroSol10: TDBGrid;
    Panel11: TPanel;
    pnlSol2: TPanel;
    dbQuadroSol2: TDBGrid;
    pnlSol5: TPanel;
    lblTitSolicitacao5: TLabel;
    dbQuadroSol5: TDBGrid;
    pnlSol8: TPanel;
    lblTitSolicitacao8: TLabel;
    dbQuadroSol8: TDBGrid;
    pnlSol11: TPanel;
    lblTitSolicitacao11: TLabel;
    dbQuadroSol11: TDBGrid;
    Panel9: TPanel;
    pnlSol6: TPanel;
    lblTitSolicitacao6: TLabel;
    dbQuadroSol6: TDBGrid;
    pnlSol12: TPanel;
    lblTitSolicitacao12: TLabel;
    dbQuadroSol12: TDBGrid;
    pnlSol9: TPanel;
    lblTitSolicitacao9: TLabel;
    dbQuadroSol9: TDBGrid;
    pnlSol3: TPanel;
    dbQuadroSol3: TDBGrid;
    tsCodigos: TTabSheet;
    edtChaCodigo1: TEdit;
    edtChaCodigo2: TEdit;
    edtChaCodigo3: TEdit;
    edtChaCodigo4: TEdit;
    edtChaCodigo5: TEdit;
    edtChaCodigo6: TEdit;
    pmQuadro1: TPopupMenu;
    pmQuadro2: TPopupMenu;
    pmQuadro3: TPopupMenu;
    pmQuadro4: TPopupMenu;
    pmQuadro5: TPopupMenu;
    pmQuadro6: TPopupMenu;
    Detalhes1: TMenuItem;
    Detalhes2: TMenuItem;
    Detalhes3: TMenuItem;
    Detalhes4: TMenuItem;
    Detalhes5: TMenuItem;
    Detalhes6: TMenuItem;
    btnBuscarCliente: TBitBtn;
    edtSolCodigo1: TEdit;
    edtSolCodigo2: TEdit;
    edtSolCodigo3: TEdit;
    edtSolCodigo4: TEdit;
    edtSolCodigo5: TEdit;
    edtSolCodigo6: TEdit;
    edtSolCodigo7: TEdit;
    edtSolCodigo8: TEdit;
    edtSolCodigo9: TEdit;
    edtSolCodigo10: TEdit;
    edtSolCodigo11: TEdit;
    edtSolCodigo12: TEdit;
    edtAtivCodigo1: TEdit;
    edtAtivCodigo2: TEdit;
    edtAtivCodigo3: TEdit;
    edtAtivCodigo4: TEdit;
    edtAtivCodigo5: TEdit;
    edtAtivCodigo6: TEdit;
    tsAtividades: TTabSheet;
    Panel25: TPanel;
    Panel26: TPanel;
    pnlAtiv1: TPanel;
    lblTitAtiv1: TLabel;
    dbAtivQuadro1: TDBGrid;
    btnAbrirAtividade: TBitBtn;
    pnlAtiv3: TPanel;
    lblTitAtiv3: TLabel;
    dbAtivQuadro3: TDBGrid;
    pnlAtiv5: TPanel;
    lblTitAtiv5: TLabel;
    dbAtivQuadro5: TDBGrid;
    Panel30: TPanel;
    pnlAtiv2: TPanel;
    lblTitAtiv2: TLabel;
    dbAtivQuadro2: TDBGrid;
    pnlAtiv4: TPanel;
    lblTitAtiv4: TLabel;
    dbAtivQuadro4: TDBGrid;
    pnlAtiv6: TPanel;
    lblTitAtiv6: TLabel;
    dbAtivQuadro6: TDBGrid;
    dsAtivQuadro1: TDataSource;
    dsAtivQuadro2: TDataSource;
    dsAtivQuadro3: TDataSource;
    dsAtivQuadro4: TDataSource;
    dsAtivQuadro5: TDataSource;
    dsAtivQuadro6: TDataSource;
    Panel34: TPanel;
    btnSolucoes2: TBitBtn;
    btnBuscarCliente2: TBitBtn;
    pmAtivQuadro1: TPopupMenu;
    pmAtivQuadro2: TPopupMenu;
    pmAtivQuadro3: TPopupMenu;
    pmAtivQuadro4: TPopupMenu;
    pmAtivQuadro5: TPopupMenu;
    pmAtivQuadro6: TPopupMenu;
    Detalhes7: TMenuItem;
    Detalhes8: TMenuItem;
    Detalhes9: TMenuItem;
    Detalhes10: TMenuItem;
    Detalhes11: TMenuItem;
    Detalhes12: TMenuItem;
    tsAgendamento: TTabSheet;
    pnlAgendaColuna2: TPanel;
    pnlAge8: TPanel;
    dbAgenda8: TDBGrid;
    Panel37: TPanel;
    lblAgenda8: TLabel;
    pnlAgendaColuna1: TPanel;
    pnlAge10: TPanel;
    lblAgenda10: TLabel;
    dbAgenda10: TDBGrid;
    pnlAgendaColuna3: TPanel;
    pnlAge9: TPanel;
    lblAgenda9: TLabel;
    dbAgenda9: TDBGrid;
    pnlAge4: TPanel;
    lblAgenda4: TLabel;
    dbAgenda4: TDBGrid;
    pnlAge5: TPanel;
    lblAgenda5: TLabel;
    dbAgenda5: TDBGrid;
    pnlAge6: TPanel;
    lblAgenda6: TLabel;
    dbAgenda6: TDBGrid;
    pnlAge1: TPanel;
    lblAgenda1: TLabel;
    dbAgenda1: TDBGrid;
    pnlAge2: TPanel;
    lblAgenda2: TLabel;
    dbAgenda2: TDBGrid;
    pnlAge3: TPanel;
    lblAgenda3: TLabel;
    dbAgenda3: TDBGrid;
    pnlAge7: TPanel;
    lblAgenda7: TLabel;
    dbAgenda7: TDBGrid;
    pnlAge11: TPanel;
    lblAgenda11: TLabel;
    dbAgenda11: TDBGrid;
    pnlAge12: TPanel;
    lblAgenda12: TLabel;
    dbAgenda12: TDBGrid;
    Label1: TLabel;
    btnAgendamento: TBitBtn;
    edtDataInicial: TMaskEdit;
    Label2: TLabel;
    edtDataFinal: TMaskEdit;
    btnOk: TBitBtn;
    pnlAge13: TPanel;
    lblAgenda13: TLabel;
    dbAgenda13: TDBGrid;
    pnlAge14: TPanel;
    lblAgenda14: TLabel;
    dbAgenda14: TDBGrid;
    pnlAge15: TPanel;
    lblAgenda15: TLabel;
    dbAgenda15: TDBGrid;
    cdsAgenda1: TClientDataSet;
    cdsAgenda1Hora: TTimeField;
    cdsAgenda1Cliente: TStringField;
    cdsAgenda1Usuario: TStringField;
    cdsAgenda1Status: TStringField;
    dsAgenda1: TDataSource;
    cdsAgenda1Data: TDateField;
    cdsAgenda2: TClientDataSet;
    dsAgenda2: TDataSource;
    cdsAgenda2Hora: TTimeField;
    cdsAgenda2Cliente: TStringField;
    cdsAgenda2Usuario: TStringField;
    cdsAgenda2Status: TStringField;
    cdsAgenda2Data: TDateField;
    cdsAgenda3: TClientDataSet;
    cdsAgenda3Hora: TTimeField;
    cdsAgenda3Cliente: TStringField;
    cdsAgenda3Usuario: TStringField;
    cdsAgenda3Status: TStringField;
    cdsAgenda3Data: TDateField;
    dsAgenda3: TDataSource;
    cdsAgenda1Id: TIntegerField;
    cdsAgenda2Id: TIntegerField;
    cdsAgenda3Id: TIntegerField;
    cdsAgenda4: TClientDataSet;
    dsAgenda4: TDataSource;
    cdsAgenda4Hora: TTimeField;
    cdsAgenda4Cliente: TStringField;
    cdsAgenda4Usuario: TStringField;
    cdsAgenda4Status: TStringField;
    cdsAgenda4Data: TDateField;
    cdsAgenda4Id: TIntegerField;
    cdsAgenda5: TClientDataSet;
    dsAgenda5: TDataSource;
    cdsAgenda5Hora: TTimeField;
    cdsAgenda5Cliente: TStringField;
    cdsAgenda5Usuario: TStringField;
    cdsAgenda5Status: TStringField;
    cdsAgenda5Data: TDateField;
    cdsAgenda5Id: TIntegerField;
    cdsAgenda6: TClientDataSet;
    dsAgenda6: TDataSource;
    cdsAgenda6Hora: TTimeField;
    cdsAgenda6Cliente: TStringField;
    cdsAgenda6Usuario: TStringField;
    cdsAgenda6Status: TStringField;
    cdsAgenda6Data: TDateField;
    cdsAgenda6Id: TIntegerField;
    cdsAgenda7: TClientDataSet;
    dsAgenda7: TDataSource;
    cdsAgenda7Hora: TTimeField;
    cdsAgenda7Cliente: TStringField;
    cdsAgenda7Usuario: TStringField;
    cdsAgenda7Status: TStringField;
    cdsAgenda7Data: TDateField;
    cdsAgenda7Id: TIntegerField;
    cdsAgenda8: TClientDataSet;
    dsAgenda8: TDataSource;
    cdsAgenda8Hora: TTimeField;
    cdsAgenda8Cliente: TStringField;
    cdsAgenda8Usuario: TStringField;
    cdsAgenda8Status: TStringField;
    cdsAgenda8Data: TDateField;
    cdsAgenda8Id: TIntegerField;
    cdsAgenda9: TClientDataSet;
    dsAgenda9: TDataSource;
    cdsAgenda9Hora: TTimeField;
    cdsAgenda9Cliente: TStringField;
    cdsAgenda9Usuario: TStringField;
    cdsAgenda9Status: TStringField;
    cdsAgenda9Data: TDateField;
    cdsAgenda9Id: TIntegerField;
    cdsAgenda10: TClientDataSet;
    dsAgenda10: TDataSource;
    cdsAgenda10Hora: TTimeField;
    cdsAgenda10Cliente: TStringField;
    cdsAgenda10Usuario: TStringField;
    cdsAgenda10Status: TStringField;
    cdsAgenda10Data: TDateField;
    cdsAgenda10Id: TIntegerField;
    cdsAgenda11: TClientDataSet;
    dsAgenda11: TDataSource;
    cdsAgenda11Hora: TTimeField;
    cdsAgenda11Cliente: TStringField;
    cdsAgenda11Usuario: TStringField;
    cdsAgenda11Status: TStringField;
    cdsAgenda11Data: TDateField;
    cdsAgenda11Id: TIntegerField;
    cdsAgenda12: TClientDataSet;
    dsAgenda12: TDataSource;
    cdsAgenda12Hora: TTimeField;
    cdsAgenda12Cliente: TStringField;
    cdsAgenda12Usuario: TStringField;
    cdsAgenda12Status: TStringField;
    cdsAgenda12Data: TDateField;
    cdsAgenda12Id: TIntegerField;
    cdsAgenda13: TClientDataSet;
    dsAgenda13: TDataSource;
    cdsAgenda13Hora: TTimeField;
    cdsAgenda13Cliente: TStringField;
    cdsAgenda13Usuario: TStringField;
    cdsAgenda13Status: TStringField;
    cdsAgenda13Data: TDateField;
    cdsAgenda13Id: TIntegerField;
    cdsAgenda14: TClientDataSet;
    dsAgenda14: TDataSource;
    cdsAgenda14Hora: TTimeField;
    cdsAgenda14Cliente: TStringField;
    cdsAgenda14Usuario: TStringField;
    cdsAgenda14Status: TStringField;
    cdsAgenda14Data: TDateField;
    cdsAgenda14Id: TIntegerField;
    cdsAgenda15: TClientDataSet;
    dsAgenda15: TDataSource;
    cdsAgenda15Hora: TTimeField;
    cdsAgenda15Cliente: TStringField;
    cdsAgenda15Usuario: TStringField;
    cdsAgenda15Status: TStringField;
    cdsAgenda15Data: TDateField;
    cdsAgenda15Id: TIntegerField;
    pmAge1: TPopupMenu;
    Reagendamento1: TMenuItem;
    Cancelamento1: TMenuItem;
    pmAge2: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    pmAge3: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    pmAge4: TPopupMenu;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    pmAge5: TPopupMenu;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    pmAge6: TPopupMenu;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    pmAge7: TPopupMenu;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    pmAge8: TPopupMenu;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    pmAge9: TPopupMenu;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    pmAge10: TPopupMenu;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    pmAge11: TPopupMenu;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    pmAge12: TPopupMenu;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    pmAge13: TPopupMenu;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    pmAge14: TPopupMenu;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    pmAge15: TPopupMenu;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    pmDetalhes1: TMenuItem;
    pmDetalhes3: TMenuItem;
    pmDetalhes2: TMenuItem;
    pmDetalhes4: TMenuItem;
    pmDetalhes5: TMenuItem;
    pmDetalhes6: TMenuItem;
    pmDetalhes7: TMenuItem;
    pmDetalhes8: TMenuItem;
    pmDetalhes9: TMenuItem;
    pmDetalhes10: TMenuItem;
    pmDetalhes11: TMenuItem;
    pmDetalhes12: TMenuItem;
    Detalhes13: TMenuItem;
    Detalhes14: TMenuItem;
    Detalhes15: TMenuItem;
    Detalhes16: TMenuItem;
    Detalhes17: TMenuItem;
    Detalhes18: TMenuItem;
    Detalhes19: TMenuItem;
    Detalhes20: TMenuItem;
    Detalhes21: TMenuItem;
    Detalhes22: TMenuItem;
    Detalhes23: TMenuItem;
    Detalhes24: TMenuItem;
    Detalhes25: TMenuItem;
    Detalhes26: TMenuItem;
    Detalhes27: TMenuItem;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    Encerrar1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Encerrar2: TMenuItem;
    Encerrar3: TMenuItem;
    N3: TMenuItem;
    Encerrar4: TMenuItem;
    N4: TMenuItem;
    Encerrar5: TMenuItem;
    N5: TMenuItem;
    Encerrar6: TMenuItem;
    N6: TMenuItem;
    Encerrar7: TMenuItem;
    N7: TMenuItem;
    Encerrar8: TMenuItem;
    N8: TMenuItem;
    Encerrar9: TMenuItem;
    N9: TMenuItem;
    Encerrar10: TMenuItem;
    N10: TMenuItem;
    Encerrar11: TMenuItem;
    N11: TMenuItem;
    Encerrar12: TMenuItem;
    N12: TMenuItem;
    Encerrar13: TMenuItem;
    N13: TMenuItem;
    Encerrar14: TMenuItem;
    N14: TMenuItem;
    Encerrar15: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    Panel2: TPanel;
    btnAbrirSolicitacao: TBitBtn;
    lblTitSolicitacao1: TLabel;
    Panel4: TPanel;
    lblTitSolicitacao2: TLabel;
    Panel5: TPanel;
    lblTitSolicitacao3: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAbrirChamadoClick(Sender: TObject);
    procedure dbQuadro1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbQuadro1DblClick(Sender: TObject);
    procedure dbQuadro2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbQuadro3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbQuadro4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbQuadro5DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbQuadro6DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbQuadro1TitleClick(Column: TColumn);
    procedure dbQuadro2TitleClick(Column: TColumn);
    procedure dbQuadro3TitleClick(Column: TColumn);
    procedure dbQuadro4TitleClick(Column: TColumn);
    procedure dbQuadro5TitleClick(Column: TColumn);
    procedure dbQuadro6TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure dbQuadroSol1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure btnAbrirSolicitacaoClick(Sender: TObject);
    procedure dbQuadroSol1DblClick(Sender: TObject);
    procedure btnSolucoesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure pmGeral1Click(Sender: TObject);
    procedure pmTecnica1Click(Sender: TObject);
    procedure pmAnalise1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Detalhes5Click(Sender: TObject);
    procedure btnBuscarClienteClick(Sender: TObject);
    procedure Detalhes1Click(Sender: TObject);
    procedure Detalhes2Click(Sender: TObject);
    procedure Detalhes3Click(Sender: TObject);
    procedure Detalhes4Click(Sender: TObject);
    procedure Detalhes6Click(Sender: TObject);
    procedure dbAtivQuadro1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnAbrirAtividadeClick(Sender: TObject);
    procedure btnBuscarCliente2Click(Sender: TObject);
    procedure btnSolucoes2Click(Sender: TObject);
    procedure Detalhes7Click(Sender: TObject);
    procedure Detalhes8Click(Sender: TObject);
    procedure Detalhes9Click(Sender: TObject);
    procedure Detalhes10Click(Sender: TObject);
    procedure Detalhes11Click(Sender: TObject);
    procedure Detalhes12Click(Sender: TObject);
    procedure dbAtivQuadro1DblClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dbAgenda1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Reagendamento1Click(Sender: TObject);
    procedure Cancelamento1Click(Sender: TObject);
    procedure btnAgendamentoClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem19Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem27Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure pmDetalhes1Click(Sender: TObject);
    procedure tsAgendamentoShow(Sender: TObject);
    procedure tsSolicitacaoShow(Sender: TObject);
    procedure Detalhes13Click(Sender: TObject);
    procedure Detalhes14Click(Sender: TObject);
    procedure Detalhes15Click(Sender: TObject);
    procedure Detalhes16Click(Sender: TObject);
    procedure Detalhes17Click(Sender: TObject);
    procedure Detalhes18Click(Sender: TObject);
    procedure Detalhes19Click(Sender: TObject);
    procedure Detalhes20Click(Sender: TObject);
    procedure Detalhes21Click(Sender: TObject);
    procedure Detalhes22Click(Sender: TObject);
    procedure Detalhes23Click(Sender: TObject);
    procedure Detalhes24Click(Sender: TObject);
    procedure Detalhes25Click(Sender: TObject);
    procedure Detalhes26Click(Sender: TObject);
    procedure Detalhes27Click(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure Encerrar1Click(Sender: TObject);
    procedure Encerrar2Click(Sender: TObject);
    procedure Encerrar3Click(Sender: TObject);
    procedure Encerrar4Click(Sender: TObject);
    procedure Encerrar5Click(Sender: TObject);
    procedure Encerrar6Click(Sender: TObject);
    procedure Encerrar7Click(Sender: TObject);
    procedure Encerrar8Click(Sender: TObject);
    procedure Encerrar9Click(Sender: TObject);
    procedure Encerrar10Click(Sender: TObject);
    procedure Encerrar11Click(Sender: TObject);
    procedure Encerrar12Click(Sender: TObject);
    procedure Encerrar13Click(Sender: TObject);
    procedure Encerrar14Click(Sender: TObject);
    procedure Encerrar15Click(Sender: TObject);
    procedure tsAtividadesShow(Sender: TObject);
    procedure tsChamadosShow(Sender: TObject);
  private
    { Private declarations }
    FControllerChamado: TChamadoController;
    FControllerSolicitacao: TSolicitacaoController;
    FControllerAgendamento: TAgendamentoController;

    procedure QuadroTitulos;

    procedure AbrirQuadrosChamados;
    procedure AbrirQuadrosAtividades;

    procedure InicioChamados;
    procedure InicioAtividades;
    procedure InicioAgendamento;
    procedure TitulosAgendamento;

    procedure AbrirQuadrosSolicitacao;
    procedure InicioSolicitacao;
    procedure ExecutarTimer(AExecutar: Boolean);

    procedure PermissaoSolicitacao;
    procedure PopMenu(AClientDataSet: TClientDataSet; ATipoSol: TEnumSolicitacao);
    procedure TamanhoGrids;

    procedure PodeEntrarUsuario(Sender: TObject; ATipo: TEnumChamadoAtividade = caChamado);
    procedure PodeEntrarStatus(AIdChamado: Integer; ACodStatusQuadro: string;
      ATipo: TEnumChamadoAtividade = caChamado);
    procedure GravarHoraAtual(AIdChamado, ACodigoStatus: Integer; ATipo: TEnumChamadoAtividade = caChamado);
    procedure ValidarChamado(var AGrade: TDBGrid; ADataSet: TDataSet; ACodigoStatus: string; ATipo: TEnumChamadoAtividade = caChamado);

    procedure BuscarCliente(ACodigoCliente: Integer);
    procedure DetalhesChamado(AIdChamado: Integer);
    procedure DetalhesAtividade(AIdChamado: Integer);
    procedure MostrarTempos;
    procedure TituloGrade(var AGrade: TDBGrid; ACodigoStatus, AStatusAbertura,
      AStatusOcorrencia: string);

    procedure PodeEntrarSolicitacaoStatus(AIdSolicitacao: Integer; ACodStatusQuadro: string);
    procedure PodeEntrarUsuarioSolicitacao(Sender: TObject);
    procedure GravarHoraAtualSolicitacao(AIdSolicitacao: Integer);
    procedure ValidarSolicitacao(var AGrade: TDBGrid; ADataSet: TDataSet);
    procedure GravarStatus(AIdSolicitacao: Integer);

    procedure TitulosChamados(AObj: TParametrosController; ACodigo: string; var ALblTitulo: TLabel; var ATxtCodigo: TEdit);
    procedure TitulosSolicitacoes(AObj: TParametrosController; ACodigo: string; var ALblTitulo: TLabel);
    procedure TitulosAtividades(AObj: TParametrosController; ACodigo: string; var ALblTitulo: TLabel; var ATxtCodigo: TEdit);
    procedure DadosAgendamento(var ATitulo: TLabel; ADataSet: TClientDataSet);
    procedure LimparAgendamento(ADataSet: TClientDataSet);
    procedure EntrarAgendamento(AId: Integer; ATipo: TEnumAgendamento);
    procedure EntrarDetalhes(AId: Integer);
    procedure EnviarEmail(AId: Integer);
    procedure DetalhesSolicitacao(IdSolicitacao: Integer);
    procedure AgendaAnterior;
    procedure AgendaProxima;
    procedure AgendaAbrirPrograma(ADataSet: TDataSet);
    procedure AlturaGrid();
  public
    { Public declarations }
    constructor Create();
  end;

var
  frmQuadro: TfrmQuadro;

implementation

{$R *.dfm}

uses uChamado, uFuncoesSIDomper, uGrade, uImagens, uSolicitacao, uListaProblemaChamado,
  uStatusController, uUsuarioController, uCliente, uChamadoDetalhes,
  uAgendamentoMotivo, uAgendamento, uSolicitacaoDetalhes, uVisita,
  uSolicitacaoDetalhes2, uChamadoDetalhes2, uStatusTroca;

{ TfrmQuadro }


procedure TfrmQuadro.AbrirQuadrosAtividades;
begin
  if tsAtividades.Showing then
  begin
    ExecutarTimer(False);
    FControllerChamado.AbrirAtividadeQuadro1(dm.IdUsuario);
    FControllerChamado.AbrirAtividadeQuadro2(dm.IdUsuario);
    FControllerChamado.AbrirAtividadeQuadro3(dm.IdUsuario);
    FControllerChamado.AbrirAtividadeQuadro4(dm.IdUsuario);
    FControllerChamado.AbrirAtividadeQuadro5(dm.IdUsuario);
    FControllerChamado.AbrirAtividadeQuadro6(dm.IdUsuario);
    ExecutarTimer(true);
  end;
end;

procedure TfrmQuadro.AbrirQuadrosChamados;
begin
  if tsChamados.Showing then
  begin
    ExecutarTimer(False);
    FControllerChamado.AbrirQuadro1(dm.IdUsuario);
    FControllerChamado.AbrirQuadro2(dm.IdUsuario);
    FControllerChamado.AbrirQuadro3(dm.IdUsuario);
    FControllerChamado.AbrirQuadro4(dm.IdUsuario);
    FControllerChamado.AbrirQuadro5(dm.IdUsuario);
    FControllerChamado.AbrirQuadro6(dm.IdUsuario);
    ExecutarTimer(True);
  end;
end;

procedure TfrmQuadro.AbrirQuadrosSolicitacao;
begin
  if tsSolicitacao.Showing then
  begin
    ExecutarTimer(False);
    FControllerSolicitacao.AbrirQuadro1(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro2(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro3(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro4(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro5(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro6(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro7(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro8(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro9(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro10(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro11(dm.IdUsuario);
    FControllerSolicitacao.AbrirQuadro12(dm.IdUsuario);
    ExecutarTimer(true);
  end;
end;

procedure TfrmQuadro.AgendaAbrirPrograma(ADataSet: TDataSet);
var
  Agendamento: TAgendamentoController;
  iTipoPrograma: Integer;
  AIdAgenda: Integer;
begin
  AIdAgenda := ADataSet.FieldByName('Id').AsInteger;

  if AIdAgenda = 0 then
    raise Exception.Create('Informe o Agendamento!');

  Agendamento := TAgendamentoController.Create;
  try
    iTipoPrograma := Agendamento.RetornaTipoPrograma(AIdAgenda)
  finally
    FreeAndNil(Agendamento);
  end;
//------------------------------------------------------------------------------
// atividade
  if iTipoPrograma = 2 then
  begin
    ExecutarTimer(False);
    if not (TFuncoes.FormularioEstaCriado(TfrmChamado)) then
    begin
      TFuncoes.CriarFormularioModal(TfrmChamado.create(True, true, caAtividade));
      if dm.IdCadastro > 0 then
        FControllerAgendamento.Encerrar(AIdAgenda, dm.IdCadastro);
    end;
    AbrirQuadrosAtividades;
    ExecutarTimer(True);
  end;
//------------------------------------------------------------------------------
// visita
  if iTipoPrograma = 7 then
  begin
    ExecutarTimer(False);
    if not (TFuncoes.FormularioEstaCriado(TfrmVisita)) then
    begin
      TFuncoes.CriarFormularioModal(TfrmVisita.create(False, True));
      if dm.IdCadastro > 0 then
        FControllerAgendamento.Encerrar(AIdAgenda, dm.IdCadastro);
    end;
    ExecutarTimer(True);
  end;
end;

procedure TfrmQuadro.AgendaAnterior;
begin
  ExecutarTimer(False);
  try
//    edtDataFinal.Text := DateToStr(StrToDate(edtDataInicial.Text) - 1);
//    edtDataInicial.Text := DateToStr(StrToDate(edtDataInicial.Text) - 15);
    edtDataFinal.Text := DateToStr(StrToDate(edtDataInicial.Text) - 1);
    edtDataInicial.Text := DateToStr(StrToDate(edtDataInicial.Text) - 16);

    InicioAgendamento();
  except
    // nada
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.AgendaProxima;
begin
  ExecutarTimer(False);
  try
//    edtDataInicial.Text := DateToStr(StrToDate(edtDataFinal.Text) + 1);
//    edtDataFinal.Text := DateToStr(StrToDate(edtDataInicial.Text) + 15);
    edtDataInicial.Text := DateToStr(StrToDate(edtDataFinal.Text) + 1);
    edtDataFinal.Text := DateToStr(StrToDate(edtDataInicial.Text) + 15);

    InicioAgendamento();
  except
    // nada
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.AlturaGrid;
var
  iDivide: Integer;
  iAltura: Integer;
begin
  iDivide := 3;
  iAltura := Self.Height - 80;
  pnlCha1.Height := (iAltura div iDivide);
  pnlCha2.Height := (iAltura div iDivide);
  pnlCha3.Height := (iAltura div iDivide);
  pnlCha4.Height := (iAltura div iDivide);
  pnlCha5.Height := (iAltura div iDivide);
  pnlCha6.Height := (iAltura div iDivide);

  pnlAtiv1.Height := (iAltura div iDivide);
  pnlAtiv2.Height := (iAltura div iDivide);
  pnlAtiv3.Height := (iAltura div iDivide);
  pnlAtiv4.Height := (iAltura div iDivide);
  pnlAtiv5.Height := (iAltura div iDivide);
  pnlAtiv6.Height := (iAltura div iDivide);

  iDivide := 4;
  iAltura := Self.ClientHeight;
  pnlSol1.Height := (iAltura div iDivide);
  pnlSol2.Height := (iAltura div iDivide);
  pnlSol3.Height := (iAltura div iDivide);
  pnlSol4.Height := (iAltura div iDivide);
  pnlSol5.Height := (iAltura div iDivide);
  pnlSol6.Height := (iAltura div iDivide);
  pnlSol7.Height := (iAltura div iDivide);
  pnlSol8.Height := (iAltura div iDivide);
  pnlSol9.Height := (iAltura div iDivide);
  pnlSol10.Height := (iAltura div iDivide);
  pnlSol11.Height := (iAltura div iDivide);
  pnlSol12.Height := (iAltura div iDivide);

  iDivide := 5;
  iAltura := Self.ClientHeight - 80;
  pnlAge1.Height := (iAltura div iDivide);
  pnlAge2.Height := (iAltura div iDivide);
  pnlAge3.Height := (iAltura div iDivide);
  pnlAge4.Height := (iAltura div iDivide);
  pnlAge5.Height := (iAltura div iDivide);
  pnlAge6.Height := (iAltura div iDivide);
  pnlAge7.Height := (iAltura div iDivide);
  pnlAge8.Height := (iAltura div iDivide);
  pnlAge9.Height := (iAltura div iDivide);
  pnlAge10.Height := (iAltura div iDivide);
  pnlAge11.Height := (iAltura div iDivide);
  pnlAge12.Height := (iAltura div iDivide);
  pnlAge13.Height := (iAltura div iDivide);
  pnlAge14.Height := (iAltura div iDivide);
  pnlAge15.Height := (iAltura div iDivide);

end;

procedure TfrmQuadro.GravarHoraAtual(AIdChamado, ACodigoStatus: Integer;
  ATipo: TEnumChamadoAtividade = caChamado);
var
  obj: TChamadoController;
//  objParametro: TParametrosController;
  iCodigoStatus: Integer;
begin
  // salvar hora no chamado caso o status do parametro 10 for diferente do quadro
//  objParametro := TParametrosController.Create;
  obj := TChamadoController.Create;
  try
    if ATipo = caChamado then
      iCodigoStatus := StrToIntDef(obj.StatusChamadoAtendimento(),0)
//      objParametro.LocalizarCodigo(10)
    else
      iCodigoStatus := StrToIntDef(obj.StatusAtendimentoAtividade(),0);
//      objParametro.LocalizarCodigo(10);
//    iCodigoStatus := StrToIntDef(objParametro.Model.CDSCadastroPar_Valor.AsString,0);

    if ACodigoStatus <> iCodigoStatus then
      obj.UpdateHoraUsuarioAtual(AIdChamado, ATipo);

  finally
//    FreeAndNil(objParametro);
    FreeAndNil(obj);
  end;
// salvar hora no chamado caso o status do parametro 10 for diferente do quadro
//  if ACodigoStatus <> iCodigoStatus then
//  begin
//    obj := TChamadoController.Create;
//    try
//      obj.UpdateHoraUsuarioAtual(AIdChamado);
//    finally
//      FreeAndNil(obj);
//    end;
//  end;
end;

procedure TfrmQuadro.GravarHoraAtualSolicitacao(AIdSolicitacao: Integer);
var
  obj: TSolicitacaoController;
begin
  obj := TSolicitacaoController.Create;
  try
    obj.UpdateHoraUsuarioAtual(AIdSolicitacao);
  finally
    FreeAndNil(obj);
  end;
end;

procedure TfrmQuadro.GravarStatus(AIdSolicitacao: Integer);
begin

end;

procedure TfrmQuadro.btnAbrirAtividadeClick(Sender: TObject);
begin
  ExecutarTimer(False);
  if not (TFuncoes.FormularioEstaCriado(TfrmChamado)) then
    TFuncoes.CriarFormularioModal(TfrmChamado.create(True, true, caAtividade));
  AbrirQuadrosAtividades;

  ExecutarTimer(True);
end;

procedure TfrmQuadro.btnAbrirChamadoClick(Sender: TObject);
begin
  ExecutarTimer(False);
  if not (TFuncoes.FormularioEstaCriado(TfrmChamado)) then
    TFuncoes.CriarFormularioModal(TfrmChamado.create(True, true, caChamado));
  AbrirQuadrosChamados;

  ExecutarTimer(True);
end;

procedure TfrmQuadro.btnAbrirSolicitacaoClick(Sender: TObject);
begin
  ExecutarTimer(False);
  if not (TFuncoes.FormularioEstaCriado(TfrmSolicitacao)) then
    TFuncoes.CriarFormularioModal(TfrmSolicitacao.create(True, true));
  AbrirQuadrosSolicitacao;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.btnAgendamentoClick(Sender: TObject);
var
  Formulario: TfrmAgendamento;
begin
  ExecutarTimer(False);
  Formulario := TfrmAgendamento.create(False, True);
  try
    if Formulario.ShowModal = mrOk then
      btnOkClick(Self);
  finally
    FreeAndNil(Formulario);
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.btnAnteriorClick(Sender: TObject);
begin
  AgendaAnterior();
end;

procedure TfrmQuadro.btnBuscarCliente2Click(Sender: TObject);
var
  Formulario: TfrmListaProblemaChamado;
begin
  Formulario := TfrmListaProblemaChamado.Create(False, caAtividade);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
end;

procedure TfrmQuadro.btnBuscarClienteClick(Sender: TObject);
begin
  ExecutarTimer(False);
  if not (TFuncoes.FormularioEstaCriado(TfrmCliente)) then
    TFuncoes.CriarFormulario(TfrmCliente.create(DM.IdUsuario));
  ExecutarTimer(True);
end;

procedure TfrmQuadro.btnOkClick(Sender: TObject);
begin
  InicioAgendamento();
end;

procedure TfrmQuadro.btnProximoClick(Sender: TObject);
begin
  AgendaProxima();
end;

procedure TfrmQuadro.btnSolucoes2Click(Sender: TObject);
var
  Formulario: TfrmListaProblemaChamado;
begin
  ExecutarTimer(False);
  Formulario := TfrmListaProblemaChamado.Create(False, caAtividade);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.btnSolucoesClick(Sender: TObject);
var
  Formulario: TfrmListaProblemaChamado;
begin
  ExecutarTimer(False);
  Formulario := TfrmListaProblemaChamado.Create(False);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.BuscarCliente(ACodigoCliente: Integer);
begin
  if ACodigoCliente > 0 then
  begin
    if not (TFuncoes.FormularioEstaCriado(TfrmCliente)) then
      TFuncoes.CriarFormulario(TfrmCliente.create(DM.IdUsuario, ACodigoCliente));
  end
  else
    raise Exception.Create('Não há Cliente para Acessar');
end;

procedure TfrmQuadro.Detalhes10Click(Sender: TObject);
begin
  DetalhesAtividade(FControllerChamado.Model.CDSAtividadeQuadro4Cha_Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes11Click(Sender: TObject);
begin
  DetalhesAtividade(FControllerChamado.Model.CDSAtividadeQuadro5Cha_Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes12Click(Sender: TObject);
begin
  DetalhesAtividade(FControllerChamado.Model.CDSAtividadeQuadro6Cha_Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes13Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda1Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes14Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda2Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes15Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda3Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes16Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda4Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes17Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda5Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes18Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda6Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes19Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda7Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes1Click(Sender: TObject);
begin
  DetalhesChamado(FControllerChamado.Model.CDSChamadoQuadro1Cha_Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes5Click(Sender: TObject);
begin
  DetalhesChamado(FControllerChamado.Model.CDSChamadoQuadro5Cha_Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes6Click(Sender: TObject);
begin
  DetalhesChamado(FControllerChamado.Model.CDSChamadoQuadro6Cha_Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes7Click(Sender: TObject);
begin
  DetalhesAtividade(FControllerChamado.Model.CDSAtividadeQuadro1Cha_Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes8Click(Sender: TObject);
begin
  DetalhesAtividade(FControllerChamado.Model.CDSAtividadeQuadro2Cha_Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes9Click(Sender: TObject);
begin
  DetalhesAtividade(FControllerChamado.Model.CDSAtividadeQuadro3Cha_Id.AsInteger);
end;

procedure TfrmQuadro.DetalhesAtividade(AIdChamado: Integer);
var
  Formulario: TfrmChamadoDetalhes2;
begin
  if AIdChamado = 0 then
    raise Exception.Create('Não há registro para Visualizar !');

  ExecutarTimer(False);
  Formulario := TfrmChamadoDetalhes2.create(AIdChamado, caAtividade);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.Cancelamento1Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda1Id.AsInteger, ageCancelamento);
end;

constructor TfrmQuadro.Create();
begin
  inherited Create(nil);

  FControllerChamado := TChamadoController.Create;
  FControllerSolicitacao := TSolicitacaoController.Create;
  FControllerAgendamento := TAgendamentoController.Create;

  cdsAgenda1.CreateDataSet;
  cdsAgenda2.CreateDataSet;
  cdsAgenda3.CreateDataSet;
  cdsAgenda4.CreateDataSet;
  cdsAgenda5.CreateDataSet;
  cdsAgenda6.CreateDataSet;
  cdsAgenda7.CreateDataSet;
  cdsAgenda8.CreateDataSet;
  cdsAgenda9.CreateDataSet;
  cdsAgenda10.CreateDataSet;
  cdsAgenda11.CreateDataSet;
  cdsAgenda12.CreateDataSet;
  cdsAgenda13.CreateDataSet;
  cdsAgenda14.CreateDataSet;
  cdsAgenda15.CreateDataSet;

  edtDataInicial.Text := DateToStr(Date);
  edtDataFinal.Text := DateToStr(Date + 15);

  if not FControllerChamado.PermissaoChamadoQuadro(dm.IdUsuario) then
    tsChamados.TabVisible := False
  else
    InicioChamados;

  if not FControllerSolicitacao.PermissaoQuadro(dm.IdUsuario) then
    tsSolicitacao.TabVisible := False
  else
    InicioSolicitacao;

  if not FControllerChamado.PermissaoAtividadeQuadro(dm.IdUsuario) then
    tsAtividades.TabVisible := False
  else
    InicioAtividades;

  if not FControllerAgendamento.PermissaoQuadro(dm.IdUsuario) then
    tsAgendamento.TabVisible := False
  else
    InicioAgendamento;

  QuadroTitulos();

  MostrarTempos();

end;

procedure TfrmQuadro.DadosAgendamento(var ATitulo: TLabel;
  ADataSet: TClientDataSet);
var
  dData: TDateTime;
begin
  dData := FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime;
//  ATitulo.Caption := DateToStr(dData)  + ' - ' + FormatDateTime('dddd', dData);
  ADataSet.Append;
  ADataSet.FieldByName('Data').AsDateTime   := dData;
  ADataSet.FieldByName('Id').AsInteger      := FControllerAgendamento.Model.CDSQuadroAge_Id.AsInteger;
  ADataSet.FieldByName('Hora').AsDateTime   := FControllerAgendamento.Model.CDSQuadroAge_Hora.AsDateTime;
  ADataSet.FieldByName('Cliente').AsString  := FControllerAgendamento.Model.CDSQuadroAge_NomeCliente.AsString;
  ADataSet.FieldByName('Usuario').AsString  := FControllerAgendamento.Model.CDSQuadroUsu_Nome.AsString;
  ADataSet.FieldByName('Status').AsString   := FControllerAgendamento.Model.CDSQuadroSta_Nome.AsString;

  ADataSet.Post;
end;

procedure TfrmQuadro.InicioAgendamento;
var
  dDataInicial,
  dDataFinal: TDate;
  sData1,
  sData2,
  sData3,
  sData4,
  sData5,
  sData6,
  sData7,
  sData8,
  sData9,
  sData10,
  sData11,
  sData12,
  sData13,
  sData14,
  sData15: string;
begin
  if not tsAgendamento.Showing then
    Exit;

  ExecutarTimer(False);
  try
    dDataInicial := StrToDate(edtDataInicial.Text);
    dDataFinal := StrToDate(edtDataFinal.Text);
  except
      raise Exception.Create('Data Inválida!');
      ExecutarTimer(True);
  end;

  if StrToDate(edtDataInicial.Text) > StrToDate(edtDataFinal.Text) then
    raise Exception.Create('Data Inicial maior que Data Final!');

  LimparAgendamento(cdsAgenda1);
  LimparAgendamento(cdsAgenda2);
  LimparAgendamento(cdsAgenda3);
  LimparAgendamento(cdsAgenda4);
  LimparAgendamento(cdsAgenda5);
  LimparAgendamento(cdsAgenda6);
  LimparAgendamento(cdsAgenda7);
  LimparAgendamento(cdsAgenda8);
  LimparAgendamento(cdsAgenda9);
  LimparAgendamento(cdsAgenda10);
  LimparAgendamento(cdsAgenda11);
  LimparAgendamento(cdsAgenda12);
  LimparAgendamento(cdsAgenda13);
  LimparAgendamento(cdsAgenda14);
  LimparAgendamento(cdsAgenda15);

  TitulosAgendamento();

  FControllerAgendamento.Quadro(dDataInicial, dDataFinal, dm.IdUsuario, 0);
  while not  FControllerAgendamento.Model.CDSQuadro.Eof do
  begin
    sData1 := Copy(lblAgenda1.Caption, 1, 10);
    sData2 := Copy(lblAgenda2.Caption, 1, 10);
    sData3 := Copy(lblAgenda3.Caption, 1, 10);
    sData4 := Copy(lblAgenda4.Caption, 1, 10);
    sData5 := Copy(lblAgenda5.Caption, 1, 10);
    sData6 := Copy(lblAgenda6.Caption, 1, 10);
    sData7 := Copy(lblAgenda7.Caption, 1, 10);
    sData8 := Copy(lblAgenda8.Caption, 1, 10);
    sData9 := Copy(lblAgenda9.Caption, 1, 10);
    sData10 := Copy(lblAgenda10.Caption, 1, 10);
    sData11 := Copy(lblAgenda11.Caption, 1, 10);
    sData12 := Copy(lblAgenda12.Caption, 1, 10);
    sData13 := Copy(lblAgenda13.Caption, 1, 10);
    sData14 := Copy(lblAgenda14.Caption, 1, 10);
    sData15 := Copy(lblAgenda15.Caption, 1, 10);

    if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData1) then
      DadosAgendamento(lblAgenda1, cdsAgenda1)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData2) then
      DadosAgendamento(lblAgenda2, cdsAgenda2)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData3) then
      DadosAgendamento(lblAgenda3, cdsAgenda3)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData4) then
      DadosAgendamento(lblAgenda4, cdsAgenda4)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData5) then
      DadosAgendamento(lblAgenda4, cdsAgenda5)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData6) then
      DadosAgendamento(lblAgenda4, cdsAgenda6)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData7) then
      DadosAgendamento(lblAgenda4, cdsAgenda7)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData8) then
      DadosAgendamento(lblAgenda4, cdsAgenda8)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData9) then
      DadosAgendamento(lblAgenda4, cdsAgenda9)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData10) then
      DadosAgendamento(lblAgenda4, cdsAgenda10)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData11) then
      DadosAgendamento(lblAgenda4, cdsAgenda11)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData12) then
      DadosAgendamento(lblAgenda4, cdsAgenda12)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData13) then
      DadosAgendamento(lblAgenda4, cdsAgenda13)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData14) then
      DadosAgendamento(lblAgenda4, cdsAgenda14)
    else if FControllerAgendamento.Model.CDSQuadroAge_Data.AsDateTime = StrToDate(sData15) then
      DadosAgendamento(lblAgenda4, cdsAgenda15);

    FControllerAgendamento.Model.CDSQuadro.Next;
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.TamanhoGrids;
var
  compSol: Integer;
  compCha: Integer;
  compAge: Integer;
begin
  Panel1.Width := trunc(Self.Width / 2); // chamados

  Panel7.Width := Trunc(Self.Width / 3); // solicitacao
  Panel11.Width := Trunc(Self.Width / 3); // solicitacao
  Panel26.Width := trunc(Self.Width / 2); // atividades

  pnlAgendaColuna1.Width := Trunc(Self.Width / 3); // Agendamento
  pnlAgendaColuna2.Width := Trunc(Self.Width / 3); // Agendamento
  pnlAgendaColuna3.Width := Trunc(Self.Width / 3); // Agendamento

  compCha := 400;
  dbQuadro1.Columns[3].Width := dbQuadro1.Width - compCha;
  dbQuadro2.Columns[3].Width := dbQuadro2.Width - compCha;
  dbQuadro3.Columns[3].Width := dbQuadro3.Width - compCha;
  dbQuadro4.Columns[3].Width := dbQuadro4.Width - compCha;
  dbQuadro5.Columns[3].Width := dbQuadro5.Width - compCha;
  dbQuadro6.Columns[3].Width := dbQuadro6.Width - compCha;

  dbAtivQuadro1.Columns[3].Width := dbQuadro1.Width - compCha;
  dbAtivQuadro2.Columns[3].Width := dbQuadro2.Width - compCha;
  dbAtivQuadro3.Columns[3].Width := dbQuadro3.Width - compCha;
  dbAtivQuadro4.Columns[3].Width := dbQuadro4.Width - compCha;
  dbAtivQuadro5.Columns[3].Width := dbQuadro5.Width - compCha;
  dbAtivQuadro6.Columns[3].Width := dbQuadro6.Width - compCha;

  compSol := 220; //180
  dbQuadroSol1.Columns[2].Width := dbQuadroSol1.Width - compSol;
  dbQuadroSol2.Columns[2].Width := dbQuadroSol2.Width - compSol;
  dbQuadroSol3.Columns[2].Width := dbQuadroSol3.Width - compSol;
  dbQuadroSol4.Columns[2].Width := dbQuadroSol4.Width - compSol;
  dbQuadroSol5.Columns[2].Width := dbQuadroSol5.Width - compSol;
  dbQuadroSol6.Columns[2].Width := dbQuadroSol6.Width - compSol;
  dbQuadroSol7.Columns[2].Width := dbQuadroSol7.Width - compSol;
  dbQuadroSol8.Columns[2].Width := dbQuadroSol8.Width - compSol;
  dbQuadroSol9.Columns[2].Width := dbQuadroSol9.Width - compSol;
  dbQuadroSol10.Columns[2].Width := dbQuadroSol10.Width - compSol;
  dbQuadroSol11.Columns[2].Width := dbQuadroSol11.Width - compSol;
  dbQuadroSol12.Columns[2].Width := dbQuadroSol12.Width - compSol;

  compAge := 240;
  dbAgenda1.Columns[1].Width := dbAgenda1.Width - compAge;
  dbAgenda2.Columns[1].Width := dbAgenda2.Width - compAge;
  dbAgenda3.Columns[1].Width := dbAgenda3.Width - compAge;
  dbAgenda4.Columns[1].Width := dbAgenda4.Width - compAge;
  dbAgenda5.Columns[1].Width := dbAgenda5.Width - compAge;
  dbAgenda6.Columns[1].Width := dbAgenda6.Width - compAge;
  dbAgenda7.Columns[1].Width := dbAgenda7.Width - compAge;
  dbAgenda8.Columns[1].Width := dbAgenda8.Width - compAge;
  dbAgenda9.Columns[1].Width := dbAgenda9.Width - compAge;
  dbAgenda10.Columns[1].Width := dbAgenda10.Width - compAge;
  dbAgenda11.Columns[1].Width := dbAgenda11.Width - compAge;
  dbAgenda12.Columns[1].Width := dbAgenda12.Width - compAge;
  dbAgenda13.Columns[1].Width := dbAgenda13.Width - compAge;
  dbAgenda14.Columns[1].Width := dbAgenda14.Width - compAge;
  dbAgenda15.Columns[1].Width := dbAgenda15.Width - compAge;
end;

procedure TfrmQuadro.InicioAtividades;
begin
  dsAtivQuadro1.DataSet := FControllerChamado.Model.CDSAtividadeQuadro1;
  dsAtivQuadro2.DataSet := FControllerChamado.Model.CDSAtividadeQuadro2;
  dsAtivQuadro3.DataSet := FControllerChamado.Model.CDSAtividadeQuadro3;
  dsAtivQuadro4.DataSet := FControllerChamado.Model.CDSAtividadeQuadro4;
  dsAtivQuadro5.DataSet := FControllerChamado.Model.CDSAtividadeQuadro5;
  dsAtivQuadro6.DataSet := FControllerChamado.Model.CDSAtividadeQuadro6;
end;

procedure TfrmQuadro.InicioChamados;
begin
  dsQuadro1.DataSet := FControllerChamado.Model.CDSChamadoQuadro1;
  dsQuadro2.DataSet := FControllerChamado.Model.CDSChamadoQuadro2;
  dsQuadro3.DataSet := FControllerChamado.Model.CDSChamadoQuadro3;
  dsQuadro4.DataSet := FControllerChamado.Model.CDSChamadoQuadro4;
  dsQuadro5.DataSet := FControllerChamado.Model.CDSChamadoQuadro5;
  dsQuadro6.DataSet := FControllerChamado.Model.CDSChamadoQuadro6;
end;

procedure TfrmQuadro.InicioSolicitacao;
begin
  dsQuadroSol1.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro1;
  dsQuadroSol2.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro2;
  dsQuadroSol3.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro3;
  dsQuadroSol4.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro4;
  dsQuadroSol5.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro5;
  dsQuadroSol6.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro6;
  dsQuadroSol7.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro7;
  dsQuadroSol8.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro8;
  dsQuadroSol9.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro9;
  dsQuadroSol10.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro10;
  dsQuadroSol11.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro11;
  dsQuadroSol12.DataSet := FControllerSolicitacao.Model.CDSSolicitacaoQuadro12;
end;

procedure TfrmQuadro.LimparAgendamento(ADataSet: TClientDataSet);
begin
  ADataSet.First;
  while not ADataSet.Eof do
    ADataSet.Delete;

  ADataSet.IndexFieldNames := 'Hora';
end;

procedure TfrmQuadro.MenuItem10Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda6Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem11Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda7Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem12Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda7Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem13Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda8Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem14Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda8Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem15Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda9Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem16Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda9Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem17Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda10Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem18Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda10Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem19Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda11Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem1Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda2Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem20Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda11Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem21Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda12Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem22Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda12Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem23Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda13Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem24Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda13Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem25Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda14Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem26Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda14Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem27Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda15Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem28Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda15Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem2Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda2Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem3Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda3Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem4Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda3Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem5Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda4Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem6Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda4Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem7Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda5Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MenuItem8Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda5Id.AsInteger, ageCancelamento);
end;

procedure TfrmQuadro.MenuItem9Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda6Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.MostrarTempos;
var
  CodStatusAbertura: string;
  CodStatusOcorrencia: string;
  CodStatusAberturaAtividade: string;
  CodStatusAtendimentoAtividade: string;
begin
  CodStatusAbertura   := FControllerChamado.StatusAbertura();
  CodStatusOcorrencia := FControllerChamado.StatusChamadoAtendimento();

  CodStatusAberturaAtividade := FControllerChamado.StatusAberturaAtividade();
  CodStatusAtendimentoAtividade := FControllerChamado.StatusAtendimentoAtividade();
//------------------------------------------------------------------------------
// Chamado
  TituloGrade(dbQuadro1, edtChaCodigo1.Text, CodStatusAbertura, CodStatusOcorrencia);
  TituloGrade(dbQuadro2, edtChaCodigo2.Text, CodStatusAbertura, CodStatusOcorrencia);
  TituloGrade(dbQuadro3, edtChaCodigo3.Text, CodStatusAbertura, CodStatusOcorrencia);
  TituloGrade(dbQuadro4, edtChaCodigo4.Text, CodStatusAbertura, CodStatusOcorrencia);
  TituloGrade(dbQuadro5, edtChaCodigo5.Text, CodStatusAbertura, CodStatusOcorrencia);
  TituloGrade(dbQuadro6, edtChaCodigo6.Text, CodStatusAbertura, CodStatusOcorrencia);
//------------------------------------------------------------------------------
// Atividades
  TituloGrade(dbAtivQuadro1, edtAtivCodigo1.Text, CodStatusAberturaAtividade, CodStatusAtendimentoAtividade);
  TituloGrade(dbAtivQuadro2, edtAtivCodigo2.Text, CodStatusAberturaAtividade, CodStatusAtendimentoAtividade);
  TituloGrade(dbAtivQuadro3, edtAtivCodigo3.Text, CodStatusAberturaAtividade, CodStatusAtendimentoAtividade);
  TituloGrade(dbAtivQuadro4, edtAtivCodigo4.Text, CodStatusAberturaAtividade, CodStatusAtendimentoAtividade);
  TituloGrade(dbAtivQuadro5, edtAtivCodigo5.Text, CodStatusAberturaAtividade, CodStatusAtendimentoAtividade);
  TituloGrade(dbAtivQuadro6, edtAtivCodigo6.Text, CodStatusAberturaAtividade, CodStatusAtendimentoAtividade);

end;

procedure TfrmQuadro.PermissaoSolicitacao;
var
  obj: TSolicitacaoController;
  bGeral: Boolean;
  bTecnica: Boolean;
  bAnalista: Boolean;
begin
  obj := TSolicitacaoController.Create;
  try
    try
      bGeral    := obj.PermissaoOcorrenciaGeral(dm.IdUsuario);
      bTecnica  := obj.PermissaoOcorrenciaTecnica(dm.IdUsuario);
      bAnalista := obj.PermissaoAnalise(dm.IdUsuario);
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'PermissaoSolicitacao');
      end;
    end;
  finally
    FreeAndNil(obj);
  end;

  pmGeral1.Enabled    := bGeral;
  pmTecnica1.Enabled  := bTecnica;
  pmAnalise1.Enabled  := bAnalista;

  pmGeral2.Enabled    := bGeral;
  pmTecnica2.Enabled  := bTecnica;
  pmAnalise2.Enabled  := bAnalista;

  pmGeral3.Enabled    := bGeral;
  pmTecnica3.Enabled  := bTecnica;
  pmAnalise3.Enabled  := bAnalista;

  pmGeral4.Enabled    := bGeral;
  pmTecnica4.Enabled  := bTecnica;
  pmAnalise4.Enabled  := bAnalista;

  pmGeral5.Enabled    := bGeral;
  pmTecnica5.Enabled  := bTecnica;
  pmAnalise5.Enabled  := bAnalista;

  pmGeral6.Enabled    := bGeral;
  pmTecnica6.Enabled  := bTecnica;
  pmAnalise6.Enabled  := bAnalista;

  pmGeral7.Enabled    := bGeral;
  pmTecnica7.Enabled  := bTecnica;
  pmAnalise7.Enabled  := bAnalista;

  pmGeral8.Enabled    := bGeral;
  pmTecnica8.Enabled  := bTecnica;
  pmAnalise8.Enabled  := bAnalista;

  pmGeral9.Enabled    := bGeral;
  pmTecnica9.Enabled  := bTecnica;
  pmAnalise9.Enabled  := bAnalista;

  pmGeral10.Enabled    := bGeral;
  pmTecnica10.Enabled  := bTecnica;
  pmAnalise10.Enabled  := bAnalista;

  pmGeral11.Enabled    := bGeral;
  pmTecnica11.Enabled  := bTecnica;
  pmAnalise11.Enabled  := bAnalista;

  pmGeral12.Enabled    := bGeral;
  pmTecnica12.Enabled  := bTecnica;
  pmAnalise12.Enabled  := bAnalista;
end;

procedure TfrmQuadro.pmAnalise1Click(Sender: TObject);
begin
  if Sender = pmAnalise1 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro1, solAnalise)
  else if Sender = pmAnalise2 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro2, solAnalise)
  else if Sender = pmAnalise3 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro3, solAnalise)
  else if Sender = pmAnalise4 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro4, solAnalise)
  else if Sender = pmAnalise5 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro5, solAnalise)
  else if Sender = pmAnalise6 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro6, solAnalise)
  else if Sender = pmAnalise7 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro7, solAnalise)
  else if Sender = pmAnalise8 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro8, solAnalise)
  else if Sender = pmAnalise9 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro9, solAnalise)
  else if Sender = pmAnalise10 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro10, solAnalise)
  else if Sender = pmAnalise11 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro11, solAnalise)
  else if Sender = pmAnalise12 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro12, solAnalise);

end;

procedure TfrmQuadro.pmDetalhes1Click(Sender: TObject);
var
  Id: Integer;
begin
  if Sender = pmDetalhes1 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro1Sol_Id.AsInteger
  else if Sender = pmDetalhes2 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro2Sol_Id.AsInteger
  else if Sender = pmDetalhes3 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro3Sol_Id.AsInteger
  else if Sender = pmDetalhes4 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro4Sol_Id.AsInteger
  else if Sender = pmDetalhes5 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro5Sol_Id.AsInteger
  else if Sender = pmDetalhes6 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro6Sol_Id.AsInteger
  else if Sender = pmDetalhes7 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro7Sol_Id.AsInteger
  else if Sender = pmDetalhes8 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro8Sol_Id.AsInteger
  else if Sender = pmDetalhes9 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro9Sol_Id.AsInteger
  else if Sender = pmDetalhes10 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro10Sol_Id.AsInteger
  else if Sender = pmDetalhes11 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro11Sol_Id.AsInteger
  else if Sender = pmDetalhes12 then
    Id := FControllerSolicitacao.Model.CDSSolicitacaoQuadro12Sol_Id.AsInteger;

  DetalhesSolicitacao(id);
end;

procedure TfrmQuadro.pmGeral1Click(Sender: TObject);
begin
  if Sender = pmGeral1 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro1, solOcorrGeral)
  else if Sender = pmGeral2 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro2, solOcorrGeral)
  else if Sender = pmGeral3 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro3, solOcorrGeral)
  else if Sender = pmGeral4 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro4, solOcorrGeral)
  else if Sender = pmGeral5 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro5, solOcorrGeral)
  else if Sender = pmGeral6 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro6, solOcorrGeral)
  else if Sender = pmGeral7 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro7, solOcorrGeral)
  else if Sender = pmGeral8 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro8, solOcorrGeral)
  else if Sender = pmGeral9 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro9, solOcorrGeral)
  else if Sender = pmGeral10 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro10, solOcorrGeral)
  else if Sender = pmGeral11 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro11, solOcorrGeral)
  else if Sender = pmGeral12 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro12, solOcorrGeral);

end;

procedure TfrmQuadro.pmTecnica1Click(Sender: TObject);
begin
  if Sender = pmTecnica1 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro1, solOcorrTecnica)
  else if Sender = pmTecnica2 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro2, solOcorrTecnica)
  else if Sender = pmTecnica3 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro3, solOcorrTecnica)
  else if Sender = pmTecnica4 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro4, solOcorrTecnica)
  else if Sender = pmTecnica5 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro5, solOcorrTecnica)
  else if Sender = pmTecnica6 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro6, solOcorrTecnica)
  else if Sender = pmTecnica7 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro7, solOcorrTecnica)
  else if Sender = pmTecnica8 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro8, solOcorrTecnica)
  else if Sender = pmTecnica9 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro9, solOcorrTecnica)
  else if Sender = pmTecnica10 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro10, solOcorrTecnica)
  else if Sender = pmTecnica11 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro11, solOcorrTecnica)
  else if Sender = pmTecnica12 then
    PopMenu(FControllerSolicitacao.Model.CDSSolicitacaoQuadro12, solOcorrTecnica);

end;

procedure TfrmQuadro.PodeEntrarSolicitacaoStatus(AIdSolicitacao: Integer;
  ACodStatusQuadro: string);
var
  sCodStatusSolicitacao: string;
begin
  sCodStatusSolicitacao := FControllerSolicitacao.RetornarCodigoStatusSolicitacao(AIdSolicitacao);
  if sCodStatusSolicitacao <> ACodStatusQuadro then
    raise Exception.Create('Solicitação em Atendimento por outra Pessoa!');
end;

procedure TfrmQuadro.PodeEntrarStatus(AIdChamado: Integer; ACodStatusQuadro: string;
  ATipo: TEnumChamadoAtividade = caChamado);
var
  sCodStatusChamado: string;
begin
  sCodStatusChamado := FControllerChamado.RetornarCodigoStatusChamado(AIdChamado);
  if sCodStatusChamado <> ACodStatusQuadro then
  begin
    if ATipo = caChamado then
      raise Exception.Create('Chamado em Atendimento por outra Pessoa!')
    else
      raise Exception.Create('Atividade em Atendimento por outra Pessoa!');
  end;
end;

procedure TfrmQuadro.PodeEntrarUsuario(Sender: TObject; ATipo: TEnumChamadoAtividade = caChamado);
var
  objStatus: TStatusController;
  iCodigoStatusChamadoAtendimento: Integer;
  bOk: Boolean;
begin
  if ATipo = caChamado then
    iCodigoStatusChamadoAtendimento := StrToIntDef(FControllerChamado.StatusChamadoAtendimento(),0)
  else
    iCodigoStatusChamadoAtendimento := StrToIntDef(FControllerChamado.StatusAtendimentoAtividade(),0);

  bOk := True;

  // se codigo do status do quadro for igual ao do parametro 10 e
  // se usuario do grid for igual ao usuario logado,
  // então pode entrar
  if Sender = dbQuadro1 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSChamadoQuadro1Cha_Id.AsInteger, edtChaCodigo1.Text, caChamado);
    if StrToIntDef(edtChaCodigo1.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSChamadoQuadro1Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if Sender = dbQuadro2 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSChamadoQuadro2Cha_Id.AsInteger, edtChaCodigo2.Text, caChamado);
    if StrToIntDef(edtChaCodigo2.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSChamadoQuadro2Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if Sender = dbQuadro3 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSChamadoQuadro3Cha_Id.AsInteger, edtChaCodigo3.Text, caChamado);
    if StrToIntDef(edtChaCodigo3.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSChamadoQuadro3Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if Sender = dbQuadro4 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSChamadoQuadro4Cha_Id.AsInteger, edtChaCodigo4.Text, caChamado);
    if StrToIntDef(edtChaCodigo4.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSChamadoQuadro4Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if Sender = dbQuadro5 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSChamadoQuadro5Cha_Id.AsInteger, edtChaCodigo5.Text, caChamado);
    if StrToIntDef(edtChaCodigo5.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSChamadoQuadro5Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if Sender = dbQuadro6 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSChamadoQuadro6Cha_Id.AsInteger, edtChaCodigo6.Text, caChamado);
    if StrToIntDef(edtChaCodigo6.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSChamadoQuadro6Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;
//------------------------------------------------------------------------------
// Atividades
  if Sender = dbAtivQuadro1 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSAtividadeQuadro1Cha_Id.AsInteger, edtAtivCodigo1.Text, caAtividade);
    if StrToIntDef(edtAtivCodigo1.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSAtividadeQuadro1Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if Sender = dbAtivQuadro2 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSAtividadeQuadro2Cha_Id.AsInteger, edtAtivCodigo2.Text, caAtividade);
    if StrToIntDef(edtAtivCodigo2.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSAtividadeQuadro2Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if Sender = dbAtivQuadro3 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSAtividadeQuadro3Cha_Id.AsInteger, edtAtivCodigo3.Text, caAtividade);
    if StrToIntDef(edtAtivCodigo3.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSAtividadeQuadro3Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if Sender = dbAtivQuadro4 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSAtividadeQuadro4Cha_Id.AsInteger, edtAtivCodigo4.Text, caAtividade);
    if StrToIntDef(edtAtivCodigo4.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSAtividadeQuadro4Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if Sender = dbAtivQuadro5 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSAtividadeQuadro5Cha_Id.AsInteger, edtAtivCodigo5.Text, caAtividade);
    if StrToIntDef(edtAtivCodigo5.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSAtividadeQuadro5Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if Sender = dbAtivQuadro6 then
  begin
    PodeEntrarStatus(FControllerChamado.Model.CDSAtividadeQuadro6Cha_Id.AsInteger, edtAtivCodigo6.Text, caAtividade);
    if StrToIntDef(edtAtivCodigo6.Text, 0) = (iCodigoStatusChamadoAtendimento) then
    begin
      if dm.IdUsuario <> FControllerChamado.Model.CDSAtividadeQuadro6Cha_UsuarioAtendeAtual.AsInteger then
        bOk := False;
    end;
  end;

  if bOk = False then
  begin
    if ATipo = caChamado then
      raise Exception.Create('Chamado em Atendimento por outra Pessoa!')
    else
      raise Exception.Create('Atividade em Atendimento por outra Pessoa!');
  end;

end;

procedure TfrmQuadro.PodeEntrarUsuarioSolicitacao(Sender: TObject);
var
  objStatus: TStatusController;
//  iCodigoStatusSolicitacaoAtendimento: Integer;
  bOk: Boolean;
begin
//  iCodigoStatusSolicitacaoAtendimento := StrToIntDef(FControllerChamado.StatusChamadoAtendimento(),0);

  // se nao tem usuario não faz nada
  if FControllerSolicitacao.Model.CDSSolicitacaoQuadro1Sol_UsuarioAtendeAtual.AsInteger = 0 then
    Exit;

  bOk := True;

  // se codigo do status do quadro for igual ao do parametro 10 e
  // se usuario do grid for igual ao usuario logado,
  // então pode entrar
  if Sender = dbQuadroSol1 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro1Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;

//    PodeEntrarSolicitacaoStatus(FControllerSolicitacao.Model.CDSSolicitacaoQuadro1Sol_Id.AsInteger, edtSolCodigo1.Text);
//    if StrToIntDef(edtSolCodigo1.Text, 0) = (iCodigoStatusSolicitacaoAtendimento) then
//    begin
//      if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro1Sol_UsuarioAtendeAtual.AsInteger then
//        bOk := False;
//    end;
  end;

  if Sender = dbQuadroSol2 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro2Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if Sender = dbQuadroSol3 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro3Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if Sender = dbQuadroSol4 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro4Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if Sender = dbQuadroSol5 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro5Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if Sender = dbQuadroSol6 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro6Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if Sender = dbQuadroSol7 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro7Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if Sender = dbQuadroSol8 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro8Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if Sender = dbQuadroSol9 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro9Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if Sender = dbQuadroSol10 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro10Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if Sender = dbQuadroSol11 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro11Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if Sender = dbQuadroSol12 then
  begin
    if dm.IdUsuario <> FControllerSolicitacao.Model.CDSSolicitacaoQuadro12Sol_UsuarioAtendeAtual.AsInteger then
      bOk := False;
  end;

  if bOk = False then
    raise Exception.Create('Solicitação em Atendimento por outra Pessoa!');

end;

procedure TfrmQuadro.PopMenu(AClientDataSet: TClientDataSet; ATipoSol: TEnumSolicitacao);
var
  bGeral: Boolean;
  bTecnica: Boolean;
  bAnalise: Boolean;
begin
  if AClientDataSet.IsEmpty then
    raise Exception.Create('Não há Registros para Editar!');

  ExecutarTimer(False);
  bGeral    := (ATipoSol = solOcorrGeral);
  bTecnica  := (ATipoSol = solOcorrTecnica);
  bAnalise  := (ATipoSol = solAnalise);

  TFuncoes.CriarFormularioModal(TfrmSolicitacao.create(AClientDataSet.FieldByName('Sol_Id').AsInteger, True, bGeral, bTecnica, bAnalise));
  AbrirQuadrosSolicitacao;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.dbAgenda1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Sender = dbAgenda1 then
    TGrade.Zebrar(dsAgenda1.DataSet, dbAgenda1, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda2 then
    TGrade.Zebrar(dsAgenda2.DataSet, dbAgenda2, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda3 then
    TGrade.Zebrar(dsAgenda3.DataSet, dbAgenda3, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda4 then
    TGrade.Zebrar(dsAgenda4.DataSet, dbAgenda4, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda5 then
    TGrade.Zebrar(dsAgenda5.DataSet, dbAgenda5, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda6 then
    TGrade.Zebrar(dsAgenda6.DataSet, dbAgenda6, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda7 then
    TGrade.Zebrar(dsAgenda7.DataSet, dbAgenda7, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda8 then
    TGrade.Zebrar(dsAgenda8.DataSet, dbAgenda8, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda9 then
    TGrade.Zebrar(dsAgenda9.DataSet, dbAgenda9, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda10 then
    TGrade.Zebrar(dsAgenda10.DataSet, dbAgenda10, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda11 then
    TGrade.Zebrar(dsAgenda11.DataSet, dbAgenda11, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda12 then
    TGrade.Zebrar(dsAgenda12.DataSet, dbAgenda12, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda13 then
    TGrade.Zebrar(dsAgenda13.DataSet, dbAgenda13, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda14 then
    TGrade.Zebrar(dsAgenda14.DataSet, dbAgenda14, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAgenda15 then
    TGrade.Zebrar(dsAgenda15.DataSet, dbAgenda15, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmQuadro.dbAtivQuadro1DblClick(Sender: TObject);
begin
  ExecutarTimer(False);
  try
    if Sender = dbAtivQuadro1 then
      ValidarChamado(dbAtivQuadro1, FControllerChamado.Model.CDSAtividadeQuadro1, edtAtivCodigo1.Text, caAtividade)
    else if Sender = dbAtivQuadro2 then
      ValidarChamado(dbAtivQuadro2, FControllerChamado.Model.CDSAtividadeQuadro2, edtAtivCodigo2.Text, caAtividade)
    else if Sender = dbAtivQuadro3 then
      ValidarChamado(dbAtivQuadro3, FControllerChamado.Model.CDSAtividadeQuadro3, edtAtivCodigo3.Text, caAtividade)
    else if Sender = dbAtivQuadro4 then
      ValidarChamado(dbAtivQuadro4, FControllerChamado.Model.CDSAtividadeQuadro4, edtAtivCodigo4.Text, caAtividade)
    else if Sender = dbAtivQuadro5 then
      ValidarChamado(dbAtivQuadro5, FControllerChamado.Model.CDSAtividadeQuadro5, edtAtivCodigo5.Text, caAtividade)
    else if Sender = dbAtivQuadro6 then
      ValidarChamado(dbAtivQuadro6, FControllerChamado.Model.CDSAtividadeQuadro6, edtAtivCodigo6.Text, caAtividade);
  finally
    AbrirQuadrosAtividades();
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.dbAtivQuadro1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Sender = dbAtivQuadro1 then
    TGrade.Zebrar(dsAtivQuadro1.DataSet, dbAtivQuadro1, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAtivQuadro2 then
    TGrade.Zebrar(dsAtivQuadro2.DataSet, dbAtivQuadro2, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAtivQuadro3 then
    TGrade.Zebrar(dsAtivQuadro3.DataSet, dbAtivQuadro3, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAtivQuadro4 then
    TGrade.Zebrar(dsAtivQuadro4.DataSet, dbAtivQuadro4, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAtivQuadro5 then
    TGrade.Zebrar(dsAtivQuadro5.DataSet, dbAtivQuadro5, Sender, Rect, DataCol, Column, State)
  else if Sender = dbAtivQuadro6 then
    TGrade.Zebrar(dsAtivQuadro6.DataSet, dbAtivQuadro6, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmQuadro.dbQuadro1DblClick(Sender: TObject);
begin
  ExecutarTimer(False);
  try
    if Sender = dbQuadro1 then
      ValidarChamado(dbQuadro1, FControllerChamado.Model.CDSChamadoQuadro1, edtChaCodigo1.Text)
    else if Sender = dbQuadro2 then
      ValidarChamado(dbQuadro2, FControllerChamado.Model.CDSChamadoQuadro2, edtChaCodigo2.Text)
    else if Sender = dbQuadro3 then
      ValidarChamado(dbQuadro3, FControllerChamado.Model.CDSChamadoQuadro3, edtChaCodigo3.Text)
    else if Sender = dbQuadro4 then
      ValidarChamado(dbQuadro4, FControllerChamado.Model.CDSChamadoQuadro4, edtChaCodigo4.Text)
    else if Sender = dbQuadro5 then
      ValidarChamado(dbQuadro5, FControllerChamado.Model.CDSChamadoQuadro5, edtChaCodigo5.Text)
    else if Sender = dbQuadro6 then
      ValidarChamado(dbQuadro6, FControllerChamado.Model.CDSChamadoQuadro6, edtChaCodigo6.Text);
  finally
    AbrirQuadrosChamados;
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.dbQuadro1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsQuadro1.DataSet, dbQuadro1, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmQuadro.dbQuadro1TitleClick(Column: TColumn);
begin
  FControllerChamado.Model.CDSChamadoQuadro1.IndexFieldNames := Column.FieldName;
end;

procedure TfrmQuadro.dbQuadro2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsQuadro2.DataSet, dbQuadro2, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmQuadro.dbQuadro2TitleClick(Column: TColumn);
begin
  FControllerChamado.Model.CDSChamadoQuadro2.IndexFieldNames := Column.FieldName;
end;

procedure TfrmQuadro.dbQuadro3DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsQuadro3.DataSet, dbQuadro3, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmQuadro.dbQuadro3TitleClick(Column: TColumn);
begin
  FControllerChamado.Model.CDSChamadoQuadro3.IndexFieldNames := Column.FieldName;
end;

procedure TfrmQuadro.dbQuadro4DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsQuadro4.DataSet, dbQuadro4, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmQuadro.dbQuadro4TitleClick(Column: TColumn);
begin
  FControllerChamado.Model.CDSChamadoQuadro4.IndexFieldNames := Column.FieldName;
end;

procedure TfrmQuadro.dbQuadro5DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsQuadro5.DataSet, dbQuadro5, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmQuadro.dbQuadro5TitleClick(Column: TColumn);
begin
  FControllerChamado.Model.CDSChamadoQuadro5.IndexFieldNames := Column.FieldName;
end;

procedure TfrmQuadro.dbQuadro6DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TGrade.Zebrar(dsQuadro6.DataSet, dbQuadro6, Sender, Rect, DataCol, Column, State);
end;

procedure TfrmQuadro.dbQuadro6TitleClick(Column: TColumn);
begin
  FControllerChamado.Model.CDSChamadoQuadro6.IndexFieldNames := Column.FieldName;
end;

procedure TfrmQuadro.dbQuadroSol1DblClick(Sender: TObject);
begin
  ExecutarTimer(False);
  try
    if Sender = dbQuadroSol1 then
      ValidarSolicitacao(dbQuadroSol1, FControllerSolicitacao.Model.CDSSolicitacaoQuadro1)
    else if Sender = dbQuadroSol2 then
      ValidarSolicitacao(dbQuadroSol2, FControllerSolicitacao.Model.CDSSolicitacaoQuadro2)
    else if Sender = dbquadrosol3 then
      ValidarSolicitacao(dbQuadroSol3, FControllerSolicitacao.Model.CDSSolicitacaoQuadro3)
    else if Sender = dbquadrosol4 then
      ValidarSolicitacao(dbQuadroSol4, FControllerSolicitacao.Model.CDSSolicitacaoQuadro4)
    else if Sender = dbquadrosol5 then
      ValidarSolicitacao(dbQuadroSol5, FControllerSolicitacao.Model.CDSSolicitacaoQuadro5)
    else if Sender = dbquadrosol6 then
      ValidarSolicitacao(dbQuadroSol6, FControllerSolicitacao.Model.CDSSolicitacaoQuadro6)
    else if Sender = dbquadrosol7 then
      ValidarSolicitacao(dbQuadroSol7, FControllerSolicitacao.Model.CDSSolicitacaoQuadro7)
    else if Sender = dbquadrosol8 then
      ValidarSolicitacao(dbQuadroSol8, FControllerSolicitacao.Model.CDSSolicitacaoQuadro8)
    else if Sender = dbquadrosol9 then
      ValidarSolicitacao(dbQuadroSol9, FControllerSolicitacao.Model.CDSSolicitacaoQuadro9)
    else if Sender = dbquadrosol10 then
      ValidarSolicitacao(dbQuadroSol10, FControllerSolicitacao.Model.CDSSolicitacaoQuadro10)
    else if Sender = dbquadrosol11 then
      ValidarSolicitacao(dbQuadroSol11, FControllerSolicitacao.Model.CDSSolicitacaoQuadro11)
    else if Sender = dbquadrosol12 then
      ValidarSolicitacao(dbQuadroSol12, FControllerSolicitacao.Model.CDSSolicitacaoQuadro12);
  finally
    AbrirQuadrosSolicitacao;
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.dbQuadroSol1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Sender = dbQuadroSol1 then
    TGrade.Zebrar(dsQuadroSol1.DataSet, dbQuadroSol1, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol2 then
    TGrade.Zebrar(dsQuadroSol2.DataSet, dbQuadroSol2, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol3 then
    TGrade.Zebrar(dsQuadroSol3.DataSet, dbQuadroSol3, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol4 then
    TGrade.Zebrar(dsQuadroSol4.DataSet, dbQuadroSol4, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol5 then
    TGrade.Zebrar(dsQuadroSol5.DataSet, dbQuadroSol5, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol6 then
    TGrade.Zebrar(dsQuadroSol6.DataSet, dbQuadroSol6, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol7 then
    TGrade.Zebrar(dsQuadroSol7.DataSet, dbQuadroSol7, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol8 then
    TGrade.Zebrar(dsQuadroSol8.DataSet, dbQuadroSol8, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol9 then
    TGrade.Zebrar(dsQuadroSol9.DataSet, dbQuadroSol9, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol10 then
    TGrade.Zebrar(dsQuadroSol10.DataSet, dbQuadroSol10, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol11 then
    TGrade.Zebrar(dsQuadroSol11.DataSet, dbQuadroSol11, Sender, Rect, DataCol, Column, State)
  else if Sender = dbQuadroSol12 then
    TGrade.Zebrar(dsQuadroSol12.DataSet, dbQuadroSol12, Sender, Rect, DataCol, Column, State);

end;

procedure TfrmQuadro.Detalhes20Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda8Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes21Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda9Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes22Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda10Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes23Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda11Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes24Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda12Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes25Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda13Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes26Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda14Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes27Click(Sender: TObject);
begin
  EntrarDetalhes(cdsAgenda15Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes2Click(Sender: TObject);
begin
  DetalhesChamado(FControllerChamado.Model.CDSChamadoQuadro2Cha_Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes3Click(Sender: TObject);
begin
  DetalhesChamado(FControllerChamado.Model.CDSChamadoQuadro3Cha_Id.AsInteger);
end;

procedure TfrmQuadro.Detalhes4Click(Sender: TObject);
begin
  DetalhesChamado(FControllerChamado.Model.CDSChamadoQuadro4Cha_Id.AsInteger);
end;

procedure TfrmQuadro.DetalhesChamado(AIdChamado: Integer);
var
  Formulario: TfrmChamadoDetalhes2;
begin
  if AIdChamado = 0 then
    raise Exception.Create('Não há registro para Visualizar !');

  ExecutarTimer(False);
  Formulario := TfrmChamadoDetalhes2.create(AIdChamado);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.DetalhesSolicitacao(IdSolicitacao: Integer);
var
  Formulario: TfrmSolicitacaoDetalhes2;
begin
  if IdSolicitacao = 0 then
    raise Exception.Create('Não há Registros!');

  ExecutarTimer(False);

  Formulario := TfrmSolicitacaoDetalhes2.Create(IdSolicitacao, TEnumSolicitacao.solOcorrGeral);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.Encerrar10Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda10.DataSet);
end;

procedure TfrmQuadro.Encerrar11Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda11.DataSet);
end;

procedure TfrmQuadro.Encerrar12Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda12.DataSet);
end;

procedure TfrmQuadro.Encerrar13Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda13.DataSet);
end;

procedure TfrmQuadro.Encerrar14Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda14.DataSet);
end;

procedure TfrmQuadro.Encerrar15Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda15.DataSet);
end;

procedure TfrmQuadro.Encerrar1Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda1.DataSet);
end;

procedure TfrmQuadro.Encerrar2Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda2.DataSet);
end;

procedure TfrmQuadro.Encerrar3Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda3.DataSet);
end;

procedure TfrmQuadro.Encerrar4Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda4.DataSet);
end;

procedure TfrmQuadro.Encerrar5Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda5.DataSet);
end;

procedure TfrmQuadro.Encerrar6Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda6.DataSet);
end;

procedure TfrmQuadro.Encerrar7Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda7.DataSet);
end;

procedure TfrmQuadro.Encerrar8Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda8.DataSet);
end;

procedure TfrmQuadro.Encerrar9Click(Sender: TObject);
begin
  AgendaAbrirPrograma(dsAgenda9.DataSet);
end;

procedure TfrmQuadro.EntrarAgendamento(AId: Integer; ATipo: TEnumAgendamento);
var
  Formulario: TfrmAgendamentoMotivo;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registros!');

  ExecutarTimer(False);
  Formulario := TfrmAgendamentoMotivo.create(AId, ATipo);
  try
    if Formulario.ShowModal = mrOk then
    begin
      EnviarEmail(AId);
      btnOkClick(Self);
    end;
  finally
    FreeAndNil(Formulario);
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.EntrarDetalhes(AId: Integer);
var
  Formulario: TfrmAgendamentoMotivo;
begin
  if AId = 0 then
    raise Exception.Create('Não há Registros!');

  ExecutarTimer(False);
  Formulario := TfrmAgendamentoMotivo.create(AId);
  try
    Formulario.ShowModal;
  finally
    FreeAndNil(Formulario);
  end;
  ExecutarTimer(True);
end;

procedure TfrmQuadro.EnviarEmail(AId: Integer);
var
  AgendaController: TAgendamentoController;
begin
  AgendaController := TAgendamentoController.Create;
  try
    AgendaController.LocalizarId(AId);
    AgendaController.EnvioEmail(AId, AgendaController.Model.CDSCadastroAge_Status.AsInteger);
  finally
    FreeAndNil(AgendaController);
  end;
end;

procedure TfrmQuadro.ExecutarTimer(AExecutar: Boolean);
begin
  Timer1.Enabled := AExecutar;
end;

procedure TfrmQuadro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FControllerChamado);
  Action := caFree;
end;

procedure TfrmQuadro.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FControllerChamado);
  FreeAndNil(FControllerSolicitacao);
  FreeAndNil(FControllerAgendamento);
end;

procedure TfrmQuadro.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmQuadro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key:=#0;
    perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmQuadro.FormResize(Sender: TObject);
begin
  AlturaGrid();
  TamanhoGrids();
end;

procedure TfrmQuadro.FormShow(Sender: TObject);
var
  img: TfrmImagens;
begin
  tsCodigos.TabVisible := False;

  img := TfrmImagens.Create(self);
  try
    try
      btnAbrirChamado.Glyph := img.btnNovo.Glyph;
      btnAbrirSolicitacao.Glyph := img.btnNovo.Glyph;
      btnSolucoes.Glyph := img.btnSolucao.Glyph;
      btnBuscarCliente.Glyph := img.btnFiltro.Glyph;
      btnAbrirAtividade.Glyph := img.btnNovo.Glyph;
      btnSolucoes2.Glyph := img.btnSolucao.Glyph;
      btnBuscarCliente2.Glyph := img.btnFiltro.Glyph;
      btnAgendamento.Glyph := img.btnNovo.Glyph;
      btnOk.Glyph := img.btnConfirmar.Glyph;
      btnAnterior.Glyph := img.btnAnterior.Glyph;
      btnProximo.Glyph := img.btnProximo.Glyph;
    except
      On E: Exception do
      begin
        TFuncoes.Excessao(E, 'FormShow');
      end;
    end;
  finally
    FreeAndNil(img);
  end;

  if tsChamados.TabVisible then
    PageControl1.ActivePageIndex := 0
  else if tsSolicitacao.TabVisible then
    PageControl1.ActivePageIndex := 1
  else if tsAtividades.TabVisible then
    PageControl1.ActivePageIndex := 2;

  PermissaoSolicitacao();
  ExecutarTimer(True);
  AlturaGrid();
end;

procedure TfrmQuadro.QuadroTitulos;
var
  Parametro: TParametrosController;
begin
  Parametro := TParametrosController.Create;
  try
    Parametro.TitulosQuadros;
    while not Parametro.Model.CDSParametrosTitulosChamados.Eof do
    begin
//------------------------------------------------------------------------------
// Chamado
      TitulosChamados(Parametro, '3', lblTitulo1, edtChaCodigo1);
      TitulosChamados(Parametro, '4', lblTitulo2, edtChaCodigo2);
      TitulosChamados(Parametro, '5', lblTitulo3, edtChaCodigo3);
      TitulosChamados(Parametro, '6', lblTitulo4, edtChaCodigo4);
      TitulosChamados(Parametro, '7', lblTitulo5, edtChaCodigo5);
      TitulosChamados(Parametro, '8', lblTitulo6, edtChaCodigo6);
//------------------------------------------------------------------------------
// solicitacao
      TitulosSolicitacoes(Parametro, '12', lblTitSolicitacao1);
      TitulosSolicitacoes(Parametro, '13', lblTitSolicitacao2);
      TitulosSolicitacoes(Parametro, '14', lblTitSolicitacao3);
      TitulosSolicitacoes(Parametro, '15', lblTitSolicitacao4);
      TitulosSolicitacoes(Parametro, '16', lblTitSolicitacao5);
      TitulosSolicitacoes(Parametro, '17', lblTitSolicitacao6);
      TitulosSolicitacoes(Parametro, '19', lblTitSolicitacao7);
      TitulosSolicitacoes(Parametro, '20', lblTitSolicitacao8);
      TitulosSolicitacoes(Parametro, '21', lblTitSolicitacao9);
      TitulosSolicitacoes(Parametro, '22', lblTitSolicitacao10);
      TitulosSolicitacoes(Parametro, '23', lblTitSolicitacao11);
      TitulosSolicitacoes(Parametro, '24', lblTitSolicitacao12);
//------------------------------------------------------------------------------
// Atividades
      TitulosAtividades(Parametro, '25', lblTitAtiv1, edtAtivCodigo1);
      TitulosAtividades(Parametro, '26', lblTitAtiv2, edtAtivCodigo2);
      TitulosAtividades(Parametro, '27', lblTitAtiv3, edtAtivCodigo3);
      TitulosAtividades(Parametro, '28', lblTitAtiv4, edtAtivCodigo4);
      TitulosAtividades(Parametro, '29', lblTitAtiv5, edtAtivCodigo5);
      TitulosAtividades(Parametro, '30', lblTitAtiv6, edtAtivCodigo6);

      Parametro.Model.CDSParametrosTitulosChamados.Next;
    end;
  finally
    FreeAndNil(Parametro);
  end;

  if tsChamados.TabVisible then
    AbrirQuadrosChamados();

  if tsSolicitacao.TabVisible then
    AbrirQuadrosSolicitacao();

  if tsAtividades.TabVisible then
    AbrirQuadrosAtividades();
end;

procedure TfrmQuadro.Reagendamento1Click(Sender: TObject);
begin
  EntrarAgendamento(cdsAgenda1Id.AsInteger, ageReagendamento);
end;

procedure TfrmQuadro.Timer1Timer(Sender: TObject);
begin
  if tsChamados.TabVisible then
    AbrirQuadrosChamados();

  if tsAtividades.TabVisible then
    AbrirQuadrosAtividades();

  if tsSolicitacao.TabVisible then
    AbrirQuadrosSolicitacao();

  if tsAgendamento.TabVisible then
    InicioAgendamento();
end;

procedure TfrmQuadro.TituloGrade(var AGrade: TDBGrid; ACodigoStatus, AStatusAbertura,
  AStatusOcorrencia: string);
var
  iColuna: Integer;
begin
  iColuna := 7;

  if ACodigoStatus = AStatusAbertura then  // parametro 9
  begin
    AGrade.Columns[iColuna].FieldName := 'CTempo';
  end
  else if ACodigoStatus = AStatusOcorrencia then // parametro 10
    AGrade.Columns[iColuna].FieldName := 'CTempoPar10'
  else // outros
    AGrade.Columns[iColuna].FieldName := 'CTempoParOutro';

  AGrade.Columns[iColuna].Title.Caption := 'Tempo';
end;

procedure TfrmQuadro.TitulosAgendamento;
begin
  lblAgenda1.Caption := edtDataInicial.Text;
  lblAgenda2.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 1);
  lblAgenda3.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 2);
  lblAgenda4.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 3);
  lblAgenda5.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 4);
  lblAgenda6.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 5);
  lblAgenda7.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 6);
  lblAgenda8.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 7);
  lblAgenda9.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 8);
  lblAgenda10.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 9);
  lblAgenda11.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 10);
  lblAgenda12.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 11);
  lblAgenda13.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 12);
  lblAgenda14.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 13);
  lblAgenda15.Caption := DateToStr(StrToDate(edtDataInicial.Text) + 14);

  lblAgenda1.Caption := lblAgenda1.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda1.Caption));
  lblAgenda2.Caption := lblAgenda2.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda2.Caption));
  lblAgenda3.Caption := lblAgenda3.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda3.Caption));
  lblAgenda4.Caption := lblAgenda4.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda4.Caption));
  lblAgenda5.Caption := lblAgenda5.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda5.Caption));
  lblAgenda6.Caption := lblAgenda6.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda6.Caption));
  lblAgenda7.Caption := lblAgenda7.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda7.Caption));
  lblAgenda8.Caption := lblAgenda8.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda8.Caption));
  lblAgenda9.Caption := lblAgenda9.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda9.Caption));
  lblAgenda10.Caption := lblAgenda10.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda10.Caption));
  lblAgenda11.Caption := lblAgenda11.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda11.Caption));
  lblAgenda12.Caption := lblAgenda12.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda12.Caption));
  lblAgenda13.Caption := lblAgenda13.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda13.Caption));
  lblAgenda14.Caption := lblAgenda14.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda14.Caption));
  lblAgenda15.Caption := lblAgenda15.Caption + ' - ' + FormatDateTime('dddd', StrToDate(lblAgenda15.Caption));
end;

procedure TfrmQuadro.TitulosAtividades(AObj: TParametrosController;
  ACodigo: string; var ALblTitulo: TLabel; var ATxtCodigo: TEdit);
begin
  if AObj.Model.CDSParametrosTitulosChamadosPar_Codigo.AsString = ACodigo then
  begin
    ALblTitulo.Caption := AObj.Model.CDSParametrosTitulosChamadosSta_Nome.AsString;
    ATxtCodigo.Text := AObj.Model.CDSParametrosTitulosChamadosSta_Codigo.AsString;
  end;
end;

procedure TfrmQuadro.TitulosChamados(AObj: TParametrosController;
  ACodigo: string; var ALblTitulo: TLabel; var ATxtCodigo: TEdit);
begin
  if AObj.Model.CDSParametrosTitulosChamadosPar_Codigo.AsString = ACodigo then
  begin
    ALblTitulo.Caption := AObj.Model.CDSParametrosTitulosChamadosSta_Nome.AsString;
    ATxtCodigo.Text := AObj.Model.CDSParametrosTitulosChamadosSta_Codigo.AsString;
  end;
end;

procedure TfrmQuadro.TitulosSolicitacoes(AObj: TParametrosController;
  ACodigo: string; var ALblTitulo: TLabel);
begin
  if AObj.Model.CDSParametrosTitulosChamadosPar_Codigo.AsString = ACodigo then
    ALblTitulo.Caption := AObj.Model.CDSParametrosTitulosChamadosSta_Nome.AsString;
end;

procedure TfrmQuadro.tsAgendamentoShow(Sender: TObject);
begin
  TamanhoGrids();
  InicioAgendamento();
end;

procedure TfrmQuadro.tsAtividadesShow(Sender: TObject);
begin
  AbrirQuadrosAtividades();
end;

procedure TfrmQuadro.tsChamadosShow(Sender: TObject);
begin
  AbrirQuadrosChamados();
end;

procedure TfrmQuadro.tsSolicitacaoShow(Sender: TObject);
begin
  TamanhoGrids();
  AbrirQuadrosSolicitacao();
end;

procedure TfrmQuadro.ValidarChamado(var AGrade: TDBGrid; ADataSet: TDataSet;
  ACodigoStatus: string; ATipo: TEnumChamadoAtividade = caChamado);
var
  IdChamado: Integer;
begin
  if ATipo = caChamado then
  begin
    if not FControllerChamado.PermissaoChamadoOcorrencia(DM.IdUsuario) then
      raise Exception.Create('Usuário sem Permissão!');
  end
  else begin
    if not FControllerChamado.PermissaoAtividadeOcorrencia(DM.IdUsuario) then
      raise Exception.Create('Usuário sem Permissão!');
  end;

  IdChamado := ADataSet.FieldByName('Cha_Id').AsInteger;
  if FControllerChamado.PermissaoEditar(IdChamado, ATipo) then
  begin
    if ADataSet.IsEmpty then
      raise Exception.Create('Não há Registro para Editar!');

    PodeEntrarUsuario(AGrade, ATipo);

    GravarHoraAtual(IdChamado, StrToIntDef(ACodigoStatus,0), ATipo);

    TFuncoes.CriarFormularioModal(TfrmChamado.create(IdChamado, True, True, ATipo));
  end
  else
    raise Exception.Create('Usuário sem Permissão!');

end;

procedure TfrmQuadro.ValidarSolicitacao(var AGrade: TDBGrid;
  ADataSet: TDataSet);
var
  Formulario: TfrmStatusTroca;
  IdStatus: Integer;
  obj: TSolicitacaoController;
//  IdSolicitacao: Integer;
begin
  if ADataSet.RecordCount = 0 then
    raise Exception.Create('Não há Registro!');

    Formulario := TfrmStatusTroca.Create(prSolicitacao);
    try
      IdStatus := 0;
      if Formulario.ShowModal = mrOk then
        IdStatus := StrToIntDef(Formulario.edtIdStatus.Text,0);
    finally
      FreeAndNil(Formulario);
    end;

    if IdStatus > 0 then
    begin
      obj := TSolicitacaoController.Create;
      try
        obj.UpdateStatus(AGrade.Columns[0].Field.AsInteger, IdStatus);
      finally
        FreeAndNil(obj);
      end;
    end;


//  IdSolicitacao := ADataSet.FieldByName('Sol_Id').AsInteger;
//  if FControllerSolicitacao.PermissaoEditar(IdSolicitacao) then
//  begin
//    if (ADataSet.IsEmpty) then
//      raise Exception.Create('Não há Registro para Editar!');
//
//    PodeEntrarUsuarioSolicitacao(AGrade);
//    GravarHoraAtualSolicitacao(IdSolicitacao);
//    TFuncoes.CriarFormularioModal(TfrmSolicitacao.create(IdSolicitacao, True, True));
//  end
//  else
//    raise Exception.Create('Usuário sem Permissão!');
end;

end.
