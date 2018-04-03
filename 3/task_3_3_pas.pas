program area;
uses math;
 var 
	h,w,l,S,window,cem,quantity,sumCem,cemCost,totalCost:real;

  begin
 window := 1.5;
 cem:= 18;
 cemCost:=12.75;
 writeln('Enter height');
 readln(h);
 writeln('Enter width');
 readln(w);
 writeln('Enter long');
 readln(l);
 writeln('Enter quantity window');
 readln(quantity);
 S := h*w*2+h*l*2+l*w-window*quantity; //выщитываем площадь стен + потолок
 writeln('area= ', S:4:2);
 sumCem := (S+S*0.10)/cem; //выщитываем сколько понадобиться штукатурки с учётом дополнительных 10% 
 writeln('How many need bag of cement= ',ceil(sumCem));
totalCost := сeil(sumCem)*cemCost; //выщитываем ощую стоимость проекта
writeln('Project total cost', totalCost:10:2);
  readln;
  end.