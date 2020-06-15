unit uImportarClientesController;

interface

uses
 Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls,  shellAPI, xmldom, XMLIntf,
  msxmldom, XMLDoc, uClienteVO, System.Generics.Collections, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.FileCtrl, uDM, uParametros,
  uCliente, uContatoVO, uCidadeVO, uFuncoesSIDomper, uClassValidacao,
  uClienteEmailVO, uProdutoVO, uUsuarioController, uRevendaController, uClienteController, uFormProcesso, uArquivosLog;

type
  TImportarClientesController = class
  private
    FArquivo: string;
    procedure LerArquivoXML();
    function ValidarArquivo(cliente: TClienteVO): Boolean;
    procedure CriarArquivoLogs(ListagemErros: TList<string>);
    procedure ExcluirArquivoXML;
    procedure GravarDados(ACliente: TClienteVO);
  public
    procedure ImportarXML(Formulario: TForm);
    procedure MostrarArquivoLogClientes();
  end;

implementation

uses
  uParametrosController, uClienteModuloVO;

{ TImportarClientesController }

procedure TImportarClientesController.CriarArquivoLogs(
  ListagemErros: TList<string>);
var
  Arq: Text;
  sCaminho: string;
  sArquivo: string;
  i: Integer;
begin
  sCaminho := ExtractFilePath(FArquivo);
  sArquivo := ExtractFileName(FArquivo);
  sArquivo := Copy(sArquivo, 1, Length(sArquivo) -3);
  sArquivo := sArquivo + 'log';

  if DirectoryExists(sCaminho) then
  begin
    try
      AssignFile(Arq, sCaminho + '\' + sArquivo);
      Rewrite(Arq);

      for I := 0 to ListagemErros.count -1 do
        Writeln(Arq, ListagemErros[i]);
    finally
      CloseFile(Arq);
    end;
  end;
end;

procedure TImportarClientesController.ExcluirArquivoXML;
begin
  if FileExists(FArquivo) then
    DeleteFile(FArquivo);
end;

procedure TImportarClientesController.GravarDados(ACliente: TClienteVO);
var
  ClienteController: TClienteController;
begin
  ClienteController := TClienteController.Create;
  try
    ClienteController.ImportarXML(ACliente);
  finally
    FreeAndNil(ClienteController);
  end;
end;

procedure TImportarClientesController.ImportarXML(Formulario: TForm);
var
  Lista: TFileListBox;
  I: Integer;
  sDiretorio: string;
  Parametro: TParametrosController;
  Arq: TextFile;
  FormularioProcesso: TfrmProcesso;
  iCount: Integer;
//  F: TFuncoes;
//  sLista: TStringList;
begin
  Parametro := TParametrosController.Create;
  try
    sDiretorio := Parametro.BuscarCaminhoImportacaoXML();
  finally
    FreeAndNil(Parametro);
  end;

  if not DirectoryExists(sDiretorio) then
  begin
    ShowMessage('Diret�rio n�o encontrado!');
    Exit;
  end;

  if TFuncoes.Confirmar('Confirmar Importa��o de Clientes!') = False then
    Exit;

  FormularioProcesso := TfrmProcesso.Create(nil);
  Lista := TFileListBox.Create(nil);
  try
    try
      Lista.Parent := Formulario;
      Lista.Mask := '*.XML';
      Lista.Directory := sDiretorio;
      iCount := Lista.Count;
      for I := 0 to iCount-1 do
      begin
        FArquivo := sDiretorio + '\' +  Lista.Items[i];
        LerArquivoXML();
        FormularioProcesso.Mensagem('Importando clientes... ' + IntToStr(I) + ' de ' + IntToStr(iCount));
      end;
    except
      on E: Exception do
      begin
        AssignFile(Arq, sDiretorio + '\Erro.txt');
        Rewrite(Arq);
        Writeln(Arq, 'Arq: ' + Lista.Items[i] + ' - ' + E.Message);
        CloseFile(Arq);
      end;
    end;
    ShowMessage('Fim da importa��o de clientes!');
  finally
    FreeAndNil(FormularioProcesso);
    FreeAndNil(Lista);
  end;
end;

procedure TImportarClientesController.LerArquivoXML;
var
  XMLDoc: IXMLDocument;
  nCliente,
  nPrincipal,
  nEmail,
  nModulo,
  nContato: IXMLNode;

  iContador,
  iCodigoProduto,
  iCodigoModulo: Integer;

  sEmail: string;
  sDocumento: string;
  sEnquadramento: string;

  ClienteEmailVO: TClienteEmailVO;
  Modulo: TClienteModuloVO;
  objEmail: TEmailVO;
  Cliente: TClienteVO;
  Contato: TContatoVO;
  sDiretorio: string;
  sArquivoXML: string;
  sArquivoLog: string;
  iPosicao: Integer;
  i: Integer;
  sNomeContato: string;
  bAchouEmail: Boolean;
  iCount: Integer;
begin
  if not (FileExists(FArquivo)) then
    Exit;

  sDiretorio := ExtractFilePath(FArquivo);
  sArquivoXML := ExtractFileName(FArquivo);

  iPosicao := Pos('.', sArquivoXML);
  sArquivoLog := Copy(sArquivoXML, 1, iPosicao) + 'log';

  if FileExists(sDiretorio + sArquivoLog) then
    Exit;

  XMLDoc := TXMLDocument.Create(nil);
  XMLDoc.Active := True;
  XMLDoc.LoadFromFile(FArquivo);
//==============================================================================
// dados do cliente
//==============================================================================
  Cliente := TClienteVO.Create;
  try
    nPrincipal := XMLDoc.DocumentElement.ChildNodes.FindNode('Principal');

    sDocumento := nPrincipal.ChildNodes['CNPJ'].Text;
    if sDocumento = '' then
      sDocumento := nPrincipal.ChildNodes['CPF'].Text;

    sEnquadramento := nPrincipal.ChildNodes['Enquadramento'].Text;

    if (sEnquadramento <> '01') and (sEnquadramento <> '02') and (sEnquadramento <> '03') then
      sEnquadramento := '00';

    Cliente.Codigo              := StrToIntDef(nPrincipal.ChildNodes['Codigo'].Text, 0);
    Cliente.RazaoSocial         := nPrincipal.ChildNodes['Razao'].Text;
    Cliente.NomeFantasia        := nPrincipal.ChildNodes['Fantasia'].Text;
    Cliente.CNPJ                := sDocumento;
    Cliente.Enquadramento       := sEnquadramento;
    Cliente.Rua                 := nPrincipal.ChildNodes['Rua'].Text;
    Cliente.Bairro              := nPrincipal.ChildNodes['Bairro'].Text;
    Cliente.CEP                 := nPrincipal.ChildNodes['CEP'].Text;
    Cliente.Cidade              := nPrincipal.ChildNodes['Cidade'].Text;
    Cliente.Telefone            := nPrincipal.ChildNodes['Telefone'].Text;
    Cliente.ContatoFinanceiro   := nPrincipal.ChildNodes['Contato_Financeiro'].Text;
    Cliente.ContatoCompraVenda  := nPrincipal.ChildNodes['Contato_Compra_Venda'].Text;
    Cliente.Usuario             := StrToIntDef(nPrincipal.ChildNodes['Consultor'].Text,0);
    Cliente.Revenda             := StrToIntDef(nPrincipal.ChildNodes['Revenda'].Text,0);
    Cliente.PendenciaFinanceira := nPrincipal.ChildNodes['Pendencia_Fin'].Text;
    Cliente.Situacao            := nPrincipal.ChildNodes['Situacao'].Text;
//==============================================================================
// Novos campos

    Cliente.Logradouro            := Cliente.Rua;
    Cliente.Fone1                 := nPrincipal.ChildNodes['Fone1'].Text;
    Cliente.Fone2                 := nPrincipal.ChildNodes['Fone2'].Text;
    Cliente.Celular               := nPrincipal.ChildNodes['Celular'].Text;
    Cliente.OutroTelefone         := nPrincipal.ChildNodes['OutroFone'].Text;
    Cliente.ContatoFinanceiroFone := nPrincipal.ChildNodes['Contato_Financeiro_Fone'].Text;
    Cliente.ContatoCompraVendaFone:= nPrincipal.ChildNodes['Contato_Compra_Venda_Fone'].Text;
    Cliente.IE                    := nPrincipal.ChildNodes['IE'].Text;
    Cliente.RepresentanteLegal    := nPrincipal.ChildNodes['Representante_Legal'].Text;
    Cliente.RepresentanteLegalCPF := nPrincipal.ChildNodes['Representante_Legal_CPF'].Text;
    Cliente.EmpresaVinculada      := StrToIntDef(nPrincipal.ChildNodes['Empresa_Vinculada'].Text, 0);
    Cliente.Perfil                := nPrincipal.ChildNodes['Perfil'].Text;
//==============================================================================
// dados da cidade

    Cliente.CidadeVO.Codigo := StrToIntDef(nPrincipal.ChildNodes['Codigo_IBGE'].Text,0);
    Cliente.CidadeVO.Nome   := nPrincipal.ChildNodes['Nome_Cidade'].Text;
    Cliente.CidadeVO.UF     := nPrincipal.ChildNodes['UF'].Text;
    Cliente.CidadeVO.Ativo  := true;
//==============================================================================
// dados dos emails

    nEmail := XMLDoc.DocumentElement.ChildNodes.FindNode('Registro_EMail');
    if nEmail <> nil then
    begin
      iContador := 0;
      nEmail.ChildNodes.First;
      repeat
        if iContador = 0 then
          sEmail :=  nEmail.ChildNodes['Email'].Text
        else
          sEmail :=  nEmail.ChildNodes['Email' + iContador.ToString].Text;

        if trim(sEmail) <> '' then
        begin
          ClienteEmailVO := TClienteEmailVO.Create;
          ClienteEmailVO.Id         := 0;
          ClienteEmailVO.IdCliente  := Cliente.Id;
          ClienteEmailVO.Email      := sEmail;
          ClienteEmailVO.Notificar  := True;

          if not Cliente.ClienteEmail.Contains(ClienteEmailVO) then
            Cliente.ClienteEmail.Add(ClienteEmailVO);
        end;

        if (Trim(sEmail) = '') and (iContador > 1) then
          Break;

        if iContador >= 200 then
          break;

        inc(iContador);
//        nEmail := nEmail.NextSibling;
      until nEmail = nil;
    end;
//==============================================================================
// dados dos M�dulos e Produtos

    nModulo := XMLDoc.DocumentElement.ChildNodes.FindNode('Registro_Modulo');
    if nModulo <> nil then
    begin
//      ListaModulo := TObjectList<TModuloVO>.Create();
      iContador := 1;
      nModulo.ChildNodes.First;
      repeat
        iCodigoModulo  := StrToIntDef(nModulo.ChildNodes['Cod_Grupo' + iContador.ToString].Text,0);
        iCodigoProduto := StrToIntDef(nModulo.ChildNodes['Cod_Produto' + iContador.ToString].Text,0);

        if (iCodigoModulo = 0) then
          Break;

        if iContador > 200 then
          Break;

        Modulo := TClienteModuloVO.Create;
        Modulo.Modulo.Codigo  := iCodigoModulo;
        Modulo.Produto.Codigo := iCodigoProduto;
        Modulo.Modulo.Nome    := nModulo.ChildNodes['Nome_Grupo' + iContador.ToString].Text;
        Modulo.Produto.Nome   := nModulo.ChildNodes['Nome_Produto' + iContador.ToString].Text;
        Cliente.ClienteModulo.Add(Modulo);
//        ListaModulo.Add(Modulo);

        Inc(iContador);
//        nModulo := nModulo.NextSibling;
      until nModulo = nil;
    end;

//==============================================================================
// Contatos

    nContato := XMLDoc.DocumentElement.ChildNodes.FindNode('Registro_Contato');
    if nContato <> nil then
    begin
      iContador := 1;
      nContato.ChildNodes.First;
      repeat

        if iContador > 200 then
          Break;

        sNomeContato := nContato.ChildNodes['Contato_Nome' + iContador.ToString].Text;
        if Trim(sNomeContato) = '' then
          Break;

        Contato := TContatoVO.Create;
        Contato.Nome          := nContato.ChildNodes['Contato_Nome' + iContador.ToString].Text;
        Contato.Fone1         := nContato.ChildNodes['Contato_Fone1' + iContador.ToString].Text;
        Contato.Fone2         := nContato.ChildNodes['Contato_Fone2' + iContador.ToString].Text;
        Contato.Departamento  := nContato.ChildNodes['Contato_Depto' + iContador.ToString].Text;
        Contato.Email         := nContato.ChildNodes['Contato_Email' + iContador.ToString].Text;

        Cliente.ListaContatoVO.Add(Contato);
        Inc(iContador);

      until nContato = nil;
    end;

//==============================================================================
// Validar e gravar dados

    if ValidarArquivo(Cliente) then
      GravarDados(Cliente);
  finally
    if Cliente <> nil then
      FreeAndNil(Cliente);

//    if ListaModulo <> nil then
//      FreeAndNil(ListaModulo);
  end;
end;

procedure TImportarClientesController.MostrarArquivoLogClientes;
var
  Formulario: TfrmArquivosLog;
  iQtdeArquivos: Integer;
  Usuario: TUsuarioController;
  Adm: Boolean;
begin
  Usuario := TUsuarioController.Create;
  try
    Usuario.LocalizarId(DM.IdUsuario);
    Adm := Usuario.Model.CDSCadastroUsu_Adm.AsBoolean;
  finally
    FreeAndNil(Usuario);
  end;

  if Adm then
  begin
    Formulario := TfrmArquivosLog.Create(nil);
    try
      try
        iQtdeArquivos := Formulario.QuantidadeArquivos;
        if iQtdeArquivos > 0 then
          Formulario.ShowModal;
      except
        // nada
      end;
    finally
      FreeAndNil(Formulario);
    end;
  end;
end;

function TImportarClientesController.ValidarArquivo(cliente: TClienteVO): Boolean;
var
  ListaErros: TList<string>;
  i: Integer;
  Id: Integer;
  sDocumento: string;
  UsuarioController: TUsuarioController;
  RevendaController: TRevendaController;
begin

  ListaErros := TList<string>.Create;
  UsuarioController := TUsuarioController.Create;
  RevendaController := TRevendaController.Create;

  try
    if Cliente.Codigo = 0 then
      ListaErros.Add('C�digo Cliente......: - N�o Informado');

    if Cliente.RazaoSocial.Trim() = '' then
      ListaErros.Add('Raz�o Social........: - N�o Informado');

    if Cliente.CNPJ.Trim() = '' then
      ListaErros.Add('CNPJ/CPF............: - N�o Informado');

    if Cliente.Usuario > 0 then
    begin
      try
        UsuarioController.LocalizarCodigo(Cliente.Usuario, False);
        Id := UsuarioController.Model.CDSCadastroUsu_Id.AsInteger;
        if Id <= 0 then
          ListaErros.Add('Usu�rio.............: - N�o Cadastrado');
      except
        on E: Exception do
        begin
          ListaErros.Add('Usu�rio: ' + E.Message);
        end;
      end;
    end;

    if Cliente.Revenda = 0 then
      ListaErros.Add('Revenda.............: - N�o Informado')
    else begin
      try
        RevendaController.LocalizarCodigo(Cliente.Revenda, False);
        Id := RevendaController.Model.CDSCadastroRev_Id.AsInteger;
        if Id = 0 then
          ListaErros.Add('Revenda.............: - N�o Cadastrada');
      except
        on E: Exception do
        begin
          ListaErros.Add(E.Message);
        end;
      end;
    end;

    if Cliente.PendenciaFinanceira.Trim() = '' then
      ListaErros.Add('Pend�ncia Financeira: - N�o Informado');

    if Cliente.Situacao.Trim() = '' then
      ListaErros.Add('Situa��o............: - N�o Informado');

    sDocumento := TFuncoes.SomenteNumeros(cliente.CNPJ);
    if Length(sDocumento) > 0 then
    begin
      try
        if Length(sDocumento) = 11 then
          TValidacao.ValidaCPF(sDocumento)
        else
          TValidacao.ValidaCNPJ(sDocumento);
      except
        ON E: Exception do
        begin
          ListaErros.Add('CNPJ/CPF............: - Inv�lido');
        end;
      end;
    end;

    Result := True;

    if ListaErros.Count > 0 then
    begin
      CriarArquivoLogs(ListaErros);
      Result := False;
    end
    else
      ExcluirArquivoXML();

  finally
    FreeAndNil(ListaErros);
    FreeAndNil(UsuarioController);
    FreeAndNil(RevendaController);
  end;
end;

end.
