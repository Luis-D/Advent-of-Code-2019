#   Advent of Code 2019. Day 4, first part.
#   Luis Delgado.

input =[246540,787419]

counter=0;

for i in input[0]...input[1]+1 do
    condition = true;
    repeated = false;
    ii = i.digits.reverse
    for o in 1...6 do
	a = ii[o-1];
	b = ii[o];
	if (a > b) then condition = false; break; end
    	if(a==b) then repeated = true end
    end
    if(condition && repeated) then
	counter+=1;
    end
end

puts counter
