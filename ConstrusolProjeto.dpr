program ConstrusolProjeto;

uses
  Vcl.Forms,
  Construsol in 'Construsol.pas' {Main},
  ORM in 'DATA\ORM.pas',
  UModel in 'MODELS\UModel.pas',
  UPaginate in 'COMUNS\UPaginate.pas',
  URepositorioGenerico in 'DATA\REPOSITORIO\URepositorioGenerico.pas',
  FrmCadastroProduto in 'UI\FrmCadastroProduto.pas' {_FrmProdutos},
  Produto in 'MODELS\Produto.pas',
  URepositorioProduto in 'DATA\REPOSITORIO\URepositorioProduto.pas',
  Usuario in 'MODELS\Usuario.pas',
  VendaDetail in 'MODELS\VendaDetail.pas',
  VendaMaster in 'MODELS\VendaMaster.pas',
  URepositorioUsuario in 'DATA\REPOSITORIO\URepositorioUsuario.pas',
  URepositorioVendaMaster in 'DATA\REPOSITORIO\URepositorioVendaMaster.pas',
  URepositorioVendaDetail in 'DATA\REPOSITORIO\URepositorioVendaDetail.pas',
  FrmVenda in 'UI\FrmVenda.pas' {_frmVenda},
  VendaDTO in 'DTO\VendaDTO.pas',
  FrmVendaMaster in 'UI\FrmVendaMaster.pas' {_FrmVendaMaster},
  FrmCadUsuario in 'UI\FrmCadUsuario.pas' {_FrmCadUsuario},
  Vcl.Themes,
  Vcl.Styles,
  Frmlogin in 'UI\Frmlogin.pas' {_FrmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10 SlateGray');
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
