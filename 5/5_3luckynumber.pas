program luckyNumber;
var
	firstNumber, secondNumber: Integer;
	summa, distance, reverseDistance, seven: Boolean;
	
begin
	writeln('Enter two number');
	readln(firstNumber, secondNumber);
	summa := (7= (firstNumber + secondNumber));
	distance:= (7= (firstNumber-secondNumber));
	reverseDistance:=(7=(secondNumber-firstNumber));
	seven := (7 = (firstNumber or secondNumber));
	write('You are ');
	if summa or distance or seven then
	begin
		writeln('lucky');
	end
	else 
	begin
		writeln('unluck');
	end
end.