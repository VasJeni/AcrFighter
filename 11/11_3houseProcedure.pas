{*Задача 11.3 (11h3)*
Написать (дописать) процедуру DrawHouse() с тремя параметрами,
которая рисует домик по заданным координатам. заданного цвета
`procedure DrawHouse(x: integer; y: integer; color: longword);`
Затем с её помощью нарисовать несколько домиков в разных местах экрана.}


program house;
		
	uses
		wingraph, wincrt;
	var
		gDrive, gMode: Smallint;

	procedure paintHause(x:integer; y:integer; color:longword);
	begin
		SetColor(color);
		moveTo(x,y);
		lineRel(20,-10);
		lineRel(20,10);
		lineRel(-40,0);
		lineRel(0,25);
		lineRel(40,0);
		lineRel(0,-25);
		SetColor($ffffff);
		moveRel(-20,25);//дверь
		lineRel(0,-20);
		lineRel(-10,0);
		lineRel(0,20);
		moveRel(5,-10);//ручка для двери
		lineRel(3,3);
		lineRel(0,-3);
		lineRel(-3,0);
		lineRel(0,3);
		lineRel(3,0);
		moverel(8,0);//window
		lineRel(8,0); //прямоугольное линиями
		lineRel(0,-8);
		lineRel(-8,0);
		lineRel(0,8);
	end;
begin
	gDrive:=noPalette;
	gMode:= m800x600;

	initgraph(gDrive, gMode, 'house');

	paintHause(40, 60, Indigo);
	paintHause(100, 80, Green);
	paintHause(200, 150, yellow);
	paintHause(300, 500, red);



	readkey();

	closegraph();
	
end.