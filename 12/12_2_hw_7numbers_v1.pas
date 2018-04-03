{
	Попросить пользователя ввести 7 чисел, а затем вывести их в том же порядке в одну строку
}
program sevenNumbres;

var
	numberOne, numberTwo, numberThree, numberFour, numberFive, numberSix, numberSeven: Integer;
begin
	writeln('Enter Number');
	readln(numberOne);
	readln(numberTwo);
	readln(numberThree);
	readln(numberFour);
	readln(numberFive);
	readln(numberSix);
	readln(numberSeven);

	writeln(numberOne, ' ', numberThree, ' ', numberThree, ' ',numberFour, ' ', numberFive, ' ',numberSix, ' ',numberSeven);

end.
