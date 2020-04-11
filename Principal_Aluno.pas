unit Principal_Aluno;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, FMX.Edit;

type
  TForm11 = class(TForm)
    layout_tabs: TLayout;
    TabPedido: TLayout;
    lbl_tab_pedido: TLabel;
    img_tab_pedido: TImage;
    TabCliente: TLayout;
    lbl_tab_cliente: TLabel;
    img_tab_cliente: TImage;
    TabNotificacao: TLayout;
    img_tab_notificacao: TImage;
    lbl_tab_notificacao: TLabel;
    circle_notificacao: TCircle;
    Label1: TLabel;
    TabMais: TLayout;
    lbl_tab_mais: TLabel;
    img_tab_mais: TImage;
    StyleBook1: TStyleBook;
    tab_cliente: TLayout;
    Rectangle1: TRectangle;
    Label3: TLabel;
    Image2: TImage;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Edit1: TEdit;
    lv_cliente: TListView;
    tab_mais: TLayout;
    Rectangle5: TRectangle;
    Label5: TLabel;
    tab_notificacao: TLayout;
    Rectangle4: TRectangle;
    Label4: TLabel;
    lv_notificacao: TListView;
    tab_pedido: TLayout;
    toolbar: TRectangle;
    Label2: TLabel;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    edt_busca: TEdit;
    img_busca: TImage;
    ListView1: TListView;
    procedure img_tab_pedidoClick(Sender: TObject);
    procedure img_tab_clienteClick(Sender: TObject);
    procedure img_tab_notificacaoClick(Sender: TObject);
    procedure img_tab_maisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure img_buscaClick(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);

  private
    { Private declarations }
  public
    { Public declarations }

    tempid_disciplina: integer;
    tempidPUB:integer;
    datfim:tdatetime;
    notaobtida:double;
    notaobtidastring:string;

  end;

var
  Form11: TForm11;

implementation

{$R *.fmx}

uses DataModule, telaprovaluno;


procedure Seleciona_Tab(tab : integer);
begin
        with Form11 do
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

procedure TForm11.img_tab_clienteClick(Sender: TObject);
begin
Seleciona_Tab(2);
end;

procedure TForm11.img_tab_maisClick(Sender: TObject);
begin
Seleciona_Tab(4);
end;

procedure TForm11.img_tab_notificacaoClick(Sender: TObject);
begin
Seleciona_Tab(3);
end;

procedure TForm11.img_tab_pedidoClick(Sender: TObject);
begin
Seleciona_Tab(1);
end;

procedure Add_Pedido_Lista(idprova: integer; id_turma:integer;datainicio, datafim: string;
  nota, notaobtida: integer);
var
        item : TListViewItem;
        txt : TListItemText;
        x: integer;
        temp:tdate;
        turma:string ;
begin
        with form11 do
        begin
                item := listview1.items.add;

               // dm.qry_geral.Close;
              //  dm.qry_geral.Sql.Clear();
              //  dm.qry_geral.SQL.Add('select * from avaliacao');
               // dm.qry_geral.Open();




                with item do
                   begin
                   dm.qry_prof.Close;
                   dm.qry_prof.SQL.Clear;
                   dm.qry_prof.SQL.Add('select nome from turma where id_turma='+inttostr(id_turma));
                   dm.qry_prof.Open();
                   turma:=dm.qry_prof.FieldByName('nome').AsString;
                        txt := TListItemText(Objects.FindDrawable('Text1'));
                        txt.Text :='Disciplina: '+ turma;
                        txt.TagString := inttostr(idprova);
                        tempid_disciplina:=idprova;


                        txt := TListItemText(Objects.FindDrawable('Text3'));
                        txt.Text :='Data Início :';

                        txt := TListItemText(Objects.FindDrawable('Text5'));
                        txt.Text :='Data Fim :';

                        txt := TListItemText(Objects.FindDrawable('Text7'));
                        txt.Text :='Valor da avaliação :';

                        txt := TListItemText(Objects.FindDrawable('Text9'));
                        txt.Text :='Nota Obtida :';

                        //temp:= dm.qry_geral.FieldByName('datainicio').AsDateTime;
                        txt := TListItemText(Objects.FindDrawable('Text4'));
                        txt.Text :=datainicio;

                       // temp:= dm.qry_geral.FieldByName('datafim').AsDateTime;
                        txt := TListItemText(Objects.FindDrawable('Text6'));
                        txt.Text :=datafim;
                        datfim:=strtodate(datafim);


                        txt := TListItemText(Objects.FindDrawable('Text8'));
                        txt.Text :=dm.qry_geral.FieldByName('valorprova').Asstring;

                        txt := TListItemText(Objects.FindDrawable('Text10'));
                        txt.Text :=dm.qry_geral.FieldByName('nota_obtida').Asstring;


                end;
        end;
