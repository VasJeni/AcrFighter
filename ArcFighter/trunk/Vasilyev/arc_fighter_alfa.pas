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
Запускается анимация удара врага, которая длится несколько кадров.//done
Враг не может наносить удар чаще какого-то времени. //done
Когда игрок "ударен", показывается сообщение.
Как вариант, после удара игрок отбрасывается на некоторое расстояние. //done

*Версия 7. Движение врага* //done
Враг двигается горизонтально в сторону игрока. Если дошёл до конца экрана - исчезает.

*Версия 8. Больше врагов* //in time
Враги появляются с некоторой периодичностью с разных сторон экрана в разных точках экрана.
Исчезнувшие враги появляются снова. //done

*Версия 9. Хитпоинты* //in time
У игрока и у врагов появляются хитпоинты. //only anamy
Хитпоинты игрока показываются на экране, хитпоинты врагов скрыты. один удар снимает один хитпоинт. //only enemy
Враг исчезает только когда хитпоинтов 0. Когда хитпоинты игрока 0 - игра заканчивается. //done

*Версия 10. Лучники*
Новый тип врагов: лучники. Они вместо удара запускают снаряд, который летит горизонтально.
Если игрок коснулся снаряда - это считается ударом.
Обычные враги теперь не просто идут по горизонтали, а идут в сторону игрока //done
}

{
нужно выспаться и переделать атаку лучников
}

program arcFighter;

uses
	osxbgi, sysutils;

const
	enemyInArray = 2;
	CountOfEnemy = enemyInArray - 1;


	enemyInArrayArcher = 4;
	CountOfEnemyArcher=enemyInArrayArcher-1;

	arrowInArray = 100;
	CountOfArrow = arrowInArray -1;


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

	//new image 
	TheroImage = record
		heroStay : pointer;
		heroAtackRight1  : pointer;
		heroAtackRight2 : pointer;
		heroAtackRight3 : pointer;
		heroAtackRight4 : pointer;
		heroAtackleft1 : pointer;
		heroAtackleft2 : pointer;
		heroAtackleft3 : pointer;
		heroAtackleft4 : pointer;
		heroMoveLefr : pointer;
		heroMoveRight : pointer; //add image here
	end;

	THero = record
		position : TPosition;
		sprite : THeroSprite;
		speed : Integer;
		atack : boolean;
		atackSide : string;
		takeDamege : boolean;
		moveSide : Integer;
		image : TheroImage; //добавили сюда подгрузку картинок
		drawNow : boolean;
		healthPoint:integer;
	end;

	TEnemyInage = record
		EnemyStay : pointer;
		EnemyAtackRight1  : pointer;
		EnemyAtackRight2 : pointer;
		EnemyAtackRight3 : pointer;
		EnemyAtackRight4 : pointer;
		EnemyAtackRight5 : pointer;
		EnemyAtackRight6 : pointer;
		EnemyAtackLeft1 : pointer;
		EnemyAtackLeft2 : pointer;
		EnemyAtackLeft3 : pointer;
		EnemyAtackLeft4 : pointer;
		EnemyAtackLeft5 : pointer;
		EnemyAtackLeft6 : pointer;
		EnemyMoveLeft : pointer;
		EnemyMoveRight : pointer;
	end;

	TMoveDiraction=record
		right : boolean;
	end;

	TEnemy = record
		position : TPosition;
		colision: boolean;
		hitOnHero: boolean;
		atackIsMine :boolean;
		enemyTakeDemage : boolean;
		image: TEnemyInage;
		moveDirection: TMoveDiraction;
		timeOfHit:Integer;
		needDraw:boolean;
		healthPoint:Integer;
		colosionWithEnemy : boolean;
		needMove : boolean;
	end;

	TAEnemyMelee = array[0..CountOfEnemy] of TEnemy; 


	TEnemyImageArcher = record
		EnemyStay : pointer;
		EnemyAtackRight1  : pointer;
		EnemyAtackRight2 : pointer;
		EnemyAtackRight3 : pointer;
		EnemyAtackRight4 : pointer;
		EnemyAtackRight5 : pointer;
		EnemyAtackLeft1 : pointer;
		EnemyAtackLeft2 : pointer;
		EnemyAtackLeft3 : pointer;
		EnemyAtackLeft4 : pointer;
		EnemyAtackLeft5 : pointer;
		EnemyMoveLeft : pointer;
		EnemyMoveRight : pointer;
	end;

	TEnemyAcher=record
		position : TPosition;
		colision : boolean;
		atackIsMine : boolean;
		enemyTakeDemage : boolean;
		image : TEnemyImageArcher;
		moveDirection : TMoveDiraction;
		timeOfHit : Integer;
		needDraw : boolean;
		healthPoint : Integer;
		needMove : boolean;
	end;

	TarrowImage = record
		moveRigthDirection : pointer;
		moveLeftDirection : pointer;
	end;


	Tarrow = record
		position : TPosition;
		image : TarrowImage;
		hit : boolean;
		needDraw :boolean;
		moveDirection: TMoveDiraction;
		startMove:boolean;
	end;

	TAArrow = array[0..CountOfArrow] of Tarrow;

	TAEnemyArcher = array[0..CountOfEnemyArcher] of TEnemyAcher; 

	TenemyFirstRoundBossImage = record
		fieldName : Integer;
	end;

	TenemyFirstRoundBoss=record
		position : TPosition;
		colision :boolean;
		atack: boolean;
		enemyBossTakeDamage : boolean;
		image : TenemyFirstRoundBossImage;
		moveDirection : TMoveDiraction;
		timeOfHit : Integer;
		needDraw : boolean;
		healthPoint : integer;
		needMove : boolean;
	end;

