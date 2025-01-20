object Form2: TForm2
  Left = -1320
  Top = 222
  Anchors = [akLeft, akTop, akRight, akBottom]
  Caption = 'Form2'
  ClientHeight = 1061
  ClientWidth = 1159
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  TextHeight = 15
  object ReportFolhaPonto: TRLReport
    Left = 8
    Top = -48
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = False
    DataSource = WaPrincipal.DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBandHeader: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 123
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = True
      Borders.DrawTop = True
      Borders.DrawRight = True
      Borders.DrawBottom = True
      object RLPanelWa: TRLPanel
        AlignWithMargins = True
        Left = 419
        Top = 10
        Width = 289
        Height = 110
        object RLLabel1: TRLLabel
          Left = 3
          Top = 3
          Width = 282
          Height = 16
          Caption = 'WA EMPREITEIRA GESSO E CONSTRU'#199#213'ES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel2: TRLLabel
          Left = 65
          Top = 47
          Width = 159
          Height = 16
          Caption = 'CNPJ: 42.584.104/0001-30'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 81
          Top = 69
          Width = 126
          Height = 16
          Caption = 'Tel.: (16) 98116-9727'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 76
          Top = 91
          Width = 136
          Height = 16
          Caption = 'osilvawa@hotmail.com'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 10
          Top = 25
          Width = 269
          Height = 16
          Caption = 'Rua Ademir Spagnol Miluzzi, 946 - 14079-402'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLPanel1: TRLPanel
        Left = 3
        Top = 13
        Width = 279
        Height = 104
        object RLDBText1: TRLDBText
          Left = 3
          Top = 22
          Width = 80
          Height = 16
          DataField = 'Nome'
          DataSource = WaPrincipal.DataSource2
          Text = 'Nome: '
        end
        object RLDBText2: TRLDBText
          Left = 3
          Top = 44
          Width = 80
          Height = 16
          DataField = 'Cargo'
          DataSource = WaPrincipal.DataSource2
          Text = 'Cargo: '
        end
        object RLDBText3: TRLDBText
          Left = 3
          Top = 66
          Width = 178
          Height = 16
          DataField = 'Data'
          DataSource = WaPrincipal.DataSource2
          Text = 'Data e hora de cadastro: '
        end
        object RLDBText4: TRLDBText
          Left = 3
          Top = 88
          Width = 146
          Height = 16
          DataField = 'SalarioDia'
          DataSource = WaPrincipal.DataSource2
          Text = 'Diaria em R$: '
        end
        object RLLabel6: TRLLabel
          Left = 3
          Top = 3
          Width = 167
          Height = 16
          Caption = 'DADOS DO FUNCION'#193'RIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLDraw2: TRLDraw
        Left = 344
        Top = 0
        Width = 25
        Height = 127
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Angle = 90.000000000000000000
        Borders.Width = 2
        DrawKind = dkLine
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 161
      Width = 718
      Height = 40
      BandType = btTitle
      object RLLabel7: TRLLabel
        Left = 285
        Top = 10
        Width = 148
        Height = 19
        Align = faCenter
        Alignment = taCenter
        Caption = 'FOLHA DE PONTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 201
      Width = 718
      Height = 632
      object RLLabel8: TRLLabel
        Left = 16
        Top = 6
        Width = 39
        Height = 16
        Caption = 'DATA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 192
        Top = 6
        Width = 65
        Height = 16
        Caption = 'ENTRADA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel10: TRLLabel
        Left = 376
        Top = 6
        Width = 44
        Height = 16
        Caption = 'SAIDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText5: TRLDBText
        Left = 16
        Top = 40
        Width = 79
        Height = 16
        DataField = 'DataRegistro'
        DataSource = WaPrincipal.DataSourceEntrada
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 192
        Top = 40
        Width = 79
        Height = 16
        DataField = 'HoraRegistro'
        DataSource = WaPrincipal.DataSourceEntrada
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 376
        Top = 40
        Width = 79
        Height = 16
        DataField = 'HoraRegistro'
        DataSource = WaPrincipal.DataSourceSaida
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 833
      Width = 718
      Height = 251
      BandType = btFooter
      object RLDraw4: TRLDraw
        AlignWithMargins = True
        Left = 0
        Top = 19
        Width = 718
        Height = 127
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = faTop
      end
      object RLLabel14: TRLLabel
        AlignWithMargins = True
        Left = 0
        Top = 0
        Width = 718
        Height = 19
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 10
        Align = faTop
        Alignment = taCenter
        Caption = 'OBSERVA'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 456
        Top = 186
        Width = 187
        Height = 16
        DrawKind = dkLine
      end
      object RLDraw3: TRLDraw
        Left = 76
        Top = 186
        Width = 187
        Height = 16
        DrawKind = dkLine
      end
      object RLLabel12: TRLLabel
        Left = 456
        Top = 208
        Width = 187
        Height = 16
        Alignment = taCenter
        Caption = 'Assinatura Empregado'
      end
      object RLLabel13: TRLLabel
        Left = 99
        Top = 208
        Width = 140
        Height = 16
        Alignment = taCenter
        Caption = 'Assinatura Empregador'
      end
    end
  end
end
