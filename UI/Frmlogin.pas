unit Frmlogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  T_FrmLogin = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnCancel: TButton;
    btnOK: TButton;
    txtUsuario: TMaskEdit;
    lblNome: TLabel;
    txtSenha: TMaskEdit;
    lblSenha: TLabel;
    qry_padrao: TFDQuery;
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FConexao : TFDConnection;
    function ValidarLogin(const Usuario, Senha: string): Boolean;
  end;

var
  _FrmLogin: T_FrmLogin;

implementation

uses
  Construsol;

{$R *.dfm}

{ Tform_login }

procedure T_FrmLogin.btnCancelClick(Sender: TObject);
begin
  self.Hide;
end;

procedure T_FrmLogin.btnOKClick(Sender: TObject);
begin

  if ValidarLogin(txtUsuario.Text, txtSenha.Text) = True then
    Self.ModalResult := mrOk
  else
  begin
    Application.MessageBox('Usuário não autorizado.', 'Erro no acesso', MB_OK + MB_ICONERROR);
    self.ModalResult := mrNone;
    self.Hide;
  end;

end;

procedure T_FrmLogin.FormShow(Sender: TObject);
begin
  if Self.Visible then txtUsuario.SetFocus;
end;

function T_FrmLogin.ValidarLogin(const Usuario, Senha: string): Boolean;
begin
  qry_padrao.Connection := FConexao;
  qry_padrao.SQL.Text := 'SELECT COUNT(*) FROM usuario WHERE nome = :nome AND pswd = md5(:pswd)';
  qry_padrao.ParamByName('nome').AsString := Usuario;
  qry_padrao.ParamByName('pswd').AsString := Senha;
  qry_padrao.Open;

  Result := qry_padrao.Fields[0].AsInteger > 0;

  qry_padrao.Close;
end;

end.