var
	timeOfHeroHit, i, ii, numberOfArrow, numberOfArcherEnemyPerRound, numberOfMeleeEnemyPerRound: Integer;
	Hero : Thero;
	EnemySpeed : real;
	AEnemyMelee :TAEnemyMelee;
	AEnemyArcher : TAEnemyArcher;
	backGround : pointer; 
	Aarrow : TAArrow;
	
procedure StartGraphics();
var
	gm,gd: smallInt;
	res: Boolean;
	i:Integer;

begin
	gd := Nopalette;	
	gm := m800x600;
	InitGraph(gd,gm, '');

	//добавляем бекграунд

	for i := 0 to CountOfArrow do
	begin
	 	res := LoadImage(Aarrow[i].image.moveRigthDirection, 'img/archerEnemy/arrowDirectionRight.bmp');
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(Aarrow[i].image.moveLeftDirection, 'img/archerEnemy/arrowDirectionleft.bmp');
		if res = false then
		begin
			halt;
		end;
	end;

	res := LoadImage(backGround,'img/bg/backGround.bmp');
	if res = false then
	begin
		halt;
	end;

//добавление новой подгрузки изображений
//подгрузка изображений героя

	res := LoadImage(Hero.image.heroMoveLefr,'img/Hero/HeroStayLeft.bmp');
	if res = false then
	begin
		halt;
	end;

	res := LoadImage(Hero.image.heroMoveRight,'img/Hero/HeroStayRight.bmp' );
	if res = false then
	begin
		halt;
	end;

	res := LoadImage(Hero.image.heroAtackleft1,'img/Hero/HeroAtackLeft1.bmp');
	if res = false then
	begin
		halt;
	end;

	res := LoadImage(Hero.image.heroAtackleft2,'img/Hero/HeroAtackLeft2.bmp');
	if res = false then
	begin
		halt;
	end;

	res := LoadImage(Hero.image.heroAtackleft3,'img/Hero/HeroAtackLeft3.bmp');
	if res = false then
	begin
		halt;
	end;

	res := LoadImage(Hero.image.heroAtackleft4,'img/Hero/HeroAtackLeft4.bmp' );
	if res = false then
	begin
		halt;
	end;

	res := LoadImage(Hero.image.heroAtackRight1,'img/Hero/HeroAtackRight1.bmp' );
	if res = false then
	begin
		halt;
	end;

	res := LoadImage(Hero.image.heroAtackRight2,'img/Hero/HeroAtackRight2.bmp' );
	if res = false then
	begin
		halt;
	end;

	res := LoadImage(Hero.image.heroAtackRight3,'img/Hero/HeroAtackRight3.bmp' );
	if res = false then
	begin
		halt;
	end;

	res := LoadImage(Hero.image.heroAtackRight4,'img/Hero/HeroAtackRight4.bmp' );
	if res = false then
	begin
		halt;
	end;

	//подгрузка изображения противника

	for i := 0 to CountOfEnemy do 
	begin
		res := LoadImage(AEnemyMelee[i].image.EnemyAtackRight1,'img/meleeEnemy/MeleeAtackRight1.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackRight2,'img/meleeEnemy/MeleeAtackRight2.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackRight3,'img/meleeEnemy/MeleeAtackRight3.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackRight4, 'img/meleeEnemy/MeleeAtackRight4.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackRight5,'img/meleeEnemy/MeleeAtackRight5.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackRight6,'img/meleeEnemy/MeleeAtackRight6.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackLeft1,'img/meleeEnemy/MeleeAtackLeft1.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackLeft2,'img/meleeEnemy/MeleeAtackLeft2.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackLeft3,'img/meleeEnemy/MeleeAtackLeft3.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackLeft4,'img/meleeEnemy/MeleeAtackLeft4.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackLeft5,'img/meleeEnemy/MeleeAtackLeft5.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyAtackLeft6,'img/meleeEnemy/MeleeAtackLeft6.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyMoveRight,'img/meleeEnemy/MeleeMoveRight.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyMelee[i].image.EnemyMoveLeft,'img/meleeEnemy/MeleeMoveLeft.bmp' );
		if res = false then
		begin
			halt;
		end;
	end;

	for i := 0 to CountOfEnemyArcher do
	begin			
		res := LoadImage(AEnemyArcher[i].image.EnemyMoveLeft,'img/archerEnemy/archerMoveLeft.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyMoveRight,'img/archerEnemy/archerMoveRight.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyAtackRight1,'img/archerEnemy/archerAtackRight1.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyAtackRight2,'img/archerEnemy/archerAtackRight2.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyAtackRight3,'img/archerEnemy/archerAtackRight3.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyAtackRight4,'img/archerEnemy/archerAtackRight4.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyAtackRight5,'img/archerEnemy/archerAtackRight5.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyAtackLeft1,'img/archerEnemy/archerAtackLeft1.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyAtackLeft2,'img/archerEnemy/archerAtackLeft2.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyAtackLeft3,'img/archerEnemy/archerAtackLeft3.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyAtackLeft4,'img/archerEnemy/archerAtackLeft4.bmp' );
		if res = false then
		begin
			halt;
		end;

		res := LoadImage(AEnemyArcher[i].image.EnemyAtackLeft5,'img/archerEnemy/archerAtackLeft5.bmp' );
		if res = false then
		begin
			halt;
		end;
	end;

	//графические обновления
	UpdateGraph(updateOff);
	//очистить экран
	cleardEvice();

	//UpdateGraph(updateNow);

end;

procedure drowBackground();
var
	x,y: Integer;
begin
	x:=0;
	y:=0;
	putImage(x,y,backGround);
end;

function heroAtackSide(): boolean; //проверяет герой ли попал по врагам
var
	i: Integer;
begin
	for i := 0 to CountOfEnemy do
	begin 	
		if (hero.atackSide = 'right') and ((Hero.position.x - AEnemyMelee[i].position.x) < 0) then
		begin
			heroAtackSide:=true;
		end
		else if (hero.atackSide = 'left') and  ((Hero.position.x - AEnemyMelee[i].position.x) > 0 ) then
		begin
			heroAtackSide:=true;
		end 
		else
		begin
			heroAtackSide:=false;
			Hero.atack:=False;
		end;
	end; 
end;

procedure drawSpriteHero(var hero:Thero);
begin
	//setColor(red);
	//setfillstyle(1, red);
	//bar(round(hero.position.x)-30, round(hero.position.y)-30,
	//	round(hero.position.x)+30, round(hero.position.y)+30);
	if (hero.moveSide = 1) and (timeOfHeroHit<1) then   //left
	begin
		PutImageTransparent(round(hero.position.x)-30, round(hero.position.y)-30, Hero.image.heroMoveLefr);
	end
	else if (hero.moveSide <> 1) and (timeOfHeroHit<1) then 
	begin
		PutImageTransparent(round(hero.position.x)-30, round(hero.position.y)-30, Hero.image.heroMoveRight);
	end;

	if timeOfHeroHit>0 then 
	begin
		if (Hero.atackSide = 'left') then 
		begin
			if timeOfHeroHit>30 then
			begin
			PutImageTransparent(round(hero.position.x)-30, round(hero.position.y)-30, Hero.image.heroAtackleft1);
			end
			else if timeOfHeroHit>20 then 
			begin
			PutImageTransparent(round(hero.position.x)-30, round(hero.position.y)-30, Hero.image.heroAtackleft2);
			end
			else if timeOfHeroHit>10 then
			begin
			PutImageTransparent(round(hero.position.x)-30, round(hero.position.y)-30, Hero.image.heroAtackleft3);
			end 
			else
			begin
			PutImageTransparent(round(hero.position.x)-30, round(hero.position.y)-30, Hero.image.heroAtackleft4);
			end;
		end
		else if (Hero.atackSide = 'right') then
		begin
			if timeOfHeroHit>30 then
			begin
			PutImageTransparent(round(hero.position.x)-30, round(hero.position.y)-30, Hero.image.heroAtackRight1);
			end
			else if timeOfHeroHit>20 then 
			begin
			PutImageTransparent(round(hero.position.x)-30, round(hero.position.y)-30, Hero.image.heroAtackRight2);
			end
			else if timeOfHeroHit>10 then
			begin
			PutImageTransparent(round(hero.position.x)-30, round(hero.position.y)-30, Hero.image.heroAtackRight3);
			end 
			else
			begin
			PutImageTransparent(round(hero.position.x)-30, round(hero.position.y)-30, Hero.image.heroAtackRight4);
			end;
		end;
	end;
end;

procedure drowHeroHP(x,y : integer);
begin
	
	setColor(sangria);
	setfillstyle(1,sangria);
	bar(x,y,x+100,y+20);
	setfillstyle(1,red);
	bar(x,y,x + hero.healthPoint*10,y+20);
	setColor(white);
	OutTextXY(x+5,y+15, 'HealthPoint');
end;



procedure NotColisionSprite();
var
	i: Integer;
begin
	for i := 0 to CountOfEnemy do 
	begin
		if	(((hero.position.x+20) >= (AEnemyMelee[i].position.x-20)) and 
			((hero.position.x-20) <= (AEnemyMelee[i].position.x+20)) and
			((hero.position.y+20) >= (AEnemyMelee[i].position.y-20)) and
			((hero.position.y-20) <= (AEnemyMelee[i].position.y+20))) then
		begin
			AEnemyMelee[i].colision:=true; //не соприкосаюстся можно двигаться
		end
		else
		begin
			AEnemyMelee[i].colision:=false; //соприкосаются двигаться нельзя
		end;
	end
end;

function colisionHeroWithEnemy(var arr:TAEnemyMelee):boolean;
var
	i: Integer;
begin
	colisionHeroWithEnemy:=false;
	for i := 0 to CountOfEnemy do
	begin
	 	if (arr[i].colision = true) then
	 	begin
	 	 	colisionHeroWithEnemy:=true;
	 	end; 
	end; 
end;

function colisionHeroWithEnemyArcher(): boolean;
var
	i: Integer;
begin
	colisionHeroWithEnemyArcher:=false; //можно двигаться

	for i := 0 to CountOfEnemyArcher do
	begin
		if (((hero.position.x+20) >= (AEnemyArcher[i].position.x-15)) and 
		((hero.position.x-20) <= (AEnemyArcher[i].position.x+15)) and
		((hero.position.y+20) >= (AEnemyArcher[i].position.y-15)) and
		((hero.position.y-20) <= (AEnemyArcher[i].position.y+15))) then
		begin
		 	colisionHeroWithEnemyArcher:=true;
		end 
	end
end;

function hitEnemy(): boolean;
var
	i: Integer;
begin
	hitEnemy:=false;

	for i := 0 to CountOfEnemy do 
	begin
		if (((Abs(hero.position.x-AEnemyMelee[i].position.x)<40) and 
			(Abs(hero.position.y-AEnemyMelee[i].position.y)<65))) then		
		begin
			if (AEnemyMelee[i].timeOfHit>0) then
			begin
				dec(AEnemyMelee[i].timeOfHit);
				AEnemyMelee[i].atackIsMine:=false;
				if (AEnemyMelee[i].timeOfHit=0) then
				begin
					hitEnemy:=true;
					AEnemyMelee[i].timeOfHit:=60;
					AEnemyMelee[i].atackIsMine:=true;
				end;
			end;
		end;
	end;
end;

procedure moveMeleeEnemy(var arr:TAEnemyMelee);
var
	i: Integer;
begin
	for i := 0 to CountOfEnemy do
	begin
		if arr[i].needMove=true then
		begin
			if (arr[i].colision = false) then
			begin
			 	if ((arr[i].position.x-hero.position.x)>0)  then
			 	begin
			 		arr[i].position.x :=arr[i].position.x - EnemySpeed;
			 		arr[i].moveDirection.right:=false;
			 		arr[i].timeOfHit:=60;
			 	end
			 	else
			 	begin
			 		arr[i].position.x :=arr[i].position.x + EnemySpeed;
			 		arr[i].moveDirection.right:=true;
			 		arr[i].timeOfHit:=60;
			 	end;

			 	if ((arr[i].position.y - Hero.position.y)>0)  then 
			 	begin
			 		arr[i].position.y:=arr[i].position.y - EnemySpeed;
			 		arr[i].timeOfHit:=60;
			 	end
			 	else
			 	begin
			 		arr[i].position.y:=arr[i].position.y + EnemySpeed;
			 		arr[i].timeOfHit:=60;
			 	end;
			end;
		end; 
	end; 
end;

procedure drawSpriteEnemy(var numberOfEnemy:TEnemy);
begin
	moveMeleeEnemy(AEnemyMelee);

	if numberOfEnemy.timeOfHit>0 then 
		begin
			if (numberOfEnemy.timeOfHit=60) and 
				(numberOfEnemy.moveDirection.right) then 
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyMoveRight);
			end
			else if (numberOfEnemy.timeOfHit=60) and 
				(not numberOfEnemy.moveDirection.right) then 
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30, 
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyMoveLeft);
			end
			else if ((numberOfEnemy.timeOfHit<60) and 
				(numberOfEnemy.timeOfHit>50)) then 
			begin
				if (numberOfEnemy.moveDirection.right) then 
				begin
					PutImageTransparent(
					round(numberOfEnemy.position.x)-30,
					round(numberOfEnemy.position.y)-40,
					numberOfEnemy.image.EnemyAtackRight1);
				end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackLeft1);
			end
		end
		else if numberOfEnemy.timeOfHit>40 then
		begin
			if (numberOfEnemy.moveDirection.right) then 
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackRight2);
			end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackLeft2);
			end
		end
		else if numberOfEnemy.timeOfHit>30 then
		begin
			if (numberOfEnemy.moveDirection.right) then 
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackRight3);
			end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackLeft3);
			end
		end
		else if numberOfEnemy.timeOfHit>20 then
		begin
			if (numberOfEnemy.moveDirection.right) then 
				begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackRight4);
			end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackLeft4);
			end
		end
		else if numberOfEnemy.timeOfHit>10 then
		begin
			if (numberOfEnemy.moveDirection.right) then 
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackRight5);
			end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackLeft5);
			end
		end
		else if numberOfEnemy.timeOfHit>0 then
		begin
			if (numberOfEnemy.moveDirection.right) then 
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackRight6);
			end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemy.position.x)-30,
				round(numberOfEnemy.position.y)-40,
				numberOfEnemy.image.EnemyAtackLeft6);
			end
		end	
	end;
