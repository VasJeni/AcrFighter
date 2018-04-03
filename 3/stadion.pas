program stadion;
uses math;
 var 
	h,w,d,t : real;
	m : integer;
  begin
  m:=4;
  writeln('Enter height then use space and Enter width after press ''Enter'' button');
  readln(h,w);

  d:= sqrt(h*h+w*w);
  t:= d/m;
  writeln(' dog start eat you after ',t:5:3,' second ');
  readln;
  end.