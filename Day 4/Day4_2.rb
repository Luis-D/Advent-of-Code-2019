#   Advent of Code 2019. Day 4, second part.
#   Luis Delgado.

input =[246540,787419]

counter=0;

for i in input[0]...input[1]+1 do
    condition = true;
    repeated = false;
    repeating = 0;
    ii = i.digits.reverse
    ir = [0,0,0]
    ir_cur = 0;
    for o in 1...6 do
	a = ii[o-1];
	b = ii[o];
	if (a > b) then condition = false; break; end
    	if(a==b) then repeated = true;ir[ir_cur]+=1;
	else 
	    if(ir[ir_cur] != 0) then ;ir_cur+=1 end
	end
    end
    if(condition && repeated) then
	for u in 0..2 do
	    if(ir[u]>0) then ir[u]+=1;end
	end
	    
	print(ir," @",i,"\n")
	new_condition = false

	for u in 0..2 do
	    
	    if ir[u] == 2 then counter+=1;break; end
	end

    end
end

puts counter
