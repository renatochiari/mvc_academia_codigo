unit mvc.view.principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  mvc.model.entity.impl.cliente, mvc.utils.impl.query,
  mvc.controller.imple.controller, mvc.controller.interfaces;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
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
         .SetEstado('SP');

     lController.Dao(lCliente).Inserir;
end;

end.
