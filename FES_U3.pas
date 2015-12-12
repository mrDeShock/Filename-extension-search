unit FES_U3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Forms, XPMan,// ����������� ������
  Dialogs, // ������ ��� �������� (showmessage)
  Controls, StdCtrls, // ������ ��� TLabel, TButton, TEdit
  DB, ADODB, Menus, // ������ ��� ����������� � ��
  VistaAltFixUnit;  //���� ������� conrol �� ������� �� ����
type
  TForm3 = class(TForm)
    EFileName: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Label4: TLabel;
    Label5: TLabel;
    ADOConnection1: TADOConnection;
    Label6: TLabel;
    MainMenu1: TMainMenu;
    Selectfile1: TMenuItem;
    Open1: TMenuItem;
    Close1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    Memo2: TMemo;
    Memo3: TMemo;
    N1: TMenuItem;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure Help1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses FES_U5;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  a:array [0..127] of byte; // ������ ������ ��� ������ �� �����
  s_hex:string; // ������ ��� �������������� �� ������� ^^^ � ����������������� ��� ��� ������� � ��
  i:Integer; // ���������� ��� �����
  pth:string; //������ ��� ������ ����� �� ���������
  ext:string; // ������ � ����������� �����
begin
pth := ExtractFileDir(Application.ExeName);
if pth[Length(pth)] <> '\' then
pth := pth + '\';
try
ADOConnection1.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+pth+'extension.mdb;Persist Security Info=False;Jet OLEDB:Database Password=AQXdRtqzXS';
ADOConnection1.Connected := True; // ������������ � ��
except
// ����������� try ... except ... end ��� ��������� ������
end;

// ��������� ���������� �� ��. ���� ��� - �������
if not ADOConnection1.Connected then
  begin
  ShowMessage('���� ����� �� ���������');
  Exit;
  end;

EFileName.Clear; // ������ ���� � ������ �����

with TOpenDialog.Create(nil) do // ������� ������ ������ �����
  begin
  if Execute then // ���� ���� ������ ��...
    EFileName.Text := FileName; // ...��������� ��� �����
  Free; // "�������" ������ ������ �����
  end;

if EFileName.Text = EmptyStr then // ���� �����...
  Exit; // ...�������

with TFileStream.Create(EFileName.Text, fmOpenRead or fmShareDenyNone) do // ������� ����� ��� �������� �����
  begin
  ReadBuffer(a, SizeOf(a)); // ������ � ������ ������ 128 ����
  Free; // "�������" �������� �����
  end;

for i := Low(a) to High(a) do // ����� �� ������� �� ������� �� ���������� ��������
  s_hex := s_hex + IntToHex(a[i], 2); // ��������� ������ ������������������ ���������� �� �������

with TADOQuery.Create(nil) do // ������� ������ ��� ��������� ������ �� ��
  begin
  Connection := ADOConnection1; // ��������� ����� ������������ ������������
  SQL.Text := 'select * from File_Extension where :hex like hex+"%"'; // ������ � ������� ��� ��������� ������
  Parameters.ParamByName('hex').Value := s_hex; // �������� �������� ��� �������
  Open; // ���������
  First; // ���������� �� ������ ������
  if CheckBox1.Checked = True then // ���� � checkbox ����� ������� �� ��������� ����� �� Hex
  if not Eof then // ���� ���� ���� ���� ������, �� Eof �� ����� �����. ������ ���� � ��� ��������
    begin // ����� ��� �������
    Label3.Visible:=false;
    Label2.Visible:=false;
    Label6.Caption := '������� Hex';
    Label6.Visible:=true;
    Memo2.Lines.Text := FieldByName('Program').AsString;
    Memo2.Visible:=true;
    Label4.Visible:=true;
    Memo3.Lines.Text := FieldByName('����').AsString;
    Memo3.Visible:=true;
    Label5.Visible:=true;
    ext:= ExtractFileExt(EFileName.Text); //������ ���������� � ext
    if ext = '' then //���� ���������� � ����� ���
    begin
    Label2.Caption := FieldByName('Ext').AsString;
    Label3.Visible:=true;
    Label2.Visible:=true;
    end
    else
    end
  else // ���� �� checkbox ��� ������� � ���� �� ��������
  else // ���� ������ �� ���� �������...
    begin // ... ���� �� ����������
    SQL.Text := 'select * from File_Extension where Extension=:ext';
    Parameters.ParamByName('ext').Value := ExtractFileExt(EFileName.Text);
    Open;
    First;
    if not Eof then
      begin // ����� ��� �������
      Label6.Caption := '������� Ext';
      Label6.Visible:=true;
      Memo2.Lines.Text := FieldByName('Program').AsString;
      Memo2.Visible:=true;
      Label4.Visible:=true;
      Memo3.Lines.Text := FieldByName('����').AsString;
      Memo3.Visible:=true;
      Label5.Visible:=true;
      end
    else // ���� � ��� ������ �� �������...
      begin // ...����� ��� �� �������
      Label6.Caption := 'ͳ���� �� ��������. ����������, ���� �����, ��� ���� �� ��� �����: mrDeShock@yandex.ua';
      Label6.Visible:=true;
      Memo2.Lines.Text := EmptyStr;
      Memo3.Lines.Text := EmptyStr;
      end;
    end;
  Free;
  end;

ADOConnection1.Connected := False;
end;


procedure TForm3.Close1Click(Sender: TObject);
begin
Form3.Close;
end;

procedure TForm3.About1Click(Sender: TObject);
begin
Form5.Show;
end;

procedure TForm3.Help1Click(Sender: TObject);
var
eth:string;
begin
eth:= ExtractFilePath(Application.ExeName);
SetCurrentDir(eth);
WinExec('hh.exe help_ua.chm',SW_SHOW);
end;


end.
