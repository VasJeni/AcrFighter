program EquilateralTraingle;
		
	uses
		wingraph, wincrt, math;
	var
		gDriver, gMode: Smallint;
		i, x,y,h,a :Integer;

begin
	randomize;
	gDriver:=noPalette;
	gMode:= m800x600;

	a:=100;


	h:=round(sqrt(sqr(a)-sqr(a)/4));

	initgraph(gDriver,gMode,'Dream');

	moveTo(50,200);
	lineRel(100,0);
	lineRel(-50,h);
	lineRel(-50,-h);

	readkey();

	closegraph();
	
end.