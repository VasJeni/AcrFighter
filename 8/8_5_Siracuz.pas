{
Написать программу, которая для любого целого числа выводит сиракузскую последовательность начиная с него.
}
program siracuz;
	var number:Integer;

begin
	writeln('Enter number');
	readln(number);

	while number <> 1  do 
	begin
		writeln(number);
		if (number mod 2 = 0) then 
		begin
			number:=round(number/2);
		end
		else
		begin
			number:=number*3+1;
		end;
	end;
	writeln(number);
end.