end;

procedure drawSpriteEnemyArchet(var numberOfEnemyArcher:TEnemyAcher);
begin
	numberOfEnemyArcher.atackIsMine:=false;

	//setColor(red);
	//setfillstyle(1,red);
	//bar(round(numberOfEnemyArcher.position.x-30),
	//	round(numberOfEnemyArcher.position.y-30),
	//	round(numberOfEnemyArcher.position.x+30),
	// round(numberOfEnemyArcher.position.y+30));
	if numberOfEnemyArcher.needDraw=true then
	begin
		if (numberOfEnemyArcher.timeOfHit=100) and 
		numberOfEnemyArcher.moveDirection.right then
		begin
			PutImageTransparent(round(numberOfEnemyArcher.position.x-40),
								round(numberOfEnemyArcher.position.y-40),
								numberOfEnemyArcher.image.EnemyMoveRight);
		end
		else if (numberOfEnemyArcher.timeOfHit=100) and 
		(not numberOfEnemyArcher.moveDirection.right) then 
		begin
			PutImageTransparent(round(numberOfEnemyArcher.position.x-40),
								round(numberOfEnemyArcher.position.y-40),
								numberOfEnemyArcher.image.EnemyMoveLeft);
		end
		else if ((numberOfEnemyArcher.timeOfHit<100) and 
				(numberOfEnemyArcher.timeOfHit>80)) then 
		begin
			if (numberOfEnemyArcher.moveDirection.right) then 
			begin
				PutImageTransparent(
				round(numberOfEnemyArcher.position.x)-40,
				round(numberOfEnemyArcher.position.y)-40,
				numberOfEnemyArcher.image.EnemyAtackRight1);
			end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemyArcher.position.x)-40,
				round(numberOfEnemyArcher.position.y)-40,
				numberOfEnemyArcher.image.EnemyAtackLeft1);
			end
		end
		else if numberOfEnemyArcher.timeOfHit>60 then
		begin
			if (numberOfEnemyArcher.moveDirection.right) then 
			begin
				PutImageTransparent(
				round(numberOfEnemyArcher.position.x)-40,
				round(numberOfEnemyArcher.position.y)-40,
				numberOfEnemyArcher.image.EnemyAtackRight2);
			end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemyArcher.position.x)-40,
				round(numberOfEnemyArcher.position.y)-40,
				numberOfEnemyArcher.image.EnemyAtackLeft2);
			end
		end
		else if numberOfEnemyArcher.timeOfHit>40 then
		begin
			if (numberOfEnemyArcher.moveDirection.right) then 
			begin
				PutImageTransparent(
				round(numberOfEnemyArcher.position.x)-40,
				round(numberOfEnemyArcher.position.y)-40,
				numberOfEnemyArcher.image.EnemyAtackRight3);
			end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemyArcher.position.x)-40,
				round(numberOfEnemyArcher.position.y)-40,
				numberOfEnemyArcher.image.EnemyAtackLeft3);
			end
		end
		else if numberOfEnemyArcher.timeOfHit>20 then
		begin
			if (numberOfEnemyArcher.moveDirection.right) then 
				begin
				PutImageTransparent(
				round(numberOfEnemyArcher.position.x)-40,
				round(numberOfEnemyArcher.position.y)-40,
				numberOfEnemyArcher.image.EnemyAtackRight4);
			end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemyArcher.position.x)-40,
				round(numberOfEnemyArcher.position.y)-40,
				numberOfEnemyArcher.image.EnemyAtackLeft4);
			end
		end
		else if numberOfEnemyArcher.timeOfHit>0 then
		begin
			if (numberOfEnemyArcher.moveDirection.right) then 
			begin
				PutImageTransparent(
				round(numberOfEnemyArcher.position.x)-40,
				round(numberOfEnemyArcher.position.y)-40,
				numberOfEnemyArcher.image.EnemyAtackRight5);
				if numberOfEnemyArcher.timeOfHit=1 then 
				begin
					Aarrow[numberOfArrow].needDraw:=true;
					Aarrow[numberOfArrow].position.x:=round(numberOfEnemyArcher.position.x);
					Aarrow[numberOfArrow].position.y:=round(numberOfEnemyArcher.position.y)-20;
					Aarrow[numberOfArrow].moveDirection.right:=numberOfEnemyArcher.moveDirection.right;
					inc(numberOfArrow);
				end
			end
			else
			begin
				PutImageTransparent(
				round(numberOfEnemyArcher.position.x)-40,
				round(numberOfEnemyArcher.position.y)-40,
				numberOfEnemyArcher.image.EnemyAtackLeft5);
				if numberOfEnemyArcher.timeOfHit=1 then 
				begin
					Aarrow[numberOfArrow].needDraw:=true;
					Aarrow[numberOfArrow].position.x:=round(numberOfEnemyArcher.position.x);
					Aarrow[numberOfArrow].position.y:=round(numberOfEnemyArcher.position.y)-20;
					Aarrow[numberOfArrow].moveDirection.right:=numberOfEnemyArcher.moveDirection.right;
					inc(numberOfArrow);
				end;
			end;
		end;
	end;
