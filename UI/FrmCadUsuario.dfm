object _FrmCadUsuario: T_FrmCadUsuario
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 207
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 75
    Width = 63
    Height = 19
    Caption = 'USUARIO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 115
    Width = 45
    Height = 19
    Caption = 'SENHA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 155
    Width = 90
    Height = 19
    Caption = 'CONF SENHA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 8
    Width = 180
    Height = 19
    Caption = 'Cadastro de Usu'#225'rios'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
  end
  object txtUsuario: TEdit
    Left = 128
    Top = 72
    Width = 121
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object txtSenha: TEdit
    Left = 128
    Top = 112
    Width = 273
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
  end
  object txtConfSenha: TEdit
    Left = 128
    Top = 152
    Width = 273
    Height = 27
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 2
  end
  object btnCadastrar: TBitBtn
    Left = 472
    Top = 130
    Width = 105
    Height = 49
    Caption = 'CADASTRAR'
    TabOrder = 3
    OnClick = btnCadastrarClick
  end
end
