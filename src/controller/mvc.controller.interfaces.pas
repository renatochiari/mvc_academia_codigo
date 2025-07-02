unit mvc.controller.interfaces;

interface

uses mvc.model.entity.interfaces, mvc.model.dao.interfaces;

type
    iController = interface
      function Entity: iEntity;
      function Dao(Value: IInterface): iDAO;
    end;

implementation

end.
