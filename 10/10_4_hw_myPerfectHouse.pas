program stairs;
		
	uses
		wingraph, crt;
	var
		gDriver, gMode: Smallint;
		i, rnx,rny :Integer;
		rnCW:ShortString;

begin
	randomize;
	gDriver:=noPalette;
	gMode:= m800x600;

	rnx:=60;
	rny:=50;

	moveTo(rnx,rny);

	initgraph(gDriver,gMode,'Dream');

	for i := 1 to 5 do 
	begin
	moveRel(rnx,rny);

	{case rnc of
		0: rnCW:=Amber;
		1: rnCW:=Blue;
		2: rnCW:=Brass;
		3: rnCW:=LightRed;
		4: rnCW:=LightSeaGreen;
		5: rnCW:=Peru;
		6: rnCW:=Yellow;
		7: rnCW:=Olive;
		8: rnCW:=YellowGreen;
		9: rnCW:=Flax;
	end;}

	case i of
		1:	SetColor($ff0000);
		2:	SetColor($0000ff);
		3:	SetColor($00ff00);
		4:	SetColor($ff00ff);
		5:	SetColor($ffff00);
	end

	;
	lineRel(20,-10);
	lineRel(20,10);
	lineRel(-40,0);
	lineRel(0,25);
	lineRel(40,0);
	lineRel(0,-25);
	SetColor($ffffff);
	moveRel(-20,25);//дверь
	lineRel(0,-20);
	lineRel(-10,0);
	lineRel(0,20);
	moveRel(5,-10);//ручка для двери
	lineRel(3,3);
	lineRel(0,-3);
	lineRel(-3,0);
	lineRel(0,3);
	lineRel(3,0);
	moverel(8,0);//window
	lineRel(8,0); //прямоугольное линиями
	lineRel(0,-8);
	lineRel(-8,0);
	lineRel(0,8);



	rnx:=random(140);
	rny:=random(120);

	end;



	readkey();

	closegraph();
	
end.