unit editarprova;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.ScrollBox, FMX.Memo, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation,
  FMX.StdCtrls, DataModule,Form_Login_prof;

type
  TForm5 = class(TForm)
    toolbar: TRectangle;
    Label2: TLabel;
    Image1: TImage;
    Layout7: TLayout;
    img_excluir: TImage;
    Layout1: TLayout;
    Label1: TLabel;
    Image4: TImage;
    Line2: TLine;
    memomateria: TMemo;
    Layout2: TLayout;
    Label3: TLabel;
    Image3: TImage;
    Line1: TLine;
    cbdisc: TComboBox;
    Layout3: TLayout;
    Label5: TLabel;
    Image5: TImage;
    Line3: TLine;
    Memodescricao: TMemo;
    Label4: TLabel;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure img_excluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IDPROFESSOR,tempdisc:STRING;
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

uses Form_Principal1,MsgConfExc;

procedure TForm5.FormShow(Sender: TObject);
begin
IDPROFESSOR:=Form1.edt_login.Text;
dm.qry_geral.Active := false;
//dm.qry_t.Active := false;
dm.qry_prof.Active:=false;
dm.qry_geral.sql.Clear;
dm.qry_prof.sql.Clear;
dm.qry_prof.sql.Add('SELECT ID_PROFESSOR FROM PROFESSOR WHERE LOGIN='+IDPROFESSOR);
dm.qry_prof.Active:=true;
IDPROFESSOR:=dm.qry_prof.FieldByName('ID_PROFESSOR').AsString;


dm.qry_geral.Active:=false;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select disciplina from avaliacao where id_professor='+idprofessor);
dm.qry_geral.Open;
if not dm.qry_geral.Eof then
  begin
  dm.qry_geral.First;
  while not dm.qry_geral.eof do
    begin
    tempdisc:=dm.qry_geral.FieldByName('disciplina').AsString;
    if cbdisc.Items.IndexOf(tempdisc) =-1 then
    cbdisc.Items.Add(tempdisc);
    dm.qry_geral.Next;
    end;



  end;

dm.qry_geral.Active:=false;
dm.qry_geral.sql.Clear;
frm_principal1.temp:=frm_principal1.temp+1;
dm.qry_geral.SQL.Add('select materia,descricao,disciplina from avaliacao where id_avaliacao='+inttostr(frm_principal1.id_prova));
dm.qry_geral.Active:=true;
memodescricao.Text:=dm.qry_geral.FieldByName('descricao').AsString;
memomateria.Text:=dm.qry_geral.FieldByName('materia').AsString;
//cbdisC.Selected.Text:=dm.qry_geral.FieldByName('disciplina').AsString;

end;

procedure TForm5.Image1Click(Sender: TObject);
var tempp:integer;

begin
tempp:=frm_principal1.id_prova;
tempdisc:=cbdisc.Selected.Text;
dm.qry_geral.Active:=false;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update avaliacao set descricao='+quotedstr(memodescricao.Text)+', materia='+quotedstr(memomateria.Text)+',disciplina='+quotedstr(tempdisc)+' where id_avaliacao= '+inttostr(tempp));
dm.qry_geral.ExecSQL;
showmessage('Prova atualizada com sucesso!!!');
frm_principal1.Close;
frm_principal1.Show;
end;

procedure TForm5.img_excluirClick(Sender: TObject);
begin
Form_msg1.Show;
end;

end.
