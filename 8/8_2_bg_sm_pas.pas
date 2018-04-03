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
	number:=-1;

	while number<>rn do 
	begin
		write('Enter number');
		readln(number);
		if number=rn then
		begin
			continue;
		end
		else
			begin
			if number>rn then
			begin
				writeln('Enter smaller number');
			end
			else
			begin
				writeln('Enter bigger number');
			end;
		end;
	end;
	write('WIN!');
end.