program leapYear;

var	year, centry, sumDay, forHundred: Integer;
	
begin
	writeln('enter day');
	readln(year);
	
	if ((year mod 4) = 0) then
	begin
		if year mod 100 = 0 then 
		begin
			if year mod 400 = 0 then 
			begin
				writeln('Leap Year');
			end
			else 
			begin
				writeln(' Not leap year');
			end
		end
		else 
		begin
			writeln('Leap Year');
		end
	end
	else
	begin
		writeln(' Not leap year');
	end;
end.