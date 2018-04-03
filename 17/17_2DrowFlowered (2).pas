program DrawFlower;

uses
	wingraph,wincrt;
const
	ArraySize = 12;
	NumberOfFlowers = ArraySize-1;

type
	TFlower = record
		LeavesColor : longword;
		positionX :integer;
		positionY :integer;
		leavesLarge: integer;
		PetalRange : integer;
		stemHight: integer;
		centralPetalColor: longword;
		midPetalColor :longword;
		BottomPetalColor:longword;
	end;

	TAFlower = array[0..NumberOfFlowers] of TFlower; 


var
	i: Integer;

procedure StartGraphics();
var
	gm,gd: smallInt;
begin
	gd := Nopalette;	
	gm := m800x600;
	InitGraph(gd,gm, '');
end;

procedure DrawFlower(var arr:TAFlower);
begin
	// Leaves
	SetColor(arr[i].LeavesColor);
	line(
		arr[i].positionX,
		arr[i].positionY,
		arr[i].positionX, 
		arr[i].positionY-arr[i].stemHight);
	line(
		arr[i].positionX,
		arr[i].positionY,
		arr[i].positionX-arr[i].leavesLarge,
		arr[i].positionY-arr[i].leavesLarge);
	line(
		arr[i].positionX,
		arr[i].positionY, 
		arr[i].positionX+arr[i].leavesLarge,
		arr[i].positionY-arr[i].leavesLarge);

	// Flower
	setfillstyle(SolidFill, arr[i].BottomPetalColor);
	SetColor(arr[i].BottomPetalColor);
	FillEllipse(
		arr[i].positionX,
		arr[i].positionY-arr[i].stemHight,
		arr[i].PetalRange + 8, 
		arr[i].PetalRange + 8);
	setfillstyle(
		SolidFill, 
		arr[i].midPetalColor);
	SetColor(arr[i].midPetalColor);
	FillEllipse(
		arr[i].positionX,
		arr[i].positionY-arr[i].stemHight, 
		arr[i].PetalRange+4,
		arr[i].PetalRange+4);
	setfillstyle(SolidFill, arr[i].centralPetalColor);
	SetColor(arr[i].centralPetalColor);
	FillEllipse(
		arr[i].positionX, 
		arr[i].positionY-arr[i].stemHight,
		arr[i].PetalRange,
		arr[i].PetalRange);
	arr[i].positiony:=arr[i].positionY+100;
end;

//	main procedure

var
	AColor :array[0..20] of longword;
	AFlowers : TAFlower;

begin
	
	randomize;

	StartGraphics();
	AColor[0]:=Yellow;
	AColor[1]:=Violet;
	AColor[2]:=Amber;
	AColor[3]:=Amethyst;
	AColor[4]:=Azure;
	AColor[5]:=Beige;
	AColor[6]:=Bisque;
	AColor[7]:=Bistre;
	AColor[8]:=White;
	AColor[9]:=Blue;
	AColor[10]:=Brass;
	AColor[11]:=Buff;
	AColor[12]:=Bronze;
	AColor[13]:=Brown;
	AColor[14]:=Carrot;
	AColor[15]:=Casper;
	AColor[16]:=Corn;
	AColor[17]:=Cyan;
	AColor[18]:=Cream;
	AColor[19]:=Green;
	AColor[20]:=Red;
	
	AFlowers[0].LeavesColor:=AColor[random(21)];
	AFlowers[0].positionX:=300;
	AFlowers[0].positionY:=300;
	AFlowers[0].leavesLarge:=20;
	AFlowers[0].PetalRange:=5;
	AFlowers[0].stemHight:=50;
	AFlowers[0].centralPetalColor:=AColor[random(21)];
	AFlowers[0].midPetalColor:=AColor[random(21)];
	AFlowers[0].BottomPetalColor:=AColor[random(21)];

	AFlowers[1]:=AFlowers[0];
	AFlowers[1].LeavesColor:=AColor[random(21)];
	AFlowers[1].positionX:=AFlowers[0].positionX + 50;
	AFlowers[1].centralPetalColor:=AColor[random(21)];
	AFlowers[1].midPetalColor:=AColor[random(21)];
	AFlowers[1].BottomPetalColor:=AColor[random(21)];

	AFlowers[2]:=AFlowers[1];
	AFlowers[2].LeavesColor:=AColor[random(21)];
	AFlowers[2].positionX:=AFlowers[1].positionX + 50;
	AFlowers[2].centralPetalColor:=AColor[random(21)];
	AFlowers[2].midPetalColor:=AColor[random(21)];
	AFlowers[2].BottomPetalColor:=AColor[random(21)];

	readkey();

	for i := 3 to NumberOfFlowers do
	begin
		if ((i mod 3) = 0) then
		begin
			AFlowers[i]:=AFlowers[0]; 	
		end
		else if ((i mod 2) = 0 ) then
		begin
			AFlowers[i]:=AFlowers[1]; 	
		end 
		else
		begin
			AFlowers[i]:=AFlowers[2];
		end;
		AFlowers[i].positionX:=AFlowers[i-1].positionX+50;
	end; 

	
	{for iii := 0 to 2 do 
	begin
		for ii := 3 to 5 do
		begin 
		i:=(ii mod 3); 
		DrawFlower(AFlowers);
		AFlowers[i].BottomPetalColor:=AColor[random(21)];
		AFlowers[i].midPetalColor:=AColor[random(21)];
		AFlowers[i].centralPetalColor:=AColor[random(21)];
		readkey();
		end;
		AFlowers[0].positionY:=AFlowers[0].positionY + 100;
		AFlowers[1].positionY:=AFlowers[0].positionY;
		AFlowers[2].positionY:=AFlowers[0].positionY;
	end;}

	for i:= 0 to NumberOfFlowers do
	begin
		DrawFlower(AFlowers);
	end;


	readkey();	
	CloseGraph();
end.