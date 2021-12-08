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
DataModule2.ADOTcategory.Locate('Назва',DBGrid1.Fields[2].AsString,[loCaseInsensitive, loPartialKey]);
DBLookupComboBox1.KeyValue:= StrToInt(DataModule2.Datacategory.DataSet.Fields[0].AsString);
Button1.Visible:=false;
Button4.Visible:=True;

Panel2.Visible:=true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
DataModule2.ADOQprodaj.Close;
DataModule2.ADOQprodaj.SQL.Text:= 'DELETE * FROM tovar Where (tovar.код_товару = '+DBGrid1.Fields[0].AsString+')';
DataModule2.ADOQprodaj.ExecSQL;
FormShow(Sender);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
//DataModule1.ADOQtovar.Close;
//DataModule1.ADOQtovar.SQL.Text:= 'SELECT tovar.код_товару, tovar.Наименование AS tovar_Наименование, category.Наименование AS category_Наименование, tovar.Ед_изм, tovar.Ціна '
//+' FROM category INNER JOIN tovar ON category.[код_категорії] = tovar.[код_категорії] ORDER BY tovar.код_товару';
//DataModule1.ADOQtovar.Open;

//DataModule2.ADOQTovar.Close;
//DataModule2.ADOQTovar.SQL.Text:= 'SELECT tovar.код_товару, tovar.Наименование AS tovar_Наименование, category.Наименование AS category_Наименование, tovar.Ед_изм, tovar.Ціна '
//+' FROM category, tovar WHERE category.[код_категорії] = tovar.[код_категорії] ORDER BY tovar.код_товару';
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
DataModule2.ADOQprodaj.SQL.Text:='UPDATE tovar SET tovar.Назва = "'+Edit1.Text+'", tovar.Код_категорії = "'+IntToStr(DBLookupComboBox1.KeyValue)+'", tovar.Ціна = '+Edit3.Text+' '
+' WHERE (((Tovar.Код_товару)='+DBGrid1.Fields[0].AsString+'))';
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
DataModule2.ADOQprodaj.SQL.Text:='INSERT INTO tovar ( [Назва], [Код_категорії], [Ціна] ) values ("'+Edit1.Text+'", '+IntToStr(DBLookupComboBox1.KeyValue)+', "'+Edit3.Text+'")';
DataModule2.ADOQprodaj.ExecSQL;

DataModule2.ADOQtovar.Close;
DataModule2.ADOQTovar.SQL.Text:= 'SELECT tovar.код_товару, tovar.Назва AS tovar_Назва, category.Назва AS category_Назва, tovar.Ціна '
+' FROM category, tovar WHERE category.[код_категорії] = tovar.[код_категорії] ORDER BY tovar.код_товару';
DataModule2.ADOQTovar.Open;

panel2.Visible:=False;
end;

procedure TForm1.Edit5Change(Sender: TObject);
begin
DataModule2.ADOQTovar.Close;
DataModule2.ADOQTovar.SQL.Text:= 'SELECT tovar.код_товару, tovar.Назва AS tovar_Назва, category.Назва AS category_Назва, tovar.Ціна '
+' FROM category INNER JOIN tovar ON category.[код_категорії] = tovar.[код_категорії] where tovar.Назва like "%'+Edit5.Text+'%" ORDER BY tovar.код_товару';
DataModule2.ADOQTovar.Open;
end;


procedure TForm1.Button5Click(Sender: TObject);
begin
DataModule2.ADOQChek.Close;
DataModule2.ADOQChek.SQL.Text:='SELECT Check.[код_чеку], Check.[Дата], Check.[Общая_сумма] FROM [Check]';
DataModule2.ADOQChek.Open;
end;

procedure TForm1.Button10Click(Sender: TObject);
begin
DataModule2.ADOQtovar.Close;
DataModule2.ADOQtovar.SQL.Text:= 'SELECT tovar.код_товару, tovar.назва AS tovar_назва, category.назва AS category_назва, tovar.ціна '
+' FROM category INNER JOIN tovar ON category.[Код_категорії] = category.[Код_категорії] where tovar.Код_товару = '+Edit2.Text+' ORDER BY tovar.Код_товару';
DataModule2.ADOQtovar.Open;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
DataModule2.ADOQtovar.Close;
DataModule2.ADOQtovar.SQL.Text:= 'SELECT tovar.Код_товару, tovar.Назва AS tovar_Назва, category.Назва AS category_Назва, tovar.Ціна '
+' FROM category, tovar WHERE category.[Код_категорії] = tovar.[Код_категорії] ORDER BY tovar.Код_товару';
DataModule2.ADOQtovar.Open;
end;
procedure TForm1.Edit2Change(Sender: TObject);
begin
DataModule2.ADOQTovar.Close;
DataModule2.ADOQTovar.SQL.Text:= 'SELECT tovar.код_товару, tovar.Назва AS tovar_Назва, category.Назва AS category_Назва, tovar.Ціна '
+' FROM category INNER JOIN tovar ON category.[код_категорії] = tovar.[код_категорії] where tovar.код_товару like "%'+Edit2.Text+'%" ORDER BY tovar.назва';
DataModule2.ADOQTovar.Open;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
DataModule2.ADOQChek.Close;
DataModule2.ADOQChek.SQL.Text:= 'SELECT Chek.Код_чеку,Chek.Дата,Chek.заг_сума'
+' FROM Prodaj INNER JOIN Chek ON Prodaj.[Код_чеку] = Chek.[Код_чеку] where Chek.Дата like "%'+Edit4.Text+'%" ORDER BY Chek.заг_сума';
DataModule2.ADOQChek.Open;
end;

end.