end;

procedure moveEnemyArcher();
var
	i: Integer;
begin
	for i := 0 to CountOfEnemyArcher do
	begin
		if AEnemyArcher[i].needMove=true then
		begin
			if (AEnemyArcher[i].position.x <100) then
			begin
				AEnemyArcher[i].position.x:= AEnemyArcher[i].position.x +1;	
			end
			else if (AEnemyArcher[i].position.x > 700) then
			begin
			 	AEnemyArcher[i].position.x:= AEnemyArcher[i].position.x - 1;
			end 
			else
			begin
				
				if (abs(AEnemyArcher[i].position.y-hero.position.y)<5) or (AEnemyArcher[i].timeOfHit <>100) then 
				begin
					dec(AEnemyArcher[i].timeOfHit);

					if (AEnemyArcher[i].timeOfHit=0) then
					begin
			 			AEnemyArcher[i].timeOfHit:=100;
					end;
				end
			 	else if (AEnemyArcher[i].position.y>hero.position.y) then
			 	begin
			 	 	AEnemyArcher[i].position.y:=AEnemyArcher[i].position.y - EnemySpeed;
			 	 	AEnemyArcher[i].timeOfHit:=100;
			 	end 
			 	else if (AEnemyArcher[i].position.y<hero.position.y) then
			 	begin
			 	 	AEnemyArcher[i].position.y:=AEnemyArcher[i].position.y + EnemySpeed;
			 	 	AEnemyArcher[i].timeOfHit:=100;
			 	end;
			end;
		end;
	end;

	for i := 0 to CountOfEnemyArcher do 
	begin
		if ((AEnemyArcher[i].position.x-hero.position.x)>0) then
		begin
			AEnemyArcher[i].moveDirection.right:=false;
		end
		else
		begin
			AEnemyArcher[i].moveDirection.right:=true;
		end;
	end;
