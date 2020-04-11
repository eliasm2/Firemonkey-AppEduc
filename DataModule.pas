unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, Data.FMTBcd, Data.SqlExpr,
  Datasnap.DBClient;

type
  Tdm = class(TDataModule)
    conn: TFDConnection;
    qry_geral: TFDQuery;
    qry_prof: TFDQuery;
    qry_t: TFDQuery;
    SQLQuery1: TSQLQuery;
    ClientDataSet1: TClientDataSet;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
        with Conn do
        begin

                {$IFDEF IOS}
                Params.Values['DriverID'] := 'SQLite';
                try
                        Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'educ0.db');
                        Connected := true;
                except on E:Exception do
                        raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
                end;
                {$ENDIF}

                {$IFDEF ANDROID}
                Params.Values['DriverID'] := 'SQLite';
                try
                        Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'educ.db');
                        Connected := true;
                except on E:Exception do
                        raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
                end;
                {$ENDIF}

                {$IFDEF MSWINDOWS}
                try
                        Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\DB\educ.db';
                        Connected := true;
                except on E:Exception do
                        raise Exception.Create('Erro de conexão com o banco de dados: ' + E.Message);
                end;
                {$ENDIF}
        end;
end;

end.

