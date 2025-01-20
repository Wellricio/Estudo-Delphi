program Project1;

uses
  Vcl.Forms,
  ControleDePonto in 'ControleDePonto.pas' {FormWa},
  RelatorioFolha in 'RelatorioFolha.pas' {Form2};

//Unit1 in 'Unit1.pas' {FormWa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  //Application.CreateForm(TFormWA, FormWa);
  Application.CreateForm(TWaPrincipal, WaPrincipal);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
