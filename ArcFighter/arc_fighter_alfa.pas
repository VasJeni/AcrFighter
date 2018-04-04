{
	*Версия 1. Поле*
На экране базовое игровое поле, базовый фон. При нажатии определённой 
клавиши - программа закрывается.

*Версия 2. Игрок*
Посредине добавляется фигура игрока (пусть для начала это будет прямоугольник). 
При нажатии определённых клавиш он меняет своё положение.

*Версия 3. Враг*
Где-то на поле добавляется фигура врага (прямоугольник). Игрок может ходить вокруг 
врага (это должно быть видно), но не может зайти на его место.

*Версия 4. Удар*
По нажатию кнопки игрок наносит удар: меняется его изображение. Если в хитбоксе удара игрока был враг - враг исчезает.

*Версия 5. Анимация удара*
Удар длиться не один кадр, а несколько. На время удара изображение игрока меняется.
Как вариант, на время удара игрок не двигается (не реагирует на нажатия клавиш).

*Версия 6. Удар врага*
Если игрок находится в хитбоксе врага, враг наносит удар. Запускается анимация удара врага, которая длится несколько кадров.
враг не может наносить удар чаще какого-то времени. Когда игрок "ударен", показывается сообщение.
Как вариант, после удара игрок отбрасывается на некоторое расстояние.

}


program arcFighter;

uses
	wingraph,wincrt, sysutils;

type
	TPosition = record
		x : Integer;
		y : Integer;
	end;

	THeroSprite = record
		moveleft : Integer;
		moveright : Integer;
		atack : boolean;
	end;

	THero = record
		position : TPosition;
		sprite: THeroSprite;
		speed:Integer;
	end;


var
	x,y,yEnemy, speedHero, timeOfHit, timeOfHitEnemy: Integer;
	hitHero, hit: boolean; 
	Hero : Thero;
	EnemySpeed,xEnemy : real;
	
procedure StartGraphics();
var
	gm,gd: smallInt;
begin
	gd := Nopalette;	
	gm := m800x600;
	InitGraph(gd,gm, '');
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


procedure drawSpriteHero(var hero:Thero);
begin
	if timeOfHit>0 then 
	begin
		setColor(red);
		setFillstyle(1,red);
		hitHero:=true;
	end
	else
	begin
		setColor(black);
		setFillstyle(1,black);
		hitHero:=false;
	end;
	bar(hero.position.x-40,hero.position.y-90,hero.position.x+40,hero.position.y+90);
	dec(timeOfHit);
end;

function hitEnemy(): boolean;
begin
	if (((Abs(hero.position.x-xEnemy)<85) and (Abs(hero.position.y-yEnemy)<90))) then		
	begin
		dec(timeOfHitEnemy);
		if timeOfHitEnemy=0 then
		begin
			timeOfHitEnemy:=300;
			hitEnemy:=true;
		end
		else
		begin
			hitEnemy:=false;
		end;
	end;
end;

function NotColisionSprite(): boolean;
begin
	if (((hero.position.x+39) >= (xEnemy-40)) and 
		((hero.position.x-39) <= (xEnemy+40)) and
		((hero.position.y+89) >= (yEnemy-90)) and
		((hero.position.y-89) <= (yEnemy+90))) then
	begin
		NotColisionSprite:=true;
	end
	else
	begin
		NotColisionSprite:=false;
	end;
end;

procedure drawSpriteEnemy(var xEnemy:real ; var yEnemy:Integer);
begin
	setColor(yellow);
	setFillstyle(1,yellow);
	bar(round(xEnemy-40),yEnemy-90,round(xEnemy+40),yEnemy+90);
	if ((Abs(hero.position.x-xEnemy)<85) and (Abs(hero.position.y-yEnemy)<90) and (hitHero)) then
	begin
	 	xEnemy:=xEnemy+1000;
	end;
	if not NotColisionSprite() then
	begin
		xEnemy:=xEnemy + EnemySpeed; 
	end;
	if xEnemy>900 then
	begin
		xEnemy:=-40;
	end
end;



function Keyboard():boolean;
var button: char;

begin
	keyboard:=false;

	if keypressed() then
	begin
		button:=readkey();
		case button of
			chr(27): keyboard:=true;
			'w': if (hero.position.y > 95) then
				begin
					hero.position.y:=hero.position.y-hero.speed;
					if NotColisionSprite() then
					begin
					 	hero.position.y:=hero.position.y+hero.speed;
					end; 
			 	end; 
			's': if (hero.position.y < 510) then 
				begin
					hero.position.y:=hero.position.y+hero.speed;
					if NotColisionSprite() then
					begin
						hero.position.y:=hero.position.y-hero.speed;
					end;
				end;
			'a': if (hero.position.x > 40) then 
				begin
					hero.position.x:=hero.position.x-hero.speed;
					if NotColisionSprite() then
					begin
					hero.position.x:=hero.position.x+hero.speed;
					end;
				end;
			'd': if (hero.position.x < 760) then 
					begin
						hero.position.x:=hero.position.x+hero.speed;
						if NotColisionSprite() then
						begin
							hero.position.x:=hero.position.x-hero.speed;
						end;
					end;
			'e': timeOfHit:=20;
			'q': timeOfHit:=20;
			'1': xEnemy:=xEnemy +1;
		end;
	end;
end;

//main procedure

begin
	StartGraphics();

	UpdateGraph(UpdateOff);
	ClearDevice();

	hero.position.x:=95; hero.position.y:=400;
	EnemySpeed:=0.3;
	hero.speed:=1;
	xEnemy:=500; yEnemy:=500;

	timeOfHitEnemy:=10;

	while true do
	begin

		drowBackground();

		
		drawSpriteEnemy(xEnemy,yEnemy); //
		drawSpriteHero(Hero);

		if not (hitEnemy()) then
		begin
			Hero.position.x := Hero.position.x+30;
			setColor(white);
			setFillstyle(1, white);
			OutTextXY(100, 100, 'hitdsfasgadfgsfdfghgfj');
			write(123);
		end;

		UpdateGraph(UpdateNow);
		Delay(10); 

		UpdateGraph(UpdateOff);
		hitEnemy();


		if (Keyboard()) then
		begin
			break;			
		end;
	end;

	readkey();
	closegraph();


end.