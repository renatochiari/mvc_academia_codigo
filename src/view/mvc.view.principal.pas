unit mvc.view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  mvc.model.entity.impl.cliente, mvc.utils.impl.query,
  mvc.controller.imple.controller, mvc.controller.interfaces, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Mask, Vcl.ExtCtrls;

type
  TFormPrincipal = class(TForm)
    Panel1: TPanel;
    edtCodigoCliente: TLabeledEdit;
    edtNomeCliente: TLabeledEdit;
    edtCodigoProduto: TLabeledEdit;
    edtQuantidade: TLabeledEdit;
    edtValorUnitario: TLabeledEdit;
    btnNovoCliente: TButton;
    btnPesquisarCliente: TButton;
    edtPesquisarProduto: TButton;
    edtNovoProduto: TButton;
    edtConfirmar: TButton;
    grdProdutos: TDBGrid;
    btnFinalizarPedido: TButton;
    btnCancelarPedido: TButton;
    DataSource1: TDataSource;
    procedure btnNovoClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFinalizarPedidoClick(Sender: TObject);
  private
    FController: iController;

  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses mvc.view.cadastrocliente;

procedure TFormPrincipal.btnFinalizarPedidoClick(Sender: TObject);
begin
     FController.Dao(FController.Entity.Cliente).Listar.DataSource(DataSource1);
end;

procedure TFormPrincipal.btnNovoClienteClick(Sender: TObject);
begin
     var lCliente := TFormCliente.Create(nil);
     try
          lCliente.ShowModal;
     finally
          lCliente.Free;
     end;
end;

procedure TFormPrincipal.FormCreate(Sender: TObject);
begin
     FController := TController.New;
end;

end.
