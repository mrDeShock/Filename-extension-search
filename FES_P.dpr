program FES_P;

uses
  Forms,
  FES_U in 'FES_U.pas' {Form1},
  FES_U2 in 'FES_U2.pas' {Form2},
  FES_U3 in 'FES_U3.pas' {Form3},
  FES_U4 in 'FES_U4.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
