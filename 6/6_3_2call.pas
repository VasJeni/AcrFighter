program call;

var
	answer: string;
	momCall : boolean;
	morning : boolean;
	sleep : boolean;

begin

	write('Is it morning? ');
	readln(answer);
	morning := (answer = 'y') or (answer = 'yes');

	write('Is mama calling? ');
	readln(answer);
	momCall := (answer = 'y') or (answer = 'yes');

	write('Are you sleep? ');
	readln(answer);
	sleep := (answer = 'y') or (answer = 'yes');

	if (not sleep and momCall) or ((not morning) and (not sleep)) then 
	begin
		write('redirect the call')
		
	end
	else 
	begin
		write ('do not redirect the call')
	end
end.
