Task 4.2
program maxValue;

Var Ukraine, USA, Kuwait, age:Integer ;
begin
Ukraine :=18;
USA:=21;
WriteLn('Enter your age');
ReadLn(age);
Kuwait:=1+age;
If age>=Ukraine then
Begin
Writeln('Ukraine yes');
End
Else
Begin
WriteLn('Ukraine no');
End;
If age >=USA then
Begin
WriteLn('USA tes');
End
Else
begin 
WriteLn('USA no');
end;
If age >=Kuwait then //vsegda vupolnyaet else
begin 
WriteLn('Kuwait yes')
end 
Else
Begin
WriteLn('Kuwait no');
end;
ReadLn();
End.