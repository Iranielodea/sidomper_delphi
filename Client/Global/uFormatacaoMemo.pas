unit uFormatacaoMemo;

interface

uses
  Vcl.ComCtrls, System.UITypes, Vcl.Graphics, System.SysUtils, Data.DB,
  Vcl.Forms, System.Classes;

type
  TFormatacao = class
  public
    class procedure EstiloNegrito(var Editor: TRichEdit);
    class procedure EstiloSublinhado(var Editor: TRichEdit);
    class procedure EstiloItalico(var Editor: TRichEdit);
    class procedure EstiloRiscado(var Editor: TRichEdit);
    class procedure AlinhamentoEsquerdo(var Editor: TRichEdit);
    class procedure AlinhamentoDireito(var Editor: TRichEdit);
    class procedure AlinhamentoCentro(var Editor: TRichEdit);

    class procedure SalvarMemo(var Editor: TRichEdit; Campo: TMemoField); overload;
    class procedure SalvarMemo(var Editor: TRichEdit); overload;

    class procedure CarregarMemo(var Editor: TRichEdit; Campo: TMemoField); overload;
    class procedure CarregarMemo(var Editor: TRichEdit); overload;
  end;

implementation

uses
  Vcl.Dialogs;

{ TFormatacao }

class procedure TFormatacao.AlinhamentoCentro(var Editor: TRichEdit);
begin
  Editor.Paragraph.Alignment := taCenter;
end;

class procedure TFormatacao.AlinhamentoDireito(var Editor: TRichEdit);
begin
  Editor.Paragraph.Alignment := taRightJustify;
end;

class procedure TFormatacao.AlinhamentoEsquerdo(var Editor: TRichEdit);
begin
  Editor.Paragraph.Alignment := taLeftJustify;
end;

class procedure TFormatacao.CarregarMemo(var Editor: TRichEdit);
var
  TmpFile: string;
begin
  try
    TmpFile := ExtractFilePath(Application.ExeName) + 'tmpF.000';
    Editor.Lines.LoadFromFile(TmpFile);
    DeleteFile(TmpFile);
  except
    On E: Exception do
      ShowMessage(E.Message + ' - ' + E.ClassName);
  end;
end;

class procedure TFormatacao.CarregarMemo(var Editor: TRichEdit;
  Campo: TMemoField);
var
  TmpFile: string;
begin
  try
    TmpFile := ExtractFilePath(Application.ExeName) + 'tmpF.000';
    TBlobField(Campo).SaveToFile(TmpFile);
    Editor.Lines.LoadFromFile(TmpFile);
    DeleteFile(TmpFile);
  except
    On E: Exception do
      ShowMessage(E.Message + ' - ' + E.ClassName);
  end;
end;

class procedure TFormatacao.EstiloItalico(var Editor: TRichEdit);
begin
  with Editor.SelAttributes do
  begin
    if not (fsItalic in Style) then
      Style:=Style+[fsItalic]
    else
      Style:=Style-[fsItalic];
  end;
end;

class procedure TFormatacao.EstiloNegrito(var Editor: TRichEdit);
begin
  with Editor.SelAttributes do
  begin
    if not (fsBold in Style) then
      Style:=Style+[fsBold]
    else
      Style:=Style-[fsBold];
  end;
end;

class procedure TFormatacao.EstiloRiscado(var Editor: TRichEdit);
begin
  with Editor.SelAttributes do
  begin
    if not (fsStrikeOut in Style) then
      Style:=Style+[fsStrikeOut]
    else
      Style:=Style-[fsStrikeOut];
  end;
end;

class procedure TFormatacao.EstiloSublinhado(var Editor: TRichEdit);
begin
  with Editor.SelAttributes do
  begin
    if not (fsUnderline in Style) then
      Style:=Style+[fsUnderline]
    else
      Style:=Style-[fsUnderline];
  end;
end;

class procedure TFormatacao.SalvarMemo(var Editor: TRichEdit);
var
  TmpFile: string;
begin
  try
    TmpFile := ExtractFilePath(Application.ExeName) + 'tmpF.000';
    Editor.Lines.SaveToFile(TmpFile);
  except
    On E: Exception do
      ShowMessage(E.Message + ' - ' + E.ClassName);
  end;
end;

class procedure TFormatacao.SalvarMemo(var Editor: TRichEdit;
  Campo: TMemoField);
var
  TmpFile: string;
begin
  try
    TmpFile := ExtractFilePath(Application.ExeName) + 'tmpF.000';
    Editor.Lines.SaveToFile(TmpFile);

    TBlobField(Campo).LoadFromFile(TmpFile);
    DeleteFile(TmpFile);
  except
    On E: Exception do
      ShowMessage(E.Message + ' - ' + E.ClassName);
  end;
end;

end.
