unit mvc.controller.imple.controller;

interface

uses mvc.controller.interfaces, mvc.model.entity.interfaces,
  mvc.model.dao.interfaces, mvc.model.entity.impl.entity,
  mvc.model.dao.impl.daogenerico;

type
    TController = class(TInterfacedObject, iController)
    private
      FEntity: iEntity;
      FDao: iDAO;

    public
      constructor Create;
      destructor Destroy; override;
      class function New: iController;
      function Entity: iEntity;
      function Dao(Value: IInterface): iDAO;
    end;

implementation

{ TController }

constructor TController.Create;
begin

end;

function TController.Dao(Value: IInterface): iDAO;
begin
     if (not Assigned(FDao))
     then FDao := TDAO.New(Value);

     Result := FDao;
end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.Entity: iEntity;
begin
     if (not Assigned(FEntity))
     then FEntity := TEntity.New;

     Result := FEntity;
end;

class function TController.New: iController;
begin
     Result := Self.Create;
end;

end.
