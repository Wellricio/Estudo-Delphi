unit ControleDePonto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Imaging.pngimage, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.UI, FireDAC.Stan.Param,
  FireDAC.Phys.SQLiteWrapper.Stat, Vcl.Menus, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.DatS, FireDAC.DApt.Intf, Data.Win.ADODB,
  Datasnap.Provider, Datasnap.DBClient, System.Hash, IdHashSHA, IdGlobal,
  Vcl.Samples.Spin, RLReport;
type
  TWaPrincipal = class(TForm)
    PanelNav: TPanel;
    LabelCadastrar: TLabel;
    LabelFuncionarios: TLabel;
    LabelSair: TLabel;
    Image1: TImage;
    LabelNome: TLabel;
    EditNomeFuncionario: TEdit;
    LabelCargo: TLabel;
    LabelSalario: TLabel;
    EditSalarioFuncionario: TEdit;
    ButtonCadastrar: TButton;
    PageControlNav: TPageControl;
    TabInicio: TTabSheet;
    TabFuncionarios: TTabSheet;
    TabCadastrarFuncionarios: TTabSheet;
    FormularioCadastroFuncionario: TPanel;
    PageControl1: TPageControl;
    TabFormularioLogin: TTabSheet;
    TabHome: TTabSheet;
    LabelUsuario: TLabel;
    EditUsuario: TEdit;
    LabelSenha: TLabel;
    EditSenha: TEdit;
    ButtonSend: TButton;
    LogoWaPng: TImage;
    PanelLogin: TPanel;
    Timer1: TTimer;
    PanelFerramentasFuncionarios: TPanel;
    LabelFiltrar: TLabel;
    EditFiltro: TEdit;
    ButtonFiltro: TButton;
    ButtonEditar: TButton;
    ButtonExcluir: TButton;
    ButtonFolha: TButton;
    LabelHorario: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    ButtonCadastrarAdmin: TButton;
    TabCadastro: TTabSheet;
    PanelCadastro: TPanel;
    LabelUsuarioCadastro: TLabel;
    LabelNomeCadastro: TLabel;
    Image3: TImage;
    EditUsuarioCadastro: TEdit;
    EditNomeCadastro: TEdit;
    ButtonCadastrarCadastro: TButton;
    LabelCargoCadastro: TLabel;
    EditSenhaCadastro: TEdit;
    LabelSenhaCadastro: TLabel;
    ComboBoxCargos: TComboBox;
    EditCargoCadastro: TEdit;
    ButtonVoltar: TButton;
    BoxCargoFuncionario: TComboBox;
    ADOQueryListaFuncionarios: TADOQuery;
    ADOQueryFolhaFuncionario: TADOQuery;
    DataSource2: TDataSource;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PanelFolhaDePonto: TPanel;
    ComboBoxMes: TComboBox;
    ComboBoxAno: TComboBox;
    PanelFiltro: TPanel;
    PanelFerramentasCrud: TPanel;
    Label5: TLabel;
    PanelCheck: TPanel;
    Label6: TLabel;
    EditIdCheckIn: TEdit;
    ButtonCheckIn: TButton;
    ADOQueryEntrada: TADOQuery;
    ADOQuerySaida: TADOQuery;
    DataSourceEntrada: TDataSource;
    DataSourceSaida: TDataSource;
    ADOQueryRegistrosPonto: TADOQuery;
    DataSourceRegistrosPonto: TDataSource;
    Image2: TImage;
    procedure LabelCadastrarClick(Sender: TObject);
    procedure LabelFuncionariosClick(Sender: TObject);
    procedure ButtonCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonSendClick(Sender: TObject);
    procedure LabelSairClick(Sender: TObject);
    procedure EditSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure EditSalarioFuncionarioKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ButtonCadastrarAdminClick(Sender: TObject);
    procedure ButtonCadastrarCadastroClick(Sender: TObject);
    procedure ComboBoxCargosChange(Sender: TObject);
    procedure ButtonVoltarClick(Sender: TObject);
    function BuscarSaltUsuario(Usuario: string): TBytes;
    function BuscarHashUsuario(Usuario: string): TBytes;
    function CadastrarFuncionarios(Nome: string; Cargo: string; Salario: Currency): string;
    function StringParaCurrency(const Texto: string): Currency;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure ButtonEditarClick(Sender: TObject);
    procedure ButtonFolhaClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    function ResgatarDeFuncionario(Funcionario: string): string;
    function AlimentarRegistrosPonto(FuncionarioId: Integer; TipoDeRegistro: string): string;
    //function BuscaRegistroPonto(FuncionarioId: Integer; Mes: Integer; Ano: Integer): string;
    //function BuscaRegistroPontoEntrada(FuncionarioId: Integer; Mes: Integer; Ano: Integer): string;
    //function BuscaRegistroPontoSaida(FuncionarioId: Integer; Mes: Integer; Ano: Integer): string;
    function CadastrarAdmnistrador(Nome: string; Cargo: string; CargoAlt: string; Usuario: string; Senha: TBytes; Salt: TBytes): string;
    procedure ButtonCheckInClick(Sender: TObject);
    procedure ButtonExcluirClick(Sender: TObject);
    procedure PageControlNavChange(Sender: TObject);
  private
    NomeSelecionado: string; //Variavel global que guarda um record da coluna Nome do DBGrid1
    IdSelecionado: Integer;  //Variavel global que guarda um record da coluna ID do DBGrid1
    Mes, Ano: Integer;
  public

  end;

