unit mvc.model.dao.impl.daogenerico;

interface

uses mvc.model.dao.interfaces, Data.DB, mvc.model.connection.interfaces,
  mvc.model.connection.impl.firedac, System.Generics.Collections;

type
    TDAO = class(TInterfacedObject, iDAO)
    private
      FParent: IInterface;

      FConexao: iConnection;
      FQuery: iQuery;
      FDataSet: TDataSet;
      FLista: TDictionary<string, Variant>;

    public
      constructor Create(Parent: IInterface);
      destructor Destroy; override;
      class function New(Parent: IInterface): iDAO;
      function Listar: iDAO;
      function ListarPorId: iDAO;
      function Excluir: iDAO;
      function Atualizar: iDAO;
      function Inserir: iDAO;
      function DataSet: TDataSet;

    end;

implementation

uses
  mvc.model.connection.impl.query;

{ TDAO<T> }

function TDAO.Atualizar: iDAO;
begin

end;

constructor TDAO.Create(Parent: IInterface);
begin
     FParent := Parent;
     FConexao := TConnectionFiredac.New;
     FQuery := TQuery.New(FConexao);
     FDataSet := TDataSet.Create(nil);
     FLista := TDictionary<string, Variant>.Create;

end;

function TDAO.DataSet: TDataSet;
begin

end;

destructor TDAO.Destroy;
begin

  inherited;
end;

function TDAO.Excluir: iDAO;
begin

end;

function TDAO.Inserir: iDAO;
begin

end;

function TDAO.Listar: iDAO;
begin

end;

function TDAO.ListarPorId: iDAO;
begin

end;

class function TDAO.New(Parent: IInterface): iDAO;
begin
     Result := Self.Create(Parent);
end;

end.
