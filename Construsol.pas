unit Construsol;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Data.SqlExpr, ORM, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Vcl.Menus, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TMain = class(TForm)
    dm: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Operaes1: TMenuItem;
    Sair1: TMenuItem;
    Produtos1: TMenuItem;
    Usurios1: TMenuItem;
    Venda1: TMenuItem;
    pnlLeft: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    procedure btnProdutoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnVendaClick(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Venda1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Main: TMain;
  DBContext : TORMFramwork;

implementation

uses
  FrmCadastroProduto, URepositorioVendaMaster, VendaMaster, FrmVenda,
  FrmVendaMaster, FrmCadUsuario, Frmlogin;

{$R *.dfm}

procedure TMain.btnProdutoClick(Sender: TObject);
begin
    _FrmProdutos := T_FrmProdutos.Create(Self);
    _FrmProdutos.ShowModal;
    _FrmProdutos.Release;
end;

procedure TMain.btnUsuarioClick(Sender: TObject);
begin
   _FrmCadUsuario := T_FrmCadUsuario.Create(Self);
   _FrmCadUsuario.ShowModal;
   _FrmCadUsuario.Release;
end;

procedure TMain.btnVendaClick(Sender: TObject);
begin
    _FrmVendaMaster := T_FrmVendaMaster.Create(Self);
    _FrmVendaMaster.ShowModal();
    _FrmVendaMaster.Release;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  DBContext := TORMFramwork.Create(dm);

  Application.CreateForm(T_FrmLogin, _FrmLogin);
  _FrmLogin.Visible := False;
  _FrmLogin.FConexao := dm;
  _FrmLogin.Showmodal;

  if _FrmLogin.ModalResult <> mrOk then
    application.Terminate
  else
  begin
    _FrmLogin.Visible := False;
    _FrmLogin.Release;
    self.Show;
  end;
end;

procedure TMain.Image1Click(Sender: TObject);
begin
  _FrmVendaMaster := T_FrmVendaMaster.Create(Self);
  _FrmVendaMaster.ShowModal();
  _FrmVendaMaster.Release;
end;

procedure TMain.Image2Click(Sender: TObject);
begin
  _FrmProdutos := T_FrmProdutos.Create(Self);
  _FrmProdutos.ShowModal;
  _FrmProdutos.Release;
end;

procedure TMain.Image4Click(Sender: TObject);
begin
  _FrmCadUsuario := T_FrmCadUsuario.Create(Self);
  _FrmCadUsuario.ShowModal;
  _FrmCadUsuario.Release;
end;

procedure TMain.Produtos1Click(Sender: TObject);
begin
  _FrmProdutos := T_FrmProdutos.Create(Self);
  _FrmProdutos.ShowModal;
  _FrmProdutos.Release;
end;

procedure TMain.Sair1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TMain.Usurios1Click(Sender: TObject);
begin
  _FrmCadUsuario := T_FrmCadUsuario.Create(Self);
  _FrmCadUsuario.ShowModal;
  _FrmCadUsuario.Release;
end;

procedure TMain.Venda1Click(Sender: TObject);
begin
  _FrmVendaMaster := T_FrmVendaMaster.Create(Self);
  _FrmVendaMaster.ShowModal();
  _FrmVendaMaster.Release;
end;

end.
