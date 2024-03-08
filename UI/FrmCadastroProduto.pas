unit FrmCadastroProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, System.Generics.Collections,
  Produto, Vcl.ExtCtrls, Vcl.Mask, URepositorioProduto, UPaginate;

type
  T_FrmProdutos = class(TForm)
    lblTitulo: TLabel;
    btnCadastrar: TBitBtn;
    GridProdutos: TStringGrid;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    pnlCenter: TPanel;
    Label1: TLabel;
    Nome: TMaskEdit;
    Label2: TLabel;
    Categoria: TMaskEdit;
    Label3: TLabel;
    Preco: TMaskEdit;
    Label4: TLabel;
    Estoque: TMaskEdit;
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure GridProdutosClick(Sender: TObject);
  private
    { Private declarations }
    linhaSelecionada : Integer;
    ListaRepositorioProduto : TRepositorioProduto;
    Procedure RecarregarListaProdutos;
    procedure gerarGridProdutos(pProdutos : TObjectList<TProduto>);
    procedure ClearGets;
    procedure GetGridSelectedItem;
    function ValidarCampos(produto: TProduto): Boolean;
  public
    ResultProduto : TProduto;
    { Public declarations }
  end;

var
  _FrmProdutos: T_FrmProdutos;

implementation

{$R *.dfm}

procedure T_FrmProdutos.btnAlterarClick(Sender: TObject);
var
  produto : TProduto;
  RepositorioProduto : TRepositorioProduto;
begin
  RepositorioProduto := TRepositorioProduto.Create;
  produto := RepositorioProduto.GetById(StrToInt(GridProdutos.Cells[0,linhaSelecionada]));
  if produto.Id = 0 then
     Exit;

  try
     produto.Nome := Nome.Text;
     produto.Categoria := StrtoInt(Categoria.Text);
     produto.Preco := StrToCurr(Preco.Text);
     produto.Estoque := StrtoInt(Estoque.Text);

     if not ValidarCampos(produto) then Exit;

     RepositorioProduto.Update (produto);
     RepositorioProduto.SaveChange();
     ClearGets;
     RecarregarListaProdutos;
  finally
     RepositorioProduto.Free;
     produto.Free;
  end;

end;

procedure T_FrmProdutos.btnCadastrarClick(Sender: TObject);
var
  produto : TProduto;
  RepositorioProduto : TRepositorioProduto;
begin
  try
     RepositorioProduto := TRepositorioProduto.Create;
     produto := TProduto.Create;
     produto.Nome := Nome.Text;
     produto.Categoria := StrtoInt(Categoria.Text);
     produto.Preco := StrToCurr(Preco.Text);
     produto.Estoque := StrtoInt(Estoque.Text);

     if not ValidarCampos(produto) then Exit;

     RepositorioProduto.Add(produto);
     RepositorioProduto.SaveChange();
     gerarGridProdutos(RepositorioProduto.GetAll(Tpaginate.Create(0,50,0,0)));
  finally
     RepositorioProduto.Free;
     produto.Free;
  end;
end;

procedure T_FrmProdutos.btnExcluirClick(Sender: TObject);
var
   RepositorioProduto : TRepositorioProduto;
   Produto : TProduto;
begin
  if linhaSelecionada = 0 then
   Exit;

  try
     RepositorioProduto := TRepositorioProduto.Create;
     Produto   := RepositorioProduto.GetById(StrToInt(GridProdutos.Cells[0,linhaSelecionada]));
     RepositorioProduto.Remove(Produto);
     RepositorioProduto.SaveChange;

     RecarregarListaProdutos;
  finally
     RepositorioProduto.Free;
     Produto.Free;
  end;
end;

procedure T_FrmProdutos.ClearGets;
begin
  Nome.Clear;
  Estoque.Clear;
  Preco.Clear;
  Categoria.Clear;
end;

procedure T_FrmProdutos.FormShow(Sender: TObject);
begin
  RecarregarListaProdutos;
end;

procedure T_FrmProdutos.gerarGridProdutos(pProdutos: TObjectList<TProduto>);
var
  p : TProduto;
