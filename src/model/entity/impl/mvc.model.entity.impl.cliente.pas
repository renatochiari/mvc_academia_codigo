unit mvc.model.entity.impl.cliente;

interface

uses mvc.model.entity.interfaces, mvc.utils.impl.atributos;

type
    [Tabela('CLIENTE')]
    TCliente = class(TInterfacedObject, iCliente)
    private
      [Campo('CODIGO'), PK]
      FCodigo: Integer;
      [Campo('NOME')]
      FNome: string;
      [Campo('CIDADE')]
      FCidade: string;
      [Campo('UF')]
      FUF: string;

    public
      class function New: iCliente;
      function SetCodigo(const Value: Integer): iCliente;
      function GetCodigo: Integer;
      function SetNome(const Value: string): iCliente;
      function GetNome: string;
      function SetCidade(const Value: string): iCliente;
      function GetCidade: string;
      function SetUF(const Value: string): iCliente;
      function GetUF: string;
    end;

implementation

{ TCliente }

function TCliente.GetCidade: string;
begin
     Result := FCidade;
end;

function TCliente.GetCodigo: Integer;
begin
     Result := FCodigo;
end;

function TCliente.GetUF: string;
begin
     Result := FUF;
end;

function TCliente.GetNome: string;
begin
     Result := FNome;
end;

class function TCliente.New: iCliente;
begin
     Result := Self.Create;
end;

function TCliente.SetCidade(const Value: string): iCliente;
begin
     Result := Self;
     FCidade := Value;
end;

function TCliente.SetCodigo(const Value: Integer): iCliente;
begin
     Result := Self;
     FCodigo := Value;
end;

function TCliente.SetUF(const Value: string): iCliente;
begin
     Result := Self;
     FUF := Value;
end;

function TCliente.SetNome(const Value: string): iCliente;
begin
     Result := Self;
     FNome := Value;
end;

end.