var
  WaPrincipal: TWaPrincipal;

implementation

{$R *.dfm}

uses RelatorioFolha;

function GerarSalt(Comprimento: Integer): TBytes; //Funcao que gera o Salt recebendo o tamanho
var
  I: Integer;
begin
  SetLength(Result, Comprimento);
  for I := 0 to Comprimento - 1 do
    Result[I] := Random(256);  // Gera valores entre 0 e 256
end;

function GerarHash(Senha: string; Salt: TBytes): TBytes; //Funcao que gera o hash da senha concatenando senha e salt
var
  HashSHA2: THashSHA2;
  SenhaBytes: TBytes;
  Digest: TBytes;
begin
  // Converte a senha para bytes usando UTF-8
  SenhaBytes := TEncoding.UTF8.GetBytes(Senha);

  // Inicializa o hash SHA-256
  HashSHA2 := THashSHA2.Create(SHA256);

  // Alimenta o hash com o Salt e, em seguida, com os bytes da senha
  HashSHA2.Update(Salt);
  HashSHA2.Update(SenhaBytes);

  Digest := HashSHA2.HashAsBytes;
  // Obt�m o digest (resultado final)
  Result := Digest;
end;

function TWaPrincipal.BuscarSaltUsuario(Usuario: string): TBytes;  //Busca no DB o Salt do usuario
begin
  var ADOQuerySalt := TADOQuery.Create(nil);
  Result := nil;
  try
    ADOQuerySalt.Connection := ADOConnection1;
    ADOQuerySalt.SQL.Add('SELECT Salt FROM ADMINISTRADORES WHERE USUARIO = :Usuario');
    ADOQuerySalt.Parameters.ParamByName('Usuario').Value := Usuario;
    ADOQuerySalt.Open;

    if not ADOQuerySalt.IsEmpty then
    begin
      Result := ADOQuerySalt.FieldByName('Salt').AsBytes;
    end
    else
    begin
      ShowMessage('Usuario n�o encontrado!');
    end;
  finally
    ADOQuerySalt.Free;
  end;
end;

function TWaPrincipal.BuscarHashUsuario(Usuario: string): TBytes; //Busca no DB o Hash do Usuario
begin
  var ADOQueryHash := TADOQuery.Create(nil);
  Result := nil;
  try
    ADOQueryHash.Connection := ADOConnection1;
    ADOQueryHash.SQL.Add('SELECT SenhaHash FROM ADMINISTRADORES WHERE USUARIO = :Usuario');
    ADOQueryHash.Parameters.ParamByName('Usuario').Value := Usuario;
    ADOQueryHash.Open;

    if not ADOQueryHash.IsEmpty then
    begin
      Result := ADOQueryHash.FieldByName('SenhaHash').AsBytes;
    end
    else
    begin
      ShowMessage('Usuario n�o encontrado!');
    end;
  finally
    ADOQueryHash.Free;
  end;
end;

