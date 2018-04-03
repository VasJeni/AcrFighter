program image;

uses
	wingraph,wincrt;
type
	TColorArray = array [0..6] of longword;

var
	//sunColors : array [0..6] of longword = (0,2,4,5,6,7,7);
	//sunColorsEtalon : array [0..6] of longword; 

	sunColors : TColorArray;
	sunColorsEtalon : TColorArray;

	sunYarray: array[0..6] of real = (500, 10, 470, 390, 20, 580, 0);
	sunXarray: array[0..6] of real = (100, 200, 300, 400, 500, 600, 700);
	speedArrayY: array[0..6] of real = (-7.2, 1.5, -0.5, -2, 4.5, -2.7, 7.8);
	speedArrayX : array[0..6] of real =(1.4, 2.4, 7.5, -0.85, 1.01, -1, -4.3); 

const
	NumberOfSunRays = 5;
	SunRadius = 20;
	SunRayRadius = 30;

procedure DrawSun(x, y: integer; SunColor: integer);
var
	i: Integer;	
	RayAngle: integer;
begin	
	setfillstyle(SolidFill, SunColor);
	SetColor(SunColor);
	
	// Sun rays
	RayAngle:= 360 div NumberOfSunRays;
	for i := 0 to NumberOfSunRays-1 do
	begin
		PieSlice(x,y, i*RayAngle, i*RayAngle + 20, SunRayRadius );
	end;

	// Sun body
	FillEllipse(x, y, SunRadius, SunRadius);
end;


procedure StartGraphics();
var
	gm,gd: smallInt;
begin
	gd := Nopalette;	
	gm := m800x600;
	InitGraph(gd,gm, '');
end;

var
	sunsY: real;

procedure DrawAllSuns( colors: TColorArray );
var
	i : integer;
begin
	for i:=0 to 6 do
	begin
		//DrawSun((i)*100,round(sunsY), colors[i-1]);

		DrawSun(round(sunXarray[i]), round(sunYarray[i]), colors[i]);
	end;
end;


var
	tmp : longword;
	i: integer;

//
// Main procedure
//
begin

	randomize();
	
	StartGraphics();

	//for i := 0 to 6 do
	//begin
	//	sunYarray[i] := 400 + random(30)*15;		
	//end;

	sunColors[0] := red;
	sunColors[1] := orange;
	sunColors[2] := yellow;
	sunColors[3] := green;
	sunColors[4] := cyAN;
	sunColors[5] := blue;
	sunColors[6] := violet;

	sunColorsEtalon[0] := red;
	sunColorsEtalon[1] := orange;
	sunColorsEtalon[2] := yellow;
	sunColorsEtalon[3] := green;
	sunColorsEtalon[4] := cyAN;
	sunColorsEtalon[5] := blue;
	sunColorsEtalon[6] := violet;

	UpdateGraph(UpdateOff);

	//SunsY := 500;

	readkey();

	//for i := 1 to 40 do
	while (sunYarray[3] > 0) do
	begin
			
		ClearDevice();
		DrawAllSuns(sunColors);
		UpdateGraph(UpdateNow);
		//readkey();
		Delay(20);

		//SunsY := SunsY - 4.3;
		for i := 0 to 6 do
		begin
			sunYarray[i] := sunYarray[i] + speedArrayY[i];
			sunXarray[i] := sunXarray[i] + speedArrayX[i];
		end;
	end;

	readkey();
	CloseGraph();
end.