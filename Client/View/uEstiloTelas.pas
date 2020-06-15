unit uEstiloTelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uImagens, Vcl.Buttons,
  Vcl.ExtCtrls, uConfig, Vcl.Themes, Vcl.Styles;

type
  TfrmEstiloTelas = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Panel1: TPanel;
    btnSalvar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure ListarEstilos;
    procedure Carregar;
  public
    { Public declarations }
  end;

var
  frmEstiloTelas: TfrmEstiloTelas;

implementation

{$R *.dfm}

procedure TfrmEstiloTelas.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEstiloTelas.btnSalvarClick(Sender: TObject);
var
  config: TConfig;
begin
  config := TConfig.create;
  try
    config.Carregar();

    Config.EstiloTelas := ComboBox1.Text;
    config.Salvar();
  finally
    FreeAndNil(config);
  end;
  ShowMessage('Configuração Salva!');
end;

procedure TfrmEstiloTelas.Carregar;
var
  config: TConfig;
begin
  config := TConfig.create;
  try
    config.Carregar();
    ComboBox1.Text := config.EstiloTelas;
  finally
    FreeAndNil(config);
  end;
end;

procedure TfrmEstiloTelas.ComboBox1Change(Sender: TObject);
begin
//  TStyleManager.TrySetStyle(TComboBox(Sender).Text);
end;

procedure TfrmEstiloTelas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmEstiloTelas.FormCreate(Sender: TObject);
var
  Imagem: TfrmImagens;
begin
  Imagem := TfrmImagens.Create(Self);
  try
    btnSalvar.Glyph := Imagem.btnSalvar.Glyph;
    btnCancelar.Glyph := Imagem.btnCancelar.Glyph;
  finally
    FreeAndNil(Imagem);
  end;
end;

procedure TfrmEstiloTelas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    VK_ESCAPE: Close;
    VK_F8:
    begin
      btnSalvar.SetFocus;
      btnSalvarClick(Self);
    end;
  end;

end;

procedure TfrmEstiloTelas.FormShow(Sender: TObject);
begin
  ListarEstilos();
end;

procedure TfrmEstiloTelas.ListarEstilos;
begin
  ComboBox1.Items.Add('Windows');
  ComboBox1.Items.Add('Amakrits');
  ComboBox1.Items.Add('Amethyst Kamri');
  ComboBox1.Items.Add('Aqua Graphite');
  ComboBox1.Items.Add('Aqua Light Slate');
  ComboBox1.Items.Add('Auric');
  ComboBox1.Items.Add('Carbon');
  ComboBox1.Items.Add('Charcoal Dark Slate');
  ComboBox1.Items.Add('Cobalt XEMedia');
  ComboBox1.Items.Add('Cyan Dusk');
  ComboBox1.Items.Add('Cyan Night');
  ComboBox1.Items.Add('Emerald Light Slate');
  ComboBox1.Items.Add('Golden Graphite');
  ComboBox1.Items.Add('Iceberg Classico');
  ComboBox1.Items.Add('Lavender Classico');
  ComboBox1.Items.Add('Light');
  ComboBox1.Items.Add('Luna');
  ComboBox1.Items.Add('Metropolis UI Black');
  ComboBox1.Items.Add('Metropolis UI Blue');
  ComboBox1.Items.Add('Metropolis UI Dark');
  ComboBox1.Items.Add('Metropolis UI Green');
  ComboBox1.Items.Add('Obsidian');
  ComboBox1.Items.Add('Ruby Graphite');
  ComboBox1.Items.Add('Sapphire Kamri');
  ComboBox1.Items.Add('Silver');
  ComboBox1.Items.Add('Slate Classico');
  ComboBox1.Items.Add('Smokey Quartz Kamri');
  ComboBox1.Items.Add('Turquoise Gray');

  Carregar();
end;

end.
