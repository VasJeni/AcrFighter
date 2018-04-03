program treugolnic;
		
	uses
		wingraph, wincrt;
	var
		gDrive, gMode: Smallint;
		i:Integer;
begin
	gDrive:=noPalette;
	gMode:= m800x600;

	initgraph(gDrive, gMode, 'Treugolnic');

	moveTo(50,60);

	for i := 1 to 7 do 
		begin
			lineRel(90,50);
			moveRel(-90, 0);
		end;
		
	readkey();

	closegraph();
	
end.