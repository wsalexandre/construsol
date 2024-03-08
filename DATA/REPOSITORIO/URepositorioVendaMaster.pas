unit URepositorioVendaMaster;

interface

uses
  URepositorioGenerico,VendaMaster;

type
TRepositorioVendaMaster = class(TRepositorioGenerico<TVendaMaster>)
    public
       function ObterIdUltimaVenda : integer;
end;

implementation

{ TRepositorioVendaMaster }


function TRepositorioVendaMaster.ObterIdUltimaVenda: integer;
var
  SQL : string;
begin
     SQL := 'SELECT * FROM VendaMaster ORDER BY ID DESC LIMIT 1';
     Result := SQLQuery(SQL).First.ID;
end;

end.
