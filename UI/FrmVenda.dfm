object _frmVenda: T_frmVenda
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = '_frmVenda'
  ClientHeight = 527
  ClientWidth = 773
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object lbltitulo: TLabel
    Left = 8
    Top = 8
    Width = 45
    Height = 19
    Caption = 'VENDA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 13
    Top = 45
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label2: TLabel
    Left = 12
    Top = 103
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object Label3: TLabel
    Left = 525
    Top = 99
    Width = 72
    Height = 19
    Caption = 'TOTAL R$'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 135
    Top = 103
    Width = 54
    Height = 13
    Caption = 'Documento'
  end
  object Label8: TLabel
    Left = 135
    Top = 45
    Width = 78
    Height = 13
    Caption = 'Nome do Cliente'
  end
  object txtCliente: TEdit
    Left = 13
    Top = 64
    Width = 89
    Height = 21
    TabOrder = 0
    Text = '0'
  end
  object txtNomeCliente: TEdit
    Left = 135
    Top = 64
    Width = 530
    Height = 21
    TabOrder = 1
    Text = '0'
  end
  object txtDocumento: TEdit
    Left = 135
    Top = 122
    Width = 145
    Height = 21
    Enabled = False
    TabOrder = 2
    Text = '0'
  end
  object GridVendaDet: TStringGrid
    Left = 8
    Top = 160
    Width = 761
    Height = 268
    ColCount = 7
    RowCount = 2
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 8
    Top = 434
    Width = 761
    Height = 87
    TabOrder = 4
    object Label5: TLabel
      Left = 17
      Top = 18
      Width = 49
      Height = 13
      Caption = 'PRODUTO'
    end
    object Label6: TLabel
      Left = 181
      Top = 18
      Width = 66
      Height = 13
      Caption = 'QUANTIDADE'
    end
    object Label7: TLabel
      Left = 266
      Top = 18
      Width = 34
      Height = 13
      Caption = 'PRE'#199'O'
    end
    object SpeedButton1: TSpeedButton
      Left = 72
      Top = 37
      Width = 41
      Height = 22
      Caption = 'Buscar'
      OnClick = SpeedButton1Click
    end
    object txtCodProd: TEdit
      Left = 17
      Top = 37
      Width = 49
      Height = 21
      TabOrder = 0
      Text = '0'
    end
    object btniNCLUIR: TBitBtn
      Left = 391
      Top = 24
      Width = 145
      Height = 41
      Caption = 'INCLUIR'
      TabOrder = 1
      OnClick = btniNCLUIRClick
    end
    object txtQtd: TEdit
      Left = 181
      Top = 37
      Width = 66
      Height = 21
      TabOrder = 2
      Text = '0'
    end
    object txtPreco: TEdit
      Left = 263
      Top = 37
      Width = 90
      Height = 21
      TabOrder = 3
      Text = '0'
    end
    object btnExc: TBitBtn
      Left = 656
      Top = 30
      Width = 89
      Height = 25
      Caption = 'Excluir Prod'
      TabOrder = 4
    end
  end
  object txtTotal: TEdit
    Left = 525
    Top = 118
    Width = 145
    Height = 27
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    Text = '0'
  end
  object txtData: TEdit
    Left = 12
    Top = 122
    Width = 117
    Height = 21
    TabOrder = 6
    Text = '0'
  end
end
