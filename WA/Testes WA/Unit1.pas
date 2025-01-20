unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    ButtonSend: TButton;
    EditCargo: TEdit;
    EditNome: TEdit;
    LabelSenha: TLabel;
    LabelUsuario: TLabel;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Panel3: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Edit3: TEdit;
    Label5: TLabel;
    Button1: TButton;
    Label6: TLabel;
    procedure PageControl1Change(Sender: TObject);
    procedure ButtonSendClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ButtonSendClick(Sender: TObject);
var i: Integer;
begin
  ShowMessage ('Login efetuado com Sucesso!');
  PageControl1.ActivePage := TabSheet2;

  for I := 0 to PageControl1.PageCount -1 do
    PageControl2.Pages[i].TabVisible := False;
  PageControl2.ActivePage := PageControl2.Pages[0]
end;

procedure TForm1.FormCreate(Sender: TObject);
var i: Integer;
begin
  for I := 0 to PageControl1.PageCount -1 do
    PageControl1.Pages[i].TabVisible := False;
  PageControl1.ActivePage := PageControl1.Pages[0]
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  PageControl2.ActivePage := TabSheet3;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  PageControl2.ActivePage := TabSheet4;
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
  PageControl1.ActivePage := TabSheet1;
  ShowMessage ('Voce saiu!');
end;

procedure TForm1.PageControl1Change(Sender: TObject);
var i: Integer;
begin
  for I := 0 to PageControl1.PageCount -1 do
    PageControl1.Pages[i].TabVisible := False;
  PageControl1.ActivePage := PageControl1.Pages[0]
end;

end.