function TWaPrincipal.CadastrarFuncionarios(Nome: string; Cargo: string; Salario: Currency): string;
begin
  try
    ADOQuery1.Connection := ADOConnection1;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('INSERT INTO FUNCIONARIOS(Nome, Cargo, SalarioDia) VALUES(:Nome, :Cargo, :SalarioDia)');
    ADOQuery1.Parameters.ParamByName('Nome').Value := Nome;
    ADOQuery1.Parameters.ParamByName('Cargo').Value := Cargo;
    ADOQuery1.Parameters.ParamByName('SalarioDia').Value := Salario;
    ADOQuery1.ExecSQL;
    ShowMessage('Usuario cadastrado com sucesso!');
    Result := 'Sucesso';
  except
    on E: Exception do
      ShowMessage('Erro ao cadastrar funcionario: ' + E.Message);
  end;
end;

function TWaPrincipal.StringParaCurrency(const Texto: string): Currency;
begin
  if not TryStrToCurr(Texto, Result) then
    raise Exception.CreateFmt(' "%s" n�o � um valor monet�rio v�lido.', [Texto]);
end;

function TWaPrincipal.ResgatarDeFuncionario(Funcionario: string): string; //Resgata tudo da tabela FUNCIONARIOS de um funcionario expecifico
begin
  try
    ADOQueryFolhaFuncionario.Connection := ADOConnection1;
    ADOQueryFolhaFuncionario.Close;
    ADOQueryFolhaFuncionario.SQL.Clear;
    ADOQueryFolhaFuncionario.SQL.Add('SELECT * FROM FUNCIONARIOS WHERE Nome = :Funcionario');
    ADOQueryFolhaFuncionario.Parameters.ParamByName('Funcionario').Value := Funcionario;
    ADOQueryFolhaFuncionario.Open;
  except
    on E:Exception do
      ShowMessage('N�o foi possivel resgatar dados do funcionario, erro: ' + E.Message);
  end;
end;

function TWaPrincipal.AlimentarRegistrosPonto(FuncionarioId: Integer; TipoDeRegistro: string): string;
begin
  try
    ADOQuery1.Connection := ADOConnection1;
    ADOQuery1.SQL.Text :=
      'INSERT INTO RegistrosPonto (FuncionarioId, DataRegistro, HoraRegistro, TipoRegistro) '+
      'VALUES (:FuncionarioId,  CAST(GETDATE() AS DATE), CAST(GETDATE() AS TIME), :TipoDeRegistro) ';
    ADOQuery1.Parameters.ParamByName('FuncionarioId').Value := FuncionarioId;
    ADOQuery1.Parameters.ParamByName('TipoDeRegistro').Value := TipoDeRegistro;
    ADOQuery1.ExecSQL;

    ShowMessage('Ponto Registrado com sucesso! Tipo: ' + TipoDeRegistro);
  except
    on E:Exception do
      ShowMessage('Erro ao registrar ponto: ' + E.Message);
  end;
