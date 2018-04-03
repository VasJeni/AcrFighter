{*Задача 11.4 (11h4) (нужна для следующего занятия!)*
Написать программу, которая рисует следующую картинку.
как это делать:}


program background;
		
	uses
		wingraph, wincrt;
	var
		gDrive, gMode: Smallint;

	procedure bush(x:integer; y:integer);
	begin
		setColor(DarkGreen);
		moveTo(x,y);
		lineRel(-20,-10);
		moveTo(x,y);
		lineRel(-5,-25);
		moveTo(x,y);
		lineRel(10,-15);
		moveTo(x,y);
		lineRel(15,-10);
	end;
	procedure apple(x:integer; y : integer);
	begin
		setColor(red);
		moveTo(x+6,y);
		lineRel(6,0);
		moveTo(x+5,y+1);
		lineRel(8,0);
		moveTo(x+4,y+1);
		lineRel(10,0);
		moveTo(x+3,y+2);
		lineRel(12,0);
		moveTo(x+2,y+3);
		lineRel(14,0);
		moveTo(x+1,y+4);
		lineRel(16,0);
		moveTo(x,y+5);
		lineRel(18,0);
		moveTo(x,y+6);
		lineRel(18,0);
		moveTo(x,y+7);
		lineRel(18,0);
		moveTo(x,y+8);
		lineRel(18,0);
		moveTo(x+1,y+9);
		lineRel(16,0);
		moveTo(x+2,y+10);
		lineRel(14,0);
		moveTo(x+3,y+11);
		lineRel(12,0);
		moveTo(x+4,y+12);
		lineRel(10,0);
		moveTo(x+5,y+13);
		lineRel(8,0);
		moveTo(x+6,y+14);
		lineRel(6,0);


	end;
begin
	gDrive:=noPalette;
	gMode:= m800x600;

	initgraph(gDrive, gMode, 'image');


	Setfillstyle(1,SkyBlue);				//рисуем небо
	Bar(0,0,800,195);


	Setfillstyle(1,LimeGreen);				//рисуем газон
	Bar(0,181,800,600);

	Setfillstyle(1,BitterLemon);			//солнце
	setColor(yellow);
	FillEllipse(50,50,35,35);

	Setfillstyle(1,GrayAsparagus);				//рисуем ножку гриба
	Bar(420,350,430,380);
	Setfillstyle(1,MediumVioletRed);
	setColor(MediumVioletRed);
	PieSlice(425,350,0,180,25);

	setFillStyle(1,Sepia);						//дерево
	setColor(5);
	Bar(550,180,580,350);						//ствол
	setFillStyle(1,Green);	
	setColor(Green);							//листва					
	FillEllipse(500,180,60,60);
	FillEllipse(600,180,70,70);
	FillEllipse(550,120,50,50);
	FillEllipse(550,240,50,50);
	apple(520,115);								//apple
	apple(460,145);
	apple(630,160);
	apple(480,175);
	apple(530,215);
	apple(570,245);
	apple(565,178);
	apple(505,193);
	apple(535,176);
	apple(525,148);

	setColor(blue);
	setFillStyle(1,blue);
	FillEllipse(580,520,200,50);								//озеро

	bush(50,370);		//кусты
	bush(70,320);
	bush(150,450);
	bush(20,500);
	bush(250,280);

	readkey();

	closegraph();
	
end.