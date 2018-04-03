{Написать процедуру DrawLadder() с тремя параметрами,
которая рисует лесенку из нижнего левого угла экрана. Размеры и количество ступенек передаётся в параметре.
`procedure DrawLadder(stepWidth: integer; stepHeight: integer; numberOfSteps: integer);`
Затем с её помощью нарисовать несколько лесенок:
```DrawLadder(12, 12, 7);
readkey();
DrawLadder(17, 24, 5);
readkey();
DrawLadder(30, 5, 12);
readkey();```}


program drawLadder;
		
	uses
		wingraph, wincrt;
	var
		gDrive, gMode: Smallint;

		procedure DrawLadder(stepWidth:integer; stepHeight:integer; numberOfSteps:integer);
		var i:integer;
		begin
			MoveRel(0,stepHeight);
			for i := 1 to numberOfSteps do
			begin
				lineRel(stepWidth,0);
				lineRel(0,stepHeight);
			end;
			moveTo(0, 0);
		end;
begin
	gDrive:=noPalette;
	gMode:= m800x600;

	initgraph(gDrive, gMode, 'DrawLadder');

	setColor(white);

	DrawLadder(25,25,10);

	readkey();

	DrawLadder(17,24,15);

	readkey();

	DrawLadder(30,5,12);

	readkey();

	closegraph();
	
end.