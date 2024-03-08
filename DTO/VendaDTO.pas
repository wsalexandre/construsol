unit VendaDTO;

interface

uses
  VendaMaster, VendaDetail,System.Generics.Collections;

Type
TVendaDTO = class
    private
       FVendaMaster : TVendaMaster;
       FVendaDetail : TObjectList<TVendaDetail>;

    public
     property  VendaMaster : TVendaMaster  read  FVendaMaster write FVendaMaster;
     property  VendaDetail : TObjectList<TVendaDetail>  read   FVendaDetail write FVendaDetail;


end;

implementation

end.
