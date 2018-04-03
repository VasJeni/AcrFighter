program TeaPArty;
 var
 	tea, cake: Integer;
 	teaCake, cakeTea, teaNorma, cakeNorma, norma: Boolean;
 	excellent, good, boring, party: String;

 begin
 party:='party is ';
 good:='good';
 excellent := 'excellent';
 boring :='boring';
 	writeln('enter tea and cakes');
 	readln(tea, cake);

 	teaCake := ((tea/2) >= cake);
 	cakeTea := ((cake/2) >= tea);
 	cakeNorma := (cake>=5);
 	teaNorma := (tea>=5);
 	norma:=(teaNorma and cakeNorma);

 	if norma and (teaCake or cakeTea) then
 	begin
 	writeln(party, excellent);
 	end
 	else if norma then
 	begin
 		writeln(party, good);
 	end
 	else
 	begin
 		writeln (party, boring);
 	end;
 	readln();
 end.