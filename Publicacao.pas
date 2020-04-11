unit Publicacao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.ScrollBox, FMX.Memo, FMX.Objects, FMX.Layouts, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.DateTimeCtrls, DataModule, Form_Principal1,
  selecionarquestoes;

type
  TForm9 = class(TForm)
    toolbar: TRectangle;
    Label2: TLabel;
    Image1: TImage;
    Image3: TImage;
    Layout1: TLayout;
    Label1: TLabel;
    Image4: TImage;
    Line2: TLine;
    memomateria: TMemo;
    Layout2: TLayout;
    Label3: TLabel;
    Image2: TImage;
    Line1: TLine;
    cbdisc: TComboBox;
    Layout3: TLayout;
    Label4: TLabel;
    Image5: TImage;
    Line3: TLine;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    Label5: TLabel;
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idpublicacao,idprova,IDTURMA:integer;
    tempdisc:string;
    valortotal:double;
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}


procedure TForm9.FormShow(Sender: TObject);
begin
caption:='ProvasOn';
dm.qry_geral.Active:=false;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select NOME from turma');
dm.qry_geral.Open;
if not dm.qry_geral.Eof then
  begin
  dm.qry_geral.First;
  while not dm.qry_geral.eof do
    begin
    tempdisc:=dm.qry_geral.FieldByName('NOME').AsString;
    if cbdisc.Items.IndexOf(tempdisc) =-1 then
    cbdisc.Items.Add(tempdisc);
    dm.qry_geral.Next;
    end;



  end;
end;

procedure TForm9.Image1Click(Sender: TObject);
begin
if dateedit1.text ='' then
begin
showmessage('Informe uma data válida');
exit
end;
if dateedit2.text ='' then
begin
showmessage('Informe uma data válida');
exit
end;

if dateedit1.date>dateedit2.date then
begin
showmessage('Data Inicial maior que a Data Final');
exit
end;


dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select max(id_publicacao) as id from publicacao');
dm.qry_geral.Open();
idpublicacao:=dm.qry_geral.FieldByName('id').AsInteger + 1;

dm.qry_geral.SQL.Clear;

dm.qry_geral.sql.Add('insert into publicacao (id_publicacao,datapublicacao,datafim,datainicio,valorprova,id_avaliacao,id_turma)');
dm.qry_geral.sql.Add('Values(:id_publicacao,:datapublicacao,:datafim,:datainicio,:valorprova,:id_avaliacao,:id_turma)');

tempdisc:=cbdisc.Selected.Text;
dm.qry_prof.Close;
dm.qry_prof.SQL.Clear;
dm.qry_prof.SQL.Add('select id_turma from turma where NOME=' +quotedstr(TEMPDISC));
dm.qry_prof.Open();
IDTURMA:=dm.qry_prof.FieldByName('id_turma').AsInteger;
dm.qry_prof.SQL.Clear;
dm.qry_prof.Close;


dm.qry_geral.Params.ParamByName('id_publicacao').Value := idpublicacao;
dm.qry_geral.Params.ParamByName('datapublicacao').Asdatetime := now;
dm.qry_geral.Params.ParamByName('datafim').Asdatetime := dateedit2.DateTime;
dm.qry_geral.Params.ParamByName('datainicio').Asdatetime :=dateedit1.DateTime ;
dm.qry_geral.Params.ParamByName('valorprova').Value := memomateria.Text;
valortotal:=strtofloat(memomateria.Text);
dm.qry_geral.Params.ParamByName('id_avaliacao').Value := Frm_Principal1.id_prova;
dm.qry_geral.Params.ParamByName('id_turma').Value := IDTURMA;

dm.qry_geral.ExecSQL;

dm.qry_geral.sql.Clear;

   {
dm.qry_prof.Close;
dm.qry_prof.sql.Clear;

dm.qry_prof.SQL.Add('select max(id_prova) as id from prova');
dm.qry_prof.Open();
idprova:=dm.qry_prof.FieldByName('id').AsInteger + 1;

dm.qry_geral.sql.Clear;

dm.qry_geral.sql.Add('insert into prova (id_prova,dataprova,id_avaliacao,id_publicacao)');
dm.qry_geral.sql.Add('Values(:id_prova,:dataprova,:id_avaliacao,:id_publicacao)');

dm.qry_geral.Params.ParamByName('id_prova').Value := idprova;
dm.qry_geral.Params.ParamByName('dataprova').Asdatetime := now;
dm.qry_geral.Params.ParamByName('id_avaliacao').Value := Frm_Principal1.id_prova;
dm.qry_geral.Params.ParamByName('id_publicacao').Value := idpublicacao;



dm.qry_geral.ExecSQL;  }

form12.show;


end;

end.
