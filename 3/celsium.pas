program gradtnasform;
 var 
  a: integer;

  f,k: real;
  begin
  writeln('Enter Celsius degrees:');
  readln(a);
  f:= a * 1.8 +32;
  k:= a + -273.15;
  writeln('Celsius dagrees= ', a:3, ' Fahrenheit dagrees= ', f:4:2, ' Kelvin dagrees= ', k:5:2);
  readln;
  end.