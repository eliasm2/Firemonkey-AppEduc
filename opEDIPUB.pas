unit opEDIPUB;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, editarprova, Publicacao;

type
  TForm8 = class(TForm)
    toolbar: TRectangle;
    Label2: TLabel;
    Rectangle2: TRectangle;
    Label3: TLabel;
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Image1: TImage;
    Rectangle3: TRectangle;
    Label4: TLabel;
    Image2: TImage;
    Image3: TImage;
    procedure Rectangle1Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

procedure TForm8.FormShow(Sender: TObject);
begin
caption:='ProvasOn';
end;

procedure TForm8.Image1Click(Sender: TObject);
begin
form5.Show;
end;

procedure TForm8.Image2Click(Sender: TObject);
begin
Form9.show;
end;

procedure TForm8.Image3Click(Sender: TObject);
begin
close;
end;

procedure TForm8.Rectangle1Click(Sender: TObject);
begin
form5.Show;
end;

procedure TForm8.Rectangle3Click(Sender: TObject);
begin
Form9.show;
end;

end.