end;

procedure drawArrow();
var
	i,ii: Integer;
	sideArrowLeft : boolean; //false = rightDirection //true = rightDirection

begin
	for i := 0 to CountOfArrow do
	begin
		if (Aarrow[i].needDraw) then
		begin
			if (Aarrow[i].moveDirection.right) then
			begin
				Aarrow[i].position.x:=Aarrow[i].position.x+1;
				PutImageTransparent( round(Aarrow[i].position.x), round(Aarrow[i].position.y), Aarrow[i].image.moveRigthDirection);
			end
			else
			begin
				Aarrow[i].position.x:=Aarrow[i].position.x-1;
				PutImageTransparent( round(Aarrow[i].position.x), round(Aarrow[i].position.y), Aarrow[i].image.moveLeftDirection);
			end;

		end;
	end;
end;

procedure hitArrow();
var
	i: Integer;
begin
	for i := 0 to CountOfArrow do
	begin
	 	if (((hero.position.x+30) >= (Aarrow[i].position.x)) and 
			((hero.position.x-30) <= (Aarrow[i].position.x+30)) and
			((hero.position.y+30) >= (Aarrow[i].position.y+21)) and
			((hero.position.y-30) <= (Aarrow[i].position.y+27)))	then
		begin
			dec(hero.healthPoint);
			Aarrow[i].needDraw:=false;
			Aarrow[i].position.x:=0;
		end;
	end; 
