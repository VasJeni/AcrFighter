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

*Версия 5. Анимация удара* //in time
Удар длиться не один кадр, а несколько. На время удара изображение игрока меняется. //done
Как вариант, на время удара игрок не двигается (не реагирует на нажатия клавиш).

*Версия 6. Удар врага* //in time
Если игрок находится в хитбоксе врага, враг наносит удар. //done
Запускается анимация удара врага, которая длится несколько кадров.
Враг не может наносить удар чаще какого-то времени. //done
Когда игрок "ударен", показывается сообщение.
Как вариант, после удара игрок отбрасывается на некоторое расстояние. //done

*Версия 7. Движение врага* //done
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
Обычные враги теперь не просто идут по горизонтали, а идут в сторону игрока //done
}
{
updates
collision верх и низ немного сгладил
counter on enemyhit
little update melee enemy struckture


}

program arcFighter;

uses
	wingraph,wincrt, sysutils;

type
	TPosition = record
		x : real;
		y : real;
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
		atack : boolean;
		atackSide: string;
	end;

	TEnemy = record
		position : TPosition;
	end;

	TAEnemyMelee = array[0..5] of TEnemy; 

var
	timeOfHit, timeOfHitEnemy: Integer;
	HeroAtack: boolean; 
	Hero : Thero;
	EnemySpeed: real;
	MeleeEnemy:TEnemy;
	AEnemyMelee:TAEnemyMelee;
	
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

function HitHero(): boolean;
begin
	if (hero.atackSide = 'right') and ((Hero.position.x - AEnemyMelee[0].position.x) < 0) then
	begin
	 	HitHero:=true;
	 	writeln('Function HitHEro in active');
	end
	else if (hero.atackSide = 'left') and ((Hero.position.x - AEnemyMelee[0].position.x) > 0 ) then
	begin 	
		writeln('Function HitHEro in active  ');
		HitHero:=true;
	end 
	else
	begin
		writeln('Function HitHEro are not active  ');
		HitHero:=false;
		Hero.atack:=False;
	end
end;

procedure drawSpriteHero(var hero:Thero);
begin
	if timeOfHit>0 then 
	begin	
		if (Hero.atackSide = 'left') then 
		begin
		setColor(red);
		setFillstyle(1,red);
		end
		else
		begin
			setColor(lime);
			setFillstyle(1,lime);
		end;
	end
	else
	begin
		setColor(black);
		setFillstyle(1,black);
	end;
	bar( round(hero.position.x) - 40 , round(hero.position.y) - 90 , round(hero.position.x) + 40 , round(hero.position.y) + 90);
	dec(timeOfHit);
end;

function hitEnemy(): boolean;
begin
	hitEnemy:=false;
	if (((Abs(hero.position.x-AEnemyMelee[0].position.x)<85) and (Abs(hero.position.y-AEnemyMelee[0].position.y)<90))) then		
	begin
		if (timeOfHitEnemy>0) then
		begin
			dec(timeOfHitEnemy);
			if (timeOfHitEnemy=0) then
			begin
				hitEnemy:=true;
				timeOfHitEnemy:=150;
			end;
		end;
	end;
end;

function NotColisionSprite(): boolean;
begin
	if (((hero.position.x+39) >= (AEnemyMelee[0].position.x-40)) and 
		((hero.position.x-39) <= (AEnemyMelee[0].position.x+40)) and
		((hero.position.y+44) >= (MeleeEnemy.position.y-45)) and
		((hero.position.y-44) <= (MeleeEnemy.position.y+45))) then
	begin
		NotColisionSprite:=true;
	end
	else
	begin
		NotColisionSprite:=false;
	end;
end;

procedure drawSpriteEnemy(var arr:TAEnemyMelee);
begin
	setColor(yellow);
	setFillstyle(1,yellow);
	bar(round(arr[0].position.x-40),round(arr[0].position.y-90),
		round(arr[0].position.x+40),round(arr[0].position.y+90));
	if not NotColisionSprite() then
	begin
		if (arr[0].position.x-hero.position.x)>0 then
		begin
			arr[0].position.x:=arr[0].position.x - EnemySpeed;	
		end
		else
		begin
			arr[0].position.x:=arr[0].position.x + EnemySpeed; 
		end;

		if (arr[0].position.y - Hero.position.y)>0 then
		begin
			arr[0].position.y:=arr[0].position.y - EnemySpeed;
		end
		else
		begin
			arr[0].position.y:=arr[0].position.y + EnemySpeed;
		end

	end;
	if arr[0].position.x>900 then
	begin
		arr[0].position.x:=-200;
	end
end;

function areEnemyTakeDamege(): boolean;
begin
	if ((Abs(hero.position.x - AEnemyMelee[0].position.x)<85) and 
		(Abs(hero.position.y - AEnemyMelee[0].position.y)<90) and (HitHero())) then
	begin
		areEnemyTakeDamege:=true;
	end
	else
	begin	
		areEnemyTakeDamege:=false;
	end;	
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
			'e': begin
				timeOfHit:=40;
				Hero.atackSide:='right';
				//writeln(Hero.atackSide);
				end;

			'q': begin
				timeOfHit:=40;
				Hero.atackSide:='left';
				//writeln(Hero.atackSide);
				end;
		end;
	end;
end;

//main procedure
begin
	StartGraphics();

	UpdateGraph(UpdateOff);
	ClearDevice();

	hero.position.x:=200; 
	hero.position.y:=400;
	EnemySpeed:=0.3;
	hero.speed:=3;
	AEnemyMelee[0].position.x:=500; 
	AEnemyMelee[0].position.y:=500;

	timeOfHitEnemy:=150;

	while true do
	begin

		drowBackground();

		drawSpriteEnemy(AEnemyMelee);

		if areEnemyTakeDamege() then
		begin
			AEnemyMelee[0].position.x:=AEnemyMelee[0].position.x+1000;
		end; 

		drawSpriteHero(Hero);

		if (hitEnemy()) then
			begin
				Hero.position.x := Hero.position.x-90;
			end;

		UpdateGraph(UpdateNow);
		Delay(10); 

		UpdateGraph(UpdateOff);


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