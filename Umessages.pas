unit Umessages;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, questoes,
  Form_Principal1;

type
  TForm_msg = class(TForm)
    toolbar: TRectangle;
    Label2: TLabel;
    Rectangle1: TRectangle;
    Image1: TImage;
    Image2: TImage;
    Layout1: TLayout;
    Label1: TLabel;
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure Image1MouseLeave(Sender: TObject);
    procedure Image2MouseLeave(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_msg: TForm_msg;

implementation

{$R *.fmx}

procedure TForm_msg.Image1Click(Sender: TObject);
begin
Form_questoes.Show;
end;

procedure TForm_msg.Image1MouseLeave(Sender: TObject);
begin
image1.Opacity:=0.5;
end;

procedure TForm_msg.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
image1.Opacity:=1.0;
end;

procedure TForm_msg.Image2Click(Sender: TObject);
begin
close;
showmessage('Prova em branco');
Frm_principal1.Close;
frm_principal1.Show;
end;

procedure TForm_msg.Image2MouseLeave(Sender: TObject);
begin
image2.Opacity:=0.5;
end;

procedure TForm_msg.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
image2.Opacity:=1.0;
end;

end.
