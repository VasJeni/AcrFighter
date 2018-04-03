{
Напишите процедуру, которая ищет максимальный элемент не по всему массиву, а только в его второй половине (большей части если нечётные).
После того как нашли поменяйте его местами с первым элементом.
Напишите процедуру
`SwapMin(var arr: TIntArray; FirstIndex: integer);`
которая ищет минимальный элемент не по всему массиву, а только в его хвосте, начиная с заданного номера, а затем
меняет его с первым элементом "хвоста" (заданный номер).
А теперь, запустите процедуру `SwapMin()` по очереди со значениями 0,1,2 ... NumberOfItems-2.
Например, для массива из 13 элементов:
}

program swapBiggerValueInSecondHalfInArray;
uses
	wincrt;

const
	sizeArray = 15;
	maxIndexOnArray = sizeArray-1;

type
	arrayWithValue = array[0..maxIndexOnArray] of Integer;



procedure WriteArray(arr:arrayWithValue);			//вывод массива
var
	i: Integer;
begin
	writeln('Array: '); 
	for i := 0 to maxIndexOnArray do
	begin
	write(arr[i], ' ');
	end;
	writeln();	
end;

procedure WriteValueInArray(var arr:arrayWithValue);
var
	i: Integer;
begin
for i :=0  to maxIndexOnArray do
	begin
	arr[i]:=random(41)-20;	
	end;
end;

function GetBiggerHalf(arr:arrayWithValue): Integer;
begin
	GetBiggerHalf:=(round(length(arr)/2));
end;

procedure swapBiggerValueInSecondHalfInArray(var arr:arrayWithValue; halfArray:Integer; maxIndexOnArray:Integer);
var 
	i, tmpValue,tmpIndex: Integer;
begin
	tmpValue:=arr[halfArray];
	tmpIndex:=halfArray;
	for i:=(halfArray+1) to maxIndexOnArray do
	begin
	 	if arr[i] > tmpValue then
	 	begin
	 		tmpValue:=arr[i];
	 		tmpIndex:=i;
	 	end; 
	end;
	tmpValue:=arr[0];
	arr[0]:=arr[tmpIndex];
	arr[tmpIndex]:=tmpValue;
	writeln(tmpIndex+1, ' -> bigest value ', halfArray , ' -> half Array');
end;

procedure swapMin(var arr: arrayWithValue; FirstIndex:integer);
var
	i, tmpValue, tmpIndex: Integer;

begin	
	while (FirstIndex<1) or (FirstIndex>maxIndexOnArray) do 	//для ручного ввода индекса
	begin
		Writeln('Invalid Index, enter from 1 to ', sizeArray);
		readln(FirstIndex);
	end;
	tmpValue:=arr[FirstIndex-1];
	tmpIndex:=FirstIndex-1;
	for i := FirstIndex to maxIndexOnArray do
	begin
		if (arr[i]<tmpValue) then
		begin
			tmpValue:=arr[i];
			tmpIndex:=i;
		end;
	end;
	arr[tmpIndex]:=arr[FirstIndex-1];
	arr[FirstIndex-1]:=tmpValue; 
end;

procedure swapMinLeap(var arr:arrayWithValue);
var
	i,b, tmpValue, tmpIndex: Integer;

begin

	for i := 0 to maxIndexOnArray do
	begin
		tmpValue:=arr[i];
		tmpIndex:=i;
		begin
			for B:=i to maxIndexOnArray do
			begin
				if (arr[b]<tmpValue) then
				begin
					tmpValue:=arr[b]; //находим минимальное значение и сохроняем его 
					tmpIndex:=b; 	//выписываем индекс масива с минимальным значением
				end;
			end;
		arr[tmpIndex]:=arr[i];		//в идекс с минимальным значением вписываем текущий 
		arr[i]:=tmpValue; 			//в текущий индекс вписываем значение минимального
		end;
	end; 
end;

//main procedure
var 
	randomArray:arrayWithValue;
	startIndexToSortArray:integer;

begin
	randomize;
	WriteArray(randomArray);
	WriteValueInArray(randomArray);
	WriteArray(randomArray);
	swapBiggerValueInSecondHalfInArray(randomArray, GetBiggerHalf(randomArray), maxIndexOnArray);
	WriteArray(randomArray);
	writeln('Enter number of element to sort array');
	readln(startIndexToSortArray);
	writeln('Find min element after ' , startIndexToSortArray-1, ' position ');
	swapMin(randomArray, startIndexToSortArray);
	WriteArray(randomArray);
	writeln('Press key to sort all array ');
	readln();
	swapMinLeap(randomArray);
	WriteArray(randomArray);
	readln();
end.