end;
{
function TWaPrincipal.BuscaRegistroPonto(FuncionarioId: Integer; Mes: Integer; Ano: Integer): string;
begin
  ADOQueryRegistrosPonto.Close;
  //A seguir veras a maior brutalidade cometida contra o SQL
  //Vou executar este codigo agora, quais sao as probabilidades disto funcionario? Volto ja e lhe conto se funcionou ou nao
  ADOQueryRegistrosPonto.SQL.Text :=
  'SELECT ' +
  'CASE ' +
  'WHEN TipoRegistro = ''Entrada'' THEN DataRegistro ' +
  'ELSE NULL ' +
  'END AS RegistroEntrada ' +
  'CASE ' +
  'WHEN TipoRegistro = ''Entrada'' THEN HoraRegistro ' +
  'ELSE NULL ' +
  'END AS HoraEntrada ' +
  'CASE ' +
  'WHEN TipoRegistro = ''Sa�da'' THEN HoraRegistro ' +
  'ELSE NULL ' +
  'END AS HoraSaida ' +
  'FROM RegistrosPonto ' +
  'WHERE FuncionarioId = :FuncionarioId ' +
  'AND MONTH(DataRegistro) = :Mes ' +
  'AND YEAR(DataRegistro) = :Ano ' +
  'AND (TipoRegistro = ''Entrada'' OR TipoRegistro = ''Sa�da'')';
  ADOQuery1.Parameters.ParamByName('FuncionarioId').Value := FuncionarioId;
  ADOQuery1.Parameters.ParamByName('Mes').Value := Mes;
  ADOQuery1.Parameters.ParamByName('Ano').Value := Ano;
  ADOQueryRegistrosPonto.Open;
end;

function TWaPrincipal.BuscaRegistroPontoEntrada(FuncionarioId: Integer; Mes: Integer; Ano: Integer): string;
begin
  ADOQueryEntrada.Close;
  ADOQueryEntrada.SQL.Text :=
    'SELECT HoraRegistro, DataRegistro ' +
    'FROM RegistrosPonto ' +
    'WHERE FuncionarioId = :FuncionarioId ' +
    'AND TipoRegistro = ''Entrada'' ' +
    'AND MONTH(DataRegistro) = :Mes ' +
    'AND YEAR(DataRegistro) = :Ano ' +
    'ORDER BY DataRegistro, HoraRegistro';
  ADOQueryEntrada.Parameters.ParamByName('FuncionarioId').Value := FuncionarioId;
  ADOQueryEntrada.Parameters.ParamByName('Mes').Value := Mes;
  ADOQueryEntrada.Parameters.ParamByName('Ano').Value := Ano;
  ADOQueryEntrada.Open;
end;

function TWaPrincipal.BuscaRegistroPontoSaida(FuncionarioId: Integer; Mes: Integer; Ano: Integer): string;
begin
  ADOQuerySaida.Close;
  ADOQuerySaida.SQL.Text :=
    'SELECT HoraRegistro, DataRegistro ' +
    'FROM RegistrosPonto ' +
    'WHERE FuncionarioId = :FuncionarioId ' +
    'AND TipoRegistro = ''Sa�da'' ' +
    'AND MONTH(DataRegistro) = :Mes ' +
    'AND YEAR(DataRegistro) = :Ano ' +
    'ORDER BY DataRegistro, HoraRegistro';
  ADOQuerySaida.Parameters.ParamByName('FuncionarioId').Value := FuncionarioId;
  ADOQuerySaida.Parameters.ParamByName('Mes').Value := Mes;
  ADOQuerySaida.Parameters.ParamByName('Ano').Value := Ano;
  ADOQuerySaida.Open;
end;
 }
function TWaPrincipal.CadastrarAdmnistrador(Nome: string; Cargo: string; CargoAlt: string; Usuario: string; Senha: TBytes; Salt: TBytes): string;
//Cadastra um usuario ADMINISTRADOR no banco de dados
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Add('INSERT INTO ADMINISTRADORES(NOME, CARGO, USUARIO, SenhaHash, Salt) VALUES(:Nome, :Cargo, :Usuario, :SenhaHash, :Salt)');
  ADOQuery1.Parameters.ParamByName('Nome').Value := Nome;

  if (Cargo = 'Outro') then  //Verifica o valor do parametro Cargo
    ADOQuery1.Parameters.ParamByName('Cargo').Value := CargoAlt  //se true o banco guarda CargoAlt em CARGO
  else
    ADOQuery1.Parameters.ParamByName('Cargo').Value := Cargo;

  ADOQuery1.Parameters.ParamByName('Usuario').Value := Usuario;
  ADOQuery1.Parameters.ParamByName('SenhaHash').Value := Senha;
  ADOQuery1.Parameters.ParamByName('Salt').Value := Salt;
  try
    ADOQuery1.ExecSQL;
    ShowMessage('Usuario cadastrado com sucesso!');
    ADOQuery1.Close;
  except
    on E: Exception do
      ShowMessage('Erro ao cadastrar funcionario: ' + E.Message);
  end;
end;

procedure TWaPrincipal.ButtonSendClick(Sender: TObject);   //Botao Login do Formulario de Login
var
  Usuario, Senha: string;
  Salt, SenhaHashBanco, HashGerado: TBytes;
begin
  Usuario := Trim(EditUsuario.Text);
  Senha := Trim(EditSenha.Text);

  if (Usuario = '') or (Senha = '') then
  begin
    ShowMessage('Por favor, preencha todos os campos');
    Exit;
  end;
  Salt := nil;
  Salt := BuscarSaltUsuario(Usuario);
  SenhaHashBanco := BuscarHashUsuario(Usuario);
  HashGerado := GerarHash(Senha, Salt);

  if (Length(HashGerado) = Length(SenhaHashBanco)) and //Compara primeiro o tamanho das array e depois o valor exato byte a byte das arrays na memoria
     CompareMem(@HashGerado[0], @SenhaHashBanco[0], Length(HashGerado)) then
  begin
    ShowMessage('Login realizado com sucesso!');
    PageControl1.ActivePage := TabHome;
    PageControlNav.ActivePage := TabInicio;
  end
  else
  begin
    ShowMessage('Usu�rio ou senha incorretos.');
    Exit;
  end;

