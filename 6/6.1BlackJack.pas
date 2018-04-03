program BlackJack;

var	jonSchore, richardSchore: Integer;



	begin
	writeln('enter schore Jon and Richard');
	readln(jonSchore, richardSchore );
	if (jonSchore>21) or (richardSchore>21) then 
	begin
		if (jonSchore>21) and (richardSchore>21) then
			begin
			writeln('draw');
			end
		else 
			begin 
				if jonSchore>21 then
				begin
			 		writeln('Jon lose, Richard win');
				end
				else
				begin
					writeln('Richard lose,Jon win');
				end
			end
		end
	else
	begin
		if jonSchore=richardSchore then 
		begin
			writeln('draw');
		end
		else if jonSchore>richardSchore then
		begin
			writeln('Richard lose,Jon win');
		end
		else 
		begin
			writeln('Jon lose, Richard win');
		end;
	end;
end.