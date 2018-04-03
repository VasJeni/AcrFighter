{
Попросить пользователя ввести нормальное™ * число и не отстать от него пока не введёт.
При этом посчитать сколько попыток он сделал.
Дальше, прокомментировать ему в зависимости от количества попыток:
с первой - "молодец"
со второй - "все ошибаются"
с третьей... в общем, придумайте сами по вкусу :slightly_smiling_face:
}

program loop;

uses CRT;


var attempt,number:integer;
	result:string;
begin

	attempt:=0;
	write('Enter valid number: ');
	read(number);
	inc(attempt);

	while not ((number>5) and (number mod 3 > 0) and (number mod 2 = 0)) do
	begin
		writeln(' invalid number ');
		Delay(1000);
		ClrScr;
		inc(attempt);
		write('Enter valid number: ');
		read(number);
	end;
	case attempt of
		1: result := 'incredible';
		2: result := 'good';
		3: result := 'good';
		4: result := 'normal';
		5: result := 'normal';
		6: result := 'bad';
		7: result := 'bad';
		8: result := 'bad';
		9: result := 'bad';
		else
		 result := 'nan, you can batter';
	end;
	writeln('attempt: ', attempt , ' result ' , result );
end.