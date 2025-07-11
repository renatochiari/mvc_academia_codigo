unit mvc.utils.impl.query;

interface

uses mvc.utils.interfaces, System.Generics.Collections;

type
    TQuery = class(TInterfacedObject, iQuery)
    private
      FParent: TObject;

      constructor Create(Parent: IInterface);

      function Fields: string;
      function Params: string;
      function Where: string;
      function TableName: string;
      function FieldsParamsUpdate: string;

    public
      class function New(Parent: IInterface): iQuery;
      procedure FieldParameter(var Value: TDictionary<string, Variant>);
      function SelectWithWhere(Value: Boolean): string;
      function Delete: string;
      function Update: string;
      function Insert: string;

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
     Result := 'DELETE FROM ' + TableName + ' WHERE ' + Where;
end;

procedure TQuery.FieldParameter(var Value: TDictionary<string, Variant>);
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

               case i.GetValue(FParent).TypeInfo.Kind of
                   tkInteger, tkInt64:
                   begin
                        if not(i.GetValue(FParent).AsInteger <= 0)
                        then Value.Add(i.GetAttribute<Campo>.Name, i.GetValue(FParent).AsInteger);
                   end;
                   tkFloat:
                   begin
                        if (i.GetValue(FParent).TypeInfo = TypeInfo(TDateTime))
                        then Value.Add(i.GetAttribute<Campo>.Name, StrToDateTime(i.GetValue(FParent).AsString));

                        if (i.GetValue(FParent).TypeInfo = TypeInfo(Currency))
                        then Value.Add(i.GetAttribute<Campo>.Name, i.GetValue(FParent).AsCurrency);
                   end;
                   tkLString, tkWString, tkUString, tkString:
                   begin
                        if (not i.GetValue(FParent).AsString.IsEmpty)
                        then Value.Add(i.GetAttribute<Campo>.Name, i.GetValue(FParent).AsString);
                   end;
                   else Value.Add(i.GetAttribute<Campo>.Name, i.GetValue(FParent).AsString);
               end;
          end;

     finally
          lContexto.Free;
     end;
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

               case i.GetValue(FParent).TypeInfo.Kind of
                   tkInteger, tkInt64:
                   begin
                        if not (i.GetValue(FParent).AsInteger <= 0)
                        then Result := Result + i.GetAttribute<Campo>.Name + ', ';
                   end;
                   tkFloat:
                   begin
                        if (i.GetValue(FParent).TypeInfo = TypeInfo(TDateTime))
                        then Result := Result + i.GetAttribute<Campo>.Name + ', ';

                        if (i.GetValue(FParent).TypeInfo = TypeInfo(Currency))
                        then Result := Result + i.GetAttribute<Campo>.Name + ', ';
                   end;
                   tkLString, tkWString, tkUString, tkString:
                   begin
                        if (not i.GetValue(FParent).AsString.IsEmpty)
                        then Result := Result + i.GetAttribute<Campo>.Name + ', ';
                   end;
                   else Result := Result + i.GetAttribute<Campo>.Name + ', ';
               end;
          end;

     finally
          Result := Copy(Result, 0, Result.Length-2);
          lContexto.Free;
     end;
end;

function TQuery.FieldsParamsUpdate: string;
var
   lContexto: TRttiContext;
   lTipo: TRttiType;

begin
     Result := '';

     lContexto := TRttiContext.Create;
     try
          lTipo := lContexto.GetType(FParent.ClassInfo);

          for var i in lTipo.GetFields do
          begin
               if (not i.Tem<Campo>)
               then Break;

               case i.GetValue(FParent).TypeInfo.Kind of
                   tkInteger, tkInt64:
                   begin
                        if not (i.GetValue(FParent).AsInteger <= 0)
                        then Result := Result + i.GetAttribute<Campo>.Name + ' = :' + i.GetAttribute<Campo>.Name + ', ';
                   end;
                   tkFloat:
                   begin
                        if (i.GetValue(FParent).TypeInfo = TypeInfo(TDateTime))
                        then Result := Result + i.GetAttribute<Campo>.Name + ' = :' + i.GetAttribute<Campo>.Name + ', ';

                        if (i.GetValue(FParent).TypeInfo = TypeInfo(Currency))
                        then Result := Result + i.GetAttribute<Campo>.Name + ' = :' + i.GetAttribute<Campo>.Name + ', ';
                   end;
                   tkLString, tkWString, tkUString, tkString:
                   begin
                        if (not i.GetValue(FParent).AsString.IsEmpty)
                        then Result := Result + i.GetAttribute<Campo>.Name + ' = :' + i.GetAttribute<Campo>.Name + ', ';
                   end;
                   else Result := Result + i.GetAttribute<Campo>.Name + ' = :' + i.GetAttribute<Campo>.Name + ', ';
               end;
          end;

     finally
          Result := Copy(Result, 0, Result.Length-2) + ' ';
          lContexto.Free;
     end;
