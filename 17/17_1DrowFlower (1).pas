program DrawFlower;

uses
	wingraph,wincrt;
type

	TFlower = record
		LeavesColor : longword;
		positionX :integer;
		positionY :integer;
		leavesLarge: integer;
		PetalRange : integer;
		stemHight: integer;
		centralPetal: longword;
		midPetal :longword;
		BottomPetal:longword;

	end;

procedure StartGraphics();
var
	gm,gd: smallInt;
begin
	gd := Nopalette;	
	gm := m800x600;
	InitGraph(gd,gm, '');
end;

procedure DrawFlower(parametr1: TFlower);
begin
	// Leaves
	SetColor(parametr1.LeavesColor);	
	line(
		parametr1.positionX,
		parametr1.positionY,
		parametr1.positionX, 
		parametr1.positionY-parametr1.stemHight);
	line(parametr1.positionX,
		parametr1.positionY,
		parametr1.positionX- parametr1.leavesLarge,
		parametr1.positionY- parametr1.leavesLarge);
	line(parametr1.positionX,
		parametr1.positionY, 
		parametr1.positionX+ parametr1.leavesLarge,
		parametr1.positionY- parametr1.leavesLarge);

	// Flower
	setfillstyle(SolidFill, parametr1.BottomPetal);
	SetColor(parametr1.BottomPetal);
	FillEllipse(parametr1.positionX,
		parametr1.positionY-parametr1.stemHight,
		parametr1.PetalRange + 8, parametr1.PetalRange + 8);
	setfillstyle(SolidFill, parametr1.midPetal);
	SetColor(parametr1.midPetal);
	FillEllipse(parametr1.positionX,
		parametr1.positionY- parametr1.stemHight, 
		parametr1.PetalRange +4,
		parametr1.PetalRange +4);
	setfillstyle(SolidFill, parametr1.centralPetal);
	SetColor(parametr1.centralPetal);
	FillEllipse(parametr1.positionX, 
	parametr1.positionY-parametr1.stemHight,
	parametr1.PetalRange,
	parametr1.PetalRange);
end;




var
	//Flowers: TFlower;
	i:integer;

	//Flowers :array[0..2] of TFlower; 
	firstFlower,secondFlower,thirdFlower:TFlower;





begin
	
	StartGraphics();

//	DrawFlower(200, 200);
	readkey();

	{
	Flowers[0].LeavesColor:=green;
	Flowers[0].leavesLarge:=20;
	Flowers[0].positionX:=200;
	Flowers[0].PositionY:=200;
	Flowers[0].stemHight:=50;
	Flowers[0].PetalRange:=5;

	Flowers[1]:=Flowers[0];
	Flowers[1].positionX :=Flowers[0].positionX + 50;
	Flowers[2]:=Flowers[1];
	Flowers[2].positionX :=Flowers[1].positionX + 50;
	}

	{for i := 1 to 2 do
	begin
		Flowers[i]:=Flowers[i-1];
		Flowers[i].positionX:=Flowers[i-1].positionX + 50;
	end;}

	
	firstFlower.LeavesColor:=green;
	firstFlower.leavesLarge:=20;
	firstFlower.positionX:=200;
	firstFlower.PositionY:=200;
	firstFlower.stemHight:=50;
	firstFlower.PetalRange:=5;
	firstFlower.centralPetal:=gray;
	firstFlower.midPetal:=PaleBrown;
	firstFlower.BottomPetal:=Pear;


	secondFlower.LeavesColor:=orange;
	secondFlower.leavesLarge:=20;
	secondFlower.positionX:=300;
	secondFlower.PositionY:=200;
	secondFlower.stemHight:=70;
	secondFlower.PetalRange:=2;
	secondFlower.centralPetal:=Peru;
	secondFlower.midPetal:=Lime;
	secondFlower.BottomPetal:=Plum;



	thirdFlower.LeavesColor:=purple;
	thirdFlower.leavesLarge:=20;
	thirdFlower.positionX:=320;
	thirdFlower.PositionY:=200;
	thirdFlower.stemHight:=50;
	thirdFlower.PetalRange:=10;
	thirdFlower.centralPetal:=Violet;
	thirdFlower.midPetal:=Linen;
	thirdFlower.BottomPetal:=Red;


	{for i := 0 to 2 do
	begin
		DrawFlower(Flowers[i]);
	end;}

	DrawFlower(firstFlower);
	DrawFlower(secondFlower);
	DrawFlower(thirdFlower);

	readkey();


	CloseGraph();	
end.