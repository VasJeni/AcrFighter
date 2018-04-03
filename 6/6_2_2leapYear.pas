program leapYear;

var	year: Integer;
	leapYear2: Boolean;
	
	
begin
	leapYear2:=false;
	writeln('Enter year');
	readln(year);

	if ((year mod 4 =0 ) and (year mod 100 = 0) and (year mod 400 =0)) or ((year mod 4 = 0 ) and ((year mod 100) > 0))  then
	begin
		writeln('Leap Year');
	end
	else 
	begin
		writeln(' Not leap year');
	end;
	readln();
end.