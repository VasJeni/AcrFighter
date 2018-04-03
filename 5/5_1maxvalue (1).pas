program MaxValue5_1;

var firstValue, secondValue, thirdValue, maxValue: Integer;

begin
	writeln('Enter 3 value');
	readln(firstValue, secondValue, thirdValue);
	if firstValue>secondValue then 
	begin
		if firstValue>thirdValue then 
		begin
			maxValue:=firstValue;
		end
		else
		begin
		maxValue:=thirdValue;
		end;
	end
	else if secondValue>thirdValue then
	begin
		maxValue:=secondValue;	
	end
	else
	begin
		maxValue:=thirdValue;
	end;
	writeln(maxValue);
	readln();
end.