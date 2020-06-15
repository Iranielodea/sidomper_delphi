program Servidor;

uses
  Vcl.Forms,
  uServidor in 'uServidor.pas' {frmServidor},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDSServerModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule},
  uKeyField in '..\..\Comum\DAO\uKeyField.pas',
  uTableName in '..\..\Comum\DAO\uTableName.pas',
  uGenericDAO in 'Negocio\uGenericDAO.pas',
  uDM in 'uDM.pas' {DM: TDataModule},
  uConfig in '..\Comum\uConfig.pas',
  ULicencaVO in '..\Comum\ULicencaVO.pas',
  ULicenca in 'Negocio\ULicenca.pas',
  uLicencaItensVO in '..\Comum\uLicencaItensVO.pas',
  uFireDAC in 'Negocio\uFireDAC.pas',
  uConverter in '..\Comum\uConverter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmServidor, frmServidor);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.CreateForm(TServerMethods1, ServerMethods1);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