end;

procedure TWaPrincipal.ButtonVoltarClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabFormularioLogin;
  EditUsuarioCadastro.Text := '';
  EditSenhaCadastro.Text := '';
  EditNomeCadastro.Text := '';
  ComboBoxCargos.Text := '';
  EditCargoCadastro.Text := '';

end;

procedure TWaPrincipal.ComboBoxCargosChange(Sender: TObject);
var Selecionado: string;
begin
  Selecionado := ComboBoxCargos.Text;
  if (Selecionado = 'Outro') then
    EditCargoCadastro.Visible := True
  else
    EditCargoCadastro.Visible := False;
end;

procedure TWaPrincipal.DBGrid1CellClick(Column: TColumn);
var
  NomeResgatado: string;
  IdResgatado: Integer;
begin
  //Seleciona e Resgata o record clicado na coluna Nome do DBGrid1
  if Column.FieldName = 'Nome' then
  begin
    NomeResgatado := DBGrid1.DataSource.DataSet.FieldByName('Nome').AsString;
    IdResgatado := DBGrid1.DataSource.DataSet.FieldByName('ID').AsInteger;
    NomeSelecionado := NomeResgatado;
    IdSelecionado := IdResgatado;
    EditIdCheckIn.Text := NomeResgatado;
  end;
end;

procedure TWaPrincipal.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  EspacoEntreLinhas: Integer;
  LinhaRect: TRect;
begin
  EspacoEntreLinhas := 0; // Define a margem (espa�o entre as linhas)

  // Ajusta o ret�ngulo da linha para criar o espa�o inferior
  LinhaRect := Rect;
  LinhaRect.Bottom := LinhaRect.Bottom - EspacoEntreLinhas;

  // Preenche o fundo da linha
  if Odd(DBGrid1.DataSource.DataSet.RecNo) then
    DBGrid1.Canvas.Brush.Color := clGradientInactiveCaption // Cor para linhas �mpares
  else
    DBGrid1.Canvas.Brush.Color := clWhite; // Cor para linhas pares
  DBGrid1.Canvas.FillRect(LinhaRect);

  // Desenha o texto da c�lula no ret�ngulo ajustado
  DBGrid1.DefaultDrawColumnCell(LinhaRect, DataCol, Column, State);
end;

//Detecta o Enter (ANSII 13) no EditSalario do Formulario de Cadastro Funcionario
procedure TWaPrincipal.EditSalarioFuncionarioKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      ButtonCadastrar.Click;
    end;
end;

//Detecta o Enter (ANSII 13) no EditSenha do Formulario de Login
procedure TWaPrincipal.EditSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      Key := #0;
      ButtonSend.Click;
    end;

end;

//Apaga Guias da PageControl1 + Conexao com o SGBD SQLite
procedure TWaPrincipal.FormCreate(Sender: TObject);
var i: Integer;
begin
  Randomize;

  //Esconde o Index dos PageControl
  for I := 0 to PageControl1.PageCount -1 do
    PageControl1.Pages[i].TabVisible := False;
  PageControl1.ActivePage := TabFormularioLogin;
  for I := 0 to PageControlNav.PageCount -1 do
    PageControlNav.Pages[i].TabVisible := False;
end;

procedure TWaPrincipal.Image1Click(Sender: TObject);
begin
  PageControlNav.ActivePage := TabInicio;
end;

//Cadastrar Funcionarios na aba Cadastrar Funcionarios da TabHome
procedure TWaPrincipal.ButtonCadastrarCadastroClick(Sender: TObject);
var
  Usuario, Nome, Cargo, Senha, CargoOutro: string;
  Salt, SenhaHash: TBytes;
begin
  Usuario := Trim(EditUsuarioCadastro.Text);
  Nome := EditNomeCadastro.Text;
  Cargo := ComboBoxCargos.Text;
  CargoOutro := EditCargoCadastro.Text;
  Senha := EditSenhaCadastro.Text;
  Salt := GerarSalt(16);
  SenhaHash := GerarHash(Senha, Salt); //Gera o hash da senha+salt

  CadastrarAdmnistrador(Nome, Cargo, CargoOutro, Usuario, SenhaHash, Salt);  //Cadastra o administrador

  EditUsuarioCadastro.Text := '';
  EditSenhaCadastro.Text := '';
  EditNomeCadastro.Text := '';
  ComboBoxCargos.Text := '';
  EditCargoCadastro.Text := '';
