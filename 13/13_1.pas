{
Переписать процедуру `WriteArray(arr : TIntArray);` так чтобы она выводила массив в одну строку.
Для проверки:
Завести массив `A`, заполнить его случайными числами, затем трижды вызвать процедуру:
Заполнить массив `A` случайными числами.
Написать процедуры, которые находят в нём:
- максимальное значение `procedure WriteMax(arr: TIntArray);`
- минимальное значение `procedure WriteMin(arr: TIntArray);`
- среднее арифметическое всех элементов `procedure WriteAverage(arr: TIntArray);`
Заполнить массив `A` случайными числами.
Написать процедуру
`procedure WriteEvenValues(arr: TIntArray);`
которая выводит только элементы с чётными *значениями*.
Вывести сначала весь массив, а затем только чётные:
Заполнить массив `A` случайными числами.
Написать процедуру
`procedure WriteEvenElements(arr: TIntArray);`
которая выводит только элементы с чётными *номерами* (индексами).
Вывести сначала весь массив, а затем только чётные:

}

program writeArray;
	
type
	arrWithNumber = array[0..9] of Integer; 

var
	arrInteger: arrWithNumber;
	i, tmpValueInArray: Integer;
	arrIntegerSecond :arrWithNumber;
	
procedure writeArray(arr:arrWithNumber);
begin
	for i := 0 to 9 do
	begin
		write(arr[i]);
		write(' '); 	
	end 
end;
procedure sortArray(var arr:arrWithNumber);
var
	i: Integer

procedure WriteRandomNumberInArray(arr:arrWithNumber);
var
	i: Integer;
begin
	for i := 0 to 9 do 
	begin
		write(arr[i], ' ');
	end;	
	writeln();
end;

procedure WriteMaxNumber(arr:arrWithNumber);
var
	i, maxNumber:Integer;
begin
	maxNumber:=arr[0];
	for i := 0 to 9 do
	begin
		if (arr[i] > maxNumber) then	
		begin
		 	maxNumber :=arr[i];
		end; 	
	end;
	writeln ('Max number are: ', maxNumber);
end;

procedure WriteMinNumber(arr:arrWithNumber);
var
	i, minNumber: Integer;
begin
	minNumber:=arr[0];
	for i := 0 to 9 do
	begin
	 	if (arr[i] < minNumber)then
	 	begin
	 	minNumber:=arr[i];
	 	end;
	end;
	writeln('Min number are: ', minNumber);
end;

procedure WriteAverage(arr:arrWithNumber);
var
	avarage, i: Integer;
begin
	avarage:=0;
	for i := 0 to 9 do 
	begin
		avarage:= avarage + arr[i];
	end;
	writeln('Avarage of all number are: ' , (avarage/10):2:2);
end;

procedure WriteEvenNumber(arr:arrWithNumber);
var
	i: Integer;
begin
	write('Write only even number:');
	for i := 0 to 9 do
	begin 	
		if ((arr[i] mod 2) = 0) then	
		begin
			write(' ', arr[i]);
		end;
	end; 
	writeln();
end;

procedure WriteEvenElements(arr:arrWithNumber);
var
	i: Integer;
begin
	write('Even elements of array are:');
	for i := 0 to 9 do
	begin
		if (i mod 2 =0) then
		begin
			write(' ', arr[i]);		 		
	 	end; 	
	end;
end;


begin
	randomize;
	for i := 0 to 9 do 
	begin
		arrInteger[i] := random(100);
	end;	
	WriteRandomNumberInArray(arrInteger);
	WriteRandomNumberInArray(arrInteger);
	WriteRandomNumberInArray(arrInteger);
	WriteMaxNumber(arrInteger);
	WriteMinNumber(arrInteger);
	WriteAverage(arrInteger);
	WriteEvenNumber(arrInteger);
	WriteEvenElements(arrInteger);
	writeln();
	writeln();
	arrIntegerSecond[0]:=2;
	arrIntegerSecond[3]:=2;
	arrIntegerSecond[5]:=4;
	arrIntegerSecond[4]:=2;
	arrIntegerSecond[8]:=16;
	writeArray(arrIntegerSecond);







end.