#   Advent of Code 2019. Day 1, second part.
#   Luis Delgado.

def function(val)
    val = (((val/3).floor())-2);
    result = 0
    while(val>0) do
	result = result+val;
	val = (((val/3).floor())-2);
    end

    return result 
end

arr = IO.readlines("Day1_Input.txt")

result = 0;
for i in 0...arr.length() do
    val = arr[i].to_i();
    result = result + function(val)
end

puts(result)

return result
