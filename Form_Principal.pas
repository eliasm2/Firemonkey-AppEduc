unit Form_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  System.ImageList, FMX.ImgList, FMX.Layouts,FMX.Objects, FMX.Controls.Presentation,
  FMX.StdCtrls, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,DataModule;

type
  TFrm_Principal = class(TForm)
    StyleBook1: TStyleBook;
    layout_tabs: TLayout;
    TabPedido: TLayout;
    TabCliente: TLayout;
    TabNotificacao: TLayout;
    TabMais: TLayout;
    lbl_tab_pedido: TLabel;
    img_tab_pedido: TImage;
    lbl_tab_cliente: TLabel;
    lbl_tab_notificacao: TLabel;
    lbl_tab_mais: TLabel;
    img_tab_cliente: TImage;
    img_tab_notificacao: TImage;
    img_tab_mais: TImage;
    circle_notificacao: TCircle;
    Label1: TLabel;
    tab_pedido: TLayout;
    toolbar: TRectangle;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    edt_busca: TEdit;
    lv_pedido: TListView;
    Label2: TLabel;
    Image1: TImage;
    tab_cliente: TLayout;
    Rectangle1: TRectangle;
    Label3: TLabel;
    Image2: TImage;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Edit1: TEdit;
    lv_cliente: TListView;
    tab_notificacao: TLayout;
    Rectangle4: TRectangle;
    Label4: TLabel;
    lv_notificacao: TListView;
    tab_mais: TLayout;
    Rectangle5: TRectangle;
    Label5: TLabel;
    img_busca: TImage;
    procedure img_tab_pedidoClick(Sender: TObject);
    procedure img_tab_clienteClick(Sender: TObject);
    procedure img_tab_notificacaoClick(Sender: TObject);
    procedure img_tab_maisClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabMaisClick(Sender: TObject);
    procedure img_buscaClick(Sender: TObject);
    procedure edt_buscaKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure lv_pedidoClick(Sender: TObject);
    procedure lv_pedidoItemClick(const Sender: TObject;
      const AItem: TListViewItem);

  private
    { Private declarations }
  public
    { Public declarations }
    vmateria: array[1..15]of string;
  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.fmx}

procedure Seleciona_Tab(tab : integer);
begin
        with Frm_Principal do
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

procedure Add_Pedido_Lista(disciplina, materia, descricao : string);
var
        item : TListViewItem;
        txt : TListItemText;
        x: integer;
begin
        with Frm_Principal do
        begin
                item := lv_pedido.items.add;

               // dm.qry_geral.Close;
              //  dm.qry_geral.Sql.Clear();
              //  dm.qry_geral.SQL.Add('select * from avaliacao');
               // dm.qry_geral.Open();




                with item do
                begin
                        // Nome Prova...
                        txt := TListItemText(Objects.FindDrawable('Text1'));
                        txt.Text :=dm.qry_geral.FieldByName('materia').AsString;

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

begin
dm.qry_geral.Active:=false;
dm.qry_geral.sql.Clear;
dm.qry_geral.SQL.Add('select * from Avaliacao');


if busca<>'' then
begin
  dm.qry_geral.SQL.Add('where materia like "%" || :busca || "%" or disciplina like "%" || :busca || "%" or descricao like "%" || :busca || "%"');
  dm.qry_geral.ParamByName('busca').Value:=busca;
end;

dm.qry_geral.Active:=true;

frm_principal.lv_pedido.BeginUpdate;
frm_principal.lv_pedido.items.clear;



for x := 1 to dm.qry_geral.RecordCount do
begin
  Add_Pedido_Lista(dm.qry_geral.FieldByName('MATERIA').AsString,
                   dm.qry_geral.FieldByName('DISCIPLINA').AsString,
                   dm.qry_geral.FieldByName('Descricao').AsString);
  dm.qry_geral.Next;
end;

frm_principal.lv_pedido.EndUpdate;

end;
procedure TFrm_Principal.edt_buscaKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
if key=$13 then
begin
//key:=#0;
  ConsultaProva(edt_busca.Text);
end;

end;

procedure TFrm_Principal.FormShow(Sender: TObject);
begin
caption:='ProvasOn';
  image2.Visible:=false;

  Frm_Principal.Height := Screen.Height;

  Frm_Principal.Width := Screen.Width;
  image1.Visible:=false;
         ConsultaProva('');
        //Add_Pedido_Lista('Prova Teste', '99 Coders', '15/10/2018', '7.500,00',  'S', 'P');
       // Add_Pedido_Lista('0002', '99 Coders', '20/10/2018', '350,00', 'N', 'O');
end;


procedure TFrm_Principal.img_buscaClick(Sender: TObject);
begin
ConsultaProva(edt_busca.Text);
end;

procedure TFrm_Principal.img_tab_clienteClick(Sender: TObject);
begin
        Seleciona_Tab(2);
end;

procedure TFrm_Principal.img_tab_maisClick(Sender: TObject);
begin
        freeandnil(frm_principal);
end;

procedure TFrm_Principal.img_tab_notificacaoClick(Sender: TObject);
begin
        Seleciona_Tab(3);
end;

procedure TFrm_Principal.img_tab_pedidoClick(Sender: TObject);
begin
        Seleciona_Tab(1);
end;



procedure TFrm_Principal.lv_pedidoClick(Sender: TObject);
begin
//showmessage('teste');
end;

procedure TFrm_Principal.lv_pedidoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
  var txt: TListItemText;
  materia,disciplina,descricao: string;

begin

//  with AItem do begin
  //txt := TListItemText(Objects.FindDrawable('Text2'));

  //materia := listitemdrawabletostr(lv_pedido.Selected.View.FindDrawable('text1'));

   // materia:= dm.qry_geral.FieldByName('materia').AsString;
   // txt.Text :=dm.qry_geral.FieldByName('materia').AsString;
   {
    // Disciplina...
    txt := TListItemText(Objects.FindDrawable('Text2'));
    txt.Text := 'Disciplina: ' + dm.qry_geral.FieldByName('disciplina').AsString;
    disciplina:=txt.Text;
    // Data Prova...
    txt := TListItemText(Objects.FindDrawable('Text3'));
    txt.Text := 'Descrição: ' + dm.qry_geral.FieldByName('descricao').AsString;
    descricao:=txt.Text;
  {  // valor...
    txt := TListItemText(Objects.FindDrawable('Text4'));
    txt.Text := '100/100 ';      }

  end;
//end;





{procedure TFrm_Principal.lv_pedidoDblClick(Sender: TObject);
var i:integer;
begin
with lv_pedido do
begin
  i := 0;
  while i < Items.Count do
  if lv_pedido.items[i] then
  begin

    break;
  else
  Inc(i);
end;
frm_principal.lv_pedido.items[lv_pedido.selected.index].TObjectNames
end;  }

procedure TFrm_Principal.TabMaisClick(Sender: TObject);
begin
freeandnil(frm_principal);
end;


end.
