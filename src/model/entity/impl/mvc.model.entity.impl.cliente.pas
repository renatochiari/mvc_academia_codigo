unit mvc.model.entity.impl.cliente;

interface

uses mvc.model.entity.interfaces;

type
    TCliente = class(TInterfacedObject, iCliente)
    private
      FCodigo: Integer;
      FNome: string;
      FCidade: string;
      FEstado: string;

    public
      class function New: iCliente;
      function SetCodigo(const Value: Integer): iCliente;
      function GetCodigo: Integer;
      function SetNome(const Value: string): iCliente;
      function GetNome: string;
      function SetCidade(const Value: string): iCliente;
      function GetCidade: string;
      function SetEstado(const Value: string): iCliente;
      function GetEstado: string;
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

function TCliente.GetEstado: string;
begin
     Result := FEstado;
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

function TCliente.SetEstado(const Value: string): iCliente;
begin
     Result := Self;
     FEstado := Value;
end;

function TCliente.SetNome(const Value: string): iCliente;
begin
     Result := Self;
     FNome := Value;
end;

end.
