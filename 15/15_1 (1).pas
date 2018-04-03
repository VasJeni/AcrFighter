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
}

program moreProcedure;
uses
	wincrt;

	
const
	ArraySize = 15;
	MaxIndex = ArraySize-1;

type
	IntegerArray = array[0..MaxIndex] of integer;

procedure WriteArray(arr:IntegerArray);			//вывод массива
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




//main procedure
var
	FirstArray, ControlArray: IntegerArray;

begin
	randomize;
	Write('First ');
	WriteArray(FirstArray);
	write('Control');
	WriteArray(ControlArray);
	writeln();
	readln();
	RewriteArray(FirstArray);
	FillControlArray(ControlArray);
	readln();

	WriteArray(FirstArray);	
	WriteArray(ControlArray);
	readln();

	ClearValue(FirstArray,8);
	ClearValue(ControlArray,8);
	readln();

	WriteArray(FirstArray);	
	WriteArray(ControlArray);
	readln();

	GenerateArithmSequence(FirstArray,15,2);
	WriteArray(FirstArray);
	readln;

	FebonacciNumber(FirstArray);
	WriteArray(FirstArray);
	readln();

	SwapFirstLastElementsInArray(FirstArray);
	WriteArray(FirstArray);
	SwapFirstLastElementsInArray(ControlArray);
	readln();
end.