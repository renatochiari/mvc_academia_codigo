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
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
     var lController := TController.New;
     var lCliente := lController.Entity.Cliente
         .SetNome('Renato')
         .SetCidade('Dracena')
         .SetUF('SP');

     lController.Dao(lCliente).Inserir;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
     var lController := TController.New;
     var lCliente := lController.Entity.Cliente
         .SetCodigo(6)
         .SetNome('Renato Chiari');

     lController.Dao(lCliente).Atualizar;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
     var lController := TController.New;
     var lCliente := lController.Entity.Cliente
         .SetCodigo(7);

     lController.Dao(lCliente).Excluir;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
     var lController := TController.New;
     var lCliente := lController.Entity.Cliente;

     var dataSet := lController.Dao(lCliente).Listar.DataSet;
     ShowMessage(dataSet.RecordCount.ToString);
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
     var lController := TController.New;
     var lCliente := lController.Entity.Cliente.SetCodigo(9);

     var dataSet := lController.Dao(lCliente).ListarPorId.DataSet;
     ShowMessage(dataSet.RecordCount.ToString);
end;

end.
