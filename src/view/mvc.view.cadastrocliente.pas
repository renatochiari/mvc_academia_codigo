unit mvc.view.cadastrocliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  mvc.controller.interfaces, Data.DB;

type
  TFormCliente = class(TForm)
    Panel1: TPanel;
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtEstado: TLabeledEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnSalvarClick(Sender: TObject);
  private
    FController: iController;
    FCodigo: Integer;
    FNome: string;
    FCidade: string;
    FEstado: string;

    procedure LimparCampos;

  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Cidade: string read FCidade write FCidade;
    property Estado: string read FEstado write FEstado;

  end;

implementation

{$R *.dfm}

uses mvc.controller.imple.controller;

procedure TFormCliente.btnSalvarClick(Sender: TObject);
begin
     var lCliente := FController.Entity.Cliente
                       .SetNome(edtNome.Text)
                       .SetCidade(edtCidade.Text)
                       .SetUF(edtEstado.Text);

     FController.Dao(lCliente).Inserir;

     var lRetorno := TDataSource.Create(nil);
     try
          FController.Dao(lCliente).Listar.DataSource(lRetorno);
          lRetorno.DataSet.Locate('NOME', edtNome.Text, []);

          FCodigo := lRetorno.DataSet.FieldByName('CODIGO').AsInteger;
          FNome := lRetorno.DataSet.FieldByName('NOME').AsString;
          FCidade := lRetorno.DataSet.FieldByName('CIDADE').AsString;
          FEstado := lRetorno.DataSet.FieldByName('UF').AsString;

          ShowMessage('Cliente cadastrado com sucesso!');
          LimparCampos;

     finally
          lRetorno.Free;
     end;
end;

procedure TFormCliente.LimparCampos;
begin
     edtCodigo.Clear;
     edtNome.Clear;
     edtCidade.Clear;
     edtEstado.Clear;
end;

end.
