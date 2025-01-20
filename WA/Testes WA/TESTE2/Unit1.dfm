object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 907
  ClientWidth = 973
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object DBGrid1: TDBGrid
      Left = 72
      Top = 120
      Width = 641
      Height = 393
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -13
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
    end
    object RLLabel1: TRLLabel
      Left = 240
      Top = 57
      Width = 297
      Height = 57
    end
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=NewWaDb;Data Source=DESKTO' +
      'P-8HN5C9H;Initial File Name="";Server SPN="";Authentication="";A' +
      'ccess Token=""'
    Provider = 'MSOLEDBSQL.1'
    Left = 888
    Top = 96
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM FUNCIONARIOS')
    Left = 848
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 864
    Top = 400
  end
end
