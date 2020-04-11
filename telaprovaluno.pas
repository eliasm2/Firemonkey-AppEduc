unit telaprovaluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.Layouts,
  FMX.Edit, DataModule;

type
  TForm14 = class(TForm)
    Layout1: TLayout;
    Label3: TLabel;
    groupquestao: TGroupBox;
    Layout2: TLayout;
    Layout6: TLayout;
    Memo2: TMemo;
    CheckBox1: TCheckBox;
    Layout3: TLayout;
    CheckBox3: TCheckBox;
    Layout7: TLayout;
    Memo3: TMemo;
    Layout4: TLayout;
    CheckBox4: TCheckBox;
    Layout8: TLayout;
    Memo4: TMemo;
    Layout5: TLayout;
    CheckBox5: TCheckBox;
    Layout9: TLayout;
    Memo5: TMemo;
    Layout11: TLayout;
    CheckBox2: TCheckBox;
    Layout12: TLayout;
    Memo7: TMemo;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    toolbar: TRectangle;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Edit1: TEdit;
    Label1: TLabel;
    Layout10: TLayout;
    Rectangle1: TRectangle;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure CheckBox6Change(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Change(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure CheckBox4Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure CheckBox5Change(Sender: TObject);
    procedure Layout10Click(Sender: TObject);
    procedure verificaresposta;
    procedure Label4Click(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    var somanota:integer;


   var vetor: array of integer;
   var vetorquantidade: array of integer;
   var vetor2: array of integer;
   var vetortipo: array of integer;
     var vetorvalorquestoes: array of integer;
    var vetoropcoesDESC: array of string;
    var vetordesc: array of string;
    var vetoropcaocerta: array of string;
    campo2: string[35];
   cont,i,n,j,p:integer;
   temp:double;
   quantidadequestoes,primeiraquestao,ultimaquestao,primeiraopcao,ultimaopcao:integer;
   tipoquestao,temptipo:integer;
   verdadeira,tempopcao, opcoesdescmult:integer;
  end;

var
  Form14: TForm14;

implementation

{$R *.fmx}

uses Principal_Aluno;

procedure TForm14.CheckBox1Change(Sender: TObject);
begin
if checkbox1.IsChecked then
begin
checkbox3.IsChecked:=false;
checkbox4.IsChecked:=false;
checkbox5.IsChecked:=false;
checkbox2.IsChecked:=false;
end
end;

procedure TForm14.CheckBox2Change(Sender: TObject);
begin
if checkbox2.IsChecked then
begin
checkbox1.IsChecked:=false;
checkbox4.IsChecked:=false;
checkbox5.IsChecked:=false;
checkbox3.IsChecked:=false;
end;
end;

procedure TForm14.CheckBox3Change(Sender: TObject);
begin
if checkbox3.IsChecked then
begin
checkbox1.IsChecked:=false;
checkbox4.IsChecked:=false;
checkbox5.IsChecked:=false;
checkbox2.IsChecked:=false;
end;
end;

procedure TForm14.CheckBox4Change(Sender: TObject);
begin
if checkbox4.IsChecked then
begin
checkbox1.IsChecked:=false;
checkbox2.IsChecked:=false;
checkbox5.IsChecked:=false;
checkbox3.IsChecked:=false;
end;
end;

procedure TForm14.CheckBox5Change(Sender: TObject);
begin
if checkbox5.IsChecked then
begin
checkbox1.IsChecked:=false;
checkbox4.IsChecked:=false;
checkbox2.IsChecked:=false;
checkbox3.IsChecked:=false;
end;
end;

procedure TForm14.CheckBox6Change(Sender: TObject);
begin
if checkbox6.IsChecked then
begin
checkbox7.IsChecked:=false;
end;
end;

procedure TForm14.CheckBox6Click(Sender: TObject);
begin
if checkbox6.IsChecked then
begin
checkbox7.IsChecked:=false;
end;
end;

procedure TForm14.CheckBox7Change(Sender: TObject);
begin
if checkbox7.IsChecked then
begin
checkbox6.IsChecked:=false;
end;
end;

procedure TForm14.CheckBox7Click(Sender: TObject);
begin
if checkbox7.IsChecked then
begin
checkbox6.IsChecked:=false;
end;
end;

procedure TForm14.FormShow(Sender: TObject);

begin
image2.Visible:=false;
n:=0;
p:=0;
j:=0;
//estou vendo dentro de questão prova quantas questões possui aquela publicação.
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select count(*) as cont from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
quantidadequestoes:=dm.qry_geral.FieldByName('cont').AsInteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select valor_questao from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;

SetLength(vetorvalorquestoes, quantidadequestoes);
SetLength(vetorquantidade, quantidadequestoes);
setlength(vetoropcaocerta,quantidadequestoes);

if not dm.qry_geral.Eof then
  begin
  dm.qry_geral.First;
  while not dm.qry_geral.eof do
    begin
    vetorvalorquestoes[n] := dm.qry_geral.FieldByName('valor_questao').AsInteger;
    temp:=vetorvalorquestoes[n];
    dm.qry_prof.SQL.Clear;
    n:=n+1;
    dm.qry_geral.Next;
    end;
  end;





//estou pegando o valor mínimo, ou seja a primeira questao
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select min(id_questao)as min from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
primeiraquestao:= dm.qry_geral.FieldByName('min').AsInteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select max(id_questao)as max from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
ultimaquestao:= dm.qry_geral.FieldByName('max').AsInteger;



dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select * from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
//aqui já sei quantas questões possuem

SetLength(vetor, quantidadequestoes);
SetLength(vetortipo, quantidadequestoes);
SetLength(vetoropcoesdesc, quantidadequestoes+2);
SetLength(vetordesc, quantidadequestoes);

dm.qry_prof.Close;
dm.qry_prof.sql.Clear;

n:=0;
if not dm.qry_geral.Eof then
  begin
  dm.qry_geral.First;
  while not dm.qry_geral.eof do
    begin
    vetor[n] := dm.qry_geral.FieldByName('id_questao').AsInteger;
    temp:=vetor[n];
    dm.qry_prof.SQL.Clear;
    dm.qry_prof.SQL.Add('select * from questao where id_questao='+floattostr(temp));
    dm.qry_prof.Open();
    //aqui eu já estou dentro da questão
    vetortipo[n]:=dm.qry_prof.FieldByName('tipo').AsInteger;
    vetordesc[n]:=dm.qry_prof.FieldByName('enunciado').AsString;
        if vetortipo[n]=2 then
        begin
        vetoropcaocerta[n]:=dm.qry_prof.FieldByName('respcor').Asstring;
        opcoesdescmult:=opcoesdescmult+4;
        dm.qry_t.Close;
        dm.qry_t.SQL.Clear;
        dm.qry_t.SQL.Add('select * from opcaoavaliacao where id_questao='+floattostr(temp));
        dm.qry_t.Open();
        if not dm.qry_t.Eof then
        begin
        dm.qry_t.First;
        while not dm.qry_t.eof do
        begin
        vetoropcoesDESC[j]:=dm.qry_t.FieldByName('descricao').AsString;
        j:=j+1;
        dm.qry_t.Next;
        end;
        end;
        end
        else
        vetoropcaocerta[n]:=dm.qry_prof.FieldByName('verdadeira').AsString;
    primeiraquestao:=primeiraquestao+1;
    n:=n+1;
    dm.qry_geral.Next;
    end;
  end;
  //logo após isso eu já peguei todas as questões e já coloquei dentro de vetores


 memo1.Text:=vetordesc[0];
 edit1.text:=inttostr(vetorvalorquestoes[0]);
 if vetortipo[0]=1 then
 begin
 groupbox1.Visible:=true;
 groupquestao.Visible:=false;
 end
 else
 begin
 groupbox1.Visible:=false;
 groupquestao.Visible:=true;
 memo2.text:=vetoropcoesDESC[0];
 memo3.text:=vetoropcoesDESC[1];
 memo4.text:=vetoropcoesDESC[2];
 memo7.text:=vetoropcoesDESC[3];
 if vetoropcoesDESC[4]<>'' then
 memo5.text:=vetoropcoesDESC[4]
 else
  layout5.Visible:=false;
 end;

 n:=0;
 vetorquantidade[n]:=1;


{
for I := 1 to 3 do   begin

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select * from questao where id_questao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
end;
//aqui já sei quantas questões possuem

SetLength(vetor, quantidadequestoes-1);


if not dm.qry_geral.Eof then
  begin
  dm.qry_geral.First;
  while not dm.qry_geral.eof do
    begin
    vetor[primeiraquestao]:= dm.qry_geral.FieldByName('id_questao').AsInteger;
    temp:=vetor[primeiraquestao];
    primeiraquestao:=primeiraquestao+1;
    dm.qry_geral.Next;
    end;
  end;


   }


 end;


procedure tform14.verificaresposta;
var id_questao,respcor,tipo,respusur,nota:integer;
begin
    dm.qry_geral.close;
    dm.qry_geral.SQL.Clear;
    dm.qry_geral.SQL.Add('select * from questaoprova qp inner join questao q on qp.id_questao = q.id_questao where qp.id_publicacao='+inttostr(Form11.tempidPUB) + ' and q.enunciado like '+quotedstr(memo1.text) );
    dm.qry_geral.Open;

    id_questao := dm.qry_geral.FieldByName('id_questao').AsInteger;
    nota:=dm.qry_geral.FieldByName('valor_questao').AsInteger;
    dm.qry_geral.SQL.Clear;

    dm.qry_geral.SQL.Add('select * from questao where id_questao='+inttostr(id_questao));
    dm.qry_geral.Open();

    tipo:=dm.qry_geral.FieldByName('tipo').AsInteger;

    if tipo=1 then begin
    //questao vouf
    respcor:=dm.qry_geral.FieldByName('verdadeira').AsInteger;
     if form14.checkbox6.ischecked=true then
     respusur:=1
     else
     respusur:=2;

    if respusur=respcor then
    form14.somanota:=form14.somanota+nota;
    end

    else begin
    respcor:=dm.qry_geral.FieldByName('respcor').AsInteger;
    if form14.checkbox1.ischecked=true then
     respusur:=1
    else if form14.checkbox3.ischecked=true then
     respusur:=2
    else if form14.checkbox4.ischecked=true then
     respusur:=3
    else if form14.checkbox2.ischecked=true then
     respusur:=4
    else if form14.checkbox5.ischecked=true then
     respusur:=5;

    if respusur=respcor then
    form14.somanota:=form14.somanota+nota;
    end;

  if form14.somanota>100 then
  form14.somanota:=100;


end;


procedure TForm14.Image1Click(Sender: TObject);
begin
verificaresposta;
layout5.Visible:=true;
p:=p+1;
j:=0;
if p=0 then
image2.Visible:=false
else
image2.Visible:=true;


N:=0;


//estou vendo dentro de questão prova quantas questões possui aquela publicação.
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select count(*) as cont from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
quantidadequestoes:=dm.qry_geral.FieldByName('cont').AsInteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select valor_questao from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;

SetLength(vetorvalorquestoes, quantidadequestoes);
SetLength(vetoropcoesdesc, quantidadequestoes+2);
setlength(vetoropcaocerta,quantidadequestoes);

if not dm.qry_geral.Eof then
  begin
  dm.qry_geral.First;
  while not dm.qry_geral.eof do
    begin
    vetorvalorquestoes[n] := dm.qry_geral.FieldByName('valor_questao').AsInteger;
    temp:=vetorvalorquestoes[n];
    dm.qry_prof.SQL.Clear;
    n:=n+1;
    dm.qry_geral.Next;
    end;
  end;





//estou pegando o valor mínimo, ou seja a primeira questao
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select min(id_questao)as min from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
primeiraquestao:= dm.qry_geral.FieldByName('min').AsInteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select max(id_questao)as max from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
ultimaquestao:= dm.qry_geral.FieldByName('max').AsInteger;



dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select * from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
//aqui já sei quantas questões possuem

SetLength(vetor, quantidadequestoes);
SetLength(vetortipo, quantidadequestoes);
SetLength(vetoropcoesdesc, quantidadequestoes+2);
SetLength(vetordesc, quantidadequestoes);

dm.qry_prof.Close;
dm.qry_prof.sql.Clear;

n:=0;
if not dm.qry_geral.Eof then
  begin
  dm.qry_geral.First;
  while not dm.qry_geral.eof do
    begin
    vetor[n] := dm.qry_geral.FieldByName('id_questao').AsInteger;
    temp:=vetor[n];
    dm.qry_prof.SQL.Clear;
    dm.qry_prof.SQL.Add('select * from questao where id_questao='+floattostr(temp));
    dm.qry_prof.Open();
    //aqui eu já estou dentro da questão
    vetortipo[n]:=dm.qry_prof.FieldByName('tipo').AsInteger;
    vetordesc[n]:=dm.qry_prof.FieldByName('enunciado').AsString;
    if vetortipo[n]=2 then
        begin
        opcoesdescmult:=opcoesdescmult+4;
        dm.qry_t.Close;
        dm.qry_t.SQL.Clear;
        dm.qry_t.SQL.Add('select * from opcaoavaliacao where id_questao='+floattostr(temp));
        dm.qry_t.Open();
        if not dm.qry_t.Eof then
        begin
        dm.qry_t.First;
        while not dm.qry_t.eof do
        begin
        vetoropcoesDESC[j]:=dm.qry_t.FieldByName('descricao').AsString;
        j:=j+1;
        dm.qry_t.Next;
        end;
        end;
        end;
    primeiraquestao:=primeiraquestao+1;
    n:=n+1;
    dm.qry_geral.Next;
    end;
  end;
  //logo após isso eu já peguei todas as questões e já coloquei dentro de vetores

if p<quantidadequestoes then begin
if p=quantidadequestoes-1 then  begin
image1.Visible:=false;
//image2.Visible:=false;
layout10.Visible:=true;
end;

 memo1.Text:=vetordesc[p];
 edit1.text:=inttostr(vetorvalorquestoes[p]);
 if vetortipo[p]=1 then
 begin
 groupbox1.Visible:=true;
 groupquestao.Visible:=false;
 end
 else
 begin
 groupbox1.Visible:=false;
 groupquestao.Visible:=true;
 memo2.text:=vetoropcoesDESC[0];
 memo3.text:=vetoropcoesDESC[1];
 memo4.text:=vetoropcoesDESC[2];
 memo7.text:=vetoropcoesDESC[3];
 if vetoropcoesDESC[4]<>'' then
 memo5.text:=vetoropcoesDESC[4]
 else
 layout5.Visible:=false;
 end;

end
else begin
image1.Visible:=false;
//image2.Visible:=false;
layout10.Visible:=true;

end;


end;

procedure TForm14.Image2Click(Sender: TObject);
begin
layout5.Visible:=true;
image1.Visible:=true;
layout10.Visible:=false;
j:=0;
p:=p-1;
if p=0 then
image2.Visible:=false
else
image2.Visible:=true;


N:=0;


//estou vendo dentro de questão prova quantas questões possui aquela publicação.
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select count(*) as cont from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
quantidadequestoes:=dm.qry_geral.FieldByName('cont').AsInteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select valor_questao from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;

SetLength(vetorvalorquestoes, quantidadequestoes);
SetLength(vetoropcoesdesc, quantidadequestoes+2);
setlength(vetoropcaocerta,quantidadequestoes);

if not dm.qry_geral.Eof then
  begin
  dm.qry_geral.First;
  while not dm.qry_geral.eof do
    begin
    vetorvalorquestoes[n] := dm.qry_geral.FieldByName('valor_questao').AsInteger;
    temp:=vetorvalorquestoes[n];
    dm.qry_prof.SQL.Clear;
    n:=n+1;
    dm.qry_geral.Next;
    end;
  end;





//estou pegando o valor mínimo, ou seja a primeira questao
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select min(id_questao)as min from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
primeiraquestao:= dm.qry_geral.FieldByName('min').AsInteger;

dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select max(id_questao)as max from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
ultimaquestao:= dm.qry_geral.FieldByName('max').AsInteger;



dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select * from questaoprova where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.Open;
//aqui já sei quantas questões possuem

SetLength(vetor, quantidadequestoes);
SetLength(vetortipo, quantidadequestoes);
SetLength(vetoropcoesdesc, quantidadequestoes+2);
SetLength(vetordesc, quantidadequestoes);

dm.qry_prof.Close;
dm.qry_prof.sql.Clear;

n:=0;
if not dm.qry_geral.Eof then
  begin
  dm.qry_geral.First;
  while not dm.qry_geral.eof do
    begin
    vetor[n] := dm.qry_geral.FieldByName('id_questao').AsInteger;
    temp:=vetor[n];
    dm.qry_prof.SQL.Clear;
    dm.qry_prof.SQL.Add('select * from questao where id_questao='+floattostr(temp));
    dm.qry_prof.Open();
    //aqui eu já estou dentro da questão
    vetortipo[n]:=dm.qry_prof.FieldByName('tipo').AsInteger;
    vetordesc[n]:=dm.qry_prof.FieldByName('enunciado').AsString;
    if vetortipo[n]=2 then
        begin
        opcoesdescmult:=opcoesdescmult+4;
        dm.qry_t.Close;
        dm.qry_t.SQL.Clear;
        dm.qry_t.SQL.Add('select * from opcaoavaliacao where id_questao='+floattostr(temp));
        dm.qry_t.Open();
        if not dm.qry_t.Eof then
        begin
        dm.qry_t.First;
        while not dm.qry_t.eof do
        begin
        vetoropcoesDESC[j]:=dm.qry_t.FieldByName('descricao').AsString;
        j:=j+1;
        dm.qry_t.Next;
        end;
        end;
        end;
    primeiraquestao:=primeiraquestao+1;
    n:=n+1;
    dm.qry_geral.Next;
    end;
  end;
  //logo após isso eu já peguei todas as questões e já coloquei dentro de vetores


if p<quantidadequestoes then begin

 memo1.Text:=vetordesc[p];
 edit1.text:=inttostr(vetorvalorquestoes[p]);
 if vetortipo[p]=1 then
 begin
 groupbox1.Visible:=true;
 groupquestao.Visible:=false;
 end
 else
 begin
 groupbox1.Visible:=false;
 groupquestao.Visible:=true;
 //dm.qry_t.Close;
 //dm.qry_t.ClearBlobs;
 //dm.qry_t.SQL.Add('select * from opcaoavalicao where id_questao=')
 memo2.text:=vetoropcoesDESC[0];
 memo3.text:=vetoropcoesDESC[1];
 memo4.text:=vetoropcoesDESC[2];
 memo7.text:=vetoropcoesDESC[3];
 if vetoropcoesDESC[4]<>'' then
 memo5.text:=vetoropcoesDESC[4]
 else
 layout5.Visible:=false;
 end;

end
else begin
image1.Visible:=false;
layout10.Visible:=true;
//image2.Visible:=false;
end;


end;


procedure TForm14.Label4Click(Sender: TObject);
begin
verificaresposta;

showmessage('Prova Finalizada com sucesso! A sua nota foi: '+ inttostr(somanota));
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.add('update publicacao set notaobtida ='+inttostr(somanota) + ' where id_publicacao='+inttostr(Form11.tempidPUB));
end;

procedure TForm14.Layout10Click(Sender: TObject);
begin
verificaresposta;

showmessage('Prova Finalizada com sucesso! A sua nota foi: '+ inttostr(somanota));
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.add('update publicacao set notaobtida ='+inttostr(somanota) + ' where id_publicacao='+inttostr(Form11.tempidPUB));
end;

procedure TForm14.Rectangle1Click(Sender: TObject);
begin
verificaresposta;

showmessage('Prova Finalizada com sucesso! A sua nota foi: '+ inttostr(somanota));
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.add('update publicacao set nota_obtida ='+inttostr(somanota) + ' where id_publicacao='+inttostr(Form11.tempidPUB));
dm.qry_geral.ExecSQL;
close;
end;

end.
