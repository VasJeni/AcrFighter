{
	Вывести на экран 10 разных случайных чисел (от 0 до 20 каждое)
}
program rando;
	var rn, i:Integer;

begin
	randomize;
	i:=0;
	while i<10 do 
	begin
		rn:=random(21);
		writeln(rn);
		inc(i);
	end
end.