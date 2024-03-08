unit VendaDetail;

interface

uses
  UModel;

type
  TVendaDetail = class(TModel)
  private
    FID: Integer;
    FVendaID: Integer;
    FProduto: Integer;
    FData: TDate;
    FQuantidade: Currency;
    FValor: Currency;
    FTotal: Currency;
    FCancelado: boolean;
  public
    property ID: Integer read FID write FID;
    property VendaID: Integer read FVendaID write FVendaID;
    property Produto: Integer read FProduto write FProduto;
    property Data: TDate read FData write FData;
    property Quantidade: Currency read FQuantidade write FQuantidade;
    property Valor: Currency read FValor write FValor;
    property Total: Currency read FTotal write FTotal;
    property Cancelado: boolean read FCancelado write FCancelado;

    constructor Create;
  end;

implementation

{ TVendaDetail }

constructor TVendaDetail.Create;
begin
   key := 'Id';
   foreignKey := 'VendaID';
   AutoIncremment := False;
end;

end.
