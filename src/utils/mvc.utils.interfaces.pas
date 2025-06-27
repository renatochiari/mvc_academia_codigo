unit mvc.utils.interfaces;

interface

type
    iQuery = interface
      function Insert: string;
      function Update: string;
      function Delete: string;
      function Select: string;
    end;

    iUtils = interface
      function Query: iQuery;
    end;

implementation

end.
