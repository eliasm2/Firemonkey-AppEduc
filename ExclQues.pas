unit ExclQues;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts;

type
  TForm10 = class(TForm)
    Layout1: TLayout;
    Image2: TImage;
    Image1: TImage;
    Rectangle1: TRectangle;
    Label1: TLabel;
    toolbar: TRectangle;
    Label2: TLabel;
    procedure Image2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.fmx}

uses Multiplaescolha, vouf,Form_Principal1, DataModule;


procedure TForm10.FormShow(Sender: TObject);
begin
caption:='ProvasOn';
end;

procedure TForm10.Image1Click(Sender: TObject);
var
temp2:integer;
begin
temp2:=frm_principal1.temp;
dm.qry_geral.Active:=false;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('delete from questao where id_questao='+inttostr(frm_principal1.id_questaoitem));
dm.qry_geral.ExecSQL;
showmessage('Questão Excluída com sucesso!!!');
close;
Form7.Close;
Form4.close;
frm_principal1.Close;
frm_principal1.Show;
end;

procedure TForm10.Image2Click(Sender: TObject);
begin
close;
end;

end.
