program paintwatermelom;

uses
	wingraph,wincrt;

type
	TBerry = record
		TopSkinColor : longword;
		midSkinColor : longword;
		bottomSkinColor : longword;
		fleshColor : longword;
		SeedColor : longword;
		positionBerryX : Integer;
		positionBerryY : Integer;
		positionSeedX : Integer;
		positionSeedY:Integer; 
		TopSkinRadius: Integer;
		MidSkinRarius: Integer;
		botSkinRadius: Integer;
		fleshRadius : Integer;
		seedRadius: Integer;
	end;
var
	i: Integer;

procedure StartGraphics();
var
	gm,gd: smallInt;
begin
	gd := Nopalette;	
	gm := m800x600;
	InitGraph(gd,gm, '');
end;

procedure DrawWatermelom(parametr:Tberry);
begin
	//skin
	setfillstyle(SolidFill, parametr.TopSkinColor);
	setColor(parametr.TopSkinColor);
	pieSlice(parametr.positionBerryX, parametr.positionBerryY, 180, 360, parametr.TopSkinRadius);
	setfillstyle(SolidFill, parametr.midSkinColor);
	setColor(parametr.MidSkinRarius);
	pieSlice(parametr.positionBerryX, parametr.positionBerryY, 180, 360, parametr.MidSkinRarius);
	setfillstyle(SolidFill, parametr.bottomSkinColor);
	setColor(parametr.bottomSkinColor);
	pieSlice(parametr.positionBerryX, parametr.positionBerryY, 180, 360, parametr.botSkinRadius);
	setfillstyle(SolidFill, parametr.fleshColor);
	setColor(parametr.fleshColor);
	pieSlice(parametr.positionBerryX, parametr.positionBerryY, 180, 360, parametr.fleshRadius);
	setfillstyle(SolidFill, parametr.SeedColor);
	setColor(parametr.SeedColor);
	fillEllipse(parametr.positionBerryX-15,parametr.positionBerryY+5,parametr.seedRadius,parametr.seedRadius);
	fillEllipse(parametr.positionBerryX-7,parametr.positionBerryY+6,parametr.seedRadius,parametr.seedRadius);
	fillEllipse(parametr.positionBerryX+1,parametr.positionBerryY+3,parametr.seedRadius,parametr.seedRadius);
	fillEllipse(parametr.positionBerryX+9,parametr.positionBerryY+8,parametr.seedRadius,parametr.seedRadius);
	fillEllipse(parametr.positionBerryX+16,parametr.positionBerryY+4,parametr.seedRadius,parametr.seedRadius);
	fillEllipse(parametr.positionBerryX-18,parametr.positionBerryY+10,parametr.seedRadius,parametr.seedRadius);
	fillEllipse(parametr.positionBerryX-11,parametr.positionBerryY+12,parametr.seedRadius,parametr.seedRadius);
	fillEllipse(parametr.positionBerryX-5,parametr.positionBerryY+13,parametr.seedRadius,parametr.seedRadius);
	fillEllipse(parametr.positionBerryX,parametr.positionBerryY+15,parametr.seedRadius,parametr.seedRadius);
	fillEllipse(parametr.positionBerryX+10,parametr.positionBerryY+18,parametr.seedRadius,parametr.seedRadius);


end;

//	main procedure

var
	watermelom : Tberry;

begin

	StartGraphics();
	watermelom.TopSkinColor:=DarkOliveGreen;
	watermelom.midSkinColor:=OliveDrab;
	watermelom.bottomSkinColor:=YellowGreen;
	watermelom.fleshColor:=Monza;
	watermelom.SeedColor:=Russet;
	watermelom.positionBerryX:=200;
	watermelom.positionBerryY:=200;
	watermelom.positionSeedX:=210;
	watermelom.positionSeedY:=180;
	watermelom.TopSkinRadius:=30;
	watermelom.MidSkinRarius:=watermelom.TopSkinRadius - 
	round(watermelom.TopSkinRadius*0.07);
	watermelom.botSkinRadius:=watermelom.TopSkinRadius - 
	round(watermelom.TopSkinRadius*0.07);	
	watermelom.fleshRadius:=watermelom.botSkinRadius - round(watermelom.botSkinRadius*0.07);
	watermelom.seedRadius:=round(watermelom.TopSkinRadius*0.08);

	readkey();
	
	DrawWatermelom(watermelom);


	readkey();	
	CloseGraph();
end.