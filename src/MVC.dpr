program MVC;

uses
  Vcl.Forms,
  mvc.view.principal in 'view\mvc.view.principal.pas' {Form1},
  mvc.model.entity.interfaces in 'model\entity\mvc.model.entity.interfaces.pas',
  mvc.model.entity.impl.cliente in 'model\entity\impl\mvc.model.entity.impl.cliente.pas',
  mvc.model.entity.impl.produto in 'model\entity\impl\mvc.model.entity.impl.produto.pas',
  mvc.model.entity.impl.pedidos in 'model\entity\impl\mvc.model.entity.impl.pedidos.pas',
  mvc.model.entity.impl.pedidoitens in 'model\entity\impl\mvc.model.entity.impl.pedidoitens.pas',
  mvc.model.entity.impl.entity in 'model\entity\impl\mvc.model.entity.impl.entity.pas',
  mvc.model.connection.interfaces in 'model\connection\mvc.model.connection.interfaces.pas',
  mvc.model.connection.impl.firedac in 'model\connection\impl\mvc.model.connection.impl.firedac.pas',
  mvc.model.connection.impl.query in 'model\connection\impl\mvc.model.connection.impl.query.pas',
  mvc.model.connection.impl.configuration in 'model\connection\impl\mvc.model.connection.impl.configuration.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
