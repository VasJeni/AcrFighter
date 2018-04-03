program alarmClock;
var
day, mounth: Integer;
holiday, workingDay, dayOff, correctMounth, workingMounth: Boolean;

begin
	writeln('Enter day and mounth');
	readln(day, mounth);
	workingDay:= ((day<6) and (day>0));
	dayOff:= ((day=6) or (day=7));
	correctMounth:= (( mounth>0 ) and (mounth<12));
	holiday:= ((mounth=7) or (mounth=10));
	workingMounth:= (correctMounth and (not holiday));
	if ((not workingDay) and (not dayOff)) then
		begin
			writeln('incorect day');
		end;	
	if (not correctMounth) then
		begin
			writeln('incorect mounth');
		end;
	if (correctMounth and ((workingDay) or (dayOff))) then
	begin
		write('alarm ');
	end;
	if (holiday and workingDay) then
		begin
			writeln('on 10am')
		end;
	if (holiday and dayOff)  then
		begin
		 	writeln('off');
		 end;
	if ((workingMounth) and workingDay) then
	begin
		writeln ('on 7am');
	end;
	if (workingMounth and dayOff) then
	begin
		writeln('on 10am')
	end;
	readln();
end.