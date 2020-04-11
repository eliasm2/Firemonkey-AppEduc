unit Form_Principal1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Form_Principal, FMX.ListView.Types, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base, FMX.ListView, FMX.Edit, FMX.Objects,
  FMX.Controls.Presentation,datamodule, FMX.Layouts, editarprova, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid, vouf, Multiplaescolha, questoes;

type
  TFrm_Principal1 = class(TFrm_Principal)
    ListView1: TListView;
    Image3: TImage;

    procedure img_tab_pedidoClick(Sender: TObject);
    procedure img_tab_clienteClick(Sender: TObject);
    procedure img_tab_notificacaoClick(Sender: TObject);
    procedure img_tab_maisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure img_buscaClick(Sender: TObject);
   // function buscaitem(sender:tobject);
    procedure lv_pedidoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    teste:tlistitem;
    temp,i:integer;
    id_questaoitem:integer;
    vetor:array [1..20] of integer;
    x:integer;
    modo:integer;
    id_prova,tempid_disciplina: integer;

  end;

var
  Frm_Principal1: TFrm_Principal1;

implementation

{$R *.fmx}

uses Form_Provas, Form_Login_prof,opEDIPUB;
procedure Seleciona_Tab(tab : integer);
begin
        with Frm_Principal1 do
        begin
                img_tab_pedido.Opacity := 0.2;
                img_tab_cliente.Opacity := 0.2;
                img_tab_notificacao.Opacity := 0.2;
                img_tab_mais.Opacity := 0.2;

                lbl_tab_pedido.FontColor := $FFA0A0A0;
                lbl_tab_cliente.FontColor := $FFA0A0A0;
                lbl_tab_notificacao.FontColor := $FFA0A0A0;
                lbl_tab_mais.FontColor := $FFA0A0A0;

                tab_pedido.Visible := false;
                tab_cliente.Visible := false;
                tab_notificacao.Visible := false;
                tab_mais.Visible := false;


                if tab = 1 then
                begin
                        img_tab_pedido.Opacity := 1;
                        lbl_tab_pedido.FontColor := $FF4D7EC3;
                        tab_pedido.Visible := true;
                end;
                if tab = 2 then
                begin
                        img_tab_cliente.Opacity := 1;
                        lbl_tab_cliente.FontColor := $FF4D7EC3;
                        tab_cliente.Visible := true;
                end;
                if tab = 3 then
                begin
                        img_tab_notificacao.Opacity := 1;
                        lbl_tab_notificacao.FontColor := $FF4D7EC3;
                        tab_notificacao.Visible := true;
                end;
                if tab = 4 then
                begin
                        img_tab_mais.Opacity := 1;
                        lbl_tab_mais.FontColor := $FF4D7EC3;
                        tab_mais.Visible := true;
                end;
        end;
end;



procedure Add_Pedido_Lista(id_disciplina:integer;disciplina, materia, descricao : string);
var
        item : TListViewItem;
        txt : TListItemText;
        x: integer;
begin
        with Frm_Principal1 do
        begin
                item := lv_pedido.items.add;

               // dm.qry_geral.Close;
              //  dm.qry_geral.Sql.Clear();
              //  dm.qry_geral.SQL.Add('select * from avaliacao');
               // dm.qry_geral.Open();




                with item do
                   begin
                        txt := TListItemText(Objects.FindDrawable('Text1'));
                        txt.Text :=dm.qry_geral.FieldByName('materia').AsString;
                        txt.TagString := inttostr(id_disciplina);
                        tempid_disciplina:=id_disciplina;

                        // Disciplina...
                        txt := TListItemText(Objects.FindDrawable('Text2'));
                        txt.Text := 'Disciplina: ' + dm.qry_geral.FieldByName('disciplina').AsString;

                        // Data Prova...
                        txt := TListItemText(Objects.FindDrawable('Text3'));
                        txt.Text := 'Descrição: ' + dm.qry_geral.FieldByName('descricao').AsString;

                        // valor...
                        txt := TListItemText(Objects.FindDrawable('Text4'));
                        txt.Text := '100/100 ';
                end;
        end;
