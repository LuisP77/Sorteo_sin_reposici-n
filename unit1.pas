unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Grids,
  ComCtrls, StdCtrls, Buttons;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    TrackBar1: TTrackBar;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
const
  Nmax = 10;
type
  vector = array[1..NMax] of byte;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.TrackBar1Change(Sender: TObject);
var
  N,i : byte;
begin
  N := TrackBar1.Position;
  Label1.Caption := IntToStr(N);
  StringGrid1.RowCount := N + 1;
  for i:=1 to N do begin
      if (StringGrid1.Cells[0,i]='') then
         StringGrid1.Cells[0,i] := IntToStr(i);
      StringGrid1.Cells[1,i] := '';
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StringGrid1.Cells[0,0] := 'GRUP';
  StringGrid1.Cells[1,0] := 'N';
  StringGrid1.Cells[0,1] := '1';
  StringGrid1.Cells[0,2] := '2';
end;

procedure eliminar(pos:byte; var A:vector; var N:byte);
var
   i : byte;
begin
  for i := pos to N-1 do
      A[i] := A[i+1];
  N := N - 1;
end;
procedure TForm1.BitBtn1Click(Sender: TObject);
var
   A, AUX : vector;
   N, i, pos : byte;
begin
  randomize;
  N := TrackBar1.Position;
   for i := 1 to N do
       AUX[i] := i;

   for i := 1 to N-1 do begin
       pos := random(N) + 1;
       A[i] := AUX[pos];
       eliminar(pos,AUX,N);
   end;

   N := TrackBar1.Position;
   A[N] := AUX[1];

   for i := 1 to N do
       StringGrid1.Cells[1,i] := IntToStr(A[i]);
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
   i : byte;
begin
  for i := 1 to TrackBar1.Position do
      StringGrid1.Cells[1,i] := '';
end;

end.

