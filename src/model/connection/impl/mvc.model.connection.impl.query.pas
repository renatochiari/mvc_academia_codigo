unit mvc.model.connection.impl.query;

interface

uses mvc.model.connection.interfaces, Data.DB, FireDAC.Comp.Client, System.Generics.Collections;

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
      procedure Query(const Statement: String; const Params: Array of Variant); overload;
      function OneAll(const Statement: Variant; const Params: Array of Variant): TDataSet; overload;
      procedure Query(const Statement: String; const Params: TDictionary<String, Variant>); overload;
      function OneAll(const Statement: String; const Params: TDictionary<String, Variant>): TDataSet; overload;
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

function TQuery.OneAll(const Statement: Variant; const Params: array of Variant): TDataSet;
begin
     PreencheQuery(Statement);
     PreencheParams(Params);

     FQuery.Open;
     Result := FQuery;
end;

function TQuery.OneAll(const Statement: String; const Params: TDictionary<String, Variant>): TDataSet;
begin
     FQuery.SQL.Add(Statement);

     for var I in Params.Keys do
     begin
          if not (FQuery.Params.FindParam(I) = nil)
          then FQuery.ParamByName(I).Value := Params.Items[I];
     end;

     FQuery.Open();
     Result := FQuery;
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

procedure TQuery.Query(const Statement: String; const Params: TDictionary<String, Variant>);
begin
     FQuery.SQL.Add(Statement);

     for var I in Params.Keys do
     begin
          if not (FQuery.Params.FindParam(I) = nil)
          then FQuery.ParamByName(I).Value := Params.Items[I];
     end;

     FQuery.ExecSQL;
end;

procedure TQuery.Query(const Statement: String; const Params: Array of Variant);
begin
     PreencheQuery(Statement);
     PreencheParams(Params);

     FQuery.ExecSQL;
end;

end.
