program dz13h4pas;
const
	maxIndexArray = 5;
type
	TIntArray = array[0..maxIndexArray] of integer;

var
	Array1: TIntArray;
	Array2: TIntArray;// = (10,31,42,73,-4,50,65,-7,0,9);

	//ThisisVeryLongLongName: boolean;

procedure WriteArray( arr: TIntArray );
var
	i: Integer;

begin
	
	for i := 0 to maxIndexArray do
	begin
		write(arr[i]:4);
	end;
	writeln();
end;


procedure FillRandom(var arr: TIntArray);
var
	i: Integer;
begin
	//writeln('This is arr in proc2');
	//WriteArray(arr);

	for i := 0 to maxIndexArray do
	begin
		arr[i] := random(100) - 50;
	end;

	//writeln('This is arr in proc2');
	//WriteArray(arr);
end;

//var
//	tmpAverage: real;


//procedure GetAverage(var arr: TIntArray; var resultAverage: real);
function GetAverage(var arr: TIntArray) : real;
var
	i,sum: Integer;
	average: real;
begin
	//..
	sum := 0;
	for i := 0 to maxIndexArray do
	begin
		sum := sum + arr[i];
	end;
	average := sum / 10;
	//writeln(average:0:2);

	//tmpAverage := average;
	//resultAverage := average;
	GetAverage := average;
end;

procedure plusFour(var arr:TIntArray);
var
	i: Integer;
begin
	for i := 0 to maxIndexArray do
	begin
		arr[i]:=arr[i]+4;
	end;
end;


//
// Main procedure
//
var
	average1, average2: real;
begin	
	randomize();

	FillRandom(array1);
	writeln('This is array1:');
	WriteArray(array1);

	FillRandom(array2);
	writeln('This is array1:');
	WriteArray(array2);

	average1 := GetAverage(array1);
	average2 := GetAverage(array2);

	writeln(GetAverage(array1):6:2, GetAverage(array2):6:2);

	//if (average1 > average2) then
	if (GetAverage(array1) > GetAverage(array2)) then
	begin
		Writeln('array1 is bigger');
	end
	else
	begin
		Writeln('array2 is bigger');
	end;

	writeln();
	plusFour(array1);
	WriteArray(array1);

	readln();
end.