begin
  GridProdutos.Cells[0,0] := 'ID';
  GridProdutos.ColWidths[1] := 180;
  GridProdutos.Cells[1,0] := 'NOME';
  GridProdutos.Cells[2,0] := 'PRE�O';
  GridProdutos.Cells[3,0] := 'CATEGORIA';
  GridProdutos.Cells[4,0] := 'ESTOQUE';

  GridProdutos.RowCount := 1;

  if pProdutos.Count > 0 then
  begin
     for p in pProdutos do
     begin
         GridProdutos.Cells[0,GridProdutos.RowCount] := p.Id.ToString;
         GridProdutos.Cells[1,GridProdutos.RowCount] := p.Nome;
         GridProdutos.Cells[2,GridProdutos.RowCount] := FormatCurr('#,###0.00',p.Preco);
         GridProdutos.Cells[3,GridProdutos.RowCount] := p.Categoria.ToString;
         GridProdutos.Cells[4,GridProdutos.RowCount] := FormatCurr('#,###0.00',p.Estoque);

         GridProdutos.RowCount := GridProdutos.RowCount +1;
     end;
  end;
end;

procedure T_FrmProdutos.GetGridSelectedItem;
var
  produto : TProduto;
  RepositorioProduto : TRepositorioProduto;
begin
  linhaSelecionada := GridProdutos.Row;

  if not Assigned(RepositorioProduto) then
    RepositorioProduto := TRepositorioProduto.Create;

  produto := RepositorioProduto.GetById(StrToInt(GridProdutos.Cells[0,linhaSelecionada]));

  if produto.Id = 0 then
     Exit;

  Nome.Text := produto.Nome;
  Categoria.Text := produto.Categoria.ToString;
  Preco.Text := CurrToStr(produto.Preco);
  Estoque.Text := CurrToStr(produto.Estoque);
  ResultProduto := produto;
end;

procedure T_FrmProdutos.GridProdutosClick(Sender: TObject);
begin
  GetGridSelectedItem;
end;

procedure T_FrmProdutos.RecarregarListaProdutos;
begin
  try
     if not Assigned(ListaRepositorioProduto) then
       ListaRepositorioProduto := TRepositorioProduto.Create;
     gerarGridProdutos(ListaRepositorioProduto.GetAll(Tpaginate.Create(0,50,0,0)));
  finally
  end;
end;

function T_FrmProdutos.ValidarCampos(produto: TProduto): Boolean;
begin
  Result := True; // Assume que os campos s�o v�lidos inicialmente

  // Valida��o do campo 'Nome'
  if Nome.Text = '' then
  begin
    ShowMessage('O campo Nome n�o pode estar em branco.');
    Nome.SetFocus;
    Result := False;
    Exit;
  end;

  // Valida��o do campo 'Categoria'
  try
    produto.Categoria := StrToInt(Categoria.Text);
    if produto.Categoria <= 0 then
    begin
      ShowMessage('O campo Categoria n�o pode ser menor ou igual a zero.');
      Categoria.SetFocus;
      Result := False;
      Exit;
    end;
  except
    on E: EConvertError do
    begin
      ShowMessage('O campo Categoria est� em branco ou possui valor inv�lido.');
      Categoria.SetFocus;
      Result := False;
      Exit;
    end;
  end;

  // Valida��o do campo 'Pre�o'
  try
    produto.Preco := StrToCurr(Preco.Text);
    if produto.Preco <= 0 then
    begin
      ShowMessage('O campo Pre�o n�o pode ser menor ou igual a zero.');
      Preco.SetFocus;
      Result := False;
      Exit;
    end;
  except
    on E: EConvertError do
    begin
      ShowMessage('O campo Pre�o est� em branco ou possui valor inv�lido.');
      Preco.SetFocus;
      Result := False;
      Exit;
    end;
  end;

  // Valida��o do campo 'Estoque'
  try
    produto.Estoque := StrToInt(Estoque.Text);
    if produto.Estoque <= 0 then
    begin
      ShowMessage('O campo Estoque n�o pode ser menor ou igual a zero.');
      Estoque.SetFocus;
      Result := False;
      Exit;
    end;
  except
    on E: EConvertError do
    begin
      ShowMessage('O campo Estoque est� em branco ou possui valor inv�lido.');
      Estoque.SetFocus;
      Result := False;
      Exit;
    end;
  end;
end;


end.
