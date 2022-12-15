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
    PaintBox1: TPaintBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormOnShow  (Sender: TObject);




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

end;

procedure TForm1.FormOnShow(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  PaintBox1.Canvas.Brush.Color := clblack;
  PaintBox1.Canvas.Brush.Style := bsSolid;
  PaintBox1.Canvas.rectangle(0,0,500,300);
  PaintBox1.Canvas.FloodFill(100,100,clblack,fsSurface);
  paintbox1.Canvas.Font.Color:=clwhite;
  paintbox1.Canvas.Font.size:=25;
  paintbox1.Canvas.Font.Name:='Montserrat';
  paintbox1.Canvas.TextOut(50,15,edit1.text);
end;

end.

