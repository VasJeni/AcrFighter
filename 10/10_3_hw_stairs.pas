program stairs;
		
	uses
		wingraph, crt;
	var
		gDrive, gMode: Smallint;
		i, steps :Integer;
begin
	gDrive:=noPalette;
	gMode:= m800x600;
	readln(steps);

	initgraph(gDrive, gMode, 'Treugolnic');

	writeln('How many steps you want?');

	moveTo(0,600);

	for i := 1 to steps do 
	begin
		
	lineRel(24,0);
	lineRel(0,-17);
	
	end;



	readkey();

	closegraph();
	
end.