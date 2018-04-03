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

	tmp : longword;

	//sunColors : array [0..6] of longword;

{
procedure DrawAllSuns();
var
	x, i : integer;
begin
	for i:=1 to 7 do
	begin
		DrawSun((i)*100,40, sunColors[i-1]);
	end;	
end;

procedure DrawAllSunsEtalon();
var
	x, i : integer;
begin
	for i:=1 to 7 do
	begin
		DrawSun((i)*100,40, sunColorsEtalon[i-1]);
	end;	
end;
}

procedure DrawAllSuns( colors: TColorArray );
var
	i : integer;
begin
	for i:=1 to 7 do
	begin
		DrawSun((i)*100,40, colors[i-1]);
	end;	
end;

begin
	
	StartGraphics();
	
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

	DrawAllSuns(sunColors);
	readkey();

	sunColors[1] := olive;
	sunColors[6] := white;

	DrawAllSuns(sunColors);
	readkey();

	// стандартный способ поменять местами значения переменных
	tmp := sunColors[0];
	sunColors[0] := sunColors[6];
	sunColors[6] := tmp;

	tmp := sunColors[1];
	sunColors[1] := sunColors[5];
	sunColors[5] := tmp;

	tmp := sunColors[2];
	sunColors[2] := sunColors[4];
	sunColors[4] := tmp;

	// нарисовать изменный массив
	//DrawAllSuns();
	DrawAllSuns(sunColors);
	readkey;

	// нарисовать оригинальный массив
	//DrawAllSunsEtalon();
	DrawAllSuns(sunColorsEtalon);
	readkey;

	// нарисовать изменный массив
	//DrawAllSuns();
	DrawAllSuns(sunColors);
	readkey;

	// нарисовать оригинальный массив
	//DrawAllSunsEtalon();
	DrawAllSuns(sunColorsEtalon);
	readkey;

	CloseGraph();
end.