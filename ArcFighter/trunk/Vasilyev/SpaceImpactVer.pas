program SpaceImpact;

uses
	wingraph,wincrt,windows;
const
	ArraySize = 16;
	MaxInd = ArraySize-1;
type
	TCoord = record
		x,y : real;
	end;

	TSpaceCodeType = (codeMainHero);

	TSpaceType = record
		Position : TCoord;
		Speed : TCoord;
		code : TSpaceCodeType;
		Symbol : char;
	end;
	//TintArr = array[0..MaxInd] of TSpaceType;

var
	TheSpace : TSpaceType;
	i : Integer;
	switch : Boolean;

procedure StartGraphics();
var
	gm,gd: smallInt;
begin
	gd := Nopalette;	
	gm := m800x600;
	InitGraph(gd,gm, '');
end;

procedure WriteMainHero (var value1 : TSpaceType);
begin
	FillEllipse (round(value1.position.x),
				round(value1.position.y),
				10,5);
end;

procedure MoveMainHero (var value1 : TSpaceType);
begin
	if (IsKeypressed(VK_d)) then
    begin
        value1.Position.x := value1.Position.x + value1.Speed.x;
    end;

    if (IsKeypressed(VK_a)) then
    begin
        value1.Position.x := value1.Position.x - value1.Speed.x;
    end;

    if (IsKeypressed(VK_s)) then
    begin
        value1.Position.y := value1.Position.y + value1.Speed.y;
    end;

    if (IsKeypressed(VK_w)) then
    begin
        value1.Position.y := value1.Position.y - value1.Speed.x;
    end;
end;
procedure drawSky();
begin
	setColor(blue);//sky
	setFillstyle(1, blue);
	bar(0,0,800,184);
end;

procedure drawGarden();
begin
	setColor(blue);//garden
	setFillstyle(1, darkgreen);
	bar(0,185,800,600);	
end;

procedure drowBackground();
begin
	drawSky();
	drawGarden();
end;


//Main program
begin

	StartGraphics();

	UpdateGraph(UpdateOff);
	ClearDevice();
	delay(200);


	TheSpace.position.x := 10;
	TheSpace.position.y := 400;

	TheSpace.Speed.x := 0.3;
	TheSpace.Speed.y := 0.3;

switch := true;

while switch do
begin
	UpdateGraph(UpdateOff);
	drowBackground();
	//cleardevice();
	Delay(200);
	WriteMainHero(TheSpace);
	MoveMainHero(TheSpace);
	UpdateGraph(UpdateNow);



    if (IsKeypressed(VK_q)) then
    begin
    	switch := false;
    end;
end;

	readkey();
end.