unit Form_Login_prof;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Objects, FMX.Layouts, FMX.TabControl, FMX.Controls.Presentation,
  FMX.StdCtrls, System.Actions, FMX.ActnList, DataModule;

type
  TForm1 = class(TForm)
    ActionList1: TActionList;
    ActTabLogin: TChangeTabAction;
    ActTabRecuperar: TChangeTabAction;
    ActTabCadastro: TChangeTabAction;
    Image1: TImage;
    lbl_rodape: TLabel;
    StyleBook1: TStyleBook;
    TabControl: TTabControl;
    TabLogin: TTabItem;
    Layout1: TLayout;
    Image2: TImage;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    edt_login: TEdit;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    edt_senha: TEdit;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    TabCadastro: TTabItem;
    Label8: TLabel;
    Layout7: TLayout;
    Image4: TImage;
    Layout10: TLayout;
    Rectangle5: TRectangle;
    Edit1: TEdit;
    Layout11: TLayout;
    Rectangle8: TRectangle;
    Edit2: TEdit;
    Layout12: TLayout;
    Rectangle9: TRectangle;
    Label9: TLabel;
    Layout14: TLayout;
    Rectangle11: TRectangle;
    Edit4: TEdit;
    TabRecuperar: TTabItem;
    Label5: TLabel;
    Layout5: TLayout;
    Image3: TImage;
    Layout6: TLayout;
    Rectangle4: TRectangle;
    Label7: TLabel;
    Layout8: TLayout;
    Rectangle6: TRectangle;
    Label6: TLabel;
    Layout9: TLayout;
    Rectangle7: TRectangle;
    edt_email_cad: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure lbl_rodapeClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses form_inicial_prof;

procedure TForm1.FormCreate(Sender: TObject);
begin
caption:='ProvasOn';
//Form1.BorderStyle := None;
Form1.Left := 0;

  Form1.Top  := 0;

 Form1.Height := Screen.Height;

  Form1.Width := Screen.Width;
        TabControl.TabPosition := TTabPosition.None;
end;

procedure TForm1.Label2Click(Sender: TObject);
var
teste: string;
begin
if (edt_login.Text<>'') then
begin
  if (edt_senha.Text<>'') then
  begin
    dm.qry_prof.Close;
    dm.qry_prof.SQL.Clear();
    //teste:= (edt_login.text);
    dm.qry_prof.SQL.Add('select SENHA from PROFESSOR where LOGIN ='+(trim(edt_login.Text)));
    dm.qry_prof.Open;
    //teste:= dm.qry_prof.FieldByName('SENHA').AsString;
    if dm.qry_prof.IsEmpty then
    begin
      showmessage('Usuário não cadastrado!');
      edt_login.SetFocus;
      exit;
    end;

    if dm.qry_prof.FieldByName('SENHA').AsString <> edt_senha.Text then
    begin
      showmessage('Senha Incorreta!');
      edt_senha.SetFocus;
      exit;
    end;


    Form3.Show;
    close;
  end
  else
  ShowMessage('Digite a sua senha');
end
else
ShowMessage('Digite a sua matrícula');
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
if TabControl.ActiveTab = TabLogin then
begin
  ActTabRecuperar.ExecuteTarget(sender);
end
else
begin
  ActTabLogin.ExecuteTarget(sender);
end;
end;


procedure TForm1.Label6Click(Sender: TObject);
begin
showmessage('A sua requisição de Recuperação de conta será enviada e validada. Para mais informações procure a secretaria');
end;

procedure TForm1.Label9Click(Sender: TObject);
begin
showmessage('O seu pedido de cadastro será enviado e será validado. Para mais informações procure a secretaria');
end;

procedure TForm1.lbl_rodapeClick(Sender: TObject);
begin
    if TabControl.ActiveTab = TabLogin then
        begin
                ActTabCadastro.ExecuteTarget(sender);
                lbl_rodape.Text := 'Já tem Cadastro? Faça Login!!! ';
        end

    else if TabControl.ActiveTab= TabCadastro then
        begin
                ActTabLogin.ExecuteTarget(sender);
                lbl_rodape.Text := 'Não tem Cadastro? Cadastre-se agora'
        end;

end;

end.
