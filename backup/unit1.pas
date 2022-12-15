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
  image1.Canvas.rectangle(0,0,500,300);
  image1.Canvas.FloodFill(100,100,clblack,fsSurface);
  image1.Canvas.Font.Color:=clwhite;
  image1.Canvas.Font.size:=25;
  image1.Canvas.Font.Name:='Montserrat';
  image1.Canvas.TextOut(75,15,'цитаты великих людей');
  image1.Canvas.TextOut(60,60,'lfopjsfiops');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  clipboard.Assign(image1.Picture);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

end.

