Program P1111404;     {Liet ke cac duong di Hamilton}
Uses  Crt;
Const inp='P111404.inp';
      out='P111404.out';
Type  M1=array [1..50] of byte;
      M2=array [1..50,1..50] of byte;
Var   a: M2;
      b,c: M1;
      n,i,d: byte;
      f: text;

Procedure Input;
Var i,j: byte;
Begin
 Assign(f,inp); Reset(f);
 Readln(f,n);
 For i:=1 to n do
 begin
   For j:=1 to n do Read(f,a[i,j]); Readln(f);
 end;
 Close(f);
 For i:=1 to n do c[i]:=0;
End;

Procedure InB(b: M1);
Var i: integer;
begin
 For i:=1 to n do Write(f,b[i],' '); Writeln(f);
 Inc(d);
end;

Procedure Tim(b,c: M1; i:byte);
Var j,k: byte;
Begin
 For j:=1 to n do
   If (a[b[i-1],j]=1)and(c[j]=0) then
   begin
     b[i]:=j; c[j]:=1;
     If i<n then Tim(b,c,i+1)
     Else InB(b);
     c[j]:=0;
   end;
End;

BEGIN
 Input;
 b[1]:=1; i:=2; d:=0;
 Assign(f,out); Rewrite(f);
 Tim(b,c,i);
 If d=0 then Write(f,'Khong co duong di Hamilton.');
 Close(f);
END.