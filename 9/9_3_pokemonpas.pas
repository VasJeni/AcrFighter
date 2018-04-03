program multiplicatioNx10;
	

	var i, bobSum, jaySum, choise, bobToday, jayToday, day:Integer;
		winner, yourChoise: String;

begin
	bobSum:=0;
	jaySum:=0;
	randomize;
	writeln('Enter your choise');
	readln(choise);
	day:=0;
	case choise of
	 	1: yourChoise:='Bob';
	 	2: yourChoise:='Jay';
	end;

	writeln('You choise ', yourChoise);
	writeln();
	for i := 1 to 7 do
	begin
	inc(day);
	bobToday:=(random(4)+3);
	jayToday:=(random(4)+3);
	bobSum:=bobSum+bobToday;
	jaySum:=jaySum+jayToday;
	writeln('Day ', day);
	writeln('Bob caught ', bobToday , ' pokemons ( now he has ' , bobSum , ' )');
	writeln('Jay caught ', jayToday , ' pokemons ( now he has ' , jaySum , ' )');
	writeln();		
	end;
	if bobSum=jaySum then
	begin
		writeln('It''s a tie.');
		writeln('You lose the bet.');
	end
	else
	begin	
		if bobSum>jaySum then
		begin
		winner:='Bob';
		end;
		if jaySum>bobSum then
		begin
		 	winner:='Jay';
		end;
		writeln(winner, ' wins!');
		if winner=yourChoise then	
		begin
			writeln('You win the bet.');
		end
		else
		begin
			writeln('You lose the bet.');
		end
	end
end.