unit selecionarquestoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Layouts, FMX.Edit, DataModule, confirmacaoquestao;

type
  TForm12 = class(TForm)
    toolbar: TRectangle;
    Label2: TLabel;
    Image1: TImage;
    Image3: TImage;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Layout1: TLayout;
    ListView1: TListView;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Edit1: TEdit;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    valoratual,valortotal:double;
    idquestao,id_questaoitem:integer;

  end;

var
  Form12: TForm12;



implementation

{$R *.fmx}

uses Publicacao;



procedure Add_Questoes_Lista(id_questao:integer;enunciado: string; Tipo: integer);
var
        item : TListViewItem;
        txt : TListItemText;
        temptipo: integer;
        tipotexto:string;
begin

        with Form12 do
        begin
                item := ListView1.items.add;

               // dm.qry_geral.Close;
              //  dm.qry_geral.Sql.Clear();
              //  dm.qry_geral.SQL.Add('select * from avaliacao');
               // dm.qry_geral.Open();




                with item do
                begin
                        // Enunciado Questão...
                        txt := TListItemText(Objects.FindDrawable('Text2'));
                        txt.Text :=dm.qry_geral.FieldByName('Enunciado').AsString;


                        txt := TListItemText(Objects.FindDrawable('Text1'));
                        txt.Text :='Tema: '+dm.qry_geral.FieldByName('Tema_Questao').AsString;
                        txt.TagString := inttostr(id_questao);

                        //dm.qry_geral.SQL.Clear;
                        temptipo:=dm.qry_geral.FieldByName('tipo').Asinteger ;

                        if temptipo=1then
                        tipotexto:='Questão Verdadeiro e Falso'
                        else
                        tipotexto:='Questão múltipla escolha';

                        txt := TListItemText(Objects.FindDrawable('Text3'));
                        txt.Text :=tipotexto;


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

form12.ListView1.BeginUpdate;
form12.ListView1.items.clear;



for x := 1 to dm.qry_geral.RecordCount do
begin
  Add_Questoes_Lista(dm.qry_geral.FieldByName('id_questao').Asinteger,
                   dm.qry_geral.FieldByName('enunciado').AsString,
                   dm.qry_geral.FieldByName('tipo').Asinteger);
  dm.qry_geral.Next;
end;

form12.listview1.EndUpdate;

end;


procedure TForm12.FormShow(Sender: TObject);
begin
listview1.Items.Clear;
caption:='ProvasOn';
form12.Height := Screen.Height;

  form12.Width := Screen.Width;
   ConsultaQuestao('');
end;

procedure TForm12.Image1Click(Sender: TObject);
var valorfalta:double;
begin
valorfalta:=valortotal-valoratual;
if valoratual<valortotal then
showmessage('Faltam ainda :'+floattostr(valorfalta)+' PTS para finalizar' )
else begin
showmessage('Avaliação Publicada com sucesso');
close;
end;
end;

procedure TForm12.Image2Click(Sender: TObject);
begin
ConsultaQuestao(edit1.Text);
end;

procedure TForm12.Image3Click(Sender: TObject);
begin
close;
end;

procedure TForm12.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
  var txt : TListItemText;
    var temptipo,tempminimo,tempverd, tempvalor:integer;
begin

form13.Show;
  if form13.estado=1 then
  begin
  showmessage('Você Não Inseriu esta Questão ') ;
  exit
  end

  else
  begin

    with AItem do
      begin
      txt := TListItemText(Objects.FindDrawable('Text1'));
      id_questaoitem := txt.TagString.ToInteger;


      end;
  end;
end;

end.
