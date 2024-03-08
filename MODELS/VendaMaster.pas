unit VendaMaster;

interface

uses
  UModel;

 type
  TVendaMaster = class(TModel)
  private
    FID: Integer;
    FCodigoCliente: Integer;
    FData: TDate;
    FTotal: Double;
    FCancelado: boolean;
  public
    property ID: Integer read FID write FID;
    property CodigoCliente: Integer read FCodigoCliente write FCodigoCliente;
    property Data: TDate read FData write FData;
    property Total: Double read FTotal write FTotal;
    property Cancelado: boolean read FCancelado write FCancelado;

    constructor Create;
  end;

implementation

{ TVendaMaster }

constructor TVendaMaster.Create;
begin
   key := 'Id';
   AutoIncremment := False;
end;

end.
