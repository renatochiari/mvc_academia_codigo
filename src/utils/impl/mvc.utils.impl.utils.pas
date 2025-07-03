unit mvc.utils.impl.utils;

interface

uses mvc.utils.interfaces, mvc.utils.impl.query;

type
  TUtils = class(TInterfacedObject, iUtils)
  private
    FParent: IInterface;
    FQuery: iQuery;

  public
    constructor Create(Parent: IInterface);
    destructor Destroy; override;
    class function New(Parent: IInterface): iUtils;
    function Query: iQuery;

  end;

implementation

{ TUtils }

constructor TUtils.Create(Parent: IInterface);
begin
     FParent := Parent;
end;

destructor TUtils.Destroy;
begin

     inherited;
end;

class function TUtils.New(Parent: IInterface): iUtils;
begin
     Result := Self.Create(Parent);
end;

function TUtils.Query: iQuery;
begin
     if not Assigned(FQuery)
     then FQuery := TQuery.New(FParent);

     Result := FQuery;
end;

end.
