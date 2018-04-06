{*План работы.*

Это приблизительный план, скорее направление. Пункты плана необязательно будут одинаковые по усилиям/времени.
Он не обязателен к исполнению: захотите что-то сделать раньше, а что-то опустить - пожалуйста.

*Версия 1. Поле* //done
На экране базовое игровое поле, базовый фон. При нажатии определённой клавиши - программа закрывается.

*Версия 2. Игрок* //done
Посредине добавляется фигура игрока (пусть для начала это будет прямоугольник). При нажатии определённых клавиш он меняет своё положение.

*Версия 3. Враг* //done
Где-то на поле добавляется фигура врага (прямоугольник). Игрок может ходить вокруг врага (это должно быть видно), но не может зайти на его место.

*Версия 4. Удар* //done
По нажатию кнопки игрок наносит удар: меняется его изображение. Если в хитбоксе удара игрока был враг - враг исчезает.

*Версия 5. Анимация удара*
Удар длиться не один кадр, а несколько. На время удара изображение игрока меняется.
Как вариант, на время удара игрок не двигается (не реагирует на нажатия клавиш).

*Версия 6. Удар врага*
Если игрок находится в хитбоксе врага, враг наносит удар. Запускается анимация удара врага, которая длится несколько кадров.
враг не может наносить удар чаще какого-то времени. Когда игрок "ударен", показывается сообщение.
Как вариант, после удара игрок отбрасывается на некоторое расстояние.

*Версия 7. Движение врага*
Враг двигается горизонтально в сторону игрока. Если дошёл до конца экрана - исчезает.

*Версия 8. Больше врагов*
Враги появляются с некоторой периодичностью с разных сторон экрана в разных точках экрана.
Исчезнувшие враги появляются снова.

*Версия 9. Хитпоинты*
У игрока и у врагов появляются хитпоинты.
Хитпоинты игрока показываются на экране, хитпоинты врагов скрыты. один удар снимает один хитпоинт.
Враг исчезает только когда хитпоинтов 0. Когда хитпоинты игрока 0 - игра заканчивается.

*Версия 10. Лучники*
Новый тип врагов: лучники. Они вместо удара запускают снаряд, который летит горизонтально.
Если игрок коснулся снаряда - это считается ударом.
Обычные враги теперь не просто идут по горизонтали, а идут в сторону игрока
}
{
updates
collision верх и низ немного сгладил


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
	timeOfHit, timeOfHitEnemy: Integer;
	hitHero: boolean; 
	Hero : Thero;
	EnemySpeed,xEnemy, yEnemy: real;
	
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
		if (timeOfHitEnemy>0) then
		begin
			dec(timeOfHitEnemy);
			writeln(timeOfHitEnemy);
			if (timeOfHitEnemy=0) then
			begin
				hitEnemy:=true;
				timeOfHitEnemy:=300;
			end
			else
			begin
				hitEnemy:=false;
			end;
		end;
	end;
end;

function NotColisionSprite(): boolean;
begin
	if (((hero.position.x+39) >= (xEnemy-40)) and 
		((hero.position.x-39) <= (xEnemy+40)) and
		((hero.position.y+44) >= (yEnemy-45)) and
		((hero.position.y-44) <= (yEnemy+45))) then
	begin
		NotColisionSprite:=true;
	end
	else
	begin
		NotColisionSprite:=false;
	end;
end;

procedure drawSpriteEnemy(var xEnemy, yEnemy:real);
begin
	setColor(yellow);
	setFillstyle(1,yellow);
	bar(round(xEnemy-40),round(yEnemy-90),round(xEnemy+40),round(yEnemy+90));
	if ((Abs(hero.position.x-xEnemy)<85) and (Abs(hero.position.y-yEnemy)<90) and (hitHero)) then
	begin
	 	xEnemy:=xEnemy+1000;
	end;
	if not NotColisionSprite() then
	begin
		if (xEnemy-hero.position.x)>0 then
		begin
			//writeln('left');
			xEnemy:=xEnemy - EnemySpeed;	
		end
		else
		begin
			//writeln('right');
			xEnemy:=xEnemy + EnemySpeed; 
		end;

		if (yEnemy - Hero.position.y)>0 then
		begin
			//writeln('up');
			yEnemy:=yEnemy - EnemySpeed;
		end
		else
		begin
			//writeln('down');
			yEnemy:=yEnemy + EnemySpeed;
		end

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
		end;
	end;
end;

//main procedure
begin
	StartGraphics();

	UpdateGraph(UpdateOff);
	ClearDevice();

	hero.position.x:=200; hero.position.y:=400;
	EnemySpeed:=0.3;
	hero.speed:=3;
	xEnemy:=500; yEnemy:=500;

	timeOfHitEnemy:=300;

	while true do
	begin

		drowBackground();

		drawSpriteEnemy(xEnemy,yEnemy); //
		drawSpriteHero(Hero);

		if   not (hitEnemy()) then
		begin
			if NotColisionSprite() then
			begin
				Hero.position.x := Hero.position.x+90;
			end
			else
			begin
				Hero.position.x := Hero.position.x-90;
			end;

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

		if Hero.position.x>800 then
		begin
			hero.position.x:=100;
		end;

		if Hero.position.x<0 then
		begin
			hero.position.x:=300;
		end;
	end;


	readkey();
	closegraph();


end.