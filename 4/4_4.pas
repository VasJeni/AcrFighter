program yourAge;

Var soYoung, young, old:string;
Age:Integer;
begin
soYoung:='so young';
Young:='young';
Old:='old';

WriteLn('Enter your age');
ReadLn(age);

If age<10 then
Begin
WriteLn('you are ', soYoung);
End
else if age<30 then
Begin
WriteLn('you are ', young);
End
Else 
begin 
WriteLn('you are ', old);
End;

ReadLn();
End.

Task 4.4