{
*Задача 7.2*
Вывести в обратном порядке числа от 17 до 0
}

program loop;

var number:integer;
begin

	number:=17;

	while (number>=0) do
	begin
		writeln(number);
		number:=number-1;
	end;
end.