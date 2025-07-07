unit mvc.model.entity.interfaces;

interface

type
    iCliente = interface
      function SetCodigo(const Value: Integer): iCliente;
      function GetCodigo: Integer;
      function SetNome(const Value: string): iCliente;
      function GetNome: string;
      function SetCidade(const Value: string): iCliente;
      function GetCidade: string;
      function SetUF(const Value: string): iCliente;
      function GetUF: string;
    end;

    iProduto = interface
      function SetCodigo(const Value: Integer): iProduto;
      function GetCodigo: Integer;
      function SetDescricao(const Value: string): iProduto;
      function GetDescricao: string;
      function SetPrecoVenda(const Value: Currency): iProduto;
      function GetPrecoVenda: Currency;
    end;

    iPedidos = interface
      function SetNumeroPedido(const Value: Integer): iPedidos;
      function GetNumeroPedido: Integer;
      function SetDataEmissao(const Value: TDateTime): iPedidos;
      function GetDataEmissao: TDateTime;
      function SetCodigoCliente(const Value: Integer): iPedidos;
      function GetCodigoCliente: Integer;
      function SetValorTotal(const Value: Currency): iPedidos;
      function GetValorTotal: Currency;
    end;

    iPedidoItens = interface
      function SetId(const Value: Integer): iPedidoItens;
      function GetId: Integer;
      function SetNumeroPedido(const Value: Integer): iPedidoItens;
      function GetNumeroPedido: Integer;
      function SetCodigoProduto(const Value: Integer): iPedidoItens;
      function GetCodigoProduto: Integer;
      function SetQuantidade(const Value: Integer): iPedidoItens;
      function GetQuantidade: Integer;
      function SetValorUnitario(const Value: Currency): iPedidoItens;
      function GetValorUnitario: Currency;
      function SetValorTotal(const Value: Currency): iPedidoItens;
      function GetValorTotal: Currency;
    end;

    iEntity = interface
      function Cliente: iCliente;
      function Produto: iProduto;
      function Pedidos: iPedidos;
      function PedidoItens: iPedidoItens;
    end;

implementation

end.
