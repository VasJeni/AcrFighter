{
Принудить пользователя ввести нормальное™ число, а потом вывести все числа от него до 0.
* - число должно быть больше 5, делиться на 3 и не делиться на 2.

Если сделали 7.2.2, присылайте только её, предыдущие можете не присылать.
}

program loop;

uses CRT;


var i, number:integer;
begin

	textbackground(1);
	ClrScr;
	TextColor(2);
	i:=1;
	

	while i>0 do //check valid number
	begin
		write('Enter number: ');
		read(number);
		ClrScr;
		if (number>5) and (number mod 3 = 0) and (number mod 2 > 0) then
		begin
			i:=i-1;
		end
		else
		begin
			write(' invalid number ');
			Delay(1000);
		end
	end;
	while (number>0) do //write number -1
	begin
		writeln(number);
		sound(300);
		Delay(300);
		NoSound;
		number:=number-1;
	end;
end.