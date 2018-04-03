{
*Задача 12.3 (12h3)*
Написать процедуру которая принимает один параметр и выводит на экран название месяца.
Если такого месяца нет - пишет "неизвестный"
}

program	month;
var
	nameMonth: string;
	mesac: Integer;

procedure Month(monthNumber:Longint);
begin
	case monthNumber of
		1: nameMonth:='January';
		2: nameMonth:='February';
		3: nameMonth:='March';
		4: nameMonth:='April';
		5: nameMonth:='May';
		6: nameMonth:='June';
		7: nameMonth:='July';
		8: nameMonth:='August';
		9: nameMonth:='September';
		10: nameMonth:='October';
		11: nameMonth:='November';
		12: nameMonth:='December';
	else	
		nameMonth:='Unknown';
	end;
end;

begin
	writeln('enter number of mounth');
	read(mesac);
	month(mesac);
	writeln(nameMonth);
end.