end;

procedure TWaPrincipal.ButtonCadastrarAdminClick(Sender: TObject);
begin
  PageControl1.ActivePage := TabCadastro;
end;

procedure TWaPrincipal.ButtonCadastrarClick(Sender: TObject);
var
  Nome, Cargo, TextoSalario: string;
  Salario: Currency;
begin
  try
    Nome := Trim(EditNomeFuncionario.Text);
    Cargo := BoxCargoFuncionario.Text;
    TextoSalario := Trim(EditSalarioFuncionario.Text);
    Salario := StringParaCurrency(TextoSalario); //Transforma a string capturada para currency (Foi a melhor solucao que encontrei para armazenar como decimal(x,2) no banco)

    CadastrarFuncionarios(Nome, Cargo, Salario); //Chama a funcao de cadastro passando os parametros a serem inseridos no DB
    //Limpa os campos apos o cadastro e da set focus no TabIndex0
    EditNomeFuncionario.Text := '';
    BoxCargoFuncionario.Text := '';
    EditSalarioFuncionario.Text := '';
    EditNomeFuncionario.SetFocus;
  finally
  end;
end;

procedure TWaPrincipal.ButtonCheckInClick(Sender: TObject);
var
  TotalRegistros: Integer;
  TipoDeRegistro: string;
begin
  TotalRegistros := 0;
  try
    ADOQuery1.SQL.Text :=
      'SELECT COUNT(*) AS TotalRegistros ' +
      'FROM RegistrosPonto ' +
      'WHERE FuncionarioId = :FuncionarioId AND DataRegistro = CAST(GETDATE() AS DATE)';
    ADOQuery1.Parameters.ParamByName('FuncionarioId').Value := IdSelecionado;
    ADOQuery1.Open;

    TotalRegistros := ADOQuery1.FieldByName('TotalRegistros').AsInteger;
  finally
    ADOQuery1.Close;
  end;

  if (TotalRegistros mod 2 = 0) then
    TipoDeRegistro := 'Entrada'
  else
    TipoDeRegistro := 'Sa�da';

  AlimentarRegistrosPonto(IdSelecionado, TipoDeRegistro);
end;

procedure TWaPrincipal.ButtonEditarClick(Sender: TObject);
var
  I: Integer;
  ReadOnlyState: Boolean;
begin
  // Use a segunda coluna (index 1) como refer�ncia para o estado de ReadOnly
  ReadOnlyState := DBGrid1.Columns[ 1].ReadOnly;
  // Alterna o estado de ReadOnly para todas as colunas
  for I := 0 to DBGrid1.Columns.Count - 1 do
  begin
    // Mant�m a coluna "ID" (index 0) como somente leitura
    if DBGrid1.Columns[I].FieldName = 'ID' then
      DBGrid1.Columns[I].ReadOnly := True
    else
      DBGrid1.Columns[I].ReadOnly := not ReadOnlyState; // Alterna o estado
  end;

  // Atualiza o texto do bot�o para indicar o estado atual
  if ReadOnlyState then
    ButtonEditar.Caption := 'Salvar'
  else
    ButtonEditar.Caption := 'Editar';
end;

