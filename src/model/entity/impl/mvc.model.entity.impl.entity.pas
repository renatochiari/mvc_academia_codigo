unit mvc.model.entity.impl.entity;

interface

uses mvc.model.entity.interfaces, mvc.model.entity.impl.cliente,
  mvc.model.entity.impl.pedidoitens, mvc.model.entity.impl.pedidos,
  mvc.model.entity.impl.produto;

type
    TEntity = class(TInterfacedObject, iEntity)
    private
      FCliente: iCliente;
      FProduto: iProduto;
      FPedido: iPedidos;
      FPedidoItens: iPedidoItens;

    public
      class function New: iEntity;
      function Cliente: iCliente;
      function Produto: iProduto;
      function Pedidos: iPedidos;
      function PedidoItens: iPedidoItens;
    end;

implementation

{ TEntity }

function TEntity.Cliente: iCliente;
begin
     if (not Assigned(FCliente))
     then FCliente := TCliente.New;

     Result := FCliente;
end;

class function TEntity.New: iEntity;
begin
     Result := Self.Create;
end;

function TEntity.PedidoItens: iPedidoItens;
begin
     if (not Assigned(FPedidoItens))
     then FPedidoItens := TPedidoItens.New;

     Result := FPedidoItens;
end;

function TEntity.Pedidos: iPedidos;
begin
     if (not Assigned(FPedido))
     then FPedido := TPedidos.New;

     Result := FPedido;
end;

function TEntity.Produto: iProduto;
begin
     if (not Assigned(FProduto))
     then FProduto := TProduto.New;

     Result := FProduto;
end;

end.
