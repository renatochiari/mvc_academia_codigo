unit mvc.model.connection.impl.firedac;

interface

uses
    Data.DB, Datasnap.DBClient, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
    FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
    FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
    FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat,
    mvc.model.connection.interfaces, System.SysUtils;

type
    TConnectionFiredac = class(TInterfacedObject, iConnection)
    private
      FConn: TFDConnection;
      FConf: iConfiguration;

      constructor Create;
      destructor Destroy; override;
    public
      class function New: iConnection;
      function Connection: TCustomConnection;
    end;

implementation

{ TConnectionFiredac }

uses mvc.model.connection.impl.configuration;

function TConnectionFiredac.Connection: TCustomConnection;
begin
     Result := FConn;
end;

constructor TConnectionFiredac.Create;
begin
     FConn := TFDConnection.Create(nil);
     FConf := TConfiguration.New(ExtractFilePath(ParamStr(0)));

     try
          FConn.Params.Clear;
          FConn.Params.DriverID := FConf.GetDriverName;
          FConn.Params.UserName := FConf.GetUsuario;
          FConn.Params.Password := FConf.GetSenha;

          if (FConf.GetDriverName.Equals('SQLite'))
          then FConn.Params.Add('LockingMode=Normal');

     except
          raise Exception.Create('Erro ao tentar conectar com o banco de dados');
     end;
end;

destructor TConnectionFiredac.Destroy;
begin
     FConn.Free;
     inherited;
end;

class function TConnectionFiredac.New: iConnection;
begin
     Result := Self.Create;
end;

end.
