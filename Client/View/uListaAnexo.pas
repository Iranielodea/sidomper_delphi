unit uListaAnexo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmListaAnexo = class(TForm)
    PageControl1: TPageControl;
    tsChamado: TTabSheet;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmListaAnexo: TfrmListaAnexo;

implementation

{$R *.dfm}

end.
