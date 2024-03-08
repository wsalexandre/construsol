unit FrmVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids,  Vcl.Mask, VendaDTO;

type
  T_frmVenda = class(TForm)
    lbltitulo: TLabel;
    txtCliente: TEdit;
    txtNomeCliente: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    txtDocumento: TEdit;
    Label4: TLabel;
    GridVendaDet: TStringGrid;
    Panel1: TPanel;
    txtCodProd: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    btniNCLUIR: TBitBtn;
    txtTotal: TEdit;
    txtQtd: TEdit;
    txtPreco: TEdit;
    txtData: TEdit;
    btnExc: TBitBtn;
    Label8: TLabel;
    SpeedButton1: TSpeedButton;
    procedure btniNCLUIRClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
     DTOVenda : TVendaDTO;
  public
    { Public declarations }
    procedure AtualizarTelaVenda(pVendaDTO : TVendaDTO);
    constructor Create(AOwner: TComponent; IdVenda : integer); overload;
  end;

var
  _frmVenda: T_frmVenda;

implementation

uses
  VendaDetail, URepositorioVendaDetail, FrmVendaMaster, URepositorioProduto,
  FrmCadastroProduto;

{$R *.dfm}

procedure T_frmVenda.AtualizarTelaVenda(pVendaDTO: TVendaDTO);
var
  total : Double;
  v : TVendaDetail;
begin
    txtDocumento.Text := pVendaDTO.VendaMaster.ID.ToString();
    txtCliente.Text   := pVendaDTO.VendaMaster.CodigoCliente.ToString();
    txtData.Text      := DateToStr(pVendaDTO.VendaMaster.Data);

    total := 0;
    GridVendaDet.Cells[0,0] := 'ID';
    GridVendaDet.Cells[1,0] := 'VENDA ID';
    GridVendaDet.Cells[2,0] := 'PRODUTO';
    GridVendaDet.Cells[3,0] := 'DATA';
    GridVendaDet.Cells[4,0] := 'QTD';
    GridVendaDet.Cells[5,0] := 'VALOR';
    GridVendaDet.Cells[6,0] := 'TOTAL';
    GridVendaDet.RowCount := 1;

    for v in pVendaDTO.VendaDetail do
    begin
        GridVendaDet.Cells[0,GridVendaDet.RowCount] := v.ID.ToString;
        GridVendaDet.Cells[1,GridVendaDet.RowCount] := v.VendaID.ToString;
        GridVendaDet.Cells[2,GridVendaDet.RowCount] := v.Produto.ToString;
        GridVendaDet.Cells[3,GridVendaDet.RowCount] := DateToStr(v.Data);
        GridVendaDet.Cells[4,GridVendaDet.RowCount] := CurrToStr(v.Quantidade);
        GridVendaDet.Cells[5,GridVendaDet.RowCount] := CurrToStr(v.valor);
        GridVendaDet.Cells[6,GridVendaDet.RowCount] := CurrToStr(v.total);
        GridVendaDet.RowCount := GridVendaDet.RowCount +1;

      total := total + v.Total;
    end;

    txtTotal.Text := CurrToStr(total);

end;

procedure T_frmVenda.btniNCLUIRClick(Sender: TObject);
var
  vendaDet : TVendaDetail;
  RepositorioVendaDetail : TRepositorioVendaDetail;
begin
  formatsettings.DecimalSeparator :='.';

  vendaDet := TVendaDetail.Create;
  vendaDet.VendaID    := StrToInt(txtDocumento.Text);
  vendaDet.Produto    := StrToInt(TxtCodProd.Text);
  vendaDet.Quantidade := StrToCurr(formatFloat('#,###0.00',StrToFloat(txtQtd.Text)) );
  vendaDet.Valor      := StrToCurr(formatFloat('#,###0.00',StrToFloat(txtPreco.Text)));
  vendaDet.Total      := StrToFloat(formatFloat('#,###0.00',vendaDet.Valor *vendaDet.Quantidade ));
  vendaDet.Data        := strToDate(DateToStr(now));
  vendaDet.Cancelado :=False;

  try
    RepositorioVendaDetail := TRepositorioVendaDetail.Create;
    RepositorioVendaDetail.Add(vendaDet);
    RepositorioVendaDetail.SaveChange;
  finally
    vendaDet.Free;
    RepositorioVendaDetail.Free;
  end;
  DTOVenda:= T_FrmVendaMaster.AtualizarVendaDTO(StrToInt(txtDocumento.Text));
  AtualizarTelaVenda(DTOVenda);
end;

constructor T_frmVenda.Create(AOwner: TComponent; IdVenda: integer);
begin
  inherited Create(AOwner);
   DTOVenda:= T_FrmVendaMaster.AtualizarVendaDTO(IdVenda);
end;

procedure T_frmVenda.FormShow(Sender: TObject);
begin
  if Assigned(DTOVenda) then
    AtualizarTelaVenda(DTOVenda);
end;

procedure T_frmVenda.SpeedButton1Click(Sender: TObject);
begin
  _FrmProdutos := T_FrmProdutos.Create(Self);
  _FrmProdutos.ShowModal;

  txtCodProd.Text := _FrmProdutos.ResultProduto.Id.ToString;
  txtPreco.Text := Currtostr(_FrmProdutos.ResultProduto.Preco);
  txtQtd.SetFocus;

  _FrmProdutos.Release;
end;

end.
