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


{
	main procedure	

}
var
	//Flowers: TFlower;
	i:integer;

	//Flowers :array[0..2] of TFlower; 
	firstFlower,secondFlower,thirdFlower:TFlower;
	Flovered: array[0..7] of TFlower; 
	APetalColor :array[0..20] of longword ;



begin
	
	randomize;
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
	end;
}

	APetalColor[0]:=Yellow;
	APetalColor[1]:=Violet;
	APetalColor[2]:=Amber;
	APetalColor[3]:=Amethyst;
	APetalColor[4]:=Azure;
	APetalColor[5]:=Beige;
	APetalColor[6]:=Bisque;
	APetalColor[7]:=Bistre;
	APetalColor[8]:=White;
	APetalColor[9]:=Blue;
	APetalColor[10]:=Brass;
	APetalColor[11]:=Buff;
	APetalColor[12]:=Bronze;
	APetalColor[13]:=Brown;
	APetalColor[14]:=Carrot;
	APetalColor[15]:=Casper;
	APetalColor[16]:=Corn;
	APetalColor[17]:=Cyan;
	APetalColor[18]:=Cream;
	APetalColor[19]:=Green;
	APetalColor[20]:=Red;
	
	firstFlower.LeavesColor:=APetalColor[random(20)];
	firstFlower.leavesLarge:=20;
	firstFlower.positionX:=50;
	firstFlower.PositionY:=200;
	firstFlower.stemHight:=50;
	firstFlower.PetalRange:=5;
	firstFlower.centralPetal:=APetalColor[random(20)];
	firstFlower.midPetal:=APetalColor[random(20)];
	firstFlower.BottomPetal:=APetalColor[random(20)];

	secondFlower.LeavesColor:=APetalColor[random(20)];
	secondFlower.leavesLarge:=20;
	secondFlower.positionX:=100;
	secondFlower.PositionY:=200;
	secondFlower.stemHight:=50;
	secondFlower.PetalRange:=5;
	secondFlower.centralPetal:=APetalColor[random(20)];
	secondFlower.midPetal:=APetalColor[random(20)];
	secondFlower.BottomPetal:=APetalColor[random(20)];

	thirdFlower.LeavesColor:=APetalColor[random(20)];
	thirdFlower.leavesLarge:=20;
	thirdFlower.positionX:=150;
	thirdFlower.PositionY:=200;
	thirdFlower.stemHight:=50;
	thirdFlower.PetalRange:=5;
	thirdFlower.centralPetal:=APetalColor[random(20)];
	thirdFlower.midPetal:=APetalColor[random(20)];
	thirdFlower.BottomPetal:=APetalColor[random(20)];

	{
	for i := 0 to 5 do
	begin
		if ((i div 2) = 0) then	
		begin
			DrawFlower(firstFlower);
		end
		else
		begin
			DrawFlower(secondFlower); 	
			firstFlower.positionX:=firstFlower.positionX + 100;
		end;
		else
		begin
			DrawFlower(thirdFlower);
			firstFlower.positionX:=firstFlower.positionX + 50;
		end;
	end;
	}

	{
	DrawFlower(firstFlower);
	firstFlower.positionX:=100;
	DrawFlower(firstFlower);
	firstFlower.positionX:=150;
	DrawFlower(firstFlower);
	firstFlower.positionX:=200;
	DrawFlower(firstFlower);
	firstFlower.positionX:=250;
	DrawFlower(firstFlower);
	firstFlower.positionX:=300;
	DrawFlower(firstFlower);
	firstFlower.positionX:=350;
	}

	for i := 1 to 5 do
	begin
	DrawFlower(firstFlower);
	DrawFlower(secondFlower);
	DrawFlower(thirdFlower);
	firstFlower.positionX:=firstFlower.positionX + 150;
	secondFlower.positionX:=secondFlower.positionX + 150;
	thirdFlower.positionX:=thirdFlower.positionX +150;
	end;
	
	firstFlower.positionY:=300;
	firstFlower.positionX:=50;
	secondFlower.positionY:=300;
	secondFlower.positionX:=100;
	thirdFlower.positionY:=300;
	thirdFlower.positionX:=150;
	
	for i := 1 to 5 do
	begin
	DrawFlower(firstFlower);
	DrawFlower(secondFlower);
	DrawFlower(thirdFlower);
	firstFlower.positionX:=firstFlower.positionX + 150;
	secondFlower.positionX:=secondFlower.positionX + 150;
	thirdFlower.positionX:=thirdFlower.positionX +150;
	end;

	firstFlower.positionY:=400;
	firstFlower.positionX:=50;
	secondFlower.positionY:=400;
	secondFlower.positionX:=100;
	thirdFlower.positionY:=400;
	thirdFlower.positionX:=150;
	
	for i := 1 to 5 do
	begin
	DrawFlower(firstFlower);
	DrawFlower(secondFlower);
	DrawFlower(thirdFlower);
	firstFlower.positionX:=firstFlower.positionX + 150;
	secondFlower.positionX:=secondFlower.positionX + 150;
	thirdFlower.positionX:=thirdFlower.positionX +150;
	end;

	readkey();

	CloseGraph();	
end.