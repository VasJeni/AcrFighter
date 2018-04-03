program sum;
 var 
  a,b: integer;

  c: real;
  begin
  writeln('enter value for a');
  readln(a);
  b :=56; 
  a :=a+12;
  //writeln(b:3,a:3);
  c := (4*a-5*b)/7*(b*b);
  writeln('Value a=',a);
  writeln('Value b=',b);
  writeln('Value c=',c:10:2);
  writeln('Sum a+b=',a+b);
  readln;
  end.