unit Usuario;

interface

uses
  UModel;

type
  TUsuario = class(TModel)
  private
    FID: Integer;
    FNome: string;
    FPswd: string;
  public
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Senha: string read FPswd write FPswd;

    constructor Create;
  end;

implementation

{ TUsuario }

constructor TUsuario.Create;
begin
   key := 'ID';
   AutoIncremment := False;
end;

end.