end;

procedure drawFirstRoundBoss();
var
	i: Integer;
begin	
	setColor(red);
	setfillstyle(1,red);
	bar(60,60,100,100);
end;

procedure drawAllSprite();
var
	i: Integer;
begin
	for i := 0 to CountOfEnemy do 
	//if (hero.position.y>AEnemyMelee[i].position.y) then
	begin
		drawSpriteEnemy(AEnemyMelee[i]);
		//drawSpriteHero(Hero);
	//end
	//else
	//begin
		//drawSpriteHero(Hero);
	 	//drawSpriteEnemy(AEnemyMelee[i]);
	end; 

	moveEnemyArcher();

	for i := 0 to CountOfEnemyArcher do
	begin 	
		drawSpriteEnemyArchet(AEnemyArcher[i]);
	end;

	drawSpriteHero(Hero);
	drawArrow();

	{if (numberOfArcherEnemyPerRound < 0) and (numberOfMeleeEnemyPerRound < -1)then 
	begin
		drawFirstRoundBoss();
	end;}

	//тест
	drowHeroHP(50,50);
end;

procedure enemyTakeDemage(var enemy:TAEnemyMelee);
var
	i: Integer;
begin

	if (timeOfHeroHit>0) then
	begin

		dec(timeOfHeroHit);
		
		for i := 0 to CountOfEnemy do 
		begin
			if	(((hero.position.x - enemy[i].position.x)>-55) and 
				((hero.position.x - enemy[i].position.x)<-35) and 
				(Abs(hero.position.y - enemy[i].position.y)<60) and 
				(hero.atackSide='right')) or
				 (((hero.position.x - enemy[i].position.x)>35) and 
				 ((hero.position.x - enemy[i].position.x)<55) and 
				(Abs(hero.position.y - enemy[i].position.y)<60) and 
				(hero.atackSide='left'))
				 then
			begin
				enemy[i].enemyTakeDemage:=true;
			end	
			else
			begin
				enemy[i].enemyTakeDemage:=false;
			end;
		end;
	end;
