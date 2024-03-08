unit Produto;

interface

uses
  UModel;

type
TProduto = class(TModel)
   private
     FId        : Integer;
     FNome      : string;
     FPreco     : Currency;
     FCategoria : Integer;
     FEstoque   : Currency;
    public
     property Id   : Integer   read  FId         write FId;
     property Nome : string      read  FNome       write FNome;
     property Preco  : Currency    read  FPreco      write FPreco;
     property Categoria : Integer read  FCategoria  write FCategoria;
     property Estoque  : Currency  read  FEstoque    write FEstoque;

    constructor Create;

end;

implementation

{ TProduto }

constructor TProduto.Create;
begin
   key := 'Id';
   AutoIncremment := False;
end;

end.
