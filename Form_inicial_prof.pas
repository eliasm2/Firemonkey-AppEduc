unit Form_inicial_prof;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts,Form_Principal1;

type
  TForm3 = class(TForm)
    layout_fundo: TLayout;
    Layout5: TLayout;
    Image4: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Button1: TButton;
    Button2: TButton;
    layout_wizard: TLayout;
    layout_slide1: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Layout2: TLayout;
    lbl_voltar: TLabel;
    lbl_proximo: TLabel;
    Layout3: TLayout;
    Layout4: TLayout;
    Circle1: TCircle;
    Circle2: TCircle;
    Circle3: TCircle;
    layout_slide2: TLayout;
    Image2: TImage;
    Label5: TLabel;
    Label6: TLabel;
    layout_slide3: TLayout;
    Image3: TImage;
    Label7: TLabel;
    Label8: TLabel;
    StyleBook1: TStyleBook;
    procedure FormShow(Sender: TObject);
    procedure lbl_proximoClick(Sender: TObject);
    procedure lbl_voltarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}


procedure Trata_Slides(slide : integer);
begin
        with Form3 do
        begin
                layout_slide1.Visible := false;
                layout_slide2.Visible := false;
                layout_slide3.Visible := false;
                Circle1.Fill.Color := $FFBDBDBD;
                Circle2.Fill.Color := $FFBDBDBD;
                Circle3.Fill.Color := $FFBDBDBD;
                lbl_voltar.Visible := false;

                if slide = 1 then
                begin
                        layout_slide1.Visible := true;
                        Circle1.Fill.Color := $FF1E87AF;
                end;
                if slide = 2 then
                begin
                        layout_slide2.Visible := true;
                        Circle2.Fill.Color := $FF1E87AF;
                        lbl_voltar.Visible := true;
                end;
                if slide = 3 then
                begin
                        layout_slide3.Visible := true;
                        Circle3.Fill.Color := $FF1E87AF;
                        lbl_voltar.Visible := true;
                end;
        end;
end;


procedure TForm3.FormShow(Sender: TObject);
begin
caption:='ProvasOn';
form3.Height := Screen.Height;

  form3.Width := Screen.Width;
        Trata_Slides(1);
end;




procedure TForm3.lbl_proximoClick(Sender: TObject);
var
        slide_atual : integer;
begin
        if Circle1.Fill.Color = $FF1E87AF then
                slide_atual := 1;
        if Circle2.Fill.Color = $FF1E87AF then
                slide_atual := 2;
        if Circle3.Fill.Color = $FF1E87AF then
                slide_atual := 3;

        if slide_atual > 2 then
        begin
                layout_wizard.Visible := false;
                close;
                Frm_Principal1.show;

        end
        else
                slide_atual := slide_atual + 1;

        Trata_Slides(slide_atual);
end;

procedure TForm3.lbl_voltarClick(Sender: TObject);
var
        slide_atual : integer;
begin
        if Circle1.Fill.Color = $FF1E87AF then
                slide_atual := 1;
        if Circle2.Fill.Color = $FF1E87AF then
                slide_atual := 2;
        if Circle3.Fill.Color = $FF1E87AF then
                slide_atual := 3;

        if slide_atual > 1 then
                slide_atual := slide_atual - 1;


        Trata_Slides(slide_atual);
end;



end.
