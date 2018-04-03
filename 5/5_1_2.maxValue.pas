program maxValue;
var
	number1, number2, number3, number4, number5, number6, number7, maxiValue: Integer;

begin
	writeln('Enter number');
	readln(number1,number2,number3,number4,number5,number6,number7);
	maxiValue:=number1;
	if number2>maxiValue then 
	begin
		maxiValue:=number2;
	end;
	if number3>maxiValue then 
	begin
		maxiValue:=number3;
	end;
	if number4>maxiValue then 
	begin
		maxiValue:=number4;
	end;
	if number5>maxiValue then 
	begin
		maxiValue:=number5;
	end;
	if number6>maxiValue then 
	begin
		maxiValue:=number6;
	end;
	if number7>maxiValue then
	begin
		maxiValue:=number7;
	end;
	writeln(maxiValue);
	readln();
end.