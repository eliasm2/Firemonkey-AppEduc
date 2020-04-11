unit confirmacaoquestao;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Objects, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, DataModule;

type
  TForm13 = class(TForm)
    toolbar: TRectangle;
    Label2: TLabel;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Layout1: TLayout;
    Image2: TImage;
    Image1: TImage;
    Label3: TLabel;
    Edit1: TEdit;
    procedure Image2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    estado:integer;
    nota:double;
    //0 vai ser SIM e 1 vai ser NÃO
  end;

var
  Form13: TForm13;

implementation

{$R *.fmx}

uses Publicacao, selecionarquestoes;


procedure TForm13.Image1Click(Sender: TObject);
begin
nota:=strtofloat(edit1.Text);
estado:=0;

form12.valoratual:=form12.valoratual+nota;
form12.valortotal:=form9.valortotal;
  if form12.valoratual>form12.valortotal then
  begin
  Showmessage('O valor total da prova já foi alcançado');
  exit;
  end;



dm.qry_geral.Close;
      dm.qry_geral.SQL.Clear;
      dm.qry_geral.sql.Add('SELECT MAX(Id_questaoprova) AS ID FROM questaoprova');
      dm.qry_geral.Open;
      form12.idquestao:=dm.qry_geral.FieldByName('ID').AsInteger + 1;
      dm.qry_geral.SQL.Clear;

      dm.qry_geral.Close;
      dm.qry_geral.SQL.Clear;
      dm.qry_geral.SQL.Add('insert into questaoprova (id_questaoprova,valor_questao,id_questao, id_publicacao) values('+inttostr(form12.idquestao)+','+floattostr(form13.nota)+','+inttostr(form12.id_questaoitem)+','+inttostr(form9.idpublicacao)+')');
      dm.qry_geral.ExecSQL;

     showmessage('Questão escolhida');


     close;

end;

procedure TForm13.Image2Click(Sender: TObject);
begin
estado:=1;
 showmessage('Questão Não escolhida') ;
close;


end;



end.
