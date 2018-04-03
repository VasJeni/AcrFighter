{
	Игра "Угадайка+".
Компьютер загадывает число от 0 до 100.
Пользователь вводит число пока не угадает.
Каждый раз когда пользователь не угадывает, компьютер подсказывает: 
"ваше число больше загаданного" либо "ваше число меньше загаданного"
}
program rand;
	var rn, number:Integer;

begin
	randomize;
	rn:=random(101);
	while true do 
	begin
		write('Enter number');
		readln(number);
		if number=rn then
		begin
			break;
		end;
		if number>rn then
		begin
			writeln('Enter a number less');
		end;
		if number<rn then	
		begin
			writeln('Enter number more');
		end;
	end;
		write('WIN!');
end.