end;

function TQuery.Insert: string;
begin
     Result := 'INSERT INTO ' + TableName;
     Result := Result + ' (' + Fields + ') ';
     Result := Result + ' VALUES (' + Params + ');';
end;

class function TQuery.New(Parent: IInterface): iQuery;
begin
     Result := Self.Create(Parent);
end;

function TQuery.Params: string;
var
   ctxRtti: TRttiContext;
   typRtti: TRttiType;
   lField: TRttiField;

begin
     ctxRtti := TRttiContext.Create;
     try
          typRtti := ctxRtti.GetType(FParent.ClassInfo);
          for var i in typRtti.GetFields do
          begin
               if (not i.Tem<Campo>)
               then Break;

               case i.GetValue(FParent).TypeInfo.Kind of
                   tkInteger, tkInt64:
                   begin
                        if not (i.GetValue(FParent).AsInteger <= 0)
                        then Result := Result + ':' + i.GetAttribute<Campo>.Name + ', ';
                   end;
                   tkFloat:
                   begin
                        if (i.GetValue(FParent).TypeInfo = TypeInfo(TDateTime))
                        then Result := Result + ':' + i.GetAttribute<Campo>.Name + ', ';

                        if (i.GetValue(FParent).TypeInfo = TypeInfo(Currency))
                        then Result := Result + ':' + i.GetAttribute<Campo>.Name + ', ';
                   end;
                   tkLString, tkWString, tkUString, tkString:
                   begin
                        if (not i.GetValue(FParent).AsString.IsEmpty)
                        then Result := Result + ':' + i.GetAttribute<Campo>.Name + ', ';
                   end;
                   else Result := Result + ':' + i.GetAttribute<Campo>.Name + ', ';
               end;
          end;

     finally
          Result := Copy(Result, 0, Length(Result) - 2) + ' ';
          ctxRtti.Free;
     end;
end;

function TQuery.SelectWithWhere(Value: Boolean): string;
begin
     Result := 'SELECT * FROM ' + TableName;
     if (not Value)
     then Exit;

     Result := Result + ' WHERE ' + Where;
end;

function TQuery.TableName: string;
var
   vCtxRtti: TRttiContext;
   vTypRtti: TRttiType;

begin
     vCtxRtti := TRttiContext.Create;
     try
          vTypRtti := vCtxRtti.GetType(FParent.ClassInfo);
          if (vTypRtti.Tem<Tabela>)
          then Result := vTypRtti.GetAttribute<Tabela>.Name;

     finally
          vCtxRtti.Free;
     end;
end;

function TQuery.Update: string;
begin
     Result := 'UPDATE ' + TableName;
     Result := Result + ' SET ' + FieldsParamsUpdate;
     Result := Result + ' WHERE ' + Where;
end;

function TQuery.Where: string;
var
   lCtxRtti: TRttiContext;
   lTipo: TRttiType;

begin
     Result := '';

     lCtxRtti := TRttiContext.Create;
     try
          lTipo := lCtxRtti.GetType(FParent.ClassInfo);
          for var i in lTipo.GetFields do
          begin
               if (not i.Tem<PK>)
               then Continue;

               Result := Result + i.GetAttribute<Campo>.Name + ' = :' + i.GetAttribute<Campo>.Name + ' AND ';
          end;
     finally
          Result := Copy(Result, 0, Length(Result) - 4) + ' ';
          lCtxRtti.Free;
     end;
end;

end.
