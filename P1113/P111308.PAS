Program P111308;   {Tim chu trinh Euler}
Uses  Crt;
Const inp='P111308.inp';
      u=1;
Var   a: array [1..100,1..100] of byte;
      n: byte;
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
End;

Function Kiemtra: boolean;
Var i,j,s,d: byte;
Begin
 d:=0;
 For i:=1 to n do
 begin
   s:=0; For j:=1 to n do s:=s+a[i,j];
   If Odd(s) then Inc(d);
 end;
 If d>0 then Kiemtra:=false Else Kiemtra:=true;
End;

Procedure Tim;
Var v,x,top,dCE: byte;
    Stack,CE: array [1..100] of byte;
Begin
 top:=1; Stack[top]:=u; dCE:=0;
 Repeat
   v:=Stack[top];
   x:=1; While (x<=n)and(a[v,x]=0) do Inc(x);
   If x>n then begin Inc(dCE); CE[dCE]:=v; Dec(top); end
   Else
   begin
     Inc(top);  Stack[top]:=x;
     a[v,x]:=0; a[x,v]:=0;
   end;
 Until top=0;
 Writeln('Co chu trinh Euler:');
 For x:=dCE downto 1 do write(CE[x],' ');
End;

BEGIN
 Input;
 If Kiemtra then Tim
 Else Write('Khong co chu trinh Euler.');
 Readln;
END.