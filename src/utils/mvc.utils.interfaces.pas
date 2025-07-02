unit mvc.utils.interfaces;

interface

uses
  System.Generics.Collections;

type
    iQuery = interface
      procedure FieldParameter(var Value: TDictionary<string, Variant>);
      function SelectWithWhere(Value: Boolean): string;
      function Delete: string;
      function Update: string;
      function Insert: string;
    end;

    iUtils = interface
      function Query: iQuery;
    end;

implementation

end.