end;

procedure spawnNewEnemy();
var
	i , tmpEnemySide: Integer;
begin
	for i := 0 to CountOfEnemy do
	begin
		if (AEnemyMelee[i].enemyTakeDemage) then
		begin
			dec(AEnemyMelee[i].healthPoint);
			if AEnemyMelee[i].healthPoint=0 then  
			begin
				dec(numberOfMeleeEnemyPerRound);
				writeln(numberOfMeleeEnemyPerRound);
				tmpEnemySide:=random(2);
				if (tmpEnemySide=0) then
				begin
				 	AEnemyMelee[i].position.x := -20;
					AEnemyMelee[i].position.y := random(400)+200;
					AEnemyMelee[i].healthPoint :=3;	
				end
				else
				begin
				 	AEnemyMelee[i].position.x := 820;
				 	AEnemyMelee[i].position.y := random(400)+200;
				 	AEnemyMelee[i].healthPoint :=3;
				end;
				if numberOfMeleeEnemyPerRound < 0 then
				begin
					AEnemyMelee[i].needDraw:=false;
					AEnemyMelee[i].needMove:=false;
					writeln('false'); 	
				end;
			end
			else
			begin
				if hero.position.x>AEnemyMelee[i].position.x then
				begin
				 	AEnemyMelee[i].position.x:=AEnemyMelee[i].position.x-50;
				end
				else
				begin
					AEnemyMelee[i].position.x:=AEnemyMelee[i].position.x+50;
				end
			end;
		end;
	end;
end;

procedure enemyArcherTakeDamage();
var
	i: Integer;
begin
	if timeOfHeroHit>0 then
	begin
		for i := 0 to CountOfEnemyArcher do
		begin
		if(((hero.position.x - AEnemyArcher[i].position.x)<0) and 
		((hero.position.x - AEnemyArcher[i].position.x)>-80) and 
		(Abs(hero.position.y - AEnemyArcher[i].position.y)<60) and 
		(hero.atackSide='right')) or
		(((hero.position.x - AEnemyArcher[i].position.x)>0) and 
		((hero.position.x - AEnemyArcher[i].position.x)<80) and 
		(Abs(hero.position.y - AEnemyArcher[i].position.y)<60) and 
		(hero.atackSide='left'))then
			begin
				AEnemyArcher[i].enemyTakeDemage:=true;
				dec(numberOfArcherEnemyPerRound);
				if (numberOfArcherEnemyPerRound<0) then 
				begin
					AEnemyArcher[i].needDraw:=false;
					AEnemyArcher[i].needMove:=false;
				end
			end	
			else
			begin
				AEnemyArcher[i].enemyTakeDemage:=false;
			end;
		end 
	end
end;

procedure spawnNewEnemyArcher();
var
	i , tmpEnemySide: Integer;
begin
	for i := 0 to CountOfEnemyArcher do
	begin
		if (AEnemyArcher[i].enemyTakeDemage) then
		begin
			tmpEnemySide:=random(2);
			if (tmpEnemySide=0) then
			begin
			 	AEnemyArcher[i].position.x := -20;
				AEnemyArcher[i].position.y := random(400)+200;
				AEnemyArcher[i].enemyTakeDemage:=false;
			end
			else
			begin
			 	AEnemyArcher[i].position.x := 820;
			 	AEnemyArcher[i].position.y := random(400)+200;
			 	AEnemyArcher[i].enemyTakeDemage:=false;
			end
		end
	end
end;





//procedure procedureName(args)


function Keyboard():boolean;
var button: char;

