unit mvc.utils.impl.query;

interface

uses mvc.utils.interfaces;

type
    TQuery = class(TInterfacedObject, iQuery)
    private
      FParent: TObject;

      function Fields: string;
      function Params: string;
      function NomeTabela: string;

      constructor Create(Parent: IInterface);
      destructor Destroy; override;

    public
      class function New(Parent: IInterface): iQuery;
      function Insert: string;
      function Update: string;
      function Delete: string;
      function Select: string;
    end;

implementation

uses
    System.Rtti, mvc.utils.impl.atributos, mvc.utils.impl.rttihelper, System.SysUtils;

{ TQuery }

constructor TQuery.Create(Parent: IInterface);
begin
     FParent := TObject(Parent);
end;

function TQuery.Delete: string;
begin

end;

destructor TQuery.Destroy;
begin

  inherited;
end;

function TQuery.Fields: string;
var
   lContexto: TRttiContext;
   lTipo: TRttiType;

begin
     lContexto := TRttiContext.Create;
     try
          lTipo := lContexto.GetType(FParent.ClassInfo);

          for var i in lTipo.GetFields do
          begin
               if (not i.Tem<Campo>)
               then Break;

               Result := Result + i.GetAttribute<Campo>.Name + ', ';
          end;

     finally
          Result := Copy(Result, 0, Result.Length-2);
          lContexto.Free;
     end;
end;

function TQuery.Insert: string;
begin
     Result := 'INSERT INTO ' + NomeTabela;
     Result := Result + ' (' + Fields + ') ';
     Result := Result + ' VALUES (' + Params + ');';
end;

class function TQuery.New(Parent: IInterface): iQuery;
begin
     Result := Self.Create(Parent);
end;

function TQuery.Params: string;
var
   lContexto: TRttiContext;
   lTipo: TRttiType;

begin
     lContexto := TRttiContext.Create;
     try
          lTipo := lContexto.GetType(FParent.ClassInfo);

          for var i in lTipo.GetFields do
          begin
               if (not i.Tem<Campo>)
               then Break;

               Result := Result + ':' + i.GetAttribute<Campo>.Name + ', ';
          end;

     finally
          Result := Copy(Result, 0, Result.Length-2) + ' ';
          lContexto.Free;
     end;
end;

function TQuery.Select: string;
begin

end;

function TQuery.NomeTabela: string;
var
   lContexto: TRttiContext;
   lTipo: TRttiType;

begin
     lContexto := TRttiContext.Create;
     try
          lTipo := lContexto.GetType(FParent.ClassInfo);
          if (lTipo.Tem<Tabela>)
          then Result := lTipo.GetAttribute<Tabela>.Name;

     finally
          lContexto.Free;
     end;
end;

function TQuery.Update: string;
begin

end;

end.
