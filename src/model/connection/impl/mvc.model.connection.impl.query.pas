unit mvc.model.connection.impl.query;

interface

uses mvc.model.connection.interfaces, Data.DB, FireDAC.Comp.Client;

type
    TQuery = class(TInterfacedObject, iQuery)
    private
      FQuery: TFDQuery;

      procedure PreencheQuery(Value: string);
      procedure PreencheParams(Value: array of Variant);

      constructor Create(Conn: iConnection);
      destructor Destroy; override;
    public
      class function New(Conn: iConnection): iQuery;
      procedure Query(const Statement: string; Params: array of Variant); overload;
      function Query(const Statement: Variant; Params: array of Variant): TDataSet; overload;
    end;

implementation

{ TQuery }

constructor TQuery.Create(Conn: iConnection);
begin
     FQuery := TFDQuery.Create(nil);
     FQuery.Connection := TFDConnection(Conn.Connection);
end;

destructor TQuery.Destroy;
begin
     FQuery.Free;
     inherited;
end;

class function TQuery.New(Conn: iConnection): iQuery;
begin
     Result := Self.Create(Conn);
end;

procedure TQuery.PreencheParams(Value: array of Variant);
begin
     for var i := Low(Value) to High(Value) do
     begin
          FQuery.Params.Add;
          FQuery.Params[i].Value := Value[i];
     end;
end;

procedure TQuery.PreencheQuery(Value: string);
begin
     FQuery.Close;
     FQuery.SQL.Clear;
     FQuery.SQL.Add(Value);
end;

procedure TQuery.Query(const Statement: string; Params: array of Variant);
begin
     PreencheQuery(Statement);
     PreencheParams(Params);

     FQuery.ExecSQL;
end;

function TQuery.Query(const Statement: Variant; Params: array of Variant): TDataSet;
begin
     PreencheQuery(Statement);
     PreencheParams(Params);

     FQuery.Open;
     Result := FQuery;
end;

end.
