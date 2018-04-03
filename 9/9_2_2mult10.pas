program multiplicatioNx10all;
	

	var i, numberOne, numberSecond, mult:Integer;

begin
	numberOne:=1;
	numberSecond:=1;
	for i := 1 to 100 do
	begin
	mult:=numberOne*numberSecond;
		write(' ',numberSecond:2, 'x',numberOne:2,'=', mult:3);
		if numberSecond=10 then
		begin
		 	inc(numberOne);
		 	numberSecond:=0;
		 	writeln();
		end;
		inc(numberSecond);
	end;
end.