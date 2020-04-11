unit questoes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, vouf, Multiplaescolha;

type
  TForm_questoes = class(TForm)
    toolbar: TRectangle;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label3: TLabel;
    groupquestao: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure Image2Click(Sender: TObject);
//    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
//    procedure FormCreate(Sender: TObject);
//    procedure FormCreate(Sender: TObject);
   // procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    temp:boolean;
  end;

var
  Form_questoes: TForm_questoes;

implementation

{$R *.fmx}

procedure TForm_questoes.CheckBox1Change(Sender: TObject);
begin
if checkbox1.IsChecked=true then
begin
checkbox2.IsChecked:=false;
temp:=checkbox1.IsChecked;
end;
end;

procedure TForm_questoes.CheckBox2Change(Sender: TObject);
begin
if checkbox2.IsChecked=true then
begin
checkbox1.IsChecked:=false;
temp:= checkbox2.IsChecked;
end;
end;

procedure TForm_questoes.FormShow(Sender: TObject);
begin
checkbox1.IsChecked:=false;
checkbox2.IsChecked:=false;
end;

procedure TForm_questoes.Image1Click(Sender: TObject);
begin
if checkbox1.IsChecked then
begin
form4.show
end
else if checkbox2.IsChecked then
begin
form7.Show;
end
else
showmessage('Escolha uma das opções!!!');


end;

procedure TForm_questoes.Image2Click(Sender: TObject);
begin
if checkbox1.IsChecked=true then
begin
close;
//tela.show
end
else if checkbox2.IsChecked=true then
begin
close;

end;


end;

end.
