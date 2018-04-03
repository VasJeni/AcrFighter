{
	*Задача 18.2*
в программу `Fruits` добавить ещё два фрукта на ваш выбор:
- добавить соответствующие процедуры
- добавить соответствующие переменные, заполнить их
- добавить код их движения
*Задача 18.3*
В программу `Fruits` добавить код для того чтобы фрукты летали бесконечно:
- либо отбивались от краёв экрана
- либо появлялись с обратной стороны
(как мы делали с солнцами на одном из прошлых занятий)
*Задача 18.4*
В программу `Fruits` добавить ещё реакцию на нажатие клавиш:
- по нажатию все фрукты перемещаются вверх (или вниз)
- по нажатию фрукт меняет скорость (на ваше усмотрение как именно)
- по нажатию два фрукта меняются местами
}
program progimage;

uses
	wingraph,wincrt;

type


	TCoord = record
		x,y : real;		
	end;

	TFruitType = record
		Position: TCoord;
		Speed: TCoord;
	end;

var
	carrot: TFruitType;
	pineapple ,watermelon : TFruitType;
	tmpPositionForSwap: Real;


procedure StartGraphics();
var
	gm,gd: smallInt;
begin
	gd := Nopalette;	
	gm := m800x600;
	InitGraph(gd,gm, '');
end;

procedure DrawCarrot(x, y: integer);
begin


	setfillstyle(SolidFill, green);
	SetColor(green);
	//FillEllipse(95, 60, 3, 15);
	FillEllipse(x, y, 3, 15);
	Line(x+2, y+10, x+20, y-15);
	Line(x-2, y+10, x+10, y-15);
	
	SetColor(orange);
	SetFillStyle(SolidFill, orange);
	PieSlice(x-5, y+40, 60, 100, 30);

	setfillstyle(SolidFill, brown);
	SetColor(brown);
	Line (x-5,y+30, x-2,y+30);
	Line (x-7,y+25, x-4,y+25);
	Line (x-5,y+20, x-2,y+20);
	Line (x-7,y+17, x-4,y+17);
	Line (x-5,y+12, x-2,y+12);
	Line (x-4,y+17, x,y+17);
	Line (x-2,y+12, x+1,y+12);
end;

procedure DrawPineApple(x, y: integer);
begin
	SetColor(SlateGray);
	setfillstyle(SolidFill, SlateGray);
	FillEllipse(x, y+9, 5,2);

	SetColor(DarkGreen);
	setfillstyle(SolidFill, olivedrab);
	FillEllipse(x-5, y-8, 5,2);
	FillEllipse(x+5, y-8, 5,2);
	FillEllipse(x-4, y-12, 4,2);
	FillEllipse(x+4, y-12, 4,2);
	FillEllipse(x, y-8, 3,10);


	SetColor(DarkGreen);
	setfillstyle(SolidFill, goldenrod);
	// PieSlice(400,300, 0, 180, 75);
	FillEllipse(x, y, 6,9);

	FillEllipse(x,y-6, 2,3);

	FillEllipse(x+4,y-1, 2,3);
	FillEllipse(x,y-1, 2,3);
	FillEllipse(x-4,y-1, 2,3);

	FillEllipse(x+2,y+4, 2,3);
	FillEllipse(x-2,y+4, 2,3);
end;

procedure DrawWatermelon(x,y:Integer);
begin
	//skin
	setfillstyle(SolidFill, DarkOliveGreen);
	setColor(DarkOliveGreen);
	pieSlice(x, y, 180, 360, 15);
	setfillstyle(SolidFill, OliveDrab);
	setColor(OliveDrab);
	pieSlice(x, y, 180, 360, 14);
	setfillstyle(SolidFill, YellowGreen);
	setColor(YellowGreen);
	pieSlice(x, y, 180, 360, 13);
	setfillstyle(SolidFill, Monza);
	setColor(Monza);
	pieSlice(x, y, 180, 360, 12);

	//seeds
	setfillstyle(SolidFill, Russet);
	setColor(Russet);
	fillEllipse(x-7,y+3,1,1);
	fillEllipse(x-4,Y+3,1,1);
	fillEllipse(x+1,Y+2,1,1);
	fillEllipse(x+4,Y+4,1,1);
	fillEllipse(X+8,Y+2,1,1);
	fillEllipse(X-9,Y+5,1,1);
	fillEllipse(X-6,Y+6,1,1);
	fillEllipse(X-3,Y+7,1,1);
	fillEllipse(X,Y+8,1,1);
	fillEllipse(X+5,Y+9,1,1);