procedure TWaPrincipal.ButtonExcluirClick(Sender: TObject);  //Botao para excluir um funcionario do banco utilizando como parametro a variavel global IdSelecionado
begin
  if MessageDlg('Voc� tem certeza que deseja apagar o funcionario?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes then
    begin
      try
        ADOQuery1.Close;
        ADOQuery1.SQL.Clear;
        ADOQuery1.SQL.Text := 'DELETE FROM FUNCIONARIOS WHERE ID = :FuncionarioId';
        ADOQuery1.Parameters.ParamByName('FuncionarioId').Value := IdSelecionado;
        ADOQuery1.ExecSQL;

        //Atualiza o DBGrid
        ADOQueryListaFuncionarios.Close;
        ADOQueryListaFuncionarios.Open;

        ShowMessage('Funcion�rio exclu�do com sucesso!');
      except
        on E: Exception do
          ShowMessage('N�o foi possivel apagar o funcionario, erro: ' + E.Message);
      end;
    end
  else
    ShowMessage('A��o cancelada!');
end;

procedure TWaPrincipal.ButtonFolhaClick(Sender: TObject); //Exibe os Registros de Ponto do funcionario desejado
var
  Mes, Ano: Integer;
  DadosFuncionario: string;
begin
  DadosFuncionario := ResgatarDeFuncionario(NomeSelecionado);

  if (ComboBoxMes.Text <> '') and (ComboBoxAno.Text <> '') then
    begin
      Mes := StrToInt(ComboBoxMes.Text);
      Ano := StrToInt(ComboBoxAno.Text);
      //fINALMENTE APRENDI DE UMA FORMA QUE FUNCIONAAAAAAAA
      //Faz o filtro de Mes e Ano do funcionario
      ADOQueryRegistrosPonto.Close;
      ADOQueryRegistrosPonto.SQL.Text :=
        'SELECT ' +
        '    CASE ' +
        '        WHEN TipoRegistro = ''Entrada'' THEN DataRegistro ' +
        '        ELSE NULL ' +
        '    END AS RegistroEntrada, ' +
        '    CASE ' +
        '        WHEN TipoRegistro = ''Entrada'' THEN HoraRegistro ' +
        '        ELSE NULL ' +
        '    END AS HoraEntrada, ' +
        '    CASE ' +
        '        WHEN TipoRegistro = ''Sa�da'' THEN HoraRegistro ' +
        '        ELSE NULL ' +
        '    END AS HoraSaida ' +
        'FROM RegistrosPonto ' +
        'WHERE FuncionarioId = :FuncionarioId ' +
        '  AND MONTH(DataRegistro) = :Mes ' +
        '  AND YEAR(DataRegistro) = :Ano ' +
        '  AND (TipoRegistro = ''Entrada'' OR TipoRegistro = ''Sa�da'')';
      ADOQueryRegistrosPonto.Parameters.ParamByName('FuncionarioId').Value := IdSelecionado;
      ADOQueryRegistrosPonto.Parameters.ParamByName('Mes').Value := Mes;
      ADOQueryRegistrosPonto.Parameters.ParamByName('Ano').Value := Ano;
      ADOQueryRegistrosPonto.Open;
      Form2.ReportFolhaPonto.Preview();
    end
  else
    begin
      ShowMessage('Preencha M�s e Ano para exibir os Registros de Ponto');
      Exit;
    end;
end;

//Abaixo: Eventos Click das Labels contidas no PanelNav
procedure TWaPrincipal.LabelCadastrarClick(Sender: TObject);
begin
  PageControlNav.ActivePage := TabCadastrarFuncionarios;
end;


//Carrega a tabela FUNCIONARIOS do db
procedure TWaPrincipal.LabelFuncionariosClick(Sender: TObject);
begin
  ADOQueryListaFuncionarios.Connection := ADOConnection1;
  ADOQueryListaFuncionarios.Close;
  ADOQueryListaFuncionarios.SQL.Add('SELECT * FROM FUNCIONARIOS');
  ADOQueryListaFuncionarios.Open;
  DataSource1.DataSet := ADOQueryListaFuncionarios;
  DBGrid1.DataSource := DataSource1;
  DBGrid1.DataSource.DataSet := ADOQueryListaFuncionarios;

  DBGrid1.Columns[1].ReadOnly := True;
  DBGrid1.Columns[2].ReadOnly := True;
  DBGrid1.Columns[3].ReadOnly := True;
  PageControlNav.ActivePage := TabFuncionarios;

end;

//Botao sair do PanelNav em TabHome
procedure TWaPrincipal.LabelSairClick(Sender: TObject);
begin
  EditUsuario.Text := '';
  EditSenha.Text := '';
  ShowMessage ('Voce Saiu!');
  PageControl1.ActivePage := TabFormularioLogin;
end;

procedure TWaPrincipal.PageControlNavChange(Sender: TObject);
begin
  if PageControlNav.ActivePage = TabInicio then
    Timer1.Interval := 1000
  else
    Timer1.Interval := 0;
end;

procedure TWaPrincipal.Timer1Timer(Sender: TObject);
begin
  LabelHorario.Caption := TimeToStr(Now);
end;

end.
