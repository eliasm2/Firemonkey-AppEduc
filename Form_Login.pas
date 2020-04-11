unit Form_Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.TabControl, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, FMX.Layouts,
  System.Actions, FMX.ActnList,DataModule;

type
  TFrm_Login = class(TForm)
    Image1: TImage;
    TabControl: TTabControl;
    TabLogin: TTabItem;
    TabRecuperar: TTabItem;
    Layout1: TLayout;
    Image2: TImage;
    Layout2: TLayout;
    Rectangle1: TRectangle;
    edt_matr: TEdit;
    StyleBook1: TStyleBook;
    Layout3: TLayout;
    Rectangle2: TRectangle;
    edt_senha: TEdit;
    Layout4: TLayout;
    Rectangle3: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Layout5: TLayout;
    Mar: TImage;
    Layout6: TLayout;
    Rectangle4: TRectangle;
    Layout8: TLayout;
    Rectangle6: TRectangle;
    Label6: TLabel;
    Layout9: TLayout;
    Rectangle7: TRectangle;
    edt_email_cad: TEdit;
    ActionList1: TActionList;
    ActTabLogin: TChangeTabAction;
    ActTabCadastro: TChangeTabAction;
    Label1: TLabel;
    Label7: TLabel;
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
    Layout13: TLayout;
    Rectangle10: TRectangle;
    Edit3: TEdit;
    lbl_rodape: TLabel;
    ActTabRecuperar: TChangeTabAction;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
   // procedure lbl_rodapeClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure lbl_rodapeClick(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Login: TFrm_Login;
  temp: boolean;



implementation

{$R *.fmx}

uses Form_inicial_aluno;

procedure TFrm_Login.FormCreate(Sender: TObject);
begin
        TabControl.TabPosition := TTabPosition.None;
end;

procedure TFrm_Login.FormShow(Sender: TObject);
begin
caption:='ProvasOn';
Frm_Login.Height := Screen.Height;

  Frm_Login.Width := Screen.Width;
  Frm_Login.Left := 0;

  Frm_Login.Top  := 0;
       // TabControl.ActiveTab = TabLogin;
end;

procedure TFrm_Login.Label2Click(Sender: TObject);
var
senha, query: string;

begin
if (edt_matr.Text<>'') then
begin
  if (edt_senha.Text<>'') then
  begin
    dm.qry_geral.Close;
    dm.qry_geral.SQL.Clear();
    dm.qry_geral.SQL.Add('select SENHA from ALUNO where MATRICULA ='+(trim(edt_matr.Text)));
    dm.qry_geral.Open;
    //senha:=dm.qry_geral.FieldByName('SENHA').AsString;
    //query:= edt_senha.Text;
    if dm.qry_geral.IsEmpty then
    begin
      showmessage('Usuário não cadastrado!');
      edt_matr.SetFocus;
      exit;
    end;

    if dm.qry_geral.FieldByName('SENHA').AsString <> edt_senha.Text then
    begin
      showmessage('Senha Incorreta!');
      edt_senha.SetFocus;
      exit;
    end;

    Form2.Show;
    close;
  end
  else
  ShowMessage('Digite a sua senha');
end
else
ShowMessage('Digite a sua matrícula');
end;

procedure TFrm_Login.Label3Click(Sender: TObject);
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


procedure TFrm_Login.Label6Click(Sender: TObject);
begin
showmessage('A sua requisição de Recuperação de conta será enviada e validada. Para mais informações procure a secretaria');
end;

procedure TFrm_Login.Label9Click(Sender: TObject);
begin
showmessage('O seu pedido de cadastro será enviado e será validado. Para mais informações procure a secretaria');
end;

procedure TFrm_Login.lbl_rodapeClick(Sender: TObject);
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