end;
procedure ConsultaProva(busca: string);
var
  x:integer;
  temp:string;
  temp2:integer;

begin
temp:=(Form1.edt_login.text);

dm.qry_geral.close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.Sql.Add('select ID_PROFESSOR from PROFESSOR WHERE LOGIN='+temp);
dm.qry_geral.Open;
temp2:=dm.qry_geral.FieldByName('ID_PROFESSOR').AsInteger;


dm.qry_geral.Close;

dm.qry_geral.Active:=false;
dm.qry_geral.sql.Clear;
dm.qry_geral.SQL.Add('select * from AVALIACAO where Id_professor='+temp2.ToString);


if busca<>'' then
begin

  dm.qry_geral.SQL.Clear;
  dm.qry_geral.SQL.Add('select * from AVALIACAO where Id_professor='+temp2.ToString+' and materia like"%" || :busca || "%" or disciplina like"%" || :busca || "%" or descricao like"%" || :busca || "%"');
  //dm.qry_geral.Open;
  dm.qry_geral.ParamByName('busca').Value:=busca;
end;

dm.qry_geral.Active:=true;
frm_principal1.lv_pedido.BeginUpdate;
frm_principal1.lv_pedido.items.clear;


for x := 1 to dm.qry_geral.RecordCount do
begin
  Add_Pedido_Lista(dm.qry_geral.FieldByName('ID_AVALIACAO').AsInteger,
                   dm.qry_geral.FieldByName('MATERIA').AsString,
                   dm.qry_geral.FieldByName('DISCIPLINA').AsString,
                   dm.qry_geral.FieldByName('Descricao').AsString);
  dm.qry_geral.Next;
end;

frm_principal1.lv_pedido.EndUpdate;

end;
{procedure TFrm_Principal.edt_buscaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=$13 then
begin
//key:=#0;
  ConsultaProva(edt_busca.Text);
end;

end; }


procedure Add_Questoes_Lista(id_questao:integer;enunciado: string; Tipo: integer);
var
        item : TListViewItem;
        txt : TListItemText;
        temptipo: integer;
        tipotexto:string;
begin
i:=1;
        with Frm_Principal1 do
        begin
                item := ListView1.items.add;

               // dm.qry_geral.Close;
              //  dm.qry_geral.Sql.Clear();
              //  dm.qry_geral.SQL.Add('select * from avaliacao');
               // dm.qry_geral.Open();




                with item do
                begin
                        // Enunciado Questão...
                        txt := TListItemText(Objects.FindDrawable('Text1'));
                        txt.Text :=dm.qry_geral.FieldByName('Enunciado').AsString;
                        vetor[i]:= id_questao;
                        x:=id_questao;
                        txt.TagString := inttostr(id_questao);

                        txt := TListItemText(Objects.FindDrawable('Text3'));
                        txt.Text :='TEMA: '+dm.qry_geral.FieldByName('Tema_Questao').AsString;

                       // txt := TListItemText(Objects.FindDrawable('Text4'));
                      //  txt.Text :='Tema:';


                        //dm.qry_geral.SQL.Clear;
                        temptipo:=dm.qry_geral.FieldByName('tipo').Asinteger ;

                        if temptipo=1then
                        tipotexto:='Questão Verdadeiro e Falso'
                        else
                        tipotexto:='Questão múltipla escolha';

                        txt := TListItemText(Objects.FindDrawable('Text2'));
                        txt.Text :=tipotexto;

                        i:=i+1;
                end;
        end;
end;


procedure ConsultaQuestao(busca: string);
var
  x:integer;

begin
dm.qry_geral.Active:=false;
dm.qry_geral.sql.Clear;
dm.qry_geral.SQL.Add('select * from questao');


if busca<>'' then
begin
  dm.qry_geral.SQL.Add('where Tema_Questao like "%" || :busca || "%"');
  dm.qry_geral.ParamByName('busca').Value:=busca;
end;

dm.qry_geral.Active:=true;

frm_principal1.ListView1.BeginUpdate;
frm_principal1.ListView1.items.clear;



