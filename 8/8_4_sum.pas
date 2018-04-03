{
	Попросить пользователя ввести несколько чисел (пока не введёт 0), найти их сумму и среднее арифметическое.
Например:
```Enter number
6
Enter number
9
Enter number
-2
Enter number
7
Enter number
8
Average is 5.6
```
Доп.задание (необязательное): найти среднее геометрическое, среднее квадратическое и среднее гармоническое. Вики в помощь.
}
program sum;
	uses math;
	var number, summa, counter:Integer;
		geometric, rootMeanSquare, harmonicMean: real;

begin
	summa:=0;
	counter:=0;
	geometric:=1;
	harmonicMean:=0;
	rootMeanSquare:=0;

	while true do 
	begin
		writeln('number');
		readln(number);
		if number=0 then
		begin
			break;
		end;
		geometric:=geometric*number; //данные для геометрического среднего
		summa:=summa+number; //данные для среднего арифметического
		rootMeanSquare:=(rootMeanSquare+sqr(number));;// данные для среднего квадратического числа
		harmonicMean:= (harmonicMean+(1/number));//данные для гармонического стреднего
		inc(counter);
	end;
	if geometric>0 then //геометрическое среднее
	begin
		geometric:=exp(ln(geometric)/counter);
	end
	else
	begin
		geometric:= -exp(ln(-geometric)/counter);
	end;
	rootMeanSquare:= sqrt(rootMeanSquare/counter);					//квадратическое среднее
	writeln('The amount ', summa);
	writeln('Arithmetic mean ', (summa/counter):8:2);
	writeln('Geometric mean ', (geometric):8:2);
	writeln('Root mean square ', (rootMeanSquare):8:2);
	writeln('Harmonic mean ', (counter/harmonicMean):8:2);
end.