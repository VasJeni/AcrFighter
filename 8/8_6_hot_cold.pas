{
*Задача 8.6 (8h6)* (необязательная)
Игра "Угадайка++"
Компьютер загадывает число от 0 до 100.
Пользователь вводит число пока не угадает.
Каждый раз когда пользователь не угадывает, компьютер подсказывает: 
"холодно", "тепло", "горячо" и т.п. в зависимости от того насколько далеко введённое число от загаданного.
}
program siracuz;
	var number, rn,maxNumber, minNumber:Integer;

begin
	randomize;
	rn:=random(101);
	writeln('Enter number');
	readln(number);

	while number<>rn  do 
	begin
		if number>rn then
		begin
		 	maxNumber:=number;
		 	minNumber:=rn
		 end 
		 else
		 begin
		 	maxNumber:=rn;
		 	minNumber:=number;
		 end;

		 if (maxNumber-minNumber)<5 then
		 begin
		 	writeln('Hot!');
		 end
		 else if (maxNumber-minNumber)<20 then
		 begin
		 	writeln('cold');
		 end
		 else
		 begin
		 	writeln('so cold');
		 end;
		 readln(number);
	end;
	writeln('You Win!')
end.