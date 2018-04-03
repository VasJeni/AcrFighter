{
Напишите процедуру
`procedure ClearValue(var arr: TIntArr; BadValue: integer)`
которая меняет на 0 все значения равные заданному (*BadValue*).

Например, если запустить
ClearValue(A, 8);
ClearValue(B, 8);

rocedure GenerateArithmSequence(var arr: TIntArr; first: integer;step: integer);`
которая заполняет массив целыми числами начиная с `first`,
а каждое следующее на `step` больше.
Это арифметическая прогрессия.
Напишите процедуру
`procedure GenerateFibonacci(var arr: TIntArr);`
Которая заполняет массив последовательностью Фибоначчи (нагуглите).
Напишите процедуру
`procedure SwapEnds(var arr: TIntArr);`
которая меняет местами заданный первый и последний элементы.
*Задача 15.4 (15h4)*
Заполнить дав массива случайными числами, вывести их на экран.
Затем сравнить, в каком из них минимальное значение меньше, а максимальное - больше.
Сделать с помощью функций, которые находят минимальное/максимальное значение.
*Задача 15.5 (15h5) (необязательная)*
Напишите процедуру
`procedure SwapWithoutEnds(var arr: TIntArr);`
которая переворачивает массив кроме первого и последнего элементов.
}

program moreProcedure;
uses
	crt;

	
const
	ArraySize = 14;
	MaxIndex = ArraySize-1;

type
	IntegerArray = array[0..MaxIndex] of integer;

procedure WriteArray(arr:IntegerArray);
var
	i: Integer;
begin
	writeln('Array: '); 
	for i := 0 to MaxIndex do
	begin
	write(arr[i]:4);
	end;
	writeln();	
end;

procedure RewriteArray(var arr:IntegerArray);
var
	i: Integer;
begin
for i :=0  to MaxIndex do
	begin
	arr[i]:=random(41)-20;	
	end;
end;

procedure FillControlArray(var arr:IntegerArray);
var
	i: Integer;
begin
	for i := 0 to MaxIndex do
	begin
	 	arr[i]:=i+2;
	end;
end;

procedure ClearValue(var arr:IntegerArray; ClearValueInArray:integer);
var
	i: Integer;

begin
	for i := 0 to MaxIndex do 
	begin
		if arr[i]=ClearValueInArray then
		begin
			arr[i]:=0;	
		end;
	end;
end;

procedure GenerateArithmSequence(var arr:IntegerArray; FirstElement:integer; step:integer);
var
	i: Integer;

begin
	arr[0]:=FirstElement;
	for i := 1 to MaxIndex do
	begin
		arr[i]:=arr[i-1]+step; 			
	end; 	
end;

procedure FebonacciNumber(var arr:IntegerArray);
var
	i: Integer;

begin
	arr[0]:=1;
	arr[1]:=1;
	for i := 2 to MaxIndex do
	begin
	arr[i]:=arr[i-2]+arr[i-1];	 		
	end;
end;

procedure SwapFirstLastElementsInArray(var arr:IntegerArray);

var
	tmpValue: Integer;

begin
	tmpValue:=arr[0];
	arr[0]:=arr[MaxIndex];
	arr[MaxIndex]:=tmpValue;
end;

procedure SwapElementsInArray(var arr:IntegerArray);

var
	i, tmpValue, iterationMax: Integer;

begin
	iterationMax:=round(MaxIndex/2);
	for i := 1 to iterationMax do
	begin
		tmpValue:=arr[i];
		arr[i]:=arr[MaxIndex-i];
		arr[MaxIndex-i]:=tmpValue; 	
	end;
end;

function returnMinValue(arr:IntegerArray) : Integer;
var
	i, min: Integer;
begin
	min:=arr[0];
	for i := 1 to MaxIndex do
	begin
		if arr[i]<min then	
		begin
			min:=arr[i];	
		end;	
	end;
	returnMinValue:=min;
end;

function returnMaxValue(arr:IntegerArray) : Integer;
var
	i, max: Integer;
begin
	max:=arr[0];
	for i := 1 to MaxIndex do
	begin
		if arr[i]>max then	
		begin
			max:=arr[i];	
		end;	
	end;
	returnMaxValue:=max;

end;


//main procedure
var
	FirstArray, ControlArray: IntegerArray;
	valueFirstArray, valueSecondArray:Integer;

begin
	randomize;
	RewriteArray(FirstArray);
	FillControlArray(ControlArray);
	readln();

	WriteArray(FirstArray);	
	WriteArray(ControlArray);
	readln();

	writeln('Clear value 8 in array');
	ClearValue(FirstArray,8);
	ClearValue(ControlArray,8);
	WriteArray(FirstArray);	
	WriteArray(ControlArray);
	readln();

	writeln('Generate array with aritm Sequence, first item 15 step 2');
	GenerateArithmSequence(FirstArray,15,2);
	WriteArray(FirstArray);
	readln;

	writeln('Generate array with Febonacci Number');
	FebonacciNumber(FirstArray);
	WriteArray(FirstArray);
	readln();

	writeln('Swap first and last elements in array');
	SwapFirstLastElementsInArray(FirstArray);
	WriteArray(FirstArray);
	readln();

	writeln('swap elements in araay but not first and last');
	SwapElementsInArray(FirstArray);
	WriteArray(FirstArray);
	readln();

	writeln('Rewrite value in 2 array');
	RewriteArray(FirstArray);
	WriteArray(FirstArray);
	RewriteArray(ControlArray);
	WriteArray(ControlArray);
	readln();

	valueFirstArray := returnMinValue(FirstArray);
	valueSecondArray := returnMinValue(ControlArray);

	write('Min value of first array are :' , valueFirstArray , ' ');
	write('Min Value of Second array are: ' , valueSecondArray, ' ');




	if valueFirstArray<valueSecondArray then 
	begin
		writeln('Value in first array are smoller');
	end
	else if valueSecondArray<valueFirstArray then 
	begin
		writeln('Value in second array are smoller');
	end
	else
	begin
		writeln('Min Value in first and secont array are equally');
	end;

	readln();

	valueFirstArray:=returnMaxValue(FirstArray);
	valueSecondArray:=returnMaxValue(ControlArray);

	write('Max value of first array are :' , valueFirstArray , ' ');
	write('Max Value of Second array are: ' , valueSecondArray, ' ');

	if valueFirstArray>valueSecondArray then 
	begin
		writeln('Value in first array are bigger');
	end
	else if valueSecondArray>valueFirstArray then 
	begin
		writeln('Value in second array are beggier');
	end
	else
	begin
		writeln('Min Value in first and secont array are equally');
	end;



	readln();

end.