program multiplicatioNx10;
	

	var i, ii, mult:Integer;

begin
	for i := 1 to 10 do
	begin
		for ii := 1 to 	10 do 
		begin
		mult:=i*ii;
			writeln(i,'x',ii,'=', mult);
		end;
		writeln();
	end;
end.