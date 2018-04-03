program coldHot;

var

    C: real;

begin
write('Please enter Celsius degrees: ');
readln(C);
writeln('This is:');
writeln(C*1.8+32:0:2,' F');
writeln(C+273.15:0:2,' K');
if C < 10 then 
begin
writeln('cold');
end
else if c<20 then
Begin
WriteLn('so so');
end 
Else if c<=999 then
begin 
WriteLn('hot');
End 
Else
begin 
WriteLn('you are in hell');
End;
ReadLn();
end.

Task 4. 3