unit FrmCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  T_FrmCadUsuario = class(TForm)
    txtUsuario: TEdit;
    txtSenha: TEdit;
    txtConfSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnCadastrar: TBitBtn;
    Label4: TLabel;
    procedure btnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  _FrmCadUsuario: T_FrmCadUsuario;

implementation

uses
  URepositorioUsuario, Usuario;

{$R *.dfm}

procedure T_FrmCadUsuario.btnCadastrarClick(Sender: TObject);
var
  RepositorioUsuario : TRepositorioUsuario;
  Usuario : TUsuario;
begin
    if txtUsuario.Text = string.empty then
        Exit;

    if txtSenha.Text = string.empty then
        Exit;

    if txtSenha.Text <> txtConfSenha.Text then
        Exit;

     try
        Usuario := TUsuario.Create;
        Usuario.Nome := txtUsuario.Text;
        Usuario.Senha := txtSenha.Text;

        RepositorioUsuario := TRepositorioUsuario.Create;
        RepositorioUsuario.Add(Usuario);
        RepositorioUsuario.SaveChange;
     finally
         RepositorioUsuario.Free;
         Usuario.Free;
     end;


end;

end.