end;

function Keyboard() : boolean;
var
	button: char; // '3' 'a' 'O' 'o'
//
begin

	// Значение по умолчанию - продолжать работать (не выходить)
	Keyboard := false;

	if (keypressed()) then
	begin
		button := readkey();

		//if (button = chr(27)) then
		if (button = 'q') then
		begin
			Keyboard := true; // в этом случае - выходить
		end;

		if (button = 'r') then
		begin
			pineapple.Speed.y := - pineapple.Speed.y;
		end;

		if (button = 'l') then
		begin
			carrot.Position.x := carrot.Position.x + 20;
		end;

		if (button = 'x') then
		begin
			carrot.Position.x := 890;
		end;
		if (button= 't') then // top position
		begin
			carrot.Position.y:=0;
			pineapple.position.y:=0;
			watermelon.position.y:=0;
		end;
		if (button = 'b') then //position Bottom
		begin
			carrot.Position.y:=500;
			pineapple.position.y:=500;
			watermelon.position.y:=500;
		end;
		if (button = 'm') then //position middle
		begin
			carrot.Position.y:=250;
			pineapple.position.y:=250;
			watermelon.position.y:=250;
		end;
		if (button= 's') then //swap fruct
		begin
			tmpPositionForSwap:=carrot.Position.x;
			carrot.Position.x:=watermelon.Position.x;
			watermelon.Position.x:=tmpPositionForSwap;
		end;
		if (button = 'f') then //faster
		begin
			watermelon.speed.y := watermelon.speed.y + (watermelon.speed.y* 0.1); 	
		end 
	end;	
end;

var
	tmp : longword;
	i: integer;

// Main procedure
//
begin

	randomize();
	
	StartGraphics();

	carrot.Position.x := 100;
	carrot.Position.y := 0;
	carrot.Speed.x := 0;
	carrot.Speed.y := 2;

	pineapple := carrot;
	pineapple.Position.x := 400;
	pineapple.Speed.y := 1.5;

	watermelon:=carrot;
	watermelon.Position.x:=600;
	watermelon.speed.y:=3;

	UpdateGraph(UpdateOff);

	//SunsY := 500;

	readkey();

	//DrawSun(round(aldebaran.x), round(aldebaran.y), aldebaran.Color);

	UpdateGraph(UpdateNow);

	//for i := 1 to 40 do
	//while (sunYarray[3] > 0) do
	while (true) do
	begin
			
		ClearDevice();

		DrawPineApple(
			round(pineapple.Position.x),
			round(pineapple.Position.y)
			);

		DrawCarrot(
			round(carrot.Position.x),
			round(carrot.Position.y)
			);

		DrawWatermelon(
			round(watermelon.Position.x),
			round(watermelon.Position.y)
			);



		UpdateGraph(UpdateNow);

		Delay(20); // 


		carrot.Position.x := carrot.Position.x + carrot.Speed.x;

		if (carrot.Position.y>600) then
		begin
			carrot.Position.y:=0;  	
		end
		else if (carrot.Position.y<0) then
		begin
			carrot.Position.y:=600;
		end
		else
		begin
			carrot.Position.y := carrot.Position.y + carrot.Speed.y;	  	
		end;

		if (pineapple.Position.y>600) then
		begin
			pineapple.Position.y:=0;  	
		end
		else if (pineapple.Position.y<0) then
		begin
		 	pineapple.Position.y:=600
		end
		else 
		begin
			pineapple.Position.y := pineapple.Position.y + pineapple.Speed.y;  	
		end;
		
		if (watermelon.Position.y>600) then
		begin
			watermelon.Position.y:=0;  	
		end
		else if (watermelon.Position.y<0) then
		begin
		  watermelon.Position.y:=600;	
		end
		else
		begin
			watermelon.Position.y:=watermelon.Position.y + watermelon.speed.y;
		end;

		
		if (Keyboard()) then
		begin
			break;			
		end;
	end;

	ClearDevice();
	SetColor(white);
	circle(400,300, 100);
	UpdateGraph(UpdateNow);
	readkey();

	CloseGraph();
end.