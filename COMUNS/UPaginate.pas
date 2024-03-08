unit UPaginate;

interface

type

TPaginate = class
  public
     Skip : Integer;
     Take : Integer;
     Total: Integer;
     CurrentPage : Integer;

     constructor Create(pSkip,pTake,pTotal,pCurrentPage : integer);
end;

implementation

{ TPaginate }

constructor TPaginate.Create(pSkip, pTake, pTotal, pCurrentPage: integer);
begin
   Skip := pSkip;
   Take := pTake;
   Total := pTotal;
   CurrentPage :=  pCurrentPage;
end;

end.
