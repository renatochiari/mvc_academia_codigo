program MVC;

uses
  Vcl.Forms,
  mvc.view.principal in 'view\mvc.view.principal.pas' {FormPrincipal},
  mvc.model.entity.interfaces in 'model\entity\mvc.model.entity.interfaces.pas',
  mvc.model.entity.impl.cliente in 'model\entity\impl\mvc.model.entity.impl.cliente.pas',
  mvc.model.entity.impl.produto in 'model\entity\impl\mvc.model.entity.impl.produto.pas',
  mvc.model.entity.impl.pedidos in 'model\entity\impl\mvc.model.entity.impl.pedidos.pas',
  mvc.model.entity.impl.pedidoitens in 'model\entity\impl\mvc.model.entity.impl.pedidoitens.pas',
  mvc.model.entity.impl.entity in 'model\entity\impl\mvc.model.entity.impl.entity.pas',
  mvc.model.connection.interfaces in 'model\connection\mvc.model.connection.interfaces.pas',
  mvc.model.connection.impl.firedac in 'model\connection\impl\mvc.model.connection.impl.firedac.pas',
  mvc.model.connection.impl.query in 'model\connection\impl\mvc.model.connection.impl.query.pas',
  mvc.model.connection.impl.configuration in 'model\connection\impl\mvc.model.connection.impl.configuration.pas',
  mvc.model.dao.interfaces in 'model\dao\mvc.model.dao.interfaces.pas',
  mvc.model.dao.impl.daogenerico in 'model\dao\impl\mvc.model.dao.impl.daogenerico.pas',
  mvc.utils.interfaces in 'utils\mvc.utils.interfaces.pas',
  mvc.utils.impl.query in 'utils\impl\mvc.utils.impl.query.pas',
  mvc.utils.impl.rttihelper in 'utils\impl\mvc.utils.impl.rttihelper.pas',
  mvc.utils.impl.atributos in 'utils\impl\mvc.utils.impl.atributos.pas',
  mvc.controller.interfaces in 'controller\mvc.controller.interfaces.pas',
  mvc.controller.imple.controller in 'controller\impl\mvc.controller.imple.controller.pas',
  mvc.utils.impl.utils in 'utils\impl\mvc.utils.impl.utils.pas',
  mvc.view.cadastrocliente in 'view\mvc.view.cadastrocliente.pas' {FormCliente};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
