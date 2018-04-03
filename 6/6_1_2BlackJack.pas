program BlackJack;

var	jonSchore, richardSchore, vasyaTractoristSchore, zunoviyPupkaSchore, maxSchore: Integer;
	winner, looser: String;
	drow :boolean;
	begin
		winner:='';
		looser:='';
		drow:=false;
		writeln('enter Jon Schore, Richard Schore, Vasya Tractorist Schore, Zunoviy Pupka Schore');
		readln(jonSchore, richardSchore, vasyaTractoristSchore, zunoviyPupkaSchore);
		//drow
		if (jonSchore>21) and (richardSchore>21) and (vasyaTractoristSchore>21) and  (zunoviyPupkaSchore>21) then
		begin
			drow:=true;
		end;

		if (jonSchore=richardSchore) and (richardSchore=vasyaTractoristSchore) and (vasyaTractoristSchore=zunoviyPupkaSchore) then
		begin
			drow:=true;
		end;
	   
	    //maxSchore
		if jonSchore<22 then
		begin
			maxSchore:=jonSchore;
		end;
		
		if (richardSchore>=maxSchore) and (richardSchore<22) then
		begin
			maxSchore:=richardSchore;
		end;
		
		if (vasyaTractoristSchore>=maxSchore) and (vasyaTractoristSchore <22) then
		begin
			maxSchore:=vasyaTractoristSchore;
		end;
			
		if (zunoviyPupkaSchore>=maxSchore) and (zunoviyPupkaSchore <22) then
		begin	
			maxSchore:=zunoviyPupkaSchore;
		end;


		if drow then 
		begin
			write('drow');
		end
		else
		begin
			if RichardSchore=maxSchore then
			begin
				winner:= winner + ' Richard';
			end
			else
			begin
				Looser:= looser + ' Richard';
			end;

			if vasyaTractoristSchore=maxSchore then
			begin
				winner:= winner + ' vasyaTractorist';
			end
			else
			begin
				Looser:= looser + ' vasyaTractorist';
			end;

			if zunoviyPupkaSchore=maxSchore then
			begin
				winner:= winner + ' zunoviyPupka';
			end
			else
			begin
				Looser:= looser + ' zunoviyPupka';
			end;

			if jonSchore=maxSchore then
			begin
				winner:= winner + ' Jon';
			end
			else
			begin
				looser:= looser + ' Jon';
			end;
			write('Winer ', winner, ' Looser ', looser);
		end;
		readln();
	end.