for x := 1 to dm.qry_geral.RecordCount do
begin
  Add_Questoes_Lista(dm.qry_geral.FieldByName('id_questao').Asinteger,
                   dm.qry_geral.FieldByName('enunciado').AsString,
                   dm.qry_geral.FieldByName('tipo').Asinteger);
  dm.qry_geral.Next;
end;

frm_principal1.listview1.EndUpdate;

end;



procedure TFrm_Principal1.FormShow(Sender: TObject);
begin
lv_pedido.items.clear;
listview1.Items.Clear;
//Frm_Principal1.BeginUpdate;
caption:='ProvasOn';
lbl_tab_cliente.Text:='Questões';
label3.Text:='Questões';
edit1.TextPrompt:='Pesquisar Questões';
image2.Visible:=true;
Frm_Principal1.Height := Screen.Height;

  Frm_Principal1.Width := Screen.Width;
image1.Visible:=true;
ConsultaProva('');
Seleciona_Tab(1);


end;

procedure TFrm_Principal1.Image1Click(Sender: TObject);
begin
{
if NOT Assigned(frm_principal1) then
    Application.CreateForm(Tfrm_principal1,frm_principal1);
    frmprovas.codprova:=0;
    frm_principal1.ShowModal(procedure(ModalResult: TModalResult)
                                begin
                                img_busca.OnClick(sender);
                                end);  }

frmprovas.Show;
close;



end;

procedure TFrm_Principal1.Image2Click(Sender: TObject);
begin
  inherited;
  modo:=0;
  Form_questoes.Show;
end;

procedure TFrm_Principal1.Image3Click(Sender: TObject);
begin
  //inherited;
   ConsultaQuestao(edit1.Text);
end;

procedure TFrm_Principal1.img_buscaClick(Sender: TObject);
begin
  //inherited;
 ConsultaProva(edt_busca.Text);
end;

procedure TFrm_Principal1.img_tab_clienteClick(Sender: TObject);
begin
       listview1.Items.Clear;
       Seleciona_Tab(2);
       ConsultaQuestao('');
end;

procedure TFrm_Principal1.img_tab_maisClick(Sender: TObject);
begin
        freeandnil(frm_principal1);
end;

procedure TFrm_Principal1.img_tab_notificacaoClick(Sender: TObject);
begin
        Seleciona_Tab(3);
end;

procedure TFrm_Principal1.img_tab_pedidoClick(Sender: TObject);
begin
        Seleciona_Tab(1);
end;


procedure TFrm_Principal1.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
     var txt : TListItemText;
    var temptipo,tempminimo,tempverd:integer;
