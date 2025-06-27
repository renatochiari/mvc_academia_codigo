unit mvc.model.entity.impl.pedidos;

interface

uses mvc.model.entity.interfaces;

type
    TPedidos = class(TInterfacedObject, iPedidos)
    private
      FNumeroPedido: Integer;
      FDataEmissao: TDateTime;
      FCodigoCliente: Integer;
      FValorTotal: Currency;

    public
      class function New: iPedidos;
      function SetNumeroPedido(const Value: Integer): iPedidos;
      function GetNumeroPedido: Integer;
      function SetDataEmissao(const Value: TDateTime): iPedidos;
      function GetDataEmissao: TDateTime;
      function SetCodigoCliente(const Value: Integer): iPedidos;
      function GetCodigoCliente: Integer;
      function SetValorTotal(const Value: Currency): iPedidos;
      function GetValorTotal: Currency;
    end;

implementation

{ TPedidos }

function TPedidos.GetCodigoCliente: Integer;
begin
     Result := FCodigoCliente;
end;

function TPedidos.GetDataEmissao: TDateTime;
begin
     Result := FDataEmissao;
end;

function TPedidos.GetNumeroPedido: Integer;
begin
     Result := FNumeroPedido;
end;

function TPedidos.GetValorTotal: Currency;
begin
     Result := FValorTotal;
end;

class function TPedidos.New: iPedidos;
begin
     Result := Self.Create;
end;

function TPedidos.SetCodigoCliente(const Value: Integer): iPedidos;
begin
     Result := Self;
     FCodigoCliente := Value;
end;

function TPedidos.SetDataEmissao(const Value: TDateTime): iPedidos;
begin
     Result := Self;
     FDataEmissao := Value;
end;

function TPedidos.SetNumeroPedido(const Value: Integer): iPedidos;
begin
     Result := Self;
     FNumeroPedido := Value;
end;

function TPedidos.SetValorTotal(const Value: Currency): iPedidos;
begin
     Result := Self;
     FValorTotal := Value;
end;

end.
