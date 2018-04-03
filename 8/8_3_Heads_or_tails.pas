{
*Задача 8.3 (8h3)*
Орёл или решка.
Программа "подбрасывает монетку" - загадывает случайное число (0 или 1).
Пользователь пытается угадать (0 или 1).
Если угадал - очко пользователю. Не угадал - очко программе.
Сыграть 7 раундов, определить победителя.
```Enter number
0
I got 0. You are right! 1-0
Enter number
0
I got 1. You are wrong! 1-1
Enter number
1
I got 1. You are right! 2-1
Enter number
0
I got 0. You are right! 3-1
Enter number
1
I got 0. You are wrong! 3-2
Enter number
0
I got 1. You are wrong! 3-3
Enter number
1
I got 1. You are right! 4-3
You win!```
}
program rand;
	var rn, number,i, playerScores, compScores:Integer;

begin
	i:=0;
	randomize;
	playerScores:=0;
	compScores:=0;

	while i<7 do 
	begin
		rn:=random(2);
		writeln('Enter number');
		readln(number);
		writeln('I got ', number);
		if number=rn then
		begin
			inc(playerScores);
			write(' You are right! ') 	
		end
		else
		begin
			inc(compScores);
			write('You are wrong!');
		end;
		writeln(playerScores , '-', compScores);
		inc(i);
	end;
	if playerScores>compScores then
	begin
	 	write('Player Win!');
	end 
	else
	begin
		write('Computer Win!');
	end;
end.