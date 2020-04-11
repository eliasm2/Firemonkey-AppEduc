unit Multiplaescolha;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.StdCtrls, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation,
  DataModule;

type
  TForm7 = class(TForm)
    toolbar: TRectangle;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Layout1: TLayout;
    Label3: TLabel;
    groupquestao: TGroupBox;
    Layout2: TLayout;
    Memo2: TMemo;
    CheckBox1: TCheckBox;
    Layout3: TLayout;
    CheckBox3: TCheckBox;
    Layout4: TLayout;
    CheckBox4: TCheckBox;
    Layout5: TLayout;
    CheckBox5: TCheckBox;
    Memo1: TMemo;
    Layout6: TLayout;
    Layout7: TLayout;
    Memo3: TMemo;
    Layout8: TLayout;
    Layout9: TLayout;
    Memo5: TMemo;
    Layout10: TLayout;
    img_excluir: TImage;
    Label4: TLabel;
    Memo6: TMemo;
    Label1: TLabel;
    Layout11: TLayout;
    CheckBox2: TCheckBox;
    Layout12: TLayout;
    Memo7: TMemo;
    Label5: TLabel;
    Memo4: TMemo;
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure img_excluirClick(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    temp,tempidava,idquestao: integer;
    verdadeira:boolean;


  end;

var
  Form7: TForm7;


implementation

{$R *.fmx}

uses Form_Provas,Form_Principal1,ExclQues;

procedure TForm7.CheckBox1Change(Sender: TObject);
begin
if checkbox1.IsChecked then
begin
checkbox3.IsChecked:=false;
checkbox4.IsChecked:=false;
checkbox5.IsChecked:=false;
checkbox2.IsChecked:=false;
end;
end;



procedure TForm7.CheckBox2Change(Sender: TObject);
begin
if checkbox2.IsChecked then
begin
checkbox1.IsChecked:=false;
checkbox4.IsChecked:=false;
checkbox5.IsChecked:=false;
checkbox3.IsChecked:=false;
end;
end;

procedure TForm7.CheckBox3Change(Sender: TObject);
begin
if checkbox3.IsChecked then
begin
checkbox1.IsChecked:=false;
checkbox4.IsChecked:=false;
checkbox5.IsChecked:=false;
checkbox2.IsChecked:=false;
end;
end;

procedure TForm7.CheckBox4Change(Sender: TObject);
begin
if checkbox4.IsChecked then
begin
checkbox1.IsChecked:=false;
checkbox3.IsChecked:=false;
checkbox5.IsChecked:=false;
checkbox2.IsChecked:=false;
end;
end;

procedure TForm7.CheckBox5Change(Sender: TObject);
begin
if checkbox5.IsChecked then
begin
checkbox1.IsChecked:=false;
checkbox4.IsChecked:=false;
checkbox3.IsChecked:=false;
checkbox2.IsChecked:=false;
end;
end;


procedure TForm7.FormShow(Sender: TObject);
begin
if frm_principal1.modo=0 then
begin
memo1.Text:='';
memo2.Text:='';
memo3.Text:=''  ;
memo4.Text:='' ;
memo5.Text:=''  ;
memo6.Text:=''  ;
memo7.Text:=''  ;
checkbox2.IsChecked:=false;
checkbox1.IsChecked:=false;
checkbox3.IsChecked:=false;
checkbox4.IsChecked:=false;
checkbox5.IsChecked:=false;
img_excluir.Visible:=false;
label5.Visible:=false;
end
else
begin
img_excluir.Visible:=true;
label4.Visible:=true;
caption:='ProvasOn';
end;
end;

procedure TForm7.Image1Click(Sender: TObject);
var tempminimo:integer;
begin
if checkbox1.IsChecked=true then
begin
temp:=1;
end
else if checkbox3.IsChecked=true then
begin
temp:=2;
end
else if checkbox4.IsChecked=true then
begin
temp:=3;
end
else if checkbox2.IsChecked=true then
begin
temp:=5;
end
else if checkbox5.IsChecked=true then
begin
temp:=4;
end;

if frm_principal1.modo=1 then begin
//tempidava:= frmprovas.IDAVALIACAO;
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update questao set Tema_Questao='+quotedstr(memo6.Text)+ ', enunciado='+quotedstr(memo1.Text)+', respcor ='+inttostr(temp)+' where id_questao='+inttostr(frm_principal1.id_questaoitem));
dm.qry_geral.ExecSQL;
dm.qry_geral.sql.Clear;
showmessage('Questão Múltipla escolha Atualizada com sucesso');



if temp=1 then
begin

dm.qry_prof.SQL.Clear;
dm.qry_prof.Close;
dm.qry_prof.SQL.Add('select MIN(ID_OPCAOAVALIACAO) d, descricao from opcaoavaliacao where id_questao = :id' );
dm.qry_prof.Params.ParamByName('id').Value := frm_principal1.id_questaoitem;
dm.qry_prof.Open();
tempminimo:=dm.qry_prof.FieldByName('d').Asinteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo2.text)+', verdadeira= true where id_opcaoavaliacao='+inttostr(tempminimo));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo3.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+1));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo4.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+2));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo5.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+3));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo7.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+4));
dm.qry_geral.ExecSQL;
end
else if temp=2 then
begin
dm.qry_prof.SQL.Clear;
dm.qry_prof.Close;
dm.qry_prof.SQL.Add('select MIN(ID_OPCAOAVALIACAO) d, descricao from opcaoavaliacao where id_questao = :id' );
dm.qry_prof.Params.ParamByName('id').Value := frm_principal1.id_questaoitem;
dm.qry_prof.Open();
tempminimo:=dm.qry_prof.FieldByName('d').Asinteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo2.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo3.text)+', verdadeira= true where id_opcaoavaliacao='+inttostr(tempminimo+1));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo4.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+2));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo5.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+3));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo7.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+4));
dm.qry_geral.ExecSQL;
end
else if temp=3 then
begin
dm.qry_prof.SQL.Clear;
dm.qry_prof.Close;
dm.qry_prof.SQL.Add('select MIN(ID_OPCAOAVALIACAO) d, descricao from opcaoavaliacao where id_questao = :id' );
dm.qry_prof.Params.ParamByName('id').Value := frm_principal1.id_questaoitem;
dm.qry_prof.Open();
tempminimo:=dm.qry_prof.FieldByName('d').Asinteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo2.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo3.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+1));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo4.text)+', verdadeira= true where id_opcaoavaliacao='+inttostr(tempminimo+2));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo5.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+3));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo7.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+4));
dm.qry_geral.ExecSQL;
end
else if temp=5 then
begin
dm.qry_prof.SQL.Clear;
dm.qry_prof.Close;
dm.qry_prof.SQL.Add('select MIN(ID_OPCAOAVALIACAO) d, descricao from opcaoavaliacao where id_questao = :id' );
dm.qry_prof.Params.ParamByName('id').Value := frm_principal1.id_questaoitem;
dm.qry_prof.Open();
tempminimo:=dm.qry_prof.FieldByName('d').Asinteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo2.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo3.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+1));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo4.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+2));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo5.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+3));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo7.text)+', verdadeira= true where id_opcaoavaliacao='+inttostr(tempminimo+4));
dm.qry_geral.ExecSQL;
end
else if temp=4 then
begin
dm.qry_prof.SQL.Clear;
dm.qry_prof.Close;
dm.qry_prof.SQL.Add('select MIN(ID_OPCAOAVALIACAO) d, descricao from opcaoavaliacao where id_questao = :id' );
dm.qry_prof.Params.ParamByName('id').Value := frm_principal1.id_questaoitem;
dm.qry_prof.Open();
tempminimo:=dm.qry_prof.FieldByName('d').Asinteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo2.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo3.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+1));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo4.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+2));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo5.text)+', verdadeira= true where id_opcaoavaliacao='+inttostr(tempminimo+3));
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update opcaoavaliacao set descricao ='+quotedstr(memo7.text)+', verdadeira= false where id_opcaoavaliacao='+inttostr(tempminimo+4));
dm.qry_geral.ExecSQL;
end;
close;
frm_principal1.Close;
frm_principal1.Show;
exit ;
end;




dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.sql.Add('SELECT MAX(id_questao) AS ID FROM questao');
dm.qry_geral.Open;
idquestao:=dm.qry_geral.FieldByName('ID').AsInteger + 1;
dm.qry_geral.SQL.Clear;

if frmprovas.IDAVALIACAO<>0 then
begin
tempidava:= frmprovas.IDAVALIACAO;
dm.qry_geral.close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into questao (id_questao,tipo,Tema_Questao,enunciado,respcor,id_avaliacao) values('+inttostr(idquestao)+','+'2,'+quotedstr(memo6.Text)+','+quotedstr(memo1.Text)+','+inttostr(temp)+','+inttostr(tempidava)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.sql.Clear;
showmessage('Questão Múltipla escolha salva com sucesso');
end
else
begin
dm.qry_geral.close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into questao (id_questao,tipo,Tema_Questao,enunciado,respcor) values('+inttostr(idquestao)+','+'2,'+quotedstr(memo6.Text)+','+quotedstr(memo1.Text)+','+inttostr(temp)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.sql.Clear;
showmessage('Questão Múltipla escolha salva com sucesso');
end;



if temp=1 then
begin
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo2.text)+','+'true,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo3.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo4.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo5.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo7.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
end
else if temp=2 then
begin
verdadeira:=true;
dm.qry_geral.Close;
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo3.text)+','+'true,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo2.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo4.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo5.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo7.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
end
else if temp=3 then
begin
verdadeira:=true;
dm.qry_geral.Close;
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo4.text)+','+'true,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo3.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo2.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo5.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo7.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
end
else if temp=4 then
begin
verdadeira:=true;
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo5.text)+','+'true,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo3.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo4.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo2.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo7.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
end
else if temp=5 then
begin
verdadeira:=true;
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo5.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo3.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo4.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo2.text)+','+'false,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into opcaoavaliacao (descricao,verdadeira,id_questao) values('+quotedstr(memo7.text)+','+'true,'+inttostr(idquestao)+')');
dm.qry_geral.ExecSQL;
end;

{
frm_principal1.TabPedido.Visible:=false;
frm_principal1.img_tab_pedido.Opacity := 0.2;
frm_principal1.TabCliente.Visible:=true;
frm_principal1.img_tab_cliente.Opacity := 1;
frm_principal1.lbl_tab_cliente.FontColor := $FF4D7EC3; }
close;
frm_principal1.Close;
frm_principal1.Show;
end;

procedure TForm7.Image2Click(Sender: TObject);
begin
close;
end;

procedure TForm7.img_excluirClick(Sender: TObject);
begin
form10.Show;
end;

end.