end;


procedure ConsultaProva(busca: string);
var
  x:integer;
  temp:string;
  turma:integer;
  tempd:Tdate;
  temp2:integer;

begin
//temp:=(Form1.edt_login.text);

dm.qry_geral.close;
dm.qry_geral.SQL.Clear;
//select e.razao_social, f.descricao, e.nomefantasia, e.endereco from empresas as e join filiais as f on  e.seq = f.Empresa
dm.qry_geral.Sql.Add('select * from publicacao');

                  {
dm.qry_geral.Close;
dm.qry_geral.SQL.Clear;
dm.qry_geral.SQL.Add('select datapublicacao,datainicio, datafim from publicacao');
dm.qry_geral.Open();

for x := 1 to dm.qry_geral.RecordCount do
begin
dm.qry_geral.FieldByName('datapublicacao').Asdatetime;
end;
                   }


if busca<>'' then
begin
   DM.qry_prof.Close;
  DM.qry_prof.SQL.Clear;
  dm.qry_prof.SQL.Add('select id_turma from turma where nome like "%" || :busca || "%" ');
  dm.qry_prof.Open();
  turma:=dm.qry_prof.FieldByName('id_turma').AsInteger;

  dm.qry_geral.SQL.Clear;
  dm.qry_geral.SQL.Add('select * from publicacao');
  dm.qry_geral.SQL.Add(' where id_turma = '+inttostr(turma));
  //dm.qry_geral.Open;
  dm.qry_geral.ParamByName('busca').Value:=busca;
end;

dm.qry_geral.Active:=true;
form11.ListView1.BeginUpdate;
form11.ListView1.items.clear;


for x := 1 to dm.qry_geral.RecordCount do
begin
  Add_Pedido_Lista(dm.qry_geral.FieldByName('id_publicacao').AsInteger,
                   dm.qry_geral.FieldByName('id_turma').Asinteger,
                   FormatDateTime('dd/MM/yyyy', dm.qry_geral.FieldByName('datainicio').AsDateTime),
                   FormatDateTime('dd/MM/yyyy', dm.qry_geral.FieldByName('datafim').AsDateTime),
                   dm.qry_geral.FieldByName('valorprova').AsInteger,
                   dm.qry_geral.FieldByName('nota_obtida').AsInteger);
  dm.qry_geral.Next;
end;

form11.ListView1.EndUpdate;

end;

procedure TForm11.img_buscaClick(Sender: TObject);
begin
consultaprova(edt_busca.text);
end;

procedure TForm11.FormShow(Sender: TObject);
begin
listview1.items.clear;

//Frm_Principal1.BeginUpdate;
caption:='ProvasOn';
lbl_tab_cliente.Text:='Turmas';
label3.Text:='Turmas';
edit1.TextPrompt:='Pesquisar Turmas';
image2.Visible:=true;
Form11.Height := Screen.Height;

  Form11.Width := Screen.Width;
//image1.Visible:=true;
ConsultaProva('');
Seleciona_Tab(1);
end;

procedure TForm11.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
  var txt : TListItemText;
  temptempo:tdatetime;

begin
  with AItem do
  begin



          txt := TListItemText(Objects.FindDrawable('Text1'));
          tempidPUB := txt.TagString.ToInteger;
          dm.qry_geral.Close;
          dm.qry_geral.SQL.Clear;
          dm.qry_geral.SQL.Add('select datafim,nota_obtida from publicacao where id_publicacao='+inttostr(tempidPUB));
          dm.qry_geral.Open();
          datfim:=dm.qry_geral.FieldByName('datafim').AsDateTime;
          notaobtida:=dm.qry_geral.FieldByName('nota_obtida').AsFloat;
          notaobtidastring:=floattostr(notaobtida);
          if notaobtida <> 0 then begin
          showmessage('Você já realizou esta prova. A sua nota foi : '+notaobtidastring+' PTS ');
          EXIT;
          end;


          temptempo:=now;
          if datfim<temptempo then
          begin
            showmessage('Avaliação fora do prazo');
            exit;
          end;

          FORM14.SHOW;
          close;


  end;


end;

end.
