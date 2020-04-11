program LABPSI;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form_Inicial in 'Form_Inicial.pas' {Frm_Inicial},
  Form_Login in 'Form_Login.pas' {Frm_Login},
  Form_Login_prof in 'Form_Login_prof.pas' {Form1},
  Form_inicial_aluno in 'Form_inicial_aluno.pas' {Form2},
  Form_inicial_prof in 'Form_inicial_prof.pas' {Form3},
  DataModule in 'DataModule.pas' {dm: TDataModule},
  Form_Principal in 'Form_Principal.pas' {Frm_Principal},
  Form_Principal1 in 'Form_Principal1.pas' {Frm_Principal1},
  Form_Provas in 'Form_Provas.pas' {frmprovas},
  questoes in 'questoes.pas' {Form_questoes},
  Umessages in 'Umessages.pas' {Form_msg},
  Form_Mensagem in 'Form_Mensagem.pas' {Frm_Mensagem},
  vouf in 'vouf.pas' {Form4},
  editarprova in 'editarprova.pas' {Form5},
  MsgConfExc in 'MsgConfExc.pas' {Form_msg1},
  Multiplaescolha in 'Multiplaescolha.pas' {Form7},
  opEDIPUB in 'opEDIPUB.pas' {Form8},
  Publicacao in 'Publicacao.pas' {Form9},
  ExclQues in 'ExclQues.pas' {Form10},
  Principal_Aluno in 'Principal_Aluno.pas' {Form11},
  selecionarquestoes in 'selecionarquestoes.pas' {Form12},
  confirmacaoquestao in 'confirmacaoquestao.pas' {Form13},
  telaprovaluno in 'telaprovaluno.pas' {Form14};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm_Inicial, Frm_Inicial);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm_questoes, Form_questoes);
  Application.CreateForm(TForm_msg, Form_msg);
  Application.CreateForm(TFrm_Mensagem, Frm_Mensagem);
  Application.CreateForm(Tfrmprovas, frmprovas);
  Application.CreateForm(TFrm_Login, Frm_Login);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrm_Principal1, Frm_Principal1);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm_msg1, Form_msg1);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  //Application.CreateForm(TFrm_Editar, Frm_Editar);
  Application.Run;
end.
