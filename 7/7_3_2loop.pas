{
Попросить пользователя ввести два числа, вывести все чётные числа между ними.
От меньшего к большему.
(пользователь может ввести в любом порядке)
}

program loop;

uses CRT;


var numberFirst, numberSecond, minValue, maxValue:integer;
begin
	
	readln(numberFirst);
	readln(numberSecond);

	minValue:=numberFirst;
	maxValue:=numberFirst;

	if numberSecond<minValue then
	begin
		minValue:=numberSecond;
	end;

	if numberSecond>maxValue then
	begin
		maxValue:=numberSecond;
	end;

	textbackground(1); // design
	ClrScr;
	TextColor(2);
	numberFirst:=17;
	numberSecond:=64;

	while minValue<maxValue do //writeln number 17-64
	begin
		minValue:=minValue+1;
		if ((minValue mod 2) = 0) and (minValue<maxValue) then
		begin
			writeln(minValue);
		end;
		
	end;
end.