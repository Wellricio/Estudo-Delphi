unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, IdHashSHA, IdHash, FireDAC.DApt;

type
  TFormWA = class(TForm)
    Image1: TImage;
    EditUsuario: TEdit;
    LabelUsuario: TLabel;
    EditSenha: TEdit;
    LabelSenha: TLabel;
    ButtonSend: TButton;
    FDConnection1: TFDConnection;
    procedure FormCreate(Sender: TObject);
    procedure ButtonSendClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormWA: TFormWA;

implementation

{$R *.dfm}

//Form Create com Conexao SQLite
procedure TFormWA.FormCreate(Sender: TObject);
begin
  FDConnection1.Params.DriverID := 'SQLite';
  FDConnection1.Params.Database := 'C:\Program Files (x86)\DB Browser for SQLite\WA\waDB.db';
  try
    FDConnection1.Connected := True;
    ShowMessage('Conexão com o banco de dados bem-sucedida!');
  except
    on E: Exception do ShowMessage('Erro ao conectar com o banco de dados: ' + E.Message);
  end;
end;

//botao login do formulario de cadastro
procedure TFormWA.ButtonSendClick(Sender: TObject);
var
  Usuario, Senha, SenhaDB: string;
  FDQuery: TFDQuery;
begin
  Usuario := EditUsuario.Text;
  Senha := EditSenha.Text;

  // Verificar se os campos do formulario de cadastro não estão vazios
  if (Usuario = '') or (Senha = '') then
  begin
    ShowMessage('Por favor, preencha todos os campos.');
    Exit;
  end;

  // Verificacao de usuario e senha
  FDQuery := TFDQuery.Create(nil);  // Cria e configura o componente TFDQuery para a operação de seleção
  try
    FDQuery.Connection := FDConnection1;
    FDQuery.SQL.Text := 'SELECT SENHAHASH FROM ADMINISTRADORES WHERE USUARIO = :Usuario';
    FDQuery.Params.ParamByName('Usuario').AsString := Usuario;
    FDQuery.Open;

    if not FDQuery.Eof then // Verifica se encontrou o usuário
    begin
      SenhaDB := FDQuery.FieldByName('SENHAHASH').AsString;

      //Verifica a senha
      if Senha = SenhaDB then
        ShowMessage('Login bem-Sucedido!')
      else
        ShowMessage('Senha Incorreta');
    end
    else
      ShowMessage('Usuario nao encontrado');
  finally
    FDQuery.Free;
  end;
end;



end.