begin
	keyboard:=false;

	if (IsKeypressed(VK_w)) then
	begin
		if timeOfHeroHit=0 then
		begin  
			if (hero.position.y > 200) then
			begin
				if not ( colisionHeroWithEnemy(AEnemyMelee)) and (not colisionHeroWithEnemyArcher) then 
				begin //скорее всего надо удалить
			 		hero.position.y:=hero.position.y-hero.speed; 
				end;
			end; 
		end;
	end;

	if (IsKeypressed(VK_s)) then
	begin
		if timeOfHeroHit=0 then
			begin 
			if (hero.position.y < 510)  then 
			begin
				if not ( colisionHeroWithEnemy(AEnemyMelee)) and (not colisionHeroWithEnemyArcher) then //скорее всего надо удалить
				begin 
					hero.position.y:=hero.position.y+hero.speed -2; 
				end;
			end;
		end;
	end;

	if (IsKeypressed(VK_a)) then
	begin
		if timeOfHeroHit=0 then
		begin 
			if (hero.position.x > 40) then 
			begin
				if  not( colisionHeroWithEnemy(AEnemyMelee)) and (not colisionHeroWithEnemyArcher) then //скорее всего надо удалить
				begin 
					hero.position.x:=hero.position.x-hero.speed +2;
					hero.moveSide := 1; //left
				end; 
			end;
		end;
	end;

	if (IsKeypressed(VK_d)) then
	begin
		if timeOfHeroHit=0 then
		begin 
			if (hero.position.x < 760) then 
			begin
				if  not ( colisionHeroWithEnemy(AEnemyMelee)) and (not colisionHeroWithEnemyArcher) then //скорее всего надо удалить
				begin 
					hero.position.x:=hero.position.x+hero.speed-2; 
					hero.moveSide := 2;
				end; 
			end;
		end;
	end;

	if (IsKeypressed(VK_e)) then
	begin
		if timeOfHeroHit=0 then
		begin 	
		timeOfHeroHit:=40;
		Hero.atackSide:='right';
		end 
	end;

	if (IsKeypressed(VK_q)) then
	begin
		if timeOfHeroHit=0 then
		begin 
		timeOfHeroHit:=40;
		Hero.atackSide:='left';
		end;
	end;

	if keypressed() then
	begin
		button:=readkey();
		case button of
			chr(27): keyboard:=true;
		end;
	end;
end;

procedure changePositionHeroAfterTakeDamage();
var
	i: Integer;

begin
if (hitEnemy()) then
	begin
		for i := 0 to CountOfEnemy do
		begin
			if (AEnemyMelee[i].atackIsMine = true) then 
			begin
				if hero.position.x > AEnemyMelee[i].position.x then
				begin
					Hero.position.x := Hero.position.x+50;
					dec(hero.healthPoint);

					while true do
					begin
						NotColisionSprite();

						if (colisionHeroWithEnemy(AEnemyMelee)) then 
						begin
							Hero.position.x := Hero.position.x+50;
							continue;
						end;

						if (colisionHeroWithEnemy(AEnemyMelee)) then 
						begin
							continue;
						end
						else
						begin
							break;
						end
					end;
				end
				else
				begin
					Hero.position.x := Hero.position.x-50;
					dec(hero.healthPoint);

					while true do
					begin
						NotColisionSprite();
						if (colisionHeroWithEnemy(AEnemyMelee)) then 
						begin
							Hero.position.x := Hero.position.x-50;
							continue;
						end;

						if (colisionHeroWithEnemy(AEnemyMelee)) then 
						begin
							continue;
						end
						else
						begin
							break;
						end;
					end;
				end
			end;
		end;
	end;
end;


//main procedure
begin

	numberOfArrow:=0;
	randomize;

	StartGraphics();

	UpdateGraph(UpdateOff);
	ClearDevice();


	hero.position.x:=200; 
	hero.position.y:=400;
	EnemySpeed:=0.1;
	hero.speed:=3;
	hero.moveSide := 1;
	hero.healthPoint:= 10;


	AEnemyMelee[0].position.x:=500; 
	AEnemyMelee[0].position.y:=500;
	AEnemyMelee[0].colision:=false;
	AEnemyMelee[0].hitOnHero:=false;
	AEnemyMelee[0].timeOfHit:=60;
	AEnemyMelee[0].healthPoint:=3;
	AEnemyMelee[0].needDraw:=true;
	AEnemyMelee[0].needMove:=true;

	AEnemyArcher[0].position.x:=500;
	AEnemyArcher[0].position.y:=500;
	AEnemyArcher[0].timeOfHit:=50;
	AEnemyArcher[0].healthPoint:=1;
	AEnemyArcher[0].needDraw:=true;
	AEnemyArcher[0].needMove:=true;

	AEnemyArcher[1]:=AEnemyArcher[0];
	AEnemyArcher[1].position.x:=700;
	AEnemyArcher[1].position.y:=200;

	AEnemyArcher[2]:=AEnemyArcher[0];
	AEnemyArcher[2].position.x:=700;
	AEnemyArcher[2].position.y:=400;

	AEnemyArcher[3]:=AEnemyArcher[0];
	AEnemyArcher[3].position.x:=40;
	AEnemyArcher[3].position.y:=400;



	AEnemyMelee[1]:=AEnemyMelee[0];
	AEnemyMelee[1].position.x:=0;

	numberOfArcherEnemyPerRound:=10;
	numberOfMeleeEnemyPerRound:=10;


	while true do
	begin

		NotColisionSprite();

		drowBackground();

		drawAllSprite();

		enemyTakeDemage(AEnemyMelee);
		spawnNewEnemy();
		enemyArcherTakeDamage();
		spawnNewEnemyArcher();

		hitArrow();
		changePositionHeroAfterTakeDamage();

		UpdateGraph(UpdateNow);
		Delay(10); 

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

		if hero.healthPoint <= 0 then //второе словие для выхода из цыкла помимо 'ESC'
		begin
			ClearDevice();
			OutTextXY(300,300, 'you lose');
			UpdateGraph(UpdateNow);
			break;
		end
	end;

	readkey();
	closegraph();
end.