unit mvc.model.entity.impl.produto;

interface

uses mvc.model.entity.interfaces;

type
    TProduto = class(TInterfacedObject, iProduto)
    private
      FCodigo: Integer;
      FDescricao: string;
      FPrecoVenda: Currency;

    public
      class function New: iProduto;
      function SetCodigo(const Value: Integer): iProduto;
      function GetCodigo: Integer;
      function SetDescricao(const Value: string): iProduto;
      function GetDescricao: string;
      function SetPrecoVenda(const Value: Currency): iProduto;
      function GetPrecoVenda: Currency;
    end;

implementation

{ TProduto }

function TProduto.GetCodigo: Integer;
begin
     Result := FCodigo;
end;

function TProduto.GetDescricao: string;
begin
     Result := FDescricao;
end;

function TProduto.GetPrecoVenda: Currency;
begin
     Result := FPrecoVenda;
end;

class function TProduto.New: iProduto;
begin
     Result := Self.Create;
end;

function TProduto.SetCodigo(const Value: Integer): iProduto;
begin
     Result := Self;
     FCodigo := Value;
end;

function TProduto.SetDescricao(const Value: string): iProduto;
begin
     Result := Self;
     FDescricao := Value;
end;

function TProduto.SetPrecoVenda(const Value: Currency): iProduto;
begin
     Result := Self;
     FPrecoVenda := Value;
end;

end.
