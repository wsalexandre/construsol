object _FrmVendaMaster: T_FrmVendaMaster
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  ClientHeight = 356
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 54
    Height = 19
    Caption = 'Vendas'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GridVendaLista: TStringGrid
    Left = 8
    Top = 33
    Width = 609
    Height = 264
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    OnSelectCell = GridVendaListaSelectCell
  end
  object btnAbrirVenda: TBitBtn
    Left = 8
    Top = 303
    Width = 121
    Height = 36
    Caption = 'Abrir'
    TabOrder = 1
    OnClick = btnAbrirVendaClick
  end
  object btnNovaVenda: TBitBtn
    Left = 144
    Top = 303
    Width = 121
    Height = 36
    Caption = 'Nova Venda'
    TabOrder = 2
    OnClick = btnNovaVendaClick
  end
end
