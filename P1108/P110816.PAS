Program P110816;    {Chia doan thang theo ti so k}
Uses  Crt,Graph;
Const i0=300; j0=200; E=50;
      x1=3; y1=-1; x2=2; y2=2;
      k=-1/3;
Var   Gd,Gm,i,j,il,jl: Integer;
      x,y,a,b: real;
      S: string;

Function yy(t: real): real;  {tinh y theo t}
Begin
 yy:=b*t+y1;
End;

Function tt(x: real): real;  {tinh t theo x}
Begin
 tt:=(x-x1)/a;
End;

BEGIN
 Gd:=Detect;
 InitGraph(Gd, Gm,' ');
 Line(i0,50,i0,400);       {Oy}
 Line(50,j0,600,j0);       {Ox}
 OutTextXY(i0+5,j0+5,'0');
 OutTextXY(600-3,j0+5,'x');
 OutTextXY(i0+5,50,'y');
 For i:=51 to 599 do
   If((i-i0) mod E=0) then
   begin
     Bar (i-1,j0-1,i+1,j0+1);
     x:=(i-i0)/E;
     Str(x:0:0,S);
     If x<>0 then OutTextXY(i+2,j0+5,S);
   end;
 For j:=51 to 399 do
   If((j-j0) mod E=0) then
   begin
     y:=-(j-j0)/E;
     Bar (i0-1,j-1,i0+1,j+1);
     Str(y:0:0,S);
     If y<>0 then OutTextXY(i0+5,j,S);
   end;
 b:=(y2-y1); a:=x2-x1;
 For i:=70 to 580 do
 begin
   x:=(i-i0)/E;
   j:=round(-yy(tt(x))*e+j0);
   SetColor(2);
   If (i<>70)and(j>70)and(j<380) then Line(i,j,il,jl);
   il:=i; jl:=j;
 end;
 i:=round(x1*E+i0); j:=round(-y1*E+j0);
 Bar(i-1,j-1,i+1,j+1); OutTextXY(i+5,j,'A');
 i:=round(x2*E+i0); j:=round(-y2*E+j0);
 Bar(i-1,j-1,i+1,j+1); OutTextXY(i+5,j,'B');
 x:=(x1+k*x2)/(1+k); y:=(y1+k*y2)/(1+k);
 i:=round(x*E+i0); j:=round(-y*E+j0);
 Bar(i-1,j-1,i+1,j+1); OutTextXY(i+5,j,'C');
 Readln;
 CloseGraph;
END.
