unit vouf;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,
  DataModule, ExclQues;

type
  TForm4 = class(TForm)
    Layout1: TLayout;
    Label3: TLabel;
    groupquestao: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Memo1: TMemo;
    toolbar: TRectangle;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Layout10: TLayout;
    img_excluir: TImage;
    Label4: TLabel;
    Label1: TLabel;
    Memo2: TMemo;
    procedure Image1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure img_excluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    temp:integer;
    tempidava:integer;
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

uses form_provas,Form_Principal1;

procedure TForm4.FormShow(Sender: TObject);
begin
if frm_principal1.modo=0 then
begin
caption:='ProvasOn';
memo1.Text:='';
memo2.Text:='';
checkbox1.IsChecked:=false;
checkbox2.IsChecked:=false;
img_excluir.Visible:=false;
label4.Visible:=false;
end
else
begin
caption:='ProvasOn';
img_excluir.Visible:=true;;
label4.Visible:=true;
end;
end;

procedure TForm4.CheckBox1Change(Sender: TObject);
begin
if checkbox1.IsChecked then
begin
checkbox2.IsChecked:=false;
end;
end;

procedure TForm4.CheckBox1Click(Sender: TObject);
begin
//checkbox1.IsChecked:=true;
if checkbox1.IsChecked then
begin
checkbox2.IsChecked:=false;
end;
end;


procedure TForm4.CheckBox2Change(Sender: TObject);
begin
if checkbox2.IsChecked then
begin
checkbox1.IsChecked:=false;
end;
end;

procedure TForm4.CheckBox2Click(Sender: TObject);
begin
//checkbox2.IsChecked:=true;
if checkbox2.IsChecked then
begin
checkbox1.IsChecked:=false;
end;
end;


procedure TForm4.Image1Click(Sender: TObject);
begin

if frm_principal1.modo=1 then begin

if checkbox1.IsChecked=true then
begin
checkbox2.IsChecked:=false;
temp:=1;
end
else if checkbox2.IsChecked=true then
begin
checkbox1.IsChecked:=false;
temp:=2;
end
else
begin
showmessage('Escolha pelo menos uma opção!!!');
end;

dm.qry_geral.close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('update questao set Tema_questao= '+quotedstr(memo2.Text)+',enunciado='+quotedstr(memo1.Text)+', verdadeira='+inttostr(temp)+' where id_questao='+inttostr(frm_principal1.id_questaoitem));
dm.qry_geral.ExecSQL;
dm.qry_geral.sql.Clear;
showmessage('Prova Atualizada com sucesso');
close;
frm_principal1.Close;
frm_principal1.Show;

exit;

end;

if checkbox1.IsChecked=true then
begin
checkbox2.IsChecked:=false;
temp:=1;
end
else if checkbox2.IsChecked=true then
begin
checkbox1.IsChecked:=false;
temp:=2;
end
else
begin
showmessage('Escolha pelo menos uma opção!!!');
exit    ;
end;

if frmprovas.IDAVALIACAO<>0 then
begin
tempidava:= frmprovas.IDAVALIACAO;
dm.qry_geral.close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into questao (tipo,Tema_Questao,enunciado,verdadeira,id_avaliacao) values(1,'+quotedstr(memo2.Text)+','+quotedstr(memo1.Text)+','+inttostr(temp)+','+inttostr(tempidava)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.sql.Clear;
showmessage('Prova criada com sucesso');
close;
frm_principal1.Close;
frm_principal1.Show;
end
else
begin
dm.qry_geral.close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('insert into questao (tipo,Tema_Questao,enunciado,verdadeira) values(1,'+quotedstr(memo2.Text)+','+quotedstr(memo1.Text)+','+inttostr(temp)+')');
dm.qry_geral.ExecSQL;
dm.qry_geral.sql.Clear;
showmessage('Prova criada com sucesso');
close;
frm_principal1.Close;
frm_principal1.Show;

{
frm_principal1.tab_pedido.Visible := false;
frm_principal1.img_tab_pedido.Opacity := 0.2;
frm_principal1.tab_cliente.Visible := false;
frm_principal1.img_tab_cliente.Opacity := 1;
frm_principal1.lbl_tab_cliente.FontColor := $FF4D7EC3;    }
end;
end;

procedure TForm4.Image2Click(Sender: TObject);
begin
close;
end;

procedure TForm4.img_excluirClick(Sender: TObject);
begin
form10.Show;
end;

end.
