{Заполнить массив `A` случайными числами.
Написать процедуру, `procedure WriteNumberOfEvenValues(arr: TIntArray);`
которые выводит *количество* чётных элементов в нём.
Написать процедуры,
`procedure WriteMaxIndex(arr: TIntArray);`
`procedure WriteMinIndex(arr: TIntArray);`
которые выводят *индексы* максимального/минимального элемента в нём
Заполнить массив `A` случайными числами.
Написать процедуру,
`procedure WriteLarger(arr: TIntArray);`
которая выводит только те *значения* элементов, которые больше предыдущего. Первый элемент не выводить.
}
program Evens;
type
	arrInt = array[0..9] of Integer;

var
 	i: Integer;
 	arr:arrInt; 

procedure Evens(arr:arrInt);
var
	Even,i: Integer;
begin
	Even:=0;
	for i := 0 to 9 do
	begin
		if (arr[i] mod 2)=0 then
		begin
		inc(Even);  		
		end;
	end;
	writeln('Evens: ', Even);
end;

procedure WriteArray(arr:arrInt);
var
	i: Integer;
begin
	for i := 0 to 9 do
	begin
	 	Write(arr[i], ' ');
	end;
	writeln();
end;

procedure WriteMaxIdex(arr:arrInt);
var
	i, maxIndex, index: Integer;
begin
	maxIndex:=arr[0];
	index:=0;
	for i := 1 to 9 do
	begin
		if arr[i]>maxIndex then	
		begin
			maxIndex:=arr[i]; 		
		end; 	
	end;
	for i := 0 to 9 do
	begin
	 	inc(index);
	 	if arr[i]=maxIndex then
	 	begin	
	 	writeln('Index of max: ', index ); 
		end
	end;
end;

procedure WriteMinIndex(arr:arrInt);

var
	i, index, minIndex: Integer;

begin
	minIndex:=arr[0];
	index:=0;
	for i := 1 to 9 do 
	begin
		if arr[i]<minIndex then
		begin
			minIndex:=arr[i];
		end;
	end;
	for i := 0 to 9 do
	begin
		inc(index);
		if arr[i]=minIndex then
		begin
		 	writeln('Index of min: ', index);
		end; 
	end;
end;

procedure WriteLarger(arr:arrInt);
var
	i, previusValue: Integer;
begin
	previusValue:=arr[0];
	writeln('Larrger: ');
	for i := 1 to 9 do
	begin
		if arr[i]>previusValue then 
		begin
			write(arr[i], ' ');
		end;
		previusValue:=arr[i];
	end; 
end;

begin
	randomize;
	for i := 0 to 10 do
	begin
		arr[i]:=(random(199)-100);
	end;

	WriteArray(arr);

	Evens(arr);
	WriteMaxIdex(arr);
	WriteMinIndex(arr);
	WriteLarger(arr);
end.