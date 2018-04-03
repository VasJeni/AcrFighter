program stadion;
uses math;
 var 
	s , u , g , a , aa : real;
  begin
  g := 9.81;
  writeln('Enter speed:');
  readln(u);
  writeln('Enter angle:');
  readln(a);
  aa:= pi*a/180;
  s:= sqr(u)*sin(2*aa)/g;
  writeln('Distance is', S:5:2);
  readln();

  end.