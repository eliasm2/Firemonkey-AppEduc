unit Form_Provas;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ScrollBox, FMX.Memo,
  FMX.ListBox, questoes, Umessages;

type
  Tfrmprovas = class(TForm)
    StyleBook1: TStyleBook;
    toolbar: TRectangle;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Layout2: TLayout;
    Label3: TLabel;
    Image3: TImage;
    Line1: TLine;
    Layout1: TLayout;
    Label1: TLabel;
    Image4: TImage;
    lbldisciplina: TLabel;
    Line2: TLine;
    Layout3: TLayout;
    Label5: TLabel;
    Image5: TImage;
    lbldescricao: TLabel;
    Line3: TLine;
    memomateria: TMemo;
    Memodescricao: TMemo;
    cbdisc: TComboBox;
    procedure Image2Click(Sender: TObject);
    procedure lblmateriaClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure lbldisciplinaClick(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure lbldescricaoClick(Sender: TObject);
    procedure Image5Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure img_excluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    modo,tempdisc,IDPROFESSOR,comp: string;
    IDAVALIACAO:integer;


  end;

var
  frmprovas: Tfrmprovas;
   I: word;
   TEMP2:string;

implementation

{$R *.fmx}

uses Form_Principal1, Form_Principal, DataModule, Form_Login_prof;

procedure Tfrmprovas.FormShow(Sender: TObject);
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

dm.qry_geral.SQL.Add('select nome from turma');
dm.qry_geral.Open;
if not dm.qry_geral.Eof then
  begin
  dm.qry_geral.First;
  while not dm.qry_geral.eof do
    begin
    tempdisc:=dm.qry_geral.FieldByName('nome').AsString;
    if cbdisc.Items.IndexOf(tempdisc) =-1 then
    cbdisc.Items.Add(tempdisc);
    dm.qry_geral.Next;
    end;



  end;
  end;

procedure tfrmprovas.Image1Click(Sender: TObject);
begin
dm.qry_geral.Active := false;
//dm.qry_t.Active := false;
dm.qry_prof.Active:=false;
dm.qry_geral.sql.Clear;
dm.qry_prof.sql.Clear;
//dm.qry_t.sql.Clear;
IDPROFESSOR:=Form1.edt_login.Text;
dm.qry_geral.sql.Add('SELECT MAX(ID_AVALIACAO) AS ID FROM AVALIACAO' );
dm.qry_prof.sql.Add('SELECT ID_PROFESSOR FROM PROFESSOR WHERE LOGIN='+IDPROFESSOR);

dm.qry_geral.Active := true;
dm.qry_prof.Active:=true;
//dm.qry_t.Active := true;
//irei fazer o incremento de prova

IDAVALIACAO:=dm.qry_geral.FieldByName('ID').AsInteger + 1;
IDPROFESSOR:=dm.qry_prof.FieldByName('ID_PROFESSOR').AsString;

dm.qry_geral.SQL.Clear;
dm.qry_geral.sql.Add('insert into Avaliacao (Disciplina,Materia,Id_avaliacao,Id_professor,descricao)');
dm.qry_geral.sql.Add('Values(:DISCIPLINA,:MATERIA,:IDAVALIACAO,:IDPROFESSOR,:DESCRICAO)');

//dm.qry_geral.Active := true;
//dm.qry_prof.Active:=true;
tempdisc:=cbdisc.Selected.Text;
dm.qry_geral.Params.ParamByName('DISCIPLINA').Value := tempdisc;
dm.qry_geral.Params.ParamByName('MATERIA').Value := memomateria.Text;
dm.qry_geral.Params.ParamByName('IDAVALIACAO').Value := IDAVALIACAO;
dm.qry_geral.Params.ParamByName('IDPROFESSOR').Value := IDPROFESSOR;
dm.qry_geral.Params.ParamByName('DESCRICAO').Value := memodescricao.Text;



dm.qry_geral.ExecSQL;
dm.conn.Commit;

showmessage('Prova criada com sucesso!');
//memodisciplina.Text:='';
memomateria.Text:='';
memodescricao.Text:='';
CLOSE;
Form_msg.Show;
end;

procedure Tfrmprovas.Image2Click(Sender: TObject);
begin
CLOSE;
Frm_principal1.Close;
frm_principal1.Show;
end;

procedure Tfrmprovas.Image3Click(Sender: TObject);
begin
memomateria.visible:=true;
end;

procedure Tfrmprovas.Image4Click(Sender: TObject);
begin
//memodisciplina.visible:=true;
end;

procedure Tfrmprovas.Image5Click(Sender: TObject);
begin
memodescricao.visible:=true;
end;

procedure Tfrmprovas.img_excluirClick(Sender: TObject);
begin
CLOSE;
end;

procedure Tfrmprovas.lbldescricaoClick(Sender: TObject);
begin
memodescricao.visible:=true;
end;

procedure Tfrmprovas.lbldisciplinaClick(Sender: TObject);
begin
memomateria.visible:=true;
end;

procedure Tfrmprovas.lblmateriaClick(Sender: TObject);
begin
memomateria.visible:=true;
end;

end.
