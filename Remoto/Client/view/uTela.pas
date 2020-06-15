unit uTela;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDM, Vcl.Buttons,
  Vcl.ExtCtrls, uFormProcesso, System.Generics.Collections, ULicencaVO, uLicencaItensVO,
  Data.DBXJSON, DBXJSONReflect;

type
  TfrmTela = class(TForm)
    lblMensagem: TLabel;
    Panel1: TPanel;
    btnImportar: TBitBtn;
    btnSair: TBitBtn;
    rgTipo: TRadioGroup;
    rgUtilizacao: TRadioGroup;
    procedure btnSairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnImportarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ImportarFireBird(AUtilizadas: Integer);
    procedure ImportarClientes(AUtilizadas: Integer);
    procedure ImportarLicencas(AUtilizadas: Integer);
  public
    { Public declarations }
  end;

var
  frmTela: TfrmTela;

implementation

uses
  uLicencaController;

{$R *.dfm}

{ TfrmTela }

procedure TfrmTela.btnImportarClick(Sender: TObject);
begin
  try
    dm.AbrirConexao();
  except
    On E: Exception do
    begin
      raise Exception.Create('Abrir conex�o: ' + E.Message);
    end;
  end;

  btnImportar.Enabled := False;
  Screen.Cursor := crHourGlass;
  lblMensagem.Caption := 'Aguarde o t�rmino da importa��o...';
  Application.ProcessMessages;
  try
    try

      if rgTipo.ItemIndex = 0 then
        ImportarClientes(rgUtilizacao.ItemIndex);
      if rgTipo.ItemIndex = 1 then
        ImportarLicencas(rgUtilizacao.ItemIndex);
      if rgTipo.ItemIndex = 2 then
        ImportarFireBird(rgUtilizacao.ItemIndex);
    except
      on E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
    Application.Terminate;
  finally
    Screen.Cursor := crDefault;
    btnImportar.Enabled := True;
  end;
end;

procedure TfrmTela.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmTela.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Application.Terminate;
end;

procedure TfrmTela.ImportarClientes(AUtilizadas: Integer);
var
  obj: TLicencaController;
  FormularioProcesso: TfrmProcesso;
  listaItens :TObjectList<TLicencaItensVO>;
  listaCliente: TObjectList<TLicencaVO>;
  oLicencaJSON : TJSONValue;
  oLicencaItensJSON : TJSONValue;
  Marshal : TJSONMarshal;
  sResultado: string;
begin
  obj := TLicencaController.Create;
  FormularioProcesso := TfrmProcesso.Create(nil);
  Marshal := TJSONMarshal.Create;
  listaItens := TObjectList<TLicencaItensVO>.Create();
  try
    try
      listaCliente := obj.ImportarLicencaClientes(FormularioProcesso, AUtilizadas);

      oLicencaJSON := Marshal.Marshal(listaCliente);
      oLicencaItensJSON := Marshal.Marshal(listaItens);

      sResultado := obj.SalvarDados(oLicencaJSON, oLicencaItensJSON, FormularioProcesso);

      if sResultado <> '' then
        raise Exception.Create(sResultado);
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(listaCliente);
    FreeAndNil(listaItens);
    FreeAndNil(Marshal);
    FreeAndNil(FormularioProcesso);
  end;
end;

procedure TfrmTela.ImportarFireBird(AUtilizadas: Integer);
var
  obj: TLicencaController;
  FormularioProcesso: TfrmProcesso;
  listaItens :TObjectList<TLicencaItensVO>;
  listaCliente: TObjectList<TLicencaVO>;
  oLicencaJSON : TJSONValue;
  oLicencaItensJSON : TJSONValue;
  Marshal : TJSONMarshal;
  sResultado: string;
begin
  obj := TLicencaController.Create;
  FormularioProcesso := TfrmProcesso.Create(nil);
  Marshal := TJSONMarshal.Create;
  try
    try
      listaItens := obj.ImportarLicencaItens(FormularioProcesso, AUtilizadas);
      listaCliente := obj.ImportarLicencaClientes(FormularioProcesso, AUtilizadas);

      oLicencaJSON := Marshal.Marshal(listaCliente);
      oLicencaItensJSON := Marshal.Marshal(listaItens);

      sResultado := obj.SalvarDados(oLicencaJSON, oLicencaItensJSON, FormularioProcesso);
      if sResultado <> '' then
        raise Exception.Create(sResultado);

//      obj.Importar();
    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(listaCliente);
    FreeAndNil(listaItens);
    FreeAndNil(Marshal);
  end;
end;

procedure TfrmTela.ImportarLicencas(AUtilizadas: Integer);
var
  obj: TLicencaController;
  FormularioProcesso: TfrmProcesso;
  listaItens :TObjectList<TLicencaItensVO>;
  listaCliente: TObjectList<TLicencaVO>;
  oLicencaJSON : TJSONValue;
  oLicencaItensJSON : TJSONValue;
  Marshal : TJSONMarshal;
  sResultado: string;
begin
  listaCliente := TObjectList<TLicencaVO>.Create();
  obj := TLicencaController.Create;
  FormularioProcesso := TfrmProcesso.Create(nil);
  Marshal := TJSONMarshal.Create;
  try
    try
      listaItens := obj.ImportarLicencaItens(FormularioProcesso, AUtilizadas);

      oLicencaJSON := Marshal.Marshal(listaCliente);
      oLicencaItensJSON := Marshal.Marshal(listaItens);

      sResultado := obj.SalvarDados(oLicencaJSON, oLicencaItensJSON, FormularioProcesso);
      if sResultado <> '' then
        raise Exception.Create(sResultado);

    except
      On E: Exception do
      begin
        raise Exception.Create(E.Message);
      end;
    end;
  finally
    FreeAndNil(obj);
    FreeAndNil(listaCliente);
    FreeAndNil(listaItens);
    FreeAndNil(Marshal);
    FreeAndNil(FormularioProcesso);
  end;
end;

end.
