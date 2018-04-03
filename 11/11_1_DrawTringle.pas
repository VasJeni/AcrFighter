{Написать процедуру DrawTriangle() с двумя параметрами, которая рисует треугольник по заданным координатам
`procedure DrawTriangle(x: integer; y: integer)`
Затем с её помощью нарисовать 4 треугольника:
```DrawTriangle(50, 70);
DrawTriangle(520, 110);
DrawTriangle(360, 505);
DrawTriangle(170, 420);```}


program drawTriangle;
		
	uses
		wingraph, wincrt;
	var
		gDrive, gMode: Smallint;

		procedure DrawTriengle(x:Integer; y:Integer);
		begin
		moveTo(x,y);
		lineRel(30,30);
		lineRel(-30,0);
		lineTo(x,y);	
		end;
begin
	gDrive:=noPalette;
	gMode:= m800x600;

	initgraph(gDrive, gMode, 'Triangle');

	DrawTriengle(50,70);
	DrawTriengle(520,110);
	DrawTriengle(360,505);
	DrawTriengle(170,420);
	DrawTriengle(420,10);


	readkey();

	closegraph();
	
end.