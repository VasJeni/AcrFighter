program treugolnic;
		
	uses
		wingraph, wincrt;
	var
		gDrive, gMode: Smallint;
begin
	gDrive:=noPalette;
	gMode:= m800x600;

	initgraph(gDrive, gMode, 'Treugolnic');

	moveTo(50,60);
	lineRel(90,100);
	lineRel(-50,250);
	lineTo(50,60);

	readkey();

	closegraph();
	
end.