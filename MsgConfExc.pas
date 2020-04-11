unit MsgConfExc;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Umessages, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, DataModule,
  Form_Principal1, editarprova;

type
  TForm_msg1 = class(TForm_msg)
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_msg1: TForm_msg1;

implementation

{$R *.fmx}

procedure TForm_msg1.FormShow(Sender: TObject);
begin
  inherited;
label2.Text:='Deseja excluir a prova?';
label1.Text:='';
end;

procedure TForm_msg1.Image1Click(Sender: TObject);
var
temp2:integer;
begin
//  inherited;
temp2:=frm_principal1.temp;
dm.qry_geral.Active:=false;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('delete from avaliacao where id_avaliacao='+inttostr(temp2));
dm.qry_geral.ExecSQL;
showmessage('Prova Excluída com sucesso!!!');
close;
Form5.Close;
frm_principal1.Close;
frm_principal1.Show;
end;

procedure TForm_msg1.Image2Click(Sender: TObject);
begin
 // inherited;
close;
end;

end.
