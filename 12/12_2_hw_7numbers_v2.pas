{
Попросить пользователя ввести 7 чисел, а затем вывести их в том же порядке в одну строку.
}
program sevenNumbres;

var
	number: string;
	totalNumber:String;
	i:Integer;
	correctNumber:string;

procedure addNumber(num:String);
begin
	totalNumber:=totalNumber + number+ ' ';
end; 
	
begin
	writeln('Enter Number');
	for i := 1 to 7 do
	begin
		readln(number);
		addNumber(number);
 	end;
	writeln(totalNumber);
end.
