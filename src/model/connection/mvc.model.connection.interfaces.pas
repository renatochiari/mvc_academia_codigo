unit mvc.model.connection.interfaces;

interface

uses
    Data.DB, System.Generics.Collections;

type
    iConnection = interface
      function Connection: TCustomConnection;
    end;

    iQuery = interface
      procedure Query(const Statement: String; const Params: Array of Variant); overload;
      function OneAll(const Statement: Variant; const Params: Array of Variant): TDataSet; overload;
      procedure Query(const Statement: String; const Params: TDictionary<String, Variant>); overload;
      function OneAll(const Statement: String; const Params: TDictionary<String, Variant>): TDataSet; overload;
    end;

    iConfiguration = interface
      function GetProtocolo: string;
      function SetServidor(const Value: string): iConfiguration;
      function GetServidor: string;
      function SetPorta(const Value: Integer): iConfiguration;
      function GetPorta: Integer;
      function SetUsuario(const Value: string): iConfiguration;
      function GetUsuario: string;
      function SetSenha(const Value: string): iConfiguration;
      function GetSenha: string;
      function SetCaminho(const Value: string): iConfiguration;
      function GetCaminho: string;
      function SetDriverName(const Value: string): iConfiguration;
      function GetDriverName: string;
    end;

implementation

end.