begin


        with AItem do
        begin
          txt := TListItemText(Objects.FindDrawable('Text1'));
          id_questaoitem := txt.TagString.ToInteger;
          dm.qry_geral.Close;
          dm.qry_geral.SQL.Clear;
          dm.qry_geral.SQL.Add('select id_questao,Tema_Questao,verdadeira,Respcor, enunciado,tipo from questao where id_questao = :id');
          dm.qry_geral.Params.ParamByName('id').Value := id_questaoitem;
          dm.qry_geral.Open();


          temptipo := dm.qry_geral.FieldByName('tipo').AsInteger;
          dm.qry_prof.Close;
          dm.qry_prof.SQL.Clear;
          dm.qry_prof.SQL.Add('select MIN(ID_OPCAOAVALIACAO), descricao from opcaoavaliacao where id_questao = :id' );
          dm.qry_prof.Params.ParamByName('id').Value := id_questaoitem;
          dm.qry_prof.Open();



          if temptipo=1 then begin
          form4.Memo2.Text:= dm.qry_geral.FieldByName('Tema_Questao').AsString;
          form4.Memo1.Text:= dm.qry_geral.FieldByName('enunciado').AsString;
          tempverd:= dm.qry_geral.FieldByName('verdadeira').AsInteger;
            if tempverd=1 then begin
            form4.CheckBox1.IsChecked:=true;
            modo:=1;
            form4.show;
            end
          else begin
          form4.CheckBox2.IsChecked:=true;
          modo:=1;
          form4.show;
          end;
          end

          else begin
          form7.Memo6.Text:= dm.qry_geral.FieldByName('Tema_Questao').AsString;
          form7.Memo1.Text:= dm.qry_geral.FieldByName('enunciado').AsString;
          form7.Memo2.Text:=dm.qry_prof.FieldByName('descricao').AsString;
          dm.qry_prof.SQL.Clear;
          dm.qry_prof.Close;


          //referente a segunda memo
          dm.qry_prof.SQL.Add('select (MIN(ID_OPCAOAVALIACAO)+1) d, descricao from opcaoavaliacao where id_questao = :id' );
          dm.qry_prof.Params.ParamByName('id').Value := id_questaoitem;
          dm.qry_prof.Open();
          tempminimo:=dm.qry_prof.FieldByName('d').Asinteger;
          dm.qry_prof.close;
          dm.qry_prof.sql.clear;
          dm.qry_prof.SQL.Add('select descricao from opcaoavaliacao where id_questao = :id and ID_OPCAOAVALIACAO='+inttostr(tempminimo));
          dm.qry_prof.Params.ParamByName('id').Value := id_questaoitem;
          dm.qry_prof.Open();
          form7.memo3.Text:=dm.qry_prof.FieldByName('descricao').AsString;
          dm.qry_prof.SQL.Clear;
          dm.qry_prof.close;

          //acaba aqui a segunda memo
          tempminimo:=tempminimo+1;
          dm.qry_prof.SQL.Add('select descricao from opcaoavaliacao where id_questao = :id and ID_OPCAOAVALIACAO='+inttostr(tempminimo));
          dm.qry_prof.Params.ParamByName('id').Value := id_questaoitem;
          dm.qry_prof.Open();
          form7.memo4.Text:=dm.qry_prof.FieldByName('descricao').AsString;
          dm.qry_prof.SQL.Clear;
          dm.qry_prof.close;
          tempminimo:=tempminimo+1;
          dm.qry_prof.SQL.Add('select descricao from opcaoavaliacao where id_questao = :id and ID_OPCAOAVALIACAO='+inttostr(tempminimo));
          dm.qry_prof.Params.ParamByName('id').Value := id_questaoitem;
          dm.qry_prof.Open();
          form7.memo5.Text:=dm.qry_prof.FieldByName('descricao').AsString;
          //tempverd:= dm.qry_geral.FieldByName('Respcor').AsInteger;
          dm.qry_prof.SQL.Clear;
          dm.qry_prof.close;
          tempminimo:=tempminimo+1;
          dm.qry_prof.SQL.Add('select descricao from opcaoavaliacao where id_questao = :id and ID_OPCAOAVALIACAO='+inttostr(tempminimo));
          dm.qry_prof.Params.ParamByName('id').Value := id_questaoitem;
          dm.qry_prof.Open();
          form7.memo7.Text:=dm.qry_prof.FieldByName('descricao').AsString;
          tempverd:= dm.qry_geral.FieldByName('Respcor').AsInteger;
          dm.qry_prof.close;
          if tempverd=1 then
          form7.CheckBox1.IsChecked:=true
          else if tempverd=2 then
          form7.CheckBox3.IsChecked:=true
          else if tempverd=3 then
          form7.CheckBox4.IsChecked:=true
          else if tempverd=4 then
          form7.CheckBox5.IsChecked:=true
          else if tempverd=5 then
          form7.CheckBox2.IsChecked:=true;

          modo:=1;
          form7.show;
          end;
          end;






end;

{function tfrm_principal1.buscaitem(indice: string):integer;
var listitem: tlistitem;
begin
 listitem:= lv_pedido(0,indice,false,true,true);
 if listitem<>nil then
    result:=listitem.Index
 else
    result:=-1;

end;    }

procedure TFrm_Principal1.lv_pedidoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
  var
    txt : TListItemText;


begin
    with AItem do
     begin
     txt := TListItemText(Objects.FindDrawable('Text1'));
     id_prova := txt.TagString.ToInteger;
     Form8.show;
     end;


end;



end.
