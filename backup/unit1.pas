unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, EditBtn, ExtCtrls,
  PReport, BCListBox, Clipbrd, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Image1:TImage  ;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);





  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.FormCreate(Sender: TObject);

begin

  image1.Canvas.Brush.Color := clblack;
  image1.Canvas.Brush.Style := bsSolid;

  image1.Canvas.FloodFill(100,100,clblack,fsSurface);
  image1.Canvas.Font.Color:=clwhite;
  image1.Canvas.Font.size:=25;
  image1.Canvas.Font.Name:='Montserrat';

end;

procedure TForm1.Button1Click(Sender: TObject);
var s,s1,s3:string;
var a,s2:array of string;
var j,i,len,x,y:integer;
begin
  i:=0;
  j:=0;
  s:=edit1.text;
 a:=s.Split(' ');
 len:=length (s) div 15;
 setlength(s2,len);
 while j<(length(a)-1) do begin
   while (length (s2[i]))<23 do begin
   s2[i]:=s2[i]+' '+a[j];
   if j=length(a)-1 then break;
   inc(j);
 end;
 inc(i);
 end;
 image1.Canvas.TextOut(75,15,'Цитаты великих людей');
 x:=75;
 y:=90;
for i:=0 to len-1 do begin
image1.Canvas.TextOut(x,y,s2[i]);
y:=y+45;
end;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

end.

