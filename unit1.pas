unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, EditBtn, ExtCtrls,
  PReport, BCListBox, BGRAImageManipulation, Clipbrd, StdCtrls, BGRABitmap,
  BGRABitmapTypes;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1:TImage  ;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);

    procedure FormCreate(Sender: TObject);





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
  image1.Canvas.Font.size:=16;
  ComboBox1.Items := Screen.Fonts;
  ComboBox1.ItemIndex := 0;
end;


procedure TForm1.Button1Click(Sender: TObject);
var s,s1,s3,wois,tmp:string;
var a,s2:array of string;
var j,i,len,x,y:integer;
var temp,tex,mask: TBGRABitmap;
    Bitmap: TBitmap;
begin
image1.canvas.Clear;
  i:=0;
  j:=0;
  s:=edit1.text;
 a:=s.Split(' ');
 len:=length (s) div 25;
 setlength(s2,len);
 while j<(length(a)-1) do begin
   while (length (s2[i]))<40 do begin
   s2[i]:=s2[i]+' '+a[j];
   if j=length(a)-1 then break;
   inc(j);
 end;
 inc(i);
 end;

 image1.Canvas.TextOut(150,15,'Цитаты великих людей');
 x:=55;
 y:=60;
 for i:=0 to len-1 do begin
 image1.Canvas.TextOut(x,y,s2[i]);
 y:=y+25;
 end;
 tmp:=GetEnvironmentVariable('temp');
 wois:='©'+' '+edit2.text;
 image1.Canvas.TextOut(100,180,wois);

Bitmap:=TBitmap.Create;
Bitmap.LoadFromClipboardFormat(CF_BITMAP);
bitmap.SaveToFile(tmp+'/bepe3a.bmp');
temp:= TBGRABitmap.Create(180,360);
 //loading and scaling texture
 tex := TBGRABitmap.Create(tmp+'/bepe3a.bmp');
 BGRAReplace(tex,tex.Resample(50,50));
 //create a mask with ellipse and rectangle
 mask := TBGRABitmap.Create(180,360,BGRABlack);
 mask.FillEllipseAntialias(20,20,20,20,BGRAWhite);

 tex.ApplyMask(mask);

 //show the result image in the lower-left corner
 temp.PutImage(50,170,tex,dmDrawWithTransparency);

 mask.Free;
 tex.Free;

 //show everything on the screen
 temp.Draw(image1.Canvas,0,0,False);
 temp.Free;
tex := TBGRABitmap.Create(image1.picture.bitmap);
 BGRAReplace(tex,tex.Resample(1000,500));
 tex.SaveToFile(tmp+'/bepe3aquotate.bmp');
 Bitmap:=TBitmap.Create;
 Bitmap.LoadFromFile(tmp+'/bepe3aquotate.bmp');
 clipboard.Assign(Bitmap);
Deletefile(tmp+'/bepe3aquotate.bmp');
Deletefile(tmp+'/bepe3a.bmp');

end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
image1.Canvas.Font.Name:=ComboBox1.Items[ComboBox1.ItemIndex];
end;



end.
