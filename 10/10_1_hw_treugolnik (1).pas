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

	for i := 1 to 4 do 
	begin
		
	lineRel(90,100);
	lineRel(-50,250);
	lineRel(-40,-350);
	moveRel(100,0);
	
	end;



	readkey();

	closegraph();
	
end.