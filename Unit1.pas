unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, ComCtrls,DB;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label7: TLabel;
    Button2: TButton;
    Edit5: TEdit;
    Button18: TButton;
    Button19: TButton;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit3: TEdit;
    Button4: TButton;
    Button6: TButton;
    DBLookupComboBox1: TDBLookupComboBox;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    Panel4: TPanel;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button1: TButton;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    Label1: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Label4: TLabel;
    Edit4: TEdit;
    procedure Button18Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


implementation

uses Unit2;

{$R *.dfm}

procedure TForm1.Button18Click(Sender: TObject);
begin
Edit1.Text:='';
Edit3.Text:='';
DBLookupComboBox1.KeyValue:=1;
Button1.Visible:=true;
Button4.Visible:=false;
Panel2.Visible:=true;

end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  Edit1.Text:=DBGrid1.Fields[1].AsString;
  Edit3.Text:=DBGrid1.Fields[3].AsString;
DataModule2.ADOTcategory.Locate('�����',DBGrid1.Fields[2].AsString,[loCaseInsensitive, loPartialKey]);
DBLookupComboBox1.KeyValue:= StrToInt(DataModule2.Datacategory.DataSet.Fields[0].AsString);
Button1.Visible:=false;
Button4.Visible:=True;

Panel2.Visible:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
DataModule2.ADOQprodaj.Close;
DataModule2.ADOQprodaj.SQL.Text:= 'DELETE * FROM tovar Where (tovar.���_������ = '+DBGrid1.Fields[0].AsString+')';
DataModule2.ADOQprodaj.ExecSQL;
FormShow(Sender);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//DataModule1.ADOQtovar.Close;
//DataModule1.ADOQtovar.SQL.Text:= 'SELECT tovar.���_������, tovar.������������ AS tovar_������������, category.������������ AS category_������������, tovar.��_���, tovar.ֳ�� '
//+' FROM category INNER JOIN tovar ON category.[���_�������] = tovar.[���_�������] ORDER BY tovar.���_������';
//DataModule1.ADOQtovar.Open;

//DataModule2.ADOQTovar.Close;
//DataModule2.ADOQTovar.SQL.Text:= 'SELECT tovar.���_������, tovar.������������ AS tovar_������������, category.������������ AS category_������������, tovar.��_���, tovar.ֳ�� '
//+' FROM category, tovar WHERE category.[���_�������] = tovar.[���_�������] ORDER BY tovar.���_������';
//DataModule2.ADOQTovar.Open;

end;

procedure TForm1.Button8Click(Sender: TObject);
begin
 DataModule2.ADOTpersonal.Insert;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
if  DataModule2.ADOTpersonal.Modified then
 DataModule2.ADOTpersonal.Post;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
 DataModule2.ADOTpersonal.Delete;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin

DataModule2.ADOQprodaj.Close;
DataModule2.ADOQprodaj.SQL.Text:='UPDATE tovar SET tovar.����� = "'+Edit1.Text+'", tovar.���_������� = "'+IntToStr(DBLookupComboBox1.KeyValue)+'", tovar.ֳ�� = '+Edit3.Text+' '
+' WHERE (((Tovar.���_������)='+DBGrid1.Fields[0].AsString+'))';
DataModule2.ADOQprodaj.ExecSQL;

FormShow(Sender);


panel2.Visible:=False;

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
Edit1.Text:='';
Edit3.Text:='';
FormShow(Sender);
panel2.Visible:=False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
DataModule2.ADOQprodaj.Close;
DataModule2.ADOQprodaj.SQL.Text:='INSERT INTO tovar ( [�����], [���_�������], [ֳ��] ) values ("'+Edit1.Text+'", '+IntToStr(DBLookupComboBox1.KeyValue)+', "'+Edit3.Text+'")';
DataModule2.ADOQprodaj.ExecSQL;

DataModule2.ADOQtovar.Close;
DataModule2.ADOQTovar.SQL.Text:= 'SELECT tovar.���_������, tovar.����� AS tovar_�����, category.����� AS category_�����, tovar.ֳ�� '
+' FROM category, tovar WHERE category.[���_�������] = tovar.[���_�������] ORDER BY tovar.���_������';
DataModule2.ADOQTovar.Open;

panel2.Visible:=False;
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
DataModule2.ADOQTovar.Close;
DataModule2.ADOQTovar.SQL.Text:= 'SELECT tovar.���_������, tovar.����� AS tovar_�����, category.����� AS category_�����, tovar.ֳ�� '
+' FROM category INNER JOIN tovar ON category.[���_�������] = tovar.[���_�������] where tovar.����� like "%'+Edit5.Text+'%" ORDER BY tovar.���_������';
DataModule2.ADOQTovar.Open;
end;


procedure TForm1.Button5Click(Sender: TObject);
begin
DataModule2.ADOQChek.Close;
DataModule2.ADOQChek.SQL.Text:='SELECT Check.[���_����], Check.[����], Check.[�����_�����] FROM [Check]';
DataModule2.ADOQChek.Open;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
DataModule2.ADOQtovar.Close;
DataModule2.ADOQtovar.SQL.Text:= 'SELECT tovar.���_������, tovar.����� AS tovar_�����, category.����� AS category_�����, tovar.���� '
+' FROM category INNER JOIN tovar ON category.[���_�������] = category.[���_�������] where tovar.���_������ = '+Edit2.Text+' ORDER BY tovar.���_������';
DataModule2.ADOQtovar.Open;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
DataModule2.ADOQtovar.Close;
DataModule2.ADOQtovar.SQL.Text:= 'SELECT tovar.���_������, tovar.����� AS tovar_�����, category.����� AS category_�����, tovar.ֳ�� '
+' FROM category, tovar WHERE category.[���_�������] = tovar.[���_�������] ORDER BY tovar.���_������';
DataModule2.ADOQtovar.Open;
end;
procedure TForm1.Edit2Change(Sender: TObject);
begin
DataModule2.ADOQTovar.Close;
DataModule2.ADOQTovar.SQL.Text:= 'SELECT tovar.���_������, tovar.����� AS tovar_�����, category.����� AS category_�����, tovar.ֳ�� '
+' FROM category INNER JOIN tovar ON category.[���_�������] = tovar.[���_�������] where tovar.���_������ like "%'+Edit2.Text+'%" ORDER BY tovar.�����';
DataModule2.ADOQTovar.Open;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
DataModule2.ADOQChek.Close;
DataModule2.ADOQChek.SQL.Text:= 'SELECT Chek.���_����,Chek.����,Chek.���_����'
+' FROM Prodaj INNER JOIN Chek ON Prodaj.[���_����] = Chek.[���_����] where Chek.���� like "%'+Edit4.Text+'%" ORDER BY Chek.���_����';
DataModule2.ADOQChek.Open;
end;

end.
